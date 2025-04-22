Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C831A961A8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961933.1353323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u792q-0000y5-88; Tue, 22 Apr 2025 08:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961933.1353323; Tue, 22 Apr 2025 08:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u792q-0000w3-5R; Tue, 22 Apr 2025 08:31:56 +0000
Received: by outflank-mailman (input) for mailman id 961933;
 Tue, 22 Apr 2025 08:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78vA-0004wX-Nq
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:24:00 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1106b8-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:44 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9k1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:26 -0700
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
X-Inumbo-ID: 1a1106b8-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9k1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310207;
	bh=RsMt57mlaVk9CocrxjydLh4eE9MOuCS2P68NuQfut0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KfOau+bNZ/tY6KfWMZGNcMxqK1rglE1wkeTuZolxBRhAickqGvWKN/4Qz9B2mmuIl
	 oDw6BUhQMWrY3r31kLQPr8RGOOK8cTYW2QNw2b+TEbZi/tWFs5DlaKiKWVjJEV3bGW
	 wl3qqGp4z5D6tJ7OOmN6yeKxXJzggCTzeNwMfC/dA7ESam0+T6sxHCsX50uhF54bxD
	 HkHgd2xOgyQRa/LcauymKkTW/1LS+6P1DhPyORguEzAyNoN+DEZ+6Xw5/xIQDR/ldR
	 RvnM1+AxAR+4uk/vjBOgTRs8JOEl8GDXbY9oZ9+HCOdGf2CGGSi1yBlqpHC/R8fIIc
	 VCxpAQ46OhJbA==
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
Subject: [RFC PATCH v2 32/34] x86/msr: Rename native_read_msr_safe() to native_rdmsrq_safe()
Date: Tue, 22 Apr 2025 01:22:13 -0700
Message-ID: <20250422082216.1954310-33-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h |  4 ++--
 arch/x86/kvm/svm/svm.c     | 10 +++++-----
 arch/x86/xen/pmu.c         |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 4c7aa9e7fbac..b4447ba4d6c2 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -157,7 +157,7 @@ static __always_inline bool is_msr_imm_insn(void *ip)
  *                         __native_rdmsrq()   -----------------------
  *                            /     \                                |
  *                           /       \                               |
- *        native_rdmsrq_no_trace()    native_read_msr_safe()         |
+ *        native_rdmsrq_no_trace()    native_rdmsrq_safe()           |
  *                   /      \                                        |
  *                  /        \                                       |
  * native_rdmsr_no_trace()    native_rdmsrq()                        |
@@ -273,7 +273,7 @@ static inline u64 native_rdmsrq(u32 msr)
 	return val;
 }
 
-static inline int native_read_msr_safe(u32 msr, u64 *val)
+static inline int native_rdmsrq_safe(u32 msr, u64 *val)
 {
 	int err;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 01dd3cd20730..251fd9366b35 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -481,7 +481,7 @@ static void svm_init_erratum_383(void)
 		return;
 
 	/* Use _safe variants to not break nested virtualization */
-	if (native_read_msr_safe(MSR_AMD64_DC_CFG, &val))
+	if (native_rdmsrq_safe(MSR_AMD64_DC_CFG, &val))
 		return;
 
 	val |= (1ULL << 47);
@@ -649,9 +649,9 @@ static int svm_enable_virtualization_cpu(void)
 		u64 len, status = 0;
 		int err;
 
-		err = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &len);
+		err = native_rdmsrq_safe(MSR_AMD64_OSVW_ID_LENGTH, &len);
 		if (!err)
-			err = native_read_msr_safe(MSR_AMD64_OSVW_STATUS, &status);
+			err = native_rdmsrq_safe(MSR_AMD64_OSVW_STATUS, &status);
 
 		if (err)
 			osvw_status = osvw_len = 0;
@@ -2148,7 +2148,7 @@ static bool is_erratum_383(void)
 	if (!erratum_383_found)
 		return false;
 
-	if (native_read_msr_safe(MSR_IA32_MC0_STATUS, &value))
+	if (native_rdmsrq_safe(MSR_IA32_MC0_STATUS, &value))
 		return false;
 
 	/* Bit 62 may or may not be set for this mce */
@@ -2161,7 +2161,7 @@ static bool is_erratum_383(void)
 	for (i = 0; i < 6; ++i)
 		native_wrmsrq_safe(MSR_IA32_MCx_STATUS(i), 0);
 
-	if (!native_read_msr_safe(MSR_IA32_MCG_STATUS, &value)) {
+	if (!native_rdmsrq_safe(MSR_IA32_MCG_STATUS, &value)) {
 		value &= ~(1ULL << 2);
 		native_wrmsrq_safe(MSR_IA32_MCG_STATUS, value);
 	}
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index ee908dfcff48..66d2c6fc7bfa 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -323,7 +323,7 @@ static u64 xen_amd_read_pmc(int counter)
 		u64 val;
 
 		msr = amd_counters_base + (counter * amd_msr_step);
-		native_read_msr_safe(msr, &val);
+		native_rdmsrq_safe(msr, &val);
 		return val;
 	}
 
@@ -349,7 +349,7 @@ static u64 xen_intel_read_pmc(int counter)
 		else
 			msr = MSR_IA32_PERFCTR0 + counter;
 
-		native_read_msr_safe(msr, &val);
+		native_rdmsrq_safe(msr, &val);
 		return val;
 	}
 
-- 
2.49.0


