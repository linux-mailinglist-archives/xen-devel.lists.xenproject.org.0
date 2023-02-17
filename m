Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7ED69B4D6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 22:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497309.768239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OO-0005gv-65; Fri, 17 Feb 2023 21:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497309.768239; Fri, 17 Feb 2023 21:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OO-0005ea-37; Fri, 17 Feb 2023 21:35:44 +0000
Received: by outflank-mailman (input) for mailman id 497309;
 Fri, 17 Feb 2023 21:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk7L=6N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pT8OM-0005eU-W5
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 21:35:43 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04bf2d19-af0b-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 22:35:40 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 994BB320030E;
 Fri, 17 Feb 2023 16:35:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 17 Feb 2023 16:35:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 16:35:33 -0500 (EST)
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
X-Inumbo-ID: 04bf2d19-af0b-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676669735; x=1676756135; bh=MGcjZgooPU4cVCfzNgS6jrb+K4sHboY2z/T
	xtj3xkoY=; b=pYTtTqGzCSSjtkBq5troOdPs5ICo/HLZhre4QvsnyVg3UNt9VJl
	TxyGNf3LrWJrTHmDPHyJDp/7Itur51flu4DhvPHJNYLV3hxzqt/cU5zMcbLV7qQr
	ciBxQhYUFIcFJ2oVQd1bBt30g+5xeW/Zv2rJx1QYfqap/kbDU/4EtEPSrzuFJct3
	GU3fqhQkwVtTwzbBy2HzYYIQ7Aev/CbE6QEJGUPos8i4KFt/f0q7M0i0sewJuuMZ
	ss/4R6Gv9UXdWE/mok96Yjqnoq+IkiwhCjdIXu534lSfewnDssKnB4KtFNG/C5lz
	JRrnKfPCbo5J1ybeVuPCDzw+ajH4/m+hIpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676669735; x=1676756135; bh=MGcjZgooPU4cV
	CfzNgS6jrb+K4sHboY2z/Txtj3xkoY=; b=GD0wAo35BMrhGIqt1CgQ7SGEETen8
	h2zXF8DLWhkjeJ5afeiIr1KNKMi2hzraQJdAzzJn58z47zLpqXbYm+R39/i1sXTB
	zHMn8xmT5hfvaveOC9qe+5NESrAzWicPv5MwS+LR2hQbv4DYn3q6RQGct0QECnxF
	XIj563E++3xv2yjk8h5xyO2zMDhsgIo1MyS3a4jTiROnAHdTKqrXCJZEnScI97db
	wkIPF4rX+LsIu2WXQaDnbIDrn5b8kkNUbZt5ankv2OJr2HwPIy48Xq2CHCTBu4e6
	MEBxj1F+HghKabJAULH+L4G8IqnurLIagS1zP86usOmk9ANf2BdxHnsmQ==
X-ME-Sender: <xms:JvPvYy2tRH5wc7ijJDGwrUTdYPXgiOVjP3_lIU7twz-nBAR7gdaruw>
    <xme:JvPvY1FGRmrBFZVhBluG_xCWTL0msohjw9GBB5NeBw7jLjCOdi4S7WvUAKaMadGQO
    BcV0pwjtGA-I3E>
X-ME-Received: <xmr:JvPvY64OJWsrY1NLFqk6Oxz1sJ09S_STZ5DfWv9DKxMYOcfsKMAFnF7PtALrrXGTsQmf6DfJ8Ss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefffffffeegvefftdeifeeiveeu
    gffhheetjedvhfetveekkeefkedvgeekffelgeenucffohhmrghinhepgigvnhdrohhrgh
    dprhhiphhouhhthhihphgvrhhtrhgrnhhsphhorhhttghonhhfihhgrdhmkhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:JvPvYz0AQ5u5xlOLRa9XrgfhSNnIneFYonlGvXA9JHFrpAYhTYDxng>
    <xmx:JvPvY1GsPagMREbAclEhpZd8xKMzSzRhPesp4Kvg0Hy8_cSi5D0OoQ>
    <xmx:JvPvY8_ApaSl7W3eLU5klrsNAIhRIfnSFHf_zri9YQmCYjZsXQD1Ew>
    <xmx:J_PvY9_0GzgpYuaS6gOYQhgUTAS-0Qmq2AsH-OhLIOQ4gKyyn3-h-A>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
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
Subject: [PATCH v3 0/4] Stop using insecure transports
Date: Fri, 17 Feb 2023 16:35:23 -0500
Message-Id: <cover.1676668922.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675889601.git.demi@invisiblethingslab.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

Changes since v2:

- Drop patches 5 and 6, which changed links not used by automated tools.
  These patches are the least urgent and hardest to review.

- Ensure that no links are broken, and fail with an error instead of
  trying to use links that *are* broken.

Demi Marie Obenour (4):
  Use HTTPS for all xenbits.xen.org Git repos
  Build system: Replace git:// and http:// with https://
  Automation and CI: Replace git:// and http:// with https://
  Rip out HyperTransport

 Config.mk                                    | 20 ++++-------
 README                                       |  4 +--
 automation/build/centos/CentOS-7.2.repo      |  8 ++---
 automation/build/debian/stretch-llvm-8.list  |  4 +--
 automation/build/debian/unstable-llvm-8.list |  4 +--
 automation/scripts/qemu-smoke-dom0-arm32.sh  |  2 +-
 docs/misc/livepatch.pandoc                   |  2 +-
 docs/process/xen-release-management.pandoc   |  2 +-
 scripts/get_maintainer.pl                    |  2 +-
 stubdom/configure                            | 24 ++++++++-----
 stubdom/configure.ac                         | 24 ++++++++-----
 tools/firmware/etherboot/Makefile            |  6 +---
 xen/include/xen/pci_regs.h                   | 37 --------------------
 13 files changed, 51 insertions(+), 88 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

