Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF619855C0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803575.1214263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc6-0006Ag-Di; Wed, 25 Sep 2024 08:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803575.1214263; Wed, 25 Sep 2024 08:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc6-00065S-8i; Wed, 25 Sep 2024 08:43:10 +0000
Received: by outflank-mailman (input) for mailman id 803575;
 Wed, 25 Sep 2024 08:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc4-0005cc-ID
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:08 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fda582a-7b1a-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:43:07 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso445900166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93a5d4a6c8sm40342966b.222.2024.09.25.01.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:06 -0700 (PDT)
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
X-Inumbo-ID: 2fda582a-7b1a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253787; x=1727858587; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A7anrJKRONUakwDhBF6Xlt3dpj6kBkDkGt4BhpDYoU=;
        b=dlGUN5i9SeeJh08PT5HlEaXjzObD/cux0syuttMW7JUtfLQsLIMLRqTunqb8lHQopa
         cOGGhCWZVd/IrzqQb43a9YSEzSsE3sHTfm+YgmLMXmsQtJh+cv21Pom5POAT0BVpkodK
         EDR6ChtmGXx1ijrqmSQiOjR83guc2TqIT1Zr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253787; x=1727858587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A7anrJKRONUakwDhBF6Xlt3dpj6kBkDkGt4BhpDYoU=;
        b=BFR0P9nWomMH/vT6InMxWysltFefRjY16eOVhK7jXHvYhp8fEh7v8FCPO2bbUqQpfh
         FHJwgu5z+qjxXnpAamYO+WNGhpEbjgF8bnuLVeUxgEdapYbBa/W3cm60eoPx4yrCy4xX
         uOsonh+38yNoR9NdLilSYyxbH5VREDrmdwkI58+TiRJIeex5tuDIbwobf+1eksvBUSrD
         iuOJs5wlATUZf/xbNq0cRau5fKFM5HoktVBhry2vUx6Rz3wjyN9n1Icn5xeS6gm4KYGw
         OheEeGG65ksvkKAuI6qK5sHG1seoIxwkwEqSCha5/t5j5tHya2bk+rD8ooSVMy8qUQqd
         hoGg==
X-Gm-Message-State: AOJu0YwFKaIObVeK5a0oKc+IlwKnJCyY8Ik45qWBf8EZe+NU9qp+L3mK
	2XpgVQXF8KuPOWQ+8QalQEfprMwvHqC9g0BYwMzKQuZWjt2DmlrkLz/gBfplijh2+RcZZW3P2e4
	b
X-Google-Smtp-Source: AGHT+IFsXsuXl+00mO3vs6bnEI07yLJnBo+Ue7Qszr7Px4+ZLH7AGyObwzpvnP6H+I/zoaEFZeyXNQ==
X-Received: by 2002:a17:907:f197:b0:a8a:85af:7ae8 with SMTP id a640c23a62f3a-a93a0325159mr172110966b.11.1727253786633;
        Wed, 25 Sep 2024 01:43:06 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/6] xen/livepatch: simplify and unify logic in prepare_payload()
Date: Wed, 25 Sep 2024 10:42:36 +0200
Message-ID: <20240925084239.85649-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following sections: .note.gnu.build-id, .livepatch.xen_depends and
.livepatch.depends are mandatory and ensured to be present by
check_special_sections() before prepare_payload() is called.

Simplify the logic in prepare_payload() by introducing a generic function to
parse the sections that contain a buildid.  Note the function assumes the
buildid related section to always be present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Rename.
 - Change order of assert.
---
 xen/common/livepatch.c | 110 +++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 60 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 87b3db03e26d..8e61083f23a7 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -470,6 +470,31 @@ static int xen_build_id_dep(const struct payload *payload)
     return 0;
 }
 
