Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1741987148
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805203.1216273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld9-0001xL-NY; Thu, 26 Sep 2024 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805203.1216273; Thu, 26 Sep 2024 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld9-0001uP-CT; Thu, 26 Sep 2024 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 805203;
 Thu, 26 Sep 2024 10:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld7-0001Nm-2H
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22c8ae8b-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:21:47 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso112691666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5489dsm330891566b.75.2024.09.26.03.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:46 -0700 (PDT)
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
X-Inumbo-ID: 22c8ae8b-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346106; x=1727950906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMV7sv85uJEHqRmzmClkVSBMQ6SQAz9qB3gfIkmcOdA=;
        b=YiE2Vp+U4LIJ78Og8lxnsu5Ip/qLjeKL171zoiSiAXacv5qvhlbSjuk+p9O1ISuyXD
         Ni504QrodzNYYKcy1Yb3mILdH+axCkrlB63UJewr8mNWf885JWnl9KQfixoi0iztyBtu
         02NUaxqbG/spobpcUeZaARNVa1U6gdNEbSMts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346106; x=1727950906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMV7sv85uJEHqRmzmClkVSBMQ6SQAz9qB3gfIkmcOdA=;
        b=Edus3jaqjIKCMHhATbc0R4wCAGzJQqdiFB4EvwBZmoZLfSZc7lpi/b810pBOPidkPb
         anBJIq1LT4lgPE8p994+2r078m1a9V4gNygOPJ8QzDV8tCSYPH9dxG0DBsf9UZWSKH+C
         Xqo6Cc3bIWKG/QIoIvWYvx1NU/RYdDDDae7BNhyXDIPmD0pk2Lqb168gzWRbizcc7yMF
         vIGy0jHtvNf968gLQ5FBegFaV9YwshEouVs2QFIDhzQJzGo/17Mj8VlkSGogE1546eQl
         1Y3JmtWvwj4bGLV8rSXBJj43+K5DnH4vdFW/IkagsRDMjkiMG0iOM8vW9AXb2DWLzZcn
         vefg==
X-Gm-Message-State: AOJu0YwgIGOpqcWrEBuTlgJ0DaU3ZepeY7kxPubVjT24nwDEeQSmBvqX
	qza9ktITSQeHccRsvY+ebBpDIZ9kspH4L0dAwrhaqCFLBnQg1jCJO6Wcz6y8e/WiHF2JZwlpcbt
	d
X-Google-Smtp-Source: AGHT+IGdLpUWffGqwTkOPLSM37brc+qOUsph25Y3A0BhmHbiDsclnm68sZ/sRfzvWI6JtjzVFsE27g==
X-Received: by 2002:a17:907:ea8:b0:a8a:9246:7f57 with SMTP id a640c23a62f3a-a93a0341a1cmr582888466b.4.1727346106447;
        Thu, 26 Sep 2024 03:21:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 3/5] xen/livepatch: do Xen build-id check earlier
Date: Thu, 26 Sep 2024 12:14:29 +0200
Message-ID: <20240926101431.97444-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926101431.97444-1-roger.pau@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
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

Note printing the expected Xen build ID has part of dumping the payload
information is no longer done: all loaded payloads would have Xen build IDs
matching the running Xen, otherwise they would have failed to load.

Fixes: 879615f5db1d ('livepatch: Always check hypervisor build ID upon livepatch upload')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Move contents of xen_build_id_dep() into check_xen_buildid().

Changes since v1:
 - Do the Xen build-id check even earlier.
---
 xen/common/livepatch.c              | 86 +++++++++++++++++------------
 xen/include/xen/livepatch_payload.h |  1 -
 2 files changed, 50 insertions(+), 37 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 50e2268e19a3..f7db4be96e66 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -448,28 +448,6 @@ static bool section_ok(const struct livepatch_elf *elf,
     return true;
 }
 
-static int xen_build_id_dep(const struct payload *payload)
-{
-    const void *id = NULL;
-    unsigned int len = 0;
-    int rc;
-
-    ASSERT(payload->xen_dep.len);
-    ASSERT(payload->xen_dep.p);
-
-    rc = xen_build_id(&id, &len);
-    if ( rc )
-        return rc;
-
-    if ( payload->xen_dep.len != len || memcmp(id, payload->xen_dep.p, len) ) {
-        printk(XENLOG_ERR LIVEPATCH "%s: check against hypervisor build-id failed\n",
-               payload->name);
-        return -EINVAL;
-    }
-
-    return 0;
-}
-
 /* Parses build-id sections into the given destination. */
 static int parse_buildid(const struct livepatch_elf_sec *sec,
                          struct livepatch_build_id *id)
@@ -495,11 +473,56 @@ static int parse_buildid(const struct livepatch_elf_sec *sec,
    return 0;
 }
 
+static int check_xen_buildid(const struct livepatch_elf *elf)
+{
+    const void *id;
+    unsigned int len;
+    struct livepatch_build_id lp_id;
+    const struct livepatch_elf_sec *sec =
+        livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
+    int rc;
+
+    if ( !sec )
+    {
+        printk(XENLOG_ERR LIVEPATCH "%s: section %s is missing\n",
+               elf->name, ELF_LIVEPATCH_XEN_DEPENDS);
+        return -EINVAL;
+    }
+
+    rc = parse_buildid(sec, &lp_id);
+    if ( rc )
+    {
+        printk(XENLOG_ERR LIVEPATCH
+               "%s: failed to parse section %s as build-id: %d\n",
+               elf->name, ELF_LIVEPATCH_XEN_DEPENDS, rc);
+        return -EINVAL;
+    }
+
+    rc = xen_build_id(&id, &len);
+    if ( rc )
+    {
+        printk(XENLOG_ERR LIVEPATCH
+               "%s: unable to get running Xen build-id: %d\n",
+               elf->name, rc);
+        return rc;
+    }
+
+    if ( lp_id.len != len || memcmp(id, lp_id.p, len) )
+    {
+        printk(XENLOG_ERR LIVEPATCH "%s: build-id mismatch:\n"
+                                    "  livepatch: %*phN\n"
+                                    "        xen: %*phN\n",
+               elf->name, lp_id.len, lp_id.p, len, id);
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
@@ -755,12 +778,6 @@ static int prepare_payload(struct payload *payload,
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
 
@@ -1069,6 +1086,10 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
+    rc = check_xen_buildid(&elf);
+    if ( rc )
+       goto out;
+
     rc = move_payload(payload, &elf);
     if ( rc )
         goto out;
@@ -1093,10 +1114,6 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = xen_build_id_dep(payload);
-    if ( rc )
-        goto out;
-
     rc = build_symbol_table(payload, &elf);
     if ( rc )
         goto out;
@@ -2199,9 +2216,6 @@ static void cf_check livepatch_printall(unsigned char key)
 
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


