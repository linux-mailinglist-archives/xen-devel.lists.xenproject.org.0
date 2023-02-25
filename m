Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AA16A2BB3
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501874.773709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Is-0000Ny-Fe; Sat, 25 Feb 2023 20:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501874.773709; Sat, 25 Feb 2023 20:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Is-0000LP-9L; Sat, 25 Feb 2023 20:37:58 +0000
Received: by outflank-mailman (input) for mailman id 501874;
 Sat, 25 Feb 2023 20:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1Iq-0007yc-Ov
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:37:56 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4778e5b4-b54c-11ed-a82a-c9ca1d2f71af;
 Sat, 25 Feb 2023 21:37:55 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1F2353200201;
 Sat, 25 Feb 2023 15:37:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 25 Feb 2023 15:37:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:52 -0500 (EST)
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
X-Inumbo-ID: 4778e5b4-b54c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357472; x=1677443872; bh=eE9rMkFJ8SK3XCHPmE4xntol477kdYevv8F
	tOH7Fe3I=; b=lyoz5gWVWeiiUc9rXtuLY6HQZk+S71tzEU5vht4aAPID/MtcUjh
	ni2VxOvFbRVXFE13LTvx7BF8M3DpvI+aPJs17J0yZu3JcInyKUgf/V5WMnrJOOJb
	ljMxH66EqTZtD9o6GDyr9fQRdspuh2b/tz7SaUeJUHgkClYETBCtIvj7Fqvu/Cbc
	F9XYESLX9cppZWSb34IHJqy1Tq0JmFkIlrX4q7yZXthZtfKODOljpRDcfZ+SCHzO
	lphOtzVYaS+Hpbzp2x+jL9g01kAtdbsnjjtpFwaYPmkMJNXpgQ0kqAw5lM3qZxUo
	xLDgx8qXDlkQs1Ur4I2Cr6J/mtqSsumAIDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357472; x=1677443872; bh=eE9rMkFJ8SK3X
	CHPmE4xntol477kdYevv8FtOH7Fe3I=; b=a5d9p7LzmKi+Oo2B82T/0f6CIyjC5
	Lt08s1uRrJjJTbF/qoE/MKcIHiCoL8tcAwwpPfQcceLzUj8a+OzoaQaJdLUuWJ3B
	jLQ2lSgqAseUDQlCeFg8cd0gQOzaGLZMKeWXOdj5I7ZbgGI7Lbx8ntkss6XYSLHP
	esAPLQZifeLXlLvRe+HY6e/CxqpQQ3jzmd2EnJrELeTDM8xR/Isxr0KypiSQKQzC
	2+0HVNiB3905fg+oDf4DIP3hkSPPBZjIwWbAKSEVihmIaHSgn/jLLrINZFNGJD1a
	Km4W/rzrw8Xoj6CvarMxdtP3aAF9sYIrwbc+xh5a2k0TAMp+CvJrw9z0w==
X-ME-Sender: <xms:oHH6Yx06IT3oNEABvG7fDCKYw6MCtVevPoq84cVasRGnPzjRBlh33g>
    <xme:oHH6Y4HoDeL1Q34VIW026YILWrtvxtIC3JrWdHPxD7x5Kr3gyboPI1dI6meAbTvA0
    nBjRTOzonM8qQI>
X-ME-Received: <xmr:oHH6Yx49HOukVC1pRMjFlRI9EMcwL-myLiTQDb55_AKybjF-GwJNiwbhp2BClksOM2sWE2EgZiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedtueeutedtfefgkedtueefteeu
    ffdvuedtudekkedvhffgfffhheefgeeutdejnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghdprhgvughhrghtrdgtohhmpdhsohhurhgtvgifrghrvgdrohhrghdpghhnuhdrohhr
    ghdpihhnrhhirgdrfhhrpdhgmhhplhhisgdrohhrghdpihhpgigvrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:oHH6Y-1lehp5aQhXJh19tB3b5ms4XTqhhe3cnIwSW79wcbZOD4mvGg>
    <xmx:oHH6Y0EYcPZZbREsPyQh0-YwDYmMMYHM-crznfSi-aRVMifNXeh6yg>
    <xmx:oHH6Y_9VV94dnk9VMY0iC3hST2MfcHSPhSKquc5Z6s4GLtzJOokvKQ>
    <xmx:oHH6Y4DcLpxKCzm1QSSwYwmyjjUopN5KJmjuby26lQ7_uhajUdpbIw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 4/5] Build system: Replace git:// and http:// with https://
Date: Sat, 25 Feb 2023 15:37:14 -0500
Message-Id: <85a65c8c5cbd7cab3b9eb57aed27a59443c7a6ff.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
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

