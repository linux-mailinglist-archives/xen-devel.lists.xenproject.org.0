Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61262B1EAD6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074668.1437202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVw-00019X-Nf; Fri, 08 Aug 2025 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074668.1437202; Fri, 08 Aug 2025 14:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOVw-00012F-GW; Fri, 08 Aug 2025 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1074668;
 Fri, 08 Aug 2025 14:56:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ukOVu-0000jH-TS
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:56:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVu-007zrg-2R;
 Fri, 08 Aug 2025 14:56:10 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ukOVu-009BYT-1b;
 Fri, 08 Aug 2025 14:56:10 +0000
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
	bh=dcQEIpjSqwJNNN97D3SvCHSjmd4l+W6ydBENkrkkG8A=; b=Cw5C3xDkqxHQcoGogOzp/+nHqW
	ipjba7VAEVJg5anvNy3oWv9WrAU+B43l7G0LdueLHvsMGz+VNsUAQvdMrIWuGV7npIp6jpMsbNgyy
	2jzZQUXqdL1I04AewWTPHLc41suIZqC3XevLJaeinEcFp/wNRugjE1Gsr0Sj5W1ea98c=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 06/11] libxl: convert libxl__json_object_to_yajl_gen to libxl__json_object_to_libjsonc_object
Date: Fri,  8 Aug 2025 16:55:57 +0200
Message-Id: <20250808145602.41716-7-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808145602.41716-1-anthony@xenproject.org>
References: <20250808145602.41716-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Convert yajl_gen to json_object from lib json-c.

And make use of it in qmp_prepare_cmd(), which can be compiled with
either lib.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/include/libxl_json.h        |  6 ++
 tools/libs/light/libxl_internal.h |  7 +++
 tools/libs/light/libxl_json.c     | 95 +++++++++++++++++++++++++++++++
 tools/libs/light/libxl_qmp.c      | 53 +++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index f0b4871e0e..e2ef8151f0 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -15,12 +15,18 @@
 #ifndef LIBXL_JSON_H
 #define LIBXL_JSON_H
 
+#ifdef HAVE_LIBJSONC
+#include <json-c/json.h>
+#endif
+
+#ifdef HAVE_LIBYAJL
 #include <yajl/yajl_gen.h>
 #include <yajl/yajl_parse.h>
 
 #ifdef HAVE_YAJL_YAJL_VERSION_H
 #  include <yajl/yajl_version.h>
 #endif
