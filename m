Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE468F94D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 21:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491995.761388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPrWe-000863-Jf; Wed, 08 Feb 2023 20:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491995.761388; Wed, 08 Feb 2023 20:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPrWe-00082m-Ej; Wed, 08 Feb 2023 20:58:44 +0000
Received: by outflank-mailman (input) for mailman id 491995;
 Wed, 08 Feb 2023 20:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPrWc-000800-Lt
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 20:58:42 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6a5f2d-a7f3-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 21:58:39 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 360795C0114;
 Wed,  8 Feb 2023 15:58:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 08 Feb 2023 15:58:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 15:58:35 -0500 (EST)
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
X-Inumbo-ID: 5b6a5f2d-a7f3-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675889917; x=1675976317; bh=mEGhY+Vya8iAlE9GB9PbRYaZwA2j9eKz3dR
	M4StDQ70=; b=ozyYwcXHg1RrE3lLptE+zLipMntILP0qWcQtn4NSEyKVeD5g1vw
	ZHKEgoYenRyg9mAiRArU8g4uvT5QiFnuq4ZjEasabFEV5FxlwQFHqHBxFO11BjRr
	aDPeSiBL7HaLQQTehj4tXDhkrzSZGpIjoSXhcgGl8c1H8sLzFvhuoAbz+bzAD/Eh
	1EdGU8/BsPcKPszxgRA6gDHb4iyXuuJp8RsT5EE3Prc9CkrE/iHk/qObknLDZy3c
	/4EqZP8wQsdav2rsqBO9qhnnsNLA+G+yvNT7mf2mnZxmXdoLTmeCpPIOWllLfipF
	paung8Z3C/VYlxa2lm0nwG50cjw67/DBvxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1675889917; x=1675976317; bh=mEGhY+Vya8iAl
	E9GB9PbRYaZwA2j9eKz3dRM4StDQ70=; b=halKxgKZ7sSdmrY4257EzJTAwrRhZ
	YUH9cmdxgpMLXtrVP+jROOZaRc6lYXnJ4LcOsd+ginkVEKBeKXrhEHVuou/RYsGJ
	Ft3LAC2yCE66oe6leEvPvxEVfLStTgeDYJOJzgYo6DiiCgX1pLs+a3Kmk+DVmDR2
	IGVMvh+EO6t4wLjvepyL3tLSN6DJbqPW46bS6LXGcmjAiFiOP56h02a8dY12eP8Q
	IYxNw5EcmGEumCki8ehIcGxdMjWZT/xjPTSl662MIpLt90BrTssa8j4aOUPysak/
	WXKpIl2LUTN9fo+EpkFIZy/AQYNLmUTJSTadvM/6q846+zqYH9oJaoYMA==
X-ME-Sender: <xms:_AzkYxW76aVSsrbVfHPBY5sdDfnxWnI5mtcR6qRObsey76zxfbflgw>
    <xme:_AzkYxmi65eS-tnInYENyiX2m4RVPM5ceTi6EddYrPFArueQ9IyPWPivzdfHNGCBv
    g1poTFD8a2Xz_Y>
