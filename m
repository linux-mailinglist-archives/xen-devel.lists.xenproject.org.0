Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C4AB3211
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980960.1367350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOnv-0003Te-Me; Mon, 12 May 2025 08:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980960.1367350; Mon, 12 May 2025 08:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOnv-0003Qk-JY; Mon, 12 May 2025 08:46:31 +0000
Received: by outflank-mailman (input) for mailman id 980960;
 Mon, 12 May 2025 08:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gEQ=X4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uEOnu-0003Qd-32
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:46:30 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97630ad3-2f0d-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 10:46:28 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C8jqc71586901
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 May 2025 01:46:02 -0700
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
X-Inumbo-ID: 97630ad3-2f0d-11f0-9eb5-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C8jqc71586901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747039563;
	bh=SJyp7okD30HInZ1fgTptAjmwrX1aqps8vhA1kdAJWhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wqu4jU+G5jmxtcMoxZU7xxTMdvYR6zp4VYJGyttTpRKojR4aUWkuBntnRPy95mMNP
	 TdZY/WjcOubxB+VWkDSGvR2bQ2PxqfaD5oWLx5oeN+NwmwkfwQIUZulba428YPa6+d
	 a4AmbXGRcZ1fxkw8DveEBEf6vdK9sioL+MwfJHOFQAN6ndlCoGnFJkOa79chbmM/8k
	 1WrQiT23ytcFJl83Qmf/PRSdkQRCO12iTFRgpvQMjzhTN1Kupv6cOH9+fDYRg2byiA
	 tWnUdW/sgtBWnr7GH/hZQsLfWNgCHqZh3Zuo+gLz+y09m/2TX32FcNb1vZHCeyNmv1
	 7DFsocyxduIZw==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        rafael@kernel.org, lenb@kernel.org
Subject: [PATCH v1 3/3] x86/msr: Convert a native_wrmsr() use to native_wrmsrq()
Date: Mon, 12 May 2025 01:45:52 -0700
Message-ID: <20250512084552.1586883-4-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512084552.1586883-1-xin@zytor.com>
References: <20250512084552.1586883-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
conversions when a u64 MSR value is splitted into two u32.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/coco/sev/core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ff82151f7718..b3ce6fc8b62d 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -282,12 +282,7 @@ static inline u64 sev_es_rd_ghcb_msr(void)
 
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
 
 static int vc_fetch_insn_kernel(struct es_em_ctxt *ctxt,
-- 
2.49.0


