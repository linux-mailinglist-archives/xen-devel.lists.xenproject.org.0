Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86722735A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 01:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxfcT-0006El-HC; Mon, 20 Jul 2020 23:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXdW=A7=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jxfcS-0006Eg-2K
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 23:54:52 +0000
X-Inumbo-ID: 65f0f2c0-cae4-11ea-84d4-bc764e2007e4
Received: from mail-io1-xd36.google.com (unknown [2607:f8b0:4864:20::d36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65f0f2c0-cae4-11ea-84d4-bc764e2007e4;
 Mon, 20 Jul 2020 23:54:50 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z6so1994597iow.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/CbiZ46/++SBcFpdRzL/hrVcnPlp8s/fVui4csswoP4=;
 b=KCMFMr2IyoE+HRFXUxk0XNCr32Vg01XC2mfUZBwpEswMJ/FNODe65pU7IMsUfEIBuQ
 AsA548XQ6pJcEzEHqrb/1UdOnKfKzbrlxuzG5H8mMUikd9tR3gJlSIz6LG3ujjJyHxyo
 7mvsLdy3u6CI+LdRsh84ktcF9sc8aCz5YaWBZOFe4kM4wo39JIYhm85Q9P4ZWEUZmE4D
 evxvovw3F16Xnp+qh7wA5n2/DIwoSuEW/wt23S1BmbXPVDimErhB2PRYX0UW9DkntK0y
 v6F38ksrZY0CD8KQ0/7y5Peju9jzsIc9ui8JCPqWEq3CMZsA4NVXFwiee69XxRXnZ6Id
 FCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/CbiZ46/++SBcFpdRzL/hrVcnPlp8s/fVui4csswoP4=;
 b=qm+T3+CuV6OqK0iHsQSPu2jR8Gkorrq73svmaU4hjPLeInv+W28Ekl7eDQYQS/eaI7
 rRnzkgNZ5U9woCGpI+Gsq4E8ov3AnG6RDaExGT+Gv8awYYXcnAXKMsriqfJxRHPrKjCH
 EO0bU96vRCej+BMDUgtZcAvUFlpacXrXg+s5ynHe8nIMOBTh5ewyc/iMIxtsjrlBx2Kj
 pkP9MNDU7HzIX+DJqaMyF0NbEXmRToTQZihyD2kugJsjqcvCh3uLCNMrrJU6lhyoRU8/
 hPd2aIgBQHPwj2isRe1vbgHszwsKzy72aeCjBNqNh/Dhk77ZEqippz87B2E0UBUu5ZtT
 V7zw==
X-Gm-Message-State: AOAM531d9unaAq7kBae+0iCselLmplVnYLzf2PTS4cZidqLvD2hxyAaT
 +tX7Pm2CnBO+9qI2d5UoxxQKyRkrFjQ=
X-Google-Smtp-Source: ABdhPJxx/0aqbTpb9YkrNYwJ4r6ZFV7jR7uR0NR/5Hzg9z6CNHx8vuocDNePjGMtrzZa5+jHkDX0wA==
X-Received: by 2002:a02:b714:: with SMTP id g20mr28564006jam.117.1595289288344; 
 Mon, 20 Jul 2020 16:54:48 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id i11sm10084948iow.19.2020.07.20.16.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 16:54:47 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] golang/xenlight: fix code generation for python 2.6
Date: Mon, 20 Jul 2020 19:54:40 -0400
Message-Id: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Before python 2.7, str.format() calls required that the format fields
were explicitly enumerated, e.g.:

  '{0} {1}'.format(foo, bar)

  vs.

  '{} {}'.format(foo, bar)

Currently, gengotypes.py uses the latter pattern everywhere, which means
the Go bindings do not build on python 2.6. Use the 2.6 syntax for
format() in order to support python 2.6 for now.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py | 204 ++++++++++++++--------------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 557fecd07b..ebec938224 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -3,7 +3,7 @@
 import os
 import sys
 
-sys.path.append('{}/tools/libxl'.format(os.environ['XEN_ROOT']))
+sys.path.append('{0}/tools/libxl'.format(os.environ['XEN_ROOT']))
 import idl
 
 # Go versions of some builtin types.
@@ -73,14 +73,14 @@ def xenlight_golang_define_enum(ty = None):
 
     if ty.typename is not None:
         typename = xenlight_golang_fmt_name(ty.typename)
-        s += 'type {} int\n'.format(typename)
+        s += 'type {0} int\n'.format(typename)
 
     # Start const block
     s += 'const(\n'
 
     for v in ty.values:
         name = xenlight_golang_fmt_name(v.name)
-        s += '{} {} = {}\n'.format(name, typename, v.value)
+        s += '{0} {1} = {2}\n'.format(name, typename, v.value)
 
     # End const block
     s += ')\n'
@@ -99,9 +99,9 @@ def xenlight_golang_define_struct(ty = None, typename = None, nested = False):
 
     # Begin struct definition
     if nested:
-        s += '{} struct {{\n'.format(name)
+        s += '{0} struct {{\n'.format(name)
     else:
-        s += 'type {} struct {{\n'.format(name)
+        s += 'type {0} struct {{\n'.format(name)
 
     # Write struct fields
     for f in ty.fields:
@@ -111,13 +111,13 @@ def xenlight_golang_define_struct(ty = None, typename = None, nested = False):
                 typename = xenlight_golang_fmt_name(typename)
                 name     = xenlight_golang_fmt_name(f.name)
 
-                s += '{} []{}\n'.format(name, typename)
+                s += '{0} []{1}\n'.format(name, typename)
             else:
                 typename = f.type.typename
                 typename = xenlight_golang_fmt_name(typename)
                 name     = xenlight_golang_fmt_name(f.name)
 
-                s += '{} {}\n'.format(name, typename)
+                s += '{0} {1}\n'.format(name, typename)
 
         elif isinstance(f.type, idl.Struct):
             r = xenlight_golang_define_struct(f.type, typename=f.name, nested=True)
@@ -132,7 +132,7 @@ def xenlight_golang_define_struct(ty = None, typename = None, nested = False):
             extras.extend(r[1])
 
         else:
-            raise Exception('type {} not supported'.format(f.type))
+            raise Exception('type {0} not supported'.format(f.type))
 
     # End struct definition
     s += '}\n'
@@ -151,11 +151,11 @@ def xenlight_golang_define_union(ty = None, struct_name = '', union_name = ''):
     s = ''
     extras = []
 
-    interface_name = '{}_{}_union'.format(struct_name, ty.keyvar.name)
+    interface_name = '{0}_{1}_union'.format(struct_name, ty.keyvar.name)
     interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
 
-    s += 'type {} interface {{\n'.format(interface_name)
-    s += 'is{}()\n'.format(interface_name)
+    s += 'type {0} interface {{\n'.format(interface_name)
+    s += 'is{0}()\n'.format(interface_name)
     s += '}\n'
 
     extras.append(s)
@@ -165,7 +165,7 @@ def xenlight_golang_define_union(ty = None, struct_name = '', union_name = ''):
             continue
 
         # Define struct
-        name = '{}_{}_union_{}'.format(struct_name, ty.keyvar.name, f.name)
+        name = '{0}_{1}_union_{2}'.format(struct_name, ty.keyvar.name, f.name)
         r = xenlight_golang_define_struct(f.type, typename=name)
         extras.append(r[0])
         extras.extend(r[1])
@@ -173,21 +173,21 @@ def xenlight_golang_define_union(ty = None, struct_name = '', union_name = ''):
         # This typeof trick ensures that the fields used in the cgo struct
         # used for marshaling are the same as the fields of the union in the
         # actual C type, and avoids re-defining all of those fields.
-        s = 'typedef typeof(((struct {} *)NULL)->{}.{}){};'
+        s = 'typedef typeof(((struct {0} *)NULL)->{1}.{2}){3};'
         s = s.format(struct_name, union_name, f.name, name)
         cgo_helpers_preamble.append(s)
 
         # Define function to implement 'union' interface
         name = xenlight_golang_fmt_name(name)
-        s = 'func (x {}) is{}(){{}}\n'.format(name, interface_name)
+        s = 'func (x {0}) is{1}(){{}}\n'.format(name, interface_name)
         extras.append(s)
 
     fname = xenlight_golang_fmt_name(ty.keyvar.name)
     ftype = xenlight_golang_fmt_name(ty.keyvar.type.typename)
-    s = '{} {}\n'.format(fname, ftype)
+    s = '{0} {1}\n'.format(fname, ftype)
 
-    fname = xenlight_golang_fmt_name('{}_union'.format(ty.keyvar.name))
-    s += '{} {}\n'.format(fname, interface_name)
+    fname = xenlight_golang_fmt_name('{0}_union'.format(ty.keyvar.name))
+    s += '{0} {1}\n'.format(fname, interface_name)
 
     return (s,extras)
 
@@ -243,7 +243,7 @@ def xenlight_golang_define_from_C(ty = None):
     Define the fromC marshaling function for the type
     represented by ty.
     """
-    func = 'func (x *{}) fromC(xc *C.{}) error {{\n {}\n return nil}}\n'
+    func = 'func (x *{0}) fromC(xc *C.{1}) error {{\n {2}\n return nil}}\n'
 
     goname = xenlight_golang_fmt_name(ty.typename)
     cname  = ty.typename
@@ -271,7 +271,7 @@ def xenlight_golang_define_from_C(ty = None):
             extras.extend(r[1])
 
         else:
-            raise Exception('type {} not supported'.format(f.type))
+            raise Exception('type {0} not supported'.format(f.type))
 
     return (func.format(goname, cname, body), extras)
 
@@ -300,8 +300,8 @@ def xenlight_golang_convert_from_C(ty = None, outer_name = None, cvarname = None
 
     # If outer_name is set, treat this as nested.
     if outer_name is not None:
-        goname = '{}.{}'.format(xenlight_golang_fmt_name(outer_name), goname)
-        cname  = '{}.{}'.format(outer_name, cname)
+        goname = '{0}.{1}'.format(xenlight_golang_fmt_name(outer_name), goname)
+        cname  = '{0}.{1}'.format(outer_name, cname)
 
     # Types that satisfy this condition can be easily casted or
     # converted to a Go builtin type.
@@ -312,15 +312,15 @@ def xenlight_golang_convert_from_C(ty = None, outer_name = None, cvarname = None
     if not is_castable:
         # If the type is not castable, we need to call its fromC
         # function.
-        s += 'if err := x.{}.fromC(&{}.{});'.format(goname,cvarname,cname)
-        s += 'err != nil {{\nreturn fmt.Errorf("converting field {}: %v", err)\n}}\n'.format(goname)
+        s += 'if err := x.{0}.fromC(&{1}.{2});'.format(goname,cvarname,cname)
+        s += 'err != nil {{\nreturn fmt.Errorf("converting field {0}: %v", err)\n}}\n'.format(goname)
 
     elif gotypename == 'string':
         # Use the cgo helper for converting C strings.
-        s += 'x.{} = C.GoString({}.{})\n'.format(goname,cvarname,cname)
+        s += 'x.{0} = C.GoString({1}.{2})\n'.format(goname,cvarname,cname)
 
     else:
-        s += 'x.{} = {}({}.{})\n'.format(goname,gotypename,cvarname,cname)
+        s += 'x.{0} = {1}({2}.{3})\n'.format(goname,gotypename,cvarname,cname)
 
     return s
 
@@ -331,9 +331,9 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
     gokeyname = xenlight_golang_fmt_name(keyname)
     keytype   = ty.keyvar.type.typename
     gokeytype = xenlight_golang_fmt_name(keytype)
-    field_name = xenlight_golang_fmt_name('{}_union'.format(keyname))
+    field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
 
-    interface_name = '{}_{}_union'.format(struct_name, keyname)
+    interface_name = '{0}_{1}_union'.format(struct_name, keyname)
     interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
 
     cgo_keyname = keyname
@@ -343,7 +343,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
     cases = {}
 
     for f in ty.fields:
-        val = '{}_{}'.format(keytype, f.name)
+        val = '{0}_{1}'.format(keytype, f.name)
         val = xenlight_golang_fmt_name(val)
 
         # Add to list of cases to make for the switch
@@ -354,17 +354,17 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
             continue
 
         # Define fromC func for 'union' struct.
-        typename   = '{}_{}_union_{}'.format(struct_name,keyname,f.name)
+        typename   = '{0}_{1}_union_{2}'.format(struct_name,keyname,f.name)
         gotypename = xenlight_golang_fmt_name(typename)
 
         # Define the function here. The cases for keyed unions are a little
         # different.
-        s = 'func (x *{}) fromC(xc *C.{}) error {{\n'.format(gotypename,struct_name)
-        s += 'if {}(xc.{}) != {} {{\n'.format(gokeytype,cgo_keyname,val)
-        err_string = '"expected union key {}"'.format(val)
-        s += 'return errors.New({})\n'.format(err_string)
+        s = 'func (x *{0}) fromC(xc *C.{1}) error {{\n'.format(gotypename,struct_name)
+        s += 'if {0}(xc.{1}) != {2} {{\n'.format(gokeytype,cgo_keyname,val)
+        err_string = '"expected union key {0}"'.format(val)
+        s += 'return errors.New({0})\n'.format(err_string)
         s += '}\n\n'
-        s += 'tmp := (*C.{})(unsafe.Pointer(&xc.{}[0]))\n'.format(typename,union_name)
+        s += 'tmp := (*C.{0})(unsafe.Pointer(&xc.{1}[0]))\n'.format(typename,union_name)
 
         for nf in f.type.fields:
             s += xenlight_golang_convert_from_C(nf,cvarname='tmp')
@@ -374,35 +374,35 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
 
         extras.append(s)
 
-    s = 'x.{} = {}(xc.{})\n'.format(gokeyname,gokeytype,cgo_keyname)
-    s += 'switch x.{}{{\n'.format(gokeyname)
+    s = 'x.{0} = {1}(xc.{2})\n'.format(gokeyname,gokeytype,cgo_keyname)
+    s += 'switch x.{0}{{\n'.format(gokeyname)
 
     # Create switch statement to determine which 'union element'
     # to populate in the Go struct.
     for case_name, case_tuple in sorted(cases.items()):
         (case_val, case_type) = case_tuple
 
-        s += 'case {}:\n'.format(case_val)
+        s += 'case {0}:\n'.format(case_val)
 
         if case_type is None:
-            s += "x.{} = nil\n".format(field_name)
+            s += "x.{0} = nil\n".format(field_name)
             continue
 
-        gotype = '{}_{}_union_{}'.format(struct_name,keyname,case_name)
+        gotype = '{0}_{1}_union_{2}'.format(struct_name,keyname,case_name)
         gotype = xenlight_golang_fmt_name(gotype)
-        goname = '{}_{}'.format(keyname,case_name)
+        goname = '{0}_{1}'.format(keyname,case_name)
         goname = xenlight_golang_fmt_name(goname,exported=False)
 
-        s += 'var {} {}\n'.format(goname, gotype)
-        s += 'if err := {}.fromC(xc);'.format(goname)
-        s += 'err != nil {{\n return fmt.Errorf("converting field {}: %v", err)\n}}\n'.format(goname)
+        s += 'var {0} {1}\n'.format(goname, gotype)
+        s += 'if err := {0}.fromC(xc);'.format(goname)
+        s += 'err != nil {{\n return fmt.Errorf("converting field {0}: %v", err)\n}}\n'.format(goname)
 
-        s += 'x.{} = {}\n'.format(field_name, goname)
+        s += 'x.{0} = {1}\n'.format(field_name, goname)
 
     # End switch statement
     s += 'default:\n'
-    err_string = '"invalid union key \'%v\'", x.{}'.format(gokeyname)
-    s += 'return fmt.Errorf({})'.format(err_string)
+    err_string = '"invalid union key \'%v\'", x.{0}'.format(gokeyname)
+    s += 'return fmt.Errorf({0})'.format(err_string)
     s += '}\n'
 
     return (s,extras)
@@ -420,22 +420,22 @@ def xenlight_golang_array_from_C(ty = None):
     goname     = xenlight_golang_fmt_name(ty.name)
     ctypename  = ty.type.elem_type.typename
     cname      = ty.name
-    cslice     = 'c{}'.format(goname)
+    cslice     = 'c{0}'.format(goname)
     clenvar    = ty.type.lenvar.name
 
-    s += 'x.{} = nil\n'.format(goname)
-    s += 'if n := int(xc.{}); n > 0 {{\n'.format(clenvar)
-    s += '{} := '.format(cslice)
-    s +='(*[1<<28]C.{})(unsafe.Pointer(xc.{}))[:n:n]\n'.format(ctypename, cname)
-    s += 'x.{} = make([]{}, n)\n'.format(goname, gotypename)
-    s += 'for i, v := range {} {{\n'.format(cslice)
+    s += 'x.{0} = nil\n'.format(goname)
+    s += 'if n := int(xc.{0}); n > 0 {{\n'.format(clenvar)
+    s += '{0} := '.format(cslice)
+    s +='(*[1<<28]C.{0})(unsafe.Pointer(xc.{1}))[:n:n]\n'.format(ctypename, cname)
+    s += 'x.{0} = make([]{1}, n)\n'.format(goname, gotypename)
+    s += 'for i, v := range {0} {{\n'.format(cslice)
 
     is_enum = isinstance(ty.type.elem_type,idl.Enumeration)
     if gotypename in go_builtin_types or is_enum:
-        s += 'x.{}[i] = {}(v)\n'.format(goname, gotypename)
+        s += 'x.{0}[i] = {1}(v)\n'.format(goname, gotypename)
     else:
-        s += 'if err := x.{}[i].fromC(&v); err != nil {{\n'.format(goname)
-        s += 'return fmt.Errorf("converting field {}: %v", err) }}\n'.format(goname)
+        s += 'if err := x.{0}[i].fromC(&v); err != nil {{\n'.format(goname)
+        s += 'return fmt.Errorf("converting field {0}: %v", err) }}\n'.format(goname)
 
     s += '}\n}\n'
 
@@ -446,11 +446,11 @@ def xenlight_golang_define_to_C(ty = None, typename = None, nested = False):
     Define the toC marshaling function for the type
     represented by ty.
     """
-    func = 'func (x *{}) toC(xc *C.{}) (err error){{{}\n return nil\n }}\n'
+    func = 'func (x *{0}) toC(xc *C.{1}) (err error){{{2}\n return nil\n }}\n'
     body = ''
 
     if ty.dispose_fn is not None:
-        body += 'defer func(){{\nif err != nil{{\nC.{}(xc)}}\n}}()\n\n'.format(ty.dispose_fn)
+        body += 'defer func(){{\nif err != nil{{\nC.{0}(xc)}}\n}}()\n\n'.format(ty.dispose_fn)
 
     goname = xenlight_golang_fmt_name(ty.typename)
     cname  = ty.typename
@@ -471,7 +471,7 @@ def xenlight_golang_define_to_C(ty = None, typename = None, nested = False):
             body += xenlight_golang_union_to_C(f.type, f.name, ty.typename)
 
         else:
-            raise Exception('type {} not supported'.format(f.type))
+            raise Exception('type {0} not supported'.format(f.type))
 
     return func.format(goname, cname, body)
 
@@ -506,26 +506,26 @@ def xenlight_golang_convert_to_C(ty = None, outer_name = None,
 
     # If outer_name is set, treat this as nested.
     if outer_name is not None:
-        goname = '{}.{}'.format(xenlight_golang_fmt_name(outer_name), goname)
-        cname  = '{}.{}'.format(outer_name, cname)
+        goname = '{0}.{1}'.format(xenlight_golang_fmt_name(outer_name), goname)
+        cname  = '{0}.{1}'.format(outer_name, cname)
 
     is_castable = (ty.type.json_parse_type == 'JSON_INTEGER' or
                    isinstance(ty.type, idl.Enumeration) or
                    gotypename in go_builtin_types)
 
     if not is_castable:
-        s += 'if err := {}.{}.toC(&{}.{}); err != nil {{\n'.format(govarname,goname,
+        s += 'if err := {0}.{1}.toC(&{2}.{3}); err != nil {{\n'.format(govarname,goname,
                                                                    cvarname,cname)
-        s += 'return fmt.Errorf("converting field {}: %v", err)\n}}\n'.format(goname)
+        s += 'return fmt.Errorf("converting field {0}: %v", err)\n}}\n'.format(goname)
 
     elif gotypename == 'string':
         # Use the cgo helper for converting C strings.
-        s += 'if {}.{} != "" {{\n'.format(govarname,goname)
-        s += '{}.{} = C.CString({}.{})}}\n'.format(cvarname,cname,
+        s += 'if {0}.{1} != "" {{\n'.format(govarname,goname)
+        s += '{0}.{1} = C.CString({2}.{3})}}\n'.format(cvarname,cname,
                                                    govarname,goname)
 
     else:
-        s += '{}.{} = C.{}({}.{})\n'.format(cvarname,cname,ctypename,
+        s += '{0}.{1} = C.{2}({3}.{4})\n'.format(cvarname,cname,ctypename,
                                             govarname,goname)
 
     return s
@@ -537,7 +537,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
     keytype   = ty.keyvar.type.typename
     gokeytype = xenlight_golang_fmt_name(keytype)
 
-    interface_name = '{}_{}_union'.format(struct_name, keyname)
+    interface_name = '{0}_{1}_union'.format(struct_name, keyname)
     interface_name = xenlight_golang_fmt_name(interface_name, exported=False)
 
     cgo_keyname = keyname
@@ -545,44 +545,44 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
         cgo_keyname = '_' + cgo_keyname
 
 
-    s = 'xc.{} = C.{}(x.{})\n'.format(cgo_keyname,keytype,gokeyname)
-    s += 'switch x.{}{{\n'.format(gokeyname)
+    s = 'xc.{0} = C.{1}(x.{2})\n'.format(cgo_keyname,keytype,gokeyname)
+    s += 'switch x.{0}{{\n'.format(gokeyname)
 
     # Create switch statement to determine how to populate the C union.
     for f in ty.fields:
-        key_val = '{}_{}'.format(keytype, f.name)
+        key_val = '{0}_{1}'.format(keytype, f.name)
         key_val = xenlight_golang_fmt_name(key_val)
 
-        s += 'case {}:\n'.format(key_val)
+        s += 'case {0}:\n'.format(key_val)
 
         if f.type is None:
             s += "break\n"
             continue
 
-        cgotype = '{}_{}_union_{}'.format(struct_name,keyname,f.name)
+        cgotype = '{0}_{1}_union_{2}'.format(struct_name,keyname,f.name)
         gotype  = xenlight_golang_fmt_name(cgotype)
 
-        field_name = xenlight_golang_fmt_name('{}_union'.format(keyname))
-        s += 'tmp, ok := x.{}.({})\n'.format(field_name,gotype)
+        field_name = xenlight_golang_fmt_name('{0}_union'.format(keyname))
+        s += 'tmp, ok := x.{0}.({1})\n'.format(field_name,gotype)
         s += 'if !ok {\n'
-        s += 'return errors.New("wrong type for union key {}")\n'.format(keyname)
+        s += 'return errors.New("wrong type for union key {0}")\n'.format(keyname)
         s += '}\n'
 
-        s += 'var {} C.{}\n'.format(f.name,cgotype)
+        s += 'var {0} C.{1}\n'.format(f.name,cgotype)
         for uf in f.type.fields:
             s += xenlight_golang_convert_to_C(uf,cvarname=f.name,
                                               govarname='tmp')
 
         # The union is still represented as Go []byte.
-        s += '{}Bytes := C.GoBytes(unsafe.Pointer(&{}),C.sizeof_{})\n'.format(f.name,
+        s += '{0}Bytes := C.GoBytes(unsafe.Pointer(&{1}),C.sizeof_{2})\n'.format(f.name,
                                                                               f.name,
                                                                               cgotype)
-        s += 'copy(xc.{}[:],{}Bytes)\n'.format(union_name,f.name)
+        s += 'copy(xc.{0}[:],{1}Bytes)\n'.format(union_name,f.name)
 
     # End switch statement
     s += 'default:\n'
-    err_string = '"invalid union key \'%v\'", x.{}'.format(gokeyname)
-    s += 'return fmt.Errorf({})'.format(err_string)
+    err_string = '"invalid union key \'%v\'", x.{0}'.format(gokeyname)
+    s += 'return fmt.Errorf({0})'.format(err_string)
     s += '}\n'
 
     return s
@@ -599,29 +599,29 @@ def xenlight_golang_array_to_C(ty = None):
 
     is_enum = isinstance(ty.type.elem_type,idl.Enumeration)
     if gotypename in go_builtin_types or is_enum:
-        s += 'if {} := len(x.{}); {} > 0 {{\n'.format(golenvar,goname,golenvar)
-        s += 'xc.{} = (*C.{})(C.malloc(C.size_t({}*{})))\n'.format(cname,ctypename,
+        s += 'if {0} := len(x.{1}); {2} > 0 {{\n'.format(golenvar,goname,golenvar)
+        s += 'xc.{0} = (*C.{1})(C.malloc(C.size_t({2}*{3})))\n'.format(cname,ctypename,
                                                                    golenvar,golenvar)
-        s += 'xc.{} = C.int({})\n'.format(clenvar,golenvar)
-        s += 'c{} := (*[1<<28]C.{})(unsafe.Pointer(xc.{}))[:{}:{}]\n'.format(goname,
+        s += 'xc.{0} = C.int({1})\n'.format(clenvar,golenvar)
+        s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer(xc.{2}))[:{3}:{4}]\n'.format(goname,
                                                                       ctypename,cname,
                                                                       golenvar,golenvar)
-        s += 'for i,v := range x.{} {{\n'.format(goname)
-        s += 'c{}[i] = C.{}(v)\n'.format(goname,ctypename)
+        s += 'for i,v := range x.{0} {{\n'.format(goname)
+        s += 'c{0}[i] = C.{1}(v)\n'.format(goname,ctypename)
         s += '}\n}\n'
 
         return s
 
-    s += 'if {} := len(x.{}); {} > 0 {{\n'.format(golenvar,goname,golenvar)
-    s += 'xc.{} = (*C.{})(C.malloc(C.ulong({})*C.sizeof_{}))\n'.format(cname,ctypename,
+    s += 'if {0} := len(x.{1}); {2} > 0 {{\n'.format(golenvar,goname,golenvar)
+    s += 'xc.{0} = (*C.{1})(C.malloc(C.ulong({2})*C.sizeof_{3}))\n'.format(cname,ctypename,
                                                                    golenvar,ctypename)
-    s += 'xc.{} = C.int({})\n'.format(clenvar,golenvar)
-    s += 'c{} := (*[1<<28]C.{})(unsafe.Pointer(xc.{}))[:{}:{}]\n'.format(goname,
+    s += 'xc.{0} = C.int({1})\n'.format(clenvar,golenvar)
+    s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer(xc.{2}))[:{3}:{4}]\n'.format(goname,
                                                                          ctypename,cname,
                                                                          golenvar,golenvar)
-    s += 'for i,v := range x.{} {{\n'.format(goname)
-    s += 'if err := v.toC(&c{}[i]); err != nil {{\n'.format(goname)
-    s += 'return fmt.Errorf("converting field {}: %v", err)\n'.format(goname)
+    s += 'for i,v := range x.{0} {{\n'.format(goname)
+    s += 'if err := v.toC(&c{0}[i]); err != nil {{\n'.format(goname)
+    s += 'return fmt.Errorf("converting field {0}: %v", err)\n'.format(goname)
     s += '}\n}\n}\n'
 
     return s
@@ -633,7 +633,7 @@ def xenlight_golang_define_constructor(ty = None):
     gotypename = xenlight_golang_fmt_name(ctypename)
 
     # Since this func is exported, add a comment as per Go conventions.
-    s += '// New{} returns an instance of {}'.format(gotypename,gotypename)
+    s += '// New{0} returns an instance of {1}'.format(gotypename,gotypename)
     s += ' initialized with defaults.\n'
 
     # If a struct has a keyed union, an extra argument is
@@ -643,7 +643,7 @@ def xenlight_golang_define_constructor(ty = None):
     init_fns = []
 
     # Add call to parent init_fn first.
-    init_fns.append('C.{}(&xc)'.format(ty.init_fn))
+    init_fns.append('C.{0}(&xc)'.format(ty.init_fn))
 
     for f in ty.fields:
         if not isinstance(f.type, idl.KeyedUnion):
@@ -658,24 +658,24 @@ def xenlight_golang_define_constructor(ty = None):
         # Serveral keyed unions use 'type' as the key variable name. In
         # that case, prepend the first letter of the Go type name.
         if param_goname == 'type':
-            param_goname = '{}type'.format(param_gotype.lower()[0])
+            param_goname = '{0}type'.format(param_gotype.lower()[0])
 
         # Add call to keyed union's init_fn.
-        init_fns.append('C.{}_{}(&xc, C.{}({}))'.format(ty.init_fn,
+        init_fns.append('C.{0}_{1}(&xc, C.{2}({3}))'.format(ty.init_fn,
                                                         param.name,
                                                         param_ctype,
                                                         param_goname))
 
         # Add to params list.
-        params.append('{} {}'.format(param_goname, param_gotype))
+        params.append('{0} {1}'.format(param_goname, param_gotype))
 
     # Define function
-    s += 'func New{}({}) (*{}, error) {{\n'.format(gotypename,
+    s += 'func New{0}({1}) (*{2}, error) {{\n'.format(gotypename,
                                                    ','.join(params),
                                                    gotypename)
 
     # Declare variables.
-    s += 'var (\nx {}\nxc C.{})\n\n'.format(gotypename, ctypename)
+    s += 'var (\nx {0}\nxc C.{1})\n\n'.format(gotypename, ctypename)
 
     # Write init_fn calls.
     s += '\n'.join(init_fns)
@@ -684,7 +684,7 @@ def xenlight_golang_define_constructor(ty = None):
     # Make sure dispose_fn get's called when constructor
     # returns.
     if ty.dispose_fn is not None:
-        s += 'defer C.{}(&xc)\n'.format(ty.dispose_fn)
+        s += 'defer C.{0}(&xc)\n'.format(ty.dispose_fn)
 
     s += '\n'
 
@@ -727,7 +727,7 @@ if __name__ == '__main__':
     header_comment="""// DO NOT EDIT.
 //
 // This file is generated by:
-// {}
+// {0}
 //
 
 """.format(' '.join(sys.argv))
-- 
2.17.1


