Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3976A3BE0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 08:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502219.773931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNd-0001Xh-3V; Mon, 27 Feb 2023 07:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502219.773931; Mon, 27 Feb 2023 07:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWYNc-0001V3-VX; Mon, 27 Feb 2023 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 502219;
 Mon, 27 Feb 2023 07:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRQf=6X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pWYNb-0000zz-8w
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 07:57:03 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51caa822-b674-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 08:57:02 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id h16so21938235edz.10
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 23:57:02 -0800 (PST)
Received: from uni.router.wind (adsl-209.109.242.226.tellas.gr.
 [109.242.226.209]) by smtp.googlemail.com with ESMTPSA id
 b23-20020a50ccd7000000b0049ef70a2894sm2788272edj.38.2023.02.26.23.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 23:57:01 -0800 (PST)
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
X-Inumbo-ID: 51caa822-b674-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/HLnBgL78z3g+xd6PxPHvHY0SFIgTSI0bcDcphjSqs=;
        b=J7ipBAzCwMCWW6J14s4QbKNAkMUrWhe1/KfqjxlYg+addcysszeDILiWeMKEVAT4lQ
         wwdZsvddtwkXNeiMDFTQG4Zs2DeSrS/+rFEIdonM68g1Cs2Pb3ffryHJMqBKw3qt/FZN
         Aj05ns7rGIMShV3ujr6HN7agVN/jM2gx8l4lzAo/22kawFGuzmXX6mQiSn/B6toi1XUe
         7SccLwdJBeTxrTUGYAEi8JgoYHfZUyCu7J3d5QBuM/AUxZx4nBLvJ2YaGzv0I865Dr23
         uPoqJ3YvGWVszQA3OAhO0HixmHCHh7JgpuO5Sn37ytvZvevVdzVgGbFdwKgPY2MjZvqn
         iDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/HLnBgL78z3g+xd6PxPHvHY0SFIgTSI0bcDcphjSqs=;
        b=RWKItBz/TKyNQiTDXmfxwLOBtZ0xgUiq3+MXoPrMVZVa7xBDkCJUX04qAzDWnzRMIb
         KpEBEU58qA+WtHnJVv3Ig54xPGUH9GxaJAipqwJ4rJmTc53pa33EDjQ99OYVx9O7dTF+
         Lg0/uTpAj0raLr7NCV0eN+8bhCQfFc5L1hCNftsdgGTCQQYx4cmnzAZ+6zSopQAGNrMr
         YVIf0H7vEYsTyZghff3qIUdFt1RVbGDpmz7YfUAlt+LvDs06pqUTObmmj1BfF+4v3RE1
         huB2H0wdDhn/eLRa6ZIKPhbTwET5WFteyvcowb2n1bdHFWBmZVLXR6/yaDKBzAnOxomc
         5Hdg==
X-Gm-Message-State: AO0yUKUDXgixntefHe6Xh20o5+gouBvDUbgvgm+8GV1wxBfS6erP1Yte
	+J8g1OowXRJXdjqXKpjOYhtmrsATQN0gWA==
X-Google-Smtp-Source: AK7set+W0JPaC06MNtxzOhoJq8s+ldBdHuhqSAWapm9BTZZdL/x5N8263P+Gj7kHNraT+RX8upnZow==
X-Received: by 2002:aa7:cccc:0:b0:4ac:b308:d732 with SMTP id y12-20020aa7cccc000000b004acb308d732mr24509991edt.18.1677484621678;
        Sun, 26 Feb 2023 23:57:01 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] x86/svm: split svm_intercept_msr() into svm_{set,clear}_msr_intercept()
Date: Mon, 27 Feb 2023 09:56:50 +0200
Message-Id: <20230227075652.3782973-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230227075652.3782973-1-burzalodowa@gmail.com>
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change aims to render the control interface of MSR intercepts identical
between SVM and VMX code, so that the control of the MSR intercept in common
code can be done through an hvm_funcs callback.

Create two new functions:
- svm_set_msr_intercept(), enables interception of read/write accesses to the
  corresponding MSR, by setting the corresponding read/write bits in the MSRPM
  based on the flags
- svm_clear_msr_intercept(), disables interception of read/write accesses to
  the corresponding MSR, by clearing the corresponding read/write bits in the
  MSRPM based on the flags

More specifically:
- if flag is MSR_R, the functions {set,clear} the MSRPM bit that controls read
  access to the MSR
- if flag is MSR_W, the functions {set,clear} the MSRPM bit that controls write
  access to the MSR
- if flag is MSR_RW, the functions {set,clear} both MSRPM bits

Place the definitions of the flags in asm/hvm/hvm.h because there is the
intention to be used by VMX code as well.

Remove svm_intercept_msr() and MSR_INTERCEPT_* definitions, and use the new
functions and flags instead.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/cpu/vpmu_amd.c             |  9 +--
 xen/arch/x86/hvm/svm/svm.c              | 80 ++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/hvm.h      |  4 ++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 13 ++--
 4 files changed, 66 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 9df739aa3f..ed6706959e 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -165,8 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_WRITE);
