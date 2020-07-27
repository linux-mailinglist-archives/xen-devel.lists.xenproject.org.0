Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D622ED42
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 15:27:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k039R-0001Vu-VM; Mon, 27 Jul 2020 13:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGXS=BG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k039Q-0001Vb-Dz
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 13:26:44 +0000
X-Inumbo-ID: cde0e7a1-d00c-11ea-8abe-bc764e2007e4
Received: from mail-qk1-x72a.google.com (unknown [2607:f8b0:4864:20::72a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde0e7a1-d00c-11ea-8abe-bc764e2007e4;
 Mon, 27 Jul 2020 13:26:40 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id l23so15195448qkk.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2020 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=KaMEYjlDG3HM6TfMMDf5x6QCTVdKePy2b/fpNHgqtT4=;
 b=AoNJiUMrGU1/zEcVI7rNtQsygstiui6pLZ/O79Gk45wErhqsFyZeXorPFU8EsqyGWv
 p3dmphPgk/gPAsY70nwA+zdMiOy36q17JfiR9hys2QwDiD1/WczxcuVHy1eg0ZZwTODP
 uKpv+ItSTW7lX1qDUMQYI0/s6Mkjp4XJTnmLr1EmfFLnTLTbMuJVzFbjx4KaR0iWlNWl
 4dIPZWNhU03R7Fdj3emaHVlvP60qgEeNPjsStugzCN6ZkvksBHD7yQJRKL730/oVuzvr
 99Rswo1yVL7OYds1gt68gcDN0aQ1dIRL6sQMNHZ4l1KO7/D5NdsF9Iq5ehHsyo7Luqk2
 gFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=KaMEYjlDG3HM6TfMMDf5x6QCTVdKePy2b/fpNHgqtT4=;
 b=A66FOtJ0mLQkqX1iU1mRXDQfn0ow25f/8tvWykOzalaQx6t5R/05lnTYmQuBQePKIK
 Fzrdvc1/Rx9sU3aXUXYqxiYieuCXtMdeHYNmD6DUUri/J9o5M+6M6D1oEYUtLWgFrAkg
 5nkBRZLyMM9D08xbaXetiyoyI/EeQUURbYyChB7vb3X3fs/0NGqcTDXTfv/43WrcvtpT
 4N8EAld5Jwr7R0IEG1cbvq+a0+VVftqIJxQYyp5myazoab8FhdjrXCt8yKzjKaHBsga/
 BGqmCuw4X8VyF6eo4l+3ltnmbqQimmF6OxiqBTYRp/1655qe8WHF+aYVV1c1AoLJFcNM
 5LPw==
X-Gm-Message-State: AOAM530JEJ6Mc+r5rLur5H/d59hBuwi7Xke9ia8sIxxrI7xOUK/WbZBb
 AzUNJ/ETn7cZomdcGNLQjuZ9Cw2CBgA=
X-Google-Smtp-Source: ABdhPJwh5q3SSQneLjUt5N34KQd0L5ewFAMB6FFOFYJbRJ4Fv2ddzOGdKpRH9TNoBLqx2vdusuMLTg==
X-Received: by 2002:a05:620a:153c:: with SMTP id
 n28mr9178029qkk.285.1595856399792; 
 Mon, 27 Jul 2020 06:26:39 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id t8sm11828003qtc.50.2020.07.27.06.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:26:38 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH 1/2] libxl: add Function class to IDL
Date: Mon, 27 Jul 2020 09:26:32 -0400
Message-Id: <7e1774dffe69c702f738566abeb04a3a9d29e21b.1595854292.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595854292.git.rosbrookn@ainfosec.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1595854292.git.rosbrookn@ainfosec.com>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
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
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a Function and CtxFunction classes to idl.py to allow generator
scripts to generate wrappers which are repetitive and straight forward
when doing so by hand. Examples of such functions are the
device_add/remove functions.

To start, a Function has attributes for namespace, name, parameters,
return type, and an indication if the return value should be interpreted as
a status code. The CtxFunction class extends this by indicating that a
libxl_ctx is a required parmeter, and can optionally be an async
function.

Also, add logic to idl.parse to return the list of functions found in an
IDL file. For now, have users of idl.py -- i.e. libxl/gentypes.py and
golang/xenlight/gengotypes.py -- ignore the list of functions returned.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/gengotypes.py |  2 +-
 tools/libxl/gentypes.py             |  2 +-
 tools/libxl/idl.py                  | 46 ++++++++++++++++++++++++++++-
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
index 557fecd07b..bd3663c9ea 100644
--- a/tools/golang/xenlight/gengotypes.py
+++ b/tools/golang/xenlight/gengotypes.py
@@ -718,7 +718,7 @@ def xenlight_golang_fmt_name(name, exported = True):
 if __name__ == '__main__':
     idlname = sys.argv[1]
 
-    (builtins, types) = idl.parse(idlname)
+    (builtins, types, _) = idl.parse(idlname)
 
     for b in builtins:
         name = b.typename
diff --git a/tools/libxl/gentypes.py b/tools/libxl/gentypes.py
index 9a45e45acc..ac7306f3f7 100644
--- a/tools/libxl/gentypes.py
+++ b/tools/libxl/gentypes.py
@@ -592,7 +592,7 @@ if __name__ == '__main__':
 
     (_, idlname, header, header_private, header_json, impl) = sys.argv
 
-    (builtins,types) = idl.parse(idlname)
+    (builtins,types,_) = idl.parse(idlname)
 
     print("outputting libxl type definitions to %s" % header)
 
diff --git a/tools/libxl/idl.py b/tools/libxl/idl.py
index d7367503b4..1839871f86 100644
--- a/tools/libxl/idl.py
+++ b/tools/libxl/idl.py
@@ -347,6 +347,45 @@ class OrderedDict(dict):
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
+      return_is_status (bool): Indicates that the return value should be
+                               interpreted as an error/status code.
+    """
+    def __init__(self, name=None, params=None, return_type=None,
+                 return_is_status=False, namespace=None):
+
+        if namespace is None:
+            self.namespace = _get_default_namespace()
+        else:
+            self.namespace = namespace
+
+        self.name = self.namespace + name
+        self.params = params
+        self.return_type = return_type
+        self.return_is_status = return_is_status
+
+class CtxFunction(Function):
+    """
+    A function that requires a libxl_ctx.
+
+    Attributes:
+      is_asyncop (bool): indicates that the function accepts a
+                         libxl_asyncop_how parameter.
+    """
+    def __init__(self, name=None, params=None, return_type=None,
+                 return_is_status=False, is_asyncop=False):
+
+        self.is_asyncop = is_asyncop
+
+        Function.__init__(self, name, params, return_type, return_is_status)
+
 def parse(f):
     print("Parsing %s" % f, file=sys.stderr)
 
@@ -358,6 +397,10 @@ def parse(f):
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
@@ -370,8 +413,9 @@ def parse(f):
                           % (e.lineno, f, e.text))
 
     types = [t for t in locs.ordered_values() if isinstance(t,Type)]
+    funcs = [f for f in locs.ordered_values() if isinstance(f,Function)]
 
     builtins = [t for t in types if isinstance(t,Builtin)]
     types = [t for t in types if not isinstance(t,Builtin)]
 
-    return (builtins,types)
+    return (builtins,types,funcs)
-- 
2.17.1


