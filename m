Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6969BE49
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 03:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497655.768556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmY-0003ME-6s; Sun, 19 Feb 2023 02:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497655.768556; Sun, 19 Feb 2023 02:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmY-0003KE-3D; Sun, 19 Feb 2023 02:50:30 +0000
Received: by outflank-mailman (input) for mailman id 497655;
 Sun, 19 Feb 2023 02:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uhw5=6P=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pTZmW-0002Vk-B1
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 02:50:28 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29919810-b000-11ed-933d-83870f6b2ba8;
 Sun, 19 Feb 2023 03:50:27 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 27CBE3200583;
 Sat, 18 Feb 2023 21:50:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 18 Feb 2023 21:50:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 21:50:23 -0500 (EST)
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
X-Inumbo-ID: 29919810-b000-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676775024; x=1676861424; bh=x1U4BNcj9Zecyq6U+qye/Zm4u8N3JEG92kP
	6XRxNw5M=; b=hyEmewljALJ6TecsrhfSuyupXf0mwhAyzyA2sNRKSkT17UL5nMK
	po6gDn2Xys532BqHGimKCsiwfiXV0ATqV13gTO4hcvdKVKeT+6fPlEXqXGVBW0gX
	pzg3fcug5r+XVDsobOHKw2pIJtux5p37N44I84m8rXMnKqGEaN+dC9S/2ZPu2G+r
	psS1lnBCs7nf9u8CMHE6JpgFDsRwvyTsPPf4mKoFG7JBMcKZjrIs9ecHOgIiIAJc
	y1RZ6Ov0ermw69a7Ushk0r/RGihAYD1U8lS+LWXTILAw1woe+47Xz4A4lH7jG/ni
	olJi0drxdFCgEZkB1/9htfPL+bL4Rt0k57g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676775024; x=1676861424; bh=x1U4BNcj9Zecy
	q6U+qye/Zm4u8N3JEG92kP6XRxNw5M=; b=Ce/iG8l5PGkiL2aDxsYWvD9Lf47va
	rVHfT5CgeMYrT/cpn0qL68HbgfvsB7BzVhFXUhwmXB2KYl5oG2tcJmX01CPNhi12
	3i6RlEqNxPOiXwDsyUuNrnu5gfseZ94hwEeJ/nKjxD3ONvk1o20Afb6Q0eO1Sm02
	kgqcT2DREBEbGhnf54ViBD34gOIOgke3BjHYEv4hQ2r6rOR8oVdzlGz/PtCBRSc+
	OJ6F6HKMwUukRgg/6823ySM1beD4D5vymJgLyp4dTAjNSegeavIJ5WbLePpykEQH
	5CbpcqlRStAGIed/cnh5K9AipXKDvuzTB+XDNX2NI+rGcy+0W3iuFlMtw==
X-ME-Sender: <xms:cI7xYwIIAI5wehopl4ksSeWKHbmH9dlOPid72hOP5s0TlBolWOfz_g>
    <xme:cI7xYwJRA-MOoitXVaYeAu7JNbgFDi6_qISmfjCNu3Rk1xeaELWVnVe0LVVfUmu7P
    VukTN2zkAXsiCQ>
X-ME-Received: <xmr:cI7xYwuiaQTq9AIDDe40UJzGnaWk6lJfCAPbXIQEOpxf8mPydcROKi02q3MPv6vbbju5_uJvPB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddghedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:cI7xY9ZMl_lDQ3yf69tIe_HbPtWfWow3PbBeiuk5EmhfL7r4UQcUvA>
    <xmx:cI7xY3a__9lQ5FyK2FhRXkIGVcl2iroTpCMKFDeF9HZuIvb-js_s1w>
    <xmx:cI7xY5All-3GbkU6bdEhrCiZ1sjijlKflFpR7DqJ7s-yOkPpTaNAVw>
    <xmx:cI7xY74fyxG_It2pcTnumetu4e-DMneO4c3CCTgYmWwcDlrqufZGqw>
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
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 3/3] Automation and CI: Replace git:// and http:// with https://
Date: Sat, 18 Feb 2023 21:46:15 -0500
Message-Id: <ca4d768f3650f9c0646fe39e013f6ec1972ea2e6.1676750305.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676750305.git.demi@invisiblethingslab.com>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in automation and CI.
All URLs are known to work.

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
index 98e4d481f65c2b29ac935ddf6247132ddf94fa1d..950ad3a0daa63d66fc8647c0a390ff59c2f22b1a 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -4,7 +4,7 @@ set -ex
 
 cd binaries
 # Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+curl --fail --silent --show-error --location --output vmlinuz https://ftp.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
 # Use a tiny initrd based on busybox from Alpine Linux
 curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

