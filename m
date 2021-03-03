Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3402932ACC7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92643.174640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGax-00088h-Vr; Wed, 03 Mar 2021 01:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92643.174640; Wed, 03 Mar 2021 01:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGax-000889-RB; Wed, 03 Mar 2021 01:46:35 +0000
Received: by outflank-mailman (input) for mailman id 92643;
 Wed, 03 Mar 2021 01:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGaw-000841-QA
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:34 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3077b7d-79b8-4b66-9feb-f6b58ccb2671;
 Wed, 03 Mar 2021 01:46:26 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id b130so10897584qkc.10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:26 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:25 -0800 (PST)
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
X-Inumbo-ID: a3077b7d-79b8-4b66-9feb-f6b58ccb2671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ITJlz1yVls1L4SWL3IJLaiNjFmwpPVqobYLq7BDZhNc=;
        b=RHLP7pwFdxbSwR7IR5byQQYXAWJ9le3sztKm+HRoyIm5Aa7VluQLhq1vaFjN0Z4Ebb
         PoQ+kx53UI5Mqs9qwqGPxzIjW6flbOuQCef7RWrdmz8+YjiyPdfK8ml3+LEyJ2deX1NO
         fx/bzEHQyhiUin0q+ltzqaQT9BVjdJtA8gLdTHVn0L6+Nqk4+W4/tAGw2LNge1RcXeN7
         FQ44JKngxTm2a2ltU5IN9ukz5BV2ArtsbVE08Oe3itdCfAx0MATLg/QuVG+5nrCBu5oy
         qRU1x4OKbO+fypkqEJXeuvpXKzR3gQAjxCf5AE0fJ6QdHUMg3XyjW+zqUn7jCse+tQQP
         uR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ITJlz1yVls1L4SWL3IJLaiNjFmwpPVqobYLq7BDZhNc=;
        b=L3pK/pshSCqUjBFEtyBKAv8gEnCRn/zb0FaivDIgpNWhNs5Y7Ymu3rRLA9HmImv9U+
         86D0aVFY/CDvSkTi2akVyjJLPGCyiYCxKHZp/tTogiyQa6dkxqoQ1cA9T8BvvIXrbERs
         mcGvt6iuS/6uDg8VAzfTDRF88SBQcGCWkGc/npu2XN0URAqm1nsonXfUD9EsWSQ69LWy
         GPLiJ8hJqI3JWoPZ0JUMZetKmM593SdISSP2ZAMeC/jXahLzFR47m7Xts+Z1j7BPXEuh
         1LloAlcZurlH0LESI4oPg87UZVCAnWx7rHiU8PrJiiqd+ECiOch435gs6H+UVl0I8VPC
         nzkg==
X-Gm-Message-State: AOAM531og9/5xy5c68xK6b1f5tWMv6Yg/0lzDXMUVr1XovL3jLFM1VAT
	uuLdnlx2iMJ8AHHje6g6o/kaDVPFd0ybcw==
X-Google-Smtp-Source: ABdhPJwf9vEmttoT9z+hs1iBJXF1N9mUVjBQHHeUJc29/71XkIQSrjGuiRR+Rdf5YH4ajF53eizOMw==
X-Received: by 2002:a37:9385:: with SMTP id v127mr12608930qkd.131.1614735985760;
        Tue, 02 Mar 2021 17:46:25 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 2/7] libxl: add Function class to IDL
Date: Tue,  2 Mar 2021 20:46:14 -0500
Message-Id: <2193e7fbc7c359b2e32551370ef57ba371658281.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Add a Function and CtxFunction classes to idl.py to allow generator
scripts to generate wrappers which are repetitive and straight forward
when doing so by hand. Examples of such functions are the
device_add/remove functions.

To start, a Function has attributes for namespace, name, parameters,
and return type. The CtxFunction class extends this by indicating that a
libxl_ctx is a required parmeter.

Also, add logic to idl.parse to return the list of functions found in an
IDL file. For now, have users of idl.py -- i.e. libxl/gentypes.py and
golang/xenlight/gengotypes.py -- ignore the list of functions returned.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py |  2 +-
 tools/libs/light/gentypes.py        |  2 +-
 tools/libs/light/idl.py             | 36 ++++++++++++++++++++++++++++-
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 3e40c3d5dc..484e121746 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -725,7 +725,7 @@ def xenlight_golang_fmt_name(name, exported = True):
 if __name__ == '__main__':
     idlname = sys.argv[1]
 
-    (builtins, types) = idl.parse(idlname)
+    (builtins, types, _) = idl.parse(idlname)
 
     for b in builtins:
         name = b.typename
diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 37de0f68b3..f9957b79a2 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -592,7 +592,7 @@ if __name__ == '__main__':
 
     (_, idlname, header, header_private, header_json, impl) = sys.argv
 
-    (builtins,types) = idl.parse(idlname)
+    (builtins,types,_) = idl.parse(idlname)
 
     print("outputting libxl type definitions to %s" % header)
 
diff --git a/tools/libs/light/idl.py b/tools/libs/light/idl.py
index d7367503b4..20278c272a 100644
--- a/tools/libs/light/idl.py
+++ b/tools/libs/light/idl.py
@@ -347,6 +347,35 @@ class OrderedDict(dict):
     def ordered_items(self):
         return [(x,self[x]) for x in self.__ordered]
 
+class Function(object):
+    """
+    A general description of a function signature.
+
+    Attributes:
+      name (str): name of the function, excluding namespace.
+      params (list of (str,Type)): list of function parameters.
+      return_type (Type): the Type (if any), returned by the function.
+    """
+    def __init__(self, name=None, params=None, return_type=None, namespace=None):
+
+        if namespace is None:
+            self.namespace = _get_default_namespace()
+        else:
+            self.namespace = namespace
+
+        self.name = self.namespace + name
+        self.rawname = name
+        self.params = params
+        self.return_type = return_type
+
+class CtxFunction(Function):
+    """ A function that requires a libxl_ctx. """
+    def __init__(self, name=None, params=None, return_type=None):
+        ctx = Builtin("ctx", passby=PASS_BY_REFERENCE)
+        params.insert(0, ("ctx", ctx))
+
+        Function.__init__(self, name, params, return_type)
+
 def parse(f):
     print("Parsing %s" % f, file=sys.stderr)
 
@@ -358,6 +387,10 @@ def parse(f):
             globs[n] = t
         elif isinstance(t,type(object)) and issubclass(t, Type):
             globs[n] = t
+        elif isinstance(t, Function):
+            globs[n] = t
+        elif isinstance(t,type(object)) and issubclass(t, Function):
+            globs[n] = t
         elif n in ['PASS_BY_REFERENCE', 'PASS_BY_VALUE',
                    'DIR_NONE', 'DIR_IN', 'DIR_OUT', 'DIR_BOTH',
                    'namespace', 'hidden']:
@@ -370,8 +403,9 @@ def parse(f):
                           % (e.lineno, f, e.text))
 
     types = [t for t in locs.ordered_values() if isinstance(t,Type)]
+    funcs = [f for f in locs.ordered_values() if isinstance(f,Function)]
 
     builtins = [t for t in types if isinstance(t,Builtin)]
     types = [t for t in types if not isinstance(t,Builtin)]
 
-    return (builtins,types)
+    return (builtins,types,funcs)
-- 
2.17.1


