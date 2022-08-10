Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593458F351
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383999.619256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhN-0007eZ-M5; Wed, 10 Aug 2022 19:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383999.619256; Wed, 10 Aug 2022 19:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrhN-0007bS-Im; Wed, 10 Aug 2022 19:49:01 +0000
Received: by outflank-mailman (input) for mailman id 383999;
 Wed, 10 Aug 2022 19:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrhM-0007Jy-2X
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:49:00 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a66120-18e5-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:48:59 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id a4so7304060qto.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:48:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 bk9-20020a05620a1a0900b006b978b521c8sm520897qkb.69.2022.08.10.12.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:48:57 -0700 (PDT)
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
X-Inumbo-ID: 79a66120-18e5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ldLHVgeKdjvBnWvXsTFiQtGXsbhhD4y0AKZBl5McVtM=;
        b=k951l1SZHtrgJuOqI64Na1mjlF8Fmzd+9KnmXbJfRPp58VZq0pO9QPvvFOwIMM1pk7
         esdOzk4PnIBJIMTRznT8HQTFMJbXuUl7OaYEp2yoj8IfkeHUnp/cwMqtVOf9GT3NrQOP
         QM04q8oZIiZcuwAGn7fLQQNdDdyhz06u7vTa4M6BUmxMwpqDFHrcBg5h3GbV2K5knMsV
         64lwz78KAI5gkRMwgvp5jy9ZKTALRCEp3OfsirfIakBM7ptYyROQvN4cfYStKPvEe2np
         2Ya5g2Y2kxGC+1Bq0zGpbIfZoPdrkUkU8OG32Z5M7VNVZaPVnR4W7CqN/3+LXwympo9d
         2gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ldLHVgeKdjvBnWvXsTFiQtGXsbhhD4y0AKZBl5McVtM=;
        b=lLsld1wPGxYPi3yPLyi1Of/3eP3kppY8/ryJlZ+eEUBpz0wroRJLWSkjpeIJGXgkD5
         B7Dfs6mT27Pt8VGrW90UyWrrT6HIP5WOmN+SzgjuiMed6E2ZS8NP9avIapLPEuN5IOSS
         hTLLbonm/6gNUAoiA1cdeq81lobIdoGxOeiGirq2AZbwpO0C/9AeHoNtIxw+tEHJYTjo
         XfEfaHKjI8vwIJBBYUB3jT4PVVoOUX1tMIuoYw/8/WyjqieYIKU4cB9Haiy7Qazp/ltj
         g9H7RHQZVDB0VBfwRm2pqer3/7wAHWvW87pZcv9Zxini5voNY1E4yfqYpj6t78t+Ljsp
         Sc0Q==
X-Gm-Message-State: ACgBeo0UjhjfkfoBQFt7I+62PMefVN6X/J7qai70runWvkk01uOXtXCl
	TPyis3XxmpfrrKz8VbdTZAJb71n+sug=
X-Google-Smtp-Source: AA6agR7bhQLOhE1bnwYwa41CKBRWd+MaKBBO+s+mrJjf+w46Zdgw7B5GK8RoL9vJAQMhREx31+LEVw==
X-Received: by 2002:ac8:5b85:0:b0:342:f85b:47ef with SMTP id a5-20020ac85b85000000b00342f85b47efmr14104015qta.665.1660160937846;
        Wed, 10 Aug 2022 12:48:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/3] golang/xenlight: Extend KeyedUnion to support Arrays
Date: Wed, 10 Aug 2022 15:48:25 -0400
Message-Id: <20220810194827.103428-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810194827.103428-1-jandryuk@gmail.com>
References: <20220810194827.103428-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generation for KeyedUnion types doesn't support Arrays.  The smbios
support will place an smbios array inside the hvm KeyedUnion, and
gentotypes doesn't generate buildable Go code.

Have KeyedUnion add an idl.Array check and issue the approriate
xenlight_golang_array_to_C and xenlight_golang_array_from_C calls when
needed.  This matches how it is done in xenlight_golang_define_to_C &
xenlight_golang_define_from_C

xenlight_golang_array_to_C and xenlight_golang_array_from_C need to be
extended to set the cvarname and govarname as approriate for the
KeyedUnion cases to match the surrounding code.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/golang/xenlight/gengotypes.py | 41 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index ac1cf060dd..745a3cb466 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -374,6 +374,10 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
         s += 'tmp := (*C.{0})(unsafe.Pointer(&xc.{1}[0]))\n'.format(typename,union_name)
 
         for nf in f.type.fields:
+            if isinstance(nf.type, idl.Array):
+                s += xenlight_golang_array_from_C(nf,cvarname='tmp')
+                continue
+
             s += xenlight_golang_convert_from_C(nf,cvarname='tmp')
 
         s += 'return nil\n'
@@ -414,7 +418,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
 
     return (s,extras)
 