+/* Parses build-id sections into the given destination. */
+static int parse_buildid(const struct livepatch_elf_sec *sec,
+                         struct livepatch_build_id *id)
+{
+    const Elf_Note *n;
+    int rc;
+
+    /* Presence of the sections is ensured by check_special_sections(). */
+    ASSERT(sec);
+
+    n = sec->load_addr;
+
+    if ( sec->sec->sh_size <= sizeof(*n) )
+        return -EINVAL;
+
+    rc = xen_build_id_check(n, sec->sec->sh_size, &id->p, &id->len);
+    if ( rc )
+        return rc;
+
+    if ( !id->len || !id->p )
+        return -EINVAL;
+
+   return 0;
+}
+
 static int check_special_sections(const struct livepatch_elf *elf)
 {
     unsigned int i;
@@ -641,11 +666,12 @@ static int prepare_payload(struct payload *payload,
                            struct livepatch_elf *elf)
 {
     const struct livepatch_elf_sec *sec;
+    const struct payload *data;
     unsigned int i;
     struct livepatch_func *funcs;
     struct livepatch_func *f;
     struct virtual_region *region;
-    const Elf_Note *n;
+    int rc;
 
     sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
     if ( sec )
@@ -663,8 +689,6 @@ static int prepare_payload(struct payload *payload,
 
         for ( i = 0; i < payload->nfuncs; i++ )
         {
-            int rc;
-
             f = &(funcs[i]);
 
             if ( f->version != LIVEPATCH_PAYLOAD_VERSION )
@@ -707,69 +731,35 @@ static int prepare_payload(struct payload *payload,
     LIVEPATCH_ASSIGN_SINGLE_HOOK(elf, payload->hooks.revert.action, ELF_LIVEPATCH_REVERT_HOOK);
     LIVEPATCH_ASSIGN_SINGLE_HOOK(elf, payload->hooks.revert.post, ELF_LIVEPATCH_POSTREVERT_HOOK);
 
-    sec = livepatch_elf_sec_by_name(elf, ELF_BUILD_ID_NOTE);
-    if ( sec )
-    {
-        const struct payload *data;
-
-        n = sec->load_addr;
-
-        if ( sec->sec->sh_size <= sizeof(*n) )
-            return -EINVAL;
-
-        if ( xen_build_id_check(n, sec->sec->sh_size,
-                                &payload->id.p, &payload->id.len) )
-            return -EINVAL;
-
-        if ( !payload->id.len || !payload->id.p )
-            return -EINVAL;
+    rc = parse_buildid(livepatch_elf_sec_by_name(elf, ELF_BUILD_ID_NOTE),
+                       &payload->id);
+    if ( rc )
+        return rc;
 
-        /* Make sure it is not a duplicate. */
-        list_for_each_entry ( data, &payload_list, list )
+    /* Make sure it is not a duplicate. */
+    list_for_each_entry ( data, &payload_list, list )
+    {
+        /* No way _this_ payload is on the list. */
+        ASSERT(data != payload);
+        if ( data->id.len == payload->id.len &&
+             !memcmp(data->id.p, payload->id.p, data->id.len) )
         {
-            /* No way _this_ payload is on the list. */
-            ASSERT(data != payload);
-            if ( data->id.len == payload->id.len &&
-                 !memcmp(data->id.p, payload->id.p, data->id.len) )
-            {
-                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Already loaded as %s!\n",
-                        elf->name, data->name);
-                return -EEXIST;
-            }
+            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Already loaded as %s!\n",
+                    elf->name, data->name);
+            return -EEXIST;
         }
     }
 
-    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_DEPENDS);
-    if ( sec )
-    {
-        n = sec->load_addr;
-
-        if ( sec->sec->sh_size <= sizeof(*n) )
-            return -EINVAL;
-
-        if ( xen_build_id_check(n, sec->sec->sh_size,
-                                &payload->dep.p, &payload->dep.len) )
-            return -EINVAL;
-
-        if ( !payload->dep.len || !payload->dep.p )
-            return -EINVAL;
-    }
-
-    sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
-    if ( sec )
-    {
-        n = sec->load_addr;
-
-        if ( sec->sec->sh_size <= sizeof(*n) )
-            return -EINVAL;
-
-        if ( xen_build_id_check(n, sec->sec->sh_size,
-                                &payload->xen_dep.p, &payload->xen_dep.len) )
-            return -EINVAL;
+    rc = parse_buildid(livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_DEPENDS),
+                       &payload->dep);
+    if ( rc )
+        return rc;
 
-        if ( !payload->xen_dep.len || !payload->xen_dep.p )
-            return -EINVAL;
-    }
+    rc = parse_buildid(livepatch_elf_sec_by_name(elf,
+                                                 ELF_LIVEPATCH_XEN_DEPENDS),
+                       &payload->xen_dep);
+    if ( rc )
+        return rc;
 
     /* Setup the virtual region with proper data. */
     region = &payload->region;
-- 
2.46.0


