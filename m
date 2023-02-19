Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CAE69BE48
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 03:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497654.768545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmU-00033v-Ud; Sun, 19 Feb 2023 02:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497654.768545; Sun, 19 Feb 2023 02:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmU-00031g-RQ; Sun, 19 Feb 2023 02:50:26 +0000
Received: by outflank-mailman (input) for mailman id 497654;
 Sun, 19 Feb 2023 02:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uhw5=6P=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pTZmT-0002li-LU
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 02:50:25 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252d0f3c-b000-11ed-93b5-47a8fe42b414;
 Sun, 19 Feb 2023 03:50:22 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A53FB3200583;
 Sat, 18 Feb 2023 21:50:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 18 Feb 2023 21:50:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 21:50:15 -0500 (EST)
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
X-Inumbo-ID: 252d0f3c-b000-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676775017; x=1676861417; bh=+fUifg3+9Sx5Ngno/T4jBLJLFOiv4d2p9UY
	Hj/k/F/0=; b=TfR/aOp2aVlCdkZUazTk0r14QyQkxybV9277sXvzmNGUSFOUsxR
	6XI938akoGyBXIRDBZB6YCs4Xl+d3wPq6GOzV6LD6jVvdIBv5fq23qZzIdf689hv
	ZxDl59Dvsof5VyZbBFJhJUSVdKNVjNNb5bXyqMIMPdj66i+T5rdUhZ9D+ROie+Wm
	Nc7VtSrzVQT9WQ1c4u9wKbukvbs/HeAWfnuxfAxRu4aiDrU1SI8/y2RsHA8yT0my
	5wrQ4svb/1Xnu5PDvFH0CmZJY2ptWiZI+rT43TLAYFNxhz4E9yd7ZWHNdlCLsVk0
	yvUdSa8EB9Vnrrx5cATVhNMpspSSN9bpZaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676775017; x=1676861417; bh=+fUifg3+9Sx5N
	gno/T4jBLJLFOiv4d2p9UYHj/k/F/0=; b=QTAAJMt9lbOncEBb8aHoSh4T+ZiMZ
	qpRzkOX7piAX0G2MX94k78Jky9lv1KErqjXgCWknn4zzjQDaQrUGBDfoDhiS96Qt
	fbs1BZs7gxT1cHrvEJH2KuzqKVhJa3jefRssB7OoL5+9zIuMNql9F/i5jPYQg2Tc
	YGPX4z19ajqjiCBpHY0SItBu6dptj4LEYVNX4HBgyxnCdNLnNP7Aq5BdgfdUQwQD
	o8PFZ+fGXLamp8bFS1j/h+7fwGOThPnjUYqnvlfRQlQ2yZaOk0njkGpiE4Wqxv2i
	vBGJjHdSQwYpfVnurwQRveb+T6YqW1wmL//Q7EAvTmBTndrHDOZYG43EQ==
X-ME-Sender: <xms:aY7xY287pM7pTbdP4kccLsr2618ybPyzIntWRzCI5UWxUrk8L7xl6A>
    <xme:aY7xY2sknd1qtCAunG9ij90XwAGmdV4mGUQLdGm_ACQkXutm66Z8Ix6ynvgiPxf_Q
    ND9809f5N5LKSE>
X-ME-Received: <xmr:aY7xY8D7pN6AUmpKguqpu2IqwwGK61nnj3X40yCbnK3pSlpLf9HpLUE2bsx1o03QMk7fEESZf3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuefgffeihefhffelkeehffeljeeu
    teeihfeiudejgeeufffhheeugfekhfeiffeinecuffhomhgrihhnpeigvghnrdhorhhgpd
    igvghnphhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:aY7xY-ccUeB8I0_Ctm8pkHEiK9f8NrmbibZOOWj_Fq9_NyjZjtUIQQ>
    <xmx:aY7xY7OcuJXYjmGpHZvz6_HSDj1Qf93lVk8NeHnCMifI9uKfeP94yw>
    <xmx:aY7xY4kmTsy6rEs5aP3tWEALJGSEq6G44C7dvR7EZLKEVH4_-FY9Ew>
    <xmx:aY7xY0hUihzCnxSNpti-Ezs7QSw9b8aY8X8cl2rG939F-MHbwP3N8g>
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
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 1/3] Use HTTPS for all xenbits.xen.org Git repos
Date: Sat, 18 Feb 2023 21:46:13 -0500
Message-Id: <a8ce128b0d233067ffe33ad00e077ebac6cac1a7.1676750305.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676750305.git.demi@invisiblethingslab.com>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports for all xenbits.xen.org
Git repositories.  It was generated with the following shell script:

    git ls-files -z |
    xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.xen\.org/git-http)/@https://xenbits.xen.org/git-http/@g'

