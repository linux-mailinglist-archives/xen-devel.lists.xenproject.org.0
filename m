Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45569BA9271
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132742.1471021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfl-0008MX-12; Mon, 29 Sep 2025 12:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132742.1471021; Mon, 29 Sep 2025 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Cfk-0008J5-Ti; Mon, 29 Sep 2025 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1132742;
 Mon, 29 Sep 2025 12:08:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfi-0007uC-UR
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:08:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfi-00GXBV-2V;
 Mon, 29 Sep 2025 12:08:02 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3Cfi-004JHo-2F;
 Mon, 29 Sep 2025 12:08:02 +0000
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
	bh=QdP8PHqJmogVusHtiO1gc6B5Y6eGFL1T9BNVCi6iVhg=; b=VnZ5rgxsoXfTniZ3rahVpMU6YW
	NA1zXU2iTUkveG8fhMV6Yr3+zxy4sIhQ3iZBPAv16FXLr+prJxVjxRmEh4XJqNyBtgCVSJj+tKulX
	jAn6PbzGPgVl3mJ2mGcvBlvCv7xKmKSBpVv44b5Cz7JaNmYZF/7pJ4FG4Nyx8yHLCOuM=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 4/8] libxl: libxl__object_to_json() to json-c
Date: Mon, 29 Sep 2025 14:07:52 +0200
Message-ID: <20250929120756.46075-5-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929120756.46075-1-anthony@xenproject.org>
References: <20250929120756.46075-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

- libxl changes:

While doing so, we rename all "*_gen_json" function to "*_gen_jso" as
they have different prototype. All the function pointer are been cast
to (libxl__gen_json_callback) by "gentypes.py" when generating
"*_to_json()" functions.

We also introduce a few more "*_gen_jso" functions for "int" and
"bool" because we can't use json_object_*() functions from json-c
directly like it's done with yajl.

To make the generation of _libxl_types*json.[ch] with both YAJL and
json-c we add "--libjsonc" to gentypes.py so it can generate
functions/types for both.

Also introducing "jsonc_json_gen_fn" in the IDL, to be able to point
to a different function when using json-c.

Also, don't export any of the new *_gen_jso() function, at the cost of
having "_hidden" macro in semi-public headers.

- xl changes:

Also, rework the implementation of printf_info() in `xl` to avoid
using libxl_domain_config_gen_json() which isn't available without
YAJL. The implementation using "json_object" call
libxl_domain_config_to_json() which generate a plain string of JSON,
which we parse to add it to our own json; this avoid a dependency on
the json library used by libxl.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---

Notes:
    v2:
    - Replace construct $(if $(LIBJSONC_LIBS),--libjsonc) by
        $(if $(filter -ljson-c,$(XEN_JSON_LIBS))

 tools/include/libxl_json.h                |  17 ++
 tools/libs/light/Makefile                 |   2 +-
 tools/libs/light/gentypes.py              | 160 ++++++++++-
 tools/libs/light/idl.py                   |   7 +-
 tools/libs/light/libxl_cpuid.c            | 119 ++++++++
 tools/libs/light/libxl_internal.h         |  16 +-
 tools/libs/light/libxl_json.c             | 316 ++++++++++++++++++++++
 tools/libs/light/libxl_types.idl          |   7 +-
 tools/libs/light/libxl_types_internal.idl |   3 +-
 tools/xl/xl_info.c                        | 102 ++++++-
 10 files changed, 729 insertions(+), 20 deletions(-)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index e2ef8151f0..c130e88a5e 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -28,6 +28,22 @@
 #endif
 #endif
 
+#ifdef HAVE_LIBJSONC
+#ifndef _hidden
+#define _hidden
+#endif
+_hidden int libxl__uint64_gen_jso(json_object **jso_r, uint64_t val);
+_hidden int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *p);
+_hidden int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *p);
+_hidden int libxl_mac_gen_jso(json_object **jso_r, libxl_mac *p);
+_hidden int libxl_bitmap_gen_jso(json_object **jso_r, libxl_bitmap *p);
+_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r,libxl_cpuid_policy_list *p);
+_hidden int libxl_string_list_gen_jso(json_object **jso_r,libxl_string_list *p);
+_hidden int libxl_key_value_list_gen_jso(json_object **jso_r, libxl_key_value_list *p);
+_hidden int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p);
+_hidden int libxl_ms_vm_genid_gen_jso(json_object **jso_r, libxl_ms_vm_genid *p);
+#endif
+#if defined(HAVE_LIBYAJL)
 yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
 yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
 yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
@@ -40,6 +56,7 @@ yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
                                               libxl_key_value_list *p);
 yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
 yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p);
+#endif
 
 #include <_libxl_types_json.h>
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index c05d89db33..bc60c46558 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -226,7 +226,7 @@ testidl.o: $(XEN_INCLUDE)/libxl.h
 # This exploits the 'multi-target pattern rule' trick.
 # gentypes.py should be executed only once to make all the targets.
 _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
-	$(PYTHON) gentypes.py libxl_type$(*F).idl __libxl_type$(*F).h __libxl_type$(*F)_private.h \
+	$(PYTHON) gentypes.py $(if $(filter -ljson-c,$(XEN_JSON_LIBS)),--libjsonc) libxl_type$(*F).idl __libxl_type$(*F).h __libxl_type$(*F)_private.h \
 		__libxl_type$(*F)_json.h  __libxl_type$(*F).c
 	$(call move-if-changed,__libxl_type$(*F).h,_libxl_type$(*F).h)
 	$(call move-if-changed,__libxl_type$(*F)_private.h,_libxl_type$(*F)_private.h)
diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 3fe3873242..006bea170a 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -256,6 +256,30 @@ def libxl_C_type_member_init(ty, field):
     s += "\n"
     return s
 
