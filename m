Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF008AE7AD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710600.1109912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxg-0002Fo-UY; Tue, 23 Apr 2024 13:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710600.1109912; Tue, 23 Apr 2024 13:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFxg-0002Dl-QB; Tue, 23 Apr 2024 13:13:28 +0000
Received: by outflank-mailman (input) for mailman id 710600;
 Tue, 23 Apr 2024 13:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzFxf-0002Bv-PI
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:13:27 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43cd262a-0173-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:13:24 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6a06b12027cso29247336d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:13:24 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 w9-20020a0ca809000000b00696b1050be8sm4054360qva.133.2024.04.23.06.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 06:13:22 -0700 (PDT)
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
X-Inumbo-ID: 43cd262a-0173-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713878003; x=1714482803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAW+pmvPvQM6t7OJF1VqQVrXJwKICgDo4XoYwqWkiAY=;
        b=Fkw0k+NtCTDpYMDw254y1OnrywcJt63/iu4Zgd7SkjzhgiMga/IzQsK5u/qhiGEMge
         X5TXlJqPXr5erXpGt3KCS8THf2Pxs1IC+8Zy1XsfdP+sFB6M9fH/HhlSFhH8E4K4T6TJ
         P7biJaqgCtBKlnnuwuCbLzyEqrYv+zCz4BrI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878003; x=1714482803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAW+pmvPvQM6t7OJF1VqQVrXJwKICgDo4XoYwqWkiAY=;
        b=UWrzg56NATDdCFABrFQfCwyEClR674fjEBeVdOT7mCIJKT6Cr1n3N9dP9iJAbidlaS
         bCc+YbPiR1umaNDj6uDUoXjLfdwM3MFZEXIRbBPEfmuQkx44ML+PbRJDKYb9+Ci3sIkp
         WpRnjD5RZ93fRbJu89wvOnr9nCEzsnPKR174AwYJ3MM4ZI/b5Cw2PAGrZeZ2Gjr8nKeB
         IBCy9mr7/cr9Vj2Jwc9rxZgLs1YcHJqmoO0gX7qhhI25uxLMhYz8zyvRAjwgC73v3+p1
         a/uIAgeM0gC+duLdKgQvhcH6q2pfJiy4d+qBKhaLt+P2akPxbjxLtaLoGi511VLrgk8s
         5Dog==
X-Gm-Message-State: AOJu0YzWPt4yA0PV0twWmrGolB1xiHb0gQt91MBycJ2hXynjCozIxOiP
	JB0cLh0yo7pjizqSn5ia3qxhJv90JSjvow4C5WJ9NRV182bLztwnNcb3mPjE+tU3LsP/VNyPvGe
	u
X-Google-Smtp-Source: AGHT+IF/pz23x1VIORoM+H0lMBL+JfXwTpozuDwRz/BpbBd0BgcVEMlCQZbSMNrneqacUV4Xff7xxg==
X-Received: by 2002:ad4:5aa3:0:b0:69c:b559:547d with SMTP id u3-20020ad45aa3000000b0069cb559547dmr4971963qvg.25.1713878002905;
        Tue, 23 Apr 2024 06:13:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 3/4] livepatch: refuse to resolve symbols that belong to init sections
Date: Tue, 23 Apr 2024 15:12:48 +0200
Message-ID: <20240423131249.29825-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423131249.29825-1-roger.pau@citrix.com>
References: <20240423131249.29825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Livepatch payloads containing symbols that belong to init sections can only
lead to page faults later on, as by the time the livepatch is loaded init
sections have already been freed.

Refuse to resolve such symbols and return an error instead.

Note such resolutions are only relevant for symbols that point to undefined
sections (SHN_UNDEF), as that implies the symbol is not in the current payload
and hence must either be a Xen or a different livepatch payload symbol.

Do not allow to resolve symbols that point to __init_begin, as that address is
also unmapped.  On the other hand, __init_end is not unmapped, and hence allow
resolutions against it.

