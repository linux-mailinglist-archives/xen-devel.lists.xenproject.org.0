Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505738B5D29
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714189.1115300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk6-0007OX-IT; Mon, 29 Apr 2024 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714189.1115300; Mon, 29 Apr 2024 15:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sk6-0007KB-Dl; Mon, 29 Apr 2024 15:16:34 +0000
Received: by outflank-mailman (input) for mailman id 714189;
 Mon, 29 Apr 2024 15:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Sk4-0006Yb-EK
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:16:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75729faa-063b-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:16:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so581407966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:16:31 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ah2-20020a1709069ac200b00a4e393b6349sm13898875ejc.5.2024.04.29.08.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:16:30 -0700 (PDT)
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
X-Inumbo-ID: 75729faa-063b-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714403791; x=1715008591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcoqfARDqrlky4wrrXrfTQs6HHdphVhH1yCeBnWj98g=;
        b=VnUpaTz7SVuiwfx6lGxpKf+VhbbshzlqZ/xM1igF4q7JDPCtpCN8z9R1PWBLVDXpCy
         wosf6yTCeCl8kBTog+3tElrObI5ujctWG+1yHnsNMYOnPocU77zRpF3lciuXy/VwqdZV
         DvyJnYhdOzguFag/+k3ATo0zMmi6OIDKAZwso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403791; x=1715008591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcoqfARDqrlky4wrrXrfTQs6HHdphVhH1yCeBnWj98g=;
        b=oyoaU4haKWZPTW7A0H8Vttws/0xngjCUOXbl2C7XFKZXbeO4h1eOg6osBa99L3I5+7
         ZpSxk9WBTCWp/U1LAtvbgXpeufTAEa82idJlXaZ1hzMSOfiyx4hoKmyZeAf1cYKozl6g
         nmaLRi4mUyWyhGxn59wfYWsrL8ZXhA0WQB1u6JuwJg9hNFDP9/uX/16lPjYh57J/y4Gy
         iskko8tWvxX3VLHOfpeF63qJlBv3VlcC3F8ZJQ6aqULSFTV5zbPPDp785q88TnzqdQxj
         1RzqolgQ883eJ6afhBoY2rNrWCZ3zD3h/5kK4HoIdfTFgk1xwSFK7w1l+PXKa8C+PJGI
         OJsQ==
X-Gm-Message-State: AOJu0YxWWb+BJ9NNTVyH443o99V7MGS2U7zuWSFCqLCp7JwEsxDr/aQH
	Vu5SrBrNqAK/MP1CVOSCCp7vhx/FqaB2BzI3bW8p0zaz+KsJoOWwOHmlWK+gbSUAQnou2ECPW54
	r
X-Google-Smtp-Source: AGHT+IFWAEGgtq2ZMf07u5/lgg0eSruUnxDMXty5VTYCGiE5SGPRdG6X5uS5LizX8qohzjYazAcKdQ==
X-Received: by 2002:a17:906:3498:b0:a55:77fd:17ff with SMTP id g24-20020a170906349800b00a5577fd17ffmr7433423ejb.32.1714403790928;
        Mon, 29 Apr 2024 08:16:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrei Semenov <andrei.semenov@vates.fr>,
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: [PATCH 4/5] x86/svm: Switch SVM features over normal cpu_has_*
Date: Mon, 29 Apr 2024 16:16:24 +0100
Message-Id: <20240429151625.977884-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429151625.977884-1-andrew.cooper3@citrix.com>
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Delete the boot time rendering of advanced features.  It's entirely ad-hoc and
not even everything printed here is used by Xen.  It is available in
`xen-cpuid` now.