+# For json-c gen_jso functions
+def libxl_C_type_gen_jso_map_key(f, parent, indent, scope_object, sub_scope_object):
+    s = ""
+    if isinstance(f.type, idl.KeyedUnion):
+        s += "switch (%s) {\n" % (parent + f.type.keyvar.name)
+        for x in f.type.fields:
+            v = f.type.keyvar.name + "." + x.name
+            s += "case %s:\n" % x.enumname
+            s += "    if (json_object_object_add(%s, \"%s\", %s)) {\n" % (scope_object, v, sub_scope_object)
+            s += "        json_object_put(%s);\n" % (sub_scope_object)
+            s += "        goto out;\n"
+            s += "    }\n"
+            s += "    break;\n"
+        s += "}\n"
+    else:
+        s += "if (json_object_object_add(%s, \"%s\", %s)) {\n" % (scope_object, f.name, sub_scope_object)
+        s += "    json_object_put(%s);\n" % (sub_scope_object)
+        s += "    goto out;\n"
+        s += "}\n"
+    if s != "":
+        s = indent + s
+    return s.replace("\n", "\n%s" % indent).rstrip(indent)
+
+# For YAJL gen_json functions
 def libxl_C_type_gen_map_key(f, parent, indent = ""):
     s = ""
     if isinstance(f.type, idl.KeyedUnion):
@@ -352,6 +376,86 @@ def get_default_expr(f, nparent, fexpr):
 
     return "%s" % fexpr
 
+# For json-c gen_json functions
+def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
+    s = ""
+    if parent is None:
+        s += "json_object *jso;\n"
+        s += "int rc;\n"
+        sub_scope_object = "jso_sub_1"
+    else:
+        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
+
+    if isinstance(ty, idl.Array):
+        if parent is None:
+            raise Exception("Array type must have a parent")
+        s += "{\n"
+        s += "    int i;\n"
+        s += "    %s = json_object_new_array_ext(%s);\n" % (scope_object, parent + ty.lenvar.name)
+        s += "    if (!%s)\n" % (scope_object)
+        s += "        goto out;\n"
+        s += "    for (i=0; i<%s; i++) {\n" % (parent + ty.lenvar.name)
+        s += "        json_object *%s;\n" % (sub_scope_object)
+        # remove some indent, it's over indented at least in one case libxl_vcpu_sched_params_gen_json
+        s += libxl_C_type_gen_jso(ty.elem_type, v+"[i]",
+                                   indent + "    ", parent, sub_scope_object)
+        s += "        if (json_object_array_add(%s, %s)) {\n" % (scope_object, sub_scope_object)
+        s += "            json_object_put(%s);\n" % (sub_scope_object)
+        s += "            goto out;\n"
+        s += "        }\n"
+        s += "    }\n"
+        s += "}\n"
+    elif isinstance(ty, idl.Enumeration):
+        s += "rc = libxl__enum_gen_jso(&%s, %s_to_string(%s));\n" % (scope_object, ty.typename, ty.pass_arg(v, parent is None))
+        s += "if (rc)\n"
+        s += "    goto out;\n"
+    elif isinstance(ty, idl.KeyedUnion):
+        if parent is None:
+            raise Exception("KeyedUnion type must have a parent")
+        s += "switch (%s) {\n" % (parent + ty.keyvar.name)
+        for f in ty.fields:
+            (nparent,fexpr) = ty.member(v, f, parent is None)
+            s += "case %s:\n" % f.enumname
+            if f.type is not None:
+                s += libxl_C_type_gen_jso(f.type, fexpr, indent + "    ", nparent, scope_object)
+            else:
+                s += "    %s = json_object_new_object();\n" % (scope_object)
+                s += "    if (!%s)\n" % (scope_object)
+                s += "        goto out;\n"
+            s += "    break;\n"
+        s += "}\n"
+    elif isinstance(ty, idl.Struct) and (parent is None or ty.json_gen_fn is None):
+        s += "%s = json_object_new_object();\n" % (scope_object)
+        s += "if (!%s)\n" % (scope_object)
+        s += "    goto out;\n"
+        for f in [f for f in ty.fields if not f.const and not f.type.private]:
+            (nparent,fexpr) = ty.member(v, f, parent is None)
+            default_expr = get_default_expr(f, nparent, fexpr)
+            s += "if (%s) {\n" % default_expr
+            s += "    json_object *%s = NULL;\n" % (sub_scope_object)
+            s += libxl_C_type_gen_jso(f.type, fexpr, "    ", nparent, sub_scope_object)
+            s += libxl_C_type_gen_jso_map_key(f, nparent, "    ", scope_object, sub_scope_object)
+
+            s += "}\n"
+
+    else:
+        if ty.json_gen_fn is not None:
+            s += "rc = %s(&%s, %s);\n" % (ty.json_gen_fn, scope_object, ty.pass_arg(v, parent is None))
+            s += "if (rc)\n"
+            s += "    goto out;\n"
+
+    if parent is None:
+        s += "*jso_r = jso;\n"
+        s += "return 0;\n"
+        s += "out:\n"
+        s += "json_object_put(jso);\n"
+        s += "return ERROR_FAIL;\n"
+
+    if s != "":
+        s = indent + s
+    return s.replace("\n", "\n%s" % indent).rstrip(indent)
+
+# For YAJL gen_json functions
 def libxl_C_type_gen_json(ty, v, indent = "    ", parent = None):
     s = ""
     if parent is None:
@@ -426,9 +530,9 @@ def libxl_C_type_gen_json(ty, v, indent = "    ", parent = None):
         s = indent + s
     return s.replace("\n", "\n%s" % indent).rstrip(indent)
 
