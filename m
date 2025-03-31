Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFBA76173
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931994.1334198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARC-0002P2-Ku; Mon, 31 Mar 2025 08:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931994.1334198; Mon, 31 Mar 2025 08:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARC-0002MW-HJ; Mon, 31 Mar 2025 08:24:06 +0000
Received: by outflank-mailman (input) for mailman id 931994;
 Mon, 31 Mar 2025 08:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARB-0001u1-0I
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:05 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe7f62e-0e09-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:24:02 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp013171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:00 -0700
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
X-Inumbo-ID: 7fe7f62e-0e09-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp013171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409382;
	bh=8NBvcv0ohTWU39bJ6aL9yuUsmviH/IXJjGBdBncqKAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DfikwSBtepDkTPWSndBbjw9sQVnN64z4KXbHHV4byiheN5oN3c8108HUHo0WlTHiO
	 fbuV4mKhMgYKnfiBPbYoVLpeAEW1C8xaUoDBQBJOqlka2Ux1zE5IQP96taH035GT/e
	 xjt8OpAXfqCNG5GQQNWIsO0juYtYQXHFy1GfDKPCFncm+WTFt1opnlrPH8zpyO5lys
	 AWQreJObo0N83zSyBr8Uut3butD6okD1jJ5CCQoAsoeWQqGbWx83aVOu3dhvPlDmYf
	 JoUzckPNpFkOLgLe6na+VCr251PNcWOk98ANs3QkFTe88p9rHaeel6kOYEiLGzsU7J
	 1iQD+J8vO7ZXg==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
        acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v1 01/15] x86/msr: Replace __wrmsr() with native_wrmsrl()
Date: Mon, 31 Mar 2025 01:22:37 -0700
Message-ID: <20250331082251.3171276-2-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__wrmsr() is the lowest level primitive MSR write API, and its direct
use is NOT preferred.  Use its wrapper function native_wrmsrl() instead.

No functional change intended.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/events/amd/brs.c                 | 2 +-
 arch/x86/include/asm/apic.h               | 2 +-
 arch/x86/include/asm/msr.h                | 6 ++++--
 arch/x86/kernel/cpu/mce/core.c            | 2 +-
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 6 +++---
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
index ec3427463382..4a47f3c108de 100644
--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -44,7 +44,7 @@ static inline unsigned int brs_to(int idx)
 static __always_inline void set_debug_extn_cfg(u64 val)
 {
 	/* bits[4:3] must always be set to 11b */
-	__wrmsr(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
+	native_wrmsrl(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);
 }
 
 static __always_inline u64 get_debug_extn_cfg(void)
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index c903d358405d..3345a819c859 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -214,7 +214,7 @@ static inline void native_apic_msr_write(u32 reg, u32 v)
 
 static inline void native_apic_msr_eoi(void)
 {
-	__wrmsr(APIC_BASE_MSR + (APIC_EOI >> 4), APIC_EOI_ACK, 0);
+	native_wrmsrl(APIC_BASE_MSR + (APIC_EOI >> 4), APIC_EOI_ACK);
 }
 
 static inline u32 native_apic_msr_read(u32 reg)
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 9397a319d165..27ea8793705d 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -144,10 +144,12 @@ static inline unsigned long long native_read_msr_safe(unsigned int msr,
 static inline void notrace
 native_write_msr(unsigned int msr, u32 low, u32 high)
 {
-	__wrmsr(msr, low, high);
+	u64 val = (u64)high << 32 | low;
+
+	native_wrmsrl(msr, val);
 
 	if (tracepoint_enabled(write_msr))
-		do_trace_write_msr(msr, ((u64)high << 32 | low), 0);
+		do_trace_write_msr(msr, val, 0);
 }
 
 /* Can be uninlined because referenced by paravirt */
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 1f14c3308b6b..0eaeaba12df2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1306,7 +1306,7 @@ static noinstr bool mce_check_crashing_cpu(void)
 		}
 
 		if (mcgstatus & MCG_STATUS_RIPV) {
-			__wrmsr(MSR_IA32_MCG_STATUS, 0, 0);
+			native_wrmsrl(MSR_IA32_MCG_STATUS, 0);
 			return true;
 		}
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 01fa7890b43f..55536120c8d1 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -481,7 +481,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * cache.
 	 */
 	saved_msr = __rdmsr(MSR_MISC_FEATURE_CONTROL);
-	__wrmsr(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits, 0x0);
+	native_wrmsrl(MSR_MISC_FEATURE_CONTROL, prefetch_disable_bits);
 	closid_p = this_cpu_read(pqr_state.cur_closid);
 	rmid_p = this_cpu_read(pqr_state.cur_rmid);
 	mem_r = plr->kmem;
@@ -493,7 +493,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * pseudo-locked followed by reading of kernel memory to load it
 	 * into the cache.
 	 */
-	__wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
+	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)plr->closid << 32 | rmid_p);
 
 	/*
 	 * Cache was flushed earlier. Now access kernel memory to read it
@@ -530,7 +530,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
 	 * Critical section end: restore closid with capacity bitmask that
 	 * does not overlap with pseudo-locked region.
 	 */
-	__wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
+	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);
 
 	/* Re-enable the hardware prefetcher(s) */
 	wrmsrl(MSR_MISC_FEATURE_CONTROL, saved_msr);
-- 
2.49.0


