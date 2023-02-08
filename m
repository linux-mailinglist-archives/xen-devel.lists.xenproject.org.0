Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424568E742
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 05:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491522.760701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQb-0005dI-9j; Wed, 08 Feb 2023 04:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491522.760701; Wed, 08 Feb 2023 04:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPcQb-0005cD-5C; Wed, 08 Feb 2023 04:51:29 +0000
Received: by outflank-mailman (input) for mailman id 491522;
 Wed, 08 Feb 2023 04:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMba=6E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pPcQZ-0005Mg-8U
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 04:51:27 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b91cb60-a76c-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 05:51:22 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EC315C004F;
 Tue,  7 Feb 2023 23:51:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 Feb 2023 23:51:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Feb 2023 23:51:20 -0500 (EST)
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
X-Inumbo-ID: 3b91cb60-a76c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1675831881; x=1675918281; bh=VQRXUb8COcLQL5wKNAvsTr8YrZBI8htigcg
	TgwfJaPQ=; b=Sri98Dat7bcGfKXp4cs97EGmpmzOJB4BMQGOK1mu0mxjoqhW2jE
	UWBwWrCxJmBVObbUOsUqntVwHuh3+P5+dA7e0/oCKLlg0Qad6G3ic8QaHsNQwWtc
	5EPi1RJvd8E7t7LA6zb0N8qZR4L3KvVuQ+XMHm3Osr+kGUYYbdGxC7WJePvnMO3N
	AOpLHBsy8RaWl61sg5o16cY+6deVsVodevwy50e9ZSxgiqXQhxr9GJsPsUfgefD4
	bRlHEgSZkfQSpymzeFatw/pwL9JxVENlvr2pq9e1XkBGF43oKKVkGDHltu4Y3ZCC
	H5iqojVutngihaqFXVpi98kR/kesZVKlVDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1675831881; x=1675918281; bh=VQRXUb8COcLQL
	5wKNAvsTr8YrZBI8htigcgTgwfJaPQ=; b=YPr9xWXqsizujYcwETmyZiRXcufxQ
	6VmUOh07Pe7QjyYuHaYWCi929iODGhpTYv8K//RK9PG3yWHQ4xSHVsh8e+bZZyZm
	kD5b6546a1+1lMYg14vecn5KedXzk8irwqw8/E3kH3SM0cILZg19dhDPcgJkQhHA
	0Dwc/yOCGqUrHGWsnnZu5hCC74y/rv10tyOPmyuwu21iUefvWCMAkO9jQZWZ7KIx
	Or0CUbyaKVHRRFpLSu+FNPuJR/JRmVrTqkDNiFbTDIh8wmyd6du9k4KSO4blNZwZ
	LWMhGRh7+BuktewwiHrtDatpPRK3rETG+Qq6sMSnHpisGUZLIE7cyP4XQ==
X-ME-Sender: <xms:SSrjY-f_8An4PjElEARBSNPQSM7ZmVHXwuBm36CymtdMao8S7zE1qQ>
    <xme:SSrjY4ObcET_HVW0w8pnI7c4YJw94zK4alL3ysXm9ZeA2S4PgREyl1XpjD-Ggv3na
    YFgnxMul_s_hys>
X-ME-Received: <xmr:SSrjY_hAzj3usik27FPGWmkcTKcW-0ZdANTHOuBZr6rOdAPckXp6JSUSd-xC8n6KhLKJ8K8XkCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledgjeegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:SSrjY7_ls9hr3_qzrUnPTwelDHWiD6PjJQV4DlKCZTgeGortrfLwgg>
    <xmx:SSrjY6swWo9TRGHwDzl7EFE6YP82aIS9_Ao50krsNJzAGEY_ogD1GQ>
    <xmx:SSrjYyH3qrkE4T8J58J4v3xQvjR7KL4mNMLEJM3aAIMaM3a5N5YyQA>
    <xmx:SSrjY38MlMvDu_qrpuLKaBLO4AKP7AKdlYr2n__lt_FY74Rg7Va3Eg>
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
Subject: [PATCH 1/4] Build system: Replace git:// and http:// with https://
Date: Tue,  7 Feb 2023 23:51:04 -0500
Message-Id: <74c5389cb5adbd62154735a28f6c31ae1865b254.1675829867.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675829866.git.demi@invisiblethingslab.com>
References: <cover.1675829866.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in the build system.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk                            | 20 ++++++--------------
 docs/README.remus                    |  2 +-
 docs/conf.py                         |  2 +-
 scripts/get_maintainer.pl            |  2 +-
 stubdom/configure                    | 18 +++++++++---------
 stubdom/configure.ac                 | 24 +++++++++++++++---------
 stubdom/grub.patches/10graphics.diff |  2 +-
 tools/examples/xeninfo.pl            |  2 +-
 tools/firmware/etherboot/Makefile    |  4 ++--
 9 files changed, 37 insertions(+), 39 deletions(-)

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
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