-def libxl_C_type_to_json(ty, v, indent = "    "):
+def libxl_C_type_to_json(ty, v, indent = "    ", fn_ptr_type="libxl__gen_json_callback", fn_suffix="_gen_json"):
     s = ""
-    gen = "(libxl__gen_json_callback)&%s_gen_json" % ty.typename
+    gen = "(%s)&%s%s" % (fn_ptr_type, ty.typename, fn_suffix)
     s += "return libxl__object_to_json(ctx, \"%s\", %s, (void *)%s);\n" % (ty.typename, gen, ty.pass_arg(v, passby=idl.PASS_BY_REFERENCE))
 
     if s != "":
@@ -589,14 +693,38 @@ def clean_header_define(header_path):
 
 
 if __name__ == '__main__':
+    opt_libjsonc = False
+    if len(sys.argv) == 7:
+        if sys.argv.pop(1) == "--libjsonc":
+            opt_libjsonc = True
     if len(sys.argv) != 6:
         print("Usage: gentypes.py <idl> <header> <header-private> <header-json> <implementation>", file=sys.stderr)
         sys.exit(1)
 
     (_, idlname, header, header_private, header_json, impl) = sys.argv
 
+    # Overwrite `json_gen_fn` for standard types
+    if opt_libjsonc:
+        idl.bool.json_gen_fn = "libxl__boolean_gen_jso"
+        idl.size_t.json_gen_fn = "libxl__int_gen_jso"
+        idl.integer .json_gen_fn = "libxl__int_gen_jso"
+        idl.uint8.json_gen_fn = "libxl__int_gen_jso"
+        idl.uint16.json_gen_fn = "libxl__int_gen_jso"
+        idl.uint32.json_gen_fn = "libxl__int_gen_jso"
+        idl.uint64.json_gen_fn = "libxl__uint64_gen_jso"
+        idl.string.json_gen_fn = "libxl__string_gen_jso"
+
     (builtins,types) = idl.parse(idlname)
 
+    # Overwrite `json_gen_fn` with `jsonc_json_gen_fn` for types from the IDL
+    if opt_libjsonc:
+        for t in builtins:
+            if t.jsonc_json_gen_fn is not None:
+                t.json_gen_fn = t.jsonc_json_gen_fn
+        for t in types:
+            if t.jsonc_json_gen_fn is not None:
+                t.json_gen_fn = t.jsonc_json_gen_fn
+
     print("outputting libxl type definitions to %s" % header)
 
     f = open(header, "w")
@@ -665,7 +793,11 @@ if __name__ == '__main__':
 """ % (header_json_define, header_json_define, " ".join(sys.argv)))
 
     for ty in [ty for ty in types if ty.json_gen_fn is not None]:
-        f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+        if opt_libjsonc:
+            # Always hide JSON generators base on json-c
+            f.write("%sint %s_gen_jso(json_object **jso_r, %s);\n" % ("_hidden ", ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+        else:
+            f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
 
     f.write("\n")
     f.write("""#endif /* %s */\n""" % header_json_define)
@@ -769,15 +901,25 @@ if __name__ == '__main__':
         f.write("\n")
 
     for ty in [t for t in types if t.json_gen_fn is not None]:
