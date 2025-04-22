Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C2A960FF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961791.1353223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78uj-0007jY-1v; Tue, 22 Apr 2025 08:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961791.1353223; Tue, 22 Apr 2025 08:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ui-0007OH-2r; Tue, 22 Apr 2025 08:23:32 +0000
Received: by outflank-mailman (input) for mailman id 961791;
 Tue, 22 Apr 2025 08:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ud-0004wX-H1
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:27 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c0e4951-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:20 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9P1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:42 -0700
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
X-Inumbo-ID: 0c0e4951-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9P1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310164;
	bh=DiJ//ZCDdr9jGcfbSpj9Ofv6WJfHxK1CVTdlWhlF0ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=awo00TyT4cngwFyInD7AfuKbrTVw6bBZi3n6QyYwm0hfsJ7d5DOK6ryUYZ3uscVVA
	 FF+/ZckvDC7vJBMN9CfhH0oB+rd6uUZellPGM3U8hSIrlyK6PBfkibWxmrGRbllYd1
	 mE2ZFVrjThdSNLdX6irdbeka6A0ak4pjCNrLUx38kXIvxj25yQ4iJCUhdh/khFEnXG
	 zYoEbXMPDWF9GI7E0m8RnYVRjYYkqS5swH1ZyZ2jVOmguT3He0hBROzSc2OnEczHY3
	 OzNunzBKTcjX5LDne8JZTMzyp65l9t4ZqXugbpDnuQ/AfCTDwojG2MrD7a94yT3wHk
	 joHUW+H9AE6gw==
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
Subject: [RFC PATCH v2 11/34] x86/msr: Remove calling native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
Date: Tue, 22 Apr 2025 01:21:52 -0700
Message-ID: <20250422082216.1954310-12-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
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
 arch/x86/xen/enlighten_pv.c |  6 +++++-
 arch/x86/xen/pmu.c          | 27 ++++-----------------------
 arch/x86/xen/xen-ops.h      |  4 ++--
 3 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9fbe187aff00..1418758b57ff 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
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
+		if (!pmu_msr_write(msr, val)) {
 			if (err)
 				*err = native_write_msr_safe(msr, low, high);
 			else
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 9c1682af620a..95caae97a394 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -313,37 +313,18 @@ static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
 	return true;
 }
 
-bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err)
+bool pmu_msr_read(u32 msr, u64 *val)
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
+bool pmu_msr_write(u32 msr, u64 val)
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
index dc886c3cc24d..a1875e10be31 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -271,8 +271,8 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
-bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
+bool pmu_msr_read(u32 msr, u64 *val);
+bool pmu_msr_write(u32 msr, u64 val);
 int pmu_apic_update(uint32_t reg);
 u64 xen_read_pmc(int counter);
 
-- 
2.49.0


