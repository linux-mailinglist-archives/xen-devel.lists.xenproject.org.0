Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1626199A9F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 18:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJJHs-0007PE-D5; Tue, 31 Mar 2020 15:58:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJJHr-0007P2-0v
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:58:47 +0000
X-Inumbo-ID: 808d0642-7368-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 808d0642-7368-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 15:58:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 978FCACB1;
 Tue, 31 Mar 2020 15:58:45 +0000 (UTC)
Subject: [PATCH v2 2/2] x86emul: support SYSRET
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
Message-ID: <86b9d307-4f08-463b-255a-ed84b67e2076@suse.com>
Date: Tue, 31 Mar 2020 17:58:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e4b15b26-4492-efb0-c19a-288c0fd65ba9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is to augment SYSCALL, which we've been supporting for quite some
time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace CPUID bit check by comment. Limit RCX based canonical check
    to just Intel as vendor. Update SS selector on AMD and alike.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5977,6 +5977,82 @@ x86_emulate(
             goto done;
         break;
 
+    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
+        /*
+         * Inject #UD if syscall/sysret are disabled. EFER.SCE can't be set
+         * with the respective CPUID bit clear, so no need for an explicit
+         * check of that one.
+         */
+        fail_if(!ops->read_msr);
+        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        generate_exception_if(!(msr_val & EFER_SCE), EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
+        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
+#ifdef __x86_64__
+        /*
+         * Doing this for just Intel (rather than e.g. !amd_like()) as this is
+         * in fact risking to make guest OSes vulnerable to the equivalent of
+         * XSA-7 (CVE-2012-0217).
+         */
+        generate_exception_if(ctxt->cpuid->x86_vendor == X86_VENDOR_INTEL &&
+                              op_bytes == 8 && !is_canonical_address(_regs.rcx),
+                              EXC_GP, 0);
+#endif
+
+        if ( (rc = ops->read_msr(MSR_STAR, &msr_val, ctxt)) != X86EMUL_OKAY )
+            goto done;
+
+        sreg.sel = ((msr_val >> 48) + 8) | 3; /* SELECTOR_RPL_MASK */
+        cs.sel = op_bytes == 8 ? sreg.sel + 8 : sreg.sel - 8;
+
+        cs.base = sreg.base = 0; /* flat segment */
+        cs.limit = sreg.limit = ~0u; /* 4GB limit */
+        cs.attr = 0xcfb; /* G+DB+P+DPL3+S+Code */
+        sreg.attr = 0xcf3; /* G+DB+P+DPL3+S+Data */
+
+        /* Only the selector part of SS gets updated by AMD and alike. */
+        if ( amd_like(ctxt) )
+        {
+            fail_if(!ops->read_segment);
+            if ( (rc = ops->read_segment(x86_seg_ss, &sreg,
+                                         ctxt)) != X86EMUL_OKAY )
+                goto done;
+
+            /* There's explicitly no RPL adjustment here. */
+            sreg.sel = (msr_val >> 48) + 8;
+        }
+
+#ifdef __x86_64__
+        if ( mode_64bit() )
+        {
+            if ( op_bytes == 8 )
+            {
+                cs.attr = 0xafb; /* L+DB+P+DPL3+S+Code */
+                _regs.rip = _regs.rcx;
+            }
+            else
+                _regs.rip = _regs.ecx;
+
+            _regs.eflags = _regs.r11 & ~(X86_EFLAGS_RF | X86_EFLAGS_VM);
+        }
+        else
+#endif
+        {
+            _regs.r(ip) = _regs.ecx;
+            _regs.eflags |= X86_EFLAGS_IF;
+        }
+
+        fail_if(!ops->write_segment);
+        if ( (rc = ops->write_segment(x86_seg_cs, &cs, ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->write_segment(x86_seg_ss, &sreg,
+                                      ctxt)) != X86EMUL_OKAY )
+            goto done;
+
+        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        break;
+
     case X86EMUL_OPC(0x0f, 0x08): /* invd */
     case X86EMUL_OPC(0x0f, 0x09): /* wbinvd / wbnoinvd */
         generate_exception_if(!mode_ring0(), EXC_GP, 0);