With (only) svm_load_segs_{,prefetch}() declared now in svm.h, only svm.c and
domain.c which need the header.  Clean up all others.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Andrei Semenov <andrei.semenov@vates.fr>
CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
 xen/arch/x86/hvm/svm/asid.c            |  5 ++-
 xen/arch/x86/hvm/svm/emulate.c         |  3 +-
 xen/arch/x86/hvm/svm/intr.c            |  1 -
 xen/arch/x86/hvm/svm/nestedsvm.c       | 14 ++++----
 xen/arch/x86/hvm/svm/svm.c             | 50 +++++++-------------------
 xen/arch/x86/hvm/svm/vmcb.c            |  1 -
 xen/arch/x86/include/asm/cpufeature.h  | 10 ++++++
 xen/arch/x86/include/asm/hvm/svm/svm.h | 36 -------------------
 8 files changed, 31 insertions(+), 89 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b53..6117a362d310 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -6,7 +6,6 @@
 
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
 
 #include "svm.h"
 
@@ -39,7 +38,7 @@ void svm_asid_handle_vmrun(void)
     {
         vmcb_set_asid(vmcb, true);
         vmcb->tlb_control =
-            cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+            cpu_has_flush_by_asid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
         return;
     }
 
@@ -48,7 +47,7 @@ void svm_asid_handle_vmrun(void)
 
     vmcb->tlb_control =
         !need_flush ? TLB_CTRL_NO_FLUSH :
-        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
+        cpu_has_flush_by_asid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 93ac1d3435f9..da6e21b2e270 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -11,7 +11,6 @@
 #include <asm/msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 
 #include "svm.h"
@@ -20,7 +19,7 @@ static unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( !cpu_has_svm_nrips )
+    if ( !cpu_has_nrips )
         return 0;
 
 #ifndef NDEBUG
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4805c5567213..facd2894a2c6 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -17,7 +17,6 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/vlapic.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/nestedhvm.h> /* for nestedhvm_vcpu_in_guestmode */
 #include <asm/vm_event.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 35a2cbfd7d13..255af112661f 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -6,7 +6,6 @@
  */
 
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svmdebug.h>
@@ -1620,7 +1619,7 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
              paging_mode_hap(v->domain) &&
-             cpu_has_svm_vloadsave )
+             cpu_has_v_loadsave )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1629,8 +1628,7 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( !vmcb->_vintr.fields.vgif_enable &&
-             cpu_has_svm_vgif )
+        if ( !vmcb->_vintr.fields.vgif_enable && cpu_has_v_gif )
         {
             vintr = vmcb_get_vintr(vmcb);
             vintr.fields.vgif = svm->ns_gif;
@@ -1675,8 +1673,8 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
      */
     hvm_function_table->caps.nested_virt =
         hvm_function_table->caps.hap && 
-        cpu_has_svm_lbrv &&
-        cpu_has_svm_nrips &&
-        cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_v_lbr &&
+        cpu_has_nrips &&
+        cpu_has_flush_by_asid &&
+        cpu_has_decode_assist;
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4719fffae589..16eb875aab94 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1287,7 +1287,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
      * that hardware doesn't perform DPL checking on injection.
      */
     if ( event->type == X86_EVENTTYPE_PRI_SW_EXCEPTION ||
-         (!cpu_has_svm_nrips && (event->type >= X86_EVENTTYPE_SW_INTERRUPT)) )
+         (!cpu_has_nrips && (event->type >= X86_EVENTTYPE_SW_INTERRUPT)) )
         svm_emul_swint_injection(&_event);
 
     switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
