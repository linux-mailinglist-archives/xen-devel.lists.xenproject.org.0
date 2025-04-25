Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11666A9C121
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967315.1357156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX0-0003HD-5f; Fri, 25 Apr 2025 08:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967315.1357156; Fri, 25 Apr 2025 08:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWz-0003DD-Rw; Fri, 25 Apr 2025 08:35:33 +0000
Received: by outflank-mailman (input) for mailman id 967315;
 Fri, 25 Apr 2025 08:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EWy-0002sy-My
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:32 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7e577e-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:27 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5S2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:34:55 -0700
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
X-Inumbo-ID: 3c7e577e-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5S2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570097;
	bh=ubV3mxjb0pTABxeIf2EwXNL4ptnwNX7V+DrJijW3VC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6ykqhIW5txRLYZYcwQ42AvATqG8/xptzO4imIXAdEWMalWy8M3glva32nGrtHFei
	 /gddxrxOgYkWsZPqUTIOJB8fVcRs87dV1EYsgGms4d1AT1hJXOnUELWuX6EZmYis/C
	 RrF79OsPNKYQGXYtJ0+NXOxxQFb2mJWjrqo3spKq+zLzZ6F3FBTuEApP1qK7t3erln
	 1xVgD0alMjSlqAP4c4CuGpPQcPiPoaZe0p3Pibky5/UWjvZOzZSch7ann3MW9QUXc2
	 uf3MCVYJWYwCuA/ksmn2VQvV8q1rdBJnM1x7JxX6Ac6qWnwFJeisgLXSXxBQytavQw
	 IDmwLyJ4IdHng==
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
Subject: [PATCH v3 04/14] x86/msr: Convert the rdpmc() macro into an always inline function
Date: Fri, 25 Apr 2025 01:34:27 -0700
Message-ID: <20250425083442.2390017-5-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions offer type safety and better readability compared to macros.
Additionally, always inline functions can match the performance of
macros.  Converting the rdpmc() macro into an always inline function
is simple and straightforward, so just make the change.

Moreover, the read result is now the returned value, further enhancing
readability.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---

Change in v3:
*) Add a changelog even it's obvious (Dave Hansen).
---
 arch/x86/events/amd/uncore.c              |  2 +-
 arch/x86/events/core.c                    |  2 +-
 arch/x86/events/intel/core.c              |  4 ++--
 arch/x86/events/intel/ds.c                |  2 +-
 arch/x86/include/asm/msr.h                |  5 ++++-
 arch/x86/include/asm/paravirt.h           |  4 +---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 12 ++++++------
 7 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index 42c833cf9d98..13c4cea545c5 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -108,7 +108,7 @@ static void amd_uncore_read(struct perf_event *event)
 	if (hwc->event_base_rdpmc < 0)
 		rdmsrq(hwc->event_base, new);
 	else
-		rdpmc(hwc->event_base_rdpmc, new);
+		new = rdpmc(hwc->event_base_rdpmc);
 
 	local64_set(&hwc->prev_count, new);
 	delta = (new << COUNTER_SHIFT) - (prev << COUNTER_SHIFT);
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index ea618dd8a678..d8634446684e 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -134,7 +134,7 @@ u64 x86_perf_event_update(struct perf_event *event)
 	 */
 	prev_raw_count = local64_read(&hwc->prev_count);
 	do {
-		rdpmc(hwc->event_base_rdpmc, new_raw_count);
+		new_raw_count = rdpmc(hwc->event_base_rdpmc);
 	} while (!local64_try_cmpxchg(&hwc->prev_count,
 				      &prev_raw_count, new_raw_count));
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 8ac7a03ae4e9..9fa94b6e4e74 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2724,12 +2724,12 @@ static u64 intel_update_topdown_event(struct perf_event *event, int metric_end,
 
 	if (!val) {
 		/* read Fixed counter 3 */
-		rdpmc((3 | INTEL_PMC_FIXED_RDPMC_BASE), slots);
+		slots = rdpmc(3 | INTEL_PMC_FIXED_RDPMC_BASE);
 		if (!slots)
 			return 0;
 
 		/* read PERF_METRICS */
-		rdpmc(INTEL_PMC_FIXED_RDPMC_METRICS, metrics);
+		metrics = rdpmc(INTEL_PMC_FIXED_RDPMC_METRICS);
 	} else {
 		slots = val[0];
 		metrics = val[1];
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index be05e93b48e7..a093cb485278 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2274,7 +2274,7 @@ intel_pmu_save_and_restart_reload(struct perf_event *event, int count)
 	WARN_ON(this_cpu_read(cpu_hw_events.enabled));
 
 	prev_raw_count = local64_read(&hwc->prev_count);
-	rdpmc(hwc->event_base_rdpmc, new_raw_count);
+	new_raw_count = rdpmc(hwc->event_base_rdpmc);
 	local64_set(&hwc->prev_count, new_raw_count);
 
 	/*
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index ae96d35e0621..73d44081e597 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -234,7 +234,10 @@ static inline int rdmsrq_safe(u32 msr, u64 *p)
 	return err;
 }
 
-#define rdpmc(counter, val) ((val) = native_read_pmc(counter))
+static __always_inline u64 rdpmc(int counter)
+{
+	return native_read_pmc(counter);
+}
 
 #endif	/* !CONFIG_PARAVIRT_XXL */
 
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index faa0713553b1..f272c4bd3d5b 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -239,13 +239,11 @@ static inline int rdmsrq_safe(unsigned msr, u64 *p)
 	return err;
 }
 
-static inline u64 paravirt_read_pmc(int counter)
+static __always_inline u64 rdpmc(int counter)
 {
 	return PVOP_CALL1(u64, cpu.read_pmc, counter);
 }
 
-#define rdpmc(counter, val) ((val) = paravirt_read_pmc(counter))
-
 static inline void paravirt_alloc_ldt(struct desc_struct *ldt, unsigned entries)
 {
 	PVOP_VCALL2(cpu.alloc_ldt, ldt, entries);
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 15ff62d83bd8..61d762555a79 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -1019,8 +1019,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * used in L1 cache, second to capture accurate value that does not
 	 * include cache misses incurred because of instruction loads.
 	 */
-	rdpmc(hit_pmcnum, hits_before);
-	rdpmc(miss_pmcnum, miss_before);
+	hits_before = rdpmc(hit_pmcnum);
+	miss_before = rdpmc(miss_pmcnum);
 	/*
 	 * From SDM: Performing back-to-back fast reads are not guaranteed
 	 * to be monotonic.
@@ -1028,8 +1028,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * before proceeding.
 	 */
 	rmb();
-	rdpmc(hit_pmcnum, hits_before);
-	rdpmc(miss_pmcnum, miss_before);
+	hits_before = rdpmc(hit_pmcnum);
+	miss_before = rdpmc(miss_pmcnum);
 	/*
 	 * Use LFENCE to ensure all previous instructions are retired
 	 * before proceeding.
@@ -1051,8 +1051,8 @@ static int measure_residency_fn(struct perf_event_attr *miss_attr,
 	 * before proceeding.
 	 */
 	rmb();
-	rdpmc(hit_pmcnum, hits_after);
-	rdpmc(miss_pmcnum, miss_after);
+	hits_after = rdpmc(hit_pmcnum);
+	miss_after = rdpmc(miss_pmcnum);
 	/*
 	 * Use LFENCE to ensure all previous instructions are retired
 	 * before proceeding.
-- 
2.49.0


