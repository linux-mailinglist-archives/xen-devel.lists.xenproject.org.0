Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63169B7BA6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 14:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828689.1243670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VD7-0000qN-AP; Thu, 31 Oct 2024 13:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828689.1243670; Thu, 31 Oct 2024 13:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6VD7-0000nP-7r; Thu, 31 Oct 2024 13:27:37 +0000
Received: by outflank-mailman (input) for mailman id 828689;
 Thu, 31 Oct 2024 13:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WFF=R3=bounce.vates.tech=bounce-md_30504962.672385c1.v1-fc8f500813b641e78d4a28924803cef7@srs-se1.protection.inumbo.net>)
 id 1t6VD5-0000nJ-Up
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 13:27:35 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e03c15-978b-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 14:27:30 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4XfPtT0wYPzBsVxXD
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 13:27:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fc8f500813b641e78d4a28924803cef7; Thu, 31 Oct 2024 13:27:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e0e03c15-978b-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzMy4xIiwiaGVsbyI6Im1haWwxMzMtMS5hdGwxMzEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUwZTAzYzE1LTk3OGItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzgxMjUxLjE4MjM4OSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjM4NWMxLnYxLWZjOGY1MDA4MTNiNjQxZTc4ZDRhMjg5MjQ4MDNjZWY3QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730381249; x=1730641749;
	bh=3WoDEAuSo8T4/6RaJ2IOg/766Bng7fAW5f6keDMPO14=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=PS914ClSibG3/XmWmCowywVNj+R/3YZwArsr24rQs4Yrc5P0/DxQmXWsAVDNZEl1F
	 RV7gEY0T+RBqpChUT0uJM0vXnNtIvXPO2Jh0zQCYJ/rknIVqnFCvCvy+3VMvGColVY
	 N5O+4qIo1Kr9Lms1LcqfrXTC8htjE3DCs2qD06bKqtJiJTTFJo+oNdCbmUMSIFWphW
	 iZyx570EJC9IGMkX6ifk26tIr/y9yD2YJxX71IPG1KX10BkyVkU1FMbJ0TTm7rCVLK
	 QypbuVK/eFZCbvSR65p7MV+8TOQikY8UdR8/M1oXnUcT8g7E5dmyE3kdby/2TVbIEZ
	 ztjlFT6pboYrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730381249; x=1730641749; i=teddy.astie@vates.tech;
	bh=3WoDEAuSo8T4/6RaJ2IOg/766Bng7fAW5f6keDMPO14=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=0iP56Bv8YZtw6zHzXic8bIiAo7mJnm5Z41yuL0DJxesxC6x6JpeQlRN231zhxtYi4
	 YRe7MXO4xXSS+sOBEwvfFPfnX3tiFvWGSjX197vu2geLnUIqIe05nMVKNU+Jx47NUl
	 uGwx8DuPSCruBjnvQasp+EH3Q+Z1PXRJ8ZEVQUNbow7XfNcjqp75wZjFXoGl0y2IvH
	 1oTbdAH1xZwaluHjVh6Vp4RTCbe270iW8UQxZ8w83Egb2JXLpecY8sompD4wdrKg1Q
	 Rf/BXhj8cSDjecHPJDp8IJWy1WMSf4ksWFYcGIO/cERTkbFDKD4JnrI5/3O+GG0Ln6
	 NlIYUTLGGggQg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20x86/hvm:=20Use=20constants=20for=20x86=20modes?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730381248095
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Paul Durrant" <paul@xen.org>
Message-Id: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fc8f500813b641e78d4a28924803cef7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241031:md
Date: Thu, 31 Oct 2024 13:27:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In many places of x86 HVM code, constants integer are used to indicate in what mode is
running the CPU (real, v86, 16-bits, 32-bits, 64-bits). However, these constants are
are written directly as integer which hides the actual meaning of these modes.

