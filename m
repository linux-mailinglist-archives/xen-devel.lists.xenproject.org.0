Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA31A960FA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961785.1353176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ud-0006ZY-Lq; Tue, 22 Apr 2025 08:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961785.1353176; Tue, 22 Apr 2025 08:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ud-0006Ti-DZ; Tue, 22 Apr 2025 08:23:27 +0000
Received: by outflank-mailman (input) for mailman id 961785;
 Tue, 22 Apr 2025 08:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ua-0004wX-GP
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:24 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b64665d-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:19 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9Q1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:44 -0700
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
X-Inumbo-ID: 0b64665d-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9Q1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310167;
	bh=1VgQf4QInSDQLzZ+1XUhguUTrkXvawFaEvDB+uGxtVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxUOo6k2ygRA60Nwwh//GGmJ2Ha25YqcuuadFmBT9kb1B0PYfv6Aywtx1iVRLb9BX
	 Fj19RkC5hv8Sp/5xrXDu9u9ly5DcABPKX/vm0TRbuxcIZElbLl9gCac7HgrOAD88Tn
	 2pYSZ/+5KDeI4ZgydWimYqeKvfaOFnXYFTKuKkphpfKHP7Oxq5j7JldvtBkd7nq6BZ
	 t/NtOGh8DANYccVS0g5u+IJWleUBogtX3IuQR6ftaSD3LJp8UXHEPuFjDNC7EcRq10
	 df5RT52Kc7UjBWr8D24hnur7y8Zo5qGDf32z3E6BpdSccjOFnylRA2HEY5y5jIKf7W
	 fG4OSdCdfxxgw==
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
Subject: [RFC PATCH v2 12/34] x86/msr: Remove pmu_msr_{read,write}()
Date: Tue, 22 Apr 2025 01:21:53 -0700
Message-ID: <20250422082216.1954310-13-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As pmu_msr_{read,write}() are now wrappers of pmu_msr_chk_emulated(),
remove them and use pmu_msr_chk_emulated() directly.

While at it, convert the data type of MSR index to u32 in functions
called in pmu_msr_chk_emulated().

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/xen/enlighten_pv.c | 17 ++++++++++-------
 arch/x86/xen/pmu.c          | 24 ++++--------------------
 arch/x86/xen/xen-ops.h      |  3 +--
 3 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 1418758b57ff..b5a8bceb5f56 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1089,8 +1089,9 @@ static void xen_write_cr4(unsigned long cr4)
 static u64 xen_do_read_msr(unsigned int msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
+	bool emulated;
 
-	if (pmu_msr_read(msr, &val, err))
+	if (pmu_msr_chk_emulated(msr, &val, true, &emulated) && emulated)
 		return val;
 
 	if (err)
@@ -1133,6 +1134,7 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 			     unsigned int high, int *err)
 {
 	u64 val;
+	bool emulated;
 
 	switch (msr) {
 	case MSR_FS_BASE:
@@ -1162,12 +1164,13 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 	default:
 		val = (u64)high << 32 | low;
 
-		if (!pmu_msr_write(msr, val)) {
-			if (err)
-				*err = native_write_msr_safe(msr, low, high);
-			else
-				native_write_msr(msr, low, high);
-		}
+		if (pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated)
+			return;
+
+		if (err)
+			*err = native_write_msr_safe(msr, low, high);
+		else
+			native_write_msr(msr, low, high);
 	}
 }
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 95caae97a394..afb02f43ee3f 100644
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
 
-bool pmu_msr_read(u32 msr, u64 *val)
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
 static u64 xen_amd_read_pmc(int counter)
 {
 	struct xen_pmu_amd_ctxt *ctxt;
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index a1875e10be31..fde9f9d7415f 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -271,8 +271,7 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_read(u32 msr, u64 *val);
-bool pmu_msr_write(u32 msr, u64 val);
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read, bool *emul);
 int pmu_apic_update(uint32_t reg);
 u64 xen_read_pmc(int counter);
 
-- 
2.49.0