+#endif
 
 yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
 yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 4b6587a27a..b66aaa779d 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2234,9 +2234,16 @@ _hidden const libxl__json_object *libxl__json_map_get(const char *key,
  */
 _hidden libxl__json_object *libxl__json_object_alloc(libxl__gc *gc_opt,
                                                      libxl__json_node_type type);
+#ifdef HAVE_LIBJSONC
+_hidden int libxl__json_object_to_json_object(libxl__gc *gc,
+                                              json_object **jso_out,
+                                              const libxl__json_object *obj);
+#endif
+#ifdef HAVE_LIBYAJL
 _hidden yajl_status libxl__json_object_to_yajl_gen(libxl__gc *gc_opt,
                                                    yajl_gen hand,
                                                    const libxl__json_object *param);
+#endif
 _hidden void libxl__json_object_free(libxl__gc *gc_opt,
                                      libxl__json_object *obj);
 
diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 44ee6e213f..b26ac901d6 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -631,6 +631,100 @@ const libxl__json_object *libxl__json_map_get(const char *key,
     return NULL;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__json_object_to_json_object(libxl__gc *gc,
+                                      json_object **jso_out,
+                                      const libxl__json_object *obj)
+{
+    int idx = 0;
+    int rc, r;
+
+    switch (obj->type) {
+    case JSON_NULL:
+        *jso_out = json_object_new_null();
+        return 0;
+    case JSON_BOOL:
+        *jso_out = json_object_new_boolean(obj->u.b);
+        if (!*jso_out)
+            return ERROR_NOMEM;
+        return 0;
+    case JSON_INTEGER:
+        *jso_out = json_object_new_int64(obj->u.i);
+        if (!*jso_out)
+            return ERROR_NOMEM;
+        return 0;
+    case JSON_DOUBLE:
+        *jso_out = json_object_new_double(obj->u.d);
+        if (!*jso_out)
+            return ERROR_NOMEM;
+        return 0;
+    case JSON_NUMBER:
+        *jso_out = json_object_new_string(obj->u.string);
+        if (!*jso_out)
+            return ERROR_NOMEM;
+        return 0;
+    case JSON_STRING:
+        *jso_out = json_object_new_string(obj->u.string);
+        if (!*jso_out)
+            return ERROR_NOMEM;
+        return 0;
+    case JSON_MAP: {
+        libxl__json_map_node *node = NULL;
+        json_object *map_root = json_object_new_object();
+        json_object *node_value;
+
+        for (idx = 0; idx < obj->u.map->count; idx++) {
+            if (flexarray_get(obj->u.map, idx, (void**)&node) != 0)
+                break;
+
+            rc = libxl__json_object_to_json_object(gc, &node_value, node->obj);
+            if (rc) {
+                json_object_put(map_root);
+                return rc;
+            }
+
+            r = json_object_object_add(map_root, node->map_key, node_value);
+            if (r < 0) {
+                json_object_put(node_value);
+                json_object_put(map_root);
+                return ERROR_FAIL;
+            }
+        }
+        *jso_out = map_root;
+        return 0;
+    }
+    case JSON_ARRAY: {
+        libxl__json_object *node = NULL;
+        json_object *array_root = json_object_new_array_ext(obj->u.array->count);
+        json_object *node_value;
+
+        for (idx = 0; idx < obj->u.array->count; idx++) {
+            if (flexarray_get(obj->u.array, idx, (void**)&node) != 0)
+                break;
+
+            rc = libxl__json_object_to_json_object(gc, &node_value, node);
+            if (rc) {
+                json_object_put(array_root);
+                return rc;
+            }
+            r = json_object_array_add(array_root, node_value);
+            if (r < 0) {
+                json_object_put(node_value);
+                json_object_put(array_root);
+                return ERROR_FAIL;
+            }
+        }
+        *jso_out = array_root;
+        return 0;
+    }
+    case JSON_ANY:
+    default:
+        /* JSON_ANY is not a valid value for obj->type. */
+        return ERROR_FAIL;
+    }
+}
+#endif
+#ifdef HAVE_LIBYAJL
 yajl_status libxl__json_object_to_yajl_gen(libxl__gc *gc,
                                            yajl_gen hand,
                                            const libxl__json_object *obj)
@@ -698,6 +792,7 @@ yajl_status libxl__json_object_to_yajl_gen(libxl__gc *gc,
     abort();
 #undef CONVERT_YAJL_GEN_TO_STATUS
 }
+#endif
 
 
 /*
diff --git a/tools/libs/light/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
index 84740bd4b3..94b6fdb559 100644
--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -61,7 +61,11 @@
 
 #include <sys/un.h>
 
+#ifdef HAVE_LIBJSONC
+#include <json-c/json.h>
+#elif defined(HAVE_LIBYAJL)
 #include <yajl/yajl_gen.h>
+#endif
 
 #include "xen_list.h"
 #include "libxl_internal.h"
@@ -481,13 +485,56 @@ static char *qmp_prepare_cmd(libxl__gc *gc, const char *cmd,
                              const libxl__json_object *args,
                              int id)
 {
+#ifdef HAVE_LIBJSONC
+    json_object *jso = NULL;
+    json_object *jso_value = NULL;
+    /* memory for 'buf' is owned by 'jso' */
+    const char *buf;
+    int rc, r;
+#elif defined(HAVE_LIBYAJL)
     yajl_gen hand = NULL;
     /* memory for 'buf' is owned by 'hand' */
     const unsigned char *buf;
     libxl_yajl_length len;
     yajl_gen_status s;
+#else
+#  error Missing JSON library
+#endif
     char *ret = NULL;
 
+#ifdef HAVE_LIBJSONC
+    jso = json_object_new_object();
+    if (!jso)
+        goto out;
+
+    jso_value = json_object_new_string(cmd);
+    if (!jso_value)
+        goto out;
+    r = json_object_object_add(jso, "execute", jso_value);
+    if (r < 0)
+        goto out;
+    jso_value = json_object_new_int(id);
+    if (!jso_value)
+        goto out;
+    r = json_object_object_add(jso, "id", jso_value);
+    if (r < 0)
+        goto out;
+    /* `jso_value` now part of `jso`, shouldn't free it anymore */
+    jso_value = NULL;
+    if (args) {
+        rc = libxl__json_object_to_json_object(gc, &jso_value, args);
+        if (rc)
+            goto out;
+        r = json_object_object_add(jso, "arguments", jso_value);
+        if (r < 0)
+            goto out;
+        jso_value = NULL;
+    }
+
+    buf = json_object_to_json_string_ext(jso, JSON_C_TO_STRING_PLAIN);
+    ret = libxl__sprintf(gc, "%s\r\n", buf);
+
+#elif defined(HAVE_LIBYAJL)
     hand = libxl_yajl_gen_alloc(NULL);
 
     if (!hand) {
@@ -516,9 +563,15 @@ static char *qmp_prepare_cmd(libxl__gc *gc, const char *cmd,
         goto out;
 
     ret = libxl__sprintf(gc, "%*.*s\r\n", (int)len, (int)len, buf);
+#endif
 
 out:
+#ifdef HAVE_LIBJSONC
+    json_object_put(jso_value);
+    json_object_put(jso);
+#elif defined(HAVE_LIBYAJL)
     yajl_gen_free(hand);
+#endif
     return ret;
 }
 
-- 
Anthony PERARD


