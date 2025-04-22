Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA7A9610C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961796.1353275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78us-0001Jd-AW; Tue, 22 Apr 2025 08:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961796.1353275; Tue, 22 Apr 2025 08:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ur-0000tH-2z; Tue, 22 Apr 2025 08:23:41 +0000
Received: by outflank-mailman (input) for mailman id 961796;
 Tue, 22 Apr 2025 08:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ug-0004wX-HT
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:30 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cbc136b-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:21 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9L1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:34 -0700
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
X-Inumbo-ID: 0cbc136b-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9L1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310156;
	bh=SmxUyQE70FAaQfnW45bmQwaH3mwMqOlVkW3bcWeB26U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iINnLEAJhcfm25VHl9BH+Xo0l16Q/sZPGlx7+WlqwP0ehPqqqkvu6yHy+O8PgHs+U
	 HfKtD70R5fYl6gfI4Aq77Ni0VspmRxRN8t/+ITP8PDqwROmTzqcDXDTKOUl0q52O/x
	 kNkqR3HxfpOlmjRDDomZzOrYqYYw57goThrvNGJJID8guCi8b7ijNhaYFxhN1wAMhF
	 L3BQU2gHq7JcftvX/oI1VX96HpWG/uYVG1kvop7kafKputBaothCF8urBXatakpG1d
	 lsmMt0d4XXmNk6/s+RcushWv8vPzSElNBFN11k4tscFnEQOF1BooWUiLW6lx3kHW43
	 sf5HDD0ajYtew==
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
        haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v2 07/34] x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
Date: Tue, 22 Apr 2025 01:21:48 -0700
Message-ID: <20250422082216.1954310-8-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__wrmsr() is the lowest level primitive MSR write API, and its direct
use is NOT preferred.  Use its wrapper function native_wrmsrq() instead.

No functional change intended.

This change also prepares for using the alternatives mechanism to access
MSRs: uses of native_wrmsr{,q}() don't need to change, but the approaches
how they perform MSR operations are binary patched during boot time upon
availability of MSR instructions.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v2:
* Use native_wrmsr() where natural [rmid_p, closid_p] high/lo parameters
  can be used, without the shift-uglification (Ingo).
---
 arch/x86/events/amd/brs.c                 | 2 +-
 arch/x86/include/asm/apic.h               | 2 +-
 arch/x86/include/asm/msr.h                | 6 ++++--
 arch/x86/kernel/cpu/mce/core.c            | 2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 6 +++---
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index ec4e8a4cace4..3f5ecfd80d1e 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -44,7 +44,7 @@ static inline unsigned int brs_to(int idx)
 static __always_inline void set_debug_extn_cfg(u64 val)
 {
 	/* bits[4:3] must always be set to 11b */
-	__wrmsr(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
+	native_wrmsrq(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);
 }
 
 static __always_inline u64 get_debug_extn_cfg(void)
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 1c136f54651c..0174dd548327 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -214,7 +214,7 @@ static inline void native_apic_msr_write(u32 reg, u32 v)
 
 static inline void native_apic_msr_eoi(void)
 {
-	__wrmsr(APIC_BASE_MSR + (APIC_EOI >> 4), APIC_EOI_ACK, 0);
+	native_wrmsrq(APIC_BASE_MSR + (APIC_EOI >> 4), APIC_EOI_ACK);
 }
 
 static inline u32 native_apic_msr_read(u32 reg)
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 33cf506e2fd6..b50cbd3299b3 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -149,10 +149,12 @@ static inline u64 native_read_msr_safe(u32 msr, int *err)
 static inline void notrace
 native_write_msr(u32 msr, u32 low, u32 high)
 {
-	__wrmsr(msr, low, high);
+	u64 val = (u64)high << 32 | low;
+
+	native_wrmsrq(msr, val);
 
 	if (tracepoint_enabled(write_msr))
-		do_trace_write_msr(msr, ((u64)high << 32 | low), 0);
+		do_trace_write_msr(msr, val, 0);
 }
 
 /* Can be uninlined because referenced by paravirt */
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 255927f0284e..1ae75ec7ac95 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1306,7 +1306,7 @@ static noinstr bool mce_check_crashing_cpu(void)
 		}
 
 		if (mcgstatus & MCG_STATUS_RIPV) {
-			__wrmsr(MSR_IA32_MCG_STATUS, 0, 0);
+			native_wrmsrq(MSR_IA32_MCG_STATUS, 0);
 			return true;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 276ffab194f6..9ab033d6856a 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -483,7 +483,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * cache.
 	 */
 	saved_msr = __rdmsr(MSR_MISC_FEATURE_CONTROL);
-	__wrmsr(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits, 0x0);
+	native_wrmsrq(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
 	closid_p = this_cpu_read(pqr_state.cur_closid);
 	rmid_p = this_cpu_read(pqr_state.cur_rmid);
 	mem_r = plr->kmem;
@@ -495,7 +495,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * pseudo-locked followed by reading of kernel memory to load it
 	 * into the cache.
 	 */
-	__wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
+	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
 
 	/*
 	 * Cache was flushed earlier. Now access kernel memory to read it
@@ -532,7 +532,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * Critical section end: restore closid with capacity bitmask that
 	 * does not overlap with pseudo-locked region.
 	 */
-	__wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
+	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
 
 	/* Re-enable the hardware prefetcher(s) */
 	wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);
-- 
2.49.0


