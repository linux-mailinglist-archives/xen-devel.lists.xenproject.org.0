Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33E68CD20
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 04:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490798.759652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPEOC-0007dY-TE; Tue, 07 Feb 2023 03:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490798.759652; Tue, 07 Feb 2023 03:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPEOC-0007b0-Pa; Tue, 07 Feb 2023 03:11:24 +0000
Received: by outflank-mailman (input) for mailman id 490798;
 Tue, 07 Feb 2023 03:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaN9=6D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPEOA-0007au-UY
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 03:11:23 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 156e8f3e-a695-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 04:11:17 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 798D95C00E3;
 Mon,  6 Feb 2023 22:11:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 06 Feb 2023 22:11:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Feb 2023 22:11:13 -0500 (EST)
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
X-Inumbo-ID: 156e8f3e-a695-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm3; t=1675739475; x=
	1675825875; bh=YzwotlKDm6EYuoAYh/dxRDIrWRC+9rhY3acqxK9reeI=; b=S
	zGz+GZRdZ7y1/isF5Za2SgRv88gm70n7InL65f29WjxMPMqPyKb89m6BQlFm3gRe
	hFjI6oMvnidsryzJwt+XaicxbL7y7A0OJKRIkRKHzgzA/p4HEOm+6rjCqpoJD195
	NAaVlvIeo/7w6rLYk+neKQHNTJPRp0WwkeaImyNccEfG66RhRpb6bv3FFPAhu6KH
	wJ4OYDXoD5YPBcsUSFEnfz7ujFKglm2FXVSaUEaFwUu/R61CiuJzqFjAYmpqt6J8
	sD+LVL/O1GfINN1lQ7Vf18CKcxj4jFX5USV6dme6cOLK4NqceLEf6QdkUaMaUNfA
	WlCBRbDEpkMI34c0415Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1675739475; x=1675825875; bh=YzwotlKDm6EYuoAYh/dxRDIrWRC+9rhY3ac
	qxK9reeI=; b=jWNWW+WOK7QaiNf2vY4VgCS9OsUmjWHc+IxGeHyQnvvC1cwd1P0
	M9AJr8QwC+HFBAFWLXrobshVKhcbdefBRStx2EW7OX26upX/jO3u7JsnBo8J6jA3
	IAvdKcN0U1lJHNrlghupnB46oFKMrAzFI2KOtYhlz4sOByUd6Z8SbHbmt0BQo77a
	/Tw+zdLfe8SVQzEFL3CLDAhlbaGne2pE/0WU07jPtZw+6LyAA9wB/D0OyalwJTZl
	+EPihuWWz/i+PUwHBInXYGulglS3sh5tJaGTwhTkXbTWMOFsL6CrdWLUmO/y122O
	TXnraPDCXSiq618ajKh17aHx0qU27dWJ0eg==
X-ME-Sender: <xms:U8HhYx57yI-bUgMkr2udNuvrphLNIsgYISga7DrJCEP6SPjrQfhEEA>
    <xme:U8HhY-57lyIb7Jl90giPgzi5vFI245V8j74dHNB6BaxnFZK3R5AtxPzT4nxYrYHJK
    6gP652RX-C8c68>
X-ME-Received: <xmr:U8HhY4fwn26THNzUE_3cSiQvBUl-g0rtfinWvuhsdu5o1yCduhcGizISPq1pXqbsXUc3099GNhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegjedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepleejtedukeekvddtudeitdfftedvuddt
    vedtgfetjeeiteffkefhkeevvdfhtefgnecuffhomhgrihhnpeigvghnrdhorhhgpdhphi
    hthhhonhdrohhrghdpihhnthgvlhdrtghomhdptggvnhhtohhsrdhorhhgpdhllhhvmhdr
    ohhrghdpuggvsghirghnrdhorhhgpdgrlhhpihhnvghlihhnuhigrdhorhhgpdhslhhofi
    hglhgrshhsrdgtohhmpdhsphhhihhngidqughotgdrohhrghdpiihlihgsrdhnvghtpdhk
    vghrnhgvlhdrohhrghdprhgvughhrghtrdgtohhmpdhgnhhurdhorhhgpdhinhhrihgrrd
    hfrhdpghhmphhlihgsrdhorhhgpdhpohhlrghrshhslhdrohhrghdpsggvrhhlihhoshdr
    uggvpdhiphigvgdrohhrghdpvghthhgvrhgsohhothdrohhrghdpphgtihhsihhgrdgtoh
    hmpdhmihgtrhhoshhofhhtrdgtohhmpdgumhhtfhdrohhrghenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvg
    hthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:U8HhY6Ifit-S32fqti-KhjL6aPiTJt_AAz0IpKAnO_qhLnzpf_UniQ>
    <xmx:U8HhY1LI1icsLqSjR-RfGejidUDLjT0yRZJiXiQkXSCdRKfDoxgbuQ>
    <xmx:U8HhYzyT6zZYxcJ7ba_n2LyszodZm3iasRBr2oa18HH0TFMAHe19Lw>
    <xmx:U8HhYyATqOCFkVdoDJ2v2CEqID-wKYekzDWftVcRP7W9sZMRmmlQVw>
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
	Doug Goldstein <cardoe@cardoe.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Replace git:// and http:// with https://