-        f.write("yajl_gen_status %s_gen_json(yajl_gen hand, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
-        f.write("{\n")
-        f.write(libxl_C_type_gen_json(ty, "p"))
-        f.write("}\n")
-        f.write("\n")
+        if opt_libjsonc:
+            f.write("int %s_gen_jso(json_object **jso_r, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("{\n")
+            f.write(libxl_C_type_gen_jso(ty, "p"))
+            f.write("}\n")
+            f.write("\n")
+        else:
+            f.write("yajl_gen_status %s_gen_json(yajl_gen hand, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("{\n")
+            f.write(libxl_C_type_gen_json(ty, "p"))
+            f.write("}\n")
+            f.write("\n")
 
         f.write("char *%s_to_json(libxl_ctx *ctx, %s)\n" % (ty.typename, ty.make_arg("p")))
         f.write("{\n")
-        f.write(libxl_C_type_to_json(ty, "p"))
+        if opt_libjsonc:
+            f.write(libxl_C_type_to_json(ty, "p", fn_ptr_type="libxl__gen_json_callback", fn_suffix="_gen_jso"))
+        else:
+            f.write(libxl_C_type_to_json(ty, "p", fn_ptr_type="libxl__gen_json_callback", fn_suffix="_gen_json"))
         f.write("}\n")
         f.write("\n")
 
diff --git a/tools/libs/light/idl.py b/tools/libs/light/idl.py
index d7367503b4..61c8e14004 100644
--- a/tools/libs/light/idl.py
+++ b/tools/libs/light/idl.py
@@ -79,6 +79,7 @@ class Type(object):
 
         if self.typename is not None and not self.private:
             self.json_gen_fn = kwargs.setdefault('json_gen_fn', self.typename + "_gen_json")
+            self.jsonc_json_gen_fn = kwargs.setdefault('jsonc_json_gen_fn', self.typename + "_gen_jso")
             self.json_parse_type = kwargs.setdefault('json_parse_type', "JSON_ANY")
             if self.namespace is not None:
                 self.json_parse_fn = kwargs.setdefault('json_parse_fn',
@@ -88,6 +89,7 @@ class Type(object):
                                                        self.typename + "_parse_json")
         else:
             self.json_gen_fn = kwargs.setdefault('json_gen_fn', None)
+            self.jsonc_json_gen_fn = kwargs.setdefault('jsonc_json_gen_fn', None)
             self.json_parse_type = kwargs.setdefault('json_parse_type', None)
             self.json_parse_fn = kwargs.setdefault('json_parse_fn', None)
 
@@ -142,6 +144,7 @@ class Number(Builtin):
         kwargs.setdefault('copy_fn', None)
         kwargs.setdefault('signed', False)
         kwargs.setdefault('json_gen_fn', "yajl_gen_integer")
+        kwargs.setdefault('jsonc_json_gen_fn', "libxl__int_gen_jso")
         kwargs.setdefault('json_parse_type', "JSON_INTEGER")
         # json_parse_fn might be overriden on specific type
         kwargs.setdefault('json_parse_fn', "libxl__int_parse_json")
@@ -290,6 +293,7 @@ void = Builtin("void *", namespace = None)
 bool = Builtin("bool", namespace = None,
                copy_fn=None,
                json_gen_fn = "yajl_gen_bool",
+               jsonc_json_gen_fn = "libxl__boolean_gen_jso",
                json_parse_type = "JSON_BOOL",
                json_parse_fn = "libxl__bool_parse_json",
                autogenerate_json = False)
@@ -301,10 +305,11 @@ integer = Number("int", namespace = None, signed = True)
 uint8 = UInt(8)
 uint16 = UInt(16)
 uint32 = UInt(32)
-uint64 = UInt(64, json_gen_fn = "libxl__uint64_gen_json")
+uint64 = UInt(64, json_gen_fn = "libxl__uint64_gen_json", jsonc_json_gen_fn = "libxl__uint64_gen_jso")
 
 string = Builtin("char *", namespace = None, copy_fn = "libxl_string_copy", dispose_fn = "free",
                  json_gen_fn = "libxl__string_gen_json",
+                 jsonc_json_gen_fn = "libxl__string_gen_jso",
                  json_parse_type = "JSON_STRING | JSON_NULL",
                  json_parse_fn = "libxl__string_parse_json",
                  autogenerate_json = False,
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f738e17b19..8420b2465f 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -545,6 +545,124 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  * }
  */
 
+#ifdef HAVE_LIBJSONC
+int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, libxl_cpuid_policy_list *pl)
+{
+    libxl_cpuid_policy_list policy = *pl;
+    struct xc_xend_cpuid *cpuid;
+    const struct xc_msr *msr;
+    json_object *jso_outer;
+    json_object *jso_array;
+    int i, j;
+    int r;
+    int rc = ERROR_FAIL;
+
+    jso_outer = json_object_new_object();
+    if (!jso_outer) goto out;
+
+    jso_array = json_object_new_array();
+    if (!jso_array) goto out;
+
+    r = json_object_object_add(jso_outer, "cpuid", jso_array);
+    if (r < 0) {
+        json_object_put(jso_array);
+        goto out;
+    }
+
+    if (policy == NULL || policy->cpuid == NULL) goto empty;
+    cpuid = policy->cpuid;
+
+    for (i = 0; cpuid[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
+        json_object *jso_inner;
+        jso_inner = json_object_new_object();
+        if (!jso_inner) goto out;
+
+        r = json_object_array_add(jso_array, jso_inner);
+        if (r < 0) {
+            json_object_put(jso_inner);
+            goto out;
+        }
+
+        for (j = 0; j < 2; j++) {
+            if (cpuid[i].input[j] != XEN_CPUID_INPUT_UNUSED) {
+                json_object *jso_value = json_object_new_int(cpuid[i].input[j]);
+                if (!jso_value) goto out;
+                r = json_object_object_add(jso_inner, input_names[j], jso_value);
+                if (r < 0) {
+                    json_object_put(jso_value);
+                    goto out;
+                }
+            }
+        }
+
+        for (j = 0; j < 4; j++) {
+            if (cpuid[i].policy[j] != NULL) {
+                json_object *jso_value = json_object_new_string_len(cpuid[i].policy[j], 32);
+                if (!jso_value) goto out;
+                r = json_object_object_add(jso_inner, policy_names[j], jso_value);
+                if (r < 0) {
+                    json_object_put(jso_value);
+                    goto out;
+                }
+            }
+        }
+    }
+
+empty:
+
+    jso_array = json_object_new_array();
+    if (!jso_array) goto out;
+
+    r = json_object_object_add(jso_outer, "msr", jso_array);
+    if (r < 0) {
+        json_object_put(jso_array);
+        goto out;
+    }
+
+    if (!policy || !policy->msr) goto done;
+    msr = policy->msr;
+
+    for (i = 0; msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+        json_object *jso_inner;
+        json_object *jso_value;
+
+        jso_inner = json_object_new_object();
+        if (!jso_inner) goto out;
+
+        r = json_object_array_add(jso_array, jso_inner);
+        if (r < 0) {
+            json_object_put(jso_inner);
+            goto out;
+        }
+
+        jso_value = json_object_new_int(msr[i].index);
+        if (!jso_value) goto out;
+        r = json_object_object_add(jso_inner, "index", jso_value);
+        if (r < 0) {
+            json_object_put(jso_value);
+            goto out;
+        }
+
+        jso_value = json_object_new_string_len(msr[i].policy, 64);
+        if (!jso_value) goto out;
+        r = json_object_object_add(jso_inner, "policy", jso_value);
+        if (r < 0) {
+            json_object_put(jso_value);
+            goto out;
+        }
+    }
+
+done:
+    *jso_r = jso_outer;
+    jso_outer = NULL;
+    rc = 0;
+out:
+    json_object_put(jso_outer);
+    return rc;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
                                 libxl_cpuid_policy_list *pl)
 {
@@ -630,6 +748,7 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
 out:
     return s;
 }
+#endif
 
 int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         const libxl__json_object *o,
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 5204cb8889..b65e0064b9 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1993,9 +1993,11 @@ _hidden char *libxl__cpupoolid_to_name(libxl__gc *gc, uint32_t poolid);
 _hidden int libxl__enum_from_string(const libxl_enum_string_table *t,
                                     const char *s, int *e) NN(2);
 
-_hidden yajl_gen_status libxl__string_gen_json(yajl_gen hand, const char *p);
-
+#ifdef HAVE_LIBJSONC
+typedef int (*libxl__gen_json_callback)(json_object **jso_r, void *);
+#elif defined(HAVE_LIBYAJL)
 typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
+#endif
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
@@ -2084,11 +2086,21 @@ int libxl__recvmsg_fds(libxl__gc *gc, int carrier,
                        void *databuf, size_t datalen,
                        int nfds, int fds[], const char *what);
 
+#ifdef HAVE_LIBJSONC
+_hidden int libxl__enum_gen_jso(json_object **jso_r, const char *str);
+_hidden int libxl__int_gen_jso(json_object **jso_r, int i);
+_hidden int libxl__boolean_gen_jso(json_object **jso_r, bool b);
+_hidden int libxl__string_gen_jso(json_object **jso_r, const char *p);
+#endif
+
+#ifdef HAVE_LIBYAJL
 /* from libxl_json */
 #include <yajl/yajl_gen.h>
 
 _hidden yajl_gen_status libxl__yajl_gen_asciiz(yajl_gen hand, const char *str);
 _hidden yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, const char *str);
+_hidden yajl_gen_status libxl__string_gen_json(yajl_gen hand, const char *p);
+#endif
 
 typedef enum {
     JSON_NULL    = (1 << 0),
diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 75b383ee14..eeda9c301d 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -19,12 +19,16 @@
 #ifdef HAVE_LIBJSONC
 #include <json-c/json.h>
 #define USE_LIBJSONC_PARSER
+#define USE_LIBJSONC_GEN
 #endif
 
 #ifdef HAVE_LIBYAJL
 #  ifndef USE_LIBJSONC_PARSER
 #    define USE_LIBYAJL_PARSER
 #  endif
+#  ifndef USE_LIBJSONC_GEN
+#    define USE_LIBYAJL_GEN
+#  endif
 #endif
 
 
@@ -35,7 +39,9 @@
 #ifdef USE_LIBYAJL_PARSER
 #include <yajl/yajl_parse.h>
 #endif
+#ifdef USE_LIBYAJL_GEN
 #include <yajl/yajl_gen.h>
+#endif
 
 #include "libxl_internal.h"
 
@@ -103,6 +109,21 @@ yajl_gen_status libxl__yajl_gen_asciiz(yajl_gen hand, const char *str)
     return yajl_gen_string(hand, (const unsigned char *)str, strlen(str));
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__enum_gen_jso(json_object **jso_r, const char *str)
+{
+    if (str) {
+        *jso_r = json_object_new_string(str);
+        if (!*jso_r)
+            return ERROR_FAIL;
+    } else {
+        *jso_r = json_object_new_null();
+    }
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, const char *str)
 {
     if (str)
@@ -110,15 +131,28 @@ yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, const char *str)
     else
         return yajl_gen_null(hand);
 }
+#endif
 
 /*
  * YAJL generators for builtin libxl types.
  */
+#ifdef HAVE_LIBJSONC
+int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *db)
+{
+    *jso_r = json_object_new_string(libxl_defbool_to_string(*db));
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_defbool_gen_json(yajl_gen hand,
                                        libxl_defbool *db)
 {
     return libxl__yajl_gen_asciiz(hand, libxl_defbool_to_string(*db));
 }
+#endif
 
 int libxl__defbool_parse_json(libxl__gc *gc, const libxl__json_object *o,
                               libxl_defbool *p)
@@ -145,6 +179,16 @@ int libxl__defbool_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__boolean_gen_jso(json_object **jso_r, bool b)
+{
+    *jso_r = json_object_new_boolean(b);
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
 int libxl__bool_parse_json(libxl__gc *gc, const libxl__json_object *o,
                            bool *p)
 {
@@ -156,6 +200,19 @@ int libxl__bool_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *uuid)
+{
+    char buf[LIBXL_UUID_FMTLEN+1];
+    snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)));
+    *jso_r = json_object_new_string_len(buf, LIBXL_UUID_FMTLEN);
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_uuid_gen_json(yajl_gen hand,
                                     libxl_uuid *uuid)
 {
@@ -163,6 +220,7 @@ yajl_gen_status libxl_uuid_gen_json(yajl_gen hand,
     snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)));
     return yajl_gen_string(hand, (const unsigned char *)buf, LIBXL_UUID_FMTLEN);
 }
+#endif
 
 int libxl__uuid_parse_json(libxl__gc *gc, const libxl__json_object *o,
                            libxl_uuid *p)
@@ -173,6 +231,39 @@ int libxl__uuid_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return libxl_uuid_from_string(p, o->u.string);
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_bitmap_gen_jso(json_object **jso_r, libxl_bitmap *bitmap)
+{
+    json_object *jso;
+    int i;
+    int r;
+    int rc = ERROR_FAIL;
+
+    jso = json_object_new_array();
+    if (!jso) goto out;
+
+    libxl_for_each_bit(i, *bitmap) {
+        if (libxl_bitmap_test(bitmap, i)) {
+            json_object *jso_value = json_object_new_int(i);
+            if (!jso_value) goto out;
+            r = json_object_array_add(jso, jso_value);
+            if (r) {
+                json_object_put(jso_value);
+                goto out;
+            }
+        }
+    }
+
+    *jso_r = jso;
+    jso = NULL;
+    rc = 0;
+out:
+    json_object_put(jso);
+    return rc;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand,
                                       libxl_bitmap *bitmap)
 {
@@ -192,6 +283,7 @@ yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand,
 out:
     return s;
 }
+#endif
 
 int libxl__bitmap_parse_json(libxl__gc *gc, const libxl__json_object *o,
                             libxl_bitmap *p)
@@ -227,6 +319,42 @@ int libxl__bitmap_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_key_value_list_gen_jso(json_object **jso_r, libxl_key_value_list *pkvl)
+{
+    libxl_key_value_list kvl = *pkvl;
+    json_object *jso;
+    int i;
+
+    jso = json_object_new_object();
+    if (!jso) goto out;
+
+    if (!kvl) goto empty;
+
+    for (i = 0; kvl[i] != NULL; i += 2) {
+        json_object *jso_value;
+        if (kvl[i + 1]) {
+            jso_value = json_object_new_string(kvl[i+1]);
+            if (!jso_value) goto out;
+        } else {
+            jso_value = json_object_new_null();
+        }
+        int r = json_object_object_add(jso, kvl[i], jso_value);
+        if (r) {
+            json_object_put(jso_value);
+            goto out;
+        }
+    }
+empty:
+    *jso_r = jso;
+    return 0;
+out:
+    json_object_put(jso);
+    return ERROR_FAIL;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
                                               libxl_key_value_list *pkvl)
 {
@@ -253,6 +381,7 @@ yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
 out:
     return s;
 }
+#endif
 
 int libxl__key_value_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
                                      libxl_key_value_list *p)