This patch introduces X86_MODE_* macros and replace those occurences with it.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
I am not sure of other places that uses these integer constants.
---
 xen/arch/x86/hvm/emulate.c           | 16 ++++++++--------
 xen/arch/x86/hvm/hypercall.c         | 13 +++++++------
 xen/arch/x86/hvm/viridian/viridian.c |  9 +++++----
 xen/arch/x86/hvm/vmx/vmx.c           |  9 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c          |  5 +++--
 xen/arch/x86/include/asm/hvm/hvm.h   |  6 ++++++
 6 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index ecf83795fa..60a7c15bdc 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2433,14 +2433,14 @@ static void cf_check hvmemul_put_fpu(

         switch ( mode )
         {
-        case 8:
+        case X86_MODE_64BIT:
             fpu_ctxt->fip.addr = aux->ip;
             if ( dval )
                 fpu_ctxt->fdp.addr = aux->dp;
             fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] = 8;
             break;

-        case 4: case 2:
+        case X86_MODE_32BIT: case X86_MODE_16BIT:
             fpu_ctxt->fip.offs = aux->ip;
             fpu_ctxt->fip.sel  = aux->cs;
             if ( dval )
@@ -2451,7 +2451,7 @@ static void cf_check hvmemul_put_fpu(
             fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] = mode;
             break;

-        case 0: case 1:
+        case X86_MODE_REAL: case X86_MODE_V86:
             fpu_ctxt->fip.addr = aux->ip | (aux->cs << 4);
             if ( dval )
                 fpu_ctxt->fdp.addr = aux->dp | (aux->ds << 4);
@@ -2952,11 +2952,11 @@ static const char *guest_x86_mode_to_str(int mode)
 {
     switch ( mode )
     {
-    case 0:  return "Real";
-    case 1:  return "v86";
-    case 2:  return "16bit";
-    case 4:  return "32bit";
-    case 8:  return "64bit";
+    case X86_MODE_REAL:  return "Real";
+    case X86_MODE_V86:  return "v86";
+    case X86_MODE_16BIT:  return "16bit";
+    case X86_MODE_32BIT:  return "32bit";
+    case X86_MODE_64BIT:  return "64bit";
     default: return "Unknown";
     }
 }
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 81883c8d4f..e0e9bcd22d 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -11,6 +11,7 @@
 #include <xen/ioreq.h>
 #include <xen/nospec.h>

+#include <asm/hvm/hvm.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/viridian.h>
@@ -112,23 +113,23 @@ int hvm_hypercall(struct cpu_user_regs *regs)

     switch ( mode )
     {
-    case 8:
+    case X86_MODE_64BIT:
         eax = regs->rax;
         fallthrough;
-    case 4:
-    case 2:
+    case X86_MODE_32BIT:
+    case X86_MODE_16BIT:
         if ( currd->arch.monitor.guest_request_userspace_enabled &&
             eax == __HYPERVISOR_hvm_op &&
-            (mode == 8 ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
+            (mode == X86_MODE_64BIT ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
             break;

         if ( likely(!hvm_get_cpl(curr)) )
             break;
         fallthrough;
-    default:
+    case X86_MODE_V86:
         regs->rax = -EPERM;
         return HVM_HCALL_completed;
-    case 0:
+    case X86_MODE_REAL:
         break;
     }

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 21480d9ee7..0e3b824bf0 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -16,6 +16,7 @@
 #include <asm/paging.h>
 #include <asm/p2m.h>
 #include <asm/apic.h>
+#include <asm/hvm/hvm.h>
 #include <public/sched.h>
 #include <public/hvm/hvm_op.h>

@@ -933,13 +934,13 @@ int viridian_hypercall(struct cpu_user_regs *regs)

     switch ( mode )
     {
-    case 8:
+    case X86_MODE_64BIT:
         input.raw = regs->rcx;
         input_params_gpa = regs->rdx;
         output_params_gpa = regs->r8;
         break;

-    case 4:
+    case X86_MODE_32BIT:
         input.raw = (regs->rdx << 32) | regs->eax;
         input_params_gpa = (regs->rbx << 32) | regs->ecx;
         output_params_gpa = (regs->rdi << 32) | regs->esi;
@@ -1038,11 +1039,11 @@ int viridian_hypercall(struct cpu_user_regs *regs)

     switch ( mode )
     {
-    case 8:
+    case X86_MODE_64BIT:
         regs->rax = output.raw;
         break;

-    case 4:
+    case X86_MODE_32BIT:
         regs->rdx = output.raw >> 32;
         regs->rax = (uint32_t)output.raw;
         break;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 12f8a66458..b77f135a2d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -886,14 +886,15 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
     unsigned long cs_ar_bytes;

     if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
-        return 0;
+        return X86_MODE_REAL;
     if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
-        return 1;
+        return X86_MODE_V86;
     __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
     if ( hvm_long_mode_active(v) &&
          likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
-        return 8;
-    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE) ? 4 : 2);
+        return X86_MODE_64BIT;
+    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE)
+            ? X86_MODE_32BIT : X86_MODE_16BIT);
 }

 static void vmx_save_dr(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index c05e0e9326..5032fc3a45 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -411,7 +411,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     }
     else
     {
-        bool mode_64bit = (vmx_guest_x86_mode(v) == 8);
+        bool mode_64bit = (vmx_guest_x86_mode(v) == X86_MODE_64BIT);

         decode->type = VMX_INST_MEMREG_TYPE_MEMORY;

@@ -2073,7 +2073,8 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason)

     if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
          !nestedhvm_enabled(curr->domain) ||
-         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2)) ||
+         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? X86_MODE_64BIT
+                                                                 : X86_MODE_16BIT)) ||
          (exit_reason != EXIT_REASON_VMXON && !nvmx_vcpu_in_vmx(curr)) )
     {
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index dd7d4872b5..29ae23617e 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
 #define opt_hvm_fep 0
 #endif

+#define X86_MODE_REAL  0
+#define X86_MODE_V86   1
+#define X86_MODE_16BIT 2
+#define X86_MODE_32BIT 4
+#define X86_MODE_64BIT 8
+
 /* Interrupt acknowledgement sources. */
 enum hvm_intsrc {
     hvm_intsrc_none,
--
2.45.2



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

