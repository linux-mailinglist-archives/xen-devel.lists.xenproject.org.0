Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46343A961AD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961953.1353360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u793A-00029i-Iv; Tue, 22 Apr 2025 08:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961953.1353360; Tue, 22 Apr 2025 08:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u793A-00023o-BF; Tue, 22 Apr 2025 08:32:16 +0000
Received: by outflank-mailman (input) for mailman id 961953;
 Tue, 22 Apr 2025 08:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78um-0004wM-QA
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:36 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14069631-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:33 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9f1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:23:15 -0700
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
X-Inumbo-ID: 14069631-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9f1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310197;
	bh=n9SvQ+6gLfKPeJxZo0ixRWTtLNf7Ind1ig8lOaFKHRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPM2elO1cKqKRmNOT5WRj7ojg2yaJuuZ/6RneSxHgf10deYK+Y7ngp9qNQakxHc9b
	 Wsg8uG8q6cSmvwlgeJ6PFS2VwvUlEZwd/LO3Y7lH/odwkiDSFGchLPsgqm7UgOwPwJ
	 YL8xps4uREMf97Zc12/2mrarAGPeDrtCw6ugZUk9/MOAoIHZN1WY5EuwEHgXjpSz51
	 yJfDvs/7rmfx8C8y4FtDWPthXdwtb2hgw7mwPRlXoqWQ2O75Ak43Bzdjii0ltr0hKy
	 e46ml6+1ZMMn436GDY7jbddaePt9Y4Kf4BrvAyZWkwflLKHZSQPDgePwOQ5ZUW2rNp
	 VpBDzdmZF41qA==
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
Subject: [RFC PATCH v2 27/34] x86/msr: Rename native_write_msr() to native_wrmsrq()
Date: Tue, 22 Apr 2025 01:22:08 -0700
Message-ID: <20250422082216.1954310-28-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/msr.h | 4 ++--
 arch/x86/kernel/kvmclock.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 2a62a899f7a5..72a1c3301d46 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -369,7 +369,7 @@ static __always_inline int rdmsrq_safe(u32 msr, u64 *val)
  *        native_wrmsrq_no_trace()    native_write_msr_safe()        |
  *                   /        \                                      |
  *                  /          \                                     |
- * native_wrmsr_no_trace()    native_write_msr()                     |
+ * native_wrmsr_no_trace()    native_wrmsrq()                        |
  *                                                                   |
  *                                                                   |
  *                                                                   |
@@ -472,7 +472,7 @@ static __always_inline void native_wrmsr_no_trace(u32 msr, u32 low, u32 high)
 	native_wrmsrq_no_trace(msr, (u64)high << 32 | low);
 }
 
-static inline void notrace native_write_msr(u32 msr, u64 val)
+static inline void notrace native_wrmsrq(u32 msr, u64 val)
 {
 	native_wrmsrq_no_trace(msr, val);
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index ca0a49eeac4a..36417fed7f18 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -196,7 +196,7 @@ static void kvm_setup_secondary_clock(void)
 void kvmclock_disable(void)
 {
 	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0);
+		native_wrmsrq(msr_kvm_system_time, 0);
 }
 
 static void __init kvmclock_init_mem(void)
-- 
2.49.0


