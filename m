Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AEA961D0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962075.1353424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u794u-000758-4v; Tue, 22 Apr 2025 08:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962075.1353424; Tue, 22 Apr 2025 08:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u794u-00072o-1U; Tue, 22 Apr 2025 08:34:04 +0000
Received: by outflank-mailman (input) for mailman id 962075;
 Tue, 22 Apr 2025 08:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78v1-0004wX-MW
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:51 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17267c62-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:39 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9g1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:18 -0700
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
X-Inumbo-ID: 17267c62-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9g1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310199;
	bh=KjomXZ5P3Zbm1klfdzn3LReOwRDs2PdqfVOgUPEXtew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MammLggyo/MjNNAwAcGt2FRRqSlsggJGU25zpYplrm30iO3Y/UZa+69mVrL7h5AdS
	 +QF2vmuyoTUyD+PdpH0lcuLBEfsSmWJnEV4E43GwV3sP/7cQrcCY/s75xekunodRVa
	 MBCN8M8aF0nhj0PDdRAf4MrLwGcINYVauVcmEuaMv8xJCquK+hO/zGDpXej860AYjg
	 NOT8SBUSpQ3ULjUuZ/sIg7bsPjGu5PLZtigXd69vD9lGPI77KfO9GCa1dmtAwL41Tk
	 B7LFh5ljq9pZHluYM3LgLnmCHGK++CYmGWll/VVGfqOlZWhC1wu5qdivPclw361f2G
	 tQVJYMIZbWMzA==
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
Subject: [RFC PATCH v2 28/34] x86/msr: Rename native_write_msr_safe() to native_wrmsrq_safe()
Date: Tue, 22 Apr 2025 01:22:09 -0700
Message-ID: <20250422082216.1954310-29-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h | 4 ++--
 arch/x86/kvm/svm/svm.c     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 72a1c3301d46..a1c63bed14be 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -366,7 +366,7 @@ static __always_inline int rdmsrq_safe(u32 msr, u64 *val)
  *                         __native_wrmsrq()   -----------------------
  *                            /     \                                |
  *                           /       \                               |
- *        native_wrmsrq_no_trace()    native_write_msr_safe()        |
+ *        native_wrmsrq_no_trace()    native_wrmsrq_safe()           |
  *                   /        \                                      |
  *                  /          \                                     |
  * native_wrmsr_no_trace()    native_wrmsrq()                        |
@@ -480,7 +480,7 @@ static inline void notrace native_wrmsrq(u32 msr, u64 val)
 		do_trace_write_msr(msr, val, 0);
 }
 
-static inline int notrace native_write_msr_safe(u32 msr, u64 val)
+static inline int notrace native_wrmsrq_safe(u32 msr, u64 val)
 {
 	int err = __native_wrmsrq(msr, val, EX_TYPE_WRMSR_SAFE) ? -EIO : 0;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 838606f784c9..01dd3cd20730 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -486,7 +486,7 @@ static void svm_init_erratum_383(void)
 
 	val |= (1ULL << 47);
 
-	native_write_msr_safe(MSR_AMD64_DC_CFG, val);
+	native_wrmsrq_safe(MSR_AMD64_DC_CFG, val);
 
 	erratum_383_found = true;
 }
@@ -2159,11 +2159,11 @@ static bool is_erratum_383(void)
 
 	/* Clear MCi_STATUS registers */
 	for (i = 0; i < 6; ++i)
-		native_write_msr_safe(MSR_IA32_MCx_STATUS(i), 0);
+		native_wrmsrq_safe(MSR_IA32_MCx_STATUS(i), 0);
 
 	if (!native_read_msr_safe(MSR_IA32_MCG_STATUS, &value)) {
 		value &= ~(1ULL << 2);
-		native_write_msr_safe(MSR_IA32_MCG_STATUS, value);
+		native_wrmsrq_safe(MSR_IA32_MCG_STATUS, value);
 	}
 
 	/* Flush tlb to evict multi-match entries */
-- 
2.49.0


