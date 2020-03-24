Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE29191673
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:31:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmQX-0003XL-Uq; Tue, 24 Mar 2020 16:29:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmQW-0003Ws-48
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:29:16 +0000
X-Inumbo-ID: 99e3203a-6dec-11ea-8476-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99e3203a-6dec-11ea-8476-12813bfff9fa;
 Tue, 24 Mar 2020 16:29:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86765ABF4;
 Tue, 24 Mar 2020 16:29:14 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <78b62646-6fd4-e5b3-bc09-783bb017eaaa@suse.com>
Date: Tue, 24 Mar 2020 17:29:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 7/7] x86emul: support SYSRET
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is to augment SYSCALL, which has been supported for quite some
time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5975,6 +5975,60 @@ x86_emulate(
             goto done;
         break;
 
+    case X86EMUL_OPC(0x0f, 0x07): /* sysret */
+        vcpu_must_have(syscall);
+        /* Inject #UD if syscall/sysret are disabled. */
+        fail_if(!ops->read_msr);
+        if ( (rc = ops->read_msr(MSR_EFER, &msr_val, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        generate_exception_if((msr_val & EFER_SCE) == 0, EXC_UD);
+        generate_exception_if(!amd_like(ctxt) && !mode_64bit(), EXC_UD);
+        generate_exception_if(!mode_ring0(), EXC_GP, 0);
+        generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
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
+#ifdef __x86_64__
+        if ( mode_64bit() )
+        {
+            if ( op_bytes == 8 )
+            {
+                cs.attr = 0xafb; /* L+DB+P+DPL3+S+Code */
+                generate_exception_if(!is_canonical_address(_regs.rcx) &&
+                                      !amd_like(ctxt), EXC_GP, 0);
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
+             (!amd_like(ctxt) &&
+              (rc = ops->write_segment(x86_seg_ss, &sreg,
+                                       ctxt)) != X86EMUL_OKAY) )
+            goto done;
+
+        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        break;
+
     case X86EMUL_OPC(0x0f, 0x08): /* invd */
     case X86EMUL_OPC(0x0f, 0x09): /* wbinvd / wbnoinvd */
         generate_exception_if(!mode_ring0(), EXC_GP, 0);


