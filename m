Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3B6C385A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512929.793363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peft8-0004dO-75; Tue, 21 Mar 2023 17:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512929.793363; Tue, 21 Mar 2023 17:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peft8-0004bP-1E; Tue, 21 Mar 2023 17:35:10 +0000
Received: by outflank-mailman (input) for mailman id 512929;
 Tue, 21 Mar 2023 17:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1peft6-0003LR-B4
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:35:08 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b83f8a5c-c80e-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:35:07 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9B8743200C42;
 Tue, 21 Mar 2023 13:35:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 21 Mar 2023 13:35:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:35:04 -0400 (EDT)
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
X-Inumbo-ID: b83f8a5c-c80e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420105; x=1679506505; bh=FZjY6VSlLE
	Va0awh+ywsTVIuCBsoJnJElTE5z586qAs=; b=iMKiVS3puAJJ+SH81sqEeG32sT
	0wM43vtIRhKwGgKJLZyhqk253i8+FIGUFC1Lx19qbH8FwSp50E0TMrcqLeg5FPZS
	Tu8dlncxaLsplO7I0hJH+SaZrGYgvOODDC1/8Jb6tL0ml+PdAnIvnfJWlMz++VWp
	b7HCkEUUsuyXWVSe1cGgZ5S6l9c8SU7vjtVUP162jfom2E2DxSyR1AOpDdZdJpZN
	N2FNhxad3uAv3sWwdt0pU3k8jtlbzpKfqcfhAuR+gLN5JfvIuIY5eI9H21fnxrFT
	GFxxS5xxNx5Whkd7YLXaK8PPyFtnPTNzhFu/e5ICOXtqr/1b2oWqSgOowA1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420105; x=
	1679506505; bh=FZjY6VSlLEVa0awh+ywsTVIuCBsoJnJElTE5z586qAs=; b=j
	F6WaTOUdJ/zFGc4cmB8u+RBg1aIseHQBr6L71rWB1QyfYccfGixkZZDQOR0wGEEB
	eeMQUVzcXzw9I1ChkbZ+XpqUFYi4NWqjj6Cads9FLM9pMlFgqi6a9uoH6CSDAvLo
	nv/PAvPTPIaA58elEvON7cRi6Jool2ll5aCQkDK4T+dY6xPmqSsroC4ysDrWiyfU
	ZMlKvSPsr/PgiWKSQsdudotK+SisvbDYELs6T5UN0ZK6txG9GUkYhZ7d3XOUh3kf
	UKS2bX+6djorgITIuHgPIa+ctHiuiE82veEpv3H4RncpkVhEM/9ICXEwr1+zgK3W
	L3A3SsyltCo0gORarcrvg==
X-ME-Sender: <xms:yeoZZDX2du_9mBoBWgNljKCGQSAEZ7aqc6SVgj3b5aSH3wY1mt3duw>
    <xme:yeoZZLmOrA2nPAxJUypE5M9q2kuFxkqxz6GC1U7E3h6yLBo_TOpSPViVFul3CheuX
    YL2IKpwnWsBIh4>
X-ME-Received: <xmr:yeoZZPZSn9KV_Lo7yBjuniy3BV4KA7q7IWtt6sGS9hxjimZV5dL48_cBFQU4P6kBboV0LgTXbZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehheeggffhvdeiuddutdehhffh
    uefghfejtdegvdfhteehheegudeigeejkeefteenucffohhmrghinhepiihlihgsrdhnvg
    htpdhpohhlrghrshhslhdrohhrghdpsggvrhhlihhoshdruggvpdhkvghrnhgvlhdrohhr
    ghdprhgvughhrghtrdgtohhmpdhgnhhurdhorhhgpdhinhhrihgrrdhfrhdpghhmphhlih
    gsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yeoZZOXCCuY1dyFH6sVoDXZlGQiGzpbN6WmKSzRubOFMqRN6ppuZ8Q>
    <xmx:yeoZZNl9Dhuzt3kkttl2AJQA-0-Edyj8nRkHQWpgSLStAsgbe60oXw>
    <xmx:yeoZZLcnLz3YhtwYkplgsLP0USbPnC8gWU4Pzfy93ldYMsCXi_SX6A>
    <xmx:yeoZZDgt2nhLt5JsheYceYBg31VuKFVSvqBc0IqnixfdZ9poCU_0BA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 3/5] Build system: Do not try to use broken links
