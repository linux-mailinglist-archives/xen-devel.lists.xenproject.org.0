Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAE56BE53
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363641.594331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r9b-000777-VK; Fri, 08 Jul 2022 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363641.594331; Fri, 08 Jul 2022 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9r9b-00073f-NP; Fri, 08 Jul 2022 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 363641;
 Fri, 08 Jul 2022 16:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6xB=XN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o9r0c-0000b9-IM
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:39:14 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f74a74b-fedc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 18:39:13 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6DD903200998;
 Fri,  8 Jul 2022 12:39:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 12:39:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 12:39:10 -0400 (EDT)
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
X-Inumbo-ID: 7f74a74b-fedc-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1657298350; x=1657384750; bh=U3b/H981CGu0C2wC9Ts2JrTkTC7Oo8KLBZW
	KsNQwvjA=; b=sNlj8utVGC0vIfiqJuCfPiXc7bDpbSIghAa2ibMfR0+3lmre7h/
	bkjqWOnQIq9JERNm8h2aCUPGpo1NBA7Cn+5LNQgOPFPKG2B4vtRLvWwX1feWkyxM
	kMuruV9kZBNSUsuZbyaUMSbzPRYx2GkYTfK8+6bkv530NGqimavpWfa8aSDho2MY
	4m/tLHN+bSxGFLXaNP6sPthDn5A/FI+3Fa5kBzioe7Ejmle3CQb97nhLvZ5qPxQa
	e7QbcHFXFQGBwremK4ujrTCe0NNpxUnEqahDXuBjN0cX6knW9IivvrTmnLDpzuBt
	+WO+BI8Zrs/u7T78QDjQx5Pt26T3v41qJ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657298350; x=1657384750; bh=U3b/H981CGu0C
	2wC9Ts2JrTkTC7Oo8KLBZWKsNQwvjA=; b=zXCBKYLSEAVEPR6sIJRpBCJLDFjZF
	Dzh8pqG/UgiCP9+pB2Yjcc6dtWFTkyMEjmAyZBbr25oSOfhaPQ4tUnDYJoAJ2SZ0
	oML6LbPCU/fGYAB8HIvO8KiR8HJP1S31NrZwBFgfBIkW8OEcPPT49AplrsHDXMVg
	Rnqvse2u//zm/rLCxlpHqUm1q7Y1YwcH3agBeQEdIio7x0Kk2V4S67XJ0GoN8ufU
	n+WZJoPDKD3nkeskhHMJ68BN2W6wRSPelEZMezf/MeD4QOI3zAKFTT8I/jhGSb62
	TrXPDQuKZOl5sRRag0ha9CfVDKAHxs415AaxuS16YPsP6Qt/4LY9XjOvw==
X-ME-Sender: <xms:rl3IYoR2ZJhwXKVuv9Qbkn_oFSlLxexHNp7-6gRJgkEzMX4d1jd_ng>
    <xme:rl3IYlwq5yZCGK2R8CxUb8g7XvTVjUjFvOdcGYEAA_WM51PTKji4ZPrghH0o4bC0-
    UccyMhYrAr-zVY>
X-ME-Received: <xmr:rl3IYl0JrAz4FEgbKT2FWKZ34ySKKmmRqoUm39fGSgs1A-JJ_fEUEYnV_zlDd1Dvmy0K73gVRKsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:rl3IYsD2SIL3tHUYPHswY1zrNczt1DToLUqP4Petk3JYeKwZh4_CsQ>
    <xmx:rl3IYhhUBTz6dcmT8WIiqqfnS6lksFvJZ4eQRR2NMJm_YUec_5_UKw>
    <xmx:rl3IYor62C5Z0MnAMTgt22P8FuCJJvyovaW9Mu6MFvzEXcW0fWWTyQ>
    <xmx:rl3IYsWErFmDf4COmpVqDg6DutndBpGT0LaMlm3juTfNBQYVJQwPZQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Linux kernel regressions <regressions@lists.linux.dev>,
	stable@vger.kernel.org,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: [PATCH 5.4] Ignore failure to unmap -1
Date: Fri,  8 Jul 2022 12:37:47 -0400
Message-Id: <20220708163750.2005-4-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708163750.2005-1-demi@invisiblethingslab.com>
References: <20220708163750.2005-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error paths of gntdev_mmap() can call unmap_grant_pages() even
though not all of the pages have been successfully mapped.  This will
trigger the WARN_ON()s in __unmap_grant_pages_done().  The number of
warnings can be very large; I have observed thousands of lines of
warnings in the systemd journal.

Avoid this problem by only warning on unmapping failure if the handle
being unmapped is not -1.  The handle field of any page that was not
successfully mapped will be -1, so this catches all cases wherr
unmapping can legitimately fail.

Suggested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: ee25841221c1 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f464793477650e631c8928e85c1990c5964c2e94..bba849e5d8a7b4d54925b842fbe3c6792e0f0214 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -413,7 +413,8 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
 	for (i = 0; i < data->count; i++) {
-		WARN_ON(map->unmap_ops[offset+i].status);
+		WARN_ON(map->unmap_ops[offset+i].status &&
+			map->unmap_ops[offset+i].handle != -1);
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

