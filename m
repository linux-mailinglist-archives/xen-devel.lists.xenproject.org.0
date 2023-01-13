Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4B66A6AD
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477558.740338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAI-0007k0-8o; Fri, 13 Jan 2023 23:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477558.740338; Fri, 13 Jan 2023 23:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAI-0007gZ-3b; Fri, 13 Jan 2023 23:08:50 +0000
Received: by outflank-mailman (input) for mailman id 477558;
 Fri, 13 Jan 2023 23:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAG-00076h-3b
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d65cdf-9397-11ed-b8d0-410ff93cb8f0;
 Sat, 14 Jan 2023 00:08:45 +0100 (CET)
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
X-Inumbo-ID: 39d65cdf-9397-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ymMfRlm9ht6BlDD3wEaaTOA+gMUaexzdxRl9xxZ1XxA=;
  b=Mkwb1Z8APJ6Lw68XKw6Jh1Ii48sWj77hXDJoAwTjVYKbjucnfHuajbZ9
   UvPirSrHejODlzEU079k6n3LiykS2yG+WVVFZI27CwvQChwF0q1HM1Dd7
   jn+d76eNoHIAs8y2hAYjjKK4nvWCs3nxUBuy/eFCEsqrCibGIZfzECV7u
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558109
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hkB5ea85lXWNwxu0xsPUDrUDo36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DBOCj+FOK2LYzb3fdsibN7l9EgGu8eEy4IxTFNqpHo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkQ5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklp6
 OUjBxkjfyrTuKHx2pOWTOhWockKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0ExBvF9
 juergwVBDkkOvG45B7V1UmPi+7PzHLlfIUPGbe3o6sCbFq7mTVIVUx+uUGAieKilke0VtZbK
 koV0ikjt64/8AqsVNaVdwK8iG6JuFgbQdU4O+8n7ACAzILE7gDfAXILJhZjQtE7sM49RRQxy
 0SE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAj8Liixn/urSOW9qeKCRQUywPWZEWox1YsDGK6XLBE+WQ3/N4ZctnCEwbf4
 CNd8ySNxLtQVM/QzURhVM1IRej0vKjdbVUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6Oxwl8AM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLp3yVipKWPw3lWHeqwIhPVgDn3BW+I8ubcqjk0TPPUS2ORZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivr6Wo
 CDlCxIGkASXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:2pe1SKht1mQuaZv+2QSfBpMnDXBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558109"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v2 4/5] xen/version: Fold build_id handling into xenver_varbuf_op()
Date: Fri, 13 Jan 2023 23:08:34 +0000
Message-ID: <20230113230835.29356-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230113230835.29356-1-andrew.cooper3@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

struct xen_build_id and struct xen_varbuf are identical from an ABI point of
view, so XENVER_build_id can reuse xenver_varbuf_op() rather than having it's
own almost identical copy of the logic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

v2:
 * New
---
 xen/common/kernel.c          | 49 +++++++++++++-------------------------------
 xen/include/public/version.h |  5 ++++-
 2 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index cc5d8247b04d..7ab410ac7c28 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -476,9 +476,22 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
@@ -502,6 +515,7 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     sz = strlen(str);
 
+ have_len:
     if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
         return -E2BIG;
 
@@ -703,41 +717,6 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
index 9287b5d3ff50..ee32d4c6b30b 100644
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
2.11.0


