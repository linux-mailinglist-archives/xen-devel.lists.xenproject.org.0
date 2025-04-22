Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A0A961B9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961998.1353374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u793i-0003uD-Qs; Tue, 22 Apr 2025 08:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961998.1353374; Tue, 22 Apr 2025 08:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u793i-0003sT-NS; Tue, 22 Apr 2025 08:32:50 +0000
Received: by outflank-mailman (input) for mailman id 961998;
 Tue, 22 Apr 2025 08:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78vM-0004wX-Pr
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:24:12 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d376244-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:49 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9m1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:30 -0700
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
X-Inumbo-ID: 1d376244-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9m1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310212;
	bh=qnYCpm2Cl6ZIZ5hId3xkbPkJqqrZQFZfyOkhGDhffqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uc1b2MMHUkmSSWkI2MOrRUT6ZGc7p2OK1RO57VTRGzrFk3nJp7mExF9yRLqhXwrcN
	 BEEh5kJRgcNa0ORqLGKos3bgYft/LGNyer5Hj/VmrWBwEfN4bo5k4h7fYDJnj7l0iH
	 x3KPzP8Y8/4VNpO8JH9Yfwzhho87jdCmeXcBpjzy/qaN1+VLUT/st/KMk2S7jIMbTL
	 ErV/dz7vQ+VWICcFlhVd+X7D1ljAh8bI0Ed7Om76UDvHltu1oSI+3z4c9vWm1fO4pm
	 4dTYUhuIvfW4g6DD8/vRKD69Q3YVmGv0OG8qFORLYD4AB4LVkHungT3s69bi00Wvfu
	 KweyIKTZ9esZQ==
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
Subject: [RFC PATCH v2 34/34] x86/msr: Convert native_rdmsr_no_trace() uses to native_rdmsrq_no_trace() uses
Date: Tue, 22 Apr 2025 01:22:15 -0700
Message-ID: <20250422082216.1954310-35-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert native_rdmsr_no_trace() uses to native_rdmsrq_no_trace() uses
cleanly with the use of struct msr, and remove native_rdmsr_no_trace().

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/microcode.h      |  6 +++---
 arch/x86/include/asm/msr.h            | 13 +++----------
 arch/x86/kernel/cpu/microcode/amd.c   |  8 ++------
 arch/x86/kernel/cpu/microcode/core.c  |  4 ++--
 arch/x86/kernel/cpu/microcode/intel.c |  6 +++---
 5 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index d581fdaf1f36..1d9641349744 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -61,7 +61,7 @@ static inline int intel_microcode_get_datasize(struct microcode_header_intel *hd
 
 static inline u32 intel_get_microcode_revision(void)
 {
-	u32 rev, dummy;
+	struct msr val;
 
 	native_wrmsrq_no_trace(MSR_IA32_UCODE_REV, 0);
 
@@ -69,9 +69,9 @@ static inline u32 intel_get_microcode_revision(void)
 	native_cpuid_eax(1);
 
 	/* get the current revision from MSR 0x8B */
-	native_rdmsr_no_trace(MSR_IA32_UCODE_REV, dummy, rev);
+	val.q = native_rdmsrq_no_trace(MSR_IA32_UCODE_REV);
 
-	return rev;
+	return val.h;
 }
 #endif /* !CONFIG_CPU_SUP_INTEL */
 
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index be593a15a838..aebcd846af3e 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -141,9 +141,9 @@ static __always_inline bool is_msr_imm_insn(void *ip)
  *                            /     \                                |
  *                           /       \                               |
  *        native_rdmsrq_no_trace()    native_rdmsrq_safe()           |
- *                   /      \                                        |
- *                  /        \                                       |
- * native_rdmsr_no_trace()    native_rdmsrq()                        |
+ *               /                                                   |
+ *              /                                                    |
+ *      native_rdmsrq()                                              |
  *                                                                   |
  *                                                                   |
  *                                                                   |
@@ -239,13 +239,6 @@ static __always_inline u64 native_rdmsrq_no_trace(u32 msr)
 	return val;
 }
 
-#define native_rdmsr_no_trace(msr, low, high)		\
-do {							\
-	u64 __val = native_rdmsrq_no_trace(msr);	\
-	(void)((low) = (u32)__val);			\
-	(void)((high) = (u32)(__val >> 32));		\
-} while (0)
-
 static inline u64 native_rdmsrq(u32 msr)
 {
 	u64 val = native_rdmsrq_no_trace(msr);
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index f1f275ddab57..b4d66e79089c 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -254,11 +254,7 @@ static bool verify_sha256_digest(u32 patch_id, u32 cur_rev, const u8 *data, unsi
 
 static u32 get_patch_level(void)
 {
-	u32 rev, dummy __always_unused;
-
-	native_rdmsr_no_trace(MSR_AMD64_PATCH_LEVEL, rev, dummy);
-
-	return rev;
+	return native_rdmsrq_no_trace(MSR_AMD64_PATCH_LEVEL);
 }
 
 static union cpuid_1_eax ucode_rev_to_cpuid(unsigned int val)
@@ -835,7 +831,7 @@ static struct ucode_patch *find_patch(unsigned int cpu)
 
 void reload_ucode_amd(unsigned int cpu)
 {
-	u32 rev, dummy __always_unused;
+	u32 rev;
 	struct microcode_amd *mc;
 	struct ucode_patch *p;
 
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 9bda8fd987ab..81b264373d3e 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -81,10 +81,10 @@ struct early_load_data early_data;
  */
 static bool amd_check_current_patch_level(void)
 {
-	u32 lvl, dummy, i;
+	u32 lvl, i;
 	u32 *levels;
 
-	native_rdmsr_no_trace(MSR_AMD64_PATCH_LEVEL, lvl, dummy);
+	lvl = native_rdmsrq_no_trace(MSR_AMD64_PATCH_LEVEL);
 
 	levels = final_levels;
 
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index c0307b1ad63d..1b484214f3ee 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -75,11 +75,11 @@ void intel_collect_cpu_info(struct cpu_signature *sig)
 	sig->rev = intel_get_microcode_revision();
 
 	if (IFM(x86_family(sig->sig), x86_model(sig->sig)) >= INTEL_PENTIUM_III_DESCHUTES) {
-		unsigned int val[2];
+		struct msr val;
 
 		/* get processor flags from MSR 0x17 */
-		native_rdmsr_no_trace(MSR_IA32_PLATFORM_ID, val[0], val[1]);
-		sig->pf = 1 << ((val[1] >> 18) & 7);
+		val.q = native_rdmsrq_no_trace(MSR_IA32_PLATFORM_ID);
+		sig->pf = 1 << ((val.h >> 18) & 7);
 	}
 }
 EXPORT_SYMBOL_GPL(intel_collect_cpu_info);
-- 
2.49.0


