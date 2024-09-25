Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EC89855BE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803576.1214267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc6-0006Gn-O7; Wed, 25 Sep 2024 08:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803576.1214267; Wed, 25 Sep 2024 08:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc6-0006Ae-KY; Wed, 25 Sep 2024 08:43:10 +0000
Received: by outflank-mailman (input) for mailman id 803576;
 Wed, 25 Sep 2024 08:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc5-0005cc-DY
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:09 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30ae02e0-7b1a-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 10:43:08 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53660856a21so6343505e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d790esm1618283a12.92.2024.09.25.01.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:07 -0700 (PDT)
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
X-Inumbo-ID: 30ae02e0-7b1a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253788; x=1727858588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9Q7t84HRCJN2WRRUodHKbS/3EHi7/hM9/1ZhkVtq7c=;
        b=Y8hPbvqFnPr2j/FNBWR/FNVnNLzyZx7SGcJLUjmaMcmMzkl680CM13zLf4dKYdBupq
         uPU4R/rVEDFIWg53AA7fDP4u9lZLw6HT+UNk3XT12fU69LPTknETkhTXS4VytAqqy9pp
         j2MA3j3xc0QFlN7GBcAZSsHDMKUk9Sw8j8bu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253788; x=1727858588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9Q7t84HRCJN2WRRUodHKbS/3EHi7/hM9/1ZhkVtq7c=;
        b=MswkH8Xqxht/krb4QCWF4jyuSKbH4TlH9Yp9SJYFjZQBN8Ehd4VFX6PbMFck45/eKc
         p4Pfh3o71v1gSm/3PkgZm52uu1G/5vp0VR2q5t6ssFh42Ql6u+/47Hr95qW1ekvBebWv
         6BRcT4ID7DtqUtNXgp+Csx+2IhNj0TCAQ9Pr7WOX+td1uRwessH8TqqrL5KWbxA4Ykao
         4NId5lW9GZX6xpfCwhbTxFmR1yEZDoJpqzUnnLQDLoAff47ARWCd9nA9mbhJw0Hcj/Rz
         o4s3cNb9ZHrKwVXHYlZjkCeXBfEOWo8Wj6zorqqdYOspzwE94LbnVFVKHGrh++hH2GfN
         X4rA==
X-Gm-Message-State: AOJu0Yy5dO/pU+AY//7RMMrrSprDEjH1Mwi67F0+8ERCl9I8QJcaZA00
	3WrieXoTCKsa6cOE7aGaBPdrsBRgSGxyWAGdzWmxeexcYOXDr548+YU+8itfrVBXeSaZKekGvSf
	M
X-Google-Smtp-Source: AGHT+IFhYdpG5GjPV0eqkcQQJQJRo3wZvmC0rPSjF1eiOtrojuILBGTSMe1wj+c/riPnvnh5u3iH9Q==
X-Received: by 2002:a05:6512:108b:b0:52c:e05e:849b with SMTP id 2adb3069b0e04-5387755e295mr1025203e87.39.1727253787949;
        Wed, 25 Sep 2024 01:43:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 4/6] xen/livepatch: do Xen build-id check earlier
Date: Wed, 25 Sep 2024 10:42:37 +0200
Message-ID: <20240925084239.85649-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The check against the expected Xen build ID should be done ahead of attempting
to apply the alternatives contained in the livepatch.

If the CPUID in the alternatives patching data is out of the scope of the
running Xen featureset the BUG() in _apply_alternatives() will trigger thus
bringing the system down.  Note the layout of struct alt_instr could also
change between versions.  It's also possible for struct exception_table_entry
to have changed format, hence leading to other kind of errors if parsing of the
payload is done ahead of checking if the Xen build-id matches.

Move the Xen build ID check as early as possible.  To do so introduce a new
check_xen_buildid() function that parses and checks the Xen build-id before
moving the payload.  Since the expected Xen build-id is used early to
detect whether the livepatch payload could be loaded, there's no reason to
store it in the payload struct, as a non-matching Xen build-id won't get the
payload populated in the first place.

Note parse_buildid() has to be slightly adjusted to allow fetching the section
data from the 'data' field instead of the 'load_addr' one: with the Xen build
ID moved ahead of move_payload() 'load_addr' is not yet set when the Xen build
ID check is performed.  Also printing the expected Xen build ID has part of
dumping the payload is no longer done, as all loaded payloads would have Xen
build IDs matching the running Xen, otherwise they would have failed to load.

Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon livepatch upload')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do the Xen build-id check even earlier.
---
 xen/common/livepatch.c              | 66 +++++++++++++++++++----------
 xen/include/xen/livepatch_payload.h |  1 -
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 8e61083f23a7..895c425cd5ea 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -448,24 +448,21 @@ static bool section_ok(const struct livepatch_elf *elf,
     return true;
 }
 
