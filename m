Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17778191670
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:30:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmPe-0003NC-As; Tue, 24 Mar 2020 16:28:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmPc-0003My-UJ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:28:20 +0000
X-Inumbo-ID: 79192958-6dec-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79192958-6dec-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 16:28:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A829AABF4;
 Tue, 24 Mar 2020 16:28:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <8cf000a6-a8ac-22b6-422d-c11dc8b6454a@suse.com>
Date: Tue, 24 Mar 2020 17:28:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 5/7] x86emul: vendor specific SYSENTER/SYSEXIT
 behavior in long mode
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

Intel CPUs permit both insns there while AMD ones don't.

While at it also
- drop the ring 0 check from SYSENTER handling - neither Intel's nor
  AMD's insn pages have any indication of #GP(0) getting raised when
  executed from ring 0, and trying it out in practice also confirms
  the check shouldn't be there,
- move SYSENTER segment register writing until after the (in principle
  able to fail) MSR reads.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6588,7 +6588,7 @@ x86_emulate(
 
     case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
         vcpu_must_have(sep);
-        generate_exception_if(mode_ring0(), EXC_GP, 0);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
         generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
 
         fail_if(ops->read_msr == NULL);
@@ -6611,11 +6611,6 @@ x86_emulate(
         sreg.limit = ~0u;  /* 4GB limit */
         sreg.attr = 0xc93; /* G+DB+P+S+Data */
 
-        fail_if(ops->write_segment == NULL);
-        if ( (rc = ops->write_segment(x86_seg_cs, &cs, ctxt)) != 0 ||
-             (rc = ops->write_segment(x86_seg_ss, &sreg, ctxt)) != 0 )
-            goto done;
-
         if ( (rc = ops->read_msr(MSR_IA32_SYSENTER_EIP,
                                  &msr_val, ctxt)) != X86EMUL_OKAY )
             goto done;
@@ -6626,11 +6621,19 @@ x86_emulate(
             goto done;
         _regs.r(sp) = ctxt->lma ? msr_val : (uint32_t)msr_val;
 
+        fail_if(!ops->write_segment);
+        if ( (rc = ops->write_segment(x86_seg_cs, &cs,
+                                      ctxt)) != X86EMUL_OKAY ||
+             (rc = ops->write_segment(x86_seg_ss, &sreg,
+                                      ctxt)) != X86EMUL_OKAY )
+            goto done;
+
         singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
     case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
         vcpu_must_have(sep);
+        generate_exception_if(amd_like(ctxt) && ctxt->lma, EXC_UD);
         generate_exception_if(!mode_ring0(), EXC_GP, 0);
         generate_exception_if(!in_protmode(ctxt, ops), EXC_GP, 0);
 

