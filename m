Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A71F79D7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 16:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjki7-0007Nj-83; Fri, 12 Jun 2020 14:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzU/=7Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jjki5-0007Ne-DO
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 14:31:09 +0000
X-Inumbo-ID: 5b38281a-acb9-11ea-8496-bc764e2007e4
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b38281a-acb9-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 14:31:08 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id dp10so4411323qvb.10
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Hg+W0zABmF6n2uWPQyG+mVbjLgEVs3exLfQq39XfqCc=;
 b=aVU1EtfbcL/PrI273a78owxE7T+MlqcWBgaY2TuZ2QDlBKrU9zGG1+Kegg+R+MQwaY
 J3Ef7OEndUj+pLmQ7GR4LrOZcbn/s8sOvgpja1qYmMvCBXSR7y4opUIephUSsgrc7IRK
 JMY0GlJd4fZrz8fjpt5TH6s+r1qSer022DIgJy0fAbnTFxiSFYU0lI3u5MSuRZV6m1f3
 b2M370ntLdUECVC+ZDCi0ctNdmv0UqB/Ap5dVocQNaJy8iJPkQAW6StG1NjLhtYhNDnj
 J1t3Bm6IO+mrDyvd77pOipF5kHfOKyON4rbEsBcKENaS6DFuWYEFGxk/v0f4YM5VBGgo
 PBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Hg+W0zABmF6n2uWPQyG+mVbjLgEVs3exLfQq39XfqCc=;
 b=O1mOs7SkMCGseEF4pw7sP0Z5fySoH4PLI8e1NsQDOwZdx44+InDtej9kkVfko4iXQT
 pzBwzW8fUQScMcWOUcAx2RBIGVcbxbwlb+mJ+GthjpJSGAyhltA7fRNV8EhEBdG1grfU
 2o3UVsC5h2aJzn45q2TatiUMnPVtyQL4NsWUkSXMt9wMJzfYFgH6HbuRgFbpV1lcRCWK
 PVLdHTugxGHBEWPPhVFobUcHuEuFDVuKFKiqWm2BI6ZcPKZpH8wW3yoL+L+/C1GfcLXy
 RrZBhpQ/QQOtNLDfa4SN0SHd+xFGB95Fh6spS9LtxXxfWZONrzjnhPoImgUeCKG0zOSX
 D7xg==
X-Gm-Message-State: AOAM531MQkkveR5n0IumPc5tO/2hH3kDV6MMzDCt5FIL9oKfstF2DjJV
 KkLexFsggT9RQTD4LfZQRcLba+jUIx8=
X-Google-Smtp-Source: ABdhPJyLqsqqxD8piMwE043nxlG7ig/iNnvJP8Th+Odt2Lc/2o0zN95bWz7gJ39xLuUBNUTvrHXoMQ==
X-Received: by 2002:a0c:f84c:: with SMTP id g12mr12736822qvo.31.1591972267782; 
 Fri, 12 Jun 2020 07:31:07 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id h77sm4738729qke.37.2020.06.12.07.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:31:06 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] tools: check go compiler version if present
Date: Fri, 12 Jun 2020 10:31:02 -0400
Message-Id: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently, no minimum go compiler version is required by the configure
scripts. However, the go bindings actually will not build with some
older versions of go. Add a check for a minimum go version of 1.11.1 in
accordance with tools/golang/xenlight/go.mod.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 m4/golang.m4       |  4 ++++
 tools/configure    | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac |  7 +++++++
 3 files changed, 60 insertions(+)

diff --git a/m4/golang.m4 b/m4/golang.m4
index 0b4bd54ce0..9cfd7e00a5 100644
--- a/m4/golang.m4
+++ b/m4/golang.m4
@@ -1,4 +1,8 @@
 AC_DEFUN([AC_PROG_GO], [
     dnl Check for the go compiler
     AC_CHECK_TOOL([GO],[go],[no])
+
+    if test "$GO" != "no"; then
+        GOVERSION=`$GO version | cut -d " " -f 3 | sed "s/go//"`
+    fi
 ])
diff --git a/tools/configure b/tools/configure
index b3668ec98d..f3f19c1a90 100755
--- a/tools/configure
+++ b/tools/configure
@@ -6845,6 +6845,10 @@ else
 fi
 
 
+    if test "$GO" != "no"; then
+        GOVERSION=`$GO version | cut -d " " -f 3 | sed "s/go//"`
+    fi
+
     if test "x$GO" = "xno"; then :
 
         if test "x$enable_golang" =  "xyes"; then :
@@ -6854,6 +6858,51 @@ fi
 fi
         golang="n"
 
+else
+
+
+
+
+  # Used to indicate true or false condition
+  ax_compare_version=false
+
+  # Convert the two version strings to be compared into a format that
+  # allows a simple string comparison.  The end result is that a version
+  # string of the form 1.12.5-r617 will be converted to the form
+  # 0001001200050617.  In other words, each number is zero padded to four
+  # digits, and non digits are removed.
+
+  ax_compare_version_A=`echo "$GOVERSION" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
+                     -e 's/Z\([0-9]\)Z/Z0\1Z/g' \
+                     -e 's/Z\([0-9][0-9]\)Z/Z0\1Z/g' \
+                     -e 's/Z\([0-9][0-9][0-9]\)Z/Z0\1Z/g' \
+                     -e 's/[^0-9]//g'`
+
+
+  ax_compare_version_B=`echo "1.11.1" | sed -e 's/\([0-9]*\)/Z\1Z/g' \
+                     -e 's/Z\([0-9]\)Z/Z0\1Z/g' \
+                     -e 's/Z\([0-9][0-9]\)Z/Z0\1Z/g' \
+                     -e 's/Z\([0-9][0-9][0-9]\)Z/Z0\1Z/g' \
+                     -e 's/[^0-9]//g'`
+
+
+    ax_compare_version=`echo "x$ax_compare_version_A
+x$ax_compare_version_B" | sed 's/^ *//' | sort -r | sed "s/x${ax_compare_version_A}/false/;s/x${ax_compare_version_B}/true/;1q"`
+
+
+
+    if test "$ax_compare_version" = "true" ; then
+
+            if test "x$enable_golang" = "xyes"; then :
+
+                as_fn_error $? "\"Your version of go: $GOVERSION is not supported\"" "$LINENO" 5
+
+fi
+            golang="n"
+
+      fi
+
+
 fi
 
 fi
diff --git a/tools/configure.ac b/tools/configure.ac
index a9af0a21c6..9d126b7a14 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -338,6 +338,13 @@ AS_IF([test "x$golang" = "xy"], [
             AC_MSG_ERROR([Go tools enabled, but missing go compiler])
         ])
         golang="n"
+    ], [
+        AX_COMPARE_VERSION([$GOVERSION], [lt], [1.11.1], [
+            AS_IF([test "x$enable_golang" = "xyes"], [
+                AC_MSG_ERROR(["Your version of go: $GOVERSION is not supported"])
+            ])
+            golang="n"
+        ])
     ])
 ])
 
-- 
2.17.1


