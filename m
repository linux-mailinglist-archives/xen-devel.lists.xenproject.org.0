Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C58A9E16C
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 11:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969570.1358618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCW-0002Oa-PC; Sun, 27 Apr 2025 09:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969570.1358618; Sun, 27 Apr 2025 09:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCW-0002K0-Gc; Sun, 27 Apr 2025 09:21:28 +0000
Received: by outflank-mailman (input) for mailman id 969570;
 Sun, 27 Apr 2025 09:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hqWD=XN=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8yCU-0001A9-0A
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 09:21:26 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc8d8b95-2348-11f0-9ffb-bf95429c2676;
 Sun, 27 Apr 2025 11:21:24 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R9KRS61598826
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 27 Apr 2025 02:20:50 -0700
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
X-Inumbo-ID: fc8d8b95-2348-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R9KRS61598826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745745652;
	bh=96MYN68NJt8wFTIurIsjp/tKuKs+pZs6JdTIOMXstR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bnNIe3ScYvjueYrWDqZUD8C/s3FUxlDMbWcnKbvvYV3qFHKV6juB2gRw4ChuBe22F
	 gZ2426c+8J3MKPtO83mhVLXky2bwa2P5c6/z4zzgq9rz6KPfWFG0mjm8QhHAVYCnMa
	 Dr9/R5cAIWRehyCDo0NOaEbp7VNp4KRLuQ87/AdlUf2F9NVOdszQ2USwuI5eXcLfGx
	 zczpJopfo/P9g+FcG6GpvyOgh7k/ISR+10fjIDi+PItN4Em2+bwm8soFSHjJJ8H3Y3
	 OlYn0FhGpRAU6sM4KCbMjxbaYSdsorZK6QMdD4g0XY67aiMBcz6fVaYiwR1Z1NbAra
	 4c8WchoA8KvVg==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
        netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com,
        dapeng1.mi@linux.intel.com, ilpo.jarvinen@linux.intel.com
Subject: [PATCH v4 09/15] x86/msr: Convert __rdmsr() uses to native_rdmsrq() uses
Date: Sun, 27 Apr 2025 02:20:21 -0700
Message-ID: <20250427092027.1598740-10-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427092027.1598740-1-xin@zytor.com>
References: <20250427092027.1598740-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__rdmsr() is the lowest level MSR write API, with native_rdmsr()
and native_rdmsrq() serving as higher-level wrappers around it.

  #define native_rdmsr(msr, val1, val2)                   \
  do {                                                    \
          u64 __val = __rdmsr((msr));                     \
          (void)((val1) = (u32)__val);                    \
          (void)((val2) = (u32)(__val >> 32));            \
  } while (0)

  static __always_inline u64 native_rdmsrq(u32 msr)
  {
          return __rdmsr(msr);
  }

However, __rdmsr() continues to be utilized in various locations.

MSR APIs are designed for different scenarios, such as native or
pvops, with or without trace, and safe or non-safe.  Unfortunately,
the current MSR API names do not adequately reflect these factors,
making it challenging to select the most appropriate API for
various situations.

To pave the way for improving MSR API names, convert __rdmsr()
uses to native_rdmsrq() to ensure consistent usage.  Later, these
APIs can be renamed to better reflect their implications, such as
native or pvops, with or without trace, and safe or non-safe.

No functional change intended.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/coco/sev/core.c                  | 2 +-
 arch/x86/events/amd/brs.c                 | 2 +-
 arch/x86/hyperv/hv_vtl.c                  | 4 ++--
 arch/x86/hyperv/ivm.c                     | 2 +-
 arch/x86/include/asm/mshyperv.h           | 2 +-
 arch/x86/kernel/cpu/common.c              | 2 +-
 arch/x86/kernel/cpu/mce/core.c            | 4 ++--
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
 arch/x86/kvm/vmx/vmx.c                    | 4 ++--
 arch/x86/mm/mem_encrypt_identity.c        | 4 ++--
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b18a33fe8dd3..c4137c94678d 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -276,7 +276,7 @@ static noinstr struct ghcb *__sev_get_ghcb(struct ghcb_state *state)
 
 static inline u64 sev_es_rd_ghcb_msr(void)
 {
-	return __rdmsr(MSR_AMD64_SEV_ES_GHCB);
+	return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
 }
 
 static __always_inline void sev_es_wr_ghcb_msr(u64 val)
diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index 3f5ecfd80d1e..06f35a6b58a5 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -49,7 +49,7 @@ static __always_inline void set_debug_extn_cfg(u64 val)
 
 static __always_inline u64 get_debug_extn_cfg(void)
 {
-	return __rdmsr(MSR_AMD_DBG_EXTN_CFG);
+	return native_rdmsrq(MSR_AMD_DBG_EXTN_CFG);
 }
 
 static bool __init amd_brs_detect(void)
diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
index 13242ed8ff16..c6343e699154 100644
--- a/arch/x86/hyperv/hv_vtl.c
+++ b/arch/x86/hyperv/hv_vtl.c
@@ -149,11 +149,11 @@ static int hv_vtl_bringup_vcpu(u32 target_vp_index, int cpu, u64 eip_ignored)
 	input->vp_context.rip = rip;
 	input->vp_context.rsp = rsp;
 	input->vp_context.rflags = 0x0000000000000002;
