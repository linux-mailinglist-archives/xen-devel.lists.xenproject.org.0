Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF056C384D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512923.793343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsj-0003h3-Ku; Tue, 21 Mar 2023 17:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512923.793343; Tue, 21 Mar 2023 17:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefsj-0003eg-Ge; Tue, 21 Mar 2023 17:34:45 +0000
Received: by outflank-mailman (input) for mailman id 512923;
 Tue, 21 Mar 2023 17:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pefsh-0003LR-4h
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:34:43 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9314462-c80e-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:34:42 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 03DA33200900;
 Tue, 21 Mar 2023 13:34:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 21 Mar 2023 13:34:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:34:38 -0400 (EDT)
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
X-Inumbo-ID: a9314462-c80e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420079; x=1679506479; bh=+fUifg3+9S
	x5Ngno/T4jBLJLFOiv4d2p9UYHj/k/F/0=; b=FKm5VKycRTtDrQgjQNcDM4m1HS
	eJQxKeRpDalsQ8MfENUCUe35Opl7e4/wBASg4BY5VC1WuQUsoEKXHH6PBODy6tEc
	7zMjWIns/fPJV/puPoHCEQmTKiIB5ED1XWugbE04UFXfHIYO8DnDxk7/ldAMoyvS
	okB/f/CEVTX3MSNdUcNklOEOodVoi69TogmangfkztenG78hmesJXtTw3lkUtt7K
	aeEoLjc+2KqaNwRg9Ux7AVNRZfkchQZETFA+NU4KdoMDkI8NF2hrWdBSvcLaZK+N
	3ICbcVQQNhYi3mRLpPO6SKByQ6olBu0TzlLQEl/xBSgsf4QyXriuxhG4Gm/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420079; x=
	1679506479; bh=+fUifg3+9Sx5Ngno/T4jBLJLFOiv4d2p9UYHj/k/F/0=; b=N
	Er67vUgALb8ZGILOTlAOVnfZGsgCLIZtnvBvkeQfYpZJA1r8tYz4NRDfFzhlBAYL
	5h03hI4I6gm/3wZcQK95q7w87JcDOBak7cEu+LW9JUuQVhdbwT6ex6I4xg1GgJLW
	2f8KXkMk2L6DXyLSpUUn7yLaZwzErUm96FgQdeVmzPzIAzaik1ldC82ZjvPmzFXs
	sGEN7ne/+dIQaoOzS0KSZXHM4rP/XDUlNxvCFlLTBY3WOUnoXiSraQvPcEbeDoLd
	u3D5niA05TcYt3ZthZiRyn3mXjxvhKfSexg8Kym5OnGkDkIG+y1HTxOpa5gO0T59
	y316d0GqIL8H/LIaHI8WA==
X-ME-Sender: <xms:r-oZZHFsv3J0pjkzeB9t1VJF2b3hFLUolZBYpPaKSPf8dvHPnTAWfA>
    <xme:r-oZZEXOEBXbPjGtKRk_cRChfPXooAdLE5AnlQSoBA1Rd5a_HK4On_wwUW-t8mp-6
    bwusgQ6f_aN00w>
X-ME-Received: <xmr:r-oZZJIpdga_Y2KZdMpYPuuOUpb0g8CKPqdIBmHcBu-9S8lSQwIjaVg8cxG0nsjrrLw9fQ5d4R0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeugfffieehhfffleekheffleej
    ueetiefhiedujeegueffhfehuefgkefhieffieenucffohhmrghinhepgigvnhdrohhrgh
    dpgigvnhhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:r-oZZFFLJB2UbLRMPomwod_bwABNCnLuCVpBu1IkD3J2LfkU29PSPg>
    <xmx:r-oZZNWbDu3FndGIl-hZKkqjsJf57n2UNv4wamQh_jysAvPlHVyEtg>
    <xmx:r-oZZANUfO7gWHPpRpAQLoy4n6ETVTZiz3qY9amIAOMNxOuh-cswaw>
    <xmx:r-oZZJqaKl62Y7dPeNuD68jKB7DShzlBNxq3EX8zhtv8YGTU5gWZAA>
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
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 1/5] Use HTTPS for all xenbits.xen.org Git repos
Date: Tue, 21 Mar 2023 13:33:34 -0400
Message-Id: <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
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