Date: Mon,  6 Feb 2023 22:10:33 -0500
Message-Id: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch was created by doing a tree-wide search and replace with sed,
then reverting changes that were pointless or wrong.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk                                    | 20 ++++++--------------
 README                                       |  4 ++--
 automation/build/centos/CentOS-7.2.repo      |  8 ++++----
 automation/build/debian/stretch-llvm-8.list  |  4 ++--
 automation/build/debian/unstable-llvm-8.list |  4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh  |  2 +-
 docs/README.remus                            |  2 +-
 docs/conf.py                                 |  2 +-
 scripts/get_maintainer.pl                    |  2 +-
 stubdom/configure                            | 18 +++++++++---------
 stubdom/configure.ac                         | 18 +++++++++---------
 stubdom/grub.patches/10graphics.diff         |  2 +-
 tools/examples/xeninfo.pl                    |  2 +-
 tools/firmware/etherboot/Makefile            |  4 ++--
 tools/firmware/etherboot/README              |  2 +-
 tools/firmware/hvmloader/pci_regs.h          |  2 +-
 tools/firmware/hvmloader/pir.c               |  2 +-
 tools/firmware/hvmloader/pir_types.h         |  2 +-
 tools/firmware/hvmloader/smbios_types.h      |  2 +-
 19 files changed, 47 insertions(+), 55 deletions(-)

diff --git a/Config.mk b/Config.mk
index 10eb443b17d85381b2d1e2282f8965c3e99767e0..fd0719e38be1c679946c4d677c0f0dbdb2a85411 100644
--- a/Config.mk
+++ b/Config.mk
@@ -191,7 +191,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
-XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
+XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
 # the internet.  The original download URL is preserved as a comment
 # near the place in the Xen Makefiles where the file is used.
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
+OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/ovmf.git
+QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/qemu-xen.git
+QEMU_TRADITIONAL_URL ?= https://xenbits.xen.org/qemu-xen-traditional.git
+SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/seabios.git
+MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/mini-os.git
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
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
index 98e4d481f65c2b29ac935ddf6247132ddf94fa1d..22ec2f2474ed3d1f1f614085f9bd832be4d42496 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -4,7 +4,7 @@ set -ex
 
 cd binaries
 # Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+curl --fail --silent --show-error --location --output vmlinuz https://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
 # Use a tiny initrd based on busybox from Alpine Linux
 curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
diff --git a/docs/README.remus b/docs/README.remus
index e41e045a109466213b39bf5099ee16652b229ccc..5e411addb1a63f1b2c01ff165fc6f74d6d81c8ea 100644
--- a/docs/README.remus
+++ b/docs/README.remus
@@ -7,7 +7,7 @@ Using Remus with libxl on Xen 4.5 and higher:
  To enable network buffering, you need libnl 3.2.8
  or higher along with the development headers and command line utilities.
  If your distro does not have the appropriate libnl3 version, you can find
- the latest source tarball of libnl3 at http://www.carisma.slowglass.com/~tgr/libnl/
+ the latest source tarball of libnl3 at https://www.carisma.slowglass.com/~tgr/libnl/
 
 Disk replication:
  VMs protected by Remus need to use DRBD based disk backends. Specifically, you
diff --git a/docs/conf.py b/docs/conf.py
index 50e41501db8f95bd186818c49a8e6538d733012b..7f4adce29e57e4ab8be9a09fc105bb133c51dbb0 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -5,7 +5,7 @@
 #
 # This file does only contain a selection of the most common options. For a
 # full list see the documentation:
-# http://www.sphinx-doc.org/en/master/config
+# https://www.sphinx-doc.org/en/master/config
 
 # -- Path setup --------------------------------------------------------------
 
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 48e07370e8d462ced70a1de13ec8134b4eed65ba..9f32e0e0c0ec5c491209d6e73232b5a388b0a588 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1457,7 +1457,7 @@ sub vcs_exists {
 	warn("$P: No supported VCS found.  Add --nogit to options?\n");
 	warn("Using a git repository produces better results.\n");
 	warn("Try latest git repository using:\n");
-	warn("git clone git://xenbits.xen.org/xen.git\n");
+	warn("git clone https://xenbits.xen.org/xen.git\n");
 	$printed_novcs = 1;
     }
     return 0;