+        svm_clear_msr_intercept(v, counters[i], MSR_RW);
+        svm_set_msr_intercept(v, ctrls[i], MSR_W);
+        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
     }
 
     msr_bitmap_on(vpmu);
@@ -179,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_RW);
+        svm_set_msr_intercept(v, counters[i], MSR_RW);
+        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
     }
 
     msr_bitmap_off(vpmu);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a43bcf2e92..eb144272f4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -288,23 +288,34 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
     return msr_bit;
 }
 
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
+void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
 {
-    unsigned long *msr_bit;
-    const struct domain *d = v->domain;
+    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
+
+    if ( msr_bit == NULL )
+        return;
 
-    msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
-    BUG_ON(msr_bit == NULL);
     msr &= 0x1fff;
 
-    if ( flags & MSR_INTERCEPT_READ )
+    if ( flags & MSR_R )
          __set_bit(msr * 2, msr_bit);
-    else if ( !monitored_msr(d, msr) )
-         __clear_bit(msr * 2, msr_bit);
-
-    if ( flags & MSR_INTERCEPT_WRITE )
+    if ( flags & MSR_W )
         __set_bit(msr * 2 + 1, msr_bit);
-    else if ( !monitored_msr(d, msr) )
+}
+
+void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
+{
+    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
+
+    if ( msr_bit == NULL )
+        return;
+
+    if ( monitored_msr(v->domain, msr) )
+        return;
+
+    if ( flags & MSR_R )
+        __clear_bit(msr * 2, msr_bit);
+    if ( flags & MSR_W )
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
@@ -312,8 +323,10 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
     struct vcpu *v;
 
-    for_each_vcpu ( d, v )
-        svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
+    for_each_vcpu ( d, v ) {
+        svm_set_msr_intercept(v, msr, MSR_W);
+        svm_clear_msr_intercept(v, msr, MSR_R);
+    }
 }
 
 static void svm_save_dr(struct vcpu *v)
@@ -330,10 +343,10 @@ static void svm_save_dr(struct vcpu *v)
 
     if ( v->domain->arch.cpuid->extd.dbext )
     {
-        svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_INTERCEPT_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_RW);
 
         rdmsrl(MSR_AMD64_DR0_ADDRESS_MASK, v->arch.msrs->dr_mask[0]);
         rdmsrl(MSR_AMD64_DR1_ADDRESS_MASK, v->arch.msrs->dr_mask[1]);
@@ -361,10 +374,10 @@ static void __restore_debug_registers(struct vmcb_struct *vmcb, struct vcpu *v)
 
     if ( v->domain->arch.cpuid->extd.dbext )
     {
-        svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_INTERCEPT_NONE);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_RW);
 
         wrmsrl(MSR_AMD64_DR0_ADDRESS_MASK, v->arch.msrs->dr_mask[0]);
         wrmsrl(MSR_AMD64_DR1_ADDRESS_MASK, v->arch.msrs->dr_mask[1]);
@@ -595,22 +608,31 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     vmcb_set_exception_intercepts(vmcb, bitmap);
 
     /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
-    svm_intercept_msr(v, MSR_SPEC_CTRL,
-                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+    if ( cp->extd.ibrs )
+        svm_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
+    else
+        svm_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
     /*
      * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
      * setting and avoid having to perform a rdmsr on vmexit to get the guest
      * setting even if VIRT_SSBD is offered to Xen itself.
      */
-    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
-                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
-                      !cpu_has_amd_ssbd ?
-                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
+    if ( cp->extd.virt_ssbd && cpu_has_virt_ssbd && !cpu_has_amd_ssbd )
+    {
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_W);
+        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_R);
+    }
+    else
+    {
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
+    }
 
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
-    svm_intercept_msr(v, MSR_PRED_CMD,
-                      cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+    if ( cp->extd.ibpb )
+        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
+    else
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
 }
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 43d3fc2498..f853e2f3e8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -261,6 +261,10 @@ extern struct hvm_function_table hvm_funcs;
 extern bool_t hvm_enabled;
 extern s8 hvm_port80_allowed;
 
+#define MSR_R       BIT(0, U)
+#define MSR_W       BIT(1, U)
+#define MSR_RW      (MSR_W | MSR_R)
+
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index e87728fa81..ed2e55e5cf 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
 
-#define MSR_INTERCEPT_NONE    0
-#define MSR_INTERCEPT_READ    1
-#define MSR_INTERCEPT_WRITE   2
-#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
-#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
-#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
+void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
+void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
+#define svm_disable_intercept_for_msr(v, msr) \
+    svm_clear_msr_intercept((v), (msr), MSR_RW)
+#define svm_enable_intercept_for_msr(v, msr) \
+    svm_set_intercept_msr((v), (msr), MSR_RW)
 
 /*
  * VMCB accessor functions.
-- 
2.37.2


