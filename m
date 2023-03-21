Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2FB6C385D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512934.793373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peftI-00059x-HX; Tue, 21 Mar 2023 17:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512934.793373; Tue, 21 Mar 2023 17:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peftI-00057h-Eh; Tue, 21 Mar 2023 17:35:20 +0000
Received: by outflank-mailman (input) for mailman id 512934;
 Tue, 21 Mar 2023 17:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1peftG-0004aq-Dj
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:35:18 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3cfc90-c80e-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 18:35:15 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A12033200C42;
 Tue, 21 Mar 2023 13:35:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 21 Mar 2023 13:35:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:35:13 -0400 (EDT)
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
X-Inumbo-ID: bd3cfc90-c80e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420114; x=1679506514; bh=eE9rMkFJ8S
	K3XCHPmE4xntol477kdYevv8FtOH7Fe3I=; b=exeBpAaykN0QHnsIUhQ1G2VxT3
	0gY8FiyNql1wHGB4OZ2DHn7fmDZY8MafhCL4/n65DT0lumXc6RrqFrdR0QN1reiJ
	Y49fSXLmswTitcpxXkwX4ggsYy9EJipk+GX1RLS2TPTurNcEmj3iv++oZtV18v2R
	zuk+znLKuYKpuebZcpOqaRBezL2Q/p/T5I/aKXABHYfNHnNJuHZg4qA4pn8JotWP
	jJYLx5Oosh69IjPTFlwF6HlKNmJG0/ubkBA4sF64lOdb9Zkkh7MW20DuR3eLR3vF
	gYumoOT6X2afF+vsJ6m8evIovFUogqrPuOvRlodnuwO16anV2m5lsABR+LCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420114; x=
	1679506514; bh=eE9rMkFJ8SK3XCHPmE4xntol477kdYevv8FtOH7Fe3I=; b=H
	1BdlVBRBZhHT8HoH2kX92qePwInQjPg4Ja5U2RJiTjrFLsllt5L3DB3JoIaOYamv
	6U937PxsPj6WEwdzEi0WZyDywjrJ5qRt5rU1cy47JtDU9G0e7ZvSH/nAEZWLT6ij
	1Zj9aBH7ME5lpJGA5DqxbPwechHLk2tCWJYrH6jk+7T/CGvWefg6OxLXuFU96ZIO
	TwJMkBwmehjFzMmG7/usj56OmRfiaRwsE7IhqA9ClYBj2L0jJ7cIRDEz6OTvuRjP
	h5tvt8SmXUWiMIYcImylYDjP4hcIPBu2Xo1UcOfcEq6kJJV/159IdaW2pbWKWjij
	kyynll2mguBHWnEXHoohQ==
X-ME-Sender: <xms:0uoZZA_jSPMitMhthtnyKKoE6epDRO8vl1uBVPxBKo4Eg1mMjm7bOw>
    <xme:0uoZZItD0q3PpKxhDelzl6IpnKmj4k5UihybTYCkVQoa_723cPs8KEep17ir_GAh9
    mzU6uHzo9cmyS4>
X-ME-Received: <xmr:0uoZZGD8ubC9XLAugHm5TqdJq09Y5gFc55de24QxuTVsYZUA7-wJvrq-idXzcxNeYf5y40zhkgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeutdeuueettdefgfektdeufeet
    ueffvdeutddukeekvdfhgfffhfehfeeguedtjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgpdhrvgguhhgrthdrtghomhdpshhouhhrtggvfigrrhgvrdhorhhgpdhgnhhurdho
    rhhgpdhinhhrihgrrdhfrhdpghhmphhlihgsrdhorhhgpdhiphigvgdrohhrghdpghhith
    hhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0uoZZAchUoXXpQKOk2v3x5DkNaQ2HLIYtGEi0JDrtFodFZDRXY5Ljg>
    <xmx:0uoZZFMeXE4QcnW1tXS2iWGQ_2nEaqZ51a6_shICczCQxSTs_1NlMw>
    <xmx:0uoZZKkX4o8IpftlC215okVfjXY23tvp198nwvCVXpGnzlR1HaEuMQ>
    <xmx:0uoZZGpp7EDJYEW9UHOm9372Y_azR6mjglxi6Wv1vXOXdOzak8ktoA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 4/5] Build system: Replace git:// and http:// with https://