@@ -289,6 +418,39 @@ int libxl__key_value_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_string_list_gen_jso(json_object **jso_r, libxl_string_list *pl)
+{
+    libxl_string_list l = *pl;
+    json_object *jso;
+    int i;
+    int rc = ERROR_FAIL;
+
+    jso = json_object_new_array();
+    if (!jso) goto out;
+
+    if (!l) goto empty;
+
+    for (i = 0; l[i] != NULL; i++) {
+        json_object *jso_value = json_object_new_string(l[i]);
+        if (!jso_value) goto out;
+        int r = json_object_array_add(jso, jso_value);
+        if (r) {
+            json_object_put(jso_value);
+            goto out;
+        }
+    }
+empty:
+    *jso_r = jso;
+    jso = NULL;
+    rc = 0;
+out:
+    json_object_put(jso);
+    return rc;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *pl)
 {
     libxl_string_list l = *pl;
@@ -309,6 +471,7 @@ yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *pl)
 out:
     return s;
 }
+#endif
 
 int libxl__string_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
                                   libxl_string_list *p)
@@ -342,12 +505,26 @@ int libxl__string_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_mac_gen_jso(json_object **jso_r, libxl_mac *mac)
+{
+    char buf[LIBXL_MAC_FMTLEN+1];
+    snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
+    *jso_r = json_object_new_string_len(buf, LIBXL_MAC_FMTLEN);
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *mac)
 {
     char buf[LIBXL_MAC_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
     return yajl_gen_string(hand, (const unsigned char *)buf, LIBXL_MAC_FMTLEN);
 }
+#endif
 
 int libxl__mac_parse_json(libxl__gc *gc, const libxl__json_object *o,
                           libxl_mac *p)
@@ -358,6 +535,36 @@ int libxl__mac_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return libxl__parse_mac(libxl__json_object_get_string(o), *p);
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p)
+{
+    json_object *jso;
+    int i;
+    int rc = ERROR_FAIL;
+
+    jso = json_object_new_array();
+    if (!jso) goto out;
+
+    for(i=0; i<4; i++) {
+        json_object *jso_value = json_object_new_int((*p)[i]);
+        if (!jso_value)
+            goto out;
+        int r = json_object_array_add(jso, jso_value);
+        if (r) {
+            json_object_put(jso_value);
+            goto out;
+        }
+    }
+    *jso_r = jso;
+    jso = NULL;
+    rc = 0;
+out:
+    json_object_put(jso);
+    return rc;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
                                      libxl_hwcap *p)
 {
@@ -375,6 +582,7 @@ yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
 out:
     return s;
 }
