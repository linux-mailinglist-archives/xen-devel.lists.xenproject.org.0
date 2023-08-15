Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A177D4D9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584052.914478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fu-0005Mh-Et; Tue, 15 Aug 2023 21:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584052.914478; Tue, 15 Aug 2023 21:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fu-0005Cu-5P; Tue, 15 Aug 2023 21:07:10 +0000
Received: by outflank-mailman (input) for mailman id 584052;
 Tue, 15 Aug 2023 21:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fr-0004qk-QH
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af357fec-3baf-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 23:07:05 +0200 (CEST)
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
X-Inumbo-ID: af357fec-3baf-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=//kMpvC6KAHT9QpCz/eo4st7+6bf1i4Hc4JRmfZsfK8=;
  b=bXyRPppo2A8AEjfZClnkZxytzLhjTFRVQVWmQycXYUmngiittifPdf4V
   IEAGMg/SWYRuNfs54TVwpvc/Te8hhdssYSu6Oi4G1drrJfbzaDLPiPajw
   mpTEC8jDIEb2QQfNC2MGsQNYfvBvZUlEXwrdUqcP8A8NEIICmWgebjLdO
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119588439
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gw76Ya4ugpWQLihruQL+mgxRtO3HchMFZxGqfqrLsTDasY5as4F+v
 jYfUGmDOv7fNzD9KdgjOYu0oRlSuJDVxtZqTws6+y9kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 uYgNg0TXjO6jcms2Z+9U9l1oJwoI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/J+
 zKWoz+oav0cHM3GwxSe1mi0v7/SvjL5AdtCOLnn9uE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZvZuFrSkyOL8Hz7Yy
 iqP6iM5gt0uYdUjjvvhuwqd2nT1+8aPF1RujunKYo67xiBjXJCYebyL0FLw9+9tKp+pV3/Zt
 3dRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeJ4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUi3zSDAcollY
 /93lPpA6l5DUMxaIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXMLFjtfnY/FSKo
 48PXydv9/m4eLeiChQ7DKZJdQxaRZTFLcGeRzNrmh6rfVM9RTBJ5w75yrI9YY1195m5Zc+Rl
 kxRrnRwkQKl7VWecFXiV5yWQO+3NXqJhS5hbHNE0JfB8yRLXLtDG49EKsZqIeF9qrM7pRO2J
 tFcE/i97j10Ymyv01wggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:oMoVKKlFYxSjL0FPr4YlXLzQX6/pDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-Talos-CUID: =?us-ascii?q?9a23=3Am01ujWoXx3qaaqPFbS/eFW7mUeM/SmPg0kfzGkW?=
 =?us-ascii?q?TE39ETqSlUHnI86wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ArtA+UQ9v1Yjl3h1VV7Sd1uiQf9Yx6Yq1LFoVqMU?=
 =?us-ascii?q?bmNiGbHUgFzPCjCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="119588439"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 03/10] xen/version: Fold build_id handling into xenver_varbuf_op()
Date: Tue, 15 Aug 2023 22:06:43 +0100
Message-ID: <20230815210650.2735671-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

struct xen_build_id and struct xen_varbuf are identical from an ABI point of
view, so XENVER_build_id can reuse xenver_varbuf_op() rather than having it's
own almost identical copy of the logic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

v2:
 * New
---
 xen/common/kernel.c          | 49 +++++++++++-------------------------
 xen/include/public/version.h |  5 +++-
 2 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 79c008c7ee5f..4a051be1cbe0 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -504,9 +504,22 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     struct xen_varbuf user_str;
     const char *str = NULL;
     size_t sz;
+    int rc;
 
     switch ( cmd )
     {
+    case XENVER_build_id:
+    {
+        unsigned int local_sz;
+
+        rc = xen_build_id((const void **)&str, &local_sz);
+        if ( rc )
+            return rc;
+
+        sz = local_sz;
+        goto have_len;
+    }
+
     case XENVER_extraversion2:
         str = xen_extra_version();
         break;
@@ -530,6 +543,7 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     sz = strlen(str);
 
+ have_len:
     if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
         return -E2BIG;
 
@@ -731,41 +745,6 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     }
 
     case XENVER_build_id:
-    {
-        xen_build_id_t build_id;
-        unsigned int sz;
-        int rc;
-        const void *p;
-
-        if ( deny )
-            return -EPERM;
-
-        /* Only return size. */
-        if ( !guest_handle_is_null(arg) )
-        {
-            if ( copy_from_guest(&build_id, arg, 1) )
-                return -EFAULT;
-
-            if ( build_id.len == 0 )
-                return -EINVAL;
-        }
-
-        rc = xen_build_id(&p, &sz);
-        if ( rc )
-            return rc;
-
-        if ( guest_handle_is_null(arg) )
-            return sz;
-
-        if ( sz > build_id.len )
-            return -ENOBUFS;
-
-        if ( copy_to_guest_offset(arg, offsetof(xen_build_id_t, buf), p, sz) )
-            return -EFAULT;
-
-        return sz;
-    }
-
     case XENVER_extraversion2:
     case XENVER_capabilities2:
     case XENVER_changeset2:
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 0dd6bbcb43cc..1022604daa41 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -124,8 +124,10 @@ typedef char xen_commandline_t[1024];
 /*
  * Return value is the number of bytes written, or XEN_Exx on error.
  * Calling with empty parameter returns the size of build_id.
+ *
+ * Note: structure only kept for backwards compatibility.  Xen operates in
+ * terms of xen_varbuf_t.
  */
-#define XENVER_build_id 10
 struct xen_build_id {
         uint32_t        len; /* IN: size of buf[]. */
         unsigned char   buf[XEN_FLEX_ARRAY_DIM];
@@ -164,6 +166,7 @@ typedef struct xen_varbuf xen_varbuf_t;
  * effect.  e.g. Xen has no control over the formatting used for the command
  * line.
  */
+#define XENVER_build_id      10
 #define XENVER_extraversion2 11
 #define XENVER_capabilities2 12
 #define XENVER_changeset2    13
-- 
2.30.2


