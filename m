Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555EDBA9279
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132740.1470992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfi-0007aC-FI; Mon, 29 Sep 2025 12:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132740.1470992; Mon, 29 Sep 2025 12:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfi-0007WN-AB; Mon, 29 Sep 2025 12:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1132740;
 Mon, 29 Sep 2025 12:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfh-0007Q3-2M
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfg-00GXB3-2U;
 Mon, 29 Sep 2025 12:08:00 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfg-004JHo-2a;
 Mon, 29 Sep 2025 12:08:00 +0000
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
	bh=U48btwyJU9uvDQVplZTudvitSWkJbIw5OvKyUBUKozM=; b=ztZtTQFGGsBFuEkgZBeghumveO
	irYazE1PvvQ+bhmwLWfpa+e+/Hi3ZV1smhGm5n7E+xKFAYMtKgep6MKcSTjigL7yN9lk0bk2F01zn
	p3J6edxwYiSrCQ2vZmPmbkCaTdjL7jAVK6IjcSLnfDnY/Ff9MRH0PiBKGLp5XFEjL7Z4=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 2/8] libxl: Convert libxl__json_parse() to use json-c
Date: Mon, 29 Sep 2025 14:07:50 +0200
Message-ID: <20250929120756.46075-3-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This reuse the "json_callback_*" implemented for the yajl parser as
they don't really need to be changed. It's just awkward to have to
cast between `unsigned char` and `char.`

Replace few strncpy() by memcpy() to let the compiler know we want to
copy the string without the terminating nul, as we are adding it just
after.

Also, it should be possible to keep using YAJL parser when json-c
library isn't available.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/include/libxl_json.h    |   4 ++
 tools/libs/light/libxl_json.c | 120 ++++++++++++++++++++++++++++++++--
 2 files changed, 120 insertions(+), 4 deletions(-)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index 3f97267eae..f0b4871e0e 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -42,6 +42,7 @@ yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p);
 #  define HAVE_YAJL_V2 1
 #endif
 
+#ifdef HAVE_LIBYAJL
 #ifdef HAVE_YAJL_V2
 
 typedef size_t libxl_yajl_length;
@@ -89,5 +90,8 @@ static inline yajl_gen libxl_yajl_gen_alloc(const yajl_alloc_funcs *allocFuncs)
 }
 
 #endif /* !HAVE_YAJL_V2 */
+#else
+typedef size_t libxl_yajl_length;
+#endif /* !HAVE_LIBYAJL */
 
 #endif /* LIBXL_JSON_H */
diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 9b8ef2cab9..44ee6e213f 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -16,7 +16,25 @@
 
 #include <math.h>
 
+#ifdef HAVE_LIBJSONC
+#include <json-c/json.h>
+#define USE_LIBJSONC_PARSER
+#endif
+
+#ifdef HAVE_LIBYAJL
+#  ifndef USE_LIBJSONC_PARSER
+#    define USE_LIBYAJL_PARSER
+#  endif
+#endif
+
+
+#ifdef USE_LIBJSONC_PARSER
+#include <json-c/json_visit.h>
+#endif
+
+#ifdef USE_LIBYAJL_PARSER
 #include <yajl/yajl_parse.h>
+#endif
 #include <yajl/yajl_gen.h>
 
 #include "libxl_internal.h"
