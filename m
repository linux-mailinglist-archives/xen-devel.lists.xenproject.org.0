Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83367A9C124
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967320.1357206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX4-0004ZT-9m; Fri, 25 Apr 2025 08:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967320.1357206; Fri, 25 Apr 2025 08:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX3-0004QH-SZ; Fri, 25 Apr 2025 08:35:37 +0000
Received: by outflank-mailman (input) for mailman id 967320;
 Fri, 25 Apr 2025 08:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EX1-0002sy-Nh
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:35 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40efd850-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:35:34 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5Y2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:35:08 -0700
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
X-Inumbo-ID: 40efd850-21b0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5Y2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570110;
	bh=hZcF32qWuESh4ggtUZngdaMFRMTAW60ISVLqNJ/G40g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPho89N0GdJN3e3pjBsIA0ar8wp8OZKDdCb66UoC3mGT8GRM8ymWe0/7RRhoe1RGp
	 hi5oxD95MX+TAVMTmotvLVmRFlKMhlHBUZvxcrA3ibHc/S5Uptxz4WHL4WsbgQIJOF
	 eO+lFs8yVNoW+g5v3WExIjfj2qB66a4rYIxtSOq+BOn9czM9SpZJljr3uMsySsN52t
	 gnmi11rTDeSnKTc6rQtY9lpFo8shGTn0Dz3eMJHrLOzLw+xKsLlQV8fM6B8xPxM/j0
	 2HVHK3VkcGWFHWjWN6mE35i2sVAys6OTWDWh46qlOCEAMeQPlRv5TfTgefoh8L4zf7
	 tlW8jQbXAKYVw==
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
Subject: [PATCH v3 10/14] x86/xen/msr: Remove pmu_msr_{read,write}()
Date: Fri, 25 Apr 2025 01:34:33 -0700
Message-ID: <20250425083442.2390017-11-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As pmu_msr_{read,write}() are now wrappers of pmu_msr_chk_emulated(),
remove them and use pmu_msr_chk_emulated() directly.

As pmu_msr_chk_emulated() could easily return false in the cases where
it would set *emul to false, remove the "emul" argument and use the
return value instead.

While at it, convert the data type of MSR index to u32 in functions
called in pmu_msr_chk_emulated().

Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v3:
*) Remove the "emul" argument of pmu_msr_chk_emulated() (Juergen Gross).
---
 arch/x86/xen/enlighten_pv.c | 15 ++++++++-------
 arch/x86/xen/pmu.c          | 30 ++++++------------------------
 arch/x86/xen/xen-ops.h      |  3 +--
 3 files changed, 15 insertions(+), 33 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 61e51a970f3c..528a2f4df050 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1090,7 +1090,7 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
 
-	if (pmu_msr_read_emulated(msr, &val))
+	if (pmu_msr_chk_emulated(msr, &val, true))
 		return val;
 
 	if (err)
@@ -1162,12 +1162,13 @@ static void xen_do_write_msr(unsigned int msr, unsigned int low,
 	default:
 		val = (u64)high << 32 | low;
 
-		if (!pmu_msr_write_emulated(msr, val)) {
-			if (err)
-				*err = native_write_msr_safe(msr, low, high);
-			else
-				native_write_msr(msr, low, high);
-		}
+		if (pmu_msr_chk_emulated(msr, &val, false))
+			return;
+
+		if (err)
+			*err = native_write_msr_safe(msr, low, high);
+		else
+			native_write_msr(msr, low, high);
 	}
 }
 
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index b6557f2d1a2e..6bee83018694 100644
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
@@ -298,33 +297,16 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
 	return false;
 }
 
-static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
-				 bool *emul)
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read)
 {
 	int type, index = 0;
 
 	if (is_amd_pmu_msr(msr))
-		*emul = xen_amd_pmu_emulate(msr, val, is_read);
+		return xen_amd_pmu_emulate(msr, val, is_read);
 	else if (is_intel_pmu_msr(msr, &type, &index))
-		*emul = xen_intel_pmu_emulate(msr, val, type, index, is_read);
+		return xen_intel_pmu_emulate(msr, val, type, index, is_read);
 	else
 		return false;
-
-	return true;
-}
-
-bool pmu_msr_read_emulated(u32 msr, u64 *val)
-{
-	bool emulated;
-
-	return pmu_msr_chk_emulated(msr, val, true, &emulated) && emulated;
-}
-
-bool pmu_msr_write_emulated(u32 msr, u64 val)
-{
-	bool emulated;
-
-	return pmu_msr_chk_emulated(msr, &val, false, &emulated) && emulated;
 }
 
 static u64 xen_amd_read_pmc(int counter)
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 163e03e33089..fd7f845b83a3 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -274,8 +274,7 @@ void xen_pmu_finish(int cpu);
 static inline void xen_pmu_init(int cpu) {}
 static inline void xen_pmu_finish(int cpu) {}
 #endif
-bool pmu_msr_read_emulated(u32 msr, u64 *val);
-bool pmu_msr_write_emulated(u32 msr, u64 val);
+bool pmu_msr_chk_emulated(u32 msr, u64 *val, bool is_read);
 int pmu_apic_update(uint32_t reg);
 u64 xen_read_pmc(int counter);
 
-- 
2.49.0


