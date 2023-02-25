Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD86A2BAF
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501868.773680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Ic-0007ia-Jo; Sat, 25 Feb 2023 20:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501868.773680; Sat, 25 Feb 2023 20:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Ic-0007gH-Fo; Sat, 25 Feb 2023 20:37:42 +0000
Received: by outflank-mailman (input) for mailman id 501868;
 Sat, 25 Feb 2023 20:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1Ib-0007PG-34
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:37:41 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb0e9ef-b54c-11ed-88bb-e56d68cac8db;
 Sat, 25 Feb 2023 21:37:40 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0E00932007E8;
 Sat, 25 Feb 2023 15:37:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 25 Feb 2023 15:37:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:36 -0500 (EST)
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
X-Inumbo-ID: 3eb0e9ef-b54c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357457; x=1677443857; bh=+fUifg3+9Sx5Ngno/T4jBLJLFOiv4d2p9UY
	Hj/k/F/0=; b=GjRCenfuZRaTxh3/zFIbA1iNlWi0h98bXO8KvuU3ykmRm5LDtpX
	CyDxnMRpJwkmdZ9R7xRbanMxhMet/qiCsM8W77O869bbnd0U14AvT6JHqgsbIa1A
	Q16ikHtslrSEHkxnWwWaUV8BPAdkk4MpULCvfrkkukQ8i+DQ4syERJvqechE/UzG
	RcBfm370/G1d1wwc+pSeW8LWaR7ex+XV01aTjCSYZKpvHdIgrdzACm2y5Ws4rSxS
	5/Xjhx/dqI5l9+mghmaXjH58opK87fp37G+IU4bD4thckxXFDvzCCNYnPN50+ZcQ
	Fw0UoB6Vg3lZfQ1h4Zvne+J6yPB+aq1Nfqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357457; x=1677443857; bh=+fUifg3+9Sx5N
	gno/T4jBLJLFOiv4d2p9UYHj/k/F/0=; b=jd7yvf37WWvrzLms1i7Wte/TCopwN
	k6FBV7CB2uMy6ZXqdilcLHpI3JiixfCxaHwdVFwaPi6Hq3pIlZpGlXzG1QA+14lb
	ZJ61P/HsTmItCSjGhWDlCcSPhTxNAh6lEAMenFnW0VEM0ABfd4qLRwFUiYV6XQe/
	WVlB3ULfpvDayE3WI8Fl2lmf04VfY046epmo5MBTlu3SwVOTxqh4fPswBenwA6/o
	tKOKl8qVsuUKBsjZEizV8BJ0vg15dtSpBW+NjE5uuu2Yy6zgFHLOV+EpNUeMN5Em
	Dx0XZYx5eYz6KhgjsYAGlfvbJv5OnjOwOL7thrcUr0ZxepUZb3luA41tg==
X-ME-Sender: <xms:kXH6Y8vPlGJOjy1l-tjOgmQE5BqeYT0sUTUKizexK3WEGkBsQW36WA>
    <xme:kXH6Y5f3Jo2BUeUyOhTSXVl75_ZHyMLxLCwUhtG6n_DXPVBAE8wYk0kYNfK8Oliat
    L07MTKXZVfnClo>
X-ME-Received: <xmr:kXH6Y3xtnUSqTv6xVmosqFsX1KGxeoLojZDzLM-v04QJiGokPsYROkzt5b_w84TEwJqLr6MVeBE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuefgffeihefhffelkeehffeljeeu
    teeihfeiudejgeeufffhheeugfekhfeiffeinecuffhomhgrihhnpeigvghnrdhorhhgpd
    igvghnphhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:kXH6Y_NxmGJ1YsTVT_ls1KcNWphZTNF7gIKJfjp4skH08dVhag9yzw>
    <xmx:kXH6Y8-akPNfBdLEyB1IeicL7ebTjWXqNy5aS9LTxkwTT_LWHIUxgw>
    <xmx:kXH6Y3WAYlk0pT0MvUOfhb4PQ0k6D_XFbA2exnTv-kkkF4V8n-K7fQ>
    <xmx:kXH6YwStsvqrz1U4X-75KmOG01Ysxe46j7ow79r9cAoWiy0DVaeNSg>
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
Subject: [PATCH v5 1/5] Use HTTPS for all xenbits.xen.org Git repos
Date: Sat, 25 Feb 2023 15:37:11 -0500
Message-Id: <9cb98cb9aaca22bbc88de9fd8cbd7f9463b4d425.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
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

