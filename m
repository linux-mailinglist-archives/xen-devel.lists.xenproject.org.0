Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A3D68F94B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 21:59:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491994.761382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPrWe-00082h-Bm; Wed, 08 Feb 2023 20:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491994.761382; Wed, 08 Feb 2023 20:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPrWe-00080Z-7q; Wed, 08 Feb 2023 20:58:44 +0000
Received: by outflank-mailman (input) for mailman id 491994;
 Wed, 08 Feb 2023 20:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPrWc-0007kX-Ko
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 20:58:42 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d433fe9-a7f3-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 21:58:40 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C1455C013E;
 Wed,  8 Feb 2023 15:58:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Feb 2023 15:58:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 15:58:38 -0500 (EST)
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
X-Inumbo-ID: 5d433fe9-a7f3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675889920; x=1675976320; bh=YjlH9X1VyXgKgkGafsk0dvpHNT7Xq4V4f4f
	mb7TTmQY=; b=jaEcFfmHc3jC4mYccFTIPr09qO7jo80ZccMUmV7ONnH7Y13AcC1
	J0mqLLxFgjaQ7taNYM/UqrQ1pUVcB5eGD1QXvpm75yZEyliVvM99ErUNaFdhkFCT
	GLBQEbceYawOVVStZOfeU7ZJVvRXToWHeouzAh7mpopV169AweJxZRa2PxXk8a+r
	jOAHpX4+aWWmrQau5OkCA/UANUQsGoVeCFZf7+t9JTXJliuJ2E3oOCSh1hSutPhf
	Fz6N7NArDclx7i2KcIuh+qYRACQUnHubGyBHWoq6g59kJF1gu5dOZngWMOz0VUoq
	p5NekZSxz0CXEWDMEFgB5CldR83ZC6dO0Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1675889920; x=1675976320; bh=YjlH9X1VyXgKg
	kGafsk0dvpHNT7Xq4V4f4fmb7TTmQY=; b=epZVL0unkdc7f5L0bOAadoCipddZY
	oDZp2lKBJaGzoNwWCywg+liuQqg1MZlPBLE+bWlQtPeCEFWoI3Oeba7XhrAiQXW6
	hZcx6twW/Nxxs61YTlagFpQ7ACJCOdmL9Rb0GGQeT6c3Vgtws0gPh7YrO6bhorEd
	PxjLp5KN3fRSyjYQN8yZFgK0CMBp9XhnKf8bBGovIaFeWZsT8Y5Xtu1LKYLyMAUM
	N4Juxc6hTSY9ctAH+xX5tfjRebTilxhBzhRzexd/qX5rLBo+j58GbwWymSVfIARx
	ytuY6eQ9CtziUqaT1vK5wff7YAP0b6vgw6hAH2ofBr3bZ6FfTtworH71A==
X-ME-Sender: <xms:_wzkY9nLq60Omlz3mRI79IGgILONohEJGSdCOmyjnXi4D3CW172Uag>
    <xme:_wzkY43dTK0iL16Uvpw2YkOF30d9xUAf5wd-vlhwH_lEQF2jUZ6FIRzFbEVmAwVm5
    YI4rR0gisFpytI>
X-ME-Received: <xmr:_wzkYzpbI1TlOx06GDFoPa6EWTeoPJUDSHdmt79S7EiX5rCC3mn9ONcf7688k07VARWi5bX4Png>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteduueehgeeujeegudeiffffveel
    teeljeevudeileffieetgfegffeitedvkeeunecuffhomhgrihhnpehphihthhhonhdroh
    hrghdpihhnthgvlhdrtghomhdptggvnhhtohhsrdhorhhgpdhllhhvmhdrohhrghdpuggv
    sghirghnrdhorhhgpdgrlhhpihhnvghlihhnuhigrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_wzkY9lfX0HK4EoU_SmAnng7TbskdSCUx65lpsnRA0xRPBPdrXaQdw>
    <xmx:_wzkY72JCEyqK5Nkb2BjJvk4QQMyzZqvksVgtyPHOfJTHH2raf9PMA>
    <xmx:_wzkY8sPhWznX9uA3QOr6OlvJpfjr6JylW2ydG3ceiQzUvIABwnb-w>
    <xmx:AA3kY1rZ99mRymy1v4ueDY7zBQQ3rfUmcmeCfgLPBYBHlwWMrH3TEg>
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
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 2/4] Automation and CI: Replace git:// and http:// with https://
Date: Wed,  8 Feb 2023 15:58:22 -0500
Message-Id: <8a3d0ce9747e486e91ad5b47777c80293e0fd168.1675889602.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675889601.git.demi@invisiblethingslab.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in automation and CI.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 README                                       | 4 ++--
 automation/build/centos/CentOS-7.2.repo      | 8 ++++----
 automation/build/debian/stretch-llvm-8.list  | 4 ++--
 automation/build/debian/unstable-llvm-8.list | 4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh  | 2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/README b/README
