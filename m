Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C96A2BB0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501871.773696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Il-000883-6N; Sat, 25 Feb 2023 20:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501871.773696; Sat, 25 Feb 2023 20:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Il-00081i-1n; Sat, 25 Feb 2023 20:37:51 +0000
Received: by outflank-mailman (input) for mailman id 501871;
 Sat, 25 Feb 2023 20:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1Ij-0007PG-Lf
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:37:49 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e179d2-b54c-11ed-88bb-e56d68cac8db;
 Sat, 25 Feb 2023 21:37:49 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1C2263200201;
 Sat, 25 Feb 2023 15:37:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 25 Feb 2023 15:37:47 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:46 -0500 (EST)
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
X-Inumbo-ID: 43e179d2-b54c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357466; x=1677443866; bh=FZjY6VSlLEVa0awh+ywsTVIuCBsoJnJElTE
	5z586qAs=; b=gqVpRUc6sxtBQeu4DDxHSq2nLLyhQth028RTnrTm0Ql0aul1hHs
	KnwVzThu9LAB4GuMtjVHP3W5wYM2BXOu6uyoCHRp59g8Wm58QF7Ln8/VPKq0w272
	HLTun8Z7+ffm6MBr5G4WIp6liOBkhwfHO1PGSdsr7MFKctYm4ZV+WkPYrLWcYW30
	rmd4FFGTU5qXmDUYwl8y7atl/NKZhhQ0vJLQxXLKFEpUzeK0PaEJXSWO6d2ZvJVn
	QHOnPEoZ1bsGDW01T4vRFXBPCJrzgTLw2geu59GxTysaaCs2cFY5zn6cBGPOsfOB
	L2lQ4J797EYA52cTCUi4kxG/pztMxzvLIgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357466; x=1677443866; bh=FZjY6VSlLEVa0
	awh+ywsTVIuCBsoJnJElTE5z586qAs=; b=IQNhbDoNb8lCii53GsOYZjWCAo7tP
	ylT3BrAYO7ilfm76HeQP0S5quLj0inbjMHDwPN8yaKbh91+xrWBx1Z9NcYeTFTGl
	QMMKK9ytqp8MK6H7Je+m99l3j0xGmETyP/F7z9f0WgWJ/VDi3VhWW8AkeejlwlY7
	UFDP5zdA/KDE1G8F2jeaJAxh0KVBO25HJFElcfmhpRCveLAKK0EZuzLilCUJJgJn
	roYYS1qaYySfVv4FTDm0iPRJoOQW6fSc3c3+h5BnRy9vBXxblVZUc7uqZqM8mBZO
	QiJkAA5nGqJQKDyLBEk0nMvd2syhHWiDcQATv2nHMH582RHHdqzgbp8Mg==
X-ME-Sender: <xms:mnH6Y1TfGrOTU_lgl-N9yq7aacGbfcxmJLScLNt0eP1CrQWHpTVuvw>
    <xme:mnH6Y-yqfGivVWjZJ2KL4J5b9GbSDKDcD3Lky5IttKUyNry6UfYIJFgb3rwpxOpyE
    wQfUDc3lxOdFfg>
X-ME-Received: <xmr:mnH6Y60mla9cFXRMD6oLkx9UmSMkYLz4dkEIRNdxe6rOFLs5-qzG48aNPTQ9upUamXHCSRWA4lo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheehgefghfdvieduuddthefhhfeu
    gffhjedtgedvhfetheehgeduieegjeekfeetnecuffhomhgrihhnpeiilhhisgdrnhgvth
    dpphholhgrrhhsshhlrdhorhhgpdgsvghrlhhiohhsrdguvgdpkhgvrhhnvghlrdhorhhg
    pdhrvgguhhgrthdrtghomhdpghhnuhdrohhrghdpihhnrhhirgdrfhhrpdhgmhhplhhisg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    peguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:mnH6Y9BRoLWPbtkZIeWFM8qaYAETfM1DaXoRwQDpHxhW4EHKT-UWVA>
    <xmx:mnH6Y-h5x2YM394EZUKLwnN5EzkPpFICF2jKiWeU1OuOcHTJBsYSTw>
    <xmx:mnH6Yxr0Ow2gnwgD9zOKaeLAwxuVTfGQx0tpFv0WXOFR3K1ksssbcg>
    <xmx:mnH6Y_sCwUR0efUSVNqGcEkN6I6XAoatC6zLf9uPkj5MQSNfVkSZ7Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 3/5] Build system: Do not try to use broken links
Date: Sat, 25 Feb 2023 15:37:13 -0500
Message-Id: <8122a5118079b87904724d61859880cc3672be06.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
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

