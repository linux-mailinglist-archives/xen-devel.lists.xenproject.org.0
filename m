Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078168E73F
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 05:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491523.760707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQb-0005j9-IK; Wed, 08 Feb 2023 04:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491523.760707; Wed, 08 Feb 2023 04:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQb-0005dU-Dl; Wed, 08 Feb 2023 04:51:29 +0000
Received: by outflank-mailman (input) for mailman id 491523;
 Wed, 08 Feb 2023 04:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPcQZ-0005Mi-EL
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 04:51:27 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d28f1e8-a76c-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 05:51:26 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 180585C0096;
 Tue,  7 Feb 2023 23:51:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 07 Feb 2023 23:51:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 23:51:23 -0500 (EST)
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
X-Inumbo-ID: 3d28f1e8-a76c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675831884; x=1675918284; bh=YjlH9X1VyXgKgkGafsk0dvpHNT7Xq4V4f4f
	mb7TTmQY=; b=gKUzfZSMSCQtZOKag+iELqMmfZhsasxn73CsNjmkRH/iAn1Km8p
	Ts+Wm430rpzCnxzHsnTbkUUNRzQIEojLTrU7QCHQbSeACTs7/CvdbwFvRpRU9NJA
	D8NcUZLi/NeTf3wnEBInAilwUWMwGlPWHdCJhu6yThfks2/GMHnH3R2u3Y7D8AeY
	CAfOj/dyqv4nV+p9Scl0foniYDo7xc4uAcbaloR/AA5r6u9ivMx9gWKVptz57237
	zqMS+Ib5PX961CR0xKvaOHm0kh5NhtXazpzIv8wDNB9XREYzBFxKakac9yG73cs2
	g27/lbHnF70UosycHRZcoyP88aIoZbJOcSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1675831884; x=1675918284; bh=YjlH9X1VyXgKg
	kGafsk0dvpHNT7Xq4V4f4fmb7TTmQY=; b=NMx4qk795RswMLjEiZLoBJkeUZfXp
	ahQC2we/9mUlVcWQrNl09IsgrAaefnPn7CGkLscbmDr7BGUPAEWr0U/lue2bSTx9
	YIOD/AkSWia8G0klz+P1E0pXguZuuLJWAYiCEDsYmck0REJYzdtgmaF1b17ODx4q
	nZnl0nc955b314uQT0H37vMDTlQBtSkOqdcPH+etWhqVmKu4Lb5oURE9b0oEvJcL
	xXUoLy18/VV7g9nbxye5xQ8J4meMYynYcjoKSu1qcQVRIAUDQ1tCFUsYV6a4vudU
	8CVew9fBB350c2pnyna+enY0eu9oCA7RnI08nPvANf3AqEWolagXxKAAQ==
X-ME-Sender: <xms:SyrjY_Nq2k6NfIwPbXbdjY_1eNnelfY5bd2Ky8aKOVaqTlB-9CSfag>
    <xme:SyrjY5_3D2kIaSs4y5VaH8it2qsx0-ernE5xylU5qmYTu2WoWoKCEw7-A35DZA_Ma
    GPbOz7LSo7Be-E>
X-ME-Received: <xmr:SyrjY-SgOTTGuU3-FNM8_lbvS59SW93NpG9iZzRzD-6_yFTE-_z0Vmb5A-3pYveA9ZGpLnaZqs8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledgjeegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:SyrjYzvFKVIHkY3efdXwKJoKKFOsF_llbvStw4dNOV6LGCmQCi--9A>
    <xmx:SyrjY3fAo7uhpJQlUx0wBAbBfOsNheJVjze4IVBXYcGNnXnRhufxoQ>
    <xmx:SyrjY_14PiRdpFXxZZQVwxfGyUyIBVBi8AeArXdNXa_hIpsIhA5xrg>
    <xmx:TCrjY_Ry1PvYln9Y-DNmWD7P-W5uy6IfOy5MzIdHv_OePn09ujrneQ>
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
Subject: [PATCH 2/4] Automation and CI: Replace git:// and http:// with https://
Date: Tue,  7 Feb 2023 23:51:05 -0500
Message-Id: <4dcc09d2621f5ae319e9a01895287bacbc4d6c86.1675829867.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675829866.git.demi@invisiblethingslab.com>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
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

