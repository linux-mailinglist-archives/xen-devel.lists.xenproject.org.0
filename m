Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4AA961AC
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961944.1353344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7934-0001dj-TI; Tue, 22 Apr 2025 08:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961944.1353344; Tue, 22 Apr 2025 08:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7934-0001bu-PJ; Tue, 22 Apr 2025 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 961944;
 Tue, 22 Apr 2025 08:32:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78v5-0004wX-NV
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:55 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1965d340-1f53-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 10:23:42 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9j1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:24 -0700
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
X-Inumbo-ID: 1965d340-1f53-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9j1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310205;
	bh=PfH0d70H/awMl+pIfi176SABhujHw41azze32+OJXmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnWtZCemkFX6NCD7mP/s8qoAFT3h3Gb+Fvc+J5Mk02eaVtZrWyrmVnlpXwmVAvy41
	 houfWnQz9wGOKn2yRaZanE3IjEltuS0f/5cW2rlJmBwVly9l6LLAqVurtWi3thuZcM
	 ji5BPEgLgOQkXAsMX4hjSxG1dqBUP9qrDSURde+feL4tlBBsfHS0nQPq1ugkmkwkBm
	 Qf94NiRrS85WPrGN0VWgL6mlH/GHv4SGGPAIIC3MsntY56esV8EU1L6d8KeTVhVlvC
	 nqDxaHuS3Och/kSL44qglJbmmo1kO2jM0JXyCV2y6tezwHqg8Wal5lhgPQfwgfhBGG
	 UQBpBNOph9P0Q==
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
Subject: [RFC PATCH v2 31/34] x86/msr: Rename native_read_msr() to native_rdmsrq()
Date: Tue, 22 Apr 2025 01:22:12 -0700
Message-ID: <20250422082216.1954310-32-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/hyperv/ivm.c      | 2 +-
 arch/x86/include/asm/msr.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index dfddf522e838..8860c6c0f013 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -319,7 +319,7 @@ int hv_snp_boot_ap(u32 cpu, unsigned long start_ip)
 	asm volatile("movl %%ds, %%eax;" : "=a" (vmsa->ds.selector));
 	hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
 
-	vmsa->efer = native_read_msr(MSR_EFER);
+	vmsa->efer = native_rdmsrq(MSR_EFER);
 
 	vmsa->cr4 = native_read_cr4();
 	vmsa->cr3 = __native_read_cr3();
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index dfaac42b6258..4c7aa9e7fbac 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -160,7 +160,7 @@ static __always_inline bool is_msr_imm_insn(void *ip)
  *        native_rdmsrq_no_trace()    native_read_msr_safe()         |
  *                   /      \                                        |
  *                  /        \                                       |
- * native_rdmsr_no_trace()    native_read_msr()                      |
+ * native_rdmsr_no_trace()    native_rdmsrq()                        |
  *                                                                   |
  *                                                                   |
  *                                                                   |
@@ -263,7 +263,7 @@ do {							\
 	(void)((high) = (u32)(__val >> 32));		\
 } while (0)
 
-static inline u64 native_read_msr(u32 msr)
+static inline u64 native_rdmsrq(u32 msr)
 {
 	u64 val = native_rdmsrq_no_trace(msr);
 
-- 
2.49.0