diff --git a/stubdom/configure b/stubdom/configure
index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..92d0e7f74f5f9d28460d33ea012daffaaf8d6759 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   ZLIB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  ZLIB_URL="http://www.zlib.net"
+  ZLIB_URL="https://www.zlib.net"
 fi
 
 fi
@@ -3550,7 +3550,7 @@ if test "x$LIBPCI_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   LIBPCI_URL=\$\(XEN_EXTFILES_URL\)
 else
-  LIBPCI_URL="http://www.kernel.org/pub/software/utils/pciutils"
+  LIBPCI_URL="https://www.kernel.org/pub/software/utils/pciutils"
 fi
 
 fi
@@ -3565,7 +3565,7 @@ if test "x$NEWLIB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   NEWLIB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  NEWLIB_URL="ftp://sources.redhat.com/pub/newlib"
+  NEWLIB_URL="https://sources.redhat.com/pub/newlib"
 fi
 
 fi
@@ -3580,7 +3580,7 @@ if test "x$LWIP_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   LWIP_URL=\$\(XEN_EXTFILES_URL\)
 else
-  LWIP_URL="http://download.savannah.gnu.org/releases/lwip"
+  LWIP_URL="https://download.savannah.gnu.org/releases/lwip"
 fi
 
 fi
@@ -3595,7 +3595,7 @@ if test "x$GRUB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   GRUB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  GRUB_URL="http://alpha.gnu.org/gnu/grub"
+  GRUB_URL="https://alpha.gnu.org/gnu/grub"
 fi
 
 fi
@@ -3607,7 +3607,7 @@ GRUB_VERSION="0.97"
 
 if test "x$OCAML_URL" = "x"; then :
 
-	OCAML_URL="http://caml.inria.fr/pub/distrib/ocaml-4.02"
+	OCAML_URL="https://caml.inria.fr/pub/distrib/ocaml-4.02"
 
 fi
 OCAML_VERSION="4.02.0"
@@ -3621,7 +3621,7 @@ if test "x$GMP_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   GMP_URL=\$\(XEN_EXTFILES_URL\)
 else
-  GMP_URL="ftp://ftp.gmplib.org/pub/gmp-4.3.2"
+  GMP_URL="https://ftp.gmplib.org/pub/gmp-4.3.2"
 fi
 
 fi
@@ -3636,7 +3636,7 @@ if test "x$POLARSSL_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   POLARSSL_URL=\$\(XEN_EXTFILES_URL\)
 else
-  POLARSSL_URL="http://polarssl.org/code/releases"
+  POLARSSL_URL="https://polarssl.org/code/releases"
 fi
 
 fi
@@ -3651,7 +3651,7 @@ if test "x$TPMEMU_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   TPMEMU_URL=\$\(XEN_EXTFILES_URL\)
 else
-  TPMEMU_URL="http://download.berlios.de/tpm-emulator"
+  TPMEMU_URL="https://download.berlios.de/tpm-emulator"
 fi
 
 fi
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index e20d99edac0da88098f4806333edde9f31dbc1a7..846d1dbe66df86c5f19924670f0a296bfacdddb4 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -55,15 +55,15 @@ AC_PROG_INSTALL
 AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
-AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [http://www.zlib.net])
-AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [http://www.kernel.org/pub/software/utils/pciutils])
-AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [ftp://sources.redhat.com/pub/newlib])
-AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [http://download.savannah.gnu.org/releases/lwip])
-AX_STUBDOM_LIB([GRUB], [grub], [0.97], [http://alpha.gnu.org/gnu/grub])
-AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [http://caml.inria.fr/pub/distrib/ocaml-4.02])
-AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [ftp://ftp.gmplib.org/pub/gmp-4.3.2])
-AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [http://polarssl.org/code/releases])
-AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [http://download.berlios.de/tpm-emulator])
+AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [https://www.zlib.net])
+AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://www.kernel.org/pub/software/utils/pciutils])
+AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sources.redhat.com/pub/newlib])
+AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
+AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
+AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
+AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://ftp.gmplib.org/pub/gmp-4.3.2])
+AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [https://polarssl.org/code/releases])
+AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [https://download.berlios.de/tpm-emulator])
 
 #These stubdoms should be enabled if the dependent one is
 AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
diff --git a/stubdom/grub.patches/10graphics.diff b/stubdom/grub.patches/10graphics.diff
index 5ee2852fd7d7595c7fe17acbb6096ae96f04aaf4..e80aab75bd31ac677ab2884718673094d97b3df2 100644
--- a/stubdom/grub.patches/10graphics.diff
+++ b/stubdom/grub.patches/10graphics.diff
@@ -1187,7 +1187,7 @@ diff -Naur grub-0.97.orig/stage2/graphics.c grub-0.97/stage2/graphics.c
 + *  GNU General Public License for more details.
 + *
 + *  You should have received a copy of the GNU General Public License
-+ *  along with this program; If not, see <http://www.gnu.org/licenses/>
++ *  along with this program; If not, see <https://www.gnu.org/licenses/>
 + */
 +
 +#ifdef SUPPORT_GRAPHICS
diff --git a/tools/examples/xeninfo.pl b/tools/examples/xeninfo.pl
index 95a15d9595c0f4bf09c9429099bd3b27e98ebf3e..1815d1d9f219799a83fbc0329a4a1a010264893e 100644
--- a/tools/examples/xeninfo.pl
+++ b/tools/examples/xeninfo.pl
@@ -36,7 +36,7 @@ sub apiconnect
 {
 	foreach my $xenhost (keys %xenhosts)
 	{
-		my $xen = RPC::XML::Client->new("http://$xenhost:$xenhosts{$xenhost}{'port'}");
+		my $xen = RPC::XML::Client->new("https://$xenhost:$xenhosts{$xenhost}{'port'}");
 		my $session = $xen->simple_request("session.login_with_password", "user","");
 		if (! $session)
 		{
diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index 4bc3633ba3d67ff9f52a9cb7923afea73c861da9..b6d420786c3d0895e2118ce789ebdff585268f96 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -5,9 +5,9 @@ include $(XEN_ROOT)/tools/Rules.mk
 include Config
 
 ifeq ($(GIT_HTTP),y)
-IPXE_GIT_URL ?= http://git.ipxe.org/ipxe.git
+IPXE_GIT_URL ?= https://git.ipxe.org/ipxe.git
 else
-IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
+IPXE_GIT_URL ?= https://git.ipxe.org/ipxe.git
 endif
 
 # put an updated tar.gz on xenbits after changes to this variable
diff --git a/tools/firmware/etherboot/README b/tools/firmware/etherboot/README
index 5e3c1daf588fb33bc82238b818ba6aef5c8062e5..4ea8891478ef7973af97538c9733d4ce1506005f 100644
--- a/tools/firmware/etherboot/README
+++ b/tools/firmware/etherboot/README
@@ -13,7 +13,7 @@ Since gPXE upstream do not appear to distribute tarballs, we
 generated one ourselves with the following runes (to extract the tree
 as on 25th September 2008):
 
- git clone git://git.etherboot.org/scm/gpxe.git
+ git clone https://git.etherboot.org/scm/gpxe.git
  cd gpxe
  git archive --format=tar --prefix=gpxe/ c24bc349ead939d90b5784dbff3cd9fdb9d83ba8 | gzip -n >../gpxe-git-snapshot.tar.gz
 
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 7bf2d873ab644c5d342a7e4112a94814e62ce71c..4b093308f6af346afed7cf55c764fd46560bc700 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -6,7 +6,7 @@
  * Copyright 1997--1999 Martin Mares <mj@ucw.cz>
  *
  * For more information, please consult the following manuals (look at
- * http://www.pcisig.com/ for how to get them):
+ * https://www.pcisig.com/ for how to get them):
  *
  * PCI BIOS Specification
  * PCI Local Bus Specification
diff --git a/tools/firmware/hvmloader/pir.c b/tools/firmware/hvmloader/pir.c
index cc420ddff48d0c4f748552fbddc106930796b903..369b4f9b903f961bf79ee2015384187084e40d1e 100644
--- a/tools/firmware/hvmloader/pir.c
+++ b/tools/firmware/hvmloader/pir.c
@@ -19,7 +19,7 @@
 
 /*
  * The structure of these tables is described in
- * http://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
+ * https://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
  */
 unsigned long create_pir_tables(void)
 {
diff --git a/tools/firmware/hvmloader/pir_types.h b/tools/firmware/hvmloader/pir_types.h
index 9f9259c2e144420d4cb1db190a7af447283624ad..5129b0c7fd9a087810a299ee8930f755814a263b 100644
--- a/tools/firmware/hvmloader/pir_types.h
+++ b/tools/firmware/hvmloader/pir_types.h
@@ -17,7 +17,7 @@
  * Copyright (C) Citrix Systems, 2011
  *
  * See the PCI Interrupt Routing spec for more detail:
- *   http://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
+ *   https://www.microsoft.com/taiwan/whdc/archive/pciirq.mspx
  */
 
 #ifndef PIR_TYPES_H
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71698af003f1600a150b1b77fe880254..3f1c120da60b6aa95cb2b6b1f03cc31d912832a4 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -19,7 +19,7 @@
  * Authors: Andrew D. Ball <aball@us.ibm.com>
  *
  * See the SMBIOS 2.4 spec for more detail:
- *   http://www.dmtf.org/standards/smbios/
+ *   https://www.dmtf.org/standards/smbios/
  */
 
 #ifndef SMBIOS_TYPES_H
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