-	input->vp_context.efer = __rdmsr(MSR_EFER);
+	input->vp_context.efer = native_rdmsrq(MSR_EFER);
 	input->vp_context.cr0 = native_read_cr0();
 	input->vp_context.cr3 = __native_read_cr3();
 	input->vp_context.cr4 = native_read_cr4();
-	input->vp_context.msr_cr_pat = __rdmsr(MSR_IA32_CR_PAT);
+	input->vp_context.msr_cr_pat = native_rdmsrq(MSR_IA32_CR_PAT);
 	input->vp_context.idtr.limit = idt_ptr.size;
 	input->vp_context.idtr.base = idt_ptr.address;
 	input->vp_context.gdtr.limit = gdt_ptr.size;
diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 8209de792388..09a165a3c41e 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -111,7 +111,7 @@ u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
 
 static inline u64 rd_ghcb_msr(void)
 {
-	return __rdmsr(MSR_AMD64_SEV_ES_GHCB);
+	return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
 }
 
 static inline void wr_ghcb_msr(u64 val)
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 15d00dace70f..778444310cfb 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -305,7 +305,7 @@ void hv_set_non_nested_msr(unsigned int reg, u64 value);
 
 static __always_inline u64 hv_raw_get_msr(unsigned int reg)
 {
-	return __rdmsr(reg);
+	return native_rdmsrq(reg);
 }
 
 #else /* CONFIG_HYPERV */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 079ded4eeb86..cefc99990bde 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -164,7 +164,7 @@ static void ppin_init(struct cpuinfo_x86 *c)
 
 	/* Is the enable bit set? */
 	if (val & 2UL) {
-		c->ppin = __rdmsr(info->msr_ppin);
+		c->ppin = native_rdmsrq(info->msr_ppin);
 		set_cpu_cap(c, info->feature);
 		return;
 	}
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 1ae75ec7ac95..32286bad75e6 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -121,7 +121,7 @@ void mce_prep_record_common(struct mce *m)
 {
 	m->cpuid	= cpuid_eax(1);
 	m->cpuvendor	= boot_cpu_data.x86_vendor;
-	m->mcgcap	= __rdmsr(MSR_IA32_MCG_CAP);
+	m->mcgcap	= native_rdmsrq(MSR_IA32_MCG_CAP);
 	/* need the internal __ version to avoid deadlocks */
 	m->time		= __ktime_get_real_seconds();
 }
@@ -1298,7 +1298,7 @@ static noinstr bool mce_check_crashing_cpu(void)
 	    (crashing_cpu != -1 && crashing_cpu != cpu)) {
 		u64 mcgstatus;
 
-		mcgstatus = __rdmsr(MSR_IA32_MCG_STATUS);
+		mcgstatus = native_rdmsrq(MSR_IA32_MCG_STATUS);
 
 		if (boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) {
 			if (mcgstatus & MCG_STATUS_LMCES)
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 6e5edd76086e..324bd4919300 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -482,7 +482,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * the buffer and evict pseudo-locked memory read earlier from the
 	 * cache.
 	 */
-	saved_msr = __rdmsr(MSR_MISC_FEATURE_CONTROL);
+	saved_msr = native_rdmsrq(MSR_MISC_FEATURE_CONTROL);
 	native_wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
 	closid_p = this_cpu_read(pqr_state.cur_closid);
 	rmid_p = this_cpu_read(pqr_state.cur_rmid);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cd0d6c1fcf9c..68c8bb247fc4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -380,7 +380,7 @@ static __always_inline void vmx_disable_fb_clear(struct vcpu_vmx *vmx)
 	if (!vmx->disable_fb_clear)
 		return;
 
-	msr = __rdmsr(MSR_IA32_MCU_OPT_CTRL);
+	msr = native_rdmsrq(MSR_IA32_MCU_OPT_CTRL);
 	msr |= FB_CLEAR_DIS;
 	native_wrmsrq(MSR_IA32_MCU_OPT_CTRL, msr);
 	/* Cache the MSR value to avoid reading it later */
@@ -7307,7 +7307,7 @@ void noinstr vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx,
 		return;
 
 	if (flags & VMX_RUN_SAVE_SPEC_CTRL)
-		vmx->spec_ctrl = __rdmsr(MSR_IA32_SPEC_CTRL);
+		vmx->spec_ctrl = native_rdmsrq(MSR_IA32_SPEC_CTRL);
 
 	/*
 	 * If the guest/host SPEC_CTRL values differ, restore the host value.
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index afda349db35b..32af1cc378e4 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -527,7 +527,7 @@ void __head sme_enable(struct boot_params *bp)
 	me_mask = 1UL << (ebx & 0x3f);
 
 	/* Check the SEV MSR whether SEV or SME is enabled */
-	RIP_REL_REF(sev_status) = msr = __rdmsr(MSR_AMD64_SEV);
+	RIP_REL_REF(sev_status) = msr = native_rdmsrq(MSR_AMD64_SEV);
 	feature_mask = (msr & MSR_AMD64_SEV_ENABLED) ? AMD_SEV_BIT : AMD_SME_BIT;
 
 	/*
@@ -558,7 +558,7 @@ void __head sme_enable(struct boot_params *bp)
 			return;
 
 		/* For SME, check the SYSCFG MSR */
-		msr = __rdmsr(MSR_AMD64_SYSCFG);
+		msr = native_rdmsrq(MSR_AMD64_SYSCFG);
 		if (!(msr & MSR_AMD64_SYSCFG_MEM_ENCRYPT))
 			return;
 	}
-- 
2.49.0


