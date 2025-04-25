Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA4A9C11C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967314.1357148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWz-0003DK-RT; Fri, 25 Apr 2025 08:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967314.1357148; Fri, 25 Apr 2025 08:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EWz-00035u-Jj; Fri, 25 Apr 2025 08:35:33 +0000
Received: by outflank-mailman (input) for mailman id 967314;
 Fri, 25 Apr 2025 08:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EWy-0002sz-9j
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:32 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38807414-21b0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:35:20 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5U2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:34:59 -0700
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
X-Inumbo-ID: 38807414-21b0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5U2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570101;
	bh=9LPiQNEsSgyXuY3TdJWu1S/JZqK6CgIYEh3wNKfcnqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtTy3lTZvcUVKuxblDw/9pQnMdDCCPzsj+em2YmbG06S63s8kvmLbWeIgADvpTxVL
	 gUfohRsmah0vJatqonhkjw3ZtvHh4iPAqTKO/v6a4oNngW7ek2u/o/ITTKsxUpnGOB
	 BNU8depWSYMORZ6O4ou8cgCF7Ulk0gf3vCPnFUmA+ACFuvYZS3BNRhz32q6+wmEw2n
	 lLRBuJiD3Y5+OCA4814z7RT6rHKgIll+/J0OpGtYfmbFIm5nYHlpP1UwCE+ECMTsCb
	 sDvB45B6CnI3T6KydDeDgjjaOcr2xEZ7xVPZNmVlXI+mBExVzQtFCo/NzTUJDL/fNO
	 AhvQe69UUJ1jg==
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
Subject: [PATCH v3 06/14] x86/msr: Convert __wrmsr() uses to native_wrmsr{,q}() uses
Date: Fri, 25 Apr 2025 01:34:29 -0700
Message-ID: <20250425083442.2390017-7-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__wrmsr() is the lowest level MSR write API, with native_wrmsr()
and native_wrmsrq() serving as higher-level wrappers around it:

  #define native_wrmsr(msr, low, high)                    \
          __wrmsr(msr, low, high)

  #define native_wrmsrl(msr, val)                         \
          __wrmsr((msr), (u32)((u64)(val)),               \
                         (u32)((u64)(val) >> 32))

However, __wrmsr() continues to be utilized in various locations.

MSR APIs are designed for different scenarios, such as native or
pvops, with or without trace, and safe or non-safe.  Unfortunately,
the current MSR API names do not adequately reflect these factors,
making it challenging to select the most appropriate API for
various situations.

To pave the way for improving MSR API names, convert __wrmsr()
uses to native_wrmsr{,q}() to ensure consistent usage.  Later,
these APIs can be renamed to better reflect their implications,
such as native or pvops, with or without trace, and safe or
non-safe.

No functional change intended.

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
index 73d44081e597..82a908125b20 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -144,10 +144,12 @@ static inline u64 native_read_msr_safe(u32 msr, int *err)
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
index 61d762555a79..6e5edd76086e 100644
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


