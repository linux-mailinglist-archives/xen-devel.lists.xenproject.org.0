Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C469D0B38
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 09:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839118.1254959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxS1-0006E0-CU; Mon, 18 Nov 2024 08:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839118.1254959; Mon, 18 Nov 2024 08:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxS1-0006B4-5T; Mon, 18 Nov 2024 08:49:41 +0000
Received: by outflank-mailman (input) for mailman id 839118;
 Mon, 18 Nov 2024 08:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0Lw=SN=bounce.vates.tech=bounce-md_30504962.673aff9a.v1-6f3315d8734646bca3549145d22f803a@srs-se1.protection.inumbo.net>)
 id 1tCxRz-0005D3-FH
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 08:49:39 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0904e8da-a58a-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 09:49:35 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XsLsQ1YgyzJKF3Zk
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 08:49:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6f3315d8734646bca3549145d22f803a; Mon, 18 Nov 2024 08:49:30 +0000
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
X-Inumbo-ID: 0904e8da-a58a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA5MDRlOGRhLWE1OGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTE5Nzc1LjY3NDU0NCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2FmZjlhLnYxLTZmMzMxNWQ4NzM0NjQ2YmNhMzU0OTE0NWQyMmY4MDNhQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731919770; x=1732180270;
	bh=jQsMIdFlhvKVHyeb3pcbSs0+jZjMBHrB3oPFmg+d7hA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=B2BS6yCKc3UQ9TtjZditDUEb4c26+eAeP+macp0aqdsMI6kG9wC041qCvitirGoVr
	 mOt3/Th8GwKN16K7tWwwPcMVnKzCd3UmuSd5pvSvd46OqwWuvx+G4em1+s9THkP9nv
	 9ET1TK8gWU76eS3Ckf3OcjTts36NoNGFnSDRFF25xW8rzhX+vh1cVybW4G2hGp5gXa
	 fPho6sNbF9fFAk2O0PxTOBZydF/0JkRIc1Ryuxg7iIqEv1Az/Q2cMGu6oV998myk/B
	 994zdLBNaDN1xeWxI7A3oElneFm/mALssU/8F3Gry8Fi+jbIhb80rIDrL1XTkW6i1F
	 juZc+3wI+88Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731919770; x=1732180270; i=ngoc-tu.dinh@vates.tech;
	bh=jQsMIdFlhvKVHyeb3pcbSs0+jZjMBHrB3oPFmg+d7hA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d2IKE3PLiO71PgI1Nr5BdvHpaFXKEqZipsvlFV/kjGx2YXSraExqN38KYcmiYWKvF
	 GltDqabLk3zJeV2cak0SJ2a8ReQQWqi56Xc8xMT8AbZplvNJZtfET6TCsea26fD6UT
	 1hHHyZB+OtORqbMLvKpmS3J9yg9R42+E6LqIOhboWLSs9puVDAUzyuBfXMt0JsXWnA
	 PwLQkeKf5AcjL3Zpdhas74QXnbeZUKiq9ANOUuv7Z/vR/zvzBpLeRA7idZ11e/JA/m
	 Yhjo5iRXySGEY0PrU65/UqsIFdRTOvk0sainQ9klrkDmMfBx2O64B7eeSWvq88qDlZ
	 LcqXRblPkKNLg==
From: ngoc-tu.dinh@vates.tech
Subject: =?utf-8?Q?[PATCH=204/4]=20x86/vmx:=20Virtualize=20architectural=20LBRs?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731919769554
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20241118084914.22268-5-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6f3315d8734646bca3549145d22f803a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 08:49:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Tu Dinh <ngoc-tu.dinh@vates.tech>

Virtual architectural LBRs work in guest mode only, using the "load
guest IA32_LBR_CTL" and "clear IA32_LBR_CTL" VMX controls.