All altered links have been tested and are known to work.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk                                  | 18 +++++-------------
 docs/misc/livepatch.pandoc                 |  2 +-
 docs/process/xen-release-management.pandoc |  2 +-
 scripts/get_maintainer.pl                  |  2 +-
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/Config.mk b/Config.mk
index 10eb443b17d85381b2d1e2282f8965c3e99767e0..75f1975e5e78af44d36c2372cba6e89b425267a5 100644
--- a/Config.mk
+++ b/Config.mk
@@ -215,19 +215,11 @@ ifneq (,$(QEMU_TAG))
 QEMU_TRADITIONAL_REVISION ?= $(QEMU_TAG)
 endif
 
-ifeq ($(GIT_HTTP),y)
-OVMF_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/ovmf.git
-QEMU_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_TRADITIONAL_URL ?= http://xenbits.xen.org/git-http/qemu-xen-traditional.git
-SEABIOS_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/seabios.git
-MINIOS_UPSTREAM_URL ?= http://xenbits.xen.org/git-http/mini-os.git
-else
-OVMF_UPSTREAM_URL ?= git://xenbits.xen.org/ovmf.git
-QEMU_UPSTREAM_URL ?= git://xenbits.xen.org/qemu-xen.git
-QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
-SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
-MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
-endif
+OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
+QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
+QEMU_TRADITIONAL_URL ?= https://xenbits.xen.org/git-http/qemu-xen-traditional.git
+SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
+MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
diff --git a/docs/misc/livepatch.pandoc b/docs/misc/livepatch.pandoc
index d38e4ce074b399946aecdaedb4cb6fe5b8043b66..a94fb57eb568e85a25c93bf6a988f123d4e48443 100644
--- a/docs/misc/livepatch.pandoc
+++ b/docs/misc/livepatch.pandoc
@@ -993,7 +993,7 @@ The design of that is not discussed in this design.
 This is implemented in a seperate tool which lives in a seperate
 GIT repo.
 
-Currently it resides at git://xenbits.xen.org/livepatch-build-tools.git
+Currently it resides at https://xenbits.xen.org/git-http/livepatch-build-tools.git
 
 ### Exception tables and symbol tables growth
 
diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index 8f80d61d2f1aa9e63da9b1e61b77a67c826efe6f..7826419dad563a3b70c3c97fc4c0fb5339bd58e9 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -271,7 +271,7 @@ Hi all,
 
 Xen X.Y rcZ is tagged. You can check that out from xen.git:
 
-git://xenbits.xen.org/xen.git X.Y.0-rcZ
+https://xenbits.xen.org/git-http/xen.git X.Y.0-rcZ
 
 For your convenience there is also a tarball at:
 https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 48e07370e8d462ced70a1de13ec8134b4eed65ba..cf629cdf3c44e4abe67214378c49a3a9d858d9b5 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1457,7 +1457,7 @@ sub vcs_exists {
 	warn("$P: No supported VCS found.  Add --nogit to options?\n");
 	warn("Using a git repository produces better results.\n");
 	warn("Try latest git repository using:\n");
-	warn("git clone git://xenbits.xen.org/xen.git\n");
+	warn("git clone https://xenbits.xen.org/git-http/xen.git\n");
 	$printed_novcs = 1;
     }
     return 0;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

