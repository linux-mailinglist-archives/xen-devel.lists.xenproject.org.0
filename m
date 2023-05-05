Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EFC6F8AE5
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 23:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530650.826387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wF-00079c-UT; Fri, 05 May 2023 21:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530650.826387; Fri, 05 May 2023 21:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv2wF-00077P-PF; Fri, 05 May 2023 21:26:03 +0000
Received: by outflank-mailman (input) for mailman id 530650;
 Fri, 05 May 2023 21:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HMjG=A2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pv2wD-00077H-Vw
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 21:26:02 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bd93315-eb8b-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 23:25:58 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 881393200A89;
 Fri,  5 May 2023 17:25:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 May 2023 17:25:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 17:25:53 -0400 (EDT)
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
X-Inumbo-ID: 6bd93315-eb8b-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683321954; x=1683408354; bh=PDyU9NZ51sl5yKnOCnEilGWUm
	ShNFHrjw6ME6jDLwyk=; b=F3ywGpqE1Gk1X+Ee/uUhu90/cf6R3KNn8afKN0HBa
	Vh/JJObuRQqWhFRRvA2CWIN2vjjhBN3QRVo14OoD/8I3wzuWgDltg3G4CtzJFplY
	np+utE9vbQjoCNcjP9ekGQTx2suVusPWVo6PsJsDuDipymkukJBO0/S2dOCFoo5y
	zSVBL5udoao/1TXCOAqZh9pzvB3ic5ThSA39wUfS2pDBtP/cUn2zzlJ2P4ftzv1U
	FCDosrLmJnc6zoDK/x+REa6fu1lAHuQO1ZWbgq3GYC82GbxIAFTtUYhmApc98NsY
	+bmhpEtaiLb1c65nZOiP8MBb2LxJRnES98x1FtkJbRRLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1683321954; x=1683408354; bh=P
	DyU9NZ51sl5yKnOCnEilGWUmShNFHrjw6ME6jDLwyk=; b=b42mZxKjd/kl2DIbQ
	EGglrWR82TZxRBPi7XubYm/Tn+g7zv+9NO4HzFmg591yDXE1nb+J+mf7TJDeSmtz
	OVIAnhynPSmnt0mM8NFmftIsNAEq4W2UT51B7X6VA+NTuIvh++ZAGhDmj3VoLKMj
	Qnc1PkcMaM4m1fBt8gxUsNVPffFXZ1cABtALf+t2EvMGjkMnncer0/a2PmYsC3Eq
	4f4S8Lzsvj1ly1/AQHU1B9OD3KWDGagnxuP0I29DF0vPa9FEoMNnqGsKvSKZWoFK
	xlF5mc4fW2tT6xz5iQSoq1f9JSt3fAhqCGbe9kPtTxK6A6gAiOkVo6De0GUnJIv6
	arKqQ==
X-ME-Sender: <xms:YXRVZJ-LNG9wJYrkdlh0lEur5nzjUYrId2T4n4zC9quwwZtr6P4UXQ>
    <xme:YXRVZNtoWm-wRd4rP44kSs_KFH4sKW3tIaEVhp0Xukp-FOCGfKFqIwG9zItRUrISG
    9TLqmPVinFdmw>
X-ME-Received: <xmr:YXRVZHC_9y7lnVSAkJ61jJTjBVbW0BsGhry6Ujf4wRDWbgnEIPSV5PPQZg235nXLWxc8vDpfP5A7uVaM0jPaeLE2qGa5pFdUXuBmg3sYxZoYiJtdbg0H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofggtgfgsehtke
    ertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgv
    tghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeelkefhudelteelleelteetveeffeetffekteetjeeh
    lefggeekleeghefhtdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:YXRVZNeOnnVMzpFUuqSiezogLqtwbhLDsBUzrjgTzqfZMAcmsgDSsg>
    <xmx:YXRVZOO_T-Wcv1WSZe17mG0BFoPCWfMNvNcyeRPRCFf3ZPAAYgNvbg>
    <xmx:YXRVZPlBhYktDUFqYdUsxdiY9QyGDObi-EuRb-ir9w1L3pAFb_gg_Q>
    <xmx:YnRVZBa8Mh7kNStt2_VPdIBeNKE_SoMAzN9zgf39OpK2KKBD0p3Cnw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/2] Add API for making parts of a MMIO page R/O and use it in XHCI console
Date: Fri,  5 May 2023 23:25:34 +0200
Message-Id: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On older systems, XHCI xcap had a layout that no other (interesting) registers
were placed on the same page as the debug capability, so Linux was fine with
making the whole page R/O. But at least on Tiger Lake and Alder Lake, Linux
needs to write to some other registers on the same page too.

Add a generic API for making just parts of an MMIO page R/O and use it to fix
USB3 console with share=yes or share=hwdom options. More details in commit
messages.

Marek Marczykowski-Górecki (2):
  x86/mm: add API for marking only part of a MMIO page read only
  drivers/char: Use sub-page ro API to make just xhci dbc cap RO

 xen/arch/x86/hvm/emulate.c      |   2 +-
 xen/arch/x86/hvm/hvm.c          |   8 +-
 xen/arch/x86/include/asm/mm.h   |  15 ++-
 xen/arch/x86/mm.c               | 253 +++++++++++++++++++++++++++++++++-
 xen/arch/x86/pv/ro-page-fault.c |   1 +-
 xen/drivers/char/xhci-dbc.c     |  14 +--
 6 files changed, 284 insertions(+), 9 deletions(-)

base-commit: 99a9c3d7141063ae3f357892c6181cfa3be8a280
-- 
git-series 0.9.1

