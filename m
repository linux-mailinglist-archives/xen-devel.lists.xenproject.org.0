Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF053E035
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342168.567277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bo-0007UE-SJ; Mon, 06 Jun 2022 03:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342168.567277; Mon, 06 Jun 2022 03:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bo-0007S0-La; Mon, 06 Jun 2022 03:40:52 +0000
Received: by outflank-mailman (input) for mailman id 342168;
 Mon, 06 Jun 2022 03:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bm-0006LY-L8
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:50 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74e2a6e1-e54a-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 05:40:49 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2738F5C005B;
 Sun,  5 Jun 2022 23:40:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 05 Jun 2022 23:40:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:47 -0400 (EDT)
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
X-Inumbo-ID: 74e2a6e1-e54a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486849; x=1654573249; bh=U8kU4goNfn
	hejF90xv/RWehAvQ7mOrYaRxEFIubWjr0=; b=vKoohr+AUD15ReHYhN+5posuv8
	ylsZ3vFTqlXURpzI/se+U7FhzPiVA0hqzje5Zax24fMlYfIfceiJ4o6hgyn5yZgr
	6tAUlsbm4i2G0mpAAsFI5B+tiXdNu4lTYD0rY4D9yFCFoP4r3o+7lEZ1QJA6VDss
	1iOeJB78rSUDqTzTT5UT9yRx6mbmyu0Yjn89HRc/BEbDMltMVV19ZpY2YsA/iOlr
	KtsjaiKIYDyX/SSK/ydwqa8AoEVEzF/pYXrDrYJi/cKNyPC1hdQuXSOnrAHBdxI4
	yoT6HsEIetEdP3aCjrNSsrAeAEAHDMKS+GghXQGjWOHVGDTzD/2eg55jdY/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486849; x=
	1654573249; bh=U8kU4goNfnhejF90xv/RWehAvQ7mOrYaRxEFIubWjr0=; b=E
	DAJtJ0Kmuhtg3wq8osJPyguvt9sSGG4+gzZUU37svHFhYSN7eQTcx+B0Vg3WKwLn
	qAN5I3vEf3hHz9lWDiZSz02NHXtQokOhErVrL4F4Ey0NBjoEGhI7myzZA0GWE8sF
	tkxwhrA+93qLnPHHpJuJB0s4hd85A5bQfrVGYrwZzylVbV8DYGnyH+I/4I/dFv/s
	E5TCYvR6zSM85Vcieqlyt2lSGPvdurmIOU3i/F+HedE7qqlOMZTjNDNqxJnBDXEQ
	JSpzPnQaipcpLHeh9Acuv3U7etNq1P2tcZc6zMGJs3Kg/xMfyF5yN3rwLdIM4PP9
	x3hW0mYdy7Ay43krr1cmw==
X-ME-Sender: <xms:QHedYqXcnBT6k38M3lCs_deMbrU76XY3K8-cg0dyOoURDmxCxsIzcA>
    <xme:QHedYmlMGHvn6lA4xbUG7cKC_S5ggJxRHujcBB5QyXqIA2oqcQTpFLLRAnBLbopx0
    CwqbTDUb3r50g>
X-ME-Received: <xmr:QHedYuY2K7QAi0SmzIZl0ikkf7lOfotJ_nfKfLjO3m-77RfkZJ2yJhIGFVPq7kzZTWpyVXl93mIUOA2Y9jnXktEOflj7j3DyclbH3fAoH2uPkHJnT0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QXedYhVwpN7N_jcoJJJ5Vrso4bsTh3kGj_r_G83LFl0IvsNiXbPMfQ>
    <xmx:QXedYklbVk7VxGseBb7IBnC-wfxuGNETuCu0k8tQ1bWIvl4iA2UeBQ>
    <xmx:QXedYmcQ--bfAIOZ1ReWy8EV9reBlGfhGHXwBgpZRBTJpsanNFw72Q>
    <xmx:QXedYjv1uU73cbFr2wuyNngp1TlOtjiUZu-BRmcArPvXdJJXP-_nZA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 05/12] ehci-dbgp: fix selecting n-th ehci controller
Date: Mon,  6 Jun 2022 05:40:17 +0200
Message-Id: <c24ab71e7ee5ae4f411d4070fe7d29bf07c02dc7.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ehci<n> number was parsed but ignored.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/ehci-dbgp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 16c8ff394d5c..92c588ec0aa3 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1480,7 +1480,7 @@ void __init ehci_dbgp_init(void)
         unsigned int num = 0;
 
         if ( opt_dbgp[4] )
-            simple_strtoul(opt_dbgp + 4, &e, 10);
+            num = simple_strtoul(opt_dbgp + 4, &e, 10);
 
         dbgp->cap = find_dbgp(dbgp, num);
         if ( !dbgp->cap )
-- 
git-series 0.9.1

