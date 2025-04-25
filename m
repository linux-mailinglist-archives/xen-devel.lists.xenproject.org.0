Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D7A9C125
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967317.1357186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX2-00043s-BQ; Fri, 25 Apr 2025 08:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967317.1357186; Fri, 25 Apr 2025 08:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EX1-0003vY-WA; Fri, 25 Apr 2025 08:35:35 +0000
Received: by outflank-mailman (input) for mailman id 967317;
 Fri, 25 Apr 2025 08:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tuhi=XL=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8EWz-0002sz-Uf
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:35:33 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3afbb387-21b0-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:35:24 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P8Yg5T2390085
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 25 Apr 2025 01:34:57 -0700
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
X-Inumbo-ID: 3afbb387-21b0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P8Yg5T2390085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745570099;
	bh=+1cZPrjxoO8JP1SvNOjxHMJreVADygXIL9efLTE+5Mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6vSQMi7TaxXX6g86RzyahMtuAdPxIGazxNkvqFJ36qXhTfTGwfcl14Zcq4s2POXC
	 niLC7I1Gu8ZZjcErcpBuICA0rJTJ7RhKIyS/ycFiSmRCGgiP0WVqu7dSGr3Y2NlM6F
	 Gdwe5BFHGT42f3rKWb5hyMMHiMi7bRwiIPRuXfjquaHkaG+LwoX8Coerw5DbsntywQ
	 pMk/mNcD8hAC5bvXpfRFX8QIoGqXkBfBHz15uz6PkVCVMIaV+U4UTCYcvWYDf1OsFi
	 5cX2scfJbAmJ+8gKqJjqhm9VHLxC4geKP0aazl31NuDnYDFxgVoRVDHtmTqL7EeBTD
	 89o4WbRGeVNXg==
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
Subject: [PATCH v3 05/14] x86/msr: Return u64 consistently in Xen PMC read functions
Date: Fri, 25 Apr 2025 01:34:28 -0700
Message-ID: <20250425083442.2390017-6-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425083442.2390017-1-xin@zytor.com>
References: <20250425083442.2390017-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pv_ops PMC read API is defined as:
        u64 (*read_pmc)(int counter);

But Xen PMC read functions return unsigned long long, make them
return u64 consistently.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/pmu.c     | 6 +++---
 arch/x86/xen/xen-ops.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index f06987b0efc3..9c1682af620a 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -346,7 +346,7 @@ bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err)
 	return true;
 }
 
-static unsigned long long xen_amd_read_pmc(int counter)
+static u64 xen_amd_read_pmc(int counter)
 {
 	struct xen_pmu_amd_ctxt *ctxt;
 	uint64_t *counter_regs;
@@ -366,7 +366,7 @@ static unsigned long long xen_amd_read_pmc(int counter)
 	return counter_regs[counter];
 }
 
-static unsigned long long xen_intel_read_pmc(int counter)
+static u64 xen_intel_read_pmc(int counter)
 {
 	struct xen_pmu_intel_ctxt *ctxt;
 	uint64_t *fixed_counters;
@@ -396,7 +396,7 @@ static unsigned long long xen_intel_read_pmc(int counter)
 	return arch_cntr_pair[counter].counter;
 }
 
-unsigned long long xen_read_pmc(int counter)
+u64 xen_read_pmc(int counter)
 {
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return xen_amd_read_pmc(counter);
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 63c13a2ccf55..735f58780704 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -277,7 +277,7 @@ static inline void xen_pmu_finish(int cpu) {}
 bool pmu_msr_read(unsigned int msr, uint64_t *val, int *err);
 bool pmu_msr_write(unsigned int msr, uint32_t low, uint32_t high, int *err);
 int pmu_apic_update(uint32_t reg);
-unsigned long long xen_read_pmc(int counter);
+u64 xen_read_pmc(int counter);
 
 #ifdef CONFIG_SMP
 
-- 
2.49.0


