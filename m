Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95F480141
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252003.432993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMF-0008Jk-5y; Mon, 27 Dec 2021 15:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252003.432993; Mon, 27 Dec 2021 15:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMF-0008GG-22; Mon, 27 Dec 2021 15:56:19 +0000
Received: by outflank-mailman (input) for mailman id 252003;
 Mon, 27 Dec 2021 15:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jnZ2=RM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1n1sMD-0007zI-75
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:56:17 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 854ba648-672d-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 16:56:15 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1BRFu4kE054486
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Dec 2021 10:56:10 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1BRFu42s054485;
 Mon, 27 Dec 2021 07:56:04 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 854ba648-672d-11ec-9e60-abaf8a552007
Message-Id: <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1640590794.git.ehem+xen@m5p.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Fri, 18 Dec 2020 13:37:44 -0800
Subject: [PATCH 1/5] tools/libxl: Mark pointer args of many functions constant
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
examining the pointed to thing, not modifying it.  This potentially
results in higher-performance output.  This also allows spreading
constants further, allowing more checking and security.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxl_json.h        | 22 ++++++++++++----------
 tools/libs/light/gentypes.py      |  8 ++++----
 tools/libs/light/libxl_cpuid.c    |  2 +-
 tools/libs/light/libxl_internal.c |  4 ++--
 tools/libs/light/libxl_internal.h | 18 +++++++++---------
 tools/libs/light/libxl_json.c     | 18 ++++++++++--------
 tools/libs/light/libxl_nocpuid.c  |  4 ++--
 7 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index 260783bfde..63f0e58fe1 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -23,17 +23,19 @@
 #endif
 
 yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
-yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
-yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
-yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *p);
-yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, libxl_bitmap *p);
+yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, const libxl_defbool *p);
+yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, const libxl_uuid *p);
+yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *p);
+yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, const libxl_bitmap *p);
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                                 libxl_cpuid_policy_list *p);
-yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *p);
+                                                 const libxl_cpuid_policy_list *p);
+yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
+                                           const libxl_string_list *p);
 yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
-                                              libxl_key_value_list *p);
-yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
-yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p);
+                                              const libxl_key_value_list *p);
+yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, const libxl_hwcap *p);
+yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
+                                           const libxl_ms_vm_genid *p);
 
 #include <_libxl_types_json.h>
 
@@ -91,6 +93,6 @@ static inline yajl_gen libxl_yajl_gen_alloc(const yajl_alloc_funcs *allocFuncs)
 #endif /* !HAVE_YAJL_V2 */
 
 yajl_gen_status libxl_domain_config_gen_json(yajl_gen hand,
-                                             libxl_domain_config *p);
+                                             const libxl_domain_config *p);
 
 #endif /* LIBXL_JSON_H */
diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 9a45e45acc..7e02a5366f 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -632,7 +632,7 @@ if __name__ == '__main__':
                                                ty.make_arg("p"),
                                                ku.keyvar.type.make_arg(ku.keyvar.name)))
         if ty.json_gen_fn is not None:
-            f.write("%schar *%s_to_json(libxl_ctx *ctx, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p")))
+            f.write("%schar *%s_to_json(libxl_ctx *ctx, const %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p")))
         if ty.json_parse_fn is not None:
             f.write("%sint %s_from_json(libxl_ctx *ctx, %s, const char *s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
         if isinstance(ty, idl.Enumeration):
@@ -662,7 +662,7 @@ if __name__ == '__main__':
 """ % (header_json_define, header_json_define, " ".join(sys.argv)))
 
     for ty in [ty for ty in types if ty.json_gen_fn is not None]:
-        f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+        f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, const %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
 
     f.write("\n")
     f.write("""#endif /* %s */\n""" % header_json_define)
@@ -766,13 +766,13 @@ if __name__ == '__main__':
         f.write("\n")
 
     for ty in [t for t in types if t.json_gen_fn is not None]:
-        f.write("yajl_gen_status %s_gen_json(yajl_gen hand, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+        f.write("yajl_gen_status %s_gen_json(yajl_gen hand, const %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
         f.write("{\n")
         f.write(libxl_C_type_gen_json(ty, "p"))
         f.write("}\n")
         f.write("\n")
 
-        f.write("char *%s_to_json(libxl_ctx *ctx, %s)\n" % (ty.typename, ty.make_arg("p")))
+        f.write("char *%s_to_json(libxl_ctx *ctx, const %s)\n" % (ty.typename, ty.make_arg("p")))
         f.write("{\n")
         f.write(libxl_C_type_to_json(ty, "p"))
         f.write("}\n")
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648d..b076d7f4a3 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -14,7 +14,7 @@
 
 #include "libxl_internal.h"
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
 {
     return !libxl_cpuid_policy_list_length(pl);
 }
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index 86556b6113..da2dbd67ad 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -333,7 +333,7 @@ _hidden int libxl__parse_mac(const char *s, libxl_mac mac)
     return 0;
 }
 
-_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b)
+_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)
 {
     int i;
 
@@ -345,7 +345,7 @@ _hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b)
     return 0;
 }
 
