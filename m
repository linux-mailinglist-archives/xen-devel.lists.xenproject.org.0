Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07DBA9268
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132743.1471031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfm-0000Bg-Kx; Mon, 29 Sep 2025 12:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132743.1471031; Mon, 29 Sep 2025 12:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfm-00007Y-G3; Mon, 29 Sep 2025 12:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1132743;
 Mon, 29 Sep 2025 12:08:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfj-0008DS-V9
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfj-00GXBd-2J;
 Mon, 29 Sep 2025 12:08:03 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfj-004JHo-2M;
 Mon, 29 Sep 2025 12:08:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=7z8q2jx9Z85Tq8/zLDVB0fdB1L9QpzjX78jo8wa3bT0=; b=HLJzgLIkTM1mPA8GjhtyzC+/m4
	0VNpQPeN7gQnNYhhNAzpn3Ws5GxjwgcrgWs7TXCSdFCCGXicnmq6TQkLj+Jr5e0eAE+e1qreco8r3
	V/sz6dP7atBoaUyoaXNkMemnamn4zIIOffbkZBXvLeGuQ/6wnou2x5NlQaI6lBivewPg=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 5/8] libxl: convert libxl__json_object_to_json() to json_object
Date: Mon, 29 Sep 2025 14:07:53 +0200
Message-ID: <20250929120756.46075-6-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

But keep the implementation done for YAJL.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/light/libxl_json.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index eeda9c301d..c76ae9f64a 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -104,10 +104,12 @@ typedef struct libxl__yajl_ctx {
  * YAJL Helper
  */
 
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl__yajl_gen_asciiz(yajl_gen hand, const char *str)
 {
     return yajl_gen_string(hand, (const unsigned char *)str, strlen(str));
 }
+#endif
 
 #ifdef HAVE_LIBJSONC
 int libxl__enum_gen_jso(json_object **jso_r, const char *str)
@@ -1527,6 +1529,29 @@ char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
 char *libxl__json_object_to_json(libxl__gc *gc,
                                  const libxl__json_object *args)
 {
+#ifdef HAVE_LIBJSONC
+    const char *buf;
+    json_object *root;
+    char *ret = NULL;
+    int rc;
+
+    if (!args)
+        return NULL;
+
+    rc = libxl__json_object_to_json_object(gc, &root, args);
+    if (rc)
+        goto out;
+
+    buf = json_object_to_json_string_ext(root, JSON_C_TO_STRING_PRETTY);
+    if (!buf)
+        goto out;
+
+    ret = libxl__strdup(gc, buf);
+
+out:
+    json_object_put(root);
+    return ret;
+#elif defined(HAVE_LIBYAJL)
     const unsigned char *buf;
     libxl_yajl_length len;
     yajl_gen_status s;
@@ -1554,6 +1579,7 @@ char *libxl__json_object_to_json(libxl__gc *gc,
 out:
     yajl_gen_free(hand);
     return ret;
+#endif
 }
 
 #ifdef HAVE_LIBJSONC
-- 
Anthony PERARD


