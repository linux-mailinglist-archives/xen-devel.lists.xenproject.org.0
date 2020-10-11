Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501728AB18
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 01:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5741.14887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRkoP-0002ML-Q2; Sun, 11 Oct 2020 23:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5741.14887; Sun, 11 Oct 2020 23:31:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRkoP-0002Lw-Mq; Sun, 11 Oct 2020 23:31:33 +0000
Received: by outflank-mailman (input) for mailman id 5741;
 Sun, 11 Oct 2020 23:31:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0GLi=DS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kRkoN-0002Lo-RF
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 23:31:31 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bced579-d309-47f4-84b2-311d75545f4f;
 Sun, 11 Oct 2020 23:31:30 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 188so16252314qkk.12
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 16:31:30 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 j88sm11321663qte.96.2020.10.11.16.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 16:31:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0GLi=DS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
	id 1kRkoN-0002Lo-RF
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 23:31:31 +0000
X-Inumbo-ID: 4bced579-d309-47f4-84b2-311d75545f4f
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4bced579-d309-47f4-84b2-311d75545f4f;
	Sun, 11 Oct 2020 23:31:30 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 188so16252314qkk.12
        for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2020 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S6paNgzd2Tf+FILweikzjEXvaD1XAePsH8bNyZZsa2Y=;
        b=SKP6EWykOTvWJlShn8HrHbgxaG577VSQcIrDuXhwHXrLpUxhWEWC5Nzhm3I87hNsRY
         aHrKCupp5AK9+D8MT3Gh1lxb5/R1iljFUGLkksHNvoQe9pJX1p7OSl/GXwrWTDwj/+/w
         oAC0SL7Y6mfuC7b4xkIpwY5FYmx22SePwbxUTaWvE6rEDZ3+lHE4t1O3zZn20GU+r/Xh
         9tec04fSclONj8uWUqdDVCaJepZp+0tuH4tPWKRWkQk5bMQe/F1Of1sM0zRBhz8F9Sik
         MYbWQxSXUycXVk1s0b28zYXn6kzI5kSfZLSQpt3yQHSmoYjCV50wJdVRdpQyajz794XC
         7DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S6paNgzd2Tf+FILweikzjEXvaD1XAePsH8bNyZZsa2Y=;
        b=MkirZ9iQ+aTbOkV6xAGYMAc2NPgnjjAjuvs14L+kOT/rFfM6y1Oa7NhjLWZIBKmtmA
         XJ4UNqoQUIJ0JbB0NuW3of9zgpI/Lv1Vn9SwrTW2Pm9PdxPGI0PiZt4FfTIUAmvHGo38
         z2DEduQvd6Z5twYJ43L0Z7tcn2wsTcRWpH01lmjaqJeHusY8ZIfGwKWB0yJVrgTDdQOv
         ka52/LUBpObEcyI02TnYQG47/Ar4ss4SNcuFCokHaOn98x+nItmoDxp04XwpgSO7pwjR
         FmC4FcOp6HlkuY2JnL1o/Fd6a6QXFOje8h7FrifV9cw2+tydHPFIuyKd2xBehoDD4LOK
         T8tg==
X-Gm-Message-State: AOAM530E4oLglEDLH2aWIcg7HFaauVdfLSImYVXT7LNbTz9upasdCfWR
	l1a2XDhaSf8CzQgHWFouE7I1nXuthdY=
X-Google-Smtp-Source: ABdhPJxXrSmqR/mmdlfiMXv7kMhwPsWW1gIISvYdFwOWJSsv4iGOhFneN+X4Ng+95JwwiGWae1XoOg==
X-Received: by 2002:a05:620a:159b:: with SMTP id d27mr7482994qkk.28.1602459089711;
        Sun, 11 Oct 2020 16:31:29 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
        by smtp.gmail.com with ESMTPSA id j88sm11321663qte.96.2020.10.11.16.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 16:31:28 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] golang/xenlight: do not hard code libxl dir in gengotypes.py
Date: Sun, 11 Oct 2020 19:31:24 -0400
Message-Id: <8e66cd2d53bb9f14bdfa0a2539773f3a6a3526b6.1602458773.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1

Currently, in order to 'import idl' in gengotypes.py, we derive the path
of the libxl source directory from the XEN_ROOT environment variable, and
append that to sys.path so python can see idl.py. Since the the recent move of
libxl to tools/libs/light, this hard coding breaks the build.

Instead, check for the environment variable LIBXL_SRC_DIR, but move this
check to a try-except block (with empty except). This simply makes the
real error more visible, and does not strictly require that
LIBXL_SRC_DIR is used. Finally, update the Makefile to set LIBXL_SRC_DIR
rather than XEN_ROOT when calling gengotypes.py.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/Makefile      | 2 +-
 tools/golang/xenlight/gengotypes.py | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index fd8e4893db..e394ef9b2b 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -16,7 +16,7 @@ all: build
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
 %.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
-	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
+	LIBXL_SRC_DIR=$(LIBXL_SRC_DIR) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
 
 # Go will do its own dependency checking, and not actuall go through
 # with the build if none of the input files have changed.
diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index ebec938224..4ac181ae47 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -3,7 +3,14 @@
 import os
 import sys
 
-sys.path.append('{0}/tools/libxl'.format(os.environ['XEN_ROOT']))
+try:
+    sys.path.append(os.environ['LIBXL_SRC_DIR'])
+except:
+    # If we get here, then we expect the 'import idl'
+    # expression to fail. That error is more informative,
+    # so let it happen.
+    pass
+
 import idl
 
 # Go versions of some builtin types.
-- 
2.17.1


