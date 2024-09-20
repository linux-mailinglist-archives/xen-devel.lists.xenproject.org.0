Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E197D3BD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801078.1211113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4Z-0000e9-4z; Fri, 20 Sep 2024 09:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801078.1211113; Fri, 20 Sep 2024 09:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4Z-0000cY-0l; Fri, 20 Sep 2024 09:37:07 +0000
Received: by outflank-mailman (input) for mailman id 801078;
 Fri, 20 Sep 2024 09:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sra4Y-0000Rx-6u
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:37:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ed46d4-7733-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 11:37:04 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so2407178a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:37:04 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e5731sm825313766b.183.2024.09.20.02.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:37:02 -0700 (PDT)
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
X-Inumbo-ID: e4ed46d4-7733-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726825023; x=1727429823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKm4w8wQOjLh/yBHbsoJsPm7JcAdsfYSU5MaYWb8sVM=;
        b=YSb87MXLT/kpkbxdwkVMkSQJX1YM+mJSxmQljfqr/5uGn8yW4EWfRkdeNGAQg0HhfX
         qAKUtMVGkklKFnEmQYH0d/Jw81Zi97YHqzb7PdM4ZVuaPPxxrS3NlvVHuX+T+QUkF/mx
         q3XwtHTEvbvuH6OG/7DvjG0hXlCKQH+NQjoFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825023; x=1727429823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKm4w8wQOjLh/yBHbsoJsPm7JcAdsfYSU5MaYWb8sVM=;
        b=NvjV2zAifnOJf7FIdupFCdhndJQF6PPMIm86FyRIaBPFWVihKty8QZFVCmTvQkVWva
         meNt5NrHmiYGZOjKIjVb1nzRaU4KimK91G88UVZlDoVF6fuVtV15TJVtpfdFp0Vj65yV
         lJcv20ZPlGnb6F/1CCU7mthbHua+1fp2VsTunkP7UQ2UalcGRIbQJx2XHUHTuEOHs7T8
         ezTqnb0dFDKOfyZknyj4FrEP//osOIvJnCCCne7ZBEZ0lj+Ls5GAyZqcERAzwTVfebsF
         XfIQ4QyqphrOp35E+rx+ShEP7KeGHnWBdwjs2HU2RObO7wC3Mmd+zCywfqAUzsNATbNj
         0xyA==
X-Gm-Message-State: AOJu0Yy5cC4T21JSS7i4OfsB0lIVn/Ac172vFoC8yOa4gPIXwlexxPbu
	3rF2GwIHalF+Tj/NrYzpvGPhYMoePN1pfhPwKtCJ8CIQfHTaabfT4zdy9qA7fnlaFUVlz4m4Hyk
	Y
X-Google-Smtp-Source: AGHT+IGZN72h0QdBaY0y+Q/o4Q0N3nipJ5FdhNCHKIhHckf6YNhq2OqlAfJrtSkiZmtscsKAecLkdQ==
X-Received: by 2002:a17:907:f184:b0:a8d:1284:6de5 with SMTP id a640c23a62f3a-a90d560e199mr175568166b.14.1726825022585;
        Fri, 20 Sep 2024 02:37:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/3] xen/livepatch: simplify and unify logic in prepare_payload()
Date: Fri, 20 Sep 2024 11:36:53 +0200
Message-ID: <20240920093656.48879-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920093656.48879-1-roger.pau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
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
 xen/common/livepatch.c | 106 ++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 60 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d93a556bcda2..cea47ffe4c84 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -647,15 +647,37 @@ static inline int livepatch_check_expectations(const struct payload *payload)
     nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
 } while (0)
 
+static int fetch_buildid(const struct livepatch_elf_sec *sec,
+                         struct livepatch_build_id *id)
+{
+    const Elf_Note *n = sec->load_addr;
+    int rc;
+
+    ASSERT(sec);
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
 static int prepare_payload(struct payload *payload,
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
@@ -673,8 +695,6 @@ static int prepare_payload(struct payload *payload,
 
         for ( i = 0; i < payload->nfuncs; i++ )
         {
-            int rc;
-
             f = &(funcs[i]);
 
             if ( f->version != LIVEPATCH_PAYLOAD_VERSION )
@@ -717,69 +737,35 @@ static int prepare_payload(struct payload *payload,
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
+    rc = fetch_buildid(livepatch_elf_sec_by_name(elf, ELF_BUILD_ID_NOTE),
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
+    rc = fetch_buildid(livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_DEPENDS),
+                       &payload->dep);
+    if ( rc )
+        return rc;
 
-        if ( !payload->xen_dep.len || !payload->xen_dep.p )
-            return -EINVAL;
-    }
+    rc = fetch_buildid(livepatch_elf_sec_by_name(elf,
+                                                 ELF_LIVEPATCH_XEN_DEPENDS),
+                       &payload->xen_dep);
+    if ( rc )
+        return rc;
 
     /* Setup the virtual region with proper data. */
     region = &payload->region;
-- 
2.46.0


