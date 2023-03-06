Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6C6ACF51
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 21:41:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507109.780329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdR-00013u-FT; Mon, 06 Mar 2023 20:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507109.780329; Mon, 06 Mar 2023 20:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZHdR-000118-Cc; Mon, 06 Mar 2023 20:40:41 +0000
Received: by outflank-mailman (input) for mailman id 507109;
 Mon, 06 Mar 2023 20:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4JU=66=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZHdQ-0000m6-7n
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 20:40:40 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2783c7fd-bc5f-11ed-96b5-2f268f93b82a;
 Mon, 06 Mar 2023 21:40:39 +0100 (CET)
Received: by mail-qt1-x82b.google.com with SMTP id c3so12081786qtc.8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Mar 2023 12:40:39 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:2825:cedc:1289:7391])
 by smtp.gmail.com with ESMTPSA id
 j10-20020ac8440a000000b003b82a07c4d6sm8086316qtn.84.2023.03.06.12.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:40:37 -0800 (PST)
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
X-Inumbo-ID: 2783c7fd-bc5f-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y28wWCfzzCCf0En/MTSEqU7UtSyyDPmGt1fjWU1k+QE=;
        b=pOS7MOKa3aKm/6gJKPiLUcYhTlP3C4ufRg/Wbl6qeTAFw+ISxiqBfqrE/LxRqBmWPN
         AyC3PRQAQugtmJbbKnzic9Ct6mHPIu5iwG4jJh3Q4Hhu11x+XsHmcUP0+lNflE7jWZKy
         Y+oQmYsVSl+7etoAzBMB4hg4lCPuGSnwEOTMo0Fz3yF6g3AkV/mYkZlr894Nd2UZ8Krl
         673NrSHdTYtS99eYlduJVrqMS/Bt7VU2Solk8D6Dj2In0TkVq48hje0nTfThb4GHQmSm
         7/VO3+UdUUu+oidohm9jcrmnWaRnSbbfXmpUWkryUeAk+AKbFyZjTFwBbLi18VN3gYaL
         Mong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y28wWCfzzCCf0En/MTSEqU7UtSyyDPmGt1fjWU1k+QE=;
        b=FYu83frzJM9Rt1+A5+/WFAWIWagundxBmZo+J18ue3wk1vwp2QPsass4Ia6U+o4zOn
         fTKR2JnOpkcFTQigiGc4re9iQTAoquFcdp1Kse3sliaGOveBA8Ckw+GdVrtcj1HpAYso
         rg+q7vqRD0TS79FPkABrgk9iMFfIpz0xs2c2i66/7kWmXpy0ensDVT2EMkjx6A+cPWYY
         bkRnWlxu2d57k7D3010ONJmiP8Vs9Aj+a6RZGBRZ8YFAqBnsg7JfpQtDYNbnO0IhQbBW
         qkMzECDakW64edbiTJOq17RMuI/6pGy9ZLB1p249LZmK//SkFUFwzzR9q2oDg8u3q7XQ
         3pBg==
X-Gm-Message-State: AO0yUKUcEc/0IAFLUh7BU9ebD3Vap7XhKVAGtp2Nqh2bQbpl2JKfR4UQ
	qyK4glbUCM6BSyD6U1cHEMCajh3ZY9g=
X-Google-Smtp-Source: AK7set+8EY1clqDGMHutI3NT4TBwSF9qFqitsupVTFFzFDB9+Gyfw1lnf9qnLSfekCSsWCq8ny8RXA==
X-Received: by 2002:ac8:4e8f:0:b0:3bf:cea5:9866 with SMTP id 15-20020ac84e8f000000b003bfcea59866mr21102985qtp.24.1678135237738;
        Mon, 06 Mar 2023 12:40:37 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 1/3] golang/xenlight: Extend KeyedUnion to support Arrays
Date: Mon,  6 Mar 2023 15:40:22 -0500
Message-Id: <20230306204024.124882-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306204024.124882-1-jandryuk@gmail.com>
References: <20230306204024.124882-1-jandryuk@gmail.com>
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
index 9fec60602d..e4eb7ca1c1 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -376,6 +376,10 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
         s += 'tmp := (*C.{0})(unsafe.Pointer(&xc.{1}[0]))\n'.format(typename,union_name)
 
         for nf in f.type.fields:
+            if isinstance(nf.type, idl.Array):
+                s += xenlight_golang_array_from_C(nf,cvarname='tmp')
+                continue
+
             s += xenlight_golang_convert_from_C(nf,cvarname='tmp')
 
         s += 'return nil\n'
@@ -416,7 +420,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
 
     return (s,extras)
 
-def xenlight_golang_array_from_C(ty = None):
+def xenlight_golang_array_from_C(ty = None, cvarname = 'xc'):
     """
     Convert C array to Go slice using the method
     described here:
@@ -433,9 +437,9 @@ def xenlight_golang_array_from_C(ty = None):
     clenvar    = ty.type.lenvar.name
 
     s += 'x.{0} = nil\n'.format(goname)
-    s += 'if n := int(xc.{0}); n > 0 {{\n'.format(clenvar)
+    s += 'if n := int({0}.{1}); n > 0 {{\n'.format(cvarname,clenvar)
     s += '{0} := '.format(cslice)
-    s +='(*[1<<28]C.{0})(unsafe.Pointer(xc.{1}))[:n:n]\n'.format(ctypename, cname)
+    s +='(*[1<<28]C.{0})(unsafe.Pointer({1}.{2}))[:n:n]\n'.format(ctypename, cvarname, cname)
     s += 'x.{0} = make([]{1}, n)\n'.format(goname, gotypename)
     s += 'for i, v := range {0} {{\n'.format(cslice)
 
@@ -579,6 +583,11 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
 
         s += 'var {0} C.{1}\n'.format(f.name,cgotype)
         for uf in f.type.fields:
+            if isinstance(uf.type, idl.Array):
+                s += xenlight_golang_array_to_C(uf, cvarname=f.name,
+                                                govarname="tmp")
+                continue
+
             s += xenlight_golang_convert_to_C(uf,cvarname=f.name,
                                               govarname='tmp')
 
@@ -596,7 +605,7 @@ def xenlight_golang_union_to_C(ty = None, union_name = '',
 
     return s
 
-def xenlight_golang_array_to_C(ty = None):
+def xenlight_golang_array_to_C(ty = None, cvarname="xc", govarname="x"):
     s = ''
 
     gotypename = xenlight_golang_fmt_name(ty.type.elem_type.typename)
@@ -608,27 +617,27 @@ def xenlight_golang_array_to_C(ty = None):
 
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
2.39.2


