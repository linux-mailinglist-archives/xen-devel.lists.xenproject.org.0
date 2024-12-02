Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C009DFDB0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846466.1261641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI33S-00018b-Bx; Mon, 02 Dec 2024 09:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846466.1261641; Mon, 02 Dec 2024 09:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI33S-00015x-8a; Mon, 02 Dec 2024 09:49:22 +0000
Received: by outflank-mailman (input) for mailman id 846466;
 Mon, 02 Dec 2024 09:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jsF=S3=bounce.vates.tech=bounce-md_30504962.674d829a.v1-5b8a2aa0c92547d784c63cf2f1c94b70@srs-se1.protection.inumbo.net>)
 id 1tI33R-00015h-PL
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:49:21 +0000
Received: from mail180-27.suw31.mandrillapp.com
 (mail180-27.suw31.mandrillapp.com [198.2.180.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b156f50c-b092-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 10:49:16 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-27.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y1zWt2mcPz6CQWq6
 for <xen-devel@lists.xenproject.org>; Mon,  2 Dec 2024 09:49:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5b8a2aa0c92547d784c63cf2f1c94b70; Mon, 02 Dec 2024 09:49:14 +0000
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
X-Inumbo-ID: b156f50c-b092-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC4yNyIsImhlbG8iOiJtYWlsMTgwLTI3LnN1dzMxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIxNTZmNTBjLWIwOTItMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTMyOTU2Ljk0MDc1MSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NGQ4MjlhLnYxLTViOGEyYWEwYzkyNTQ3ZDc4NGM2M2NmMmYxYzk0YjcwQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733132954; x=1733393454;
	bh=ucqGhHnOiz/ZBpgQgGjtVLuUnH2uZLJRFuH6QWW+l5E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=mRd1V+VnH1rD/XqyLLcip/Fp0fCzZRVKQP3MJHQFOHVo1xrtQWR9mHUelwO+3ji+W
	 CyB+5JYno3x7W/gyXSSKAtweTcD8cKbfg+85GSpprAEx4coalBi8P/KHl9LkdVf0JZ
	 ptaO5wZC2Psvu0S3uEzCPApX/H+23jbUtW96cM5+JC4A7VNf1DpwCrW1YnJzVxMyhV
	 BsQLabd+AN4CeW55pldKWnkDyzNRZWAGUVF+khv7qabXPlkRQUtazSrJmV6vvGg4g3
	 PSPoPPTX+3hmI9y5Z5iIyr3RWVkQE3eiL2qQfiIJQRoJmTeZuRa0rLUH7SW5JA7zF9
	 /A/Vlg55IyVZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733132954; x=1733393454; i=teddy.astie@vates.tech;
	bh=ucqGhHnOiz/ZBpgQgGjtVLuUnH2uZLJRFuH6QWW+l5E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=A8l/Q1xeAZk2B3wRWBBLp8UAeUsxSg1H6y66f2qvSqlJFuX8Z3n57kFybm4b9yUJ7
	 3bckRJJB5t0EkeeA07lPkOQTpdvG4YdzPGVv3YU+nMBEpalMQM0jhjN+O0TgaBsAma
	 Jr4EdxR+89XmigYbpztNouGfEhwEsYrcgr2tzR4HPjusKpuxo/bEDx6PXG8WuOVoeu
	 uMXyS4jTesJnT+bQS9THG+tQ6YUMiZcliRFCCRte+NGY1gecoDKoCWw3Vz0wXlXJ07
	 SuLJ029IJdGlolZ46Tts0iqxycIxr1tpHhnZwppm5Si5c7JPtbaVVcIaZmNkGkDXZc
	 8Hfdy4vG09cfA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2]=20x86/hvm:=20Use=20constants=20for=20x86=20modes?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733132953401
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Paul Durrant" <paul@xen.org>
Message-Id: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5b8a2aa0c92547d784c63cf2f1c94b70?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241202:md
Date: Mon, 02 Dec 2024 09:49:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In many places of x86 HVM code, constants integer are used to indicate in what mode is
running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these constants are
are written directly as integer which hides the actual meaning of these modes.

This patch introduces X86_MODE_* macros and replace those occurences with it.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
v2:
Formatting changes (alignment, ...)
Renamed v86 to vm86. (Jan)
---
 xen/arch/x86/hvm/emulate.c           | 18 ++++++++++--------
 xen/arch/x86/hvm/hypercall.c         | 13 +++++++------
 xen/arch/x86/hvm/viridian/viridian.c |  9 +++++----
 xen/arch/x86/hvm/vmx/vmx.c           |  9 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c          |  5 +++--
 xen/arch/x86/include/asm/hvm/hvm.h   |  6 ++++++
 6 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f2bc6967df..9721fd8d4d 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2433,14 +2433,15 @@ static void cf_check hvmemul_put_fpu(
 
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
+        case X86_MODE_32BIT:
+        case X86_MODE_16BIT:
             fpu_ctxt->fip.offs = aux->ip;
             fpu_ctxt->fip.sel  = aux->cs;
             if ( dval )
@@ -2451,7 +2452,8 @@ static void cf_check hvmemul_put_fpu(
             fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] = mode;
             break;
 
-        case 0: case 1:
+        case X86_MODE_REAL:
+        case X86_MODE_VM86:
             fpu_ctxt->fip.addr = aux->ip | (aux->cs << 4);
             if ( dval )
                 fpu_ctxt->fdp.addr = aux->dp | (aux->ds << 4);
@@ -2952,11 +2954,11 @@ static const char *guest_x86_mode_to_str(int mode)
 {
     switch ( mode )
     {
-    case 0:  return "Real";
-    case 1:  return "v86";
-    case 2:  return "16bit";
-    case 4:  return "32bit";
-    case 8:  return "64bit";
+    case X86_MODE_REAL:   return "Real";
+    case X86_MODE_VM86:   return "v86";
+    case X86_MODE_16BIT:  return "16bit";
+    case X86_MODE_32BIT:  return "32bit";
+    case X86_MODE_64BIT:  return "64bit";
     default: return "Unknown";
     }
 }
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 81883c8d4f..dd5b017fd1 100644
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
+    case X86_MODE_VM86:
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
index b6885d0e27..eee1d4b47a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -886,14 +886,15 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
     unsigned long cs_ar_bytes;
 
     if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
-        return 0;
+        return X86_MODE_REAL;
     if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
-        return 1;
+        return X86_MODE_VM86;
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
index 78135ca23b..c267b101d1 100644
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
index 02de18c7d4..dbc37e8b75 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
 #define opt_hvm_fep 0
 #endif
 
+#define X86_MODE_REAL  0
+#define X86_MODE_VM86  1
+#define X86_MODE_16BIT 2
+#define X86_MODE_32BIT 4
+#define X86_MODE_64BIT 8
+
 /* Interrupt acknowledgement sources. */
 enum hvm_intsrc {
     hvm_intsrc_none,
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

