Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F8E6EEB53
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 02:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526380.818085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSps-0000C2-8s; Wed, 26 Apr 2023 00:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526380.818085; Wed, 26 Apr 2023 00:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prSps-00004v-3u; Wed, 26 Apr 2023 00:16:40 +0000
Received: by outflank-mailman (input) for mailman id 526380;
 Wed, 26 Apr 2023 00:16:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prSpq-0008Sz-0r
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 00:16:38 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a9241dc-e3c7-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 02:16:36 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3BE5D3200488;
 Tue, 25 Apr 2023 20:16:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Apr 2023 20:16:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 20:16:32 -0400 (EDT)
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
X-Inumbo-ID: 9a9241dc-e3c7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682468193; x=1682554593; bh=PK
	2ZYDGyTV06RxgorcTiEiiY75XG+xFNOCsrrtktg5E=; b=pOx15lYTtT4GMtluk3
	0gaEGiPx01TOWBA5iG5lCkdFvdS+Uf4+VHDm82s+bWM4F86PGNpGeUPwt1IUYVFv
	/EBGEbrCuHXEvw+Rl3NQxScTZlaucS0lMnLSaO8uH/gC5TN0e02G9o/eUHqJbLYC
	W+PyMj9dLwfWTJeO6fOFYtCB8eoBytLVQqHAt91NgPR3ErpLphas7y327QCVNy8b
	uSEt31mzhUHi2STh/XYPB0yXS32ezxtRLk7f+DkwytIaz90BCYSieekO6+nEH0TL
	k87QMuFxgzH3oHUCDCtyP0S3oheYkB1fZsXKPYFhyenzsrX7ZEUbFBssTWmF3z2Z
	eT3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682468193; x=1682554593; bh=PK2ZYDGyTV06RxgorcTiEiiY75XG+xFNOCs
	rrtktg5E=; b=VdICgU1dxn5rVC93Ga9Va7F+8Vclljm3R2JsJJ2frsVQB3ADtsY
	Wpx/8lYSyUG8aJrp7bMV05YHcuOjMEIefhhT8oGhj0HK6P4313pWXLUXzZHutEMt
	PXZ2w/e/9teN38aA0puSB24RuL1cGDiwlTvukD+yRbEs7ZmT/j2zdn5C4zu07/Il
	/3wHca95VWkHGAlAK5NrkaOuNEds6cr8ZKoWJL1cldo/dzIxe/LQhDL3QptR259r
	Zki1kHAcYx6OZg0ZhO0PXn33fKvJ3APs0GYbz8CCJ2PJP8KBnoYvDar9I8rGpjAi
	eTpmP8EBoNsA6VHtIUKO6XX195xmL3Yp1Jw==
X-ME-Sender: <xms:YW1IZFzfuiuIzkggTLWC2XPNzxz_yQkrbyAgNVdJKeMyZ5b2CgE3EA>
    <xme:YW1IZFTeA3yofunY5np3vBMqWbEKTE8QWMNaI2y8rEBEQH4JXNzCzWGGAisfwTKOm
    8GG5Hc2wCktnA>
X-ME-Received: <xmr:YW1IZPV5NQzEXfp3qFvqGkKM3jdOs-KBiV_7Tzz3jrJiaQh9GMWetRXKuWNY_n8OcRswcwX3xyMZpYWEYtr4qLQ5Na_en9nUTajZHoEjHtibSmPoXIj1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:YW1IZHh3Fmc2mdsYD7fBkL2pO4bv-TYZpvAJR49HCEFhcK6UmPZLYg>
    <xmx:YW1IZHByyoK4rSotUOwpK9wd8M8LwKibf6yUu4c3cih97Ccb__EGhA>
    <xmx:YW1IZAL2KbM75f0cWm_UmfLWeM1O9_VeazLLxZuUj0yAegxF8Kkfug>
    <xmx:YW1IZM75xyUv8sGyaia_Lke0LXz1L3El-cStRk3fhlrhs5rIehPoGA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 2/6] automation: add runtime qemu dependencies to test container
Date: Wed, 26 Apr 2023 02:16:12 +0200
Message-Id: <c2dac6e1feca4410655b36e02354b50cf7fe8ddc.1682468126.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is necessary to start HVM guests in subsequent tests.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/tests-artifacts/alpine/3.12.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/tests-artifacts/alpine/3.12.dockerfile b/automation/tests-artifacts/alpine/3.12.dockerfile
index b3909996b47b..073f16a0d70a 100644
--- a/automation/tests-artifacts/alpine/3.12.dockerfile
+++ b/automation/tests-artifacts/alpine/3.12.dockerfile
@@ -13,6 +13,7 @@ RUN \
   \
   # xen runtime deps
   apk add musl && \
+  apk add libgcc && \
   apk add openrc && \
   apk add busybox && \
   apk add sudo && \
-- 
git-series 0.9.1

