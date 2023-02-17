Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5A69B4D7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 22:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497311.768262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OT-0006Ds-N9; Fri, 17 Feb 2023 21:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497311.768262; Fri, 17 Feb 2023 21:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT8OT-0006B0-Iz; Fri, 17 Feb 2023 21:35:49 +0000
Received: by outflank-mailman (input) for mailman id 497311;
 Fri, 17 Feb 2023 21:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uk7L=6N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pT8OR-0005eU-QN
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 21:35:48 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09929037-af0b-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 22:35:46 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B4231320090D;
 Fri, 17 Feb 2023 16:35:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 17 Feb 2023 16:35:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 16:35:43 -0500 (EST)
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
X-Inumbo-ID: 09929037-af0b-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676669744; x=1676756144; bh=7H05pNS9CTfuyobI73U4y0lxpnA2i8YdcBl
	f5sTJHn4=; b=flOUQEejh+KLmQBb4L1wyRYOqhM8u6sPfbsgzYurCA6zdU1bTm3
	7F0RtO/e79xzRMF7QhcDM/mxLdHbbbEvbjyRY7fAaZwTqp/WnwtkuKpMPpsDCqFE
	WEwUzDvFKJOvJ4JnBbyQNLgOrcUtbk9kM43eN2g21DYQRL72vSEZqiWrO7ueR5/+
	DSwGImmyDM/M9N3wntRn0ufjFnaG7Yv+pvfcrPu2tMc4CclfMktO1bmxyzpKl4O+
	+EDdcvT+haJeOE4r51rjl3w2pM1B1LVwyZV3nSSUTsknUfEdmzns8YtP5FYus2ir
	yuTJeIgIewU6o0RLCR1EWsQpgCQeanh+Bdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676669744; x=1676756144; bh=7H05pNS9CTfuy
	obI73U4y0lxpnA2i8YdcBlf5sTJHn4=; b=Ba0ANo2Pc7QXLvvsjYq05SpmKiK3W
	QQDwW+tANHJ7ubU+K3f83766rLuNR9v46eq2PfjbJ+8m3Ta0GNWS/i6SrMPLzMHW
	kw5gLf7uppPRBb+q+1aTu4TXAQ5U1Ip0wDK5ZtcRUraVQmvLal6zjcjd5WLpj2P+
	zIErgEStIoEyM/6pPwoCilRKPcIaOptsdB4gk8+HIBblLKuLJgSLzarfgtlhf+1J
	iMMj6MMNtsTl0D4gKBEOz7qP4SJIMQBBWp2l50+1gisgmuWoGhijJ1rQP/pWurBw
	fFsxqXnb3/lShx5YptqK6gfrgGHWAzLdYfksZkiAb6pXHQ5Pwlk0CZQFw==
X-ME-Sender: <xms:MPPvYzuwl5VN-JUb7d7z-FB5tRLff7EPvIgU95YB70-M60KpLbtP7w>
    <xme:MPPvY0cnReJRXME_XAyPlR9lppgYysJpafUvW3Vw0TdwKXowp9tmN-GckRg34ENnd
    04gi4KFpjHU7ZA>