Intercept writes to MSR_IA32_LASTBRANCH_{CTL,DEPTH} to inject LBR MSRs
into guest. MSR_IA32_LASTBRANCH_DEPTH is only allowed to be equal to
that of the host's.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/cpu-policy.c               |   3 +
 xen/arch/x86/hvm/vmx/vmcs.c             |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c              | 269 +++++++++++++++++-------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   8 +
 4 files changed, 211 insertions(+), 80 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 2ac76eb058..9e78273a79 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -788,6 +788,9 @@ static void __init calculate_hvm_max_policy(void)
 
         if ( !cpu_has_vmx_xsaves )
             __clear_bit(X86_FEATURE_XSAVES, fs);
+
+        if ( !cpu_has_vmx_guest_lbr_ctl )
+            __clear_bit(X86_FEATURE_ARCH_LBR, fs);
     }
 
     if ( test_bit(X86_FEATURE_ARCH_LBR, fs) )
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 147e998371..a16daad78a 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -203,6 +203,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
     P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
     P(cpu_has_vmx_virt_spec_ctrl, "Virtualize SPEC_CTRL");
+    P(cpu_has_vmx_guest_lbr_ctl, "Architectural LBR virtualization");
 #undef P
 
     if ( !printed )
@@ -448,7 +449,8 @@ static int vmx_init_vmcs_config(bool bsp)
 
     min = VM_EXIT_ACK_INTR_ON_EXIT;
     opt = (VM_EXIT_SAVE_GUEST_PAT | VM_EXIT_LOAD_HOST_PAT |
-           VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS);
+           VM_EXIT_LOAD_HOST_EFER | VM_EXIT_CLEAR_BNDCFGS |
+           VM_EXIT_CLEAR_GUEST_LBR_CTL);
     min |= VM_EXIT_IA32E_MODE;
     _vmx_vmexit_control = adjust_vmx_controls(
         "VMExit Control", min, opt, MSR_IA32_VMX_EXIT_CTLS, &mismatch);
@@ -489,7 +491,7 @@ static int vmx_init_vmcs_config(bool bsp)
 
     min = 0;
     opt = (VM_ENTRY_LOAD_GUEST_PAT | VM_ENTRY_LOAD_GUEST_EFER |
-           VM_ENTRY_LOAD_BNDCFGS);
+           VM_ENTRY_LOAD_BNDCFGS | VM_ENTRY_LOAD_GUEST_LBR_CTL);
     _vmx_vmentry_control = adjust_vmx_controls(
         "VMEntry Control", min, opt, MSR_IA32_VMX_ENTRY_CTLS, &mismatch);
 
@@ -1329,6 +1331,9 @@ static int construct_vmcs(struct vcpu *v)
               | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF))
               | (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
 
+    if ( cpu_has_vmx_guest_lbr_ctl )
+        __vmwrite(GUEST_LBR_CTL, 0);
+
     if ( cpu_has_vmx_notify_vm_exiting )
         __vmwrite(NOTIFY_WINDOW, vm_notify_window);
 
@@ -2087,6 +2092,8 @@ void vmcs_dump_vcpu(struct vcpu *v)
            vmr32(GUEST_PREEMPTION_TIMER), vmr32(GUEST_SMBASE));
     printk("DebugCtl = 0x%016lx  DebugExceptions = 0x%016lx\n",
            vmr(GUEST_IA32_DEBUGCTL), vmr(GUEST_PENDING_DBG_EXCEPTIONS));
+    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_LBR_CTL )
+        printk("LbrCtl = 0x%016lx\n", vmr(GUEST_LBR_CTL));
     if ( vmentry_ctl & (VM_ENTRY_LOAD_PERF_GLOBAL_CTRL | VM_ENTRY_LOAD_BNDCFGS) )
         printk("PerfGlobCtl = 0x%016lx  BndCfgS = 0x%016lx\n",
                vmr(GUEST_PERF_GLOBAL_CTRL), vmr(GUEST_BNDCFGS));
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index b6885d0e27..d417ae17d3 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -423,65 +423,96 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
     return rc;
 }
 
