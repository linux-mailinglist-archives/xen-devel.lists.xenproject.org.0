Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFD987144
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805202.1216255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld7-0001T8-6A; Thu, 26 Sep 2024 10:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805202.1216255; Thu, 26 Sep 2024 10:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld6-0001Qk-W8; Thu, 26 Sep 2024 10:21:48 +0000
Received: by outflank-mailman (input) for mailman id 805202;
 Thu, 26 Sep 2024 10:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld6-0001Nm-0p
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:48 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 220ccade-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:21:46 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53653ee23adso768328e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:46 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4fa95sm330147866b.54.2024.09.26.03.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:44 -0700 (PDT)
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
X-Inumbo-ID: 220ccade-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346105; x=1727950905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o74cvTmFfSOR3GfXakT+C/j8XZSivGfstOI/1D0MD/I=;
        b=LodCBx/3DnNSEKTeoiz4WBR61x5QAlcUPQaPIc6cffnY43YGYXKO3LkdxtJyaVHXkE
         9+a2Jt/Teq1HkraoLlejqmTDSGpHk9Muv3GQqL2Ye8H82dYagAfEdjCc8IzOSfJBOJvR
         ZijhZ/WXPijsQrBawSTS/vaEyjxBKucG9NaS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346105; x=1727950905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o74cvTmFfSOR3GfXakT+C/j8XZSivGfstOI/1D0MD/I=;
        b=jzQJ0Xpg6vKTOAcQ26OvejhQdZjRAZzw9ID9DhdjVrnsi7RAZBc7lf8MkQuvStbOJP
         /yQD9U5mVUJtnNyYtRcqg3gH99EjaOz8Hm7zKci5jT1U+KmsyGstioxM1wSt5nfepIgz
         AL7bsUc3IOodYlWxRQ9Q1y3knWTjxkp5qe6imBkOIlPM00q2QHNKh2ld4yW86T1jDkWE
         I7aH2CMxT6M+iu9ESd76VncIUMBaCsc+Bs68akznLYfUSrEXxl8uBPzjhBx/uNdlT//u
         lBpgBMmAN6PrUqqwc+onXebMWUH4sf6NaFTvskZEppzWY2dLFc4+LXu7xFRKpA/b1mHA
         ruXQ==
X-Gm-Message-State: AOJu0Yzx40GAr93JNBvvQHigsTyu8MX501xz/f8GXLXuV3kXsRkVe+FD
	J9M8oKTF1swB21wU5p6rOpd7XrNT1JaWvBLKNri07dzzN2aucUtz70SQ8TZyaVTj1rZNLxdvjPY
	z
X-Google-Smtp-Source: AGHT+IEKLwJbQY4UX1HEyFW8X29MtHCp83ov6Sj5aShomUs3mfYct0EL9ch1rHzx+qPjwbsE0i43uw==
X-Received: by 2002:a05:6512:3b0e:b0:535:6cca:9453 with SMTP id 2adb3069b0e04-5387048ab7fmr3572971e87.12.1727346105246;
        Thu, 26 Sep 2024 03:21:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/5] xen/livepatch: simplify and unify logic in prepare_payload()
Date: Thu, 26 Sep 2024 12:14:28 +0200
Message-ID: <20240926101431.97444-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926101431.97444-1-roger.pau@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
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
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Rename.
 - Change order of assert.
---
 xen/common/livepatch.c | 110 +++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 60 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 7e6bf58f4408..50e2268e19a3 100644
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
+    n = sec->addr;
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
-        n = sec->addr;
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
-        n = sec->addr;
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
-        n = sec->addr;
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


