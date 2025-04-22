Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9828A96103
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961786.1353182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ue-0006lG-E2; Tue, 22 Apr 2025 08:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961786.1353182; Tue, 22 Apr 2025 08:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78ue-0006Zu-4J; Tue, 22 Apr 2025 08:23:28 +0000
Received: by outflank-mailman (input) for mailman id 961786;
 Tue, 22 Apr 2025 08:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qhpm=XI=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u78ub-0004wM-5a
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:23:25 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c52d903-1f53-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:23:21 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53M8MG9M1954391
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Apr 2025 01:22:36 -0700
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
X-Inumbo-ID: 0c52d903-1f53-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53M8MG9M1954391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745310158;
	bh=ZDjz7zZ6jpSk7UYBX1f+/D6FpEpADYtgSJeGI0K8PfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JnM1tOMn1uOqwogaGDb5MA0EnSbBUePNLnpaO/hoa8wawH5peRy9eV+Mxx6gdUAsP
	 4J+kDIbBA+tj1HaAosm+HAGN3bs6BDN2tw/gvDOb3rz0QBzJKtmPhVFCU1gjPZARLN
	 cVFTJm2CNABewq6f0h4AUzPrxnKJY7GgDt4k+LmQnyeNf/IJcVPLHUmkr4KgzM4ddw
	 cpG5h9ajIgNj3NZXg8iZqKaJefvUYCb83TLTbKiVCSqsmym2tgrGB9O/MnG0tdrpqX
	 e49cOPxt2MjmuEMWTIfxUCvSYUho6LiyNa9c/tKoPjWL4drYZI2WdYQ+dXK3vNAiOJ
	 HJ3Be9VSRalww==
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
Subject: [RFC PATCH v2 08/34] x86/msr: Convert a native_wrmsr() use to native_wrmsrq()
Date: Tue, 22 Apr 2025 01:21:49 -0700
Message-ID: <20250422082216.1954310-9-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
References: <20250422082216.1954310-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
conversions when a u64 MSR value is splitted into two u32.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/include/asm/sev-internal.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/sev-internal.h b/arch/x86/include/asm/sev-internal.h
index 73cb774c3639..9da509e52e11 100644
--- a/arch/x86/include/asm/sev-internal.h
+++ b/arch/x86/include/asm/sev-internal.h
@@ -101,12 +101,7 @@ static inline u64 sev_es_rd_ghcb_msr(void)
 
 static __always_inline void sev_es_wr_ghcb_msr(u64 val)
 {
-	u32 low, high;
-
-	low  = (u32)(val);
-	high = (u32)(val >> 32);
-
-	native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
+	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
 }
 
 enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
-- 
2.49.0