-static int xen_build_id_dep(const struct payload *payload)
+static int xen_build_id_dep(const struct livepatch_build_id *expected)
 {
     const void *id = NULL;
     unsigned int len = 0;
     int rc;
 
-    ASSERT(payload->xen_dep.len);
-    ASSERT(payload->xen_dep.p);
+    ASSERT(expected->len);
+    ASSERT(expected->p);
 
     rc = xen_build_id(&id, &len);
     if ( rc )
         return rc;
 
-    if ( payload->xen_dep.len != len || memcmp(id, payload->xen_dep.p, len) ) {
-        printk(XENLOG_ERR LIVEPATCH "%s: check against hypervisor build-id failed\n",
-               payload->name);
+    if ( expected->len != len || memcmp(id, expected->p, len) )
         return -EINVAL;
-    }
 
     return 0;
 }
@@ -480,7 +477,8 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
     /* Presence of the sections is ensured by check_special_sections(). */
     ASSERT(sec);
 
-    n = sec->load_addr;
+    /* Possibly use the temporary load buffer if load_addr isn't yet set. */
+    n = sec->load_addr ?: sec->data;
 
     if ( sec->sec->sh_size <= sizeof(*n) )
         return -EINVAL;
@@ -495,11 +493,44 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
    return 0;
 }
 
+static int check_xen_buildid(const struct livepatch_elf *elf)
+{
+    struct livepatch_build_id id;
+    const struct livepatch_elf_sec *sec =
+        livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
+    int rc;
+
+    if ( !sec )
+    {
+        printk(XENLOG_ERR LIVEPATCH "%s: %s is missing\n",
+               elf->name, ELF_LIVEPATCH_XEN_DEPENDS);
+        return -EINVAL;
+    }
+
+    rc = parse_buildid(sec, &id);
+    if ( rc )
+    {
+        printk(XENLOG_ERR LIVEPATCH "%s: failed to parse build-id at %s: %d\n",
+               elf->name, ELF_LIVEPATCH_XEN_DEPENDS, rc);
+        return -EINVAL;
+    }
+
+    rc = xen_build_id_dep(&id);
+    if ( rc )
+    {
+        printk(XENLOG_ERR LIVEPATCH
+               "%s: check against hypervisor build-id failed: %d\n",
+               elf->name, rc);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int check_special_sections(const struct livepatch_elf *elf)
 {
     unsigned int i;
     static const char *const names[] = { ELF_LIVEPATCH_DEPENDS,
-                                         ELF_LIVEPATCH_XEN_DEPENDS,
                                          ELF_BUILD_ID_NOTE};
 
     for ( i = 0; i < ARRAY_SIZE(names); i++ )
@@ -755,12 +786,6 @@ static int prepare_payload(struct payload *payload,
     if ( rc )
         return rc;
 
-    rc = parse_buildid(livepatch_elf_sec_by_name(elf,
-                                                 ELF_LIVEPATCH_XEN_DEPENDS),
-                       &payload->xen_dep);
-    if ( rc )
-        return rc;
-
     /* Setup the virtual region with proper data. */
     region = &payload->region;
 
@@ -1069,6 +1094,10 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
+    rc = check_xen_buildid(&elf);
+    if ( rc )
+       goto out;
+
     rc = move_payload(payload, &elf);
     if ( rc )
         goto out;
@@ -1093,10 +1122,6 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = xen_build_id_dep(payload);
-    if ( rc )
-        goto out;
-
     rc = build_symbol_table(payload, &elf);
     if ( rc )
         goto out;
@@ -2199,9 +2224,6 @@ static void cf_check livepatch_printall(unsigned char key)
 
         if ( data->dep.len )
             printk("depend-on=%*phN\n", data->dep.len, data->dep.p);
-
-        if ( data->xen_dep.len )
-            printk("depend-on-xen=%*phN\n", data->xen_dep.len, data->xen_dep.p);
     }
 
     spin_unlock(&payload_lock);
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index 472d6a4a63c1..c6dc7cb5fa21 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -62,7 +62,6 @@ struct payload {
     unsigned int nsyms;                  /* Nr of entries in .strtab and symbols. */
     struct livepatch_build_id id;        /* ELFNOTE_DESC(.note.gnu.build-id) of the payload. */
     struct livepatch_build_id dep;       /* ELFNOTE_DESC(.livepatch.depends). */
-    struct livepatch_build_id xen_dep;   /* ELFNOTE_DESC(.livepatch.xen_depends). */
     livepatch_loadcall_t *const *load_funcs;   /* The array of funcs to call after */
     livepatch_unloadcall_t *const *unload_funcs;/* load and unload of the payload. */
     struct livepatch_hooks hooks;        /* Pre and post hooks for apply and revert */
-- 
2.46.0