-_hidden int libxl__mac_is_default(libxl_mac *mac)
+_hidden int libxl__mac_is_default(const libxl_mac *mac)
 {
     return (!(*mac)[0] && !(*mac)[1] && !(*mac)[2] &&
             !(*mac)[3] && !(*mac)[4] && !(*mac)[5]);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 37d5c27756..117a98acab 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2080,9 +2080,9 @@ struct libxl__xen_console_reader {
 /* parse the string @s as a sequence of 6 colon separated bytes in to @mac */
 _hidden int libxl__parse_mac(const char *s, libxl_mac mac);
 /* compare mac address @a and @b. 0 if the same, -ve if a<b and +ve if a>b */
-_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b);
+_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
 /* return true if mac address is all zero (the default value) */
-_hidden int libxl__mac_is_default(libxl_mac *mac);
+_hidden int libxl__mac_is_default(const libxl_mac *mac);
 /* init a recursive mutex */
 _hidden int libxl__init_recursive_mutex(libxl_ctx *ctx, pthread_mutex_t *lock);
 
@@ -4580,7 +4580,7 @@ _hidden int libxl__ms_vm_genid_set(libxl__gc *gc, uint32_t domid,
 #define LIBXL__DEFBOOL_STR_DEFAULT "<default>"
 #define LIBXL__DEFBOOL_STR_FALSE   "False"
 #define LIBXL__DEFBOOL_STR_TRUE    "True"
-static inline int libxl__defbool_is_default(libxl_defbool *db)
+static inline int libxl__defbool_is_default(const libxl_defbool *db)
 {
     return !db->val;
 }
@@ -4675,22 +4675,22 @@ int libxl__random_bytes(libxl__gc *gc, uint8_t *buf, size_t len);
 #include "_libxl_types_internal_private.h"
 
 /* This always return false, there's no "default value" for hw cap */
-static inline int libxl__hwcap_is_default(libxl_hwcap *hwcap)
+static inline int libxl__hwcap_is_default(const libxl_hwcap *hwcap)
 {
     return 0;
 }
 
-static inline int libxl__string_list_is_empty(libxl_string_list *psl)
+static inline int libxl__string_list_is_empty(const libxl_string_list *psl)
 {
     return !libxl_string_list_length(psl);
 }
 
-static inline int libxl__key_value_list_is_empty(libxl_key_value_list *pkvl)
+static inline int libxl__key_value_list_is_empty(const libxl_key_value_list *pkvl)
 {
     return !libxl_key_value_list_length(pkvl);
 }
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl);
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl);
 
 /* Portability note: a proper flock(2) implementation is required */
 typedef struct {
@@ -4821,12 +4821,12 @@ void* libxl__device_list(libxl__gc *gc, const libxl__device_type *dt,
 void libxl__device_list_free(const libxl__device_type *dt,
                              void *list, int num);
 
-static inline bool libxl__timer_mode_is_default(libxl_timer_mode *tm)
+static inline bool libxl__timer_mode_is_default(const libxl_timer_mode *tm)
 {
     return *tm == LIBXL_TIMER_MODE_DEFAULT;
 }
 
-static inline bool libxl__string_is_default(char **s)
+static inline bool libxl__string_is_default(char *const *s)
 {
     return *s == NULL;
 }
diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 9b8ef2cab9..88e81f9905 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -95,7 +95,7 @@ yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, const char *str)
  * YAJL generators for builtin libxl types.
  */
 yajl_gen_status libxl_defbool_gen_json(yajl_gen hand,
-                                       libxl_defbool *db)
+                                       const libxl_defbool *db)
 {
     return libxl__yajl_gen_asciiz(hand, libxl_defbool_to_string(*db));
 }
@@ -137,7 +137,7 @@ int libxl__bool_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 yajl_gen_status libxl_uuid_gen_json(yajl_gen hand,
-                                    libxl_uuid *uuid)
+                                    const libxl_uuid *uuid)
 {
     char buf[LIBXL_UUID_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)));
@@ -154,7 +154,7 @@ int libxl__uuid_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand,
-                                      libxl_bitmap *bitmap)
+                                      const libxl_bitmap *bitmap)
 {
     yajl_gen_status s;
     int i;
@@ -208,7 +208,7 @@ int libxl__bitmap_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
-                                              libxl_key_value_list *pkvl)
+                                              const libxl_key_value_list *pkvl)
 {
     libxl_key_value_list kvl = *pkvl;
     yajl_gen_status s;
@@ -269,7 +269,8 @@ int libxl__key_value_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
-yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *pl)
+yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
+                                           const libxl_string_list *pl)
 {
     libxl_string_list l = *pl;
     yajl_gen_status s;
@@ -322,7 +323,7 @@ int libxl__string_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
-yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *mac)
+yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *mac)
 {
     char buf[LIBXL_MAC_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
@@ -339,7 +340,7 @@ int libxl__mac_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
-                                     libxl_hwcap *p)
+                                     const libxl_hwcap *p)
 {
     yajl_gen_status s;
     int i;
@@ -377,7 +378,8 @@ int libxl__hwcap_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
-yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p)
+yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
+                                           const libxl_ms_vm_genid *p)
 {
     yajl_gen_status s;
     int i;
diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index 0630959e76..f40a004e95 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -14,7 +14,7 @@
 
 #include "libxl_internal.h"
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
 {
     return 1;
 }
@@ -41,7 +41,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 }
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                const libxl_cpuid_policy_list *pcpuid)
 {
     return 0;
 }
-- 
2.30.2