index 755b3d8eaf8f7a58a945b7594e68a3fe455a7bdf..f8cc426f78d690f37e013242e81d4e440556c330 100644
--- a/README
+++ b/README
@@ -181,7 +181,7 @@ Python Runtime Libraries
 Various tools, such as pygrub, have the following runtime dependencies:
 
     * Python 2.6 or later.
-          URL:    http://www.python.org/
+          URL:    https://www.python.org/
           Debian: python
 
 Note that the build system expects `python` to be available. If your system
@@ -197,7 +197,7 @@ Intel(R) Trusted Execution Technology Support
 Intel's technology for safer computing, Intel(R) Trusted Execution Technology
 (Intel(R) TXT), defines platform-level enhancements that provide the building
 blocks for creating trusted platforms.  For more information, see
-http://www.intel.com/technology/security/.
+https://www.intel.com/technology/security/.
 
 Intel(R) TXT support is provided by the Trusted Boot (tboot) module in
 conjunction with minimal logic in the Xen hypervisor.
diff --git a/automation/build/centos/CentOS-7.2.repo b/automation/build/centos/CentOS-7.2.repo
index 4da27faeb5fa863fd4e140cbeaad308b9a543b86..8e37da1a03f839c486eb9bd0af46716cfb9086e0 100644
--- a/automation/build/centos/CentOS-7.2.repo
+++ b/automation/build/centos/CentOS-7.2.repo
@@ -6,28 +6,28 @@
 
 [base]
 name=CentOS-7.2.1511 - Base
-baseurl=http://vault.centos.org/7.2.1511/os/$basearch/
+baseurl=https://vault.centos.org/7.2.1511/os/$basearch/
 gpgcheck=1
 gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
 
 #released updates 
 [updates]
 name=CentOS-7.2.1511 - Updates
-baseurl=http://vault.centos.org/7.2.1511/updates/$basearch/
+baseurl=https://vault.centos.org/7.2.1511/updates/$basearch/
 gpgcheck=1
 gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
 
 #additional packages that may be useful
 [extras]
 name=CentOS-7.2.1511 - Extras
-baseurl=http://vault.centos.org/7.2.1511/extras/$basearch/
+baseurl=https://vault.centos.org/7.2.1511/extras/$basearch/
 gpgcheck=1
 gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
 
 #additional packages that extend functionality of existing packages
 [centosplus]
 name=CentOS-7.2.1511 - Plus
-baseurl=http://vault.centos.org/7.2.1511/centosplus/$basearch/
+baseurl=https://vault.centos.org/7.2.1511/centosplus/$basearch/
 gpgcheck=1
 gpgcheck=1
 enabled=0
diff --git a/automation/build/debian/stretch-llvm-8.list b/automation/build/debian/stretch-llvm-8.list
index 09fe843fb2a31ae38f752d7c8c71cf97f5b14513..590001ca81e826ab624ba9185423adf4b0c51a21 100644
--- a/automation/build/debian/stretch-llvm-8.list
+++ b/automation/build/debian/stretch-llvm-8.list
@@ -1,3 +1,3 @@
 # Strech LLVM 8 repos
-deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
-deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
+deb https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
+deb-src https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
diff --git a/automation/build/debian/unstable-llvm-8.list b/automation/build/debian/unstable-llvm-8.list
index dc119fa0b4df1bd6e742c42776710abcd6deaa86..1db1598997429d7a14d3fcd8f0f8152aa6d40b8a 100644
--- a/automation/build/debian/unstable-llvm-8.list
+++ b/automation/build/debian/unstable-llvm-8.list
@@ -1,3 +1,3 @@
 # Unstable LLVM 8 repos
-deb http://apt.llvm.org/unstable/ llvm-toolchain-8 main
-deb-src http://apt.llvm.org/unstable/ llvm-toolchain-8 main
+deb https://apt.llvm.org/unstable/ llvm-toolchain-8 main
+deb-src https://apt.llvm.org/unstable/ llvm-toolchain-8 main
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 98e4d481f65c2b29ac935ddf6247132ddf94fa1d..6163eeeda623527d0620fb20a23b589b1168a896 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -4,7 +4,7 @@ set -ex
 
 cd binaries
 # Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
 # Use a tiny initrd based on busybox from Alpine Linux
 curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


