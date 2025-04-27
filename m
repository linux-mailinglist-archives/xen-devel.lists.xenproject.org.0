Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09401A9E170
	for <lists+xen-devel@lfdr.de>; Sun, 27 Apr 2025 11:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969573.1358640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCY-0002q6-K5; Sun, 27 Apr 2025 09:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969573.1358640; Sun, 27 Apr 2025 09:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8yCX-0002ks-UX; Sun, 27 Apr 2025 09:21:29 +0000
Received: by outflank-mailman (input) for mailman id 969573;
 Sun, 27 Apr 2025 09:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hqWD=XN=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u8yCV-0001AF-Ob
 for xen-devel@lists.xenproject.org; Sun, 27 Apr 2025 09:21:27 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb11d309-2348-11f0-9eb3-5ba50f476ded;
 Sun, 27 Apr 2025 11:21:22 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R9KRS31598826
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 27 Apr 2025 02:20:44 -0700
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
X-Inumbo-ID: fb11d309-2348-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R9KRS31598826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745745646;
	bh=ww5dv1kvWZ0hKlTWKo3XMFLAAgaLDk8n8xkXdISYuaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KWyRQEL66fAHV5eykZ+izg3lbpESUMtd68WZhhJwP14wWG/hgXkgGIvWv0ZXV/gOD
	 Mw8D+vKdE6Qskwm5qPFDUCPHnQ7ncyfk9wV5UaHbeMBo0b8YJSjBSb5+YWDgidWJb2
	 bskcxi6K7ytWT3S0BGqcFT7kelRsaDt4wCITFMW8vERo8a0GziQKM7YSO8CbBPc8L3
	 5eBh5oms9QnwzLqAzEhhBk5fgV1EPx0Frh5WjPHmbdwplf8X4aOym1U3sU58RMmE2E
	 bDNrkJzlL5ku6Y53PblHMjUL9I7Uskk38Od3ywKhjfyPrR93UZa4n29vPs87Rj31qa
	 8xhVQE6+v9+HA==
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
        dapeng1.mi@linux.intel.com, ilpo.jarvinen@linux.intel.com
Subject: [PATCH v4 06/15] x86/xen/msr: Return u64 consistently in Xen PMC read functions
Date: Sun, 27 Apr 2025 02:20:18 -0700
Message-ID: <20250427092027.1598740-7-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427092027.1598740-1-xin@zytor.com>
References: <20250427092027.1598740-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pv_ops PMC read API is defined as:
        u64 (*read_pmc)(int counter);

But Xen PMC read functions return unsigned long long, make them
return u64 consistently.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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


