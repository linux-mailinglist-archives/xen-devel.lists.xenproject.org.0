Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD5E69BE4A
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 03:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497653.768534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmT-0002ot-HA; Sun, 19 Feb 2023 02:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497653.768534; Sun, 19 Feb 2023 02:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTZmT-0002lj-E8; Sun, 19 Feb 2023 02:50:25 +0000
Received: by outflank-mailman (input) for mailman id 497653;
 Sun, 19 Feb 2023 02:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uhw5=6P=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pTZmS-0002Vk-CG
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 02:50:24 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27430005-b000-11ed-933d-83870f6b2ba8;
 Sun, 19 Feb 2023 03:50:23 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 34FC232005B5;
 Sat, 18 Feb 2023 21:50:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 18 Feb 2023 21:50:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 21:50:19 -0500 (EST)
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
X-Inumbo-ID: 27430005-b000-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1676775020; x=1676861420; bh=9rmTWwkAVzEYzOXaR0GBy2XpALP9AHIvcss
	Mrr/PkeE=; b=bTFcGZHZ4Sr9PUuwJZeNKl758bpRqknew5TpGmNoe9WCQc5xhyT
	JRRhfuAgB3Rn8VckkjdmjHB5tiWgKJhX+NokutiYqmC/616B8Mt9sAuiJuTpVLom
	qIeVVRWL8BoaNpc/geDtzFmsi+K2KzWl28xCX673Jr7XCArck9l7mau57Vk1w54R
	OluLPyyYsE/oOJftzYgX0hc6GgTf5MqPb9P3D9fog5AEzuadNt3K9JNLTh9Y3Ifh
	hNPmXtYMRZgGpWcRSmGbNHA2zbD/1ZwYyl7rdiGfIudTZCQEjEQW3vIECyBhIL5B
	sAz6Xdc2V14H3hK+rlYfBmup49VylKwWPIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676775020; x=1676861420; bh=9rmTWwkAVzEYz
	OXaR0GBy2XpALP9AHIvcssMrr/PkeE=; b=BiuPB42ujBU92ITaBR+XKK8S1uadh
	JBiGy7D6BAlXUWeGJQ8bvviKZLJN3/Rxq7MioPawEDBgQCqAYvsxrSMQj9DNMsmb
	6ou5KGMMTeVaN5BpHcfovgueP9KHJXvZKi3hvfTP28ytyUKVW8VaiYKhroslM00/
	ohP47pyRJUdSczzBF4eyjd49m6ugm5opeytHkp/XaXMsTSCqepH1NsaDgDwmyi33
	ZhVJ06/SsvqH6cpY7jElexo3DJek4gb9eDFuuCFChtW20Nl5qHmzG43Z8Knu7PjO
	oe9OGoE5F6mss5Y0dxxIhTpyNkGda4ngMkTYN+XzazCxbrHiuomsYt2bw==
X-ME-Sender: <xms:bI7xY65iS9rWk6BJ32r-k2lDHvjZDwFoFhaG9gHi5JnyjmroLyhLrw>
    <xme:bI7xYz50H9Gm5m15izqCfBiNOMSo5oewIhAQfVfphDc0YMTAOAppK9w3VnhSETkDw
    -bDguJ9hs0zEaA>
X-ME-Received: <xmr:bI7xY5eKXDG2kH8ukiurkpWYujLbk2h6mjTweLUgqnCdD02zqFeA-plNVl59JjBSHjF_4Bkdqfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdevhfevgfekuedvkeehledt
    veeikedtgfdtlefhheefkedtteekueeluddtnecuffhomhgrihhnpeigvghnrdhorhhgpd
    iilhhisgdrnhgvthdpkhgvrhhnvghlrdhorhhgpdhrvgguhhgrthdrtghomhdpshhouhhr
    tggvfigrrhgvrdhorhhgpdhgnhhurdhorhhgpdhinhhrihgrrdhfrhdpghhmphhlihgsrd
    horhhgpdhpohhlrghrshhslhdrohhrghdpsggvrhhlihhoshdruggvpdhiphigvgdrohhr
    ghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:bI7xY3IYAiMzyhiCoHVcTPUzwA08h0zzdRxj9p_8H0PiTYpfr_1cfA>
    <xmx:bI7xY-KYNmspQN-63CS3lwsA6_t-n--pId99EPC8uvv2AZO7A2IBMQ>
    <xmx:bI7xY4zA2CBXG8Sm7XGqha2LE03biPzkl_Llyb6EWmCXZTBJ_nsALw>
    <xmx:bI7xY99Gr-WrpuXT93krCpfeFmizrwW9cgAOVg8aftyISwrczhtGXQ>
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
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 2/3] Build system: Replace git:// and http:// with https://
Date: Sat, 18 Feb 2023 21:46:14 -0500
Message-Id: <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676750305.git.demi@invisiblethingslab.com>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
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
 Config.mk                         |  2 +-
 stubdom/configure                 | 18 +++++++++---------
 stubdom/configure.ac              | 18 +++++++++---------
 tools/firmware/etherboot/Makefile |  6 +-----
 4 files changed, 20 insertions(+), 24 deletions(-)

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
index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..c717d315c75a596850b94e59c72c5d5f010f8888 100755
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
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index e20d99edac0da88098f4806333edde9f31dbc1a7..ab52e00293bee033db9ff7133efd34daa5944c8d 100644
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