-static const struct lbr_info {
+struct lbr_info {
     u32 base, count;
-} p4_lbr[] = {
-    { MSR_P4_LER_FROM_LIP,          1 },
-    { MSR_P4_LER_TO_LIP,            1 },
-    { MSR_P4_LASTBRANCH_TOS,        1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    u64 initial;
+};
+
+static const struct lbr_info p4_lbr[] = {
+    { MSR_P4_LER_FROM_LIP,          1, 0 },
+    { MSR_P4_LER_TO_LIP,            1, 0 },
+    { MSR_P4_LASTBRANCH_TOS,        1, 0 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 }, c2_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_C2_LASTBRANCH_TOS,        1, 0 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO, 0 },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 }, nh_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_NHL_LBR_SELECT,           1, 0 },
+    { MSR_NHL_LASTBRANCH_TOS,       1, 0 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 }, sk_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_NHL_LBR_SELECT,           1, 0 },
+    { MSR_NHL_LASTBRANCH_TOS,       1, 0 },
+    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH, 0 },
+    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH, 0 },
+    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH, 0 },
+    { 0, 0, 0 }
 }, at_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_C2_LASTBRANCH_TOS,        1, 0 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO, 0 },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 }, sm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_SM_LBR_SELECT,            1, 0 },
+    { MSR_SM_LASTBRANCH_TOS,        1, 0 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO, 0 },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 }, gm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
+    { MSR_IA32_LASTINTFROMIP,       1, 0 },
+    { MSR_IA32_LASTINTTOIP,         1, 0 },
+    { MSR_SM_LBR_SELECT,            1, 0 },
+    { MSR_SM_LASTBRANCH_TOS,        1, 0 },
+    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO, 0 },
+    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
 };
 static const struct lbr_info *__ro_after_init model_specific_lbr;
 
+static struct lbr_info __ro_after_init architectural_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,        1, 0 },
+    { MSR_IA32_LASTINTTOIP,          1, 0 },
+    { MSR_IA32_LER_INFO,             1, 0 },
+    /* to be updated by update_arch_lbr */
+    { MSR_IA32_LASTBRANCH_0_INFO,    MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
+    { MSR_IA32_LASTBRANCH_0_FROM_IP, MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
+    { MSR_IA32_LASTBRANCH_0_TO_IP,   MAX_MSR_ARCH_LASTBRANCH_FROM_TO, 0 },
+    { 0, 0, 0 }
+};
+static uint64_t __ro_after_init host_lbr_depth = 0;
+
+static void __init update_arch_lbr(void)
+{
+    struct lbr_info *lbr = architectural_lbr;
+
+    if ( boot_cpu_has(X86_FEATURE_ARCH_LBR) )
+        rdmsrl(MSR_IA32_LASTBRANCH_DEPTH, host_lbr_depth);
+    ASSERT((host_lbr_depth % 8) == 0 && (host_lbr_depth <= 64));
+
+    for ( ; lbr->count; lbr++ ) {
+        if ( lbr->base == MSR_IA32_LASTBRANCH_0_INFO ||
+             lbr->base == MSR_IA32_LASTBRANCH_0_FROM_IP ||
+             lbr->base == MSR_IA32_LASTBRANCH_0_TO_IP )
+            lbr->count = (u32)host_lbr_depth;
+    }
+}
+
 static const struct lbr_info *__init get_model_specific_lbr(void)
 {
     switch ( boot_cpu_data.x86 )
@@ -3056,6 +3087,8 @@ const struct hvm_function_table * __init start_vmx(void)
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
+    update_arch_lbr();
+
     return &vmx_function_table;
 }
 
@@ -3303,25 +3336,36 @@ static void __init ler_to_fixup_check(void)
     }
 }
 