+#endif
 
 int libxl__hwcap_parse_json(libxl__gc *gc, const libxl__json_object *o,
                             libxl_hwcap *p)
@@ -397,6 +605,37 @@ int libxl__hwcap_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl_ms_vm_genid_gen_jso(json_object **jso_r, libxl_ms_vm_genid *p)
+{
+    json_object *jso;
+    int i;
+    int rc = ERROR_FAIL;
+
+    jso = json_object_new_array_ext(LIBXL_MS_VM_GENID_LEN);
+    if (!jso) goto out;
+
+    for (i = 0; i < LIBXL_MS_VM_GENID_LEN; i++) {
+        json_object *jso_value = json_object_new_int(p->bytes[i]);
+        if (!jso_value)
+            goto out;
+        int r = json_object_array_add(jso, jso_value);
+        if (r) {
+            json_object_put(jso_value);
+            goto out;
+        }
+    }
+
+    *jso_r = jso;
+    jso = NULL;
+    rc = 0;
+out:
+    json_object_put(jso);
+    return rc;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p)
 {
     yajl_gen_status s;
@@ -414,6 +653,7 @@ yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p)
 
     return yajl_gen_array_close(hand);
 }
+#endif
 
 int libxl__ms_vm_genid_parse_json(libxl__gc *gc, const libxl__json_object *o,
                                   libxl_ms_vm_genid *p)
