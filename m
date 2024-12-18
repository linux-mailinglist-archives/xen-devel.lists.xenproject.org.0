Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D09F6BFC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 18:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860689.1272687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxX9-0004OG-01; Wed, 18 Dec 2024 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860689.1272687; Wed, 18 Dec 2024 17:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNxX8-0004Ll-Ta; Wed, 18 Dec 2024 17:08:26 +0000
Received: by outflank-mailman (input) for mailman id 860689;
 Wed, 18 Dec 2024 17:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNxX7-0004Lf-RF
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 17:08:25 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b02cdd37-bd62-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 18:08:23 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so754187f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 09:08:23 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801acfdsm14382447f8f.57.2024.12.18.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 09:08:21 -0800 (PST)
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
X-Inumbo-ID: b02cdd37-bd62-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734541702; x=1735146502; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgYydg0CiacPidmMRJwjDtf5BUWwdAGRWZBI6A2JkQY=;
        b=POncgYuUZDm43T2zDKSNuBEwJKpObthj6vqmduSZwsF6ZWjczoJK32BOl7uq4NiUzY
         8BiItpN1eQHerP32LLni+0lRFS1G4xVxnoSXv8ScR80MBFpfhnvc/jI2n6ScQJmo1kIu
         gES6erbhZbT7DaidiP8T5MFrvfG9lu7i7I+Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541702; x=1735146502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYydg0CiacPidmMRJwjDtf5BUWwdAGRWZBI6A2JkQY=;
        b=JzeA3YAGX8kZsBUfepL1o9OdEWH5dXq49MIZOkQvXctyoPxoO8yqTvyV6ODBl170ES
         P8OQzkVko3yMygjz07kYChKJbXdatxdapVpyN/KlCj3uWsgenP+1I1YV+oSLycx0g92Y
         1SVokUVhQ1CxdZGMOTbB2AUaFGWBah+TisYX8cyBhdE+uG089ZSJr1DdQpuUiOLsRyo0
         V2QOsxK+Ro1wQjJv31g1JuDm2ysfc7U1oEj5H+HF1ZdhWB7tv/+FgvMAIOa4NdFDsjQI
         WLZx+cYobHaUwubW1PIrt3vHfhJEQB491XCS3ewE5HNd3VtlLCaA4iDcMHY8JXRs6jeU
         HFvQ==
X-Gm-Message-State: AOJu0YwN9LSbIWxkCv/CalwRBx2/hGabHLg7+dWaVhEmUchfrUMQfbnQ
	Yc3nXJMZNub9dWOzorn9h1d0O/j3K7yvCjBq3/Kqd4IYQsoHUhM9qH/UW1fxIWz+SzmlDGx/R8I
	wokc=
X-Gm-Gg: ASbGnct2iDynoI2vOZM1cmL83qHJv1l1yqhIUNYY2R+w/zCPZ/547ctB++SfWK9VQ8j
	NvGu9Nfc1ARkDJPhJrAfHYua8A1eLzeatGItWFR9Au6MNuOtn8DVV8TMY8goSKzfzI2gwWwArUR
	GxYt6EBn3N3bPZ6da35/yvPLZwZK81+Nt32ieb+B0OI74KT5M3WA/4UQg568Ca9sLaX/oeWvft3
	ByXrS+ETomhyg2PR20Vveck0C6eCyUjp5VDhcIDiWpS5rVJPniDqK8ZGRm46m/xEj7MtElW/FsB
	F4V0rKiWwsapSkRaGMX0IjwQa4IyU5ZvYV+n
X-Google-Smtp-Source: AGHT+IEOsO6sV4MCY1Ac0WcFKaK+QhC44j8GWAIx8Y6sctbW9PkbKp23aIB6KVS5mQOgDmqcT3rPfQ==
X-Received: by 2002:a05:6000:2cc:b0:386:32ca:7b5e with SMTP id ffacd0b85a97d-38a1a2152c6mr78407f8f.16.1734541702198;
        Wed, 18 Dec 2024 09:08:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86/hvm: Use constants for x86 modes
Date: Wed, 18 Dec 2024 17:08:20 +0000
Message-Id: <20241218170820.364253-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teddy Astie <teddy.astie@vates.tech>

In many places of x86 HVM code, constants integer are used to indicate in what mode is
running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these constants are
are written directly as integer which hides the actual meaning of these modes.

This patch introduces X86_MODE_* macros and replace those occurences with it.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

v3:
 * Leave a comment behind explaining why these aren't all modes
 * Fix long lines
 * Convert more instances (svm_guest_x86_mode, hvm_latch_shinfo_size, xenoprof)
