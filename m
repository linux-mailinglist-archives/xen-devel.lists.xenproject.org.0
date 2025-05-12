Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83799AB3213
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980965.1367380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOo9-0004K3-Hc; Mon, 12 May 2025 08:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980965.1367380; Mon, 12 May 2025 08:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOo9-0004GF-Dc; Mon, 12 May 2025 08:46:45 +0000
Received: by outflank-mailman (input) for mailman id 980965;
 Mon, 12 May 2025 08:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gEQ=X4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uEOo7-0003Qj-Fz
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:46:43 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970f45be-2f0d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 10:46:28 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C8jqc61586901
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 May 2025 01:46:01 -0700
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
X-Inumbo-ID: 970f45be-2f0d-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C8jqc61586901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747039562;
	bh=r60JlXTos4KUiP7BNV4Mubm1J2LcZX1eO8iTOKbeekU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bmWYvnwxTU0pVJW4u5KvyhR8cTc1ILbP2oLLV6/74QxSidvlgisrmNIxqhqDAWxKZ
	 TfRpxdQFxnaY6yhrR7m4LAqjzS1vvDMK3xmikiuu/o0qUX54thQc2j1Gjq2HQ4VNwr
	 rQKjxAF2qcQOahokDI2/tvLM1hf8YVHZ+abqqiF51/1wliz8hXeqPJdAFOMveLB42B
	 DSKDUbp1sv3q/sTl5Z8xcEzVErSlNqGYT1F1PLCScIypX4jxPqjgttEGM9q3tH7Gdv
	 i3o5hUvLakD4MvXrM6mRnnF2KzfqtpiDMAQ8pAj28Y0O3oXTU0l3ue3PDx/tGmMrY1
	 Snn6b8NY550AQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        rafael@kernel.org, lenb@kernel.org
Subject: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
Date: Mon, 12 May 2025 01:45:51 -0700
Message-ID: <20250512084552.1586883-3-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512084552.1586883-1-xin@zytor.com>
References: <20250512084552.1586883-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_read_msr_safe() currently passes an uninitialized argument err to
xen_do_read_msr().  But as xen_do_read_msr() may not set the argument,
xen_read_msr_safe() could return err with an unpredictable value.

To ensure correctness, initialize err to 0 (representing success)
in xen_read_msr_safe().

Because xen_read_msr_safe() is essentially a wrapper of xen_do_read_msr(),
the latter should be responsible for initializing the value of *err to 0.
Thus initialize *err to 0 in xen_do_read_msr().

Fixes: 502ad6e5a619 ("x86/msr: Change the function type of native_read_msr_safe()")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/xen-devel/aBxNI_Q0-MhtBSZG@stanley.mountain/
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/xen/enlighten_pv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 3be38350f044..01f1d441347e 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1091,6 +1091,9 @@ static u64 xen_do_read_msr(u32 msr, int *err)
 {
 	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
 
+	if (err)
+		*err = 0;
+
 	if (pmu_msr_chk_emulated(msr, &val, true))
 		return val;
 
@@ -1162,7 +1165,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 
 static int xen_read_msr_safe(u32 msr, u64 *val)
 {
-	int err;
+	int err = 0;
 
 	*val = xen_do_read_msr(msr, &err);
 	return err;
-- 
2.49.0