@@ -1341,7 +1341,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     switch ( _event.type )
     {
     case X86_EVENTTYPE_SW_INTERRUPT: /* int $n */
-        if ( cpu_has_svm_nrips )
+        if ( cpu_has_nrips )
             vmcb->nextrip = regs->rip + _event.insn_len;
         else
             regs->rip += _event.insn_len;
@@ -1355,7 +1355,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
          * semantics.
          */
         regs->rip += _event.insn_len;
-        if ( cpu_has_svm_nrips )
+        if ( cpu_has_nrips )
             vmcb->nextrip = regs->rip;
         eventinj.type = X86_EVENTTYPE_HW_EXCEPTION;
         break;
@@ -1365,7 +1365,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
          * Hardware special cases HW_EXCEPTION with vectors 3 and 4 as having
          * trap semantics, and will perform DPL checks.
          */
-        if ( cpu_has_svm_nrips )
+        if ( cpu_has_nrips )
             vmcb->nextrip = regs->rip + _event.insn_len;
         else
             regs->rip += _event.insn_len;
@@ -1982,7 +1982,7 @@ static int cf_check svm_msr_write_intercept(
 
     case MSR_IA32_DEBUGCTLMSR:
         vmcb_set_debugctlmsr(vmcb, msr_content);
-        if ( !msr_content || !cpu_has_svm_lbrv )
+        if ( !msr_content || !cpu_has_v_lbr )
             break;
         vmcb->virt_ext.fields.lbr_enable = 1;
         svm_disable_intercept_for_msr(v, MSR_IA32_DEBUGCTLMSR);
@@ -2480,8 +2480,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
 
 const struct hvm_function_table * __init start_svm(void)
 {
-    bool printed = false;
-
     svm_host_osvw_reset();
 
     if ( _svm_cpu_up(true) )
@@ -2493,38 +2491,14 @@ const struct hvm_function_table * __init start_svm(void)
 
     setup_vmcb_dump();
 
-    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
-        svm_feature_flags = cpuid_edx(0x8000000aU);
-
-    printk("SVM: Supported advanced features:\n");
-
     /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
-    if ( !cpu_has_svm_nrips )
-        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
+    if ( !cpu_has_nrips )
+        setup_clear_cpu_cap(X86_FEATURE_DECODE_ASSIST);
 
     if ( cpu_has_tsc_ratio )
         svm_function_table.tsc_scaling.ratio_frac_bits = 32;
 
-#define P(p,s) if ( p ) { printk(" - %s\n", s); printed = 1; }
-    P(cpu_has_svm_npt, "Nested Page Tables (NPT)");
-    P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
-    P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
-    P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
-    P(cpu_has_svm_flushbyasid, "TLB flush by ASID");
-    P(cpu_has_svm_decode, "DecodeAssists");
-    P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
-    P(cpu_has_svm_vgif, "Virtual GIF");
-    P(cpu_has_pause_filter, "Pause-Intercept Filter");
-    P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
-    P(cpu_has_tsc_ratio, "TSC Rate MSR");
-    P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
-    P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
-#undef P
-
-    if ( !printed )
-        printk(" - none\n");
-
-    svm_function_table.caps.hap = cpu_has_svm_npt;
+    svm_function_table.caps.hap = cpu_has_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
@@ -2761,7 +2735,7 @@ void asmlinkage svm_vmexit_handler(void)
                     regs->rax, regs->rbx, regs->rcx,
                     regs->rdx, regs->rsi, regs->rdi);
 
-        if ( cpu_has_svm_decode )
+        if ( cpu_has_decode_assist )
             v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
         rc = paging_fault(va, regs);
         v->arch.hvm.svm.cached_insn_len = 0;
@@ -2906,14 +2880,14 @@ void asmlinkage svm_vmexit_handler(void)
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
-        if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
+        if ( cpu_has_decode_assist && vmcb->ei.mov_cr.mov_insn )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
         break;
 
     case VMEXIT_INVLPG:
-        if ( cpu_has_svm_decode )
+        if ( cpu_has_decode_assist )
         {
             svm_invlpg_intercept(vmcb->exitinfo1);
             __update_guest_eip(regs, vmcb->nextrip - vmcb->rip);
@@ -2994,7 +2968,7 @@ void asmlinkage svm_vmexit_handler(void)
         break;
 
     case VMEXIT_NPF:
-        if ( cpu_has_svm_decode )
+        if ( cpu_has_decode_assist )
             v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
         rc = vmcb->ei.npf.ec & PFEC_page_present
              ? p2m_pt_handle_deferred_changes(vmcb->ei.npf.gpa) : 0;
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 4e1f61dbe038..4452ab1263d4 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -15,7 +15,6 @@
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
 
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 77cfd900cb56..b6fb8c24423c 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -218,6 +218,16 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
 
 /* CPUID level 0x8000000a.edx */
+#define cpu_has_npt             boot_cpu_has(X86_FEATURE_NPT)
+#define cpu_has_v_lbr           boot_cpu_has(X86_FEATURE_V_LBR)
+#define cpu_has_nrips           boot_cpu_has(X86_FEATURE_NRIPS)
+#define cpu_has_tsc_ratio       boot_cpu_has(X86_FEATURE_V_TSC_RATE)
+#define cpu_has_flush_by_asid   boot_cpu_has(X86_FEATURE_FLUSH_BY_ASID)
+#define cpu_has_decode_assist   boot_cpu_has(X86_FEATURE_DECODE_ASSIST)
+#define cpu_has_pause_filter    boot_cpu_has(X86_FEATURE_PAUSE_FILTER)
+#define cpu_has_pause_thresh    boot_cpu_has(X86_FEATURE_PAUSE_THRESH)
+#define cpu_has_v_loadsave      boot_cpu_has(X86_FEATURE_V_LOADSAVE)
+#define cpu_has_v_gif           boot_cpu_has(X86_FEATURE_V_GIF)
 #define cpu_has_v_spec_ctrl     boot_cpu_has(X86_FEATURE_V_SPEC_CTRL)
 
 /* Synthesized. */
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 4eeeb25da90c..06a951225e64 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -21,40 +21,4 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
-extern u32 svm_feature_flags;
-
-#define SVM_FEATURE_NPT            0 /* Nested page table support */
-#define SVM_FEATURE_LBRV           1 /* LBR virtualization support */
-#define SVM_FEATURE_SVML           2 /* SVM locking MSR support */
-#define SVM_FEATURE_NRIPS          3 /* Next RIP save on VMEXIT support */
-#define SVM_FEATURE_TSCRATEMSR     4 /* TSC ratio MSR support */
-#define SVM_FEATURE_VMCBCLEAN      5 /* VMCB clean bits support */
-#define SVM_FEATURE_FLUSHBYASID    6 /* TLB flush by ASID support */
-#define SVM_FEATURE_DECODEASSISTS  7 /* Decode assists support */
-#define SVM_FEATURE_PAUSEFILTER   10 /* Pause intercept filter support */
-#define SVM_FEATURE_PAUSETHRESH   12 /* Pause intercept filter support */
-#define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
-#define SVM_FEATURE_VGIF          16 /* Virtual GIF */
-#define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
-#define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
-
-static inline bool cpu_has_svm_feature(unsigned int feat)
-{
-    return svm_feature_flags & (1u << feat);
-}
-#define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
-#define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
-#define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
-#define cpu_has_svm_nrips     cpu_has_svm_feature(SVM_FEATURE_NRIPS)
-#define cpu_has_svm_cleanbits cpu_has_svm_feature(SVM_FEATURE_VMCBCLEAN)
-#define cpu_has_svm_flushbyasid cpu_has_svm_feature(SVM_FEATURE_FLUSHBYASID)
-#define cpu_has_svm_decode    cpu_has_svm_feature(SVM_FEATURE_DECODEASSISTS)
-#define cpu_has_svm_vgif      cpu_has_svm_feature(SVM_FEATURE_VGIF)
-#define cpu_has_pause_filter  cpu_has_svm_feature(SVM_FEATURE_PAUSEFILTER)
-#define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
-#define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
-#define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
-#define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
-#define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
-
 #endif /* __ASM_X86_HVM_SVM_H__ */
-- 
2.30.2


