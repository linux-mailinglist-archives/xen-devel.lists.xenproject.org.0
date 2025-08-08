Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2CAB1EAD0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074670.1437224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVz-0001iH-2P; Fri, 08 Aug 2025 14:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074670.1437224; Fri, 08 Aug 2025 14:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVy-0001c8-Pt; Fri, 08 Aug 2025 14:56:14 +0000
Received: by outflank-mailman (input) for mailman id 1074670;
 Fri, 08 Aug 2025 14:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVw-0001BL-Oz
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVw-007zrt-1n;
 Fri, 08 Aug 2025 14:56:12 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVw-009BYT-0y;
 Fri, 08 Aug 2025 14:56:12 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ifWlGzTUU1FY9skxB0Gurmq9TF1yYQXRL2ntyqKDdmw=; b=u2zzoRO9ZvKkaKuhjxRpPiqHHX
	sU0CZMwSW8rP2QH7c/CKzAXK1kBOJMeIxKR/qKgpk5JpXkTffqdbWwG8BMoHFFN05NjhDEebiFauy
	nNZTRzGMToOHOgHPMVImCHOo46WEujyVqbjI5pDAT3NJs+dfmRSKqk/pziB53sSh1H+4=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 08/11] libxl: convert libxl__json_object_to_json() to json_object
Date: Fri,  8 Aug 2025 16:55:59 +0200
Message-Id: <20250808145602.41716-9-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

But keep the implementation done for YAJL.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_json.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 01944ef94d..cffda158d2 100644
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
@@ -1522,6 +1524,29 @@ char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
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
@@ -1549,6 +1574,7 @@ char *libxl__json_object_to_json(libxl__gc *gc,
 out:
     yajl_gen_free(hand);
     return ret;
+#endif
 }
 
 #ifdef HAVE_LIBJSONC
-- 
Anthony PERARD


