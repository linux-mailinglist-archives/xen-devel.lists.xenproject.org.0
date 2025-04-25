Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F2A9C12C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967324.1357256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EXB-0006HP-FU; Fri, 25 Apr 2025 08:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967324.1357256; Fri, 25 Apr 2025 08:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EXA-00069v-Ni; Fri, 25 Apr 2025 08:35:44 +0000
Received: by outflank-mailman (input) for mailman id 967324;
 Fri, 25 Apr 2025 08:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EX8-0002sy-DY
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:42 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f0242b-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:41 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5b2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:35:14 -0700
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
X-Inumbo-ID: 44f0242b-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5b2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570116;
	bh=uv41QT4bUCUeg9kRJU+Ll1R/EUQNWmYyobPhZDDnvG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAHupr+aVuwBpQ/lNk4VRYfQ8YqH5gxJ2rbpQnBuRb4FaPPs70H6aY1LwvgqiZm7g
	 HGijy5UeFm73/eBXR+IGsU6GUt8lk0uW2ujOhjHd+8YFP6FlTKaPe4NoqX38awxYPk
	 /xIGSplFs/IhIrHT35jWYZVGRoIeRgbzT1lZOmuyNtXHKUuFWzrhnryI2+qkXFrVTN
	 TY5LUhj34npFxPcxFG7+6q0Ud1MXC09OUc5i8nZbZf+9zaMDQf/GlSdPVLQbd+lBGC
	 WCjWDfnBVN4vbnbd4hlZgXwvR+IWnKB3H6jRhkgL304Rs2jXmKs1f9GQRy0wpbeZsY
	 ZKoo8rEiZWH1g==
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
        dapeng1.mi@linux.intel.com
Subject: [PATCH v3 13/14] x86/msr: Replace wrmsr(msr, low, 0) with wrmsrq(msr, low)
Date: Fri, 25 Apr 2025 01:34:36 -0700
Message-ID: <20250425083442.2390017-14-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The third argument in wrmsr(msr, low, 0) is unnecessary.  Instead, use
wrmsrq(msr, low), which automatically sets the higher 32 bits of the
MSR value to 0.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/hyperv/hv_apic.c                 | 6 +++---
 arch/x86/include/asm/apic.h               | 2 +-
 arch/x86/include/asm/switch_to.h          | 2 +-
 arch/x86/kernel/cpu/amd.c                 | 2 +-
 arch/x86/kernel/cpu/common.c              | 8 ++++----
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 4 ++--
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
 arch/x86/kernel/cpu/umwait.c              | 4 ++--
 arch/x86/kernel/kvm.c                     | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
index c450e67cb0a4..4d617ee59377 100644
--- a/arch/x86/hyperv/hv_apic.c
+++ b/arch/x86/hyperv/hv_apic.c
@@ -75,10 +75,10 @@ static void hv_apic_write(u32 reg, u32 val)
 {
 	switch (reg) {
 	case APIC_EOI:
-		wrmsr(HV_X64_MSR_EOI, val, 0);
+		wrmsrq(HV_X64_MSR_EOI, val);
 		break;
 	case APIC_TASKPRI:
-		wrmsr(HV_X64_MSR_TPR, val, 0);
+		wrmsrq(HV_X64_MSR_TPR, val);
 		break;
 	default:
 		native_apic_mem_write(reg, val);
@@ -92,7 +92,7 @@ static void hv_apic_eoi_write(void)
 	if (hvp && (xchg(&hvp->apic_assist, 0) & 0x1))
 		return;
 
-	wrmsr(HV_X64_MSR_EOI, APIC_EOI_ACK, 0);
+	wrmsrq(HV_X64_MSR_EOI, APIC_EOI_ACK);
 }
 
 static bool cpu_is_self(int cpu)
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 0174dd548327..68e10e30fe9b 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -209,7 +209,7 @@ static inline void native_apic_msr_write(u32 reg, u32 v)
 	    reg == APIC_LVR)
 		return;
 
-	wrmsr(APIC_BASE_MSR + (reg >> 4), v, 0);
+	wrmsrq(APIC_BASE_MSR + (reg >> 4), v);
 }
 
 static inline void native_apic_msr_eoi(void)
diff --git a/arch/x86/include/asm/switch_to.h b/arch/x86/include/asm/switch_to.h
index 4f21df7af715..499b1c15cc8b 100644
--- a/arch/x86/include/asm/switch_to.h
+++ b/arch/x86/include/asm/switch_to.h
@@ -61,7 +61,7 @@ static inline void refresh_sysenter_cs(struct thread_struct *thread)
 		return;
 
 	this_cpu_write(cpu_tss_rw.x86_tss.ss1, thread->sysenter_cs);