Since __init_begin can alias other symbols (like _erodata for example)
allow the force flag to override the check and resolve the symbol anyway.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Allow bypassing added check with the force flag.

Changes since v1:
 - Fix off-by-one in range checking.
---
 xen/common/livepatch.c          | 13 ++++++++-----
 xen/common/livepatch_elf.c      | 18 +++++++++++++++++-
 xen/include/xen/livepatch_elf.h |  2 +-
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1503a84457e4..36cf4bee8b8a 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1080,7 +1080,8 @@ static void free_payload(struct payload *data)
     xfree(data);
 }
 
-static int load_payload_data(struct payload *payload, void *raw, size_t len)
+static int load_payload_data(struct payload *payload, void *raw, size_t len,
+                             bool force)
 {
     struct livepatch_elf elf = { .name = payload->name, .len = len };
     int rc = 0;
@@ -1093,7 +1094,7 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = livepatch_elf_resolve_symbols(&elf);
+    rc = livepatch_elf_resolve_symbols(&elf, force);
     if ( rc )
         goto out;
 
@@ -1133,7 +1134,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     return rc;
 }
 
-static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
+static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload,
+                            bool force)
 {
     struct payload *data, *found;
     char n[XEN_LIVEPATCH_NAME_SIZE];
@@ -1162,7 +1164,7 @@ static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
     {
         memcpy(data->name, n, strlen(n));
 
-        rc = load_payload_data(data, raw_data, upload->size);
+        rc = load_payload_data(data, raw_data, upload->size, force);
         if ( rc )
             goto out;
 
@@ -2132,7 +2134,8 @@ int livepatch_op(struct xen_sysctl_livepatch_op *livepatch)
     switch ( livepatch->cmd )
     {
     case XEN_SYSCTL_LIVEPATCH_UPLOAD:
-        rc = livepatch_upload(&livepatch->u.upload);
+        rc = livepatch_upload(&livepatch->u.upload,
+                              livepatch->flags & LIVEPATCH_FLAG_FORCE);
         break;
 
     case XEN_SYSCTL_LIVEPATCH_GET:
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..0436f2d5fcbd 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -4,6 +4,7 @@
 
 #include <xen/errno.h>
 #include <xen/lib.h>
+#include <xen/sections.h>
 #include <xen/symbols.h>
 #include <xen/livepatch_elf.h>
 #include <xen/livepatch.h>
@@ -276,7 +277,7 @@ static int elf_get_sym(struct livepatch_elf *elf, const void *data)
     return 0;
 }
 
-int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
+int livepatch_elf_resolve_symbols(struct livepatch_elf *elf, bool force)
 {
     unsigned int i;
     int rc = 0;
@@ -310,6 +311,21 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                     break;
                 }
             }
+
+            /*
+             * Ensure not an init symbol.  Only applicable to Xen symbols, as
+             * livepatch payloads don't have init sections or equivalent.
+             */
+            else if ( st_value >= (uintptr_t)&__init_begin &&
+                      st_value <  (uintptr_t)&__init_end && !force )
+            {
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s: symbol %s is in init section, not resolving\n",
+                       elf->name, elf->sym[i].name);
+                rc = -ENXIO;
+                break;
+            }
+
             dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
                     elf->name, elf->sym[i].name, st_value);
             break;
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 7116deaddc28..84e9c5eb7be5 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -44,7 +44,7 @@ livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
 int livepatch_elf_load(struct livepatch_elf *elf, const void *data);
 void livepatch_elf_free(struct livepatch_elf *elf);
 
-int livepatch_elf_resolve_symbols(struct livepatch_elf *elf);
+int livepatch_elf_resolve_symbols(struct livepatch_elf *elf, bool force);
 int livepatch_elf_perform_relocs(struct livepatch_elf *elf);
 
 static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
-- 
2.44.0