-def xenlight_golang_array_from_C(ty = None):
+def xenlight_golang_array_from_C(ty = None, cvarname = 'xc'):
     """
     Convert C array to Go slice using the method
     described here:
@@ -431,9 +435,9 @@ def xenlight_golang_array_from_C(ty = None):
     clenvar    = ty.type.lenvar.name
 
     s += 'x.{0} = nil\n'.format(goname)
-    s += 'if n := int(xc.{0}); n > 0 {{\n'.format(clenvar)
+    s += 'if n := int({0}.{1}); n > 0 {{\n'.format(cvarname,clenvar)
     s += '{0} := '.format(cslice)
-    s +='(*[1<<28]C.{0})(unsafe.Pointer(xc.{1}))[:n:n]\n'.format(ctypename, cname)
+    s +='(*[1<<28]C.{0})(unsafe.Pointer({1}.{2}))[:n:n]\n'.format(ctypename, cvarname, cname)
     s += 'x.{0} = make([]{1}, n)\n'.format(goname, gotypename)
     s += 'for i, v := range {0} {{\n'.format(cslice)
 
@@ -577,6 +581,11 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
 
         s += 'var {0} C.{1}\n'.format(f.name,cgotype)
         for uf in f.type.fields:
+            if isinstance(uf.type, idl.Array):
+                s += xenlight_golang_array_to_C(uf, cvarname=f.name,
+                                                govarname="tmp")
+                continue
+
             s += xenlight_golang_convert_to_C(uf,cvarname=f.name,
                                               govarname='tmp')
 
@@ -594,7 +603,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
 
     return s
 
-def xenlight_golang_array_to_C(ty = None):
+def xenlight_golang_array_to_C(ty = None, cvarname="xc", govarname="x"):
     s = ''
 
     gotypename = xenlight_golang_fmt_name(ty.type.elem_type.typename)
@@ -606,27 +615,27 @@ def xenlight_golang_array_to_C(ty = None):
 
     is_enum = isinstance(ty.type.elem_type,idl.Enumeration)
     if gotypename in go_builtin_types or is_enum:
-        s += 'if {0} := len(x.{1}); {2} > 0 {{\n'.format(golenvar,goname,golenvar)
-        s += 'xc.{0} = (*C.{1})(C.malloc(C.size_t({2}*{3})))\n'.format(cname,ctypename,
+        s += 'if {0} := len({1}.{2}); {3} > 0 {{\n'.format(golenvar,govarname,goname,golenvar)
+        s += '{0}.{1} = (*C.{2})(C.malloc(C.size_t({3}*{4})))\n'.format(cvarname,cname,ctypename,
                                                                    golenvar,golenvar)
-        s += 'xc.{0} = C.int({1})\n'.format(clenvar,golenvar)
-        s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer(xc.{2}))[:{3}:{4}]\n'.format(goname,
-                                                                      ctypename,cname,
+        s += '{0}.{1} = C.int({2})\n'.format(cvarname,clenvar,golenvar)
+        s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer({2}.{3}))[:{4}:{5}]\n'.format(goname,
+                                                                      ctypename,cvarname,cname,
                                                                       golenvar,golenvar)
-        s += 'for i,v := range x.{0} {{\n'.format(goname)
+        s += 'for i,v := range {0}.{1} {{\n'.format(govarname,goname)
         s += 'c{0}[i] = C.{1}(v)\n'.format(goname,ctypename)
         s += '}\n}\n'
 
         return s
 
-    s += 'if {0} := len(x.{1}); {2} > 0 {{\n'.format(golenvar,goname,golenvar)
-    s += 'xc.{0} = (*C.{1})(C.malloc(C.ulong({2})*C.sizeof_{3}))\n'.format(cname,ctypename,
+    s += 'if {0} := len({1}.{2}); {3} > 0 {{\n'.format(golenvar,govarname,goname,golenvar)
+    s += '{0}.{1} = (*C.{2})(C.malloc(C.ulong({3})*C.sizeof_{4}))\n'.format(cvarname,cname,ctypename,
                                                                    golenvar,ctypename)
-    s += 'xc.{0} = C.int({1})\n'.format(clenvar,golenvar)
-    s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer(xc.{2}))[:{3}:{4}]\n'.format(goname,
-                                                                         ctypename,cname,
+    s += '{0}.{1} = C.int({2})\n'.format(cvarname,clenvar,golenvar)
+    s += 'c{0} := (*[1<<28]C.{1})(unsafe.Pointer({2}.{3}))[:{4}:{5}]\n'.format(goname,
+                                                                         ctypename,cvarname,cname,
                                                                          golenvar,golenvar)
-    s += 'for i,v := range x.{0} {{\n'.format(goname)
+    s += 'for i,v := range {0}.{1} {{\n'.format(govarname,goname)
     s += 'if err := v.toC(&c{0}[i]); err != nil {{\n'.format(goname)
     s += 'return fmt.Errorf("converting field {0}: %v", err)\n'.format(goname)
     s += '}\n}\n}\n'
-- 
2.37.1