X-ME-Received: <xmr:_AzkY9bSYncRdAwI0zfkBLLCS0-P3YNHqUZQhs9swCdGYPqCcTU-b6GdQS9CtMOVE1apgrJtnuI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeevtdevgffhieevgffgjeetueej
    veegleeihfeileehudfggfetvdevueekudeknecuffhomhgrihhnpeigvghnrdhorhhgpd
    hslhhofihglhgrshhsrdgtohhmpdhinhhfrhgruggvrggurdhorhhgpdhsphhhihhngidq
    ughotgdrohhrghdpiihlihgsrdhnvghtpdhkvghrnhgvlhdrohhrghdprhgvughhrghtrd
    gtohhmpdhgnhhurdhorhhgpdhinhhrihgrrdhfrhdpghhmphhlihgsrdhorhhgpdhpohhl
    rghrshhslhdrohhrghdpsggvrhhlihhoshdruggvpdhsohhurhgtvgifrghrvgdrohhrgh
    dpihhpgigvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_QzkY0V1q9RB90tx2squsHdPSmk0gtGpD6EfZxP24PKJPP0UIH0hTQ>
    <xmx:_QzkY7mwPMbj_a2DJckeKnR0bTXFoAEitVBZlGULN_TqeRIlhR57Fw>
    <xmx:_QzkYxcREMjLAXL9FJgOokpIUYDrZsLFd8WJhQzniAHclJ-dATk1nA>
    <xmx:_QzkY5Xk1S9FG6dxPDJXI3CMoZDNN8cfJzNPmokZ3lbqPJAfBkzgMw>
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
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/4] Build system: Replace git:// and http:// with https://
Date: Wed,  8 Feb 2023 15:58:21 -0500
Message-Id: <75d91def8234bceb41548147ee8af5fea52bd1d6.1675889602.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675889601.git.demi@invisiblethingslab.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in the build system.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk                         | 20 ++++++--------------
 docs/README.remus                 |  2 +-
 docs/conf.py                      |  2 +-
 scripts/get_maintainer.pl         |  2 +-
 stubdom/configure                 | 18 +++++++++---------
 stubdom/configure.ac              | 24 +++++++++++++++---------
 tools/firmware/etherboot/Makefile |  6 +-----
 7 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/Config.mk b/Config.mk
index 10eb443b17d85381b2d1e2282f8965c3e99767e0..b2bef45b059976d5a6320eabada6073004eb22ee 100644
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
+OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
+QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
+QEMU_TRADITIONAL_URL ?= https://xenbits.xen.org/git-http/qemu-xen-traditional.git
+SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
+MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 5bcb28aaeba1c2506a82fab0cdad0201cd9b54b3
diff --git a/docs/README.remus b/docs/README.remus
index e41e045a109466213b39bf5099ee16652b229ccc..10929e06d049755c4e8a9c900af7e10048c3effb 100644
--- a/docs/README.remus
+++ b/docs/README.remus
@@ -7,7 +7,7 @@ Using Remus with libxl on Xen 4.5 and higher:
  To enable network buffering, you need libnl 3.2.8
  or higher along with the development headers and command line utilities.
  If your distro does not have the appropriate libnl3 version, you can find
- the latest source tarball of libnl3 at http://www.carisma.slowglass.com/~tgr/libnl/
+ the latest source tarball of libnl3 at https://www.infradead.org/~tgr/libnl/
 
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
diff --git a/stubdom/configure b/stubdom/configure
index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..8b409d294d6ad5e363d6942078e66de95fa0503d 100755
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
+  GMP_URL="https://gmplib.org/download/gmp"
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
index e20d99edac0da88098f4806333edde9f31dbc1a7..e43853d45a5f652c05fe36f9171fba4c1b5863c0 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -55,19 +55,25 @@ AC_PROG_INSTALL
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
+AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
+AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
+AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
+AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
+AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp])
+AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [https://polarssl.org/code/releases])
+AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [https://download.berlios.de/tpm-emulator])
 
 #These stubdoms should be enabled if the dependent one is
 AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
 
+if test "x$vtpm" != xn || test "x$vtpmmgr" != xn; then
+    if test "x$extfiles" != xy; then
+        AC_MSG_ERROR([Sources needed for the vTPM and vTPM manager stubdomains are no longer at their original URLs])
+    fi
+fi
+
 #Conditionally enable these stubdoms based on the presense of dependencies
 AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index 4bc3633ba3d67ff9f52a9cb7923afea73c861da9..f08b2c847b6535e5c28b6576445d02c2ac9551eb 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -4,11 +4,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 include Config
 
-ifeq ($(GIT_HTTP),y)
-IPXE_GIT_URL ?= http://git.ipxe.org/ipxe.git
-else
-IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
-endif
+IPXE_GIT_URL ?= https://git.ipxe.org/ipxe.git
 
 # put an updated tar.gz on xenbits after changes to this variable
 IPXE_GIT_TAG := 3c040ad387099483102708bb1839110bc788cefb
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


