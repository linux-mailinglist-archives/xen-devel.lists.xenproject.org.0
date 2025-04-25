Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D3A9C122
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967321.1357223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX6-00058E-4A; Fri, 25 Apr 2025 08:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967321.1357223; Fri, 25 Apr 2025 08:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX5-0004zE-TN; Fri, 25 Apr 2025 08:35:39 +0000
Received: by outflank-mailman (input) for mailman id 967321;
 Fri, 25 Apr 2025 08:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EX4-0002sz-BB
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:38 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b86dbb-21b0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:35:20 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5R2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:34:53 -0700
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
X-Inumbo-ID: 38b86dbb-21b0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5R2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570095;
	bh=nBz3GLFAwDoQVYhhWmv18m7tWTqjAgxiRsxoRTTSuK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4iHjAOsm7Qruo8uIbG+2IuASClPrN9hxKCkrfsx1aETMmREIUcXntywT7wBkuUwu
	 lt0Bxg1Y12NDCfA2HieEUq1WhbKx0df2GqsqLWC0ob1fOxi8WNCblWtZfESz0DitR1
	 nK5chIFy932DtseX4200GLG1ei+SJ8wY9mmRh5cBYNqKZ7rn4DLSsFoxQG/8Z311r0
	 iZn/ULykrenXKN++xbEhsqzLR+ARmf8G46JkGG6YVvM3gvk35IEvZHOadQRfRqZXM9
	 p4f5jYi4F9YqcuJz4Hv8c6FFGVnqcvDEs7TBLV/ESOagIOc84Zi1O9KpQaxy+IIjnm
	 FuIb8s9SqeeVw==
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
Subject: [PATCH v3 03/14] x86/msr: Rename rdpmcl() to rdpmc()
Date: Fri, 25 Apr 2025 01:34:26 -0700
Message-ID: <20250425083442.2390017-4-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that rdpmc() is gone, i.e. rdpmcl() is the sole PMC read helper,
simply rename rdpmcl() to rdpmc().

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---

Changes in v3:
*) Explain the reason of the renaming in the changelog (Dave Hansen).
*) Use shorter name rdpmc() instead of rdpmcq() as the name of the
   sole PMC read helper (Sean Christopherson).
---
 arch/x86/events/amd/uncore.c              |  2 +-
 arch/x86/events/core.c                    |  2 +-
 arch/x86/events/intel/core.c              |  4 ++--
 arch/x86/events/intel/ds.c                |  2 +-
 arch/x86/include/asm/msr.h                |  2 +-
 arch/x86/include/asm/paravirt.h           |  2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 12 ++++++------
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 2a3259df619a..42c833cf9d98 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -108,7 +108,7 @@ static void amd_uncore_read(struct perf_event *event)
 	if (hwc->event_base_rdpmc < 0)
 		rdmsrq(hwc->event_base, new);
 	else
-		rdpmcl(hwc->event_base_rdpmc, new);
+		rdpmc(hwc->event_base_rdpmc, new);
 
 	local64_set(&hwc->prev_count, new);
 	delta = (new << COUNTER_SHIFT) - (prev << COUNTER_SHIFT);
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 85b55c1dc162..ea618dd8a678 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -134,7 +134,7 @@ u64 x86_perf_event_update(struct perf_event *event)
 	 */
 	prev_raw_count = local64_read(&hwc->prev_count);
 	do {
-		rdpmcl(hwc->event_base_rdpmc, new_raw_count);
+		rdpmc(hwc->event_base_rdpmc, new_raw_count);
 	} while (!local64_try_cmpxchg(&hwc->prev_count,
 				      &prev_raw_count, new_raw_count));
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 394fa83b537b..8ac7a03ae4e9 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2724,12 +2724,12 @@ static u64 intel_update_topdown_event(struct perf_event *event, int metric_end,
 
 	if (!val) {
 		/* read Fixed counter 3 */
-		rdpmcl((3 | INTEL_PMC_FIXED_RDPMC_BASE), slots);
+		rdpmc((3 | INTEL_PMC_FIXED_RDPMC_BASE), slots);
 		if (!slots)
 			return 0;
 
 		/* read PERF_METRICS */
-		rdpmcl(INTEL_PMC_FIXED_RDPMC_METRICS, metrics);
+		rdpmc(INTEL_PMC_FIXED_RDPMC_METRICS, metrics);
 	} else {
 		slots = val[0];
 		metrics = val[1];
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 410a8975d1b9..be05e93b48e7 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2274,7 +2274,7 @@ intel_pmu_save_and_restart_reload(struct perf_event *event, int count)
 	WARN_ON(this_cpu_read(cpu_hw_events.enabled));
 
 	prev_raw_count = local64_read(&hwc->prev_count);
-	rdpmcl(hwc->event_base_rdpmc, new_raw_count);
+	rdpmc(hwc->event_base_rdpmc, new_raw_count);
 	local64_set(&hwc->prev_count, new_raw_count);
 
 	/*
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index e05466e486fc..ae96d35e0621 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -234,7 +234,7 @@ static inline int rdmsrq_safe(u32 msr, u64 *p)
 	return err;
 }
 
-#define rdpmcl(counter, val) ((val) = native_read_pmc(counter))
+#define rdpmc(counter, val) ((val) = native_read_pmc(counter))
 
 #endif	/* !CONFIG_PARAVIRT_XXL */
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index c4dedb984735..faa0713553b1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -244,7 +244,7 @@ static inline u64 paravirt_read_pmc(int counter)
 	return PVOP_CALL1(u64, cpu.read_pmc, counter);
 }
 
-#define rdpmcl(counter, val) ((val) = paravirt_read_pmc(counter))
+#define rdpmc(counter, val) ((val) = paravirt_read_pmc(counter))
 
 static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
 {
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 26c354bdea07..15ff62d83bd8 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -1019,8 +1019,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * used in L1 cache, second to capture accurate value that does not
 	 * include cache misses incurred because of instruction loads.
 	 */
-	rdpmcl(hit_pmcnum, hits_before);
-	rdpmcl(miss_pmcnum, miss_before);
+	rdpmc(hit_pmcnum, hits_before);
+	rdpmc(miss_pmcnum, miss_before);
 	/*
 	 * From SDM: Performing back-to-back fast reads are not guaranteed
 	 * to be monotonic.
@@ -1028,8 +1028,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * before proceeding.
 	 */
 	rmb();
-	rdpmcl(hit_pmcnum, hits_before);
-	rdpmcl(miss_pmcnum, miss_before);
+	rdpmc(hit_pmcnum, hits_before);
+	rdpmc(miss_pmcnum, miss_before);
 	/*
 	 * Use LFENCE to ensure all previous instructions are retired
 	 * before proceeding.
@@ -1051,8 +1051,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * before proceeding.
 	 */
 	rmb();
-	rdpmcl(hit_pmcnum, hits_after);
-	rdpmcl(miss_pmcnum, miss_after);
+	rdpmc(hit_pmcnum, hits_after);
+	rdpmc(miss_pmcnum, miss_after);
 	/*
 	 * Use LFENCE to ensure all previous instructions are retired
 	 * before proceeding.
-- 
2.49.0