-static int is_last_branch_msr(u32 ecx)
+static const struct lbr_info * find_last_branch_msr(struct vcpu *v, u32 ecx)
 {
+    /*
+     * Model-specific and architectural LBRs are mutually exclusive.
+     * It's not necessary to check both lbr_info lists.
+     */
     const struct lbr_info *lbr = model_specific_lbr;
+    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
 
-    if ( lbr == NULL )
-        return 0;
+    if ( lbr == NULL ) {
+        if ( cp->feat.arch_lbr )
+            lbr = architectural_lbr;
+        else
+            return NULL;
+    }
 
     for ( ; lbr->count; lbr++ )
         if ( (ecx >= lbr->base) && (ecx < (lbr->base + lbr->count)) )
-            return 1;
+            return lbr;
 
-    return 0;
+    return NULL;
 }
 
 static int cf_check vmx_msr_read_intercept(
     unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    const struct cpu_policy *cp = curr->domain->arch.cpu_policy;
     uint64_t tmp;
+    const struct lbr_info *lbr = NULL;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
@@ -3369,6 +3413,18 @@ static int cf_check vmx_msr_read_intercept(
         __vmread(GUEST_IA32_DEBUGCTL, msr_content);
         break;
 
+    case MSR_IA32_LASTBRANCH_CTL:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+        __vmread(GUEST_LBR_CTL, msr_content);
+        break;
+
+    case MSR_IA32_LASTBRANCH_DEPTH:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+        *msr_content = host_lbr_depth;
+        break;
+
     case MSR_IA32_VMX_BASIC...MSR_IA32_VMX_VMFUNC:
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
@@ -3397,9 +3453,10 @@ static int cf_check vmx_msr_read_intercept(
         if ( vmx_read_guest_msr(curr, msr, msr_content) == 0 )
             break;
 
-        if ( is_last_branch_msr(msr) )
+        lbr = find_last_branch_msr(curr, msr);
+        if ( lbr != NULL )
         {
-            *msr_content = 0;
+            *msr_content = lbr->initial;
             break;
         }
 
@@ -3540,6 +3597,34 @@ void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
+static int vmx_lbr_insert(struct vcpu *v, const struct lbr_info *lbr)
+{
+    for ( ; lbr->count; lbr++ )
+    {
+        unsigned int i;
+
+        for ( i = 0; i < lbr->count; i++ )
+        {
+            int rc = vmx_add_guest_msr(v, lbr->base + i, lbr->initial);
+
+            if ( unlikely(rc) )
+            {
+                return rc;
+            }
+
+            vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
+        }
+    }
+
+    v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
+    if ( lbr_tsx_fixup_needed )
+        v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
+    if ( ler_to_fixup_needed )
+        v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
+
+    return 0;
+}
+
 static int cf_check vmx_msr_write_intercept(
     unsigned int msr, uint64_t msr_content)
 {
@@ -3652,36 +3737,64 @@ static int cf_check vmx_msr_write_intercept(
         if ( !(v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED) &&
              (msr_content & IA32_DEBUGCTLMSR_LBR) )
         {
-            const struct lbr_info *lbr = model_specific_lbr;
+            int rc = vmx_lbr_insert(v, model_specific_lbr);
 
-            for ( ; lbr->count; lbr++ )
+            if ( unlikely(rc) )
             {
-                unsigned int i;
+                gprintk(XENLOG_ERR,
+                        "Guest load/save list error %d\n", rc);
+                domain_crash(v->domain);
+                return X86EMUL_OKAY;
+            }
+        }
 
-                for ( i = 0; i < lbr->count; i++ )
-                {
-                    int rc = vmx_add_guest_msr(v, lbr->base + i, 0);
+        __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
+        break;
 
-                    if ( unlikely(rc) )
-                    {
-                        gprintk(XENLOG_ERR,
-                                "Guest load/save list error %d\n", rc);
-                        domain_crash(v->domain);
-                        return X86EMUL_OKAY;
-                    }
+    case MSR_IA32_LASTBRANCH_CTL:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
 
-                    vmx_clear_msr_intercept(v, lbr->base + i, VMX_MSR_RW);
-                }
+        if ( msr_content & ~LASTBRANCH_CTL_VALID )
+            goto gp_fault;
+
+        if ( !(v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED) &&
+             (msr_content & LASTBRANCH_CTL_LBREN) )
+        {
+            int rc;
+
+            rc = vmx_lbr_insert(v, architectural_lbr);
+            if ( unlikely(rc) )
+            {
+                gprintk(XENLOG_ERR,
+                        "Guest load/save list error %d\n", rc);
+                domain_crash(v->domain);
+                return X86EMUL_OKAY;
             }
+        }
+
+        __vmwrite(GUEST_LBR_CTL, msr_content);
+        break;
 
-            v->arch.hvm.vmx.lbr_flags |= LBR_MSRS_INSERTED;
-            if ( lbr_tsx_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_TSX;
-            if ( ler_to_fixup_needed )
-                v->arch.hvm.vmx.lbr_flags |= LBR_FIXUP_LER_TO;
+    case MSR_IA32_LASTBRANCH_DEPTH:
+        if ( !cp->feat.arch_lbr )
+            goto gp_fault;
+
+        if ( msr_content != host_lbr_depth )
+            goto gp_fault;
+
+        if ( v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED )
+        {
+            /* writes to MSR_IA32_LASTBRANCH_DEPTH zero LBR state */
+            int i;
+            for (i = 0; i < host_lbr_depth; i++)
+            {
+                vmx_write_guest_msr(v, MSR_IA32_LASTBRANCH_0_INFO + i, 0);
+                vmx_write_guest_msr(v, MSR_IA32_LASTBRANCH_0_FROM_IP + i, 0);
+                vmx_write_guest_msr(v, MSR_IA32_LASTBRANCH_0_TO_IP + i, 0);
+            }
         }
 
-        __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
         break;
 
     case MSR_IA32_MISC_ENABLE:
@@ -3710,7 +3823,7 @@ static int cf_check vmx_msr_write_intercept(
             return X86EMUL_OKAY;
 
         if ( vmx_write_guest_msr(v, msr, msr_content) == 0 ||
-             is_last_branch_msr(msr) )
+             find_last_branch_msr(v, msr) != NULL )
             break;
 
         if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 939b87eb50..2b265e583f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -229,6 +229,7 @@ extern u32 vmx_pin_based_exec_control;
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
+#define VM_EXIT_CLEAR_GUEST_LBR_CTL     0x04000000
 extern u32 vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
@@ -238,6 +239,7 @@ extern u32 vmx_vmexit_control;
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
+#define VM_ENTRY_LOAD_GUEST_LBR_CTL     0x00200000
 extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001U
@@ -391,6 +393,10 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_notify_vm_exiting \
     (IS_ENABLED(CONFIG_INTEL_VMX) && \
      vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+#define cpu_has_vmx_guest_lbr_ctl \
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     (vmx_vmexit_control & VM_EXIT_CLEAR_GUEST_LBR_CTL) && \
+     (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_LBR_CTL))
 
 #define VMCS_RID_TYPE_MASK              0x80000000U
 
@@ -480,6 +486,8 @@ enum vmcs_field {
     GUEST_PDPTE0                    = 0x0000280a,
 #define GUEST_PDPTE(n) (GUEST_PDPTE0 + (n) * 2) /* n = 0...3 */
     GUEST_BNDCFGS                   = 0x00002812,
+    GUEST_RTIT_CTL                  = 0x00002814,
+    GUEST_LBR_CTL                   = 0x00002816,
     HOST_PAT                        = 0x00002c00,
     HOST_EFER                       = 0x00002c02,
     HOST_PERF_GLOBAL_CTRL           = 0x00002c04,
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