X-ME-Received: <xmr:MPPvY2zbjzcG7J3sImeM38gBuNUtfQ6nqqK1XVHYyz-6bDO7QYq9kkZv6VaUFRkLZxmCwFQv3sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduveeuudegudduuefftedujeek
    ffekgeekudfhiefhiedvudejfeejtdeitdevueenucffohhmrghinhepiihlihgsrdhnvg
    htpdigvghnrdhorhhgpdhkvghrnhgvlhdrohhrghdprhgvughhrghtrdgtohhmpdhsohhu
    rhgtvgifrghrvgdrohhrghdpghhnuhdrohhrghdpihhnrhhirgdrfhhrpdhgmhhplhhisg
    drohhrghdpphholhgrrhhsshhlrdhorhhgpdgsvghrlhhiohhsrdguvgdpihhpgigvrdho
    rhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:MPPvYyPh1htZFFIjXU0V03hkVoeSDFySyOQ0Q0RLa5PdPd8rEykN9w>
    <xmx:MPPvYz8SSwtrF9P4tUNpE_fW7ktF8N7qAsDQsdl8IiuEPLIXDeynAQ>
    <xmx:MPPvYyX7VTaIxjpF6zaFjC3cZCSWlankur1XeLPAOvZ57C7SiVZf6Q>
    <xmx:MPPvY0MRc1w_qGHVwxSZtAIjyN-xiQM3lNKZXzaYPXpEstISzOEAdA>
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
Subject: [PATCH v3 2/4] Build system: Replace git:// and http:// with https://
Date: Fri, 17 Feb 2023 16:35:25 -0500
Message-Id: <0aaad173b15304e2ab00749b4e5ad79c6e111589.1676668923.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676668922.git.demi@invisiblethingslab.com>
References: <cover.1676668922.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in the build system.
Some URLs returned 301 or 302 redirects, so I replaced them with the
URLs that were redirected to.  I also found that the old zlib used in
the I/O emulator stubdomain can no longer be obtained from
https://www.zlib.net and that the TPM emulator and PolarSSL (used by the
vTPM and vTPM manager stubdomains) can no longer be obtained from their
respective original URLs.  Therefore, configure will now error out
instead of trying to download them.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk                         |  2 +-
 stubdom/configure                 | 24 +++++++++++++++---------
 stubdom/configure.ac              | 24 +++++++++++++++---------
 tools/firmware/etherboot/Makefile |  6 +-----
 4 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/Config.mk b/Config.mk
index 75f1975e5e78af44d36c2372cba6e89b425267a5..b2bef45b059976d5a6320eabada6073004eb22ee 100644
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
diff --git a/stubdom/configure b/stubdom/configure
index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..e40aca9afd0de2c5074978d654d4e78f4f63e3d2 100755
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
+  LIBPCI_URL="https://mirrors.edge.kernel.org/pub/software/utils/pciutils"
 fi
 
 fi
@@ -3565,7 +3565,7 @@ if test "x$NEWLIB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   NEWLIB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  NEWLIB_URL="ftp://sources.redhat.com/pub/newlib"
+  NEWLIB_URL="https://sourceware.org/ftp/newlib"
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
+  GMP_URL="https://gmplib.org/download/gmp/archive"
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
@@ -3669,6 +3669,12 @@ vtpmmgr="n"
 fi
 
 
+if test "x$vtpm" != xn || test "x$vtpmmgr" != xn || test "x$ioemu" != xn; then
+    if test "x$extfiles" != xy; then
+        as_fn_error $? "Sources needed for the vTPM, vTPM manager, and IO emulator stubdomains are no longer at their original URLs" "$LINENO" 5
+    fi
+fi
+
 #Conditionally enable these stubdoms based on the presense of dependencies
 
 if test "x$vtpm" = "xy" || test "x$vtpm" = "x"; then :
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index e20d99edac0da88098f4806333edde9f31dbc1a7..d27f2bc1f17140ab41a687e1e8faaa66e2b4483b 100644
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
+AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub/software/utils/pciutils])
+AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
+AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
+AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
+AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
+AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
+AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [https://polarssl.org/code/releases])
+AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [https://download.berlios.de/tpm-emulator])
 
 #These stubdoms should be enabled if the dependent one is
 AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
 
+if test "x$vtpm" != xn || test "x$vtpmmgr" != xn || test "x$ioemu" != xn; then
+    if test "x$extfiles" != xy; then
+        AC_MSG_ERROR([Sources needed for the vTPM, vTPM manager, and IO emulator stubdomains are no longer at their original URLs])
+    fi
+fi
+
 #Conditionally enable these stubdoms based on the presense of dependencies
 AX_STUBDOM_CONDITIONAL_FINISH([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL_FINISH([vtpmmgr-stubdom], [vtpmmgr])
diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index 4bc3633ba3d67ff9f52a9cb7923afea73c861da9..6ab9e5bc6b4cc750f2e802128fbc71e9150397b1 100644
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
+IPXE_GIT_URL ?= https://github.com/ipxe/ipxe.git
 
 # put an updated tar.gz on xenbits after changes to this variable
 IPXE_GIT_TAG := 3c040ad387099483102708bb1839110bc788cefb
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