@@ -25,7 +43,9 @@
 
 typedef struct libxl__yajl_ctx {
     libxl__gc *gc;
+#ifdef USE_LIBYAJL_PARSER
     yajl_handle hand;
+#endif
     libxl__json_object *head;
     libxl__json_object *current;
 #ifdef DEBUG_ANSWER
@@ -33,7 +53,7 @@ typedef struct libxl__yajl_ctx {
 #endif
 } libxl__yajl_ctx;
 
-#ifdef DEBUG_ANSWER
+#if defined(DEBUG_ANSWER) && defined(USE_LIBYAJL_PARSER)
 #if YAJL_VERSION < 20000
 #  define DEBUG_GEN_ALLOC(ctx)                  \
     if ((ctx)->g == NULL) {                     \
@@ -759,7 +779,7 @@ static int json_callback_number(void *opaque, const char *s, libxl_yajl_length l
     obj = libxl__json_object_alloc(ctx->gc, JSON_NUMBER);
 
     t = libxl__zalloc(ctx->gc, len + 1);
-    strncpy(t, s, len);
+    memcpy(t, s, len);
     t[len] = 0;
 
     obj->u.string = t;
@@ -806,7 +826,7 @@ static int json_callback_map_key(void *opaque, const unsigned char *str,
 
     DEBUG_GEN_STRING(ctx, str, len);
 
-    strncpy(t, (const char *) str, len);
+    memcpy(t, (const char *) str, len);
     t[len] = 0;
 
     if (libxl__json_object_is_map(obj)) {
@@ -890,6 +910,7 @@ static int json_callback_end_array(void *opaque)
     return 1;
 }
 
+#ifdef USE_LIBYAJL_PARSER
 static yajl_callbacks callbacks = {
     json_callback_null,
     json_callback_boolean,
@@ -903,28 +924,111 @@ static yajl_callbacks callbacks = {
     json_callback_start_array,
     json_callback_end_array
 };
+#endif
 
 static void yajl_ctx_free(libxl__yajl_ctx *yajl_ctx)
 {
+#ifdef USE_LIBYAJL_PARSER
     if (yajl_ctx->hand) {
         yajl_free(yajl_ctx->hand);
         yajl_ctx->hand = NULL;
     }
+#endif
     DEBUG_GEN_FREE(yajl_ctx);
 }
 
+#ifdef USE_LIBJSONC_PARSER
+static int jso_visiter(json_object *jso,
+                       int flags,
+                       json_object *parent_jso,
+                       const char *jso_key,
+                       size_t *jso_index,
+                       void *userarg)
+{
+    enum json_type type;
+    int r;
+
+    if (jso_key && flags != JSON_C_VISIT_SECOND) {
+        json_callback_map_key(userarg, (const unsigned char*)jso_key, strlen(jso_key));
+    }
+    type = json_object_get_type(jso);
+    switch (type) {
+    case json_type_null:
+        r = json_callback_null(userarg);
+        break;
+    case json_type_boolean:
+        r = json_callback_boolean(userarg, json_object_get_boolean(jso));
+        break;
+    case json_type_int:
+    case json_type_double: {
+        // it might be better to use on of
+        // json_object_get_{int,int64,uint64,double} instead.
+        // but would need to replace json_callback_number().
+        const char *s = json_object_get_string(jso);
+        r = json_callback_number(userarg, s, strlen(s));
+        break;
+    }
+    case json_type_object:
+        if (flags != JSON_C_VISIT_SECOND) {
+            r = json_callback_start_map(userarg);
+        } else {
+            r = json_callback_end_map(userarg);
+        }
+        break;
+    case json_type_array:
+        if (flags != JSON_C_VISIT_SECOND) {
+            r = json_callback_start_array(userarg);
+        } else {
+            r = json_callback_end_array(userarg);
+        }
+        break;
+    case json_type_string: {
+        const char *s = json_object_get_string(jso);
+        const int len = json_object_get_string_len(jso);
+        r = json_callback_string(userarg, (const unsigned char*)s, len);
+        break;
+    }
+    default:
+        /* error */
+        r = 0;
+    }
+    if (r == 0)
+        return JSON_C_VISIT_RETURN_ERROR;
+    return JSON_C_VISIT_RETURN_CONTINUE;
+}
+#endif
+
 libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
 {
+#ifdef USE_LIBYAJL_PARSER
     yajl_status status;
+    unsigned char *str = NULL;
+#endif
     libxl__yajl_ctx yajl_ctx;
     libxl__json_object *o = NULL;
-    unsigned char *str = NULL;
+#ifdef USE_LIBJSONC_PARSER
+    json_object *jso;
+    enum json_tokener_error error;
+
+    jso = json_tokener_parse_verbose(s, &error);
+    if (!jso) {
+        LOG(ERROR, "json-c parse error: %s", json_tokener_error_desc(error));
+        goto out;
+    }
+#endif
 
     memset(&yajl_ctx, 0, sizeof (yajl_ctx));
     yajl_ctx.gc = gc;
 
     DEBUG_GEN_ALLOC(&yajl_ctx);
 
+#ifdef USE_LIBJSONC_PARSER
+    int r = json_c_visit(jso, 0, jso_visiter, &yajl_ctx);
+    if (r < 0) {
+        LOG(ERROR, "json_c_visit failed");
+        goto out;
+    }
+#elif defined(USE_LIBYAJL_PARSER)
     if (yajl_ctx.hand == NULL) {
         yajl_ctx.hand = libxl__yajl_alloc(&callbacks, NULL, &yajl_ctx);
     }
@@ -935,6 +1039,7 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
     status = yajl_complete_parse(yajl_ctx.hand);
     if (status != yajl_status_ok)
         goto out;
+#endif
 
     o = yajl_ctx.head;
 
@@ -943,13 +1048,20 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
     yajl_ctx.head = NULL;
 
     yajl_ctx_free(&yajl_ctx);
+#ifdef USE_LIBJSONC_PARSER
+    json_object_put(jso);
+#endif
     return o;
 
 out:
+#ifdef USE_LIBJSONC_PARSER
+    json_object_put(jso);
+#elif defined(USE_LIBYAJL_PARSER)
     str = yajl_get_error(yajl_ctx.hand, 1, (const unsigned char*)s, strlen(s));
 
     LIBXL__LOG(libxl__gc_owner(gc), LIBXL__LOG_ERROR, "yajl error: %s", str);
     yajl_free_error(yajl_ctx.hand, str);
+#endif
     yajl_ctx_free(&yajl_ctx);
     return NULL;
 }
-- 
Anthony PERARD