@@ -436,6 +676,21 @@ int libxl__ms_vm_genid_parse_json(libxl__gc *gc, const libxl__json_object *o,
     return 0;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__string_gen_jso(json_object **jso_r, const char *p)
+{
+    if (p) {
+        *jso_r = json_object_new_string(p);
+        if (!*jso_r)
+            return ERROR_FAIL;
+    } else {
+        *jso_r = json_object_new_null();
+    }
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl__string_gen_json(yajl_gen hand,
                                        const char *p)
 {
@@ -444,6 +699,7 @@ yajl_gen_status libxl__string_gen_json(yajl_gen hand,
     else
         return yajl_gen_null(hand);
 }
+#endif
 
 int libxl__string_parse_json(libxl__gc *gc, const libxl__json_object *o,
                              char **p)
@@ -1166,6 +1422,7 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
     return NULL;
 }
 
+#ifdef USE_LIBYAJL_GEN
 static const char *yajl_gen_status_to_string(yajl_gen_status s)
 {
         switch (s) {
@@ -1190,7 +1447,43 @@ static const char *yajl_gen_status_to_string(yajl_gen_status s)
             return "unknown error";
         }
 }
+#endif
 
+#ifdef USE_LIBJSONC_GEN
+char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
+                            libxl__gen_json_callback gen, void *p)
+{
+    const char *buf;
+    char *ret = NULL;
+    json_object *jso = NULL;
+    int rc;
+
+    rc = gen(&jso, p);
+    if (rc)
+        goto out;
+
+    buf = json_object_to_json_string_ext(jso, JSON_C_TO_STRING_PRETTY);
+    if (!buf)
+        goto out;
+    ret = strdup((const char *)buf);
+
+out:
+    json_object_put(jso);
+
+    if (rc) {
+        LIBXL__LOG(ctx, LIBXL__LOG_ERROR,
+                   "unable to convert %s to JSON representation. ",
+                   type);
+    } else if (!ret) {
+        LIBXL__LOG(ctx, LIBXL__LOG_ERROR,
+                   "unable to allocate space for to JSON representation of %s",
+                   type);
+    }
+
+    return ret;
+}
+
+#elif defined(USE_LIBYAJL_GEN)
 char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                             libxl__gen_json_callback gen, void *p)
 {
@@ -1229,6 +1522,7 @@ char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
 
     return ret;
 }
+#endif
 
 char *libxl__json_object_to_json(libxl__gc *gc,
                                  const libxl__json_object *args)
@@ -1262,6 +1556,17 @@ char *libxl__json_object_to_json(libxl__gc *gc,
     return ret;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__uint64_gen_jso(json_object **jso_r, uint64_t val)
+{
+    *jso_r = json_object_new_uint64(val);
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
+#ifdef HAVE_LIBYAJL
 yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val)
 {
     char *num;
@@ -1282,6 +1587,7 @@ yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val)
 out:
     return s;
 }
