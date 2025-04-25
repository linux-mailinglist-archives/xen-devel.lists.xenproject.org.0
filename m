Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E521A9C123
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967318.1357191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX2-0004B5-Pc; Fri, 25 Apr 2025 08:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967318.1357191; Fri, 25 Apr 2025 08:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX2-00043U-Ca; Fri, 25 Apr 2025 08:35:36 +0000
Received: by outflank-mailman (input) for mailman id 967318;
 Fri, 25 Apr 2025 08:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EX0-0002sy-S8
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:34 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408609bf-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:34 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5X2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:35:06 -0700
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
X-Inumbo-ID: 408609bf-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5X2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570107;
	bh=FN/DKU8Mk2Q9Xof2Rumm+93wLI4a8v+UmrLXGE1N9mk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L78zoZAAN4f887y6qrYsRv1om8NzU+UWXr3Vc5HlTTSXUohwqXnXnQojJBw9b1s9T
	 h86xOvwIJB6Ua8meWZlAGHT+h0th53l96xPbayjpOKZ4DjyHxqkGpydO8o/0KivYn/
	 jdmHXS+sQqnMkJPFn7dB5i5Yyfy1DYtABR6j7h99DUMuLqt/k17vF2jb+38yQcRdEV
	 G9ngF24E4Kjj7fU2hIpR+Ghr6tgUOovBiIhQZcV+qhdz3Vedm6AWFYqyxgevLN4POO
	 UVTWdh/p6/hvKNjFY4TLjPK6aHrVKvmhjHc4zWe61CNbkTMmx2vkewcubTz2h2/90a
	 wIeCZ3lZzhmcw==
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
Subject: [PATCH v3 09/14] x86/xen/msr: Remove calling native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
Date: Fri, 25 Apr 2025 01:34:32 -0700
Message-ID: <20250425083442.2390017-10-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hpa found that pmu_msr_write() is actually a completely pointless
function [1]: all it does is shuffle some arguments, then calls
pmu_msr_chk_emulated() and if it returns true AND the emulated flag
is clear then does *exactly the same thing* that the calling code
would have done if pmu_msr_write() itself had returned true.  And
pmu_msr_read() does the equivalent stupidity.

Remove the calls to native_{read,write}_msr{,_safe}() within
pmu_msr_{read,write}().  Instead reuse the existing calling code
that decides whether to call native_{read,write}_msr{,_safe}() based
on the return value from pmu_msr_{read,write}().  Consequently,
eliminate the need to pass an error pointer to pmu_msr_{read,write}().

While at it, refactor pmu_msr_write() to take the MSR value as a u64
argument, replacing the current dual u32 arguments, because the dual
u32 arguments were only used to call native_write_msr{,_safe}(), which
has now been removed.

[1]: https://lore.kernel.org/lkml/0ec48b84-d158-47c6-b14c-3563fd14bcc4@zytor.com/

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Sign-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v3:
*) Rename pmu_msr_{read,write}() to pmu_msr_{read,write}_emulated()
   (Dapeng Mi).
*) Fix a pmu_msr_read() callsite with wrong arguments (Dapeng Mi).
---
 arch/x86/xen/enlighten_pv.c |  8 ++++++--
 arch/x86/xen/pmu.c          | 27 ++++-----------------------
 arch/x86/xen/xen-ops.h      |  4 ++--
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 846b5737d320..61e51a970f3c 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1090,7 +1090,7 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
 
-	if (pmu_msr_read(msr, &val, err))
+	if (pmu_msr_read_emulated(msr, &val))
 		return val;
 
 	if (err)
@@ -1132,6 +1132,8 @@ static void set_seg(unsigned int which, unsigned int low, unsigned int high,
 static void xen_do_write_msr(unsigned int msr, unsigned int low,
 			     unsigned int high, int *err)
 {
+	u64 val;
+
 	switch (msr) {
 	case MSR_FS_BASE:
 		set_seg(SEGBASE_FS, low, high, err);
@@ -1158,7 +1160,9 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 		break;
 
 	default:
-		if (!pmu_msr_write(msr, low, high, err)) {
+		val = (u64)high << 32 | low;
+
+		if (!pmu_msr_write_emulated(msr, val)) {
 			if (err)
 				*err = native_write_msr_safe(msr, low, high);
 			else
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 9c1682af620a..b6557f2d1a2e 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -313,37 +313,18 @@ static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
 	return true;
 }
 
-bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
+bool pmu_msr_read_emulated(u32 msr, u64 *val)
 {
 	bool emulated;
 
-	if (!pmu_msr_chk_emulated(msr, val, true, &emulated))
-		return false;
-
-	if (!emulated) {
-		*val = err ? native_read_msr_safe(msr, err)
-			   : native_read_msr(msr);
-	}
-
-	return true;
+	return pmu_msr_chk_emulated(msr, val, true, &emulated) && emulated;
 }
 
-bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
+bool pmu_msr_write_emulated(u32 msr, u64 val)
 {
-	uint64_t val = ((uint64_t)high << 32) | low;
 	bool emulated;
 
-	if (!pmu_msr_chk_emulated(msr, &val, false, &emulated))
-		return false;
-
-	if (!emulated) {
-		if (err)
-			*err = native_write_msr_safe(msr, low, high);
-		else
-			native_write_msr(msr, low, high);
-	}
-
-	return true;
+	return pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated;
 }
 
 static u64 xen_amd_read_pmc(int counter)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 735f58780704..163e03e33089 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -274,8 +274,8 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
-bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
+bool pmu_msr_read_emulated(u32 msr, u64 *val);
+bool pmu_msr_write_emulated(u32 msr, u64 val);
 int pmu_apic_update(uint32_t reg);
 u64 xen_read_pmc(int counter);
 
-- 
2.49.0


