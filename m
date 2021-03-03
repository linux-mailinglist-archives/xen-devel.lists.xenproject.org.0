Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D332ACCA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92642.174627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGat-00085u-Ki; Wed, 03 Mar 2021 01:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92642.174627; Wed, 03 Mar 2021 01:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGat-00085U-HN; Wed, 03 Mar 2021 01:46:31 +0000
Received: by outflank-mailman (input) for mailman id 92642;
 Wed, 03 Mar 2021 01:46:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGar-000841-Pq
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:29 +0000
Received: from mail-qv1-xf2c.google.com (unknown [2607:f8b0:4864:20::f2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9e9fbda-26c0-4664-8b1f-192141e9f5d7;
 Wed, 03 Mar 2021 01:46:24 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id r5so10907021qvv.9
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:24 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:24 -0800 (PST)
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
X-Inumbo-ID: a9e9fbda-26c0-4664-8b1f-192141e9f5d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=d3549LeDdOjw1wfdOgQuNmXcdgerSomgrqy3WUaXdIs=;
        b=S+W9hRMLlx9zEuE0+c4nDwmnRqQNsttx2156p9Nf12EOhJPyfgvIQ2+wxo8ondrl1J
         TSISvHwKtcFG99foz4tvClo3W7uqqVIfGiJy+zbbV+F/To6xe7UvF+5dQocBcdWmzQcG
         oI747VQDFc/GXZQtsWF+ujfvRAYwXzIdm+4YEEFmsu1q6vojCCm3btfoVMuvC7hsyEMX
         6K+dChtfvRELSlck1Y5rh4fjsnW+mx0N+s0dSY5zrwHc+Kf/T3Z+e5SQDGIRY7jBNz8+
         4kjzZklUzxcicFr1mgTZWBpBKBZ0ghej3riwma3ZfEtzYNjCDi6rcLILRmWY3eO+aVt2
         IUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=d3549LeDdOjw1wfdOgQuNmXcdgerSomgrqy3WUaXdIs=;
        b=QKwG2B2wOPcwx2fsf7E9VgCHslhfI1a+OHV92xnj41pUGwFTTngr8kCbnptlz8iwcS
         YJObfVxRi7LvqbYB9zIg57iYGdgULmfQL7dFqdPJtNwx9H+5F0H1lTXJqtfoi3iWY4J6
         DTewSHX4bNtocGfYT6uzCErtt96h1e27hs61l9HvoOqv++UoIwJK1lA8ntPr0BTtQlot
         390ttpxwTVoFguPbP7CUsoiXWRCr90DHUoqe3jF0y4bEWI/fBFnQjPRIL0+g17thjsp1
         Qi5OLfU49oFsCLDSL00LSYPkpJY31ckCnOVEebNzYYZBU55zudG9GNiFP4SaUyIoE/hh
         PWeQ==
X-Gm-Message-State: AOAM533J7vLTnWW2vM10tzlPGYcftlFA6WcyK/s4vMoI7kiS1nziw0p6
	eGLRjt+oJctnfW9gWkej8V33iqPZMIjOUg==
X-Google-Smtp-Source: ABdhPJxLArmXxrobJohrB1yLe+OiwyMWj4S102WoUONDq1AiRM3wmVwOxT66SiWHbJpS0nqyQ13e0Q==
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr6421373qvs.30.1614735984461;
        Tue, 02 Mar 2021 17:46:24 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 1/7] libxl: remove extra whitespace from gentypes.py
Date: Tue,  2 Mar 2021 20:46:13 -0500
Message-Id: <7a75b14f66acac499a0b17ab1c5595549421bac7.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

No functional change, just remove the extra whitespace from gentypes.py.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/libs/light/gentypes.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 9a45e45acc..37de0f68b3 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -40,7 +40,7 @@ def libxl_C_type_define(ty, indent = ""):
     elif isinstance(ty, idl.Aggregate):
         if isinstance(ty, idl.KeyedUnion):
             s += libxl_C_instance_of(ty.keyvar.type, ty.keyvar.name) + ";\n"
-            
+
         if ty.typename is None:
             s += "%s {\n" % ty.kind
         else:
@@ -48,7 +48,7 @@ def libxl_C_type_define(ty, indent = ""):
 
         for f in ty.fields:
             if isinstance(ty, idl.KeyedUnion) and f.type is None: continue
-            
+
             x = libxl_C_instance_of(f.type, f.name)
             if f.const:
                 x = "const " + x
@@ -164,7 +164,7 @@ def libxl_init_members(ty, nesting = 0):
         return [f for f in ty.fields if not f.const and isinstance(f.type,idl.KeyedUnion)]
     else:
         return []
-    
+
 def libxl_C_type_do_init(ty, pass_arg, need_zero=True, indent="    "):
     s=indent
     if ty.init_val is not None:
@@ -229,20 +229,20 @@ def libxl_C_type_member_init(ty, field):
         raise Exception("Only KeyedUnion is supported for member init")
 
     ku = field.type
-    
+
     s = ""
     s += "void %s(%s, %s)\n" % (ty.init_fn + "_" + ku.keyvar.name,
                                 ty.make_arg("p", passby=idl.PASS_BY_REFERENCE),
                                 ku.keyvar.type.make_arg(ku.keyvar.name))
     s += "{\n"
-    
+
     if ku.keyvar.init_val is not None:
         init_val = ku.keyvar.init_val
     elif ku.keyvar.type.init_val is not None:
         init_val = ku.keyvar.type.init_val
     else:
         init_val = None
-        
+
     (nparent,fexpr) = ty.member(ty.pass_arg("p"), ku.keyvar, isref=True)
     if init_val is not None:
         s += "    assert(%s == %s);\n" % (fexpr, init_val)
@@ -732,7 +732,7 @@ if __name__ == '__main__':
         f.write(libxl_C_type_copy(ty, "dst", "src"))
         f.write("}\n")
         f.write("\n")
-        
+
     for ty in [t for t in types if t.copy_deprecated_fn]:
         f.write("int %s(libxl_ctx *ctx, %s)\n" % (ty.copy_deprecated_fn,
             ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
-- 
2.17.1


