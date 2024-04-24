Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214978B042A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711242.1111074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrq-0003Au-78; Wed, 24 Apr 2024 08:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711242.1111074; Wed, 24 Apr 2024 08:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXrq-00038u-3v; Wed, 24 Apr 2024 08:20:38 +0000
Received: by outflank-mailman (input) for mailman id 711242;
 Wed, 24 Apr 2024 08:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzXrp-00036k-Ab
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:20:37 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a9f2d1-0213-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 10:20:33 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5acfba298d5so2776536eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:20:33 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 r6-20020ac87ee6000000b00439c1419553sm2297599qtc.44.2024.04.24.01.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:20:30 -0700 (PDT)
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
X-Inumbo-ID: 84a9f2d1-0213-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713946831; x=1714551631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izhPhXdYNwBKIoYTrQpLOp1F6ua4vMICerQToCRzrMU=;
        b=GHtv3ZSG/ePkNuogO3SH1tAaQtrCIG8BCEY+gy1w4Ti4HIxNtPkUBtOLuLWPOawQAW
         gic1zohAXzt9OkszQ0N4YrRlTtxIIYzCIUAAiFp/d/bBl69gvDJ5ssx7Ecgo+PGoewPW
         gaZOHIoHWBxr5uileCrwvTBHs6+EJlmvVV98g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713946831; x=1714551631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izhPhXdYNwBKIoYTrQpLOp1F6ua4vMICerQToCRzrMU=;
        b=ZkmSq/1nvM9f8ceW7eD/hOb9WmYLQlQcSs+E/acMQo7bIDXEvk70NeoSAFDK+TLdPL
         UIimaEH/PfCvR23PBO7pucIj9TiFv5XOBPt3zw+OZlzlcswfXlWRXom+3h7zBAHH7Ez5
         tMerEIBng0GMku+verfSRx5+sqF/M0NYIlD6hzTnJcwBR7Ei7+T30WL69zhNctbu0/XB
         USrdauef2E+6IfV2P18oVMnn9wa3rAoz5AA/DeSS3qgjEA1MRAiUI5iXTwCdLLZtDJSA
         DytAG++0QfFmIvCL//DfgR2v30Bfdc2Clgk/EFWp0UXIWopn4p7LUFaC5JetUiIDwBvd
         ztrA==
X-Gm-Message-State: AOJu0Yz7I5Kt8lqMave8RRgfeaI/2+etmgY3ti7LaEDGEYmprKtGS6ux
	qGnh8rsoZ2UY3wyf1QYn4FLUKrmOOyRx0LIPk/0AuO+2TWYaN2rcnKWG9o9mca/k8f4EEa4dpop
	+
X-Google-Smtp-Source: AGHT+IE/xJqw4SXSQuJCc5///7KaSBqirYeYlFxooMZu8tPDC8bF0vBklOYa9Hhaw+vlLWCEcsXLEQ==
X-Received: by 2002:a05:6359:5181:b0:18b:2802:917 with SMTP id od1-20020a056359518100b0018b28020917mr1294641rwb.30.1713946831218;
        Wed, 24 Apr 2024 01:20:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 3/4] livepatch: refuse to resolve symbols that belong to init sections
Date: Wed, 24 Apr 2024 10:19:56 +0200
Message-ID: <20240424081957.34326-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424081957.34326-1-roger.pau@citrix.com>
References: <20240424081957.34326-1-roger.pau@citrix.com>
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
Changes since v3:
 - Print warning message even when using the force option.

Changes since v2:
 - Allow bypassing added check with the force flag.

Changes since v1:
 - Fix off-by-one in range checking.
---
 xen/common/livepatch.c          | 13 ++++++++-----
 xen/common/livepatch_elf.c      | 22 +++++++++++++++++++++-
 xen/include/xen/livepatch_elf.h |  2 +-
 3 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 502e264bc6fe..1afde0281402 100644
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
index 45d73912a3cd..1d0ed8f99bcc 100644
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
@@ -310,6 +311,25 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                     break;
                 }
             }
+
+            /*
+             * Ensure not an init symbol.  Only applicable to Xen symbols, as
+             * livepatch payloads don't have init sections or equivalent.
+             */
+            else if ( st_value >= (uintptr_t)&__init_begin &&
+                      st_value <  (uintptr_t)&__init_end )
+            {
+                printk("%s" LIVEPATCH "%s: symbol %s is in init section%s\n",
+                       force ? XENLOG_WARNING : XENLOG_ERR,
+                       elf->name, elf->sym[i].name,
+                       force ? "" : ", not resolving");
+                if ( !force )
+                {
+                    rc = -ENXIO;
+                    break;
+                }
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


