Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937BDA7617A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931996.1334218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARE-0002pw-Dm; Mon, 31 Mar 2025 08:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931996.1334218; Mon, 31 Mar 2025 08:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARE-0002n9-4E; Mon, 31 Mar 2025 08:24:08 +0000
Received: by outflank-mailman (input) for mailman id 931996;
 Mon, 31 Mar 2025 08:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARB-0001uf-Q5
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:05 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8073d595-0e09-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 10:24:03 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp073171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:12 -0700
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
X-Inumbo-ID: 8073d595-0e09-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp073171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409394;
	bh=4oMqi/mNiX/dP3yUNXOh0KHKk5eO4mtyZ/S9nY+rYCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVNNysVl8UKZVEUX8F7MbPFwX2epn0yrpmH2w+9q6c8158NF8qnthafY3Pkh8Ilxh
	 9M0ASaWQUpbHnDRwUDQa7VXHXLDjd40aeBCbAqUiExQtgZ+wsRgJSE1VkqGpirm+UR
	 5prXvLiFohME5Rh9uOv5Cw+cBYozzUd9b4kenjhMrVaaMr45h9Bi4/VNNbAxT8bv2/
	 Z8Dx3/k762OqkBR7GvNLYD2WZ0BEYXT78x4FpDvDc8rCAR5k7TIawz4/K3bBBGMueL
	 W/Wh/zFdQkonvF67LZZkVO833IcrPosTMqlS6T0maUanzmLHMlKbYhc9HxoZ+xAFPV
	 Y0GoucFLKizNQ==
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
Subject: [RFC PATCH v1 07/15] x86/msr: Remove pmu_msr_{read,write}()
Date: Mon, 31 Mar 2025 01:22:43 -0700
Message-ID: <20250331082251.3171276-8-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now pmu_msr_{read,write}() just do pmu_msr_chk_emulated(), so remove
them and call pmu_msr_chk_emulated() directly.

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/xen/enlighten_pv.c | 17 ++++++++++-------
 arch/x86/xen/pmu.c          | 24 ++++--------------------
 arch/x86/xen/xen-ops.h      |  3 +--
 3 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 7401cce19939..a047dadf4511 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1090,8 +1090,9 @@ static void xen_write_cr4(unsigned long cr4)
 static u64 xen_do_read_msr(unsigned int msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
+	bool emulated;
 
-	if (pmu_msr_read(msr, &val, err))
+	if (pmu_msr_chk_emulated(msr, &val, true, &emulated) && emulated)
 		return val;
 
 	if (err)
@@ -1134,6 +1135,7 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 			     unsigned int high, int *err)
 {
 	u64 val;
+	bool emulated;
 
 	switch (msr) {
 	case MSR_FS_BASE:
@@ -1163,12 +1165,13 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 	default:
 		val = (u64)high << 32 | low;
 
-		if (!pmu_msr_write(msr, val)) {
-			if (err)
-				*err = native_write_msr_safe(msr, val);
-			else
-				native_write_msr(msr, val);
-		}
+		if (pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated)
+			return;
+
+		if (err)
+			*err = native_write_msr_safe(msr, val);
+		else
+			native_write_msr(msr, val);
 	}
 }
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 1364cd3fb3ef..4d20503430dd 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -128,7 +128,7 @@ static inline uint32_t get_fam15h_addr(u32 addr)
 	return addr;
 }
 
-static inline bool is_amd_pmu_msr(unsigned int msr)
+static bool is_amd_pmu_msr(u32 msr)
 {
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
 	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
@@ -194,8 +194,7 @@ static bool is_intel_pmu_msr(u32 msr_index, int *type, int *index)
 	}
 }
 
-static bool xen_intel_pmu_emulate(unsigned int msr, u64 *val, int type,
-				  int index, bool is_read)
+static bool xen_intel_pmu_emulate(u32 msr, u64 *val, int type, int index, bool is_read)
 {
 	uint64_t *reg = NULL;
 	struct xen_pmu_intel_ctxt *ctxt;
@@ -257,7 +256,7 @@ static bool xen_intel_pmu_emulate(unsigned int msr, u64 *val, int type,
 	return false;
 }
 
-static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
+static bool xen_amd_pmu_emulate(u32 msr, u64 *val, bool is_read)
 {
 	uint64_t *reg = NULL;
 	int i, off = 0;
@@ -298,8 +297,7 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
 	return false;
 }
 
-static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
-				 bool *emul)
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read, bool *emul)
 {
 	int type, index = 0;
 
@@ -313,20 +311,6 @@ static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
 	return true;
 }
 
-bool pmu_msr_read(u32 msr, u64 *val, int *err)
-{
-	bool emulated;
-
-	return pmu_msr_chk_emulated(msr, val, true, &emulated) && emulated;
-}
-
-bool pmu_msr_write(u32 msr, u64 val)
-{
-	bool emulated;
-
-	return pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated;
-}
-
 static unsigned long long xen_amd_read_pmc(int counter)
 {
 	struct xen_pmu_amd_ctxt *ctxt;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 4a0a1d73d8b8..6545661010ce 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -274,8 +274,7 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_read(u32 msr, u64 *val, int *err);
-bool pmu_msr_write(u32 msr, u64 val);
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read, bool *emul);
 int pmu_apic_update(uint32_t reg);
 unsigned long long xen_read_pmc(int counter);
 
-- 
2.49.0


