Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AF6490AC
	for <lists+xen-devel@lfdr.de>; Sat, 10 Dec 2022 21:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458652.716485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p46h2-0007Ky-D5; Sat, 10 Dec 2022 20:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458652.716485; Sat, 10 Dec 2022 20:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p46h2-0007IT-A9; Sat, 10 Dec 2022 20:43:32 +0000
Received: by outflank-mailman (input) for mailman id 458652;
 Sat, 10 Dec 2022 20:43:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nmv7=4I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p46h0-000773-PE
 for xen-devel@lists.xenproject.org; Sat, 10 Dec 2022 20:43:31 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1c11d3-78cb-11ed-91b6-6bf2151ebd3b;
 Sat, 10 Dec 2022 21:43:29 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A16635C00AE;
 Sat, 10 Dec 2022 15:43:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 10 Dec 2022 15:43:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 15:43:25 -0500 (EST)
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
X-Inumbo-ID: 4c1c11d3-78cb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670705006; x=1670791406; bh=2RZzyrhtj5BpRqxrmVAhdK8MNzgxxOumYrg
	BFvn1oQM=; b=JDychsyNPPsC0ytQ4ORS6jKh/WQnznI0pq2oCTZqwKnlbkZAFHA
	H60WBAYDTNXnR8tSh+GwR5hBqznB5ss05aOdSvMe4zerDIJOwbBAChZ90/pnMjLZ
	8unJxA5wgYzLtkvovxsXfQ7AUlvcQkhRcBdhTMTlnyx4UzAc5RQtMv1py1548FbT
	b3kmoJok7Y68Zf5vODbHjVYY4LBY2L6ZYaD8oM8GEgbCOGRBunZ8v4ykSmTu5cyF
	A1wAgGR0YXn9hIAUCZi16ycYoAguEiuq1139psKn3c5xziK+nGEDvUrNP5LdYQLI
	zWFoSTHN7WvrazVRlruNGEmi45ZTiaceSXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670705006; x=1670791406; bh=2RZzyrhtj5BpR
	qxrmVAhdK8MNzgxxOumYrgBFvn1oQM=; b=EjguRZALlJNd16IqX2sUs0NxZTj8g
	wQWfFAFZO4R3x/NkO6U6tIoHIJO6bhT2A4uPKANBazzgaKC1LuuEa2YmqLzErvSa
	IAWAJwZhPS51oayVeZP9w0M8HWKbPgm7nU/5KVnxHitQxes0YMyeAm2A+7W2LKt2
	grmA4wxHvHBRRmT0kGKTjA66MD5Jt6+58rxgY25sBszoBY908KjnjNUwSvObsvXh
	8Cjp5lB2UTojzZBOgnpUUCurAoXTtCXNJSoE8pUZSp760wHychkesPACmsIL9D57
	HsxjaPixZCOpbkW9oVC6qrnOznBcQB29pv87cFMpMd++mhLnL1pg2ChMA==
X-ME-Sender: <xms:bu-UY9FHvCjy1I5rPMrNjNlcd-uZiYr-8T15AgSQjSmZ-nsyWsvVdw>
    <xme:bu-UYyV2Ujsik1xmXkCHFyFQDf1mlKlHnDbiovFhSJT1925DD_NZIq1z7autGeBhQ
    mH2iR6tBbvSoA>
X-ME-Received: <xmr:bu-UY_LjvU_bnloyIcEkNtDzfNxcFabNFoVnUVMwQ0Iqp2vD_LRvZ3jrAHj0piScZziwj8TYUxG91UKAZHaGforelDMm1Ky3ZJ9PVOmQNK35v5eJ2gU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bu-UYzHmoNK_7JzepJaGmcUrEBtNUMmNBHrLt8mcSWEVlyJCIM_CVg>
    <xmx:bu-UYzXNwSwBeiXYy3iMkvyDK6jL5BynlgLzuuKV-YQQVi5PdgaU-Q>
    <xmx:bu-UY-OZpNCx3Glm_LYS_gcKfGrYjO1VreesNCfcYIkhh0tcqLoFdw>
    <xmx:bu-UY6cmIuVI0j7y_VXRHy_A1c2vvLTcNbSFgksANcRvtSPTUhDzrQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] docs: do not install .deps files
Date: Sat, 10 Dec 2022 21:42:58 +0100
Message-Id: <20221210204258.3153703-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It isn't really part of the documentation. Furthermore, entries there
are in not determined order, which breaks build reproducibility.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 docs/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/Makefile b/docs/Makefile
index 8de1efb6f5bc..966a104490ac 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -178,6 +178,7 @@ $(foreach i,$(MAN_SECTIONS),$(eval $(call GENERATE_MANPAGE_RULES,$(i))))
 install-html: html txt figs
 	$(INSTALL_DIR) $(DESTDIR)$(docdir)
 	[ ! -d html ] || cp -R html $(DESTDIR)$(docdir)
+	rm -f $(DESTDIR)$(docdir)/html/hypercall/*/.deps
 
 .PHONY: install
 install: install-man-pages install-html
-- 
2.37.3