-	wrmsr(MSR_IA32_SYSENTER_CS, thread->sysenter_cs, 0);
+	wrmsrq(MSR_IA32_SYSENTER_CS, thread->sysenter_cs);
 }
 #endif
 
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 0bbe79862aa6..5e28ec2fe4e8 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1200,7 +1200,7 @@ void amd_set_dr_addr_mask(unsigned long mask, unsigned int dr)
 	if (per_cpu(amd_dr_addr_mask, cpu)[dr] == mask)
 		return;
 
-	wrmsr(amd_msr_dr_addr_masks[dr], mask, 0);
+	wrmsrq(amd_msr_dr_addr_masks[dr], mask);
 	per_cpu(amd_dr_addr_mask, cpu)[dr] = mask;
 }
 
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index cefc99990bde..ef9751d577c3 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1982,9 +1982,9 @@ void enable_sep_cpu(void)
 	 */
 
 	tss->x86_tss.ss1 = __KERNEL_CS;
-	wrmsr(MSR_IA32_SYSENTER_CS, tss->x86_tss.ss1, 0);
-	wrmsr(MSR_IA32_SYSENTER_ESP, (unsigned long)(cpu_entry_stack(cpu) + 1), 0);
-	wrmsr(MSR_IA32_SYSENTER_EIP, (unsigned long)entry_SYSENTER_32, 0);
+	wrmsrq(MSR_IA32_SYSENTER_CS, tss->x86_tss.ss1);
+	wrmsrq(MSR_IA32_SYSENTER_ESP, (unsigned long)(cpu_entry_stack(cpu) + 1));
+	wrmsrq(MSR_IA32_SYSENTER_EIP, (unsigned long)entry_SYSENTER_32);
 
 	put_cpu();
 }
@@ -2198,7 +2198,7 @@ static inline void setup_getcpu(int cpu)
 	struct desc_struct d = { };
 
 	if (boot_cpu_has(X86_FEATURE_RDTSCP) || boot_cpu_has(X86_FEATURE_RDPID))
-		wrmsr(MSR_TSC_AUX, cpudata, 0);
+		wrmsrq(MSR_TSC_AUX, cpudata);
 
 	/* Store CPU and node number in limit. */
 	d.limit0 = cpudata;
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 324bd4919300..1190c48a16b2 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -905,7 +905,7 @@ int resctrl_arch_measure_cycles_lat_fn(void *_plr)
 	 * Disable hardware prefetchers.
 	 */
 	rdmsr(MSR_MISC_FEATURE_CONTROL, saved_low, saved_high);
-	wrmsr(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits, 0x0);
+	wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
 	mem_r = READ_ONCE(plr->kmem);
 	/*
 	 * Dummy execute of the time measurement to load the needed
@@ -1001,7 +1001,7 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * Disable hardware prefetchers.
 	 */
 	rdmsr(MSR_MISC_FEATURE_CONTROL, saved_low, saved_high);
-	wrmsr(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits, 0x0);
+	wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
 
 	/* Initialize rest of local variables */
 	/*
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 26f4d820ee6e..2ec6d7d843c5 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1707,7 +1707,7 @@ void resctrl_arch_mon_event_config_write(void *_config_info)
 		pr_warn_once("Invalid event id %d\n", config_info->evtid);
 		return;
 	}
-	wrmsr(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config, 0);
+	wrmsrq(MSR_IA32_EVT_CFG_BASE + index, config_info->mon_config);
 }
 
 static void mbm_config_write_domain(struct rdt_resource *r,
diff --git a/arch/x86/kernel/cpu/umwait.c b/arch/x86/kernel/cpu/umwait.c
index 0050eae153bb..933fcd7ff250 100644
--- a/arch/x86/kernel/cpu/umwait.c
+++ b/arch/x86/kernel/cpu/umwait.c
@@ -33,7 +33,7 @@ static DEFINE_MUTEX(umwait_lock);
 static void umwait_update_control_msr(void * unused)
 {
 	lockdep_assert_irqs_disabled();
-	wrmsr(MSR_IA32_UMWAIT_CONTROL, READ_ONCE(umwait_control_cached), 0);
+	wrmsrq(MSR_IA32_UMWAIT_CONTROL, READ_ONCE(umwait_control_cached));
 }
 
 /*
@@ -71,7 +71,7 @@ static int umwait_cpu_offline(unsigned int cpu)
 	 * the original control MSR value in umwait_init(). So there
 	 * is no race condition here.
 	 */
-	wrmsr(MSR_IA32_UMWAIT_CONTROL, orig_umwait_control_cached, 0);
+	wrmsrq(MSR_IA32_UMWAIT_CONTROL, orig_umwait_control_cached);
 
 	return 0;
 }
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 44a45df7200a..bc9d21d7395f 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -399,7 +399,7 @@ static void kvm_disable_steal_time(void)
 	if (!has_steal_clock)
 		return;
 
-	wrmsr(MSR_KVM_STEAL_TIME, 0, 0);
+	wrmsrq(MSR_KVM_STEAL_TIME, 0);
 }
 
 static u64 kvm_steal_clock(int cpu)
-- 
2.49.0