---
 xen/arch/x86/hvm/emulate.c           | 18 ++++++++++--------
 xen/arch/x86/hvm/hvm.c               |  4 +++-
 xen/arch/x86/hvm/hypercall.c         | 17 +++++++++--------
 xen/arch/x86/hvm/svm/svm.c           |  8 ++++----
 xen/arch/x86/hvm/viridian/viridian.c |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c           |  9 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c          |  5 +++--
 xen/arch/x86/include/asm/hvm/hvm.h   | 14 ++++++++++++++
 xen/arch/x86/oprofile/xenoprof.c     |  6 +++---
 9 files changed, 55 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index d3006f094a69..76467b76c047 100644
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
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74e58c653e6f..922c9b3af64d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3974,7 +3974,9 @@ static void hvm_latch_shinfo_size(struct domain *d)
      */
     if ( current->domain == d )
     {
-        d->arch.has_32bit_shinfo = (hvm_guest_x86_mode(current) != 8);
+        d->arch.has_32bit_shinfo =
+            hvm_guest_x86_mode(current) != X86_MODE_64BIT;
+
         /*
          * Make sure that the timebase in the shared info structure is correct.
          *
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 81883c8d4f60..6f8dfdff4ac6 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -112,23 +112,24 @@ int hvm_hypercall(struct cpu_user_regs *regs)
 
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
-            eax == __HYPERVISOR_hvm_op &&
-            (mode == 8 ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
+             eax == __HYPERVISOR_hvm_op &&
+             (mode == X86_MODE_64BIT ? regs->rdi : regs->ebx) ==
+             HVMOP_guest_request_vm_event )
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
 
@@ -198,7 +199,7 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
 {
     struct vcpu *curr = current;
 
-    if ( hvm_guest_x86_mode(curr) == 8 )
+    if ( hvm_guest_x86_mode(curr) == X86_MODE_64BIT )
     {
         struct multicall_entry *call = &state->call;
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b8f87aa1ed08..62905c2c7acd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -571,12 +571,12 @@ static int cf_check svm_guest_x86_mode(struct vcpu *v)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
-        return 0;
+        return X86_MODE_REAL;
     if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
-        return 1;
+        return X86_MODE_VM86;
     if ( hvm_long_mode_active(v) && likely(vmcb->cs.l) )
-        return 8;
-    return likely(vmcb->cs.db) ? 4 : 2;
+        return X86_MODE_64BIT;
+    return vmcb->cs.db ? X86_MODE_32BIT : X86_MODE_16BIT;
 }
 
 static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 21480d9ee700..33d54e587edf 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -933,13 +933,13 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 
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
@@ -1038,11 +1038,11 @@ int viridian_hypercall(struct cpu_user_regs *regs)
 
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
index b6885d0e2764..eee1d4b47a13 100644
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
index 78135ca23be8..cf47d61b1473 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -411,7 +411,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs,
     }
     else
     {
-        bool mode_64bit = (vmx_guest_x86_mode(v) == 8);
+        bool mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
 
         decode->type = VMX_INST_MEMREG_TYPE_MEMORY;
 
@@ -2073,7 +2073,8 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason)
 
     if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
          !nestedhvm_enabled(curr->domain) ||
-         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2)) ||
+         (vmx_guest_x86_mode(curr) <
+          (hvm_long_mode_active(curr) ? X86_MODE_64BIT : X86_MODE_16BIT)) ||
          (exit_reason != EXIT_REASON_VMXON && !nvmx_vcpu_in_vmx(curr)) )
     {
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 02de18c7d4a8..124906a548da 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -26,6 +26,20 @@ extern bool opt_hvm_fep;
 #define opt_hvm_fep 0
 #endif
 
+/*
+ * Results for hvm_guest_x86_mode().
+ *
+ * Note, some callers depend on the order of these constants.
+ *
+ * TODO: Rework this helper to avoid implying mixing the architectural
+ * concepts of mode and operand size.
+ */
+#define X86_MODE_REAL  0
+#define X86_MODE_VM86  1
+#define X86_MODE_16BIT 2
+#define X86_MODE_32BIT 4
+#define X86_MODE_64BIT 8
+
 /* Interrupt acknowledgement sources. */
 enum hvm_intsrc {
     hvm_intsrc_none,
diff --git a/xen/arch/x86/oprofile/xenoprof.c b/xen/arch/x86/oprofile/xenoprof.c
index 247a0deca822..7f2525bfb4d6 100644
--- a/xen/arch/x86/oprofile/xenoprof.c
+++ b/xen/arch/x86/oprofile/xenoprof.c
@@ -86,11 +86,11 @@ int xenoprofile_get_mode(struct vcpu *curr, const struct cpu_user_regs *regs)
 
     switch ( hvm_guest_x86_mode(curr) )
     {
-    case 0: /* real mode */
+    case X86_MODE_REAL:
         return 1;
-    case 1: /* vm86 mode */
+    case X86_MODE_VM86:
         return 0;
-    default:
+    default: /* 16BIT | 32BIT | 64BIT */
         return hvm_get_cpl(curr) != 3;
     }
 }

base-commit: 826a9eb072d449cb777d71f52923e6f5f20cefbe
-- 
2.39.5


