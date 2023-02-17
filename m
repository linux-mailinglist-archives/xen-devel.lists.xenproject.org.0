Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A069B4D4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 22:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497310.768250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OP-0005vm-D5; Fri, 17 Feb 2023 21:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497310.768250; Fri, 17 Feb 2023 21:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OP-0005td-A6; Fri, 17 Feb 2023 21:35:45 +0000
Received: by outflank-mailman (input) for mailman id 497310;
 Fri, 17 Feb 2023 21:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk7L=6N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pT8OO-0005eU-1D
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 21:35:44 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 076df585-af0b-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 22:35:43 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 22D26320089C;
 Fri, 17 Feb 2023 16:35:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 17 Feb 2023 16:35:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 16:35:39 -0500 (EST)
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
X-Inumbo-ID: 076df585-af0b-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676669740; x=1676756140; bh=+fUifg3+9Sx5Ngno/T4jBLJLFOiv4d2p9UY
	Hj/k/F/0=; b=bI/SwuuTCUFWbqFIswklDhSzM3zSdBkjB0Mo/eFk6Ez4o4nN0II
	xkNxRSbnIQfa1YFUwGMc+oJV+SwwImEiRqBb45/ouMh7RNOrL4K/jm4GrNWuGKAZ
	33D4aVoVlmZClGkPF/DX7rFov9ZxjnqnDoOb+bnaC3dTCZAE67e28cACo0A6HvqR
	taL3/KfXN8x3ENmjWVLwwM3/8YrglAe4lcHsyoYt/qL8uBfnxtoblq6Hwk6sT9PZ
	fjQa2AMJ+QgO6+0+Z/v4E/kWwMkbu5hwvJgxYsVH1xXauHzRiBiKojKbsQncURFz
	9JZj6/O9nU+FpqyLpAk3HiLUtrAcxI9a0Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676669740; x=1676756140; bh=+fUifg3+9Sx5N
	gno/T4jBLJLFOiv4d2p9UYHj/k/F/0=; b=RP+EdWsDxv0ErGF+W7B4uXt4wW78w
	H8yJ8xKAubPGvOjRbe5r67qBeFgM11JH5dT4EA4x42OTV/Nx4A3/wE5DeUs9zzCt
	txnWxYZBbN/Q0OtU75gyrrYpJqqQGM3XiILqyewYjNzVp6555L2BjkuyqdnS0EXS
	X/edlzbmm5I9V/PPTyseN9G9GUFPNCp5ZjpU6y9n7JqlMaxtJ4ruZotTt+NX2WMj
	yifrYFGhM/eyQ4mAGXG1FJhrHKYIakUkMIX6FCD6QLxNsluDz3f5GuzJVgGjweUw
	oM5kFg/Yc4PIDKGXpTbBG7zSDRrEkogP43sEEiuHQgdAHPOgWO5Rabwkw==
X-ME-Sender: <xms:LPPvY5QRU_6tIXlXqCzmT9anI6ScLoVb8JVH_K0bKyZCbxPaEW4Fcw>
    <xme:LPPvYyyQj78kIMS4SJby5YVzzmxNPeNcTj4VJojlvIA7ZOuxbuYqZHXTSmCnoAtZ1
    7eSuiUJgXF-_LM>
X-ME-Received: <xmr:LPPvY-1CmJN-OP9MYjNRFJXElU2CSwcvlyNkYBBXLbcFdGgjuJWx4CYPa_Mq2UlgXhjkNVJGWsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeugfffieehhfffleekheffleej
    ueetiefhiedujeegueffhfehuefgkefhieffieenucffohhmrghinhepgigvnhdrohhrgh
    dpgigvnhhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:LPPvYxDZVCE0ah3HEtuiTXzZuedouVf2YB3Fq5R27Aw83I6ifq67Gw>
    <xmx:LPPvYyiQKKNCmSSh_6YR6uow4UBUenpztnkMMfVzcb6vOBTqDlNmwA>
    <xmx:LPPvY1rtj_9Z-uE9ilh1CsYU_OFLSXqRoVScw2g-G0aog559k8vbjw>
    <xmx:LPPvY2h97Yjpm5dc6RjUA5lrwcFYMfryPV3jNyv280BI7vcwI9a8HQ>
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
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 1/4] Use HTTPS for all xenbits.xen.org Git repos
Date: Fri, 17 Feb 2023 16:35:24 -0500
Message-Id: <a8ce128b0d233067ffe33ad00e077ebac6cac1a7.1676668923.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676668922.git.demi@invisiblethingslab.com>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
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

