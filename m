Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6636BD6D7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 18:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510754.789071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDl-00034J-NT; Thu, 16 Mar 2023 17:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510754.789071; Thu, 16 Mar 2023 17:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDl-0002zZ-JB; Thu, 16 Mar 2023 17:16:57 +0000
Received: by outflank-mailman (input) for mailman id 510754;
 Thu, 16 Mar 2023 17:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrDj-0002vw-Mz
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 17:16:55 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57227afd-c41e-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 18:16:53 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 87B945C016A;
 Thu, 16 Mar 2023 13:16:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 13:16:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 13:16:49 -0400 (EDT)
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
X-Inumbo-ID: 57227afd-c41e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1678987010; x=1679073410; bh=QP
	VkeV0fObWCjCHmmGo4u18UjuPCJC0H97vrVfuwEOo=; b=b+i4mm/fXPW3Gbenmw
	bzhJXC9XY+s2NKiad856pVaJ9a1aJEGCbvUz4PxXGXYvUjBJhSwki2/IW1FL4cYP
	MF5ErJTPmN7TTnUoebhIUrz53B4bctdDff/6by38jhjG2Q8phKvH52IrMarn+J56
	AL2c4GVqnW5d1NvCTcwpq1X18wKIcBQ8/2Z5h/FZx6gMwPdB6ShKK0fgQ3o6Wg7O
	OpQizGHmBO70fOwAGVIedTp0MJpNHIseV1gJng1xEeuiDuwxzfZJkUHRqCg1itfz
	SrhVnlZrSKVxQn3cJTQyFq/Y/Eh1J6XKyMp9rw0FAaKJQuIHvnv/PKVZadhrzgCN
	Hgzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1678987010; x=1679073410; bh=QPVkeV0fObWCjCHmmGo4u18UjuPCJC0H97v
	rVfuwEOo=; b=skDBrl5gKsSNamj2JiyRRBG3tayfupiK1bQiWVZLnWmTiBBWuWE
	iC9szsu4NAuTTbRLlpV+gv/Nb7jgIP9g1ONvm+BFq3WuVKtKiZVTDc3LVrjQOayw
	606HpMfskwwcxqvQ5G6mNSKNNaqGk3VdpZzxFBEu/vmylaOqm0rJya06iM8jz9GG
	t4vvJ2BZZ1M/wy0/AblIDtyHGGbHMkSvDq7VTKecTj6HRX1DcW+qbySj3GKUVjt2
	70bU61K9FJpHy2nV0x2c5gVjd3JOqrJ+GAGDktv5v6q7WUoRNz2cLExbce3NkjIm
	Hw0eF2/MOkmONmO2oFkvYrZX0YesWKDt92w==
X-ME-Sender: <xms:Ak8TZEbrQ39sBlwOfwEAkIXGNkvRfybpK9vlz1TaLbmpjUYcYvFDbw>
    <xme:Ak8TZPYsyhWx7qg2XaT7q9BzRxpqNRhZyb9_bCYoVMTBfyl72XAFr6TglwLaEGlts
    rMpPIhPbLISMg>
X-ME-Received: <xmr:Ak8TZO-AoqlfF1xxINCEdSRyW3FUyoOsvvl9sPqoLhvb0uwUvNXIFXUX391732YhNVq8HS7iEaxjw47OJyj87aj04xJ3k-IYxgC5Hm_xJJ_QBbsh5f-->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Ak8TZOoLP51IFf1xJ2qLRMIMOtJA4Iiv84WjyB84TvBsjS4yR3zcdQ>
    <xmx:Ak8TZPoSiLyPBtqL72qqphczYYDQnI_aXqX___ogkPEjHCgIu9kRjw>
    <xmx:Ak8TZMRMW1K7uTMQkXClyUi_QoxutD1Xso42LpbhEb9hkA_xEYuL0w>
    <xmx:Ak8TZG3FQJKtK8CiT6JCYDJX7Q7tbzpO10SKJXwLfLEjseamyLZxdQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/4] tools: don't use distutils in configure nor Makefile
Date: Thu, 16 Mar 2023 18:16:32 +0100
Message-Id: <20230316171634.320626-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python distutils is deprecated and is going to be removed in Python
3.12. The distutils.sysconfig is available as sysconfig module in
stdlib since Python 3.2, so use that directly.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 m4/python_devel.m4       | 28 ++++++++++++++--------------
 tools/libs/stat/Makefile |  4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
index bbf1e0354b2b..bb60857b030a 100644
--- a/m4/python_devel.m4
+++ b/m4/python_devel.m4
@@ -5,21 +5,21 @@ ac_previous_libs=$LIBS
 AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
 AS_IF([test x"$pyconfig" = x"no"], [
     dnl For those that don't have python-config
-    CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
-    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
+    CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
+    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("CFLAGS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-L" + sysconfig.get_python_lib(plat_specific=1,\
         standard_lib=1) + "/config")'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LIBS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LDFLAGS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LIBS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("SYSLIBS"))'`"
 ], [
     dnl If python-config is found use it
     CPPFLAGS="$CFLAGS `$PYTHON-config --cflags`"
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index ee5c42bf7b4d..a968eaff48cb 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -73,8 +73,8 @@ $(PYLIB): $(PYSRC)
 python-bindings: $(PYLIB) $(PYMOD)
 
 pythonlibdir = $(shell $(PYTHON) -c \
-	       'import distutils.sysconfig as cfg; \
-	        print(cfg.get_python_lib(False, False, prefix="$(prefix)"))')
+	       'import sysconfig; \
+	        print(sysconfig.get_python_lib("platlib", vars={"platbase": "$(prefix)"}))')
 
 .PHONY: install-python-bindings
 install-python-bindings: $(PYLIB) $(PYMOD)
-- 
2.39.2