+#endif
 
 int libxl__object_from_json(libxl_ctx *ctx, const char *type,
                             libxl__json_parse_callback parse,
@@ -1313,6 +1619,16 @@ int libxl__object_from_json(libxl_ctx *ctx, const char *type,
     return rc;
 }
 
+#ifdef HAVE_LIBJSONC
+int libxl__int_gen_jso(json_object **jso_r, int i)
+{
+    *jso_r = json_object_new_int(i);
+    if (!*jso_r)
+        return ERROR_FAIL;
+    return 0;
+}
+#endif
+
 int libxl__int_parse_json(libxl__gc *gc, const libxl__json_object *o,
                           void *p)
 {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index b53e013a44..d64a573ff3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -7,9 +7,9 @@ namespace("libxl_")
 
 libxl_defbool = Builtin("defbool", json_parse_type="JSON_STRING", passby=PASS_BY_REFERENCE, copy_fn=None,
                         check_default_fn="libxl__defbool_is_default")
-libxl_domid = Builtin("domid", json_gen_fn = "yajl_gen_integer", json_parse_fn = "libxl__uint32_parse_json",
+libxl_domid = Builtin("domid", json_gen_fn = "yajl_gen_integer", jsonc_json_gen_fn = "libxl__uint64_gen_jso", json_parse_fn = "libxl__uint32_parse_json",
                       json_parse_type = "JSON_INTEGER", autogenerate_json = False, copy_fn=None)
-libxl_devid = Builtin("devid", json_gen_fn = "yajl_gen_integer", json_parse_fn = "libxl__int_parse_json",
+libxl_devid = Builtin("devid", json_gen_fn = "yajl_gen_integer", jsonc_json_gen_fn = "libxl__int_gen_jso", json_parse_fn = "libxl__int_parse_json",
                       json_parse_type = "JSON_INTEGER", autogenerate_json = False, signed = True, init_val="-1",
                       copy_fn=None)
 libxl_uuid = Builtin("uuid", json_parse_type="JSON_STRING", passby=PASS_BY_REFERENCE, check_default_fn="libxl_uuid_is_nil",
@@ -37,7 +37,8 @@ libxl_ms_vm_genid = Builtin("ms_vm_genid", passby=PASS_BY_REFERENCE, check_defau
 # Specific integer types
 #
 
-MemKB = UInt(64, init_val = "LIBXL_MEMKB_DEFAULT", json_gen_fn = "libxl__uint64_gen_json")
+MemKB = UInt(64, init_val = "LIBXL_MEMKB_DEFAULT",
+             json_gen_fn = "libxl__uint64_gen_json", jsonc_json_gen_fn = "libxl__uint64_gen_jso")
 
 #
 # Constants / Enumerations
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index 0425e9b6b0..ab4ee92870 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -1,7 +1,8 @@
 namespace("libxl__")
 hidden(True)
 
-libxl_domid = Builtin("domid", namespace="libxl_", json_gen_fn = "yajl_gen_integer",
+libxl_domid = Builtin("domid", namespace="libxl_",
+                      json_gen_fn = "yajl_gen_integer", jsonc_json_gen_fn = "libxl__uint64_gen_jso",
 		      json_parse_fn = "libxl__uint32_parse_json", json_parse_type = "JSON_INTEGER",
 		      autogenerate_json = False, copy_fn = None)
 
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 83a02f45fe..80a3b25aac 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -60,6 +60,48 @@ static int maybe_printf(const char *fmt, ...)
     return count;
 }
 
+
+#ifdef HAVE_LIBJSONC
+static int printf_info_one_json(json_object **jso_r, int domid,
+                                libxl_domain_config *d_config)
+{
+    json_object *jso = NULL;
+    json_object *jso_config = NULL;
+    enum json_tokener_error error;
+    char *s = NULL;
+    int r = EXIT_FAILURE;
+
+    s = libxl_domain_config_to_json(ctx, d_config);
+    jso_config = json_tokener_parse_verbose(s, &error);
+    if (!jso_config) {
+        fprintf(stderr, "fail to parse JSON from libxl_domain_config_to_json(): %s\n",
+                json_tokener_error_desc(error));
+        goto out;
+    }
+
+    jso = json_object_new_object();
+    if (domid != -1)
+        json_object_object_add(jso, "domid", json_object_new_int(domid));
+    else
+        json_object_object_add(jso, "domid", json_object_new_null());
+
+
+    json_object_object_add(jso, "config", jso_config);
+    jso_config = NULL;
+
+    *jso_r = jso;
+    jso = NULL;
+    r = EXIT_SUCCESS;
+
+out:
+    free(s);
+    json_object_put(jso);
+    json_object_put(jso_config);
+    return r;
+}
+
+#elif defined(HAVE_LIBYAJL)
+
 static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
                                             libxl_domain_config *d_config)
 {
@@ -95,6 +137,7 @@ static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
 out:
     return s;
 }
+#endif
 
 void printf_info(enum output_format output_format,
                  int domid,
@@ -103,6 +146,27 @@ void printf_info(enum output_format output_format,
     if (output_format == OUTPUT_FORMAT_SXP)
         return printf_info_sexp(domid, d_config, fh);
 
+#ifdef HAVE_LIBJSONC
+    int r;
+    const char *buf;
+    json_object *jso;
+
+    r = printf_info_one_json(&jso, domid, d_config);
+    if (r)
+        goto out;
+
+    buf = json_object_to_json_string_ext(jso, JSON_C_TO_STRING_PRETTY);
+    if (!buf)
+        goto out;
+
+    fputs(buf, fh);
+
+out:
+    json_object_put(jso);
+    flush_stream(fh);
+    return;
+
+#elif defined(HAVE_LIBYAJL)
     const char *buf;
     libxl_yajl_length len = 0;
     yajl_gen_status s;
@@ -132,6 +196,7 @@ void printf_info(enum output_format output_format,
                 "unable to format domain config as JSON (YAJL:%d)\n", s);
 
     flush_stream(fh);
+#endif
 }
 
 static void output_xeninfo(void)
@@ -476,11 +541,20 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 
     int i, rc;
 
+    const char *buf;
+#ifdef HAVE_LIBJSONC
+    json_object *jso = NULL;
+#elif defined(HAVE_LIBYAJL)
     yajl_gen hand = NULL;
     yajl_gen_status s;
-    const char *buf;
     libxl_yajl_length yajl_len = 0;
+#endif
 
+#ifdef HAVE_LIBJSONC
+    if (default_output_format == OUTPUT_FORMAT_JSON) {
+        jso = json_object_new_array();
+    }
+#elif defined(HAVE_LIBYAJL)
     if (default_output_format == OUTPUT_FORMAT_JSON) {
         hand = libxl_yajl_gen_alloc(NULL);
         if (!hand) {
@@ -493,6 +567,7 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
             goto out;
     } else
         s = yajl_gen_status_ok;
+#endif
 
     for (i = 0; i < nb_domain; i++) {
         libxl_domain_config_init(&d_config);
@@ -500,16 +575,32 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
                                                  &d_config, NULL);
         if (rc)
             continue;
-        if (default_output_format == OUTPUT_FORMAT_JSON)
+        if (default_output_format == OUTPUT_FORMAT_JSON) {
+#ifdef HAVE_LIBJSONC
+            json_object *jso_value;
+            rc = printf_info_one_json(&jso_value, info[i].domid, &d_config);
+            json_object_array_add(jso, jso_value);
+#elif defined(HAVE_LIBYAJL)
             s = printf_info_one_json(hand, info[i].domid, &d_config);
-        else
+#endif
+        } else
             printf_info_sexp(info[i].domid, &d_config, stdout);
         libxl_domain_config_dispose(&d_config);
+#ifdef HAVE_LIBJSONC
+        if (rc)
+            goto out;
+#elif defined(HAVE_LIBYAJL)
         if (s != yajl_gen_status_ok)
             goto out;
+#endif
     }
 
     if (default_output_format == OUTPUT_FORMAT_JSON) {
+#ifdef HAVE_LIBJSONC
+        buf = json_object_to_json_string_ext(jso, JSON_C_TO_STRING_PRETTY);
+        if (!buf)
+            goto out;
+#elif defined(HAVE_LIBYAJL)
         s = yajl_gen_array_close(hand);
         if (s != yajl_gen_status_ok)
             goto out;
@@ -517,16 +608,21 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
         s = yajl_gen_get_buf(hand, (const unsigned char **)&buf, &yajl_len);
         if (s != yajl_gen_status_ok)
             goto out;
+#endif
 
         puts(buf);
     }
 
 out:
     if (default_output_format == OUTPUT_FORMAT_JSON) {
+#ifdef HAVE_LIBJSONC
+        json_object_put(jso);
+#elif defined(HAVE_LIBYAJL)
         yajl_gen_free(hand);
         if (s != yajl_gen_status_ok)
             fprintf(stderr,
                     "unable to format domain config as JSON (YAJL:%d)\n", s);
+#endif
     }
 }
 
-- 
Anthony PERARD