Date: Tue, 21 Mar 2023 13:33:40 -0400
Message-Id: <cb23cf003905fa56119985a4ac9a84e9510ad235.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in the build system.
Some URLs returned 301 or 302 redirects, so I replaced them with the
URLs that were redirected to.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 stubdom/configure                 | 12 ++++++------
 stubdom/configure.ac              | 12 ++++++------
 tools/firmware/etherboot/Makefile |  6 +-----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/stubdom/configure b/stubdom/configure
index 4ea95baa9192f3b319349ac2a14a3055a21ce705..540e9cd331888449b0e24c1aa974bc22c5bcab54 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -3545,7 +3545,7 @@ if test "x$LIBPCI_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   LIBPCI_URL=\$\(XEN_EXTFILES_URL\)
 else
-  LIBPCI_URL="http://www.kernel.org/pub/software/utils/pciutils"
+  LIBPCI_URL="https://mirrors.edge.kernel.org/pub/software/utils/pciutils"
 fi
 
 fi
@@ -3560,7 +3560,7 @@ if test "x$NEWLIB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   NEWLIB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  NEWLIB_URL="ftp://sources.redhat.com/pub/newlib"
+  NEWLIB_URL="https://sourceware.org/ftp/newlib"
 fi
 
 fi
@@ -3575,7 +3575,7 @@ if test "x$LWIP_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   LWIP_URL=\$\(XEN_EXTFILES_URL\)
 else
-  LWIP_URL="http://download.savannah.gnu.org/releases/lwip"
+  LWIP_URL="https://download.savannah.gnu.org/releases/lwip"
 fi
 
 fi
@@ -3590,7 +3590,7 @@ if test "x$GRUB_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   GRUB_URL=\$\(XEN_EXTFILES_URL\)
 else
-  GRUB_URL="http://alpha.gnu.org/gnu/grub"
+  GRUB_URL="https://alpha.gnu.org/gnu/grub"
 fi
 
 fi
@@ -3602,7 +3602,7 @@ GRUB_VERSION="0.97"
 
 if test "x$OCAML_URL" = "x"; then :
 
-	OCAML_URL="http://caml.inria.fr/pub/distrib/ocaml-4.02"
+	OCAML_URL="https://caml.inria.fr/pub/distrib/ocaml-4.02"
 
 fi
 OCAML_VERSION="4.02.0"
@@ -3616,7 +3616,7 @@ if test "x$GMP_URL" = "x"; then :
 	if test "x$extfiles" = "xy"; then :
   GMP_URL=\$\(XEN_EXTFILES_URL\)
 else
-  GMP_URL="ftp://ftp.gmplib.org/pub/gmp-4.3.2"
+  GMP_URL="https://gmplib.org/download/gmp/archive"
 fi
 
 fi
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index c648b1602c227ed5fe63b9fbdf3fa52fd2e1654b..471e371e14a82aedc10314c95bcaf39ce9f89f90 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -56,12 +56,12 @@ AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
 AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
-AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [http://www.kernel.org/pub/software/utils/pciutils])
-AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [ftp://sources.redhat.com/pub/newlib])
-AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [http://download.savannah.gnu.org/releases/lwip])
-AX_STUBDOM_LIB([GRUB], [grub], [0.97], [http://alpha.gnu.org/gnu/grub])
-AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [http://caml.inria.fr/pub/distrib/ocaml-4.02])
-AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [ftp://ftp.gmplib.org/pub/gmp-4.3.2])
+AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub/software/utils/pciutils])
+AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
+AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
+AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
+AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [https://caml.inria.fr/pub/distrib/ocaml-4.02])
+AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
 AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4])
 AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4])
 
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