Date: Tue, 21 Mar 2023 13:33:38 -0400
Message-Id: <8f6abc421d428b9897b529b7809a978f72a59c3e.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upstream URLs for zlib, PolarSSL, and the TPM emulator do not work
anymore, so do not attempt to use them.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 m4/stubdom.m4        |  5 +++--
 stubdom/configure    | 21 +++------------------
 stubdom/configure.ac |  6 +++---
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/m4/stubdom.m4 b/m4/stubdom.m4
index 6aa488b8e229dabbe107cfe115b5f2ac7e5ae824..26f10595d1c1250b1dc8a5be626142325e8d4673 100644
--- a/m4/stubdom.m4
+++ b/m4/stubdom.m4
@@ -78,10 +78,11 @@ done
 AC_DEFUN([AX_STUBDOM_LIB], [
 AC_ARG_VAR([$1_URL], [Download url for $2])
 AS_IF([test "x$$1_URL" = "x"], [
-	AS_IF([test "x$extfiles" = "xy"],
+	m4_if([$#],[3],[$1_URL=\@S|@\@{:@XEN_EXTFILES_URL\@:}@],
+	      [$#],[4],[AS_IF([test "x$extfiles" = "xy"],
 		[$1_URL=\@S|@\@{:@XEN_EXTFILES_URL\@:}@],
 		[$1_URL="$4"])
-	])
+],[m4_fatal([AX_STUBDOM_LIB expects 3 or 4 arguments, not $#])])])
 $1_VERSION="$3"
 AC_SUBST($1_URL)
 AC_SUBST($1_VERSION)
diff --git a/stubdom/configure b/stubdom/configure
index b8bffceafdd46181e26a79b85405aefb8bc3ff7d..4ea95baa9192f3b319349ac2a14a3055a21ce705 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -3532,12 +3532,7 @@ fi
 
 if test "x$ZLIB_URL" = "x"; then :
 
-	if test "x$extfiles" = "xy"; then :
-  ZLIB_URL=\$\(XEN_EXTFILES_URL\)
-else
-  ZLIB_URL="http://www.zlib.net"
-fi
-
+	ZLIB_URL=\$\(XEN_EXTFILES_URL\)
 fi
 ZLIB_VERSION="1.2.3"
 
@@ -3633,12 +3628,7 @@ GMP_VERSION="4.3.2"
 
 if test "x$POLARSSL_URL" = "x"; then :
 
-	if test "x$extfiles" = "xy"; then :
-  POLARSSL_URL=\$\(XEN_EXTFILES_URL\)
-else
-  POLARSSL_URL="http://polarssl.org/code/releases"
-fi
-
+	POLARSSL_URL=\$\(XEN_EXTFILES_URL\)
 fi
 POLARSSL_VERSION="1.1.4"
 
@@ -3648,12 +3638,7 @@ POLARSSL_VERSION="1.1.4"
 
 if test "x$TPMEMU_URL" = "x"; then :
 
-	if test "x$extfiles" = "xy"; then :
-  TPMEMU_URL=\$\(XEN_EXTFILES_URL\)
-else
-  TPMEMU_URL="http://download.berlios.de/tpm-emulator"
-fi
-
+	TPMEMU_URL=\$\(XEN_EXTFILES_URL\)
 fi
 TPMEMU_VERSION="0.7.4"
 
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index e20d99edac0da88098f4806333edde9f31dbc1a7..c648b1602c227ed5fe63b9fbdf3fa52fd2e1654b 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -55,15 +55,15 @@ AC_PROG_INSTALL
 AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
-AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3], [http://www.zlib.net])
+AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
 AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [http://www.kernel.org/pub/software/utils/pciutils])
 AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [ftp://sources.redhat.com/pub/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [http://download.savannah.gnu.org/releases/lwip])
 AX_STUBDOM_LIB([GRUB], [grub], [0.97], [http://alpha.gnu.org/gnu/grub])
 AX_STUBDOM_LIB_NOEXT([OCAML], [ocaml], [4.02.0], [http://caml.inria.fr/pub/distrib/ocaml-4.02])
 AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [ftp://ftp.gmplib.org/pub/gmp-4.3.2])
-AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4], [http://polarssl.org/code/releases])
-AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4], [http://download.berlios.de/tpm-emulator])
+AX_STUBDOM_LIB([POLARSSL], [polarssl], [1.1.4])
+AX_STUBDOM_LIB([TPMEMU], [berlios tpm emulator], [0.7.4])
 
 #These stubdoms should be enabled if the dependent one is
 AX_STUBDOM_AUTO_DEPENDS([vtpmmgr], [vtpm])
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


