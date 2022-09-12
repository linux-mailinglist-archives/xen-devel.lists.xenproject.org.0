Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C55B5A13
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 14:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405780.648209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiTz-0000HT-Bh; Mon, 12 Sep 2022 12:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405780.648209; Mon, 12 Sep 2022 12:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXiTz-0000Fe-6p; Mon, 12 Sep 2022 12:24:11 +0000
Received: by outflank-mailman (input) for mailman id 405780;
 Mon, 12 Sep 2022 12:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2z8A=ZP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oXiTy-0000FB-8I
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 12:24:10 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccc867e5-3295-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 14:24:09 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id g4so6537987qvo.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 05:24:09 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:cc03:373b:6dc6:a951])
 by smtp.gmail.com with ESMTPSA id
 f1-20020ac87f01000000b0031d283f4c4dsm6705092qtk.60.2022.09.12.05.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 05:23:50 -0700 (PDT)
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
X-Inumbo-ID: ccc867e5-3295-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0c9AKXalp2sKJ7cfJ+vPBAUxcJIApFm3DGF7p3Liepw=;
        b=GcK1y9aaahXwbcuP53/qjwmjYWaYZl1iUQ6+L/YdsClBoW9m5IUSEZmXw4DR2H/Bna
         vBGroDqr9WjDf8YQImWmLk2X6VLWSGdcasQdIP9+s1DFP9cNzmBe7BFJ6j7BjUk2ttK8
         lWu0xNfN6U0QgDlhfj9ICPZo1vRcKlw4f3pfR+fdPsT4ZhdtY6WUzyE0f3vHoJiv61mg
         ck+54zy72ZfZl+1VMmgmD9DQZVeuKPeSwFzlzYwvdGDH7mnviJwYzIRiV8yY2a8jFAXO
         yElKYlW6WBaiMrk8/qU1aUGeVNlvEz9DdH6W584kJS44/oxrCmQ95rRi5R3TqLOV1cMp
         B9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0c9AKXalp2sKJ7cfJ+vPBAUxcJIApFm3DGF7p3Liepw=;
        b=QlxK4oZJgck3eO7edP/9x7pPq2dS6ylWIqrpI83Wed0RWz9wrvhI5rckWoAr1Reb6f
         ynLpFL3yDhBMp1uY4U/Jz+SN07Wo0AbGDMsaVwseFyOJk/0jA745d3KOHneOFklCARiX
         AS+nSzdo78NrL/Yo66+vNfh3BEtTZcQZFiR8Wrmu5peNfHpaNrr32MXlzfhgM6TOEpNT
         wHqaEsSFan1xiVDH0T5gMsD6VHa7DRvNsuTNuzk7EhfW3ZlsHguFZe66b20/3swgzOsA
         /qRaHyMsxflW6ibMhl3I/GcJ3yxF+LGjDhKLBsc0Ldgz9vYN5wq5joH3iGk5v3JKGxfN
         Ulzw==
X-Gm-Message-State: ACgBeo2juSD1yQUIMQz3pXgT1mXUWIkri6vy999ve4rmymXgMl/f6V0Z
	vyslNh/HXdhq/nHpT5KOUW97x/34UwE=
X-Google-Smtp-Source: AA6agR7qJTkI30XH0Nz/qgbFeljPySSkbTEpwkSueBJOF4cInHXoTWR+2cj+Om6JcNR0sNbkdBmKEA==
X-Received: by 2002:a05:6214:260e:b0:4ac:8470:99a7 with SMTP id gu14-20020a056214260e00b004ac847099a7mr14683177qvb.102.1662985447730;
        Mon, 12 Sep 2022 05:24:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 1/3] golang/xenlight: Extend KeyedUnion to support Arrays
Date: Mon, 12 Sep 2022 08:22:35 -0400
Message-Id: <20220912122237.5431-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912122237.5431-1-jandryuk@gmail.com>
References: <20220912122237.5431-1-jandryuk@gmail.com>
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
2.37.3


