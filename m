Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB779AA5D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599656.935184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9N-0006sH-W7; Mon, 11 Sep 2023 16:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599656.935184; Mon, 11 Sep 2023 16:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9N-0006pN-Sk; Mon, 11 Sep 2023 16:52:37 +0000
Received: by outflank-mailman (input) for mailman id 599656;
 Mon, 11 Sep 2023 16:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfk9M-0005g0-WE
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:52:37 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c20fdec-50c3-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 18:52:36 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40061928e5aso53549715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:52:36 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fefcbe7fa8sm10578124wmi.28.2023.09.11.09.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:52:35 -0700 (PDT)
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
X-Inumbo-ID: 9c20fdec-50c3-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694451156; x=1695055956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWR3yQmcKWDwWpf/I8JOHNwbnGjcKvY7WPldaM6ij1o=;
        b=UnDFuBzVwIiL0zjptQVPXdQM75uq/gQ7nO34vRXYwU/AzYYCGvJxstL2dkE7X0hUlD
         UwbYYe6l9IbQkFG87v8PsNrq8+Dld4XRug3Q8y9UNVLJiYPT7IXBPn8WoRtc1ccQZZMO
         hS/1jgXyhRU2xs7nltCdCZi0I1HG3ZbX5TH3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451156; x=1695055956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWR3yQmcKWDwWpf/I8JOHNwbnGjcKvY7WPldaM6ij1o=;
        b=B9YOwVBAkwCSSmAdWWiL9hVZnQ5sgnJaw8XtqP6Q0hA9NEnP+aoLNodP7At2VSp1yd
         GmRFF1K1Y3NfOxgdek64FpswSw2A+T0cQeCvOMie+afa1O9YMvGfRavtIpAKmaY3mSV/
         lrqH9mkvqBhhzwoeIcmJ8xYtmfutlw5JnfI39Ha58ZsRWnebqzwftxML8Fm2AMD8/xno
         J/x8dSWGXLkKVtEAYgCrD01YgjlJgLPNc5YPrnBSNnLxxaQW4CcuXRQgwHMtV0tImIsN
         MP6mVoXk8ka0qvezQ7kmpFFVc18WhgBNvszTIX21Nl896tADMh4fNoFJ7hRQuimX6MRy
         SmBA==
X-Gm-Message-State: AOJu0Yx/uLnuFwlcbEodpiHYxvbiraSNT+1RoRykb18b88oJrDV+m6t+
	cxHkf30tQOQCkg0QVZXl5b+AC7EYSM0/iZ8JQ20=
X-Google-Smtp-Source: AGHT+IGynlsdxSx0n9nKQMoLGfszC3U0usQq/40SvyrYxDrncH8NI7OwUIA4E8qeWqIKxlIdJ/SBJA==
X-Received: by 2002:a1c:ed08:0:b0:3fe:2a98:a24c with SMTP id l8-20020a1ced08000000b003fe2a98a24cmr7875975wmh.26.1694451155696;
        Mon, 11 Sep 2023 09:52:35 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor Makefile
Date: Mon, 11 Sep 2023 17:51:02 +0100
Message-ID: <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694450145.git.javi.merino@cloud.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Python distutils is deprecated and is going to be removed in Python
3.12. The distutils.sysconfig is available as sysconfig module in
stdlib since Python 3.2, so use that directly.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 m4/python_devel.m4       | 28 ++++++++++++++--------------
 tools/libs/stat/Makefile |  4 ++--
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
index bbf1e0354b..bb60857b03 100644
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
index ee5c42bf7b..a968eaff48 100644
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
2.41.0


