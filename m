Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7D69BE4B
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 03:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497652.768522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmO-0002YO-9G; Sun, 19 Feb 2023 02:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497652.768522; Sun, 19 Feb 2023 02:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmO-0002WG-5M; Sun, 19 Feb 2023 02:50:20 +0000
Received: by outflank-mailman (input) for mailman id 497652;
 Sun, 19 Feb 2023 02:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uhw5=6P=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pTZmM-0002Vk-Cb
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 02:50:18 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22412452-b000-11ed-933d-83870f6b2ba8;
 Sun, 19 Feb 2023 03:50:16 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8BCAF32004AE;
 Sat, 18 Feb 2023 21:50:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 18 Feb 2023 21:50:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 21:50:08 -0500 (EST)
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
X-Inumbo-ID: 22412452-b000-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676775011; x=1676861411; bh=Jd5MY4VF+HfxIL9l1Qbaez8l8BHoBek9uNF
	wPZ67yiU=; b=QKQ/J0vQkX9MbHGacr4wEPdWAr5xl/9SNjvecRhMzMdM96RZxg8
	6CQYia4YHkA0l991Y+WrZyF+3Ek9IBUAmDqojZYjpyAsQTip6VzvNLSo4umvV66x
	uO3xh6O9Nqi8RnGkdebJkCDSrLYXi+UkEl3cr3Ocec5X79fV9e8oGu7FnSStnMGS
	b3bR1y9k5/KxKeSlZcJmxRTRkvmXzftizxjFkBdghphttYjWEUTeInl+Dhuer882
	Sc9vFK412HkxgwlD+TafJqJtfm/j4FnWMx8Y5m4wKYOSwQGAX/i+wgSNDx/TyMZW
	/LLVo3vobkZbDcf3oAE16u6GDU6vEgwATjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676775011; x=1676861411; bh=Jd5MY4VF+HfxI
	L9l1Qbaez8l8BHoBek9uNFwPZ67yiU=; b=DbZN6PnltLkBRh47q6kh75A3JytDW
	cWI9a0pEjFlKzmMTVoHlD9dMOlnlkSIifswQfcrtZLPkxX13wN5GBSY2bzXhMbOh
	qRn7tayFQ82UC7cSL8DgJVdbmPjsOQYv6ZqJFgp47azsAfJeyTUZ5G+EAG+Fha53
	b7NA/pNZIjVAGJ81leMBb4mE56HR1IGfPGGwe12+UcFsieuHbP0fUdhU9gNsLOzA
	UwcBj5yIQzh3Vwip6K3P0h2ONLJwgtl204PlJH65CuJ1UEucgVQtOt8YejjtZEZo
	nP3/a7hlJIz2zAC2jS7Km6JDUqbP/gm/UMauXS8c1u6v839wXA+RnwJ6w==
X-ME-Sender: <xms:Yo7xY5mIDhb9rM81YsWLp7geNEs2WnJ-M85Tw03GJdbOu2Vyaq6gSg>
    <xme:Yo7xY02761Vojjjaoe2YWrkbyvftQhuKcvVNwAABhSyHvKj3pZxjGO5rqhzJKeXJs
    T_7RzTqts2Gjjw>
X-ME-Received: <xmr:Yo7xY_pFAsgt8YSDKfr6xzeQBIx3K_PfaLvOVSpgTK1KeghVz4nxDSaGXSqf8YPNL92HO01tSoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptefhhfdtkefhkefgjeduffehuedt
    gfduveejiedvffdvgeevledttdegvefhueegnecuffhomhgrihhnpeigvghnrdhorhhgpd
    gtohhnfhhighdrmhhknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Yo7xY5nTMccruTvAuOCSEdutEWXLh0td5V2L62koJQd70Ax2dSdeyg>
    <xmx:Yo7xY31Soo_VIM3knhtMdPJhQFbMVlF8SifhoAtlLKY6XOvFw6-Tvg>
    <xmx:Yo7xY4sJXPDxgpdtcLv9TqXJ2-CUR_xqi74jskZD98OwjIm0Te_dGA>
    <xmx:Y47xYwuVA3FEUHYHjWWQ9QyXmFGU3ptvBWlhPZY-ge3vdxtoEpdJ1A>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 0/3] Stop using insecure transports
Date: Sat, 18 Feb 2023 21:46:12 -0500
Message-Id: <cover.1676750305.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676668922.git.demi@invisiblethingslab.com>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

Changes since v3:

- Drop patch 4, which is an unrelated removal of unused code.

- Do not fail with an error if one tries to build the I/O emulator,
  vTPM, or vTPM manager stubdomains and passes --enable-extfiles.  The
  user may have provided alternate download URLs via environment
  variables.

Changes since v2:

- Drop patches 5 and 6, which changed links not used by automated tools.
  These patches are the least urgent and hardest to review.

- Ensure that no links are broken, and fail with an error instead of
  trying to use links that *are* broken.

Demi Marie Obenour (3):
  Use HTTPS for all xenbits.xen.org Git repos
  Build system: Replace git:// and http:// with https://
  Automation and CI: Replace git:// and http:// with https://

 Config.mk                                    | 20 ++++++--------------
 README                                       |  4 ++--
 automation/build/centos/CentOS-7.2.repo      |  8 ++++----
 automation/build/debian/stretch-llvm-8.list  |  4 ++--
 automation/build/debian/unstable-llvm-8.list |  4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh  |  2 +-
 docs/misc/livepatch.pandoc                   |  2 +-
 docs/process/xen-release-management.pandoc   |  2 +-
 scripts/get_maintainer.pl                    |  2 +-
 stubdom/configure                            | 18 +++++++++---------
 stubdom/configure.ac                         | 18 +++++++++---------
 tools/firmware/etherboot/Makefile            |  6 +-----
 12 files changed, 39 insertions(+), 51 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

