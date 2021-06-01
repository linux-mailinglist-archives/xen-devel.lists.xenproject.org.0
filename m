Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4C39779B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134982.251022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zV-0006W0-BO; Tue, 01 Jun 2021 16:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134982.251022; Tue, 01 Jun 2021 16:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zV-0006Rp-6i; Tue, 01 Jun 2021 16:11:41 +0000
Received: by outflank-mailman (input) for mailman id 134982;
 Tue, 01 Jun 2021 16:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zS-0005X1-VV
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:39 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 634c5233-a18d-4ebb-9836-a0592a04f72c;
 Tue, 01 Jun 2021 16:11:33 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBS1BC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:28 +0200 (CEST)
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
X-Inumbo-ID: 634c5233-a18d-4ebb-9836-a0592a04f72c
ARC-Seal: i=1; a=rsa-sha256; t=1622563888; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=H8lJPq/K477YKdql0qIATRzz7uyTOc6B28Ae8wq/QXQHwmHhuuI+ZHR1jvElGTWjYV
    eM7B8be88v9B8z8grOxNUJf2YuyvD4bmjf+XRmHwaEUmMTU1zlbOwz5YLshzxDIcGPLy
    wIQ1F0eupzLwDA+IhtyK78bixDxiEeAEnmXjV6Y+S/OctdupEY2ejYaf+vYHR3A9RUyq
    LD8AHSVjS+/veeZV1BbSOS5fr5DfRCTDIkZFr/lSie14xSuTSbX5kRsicP/w5yjQFPRs
    tS/GWzShpP34YCik9znfhQ2D9QLH81nfeuqpmjfXYhHWRk0nvhbyapxMz1gnqO3Sz1Ov
    PPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563888;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sTwQgwZm9rWRjmRsqDvzAs56CeWxNcqTtl2Vld2f57Q=;
    b=C6+utwmof9OOi4xjLK2eK3ZNkf7VrIebRVjGqdisVPh9ofzjJpJC56r0cNLUdQp6bP
    vZNS3sevpo+5eQWncU7OHHrWfY1xGdAIyaaH/PzieZlf1GiVNaB7hGRTr0fcIEyFG2SZ
    OHXcc2ARFfviE5zwtNi2lY1xmaajinr/MBYZe4kRsOhG+e79zFatl0dcgKZWGmJ6FWYc
    kdXaqIOa36qjmQkBfBZY0jVHdmCJovzjaHVKRvQIU8CMJFhMzXR2iVirEtFlZb8WTlLr
    tz3+fQZtM+LcEzagdGuqBxnFmYQgYq6M6CaDJ66VxT7qo5y8SY35vDeXLQJNXuJgS2VW
    p6lg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563888;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=sTwQgwZm9rWRjmRsqDvzAs56CeWxNcqTtl2Vld2f57Q=;
    b=KB6pKtR4ZTfiqdk49MNfSbkAa7AWVIrl1ZMbYq/HM7amcx5uEK6E4YI5YovRWFau6m
    TdnCuuwI7/4YtBtUdZT0XB8pehAwaoY0EPrO7lXtutGIg4aVt653oEtqZbUsjDNgrQhk
    N2N2aIo7VTgxjbOPX5TMWnLEkVcjv7OeGPNn0pscYMxqk0Vgv5yVkMdxsaIuJui8U/dd
    ZLaaKBW1Di1H17/05oTLG6M3cD39YDrqz8D0jFnATmqazbBa/v77JIowK1KK4XL9wXUD
    FkhZaeiLfvvnBtNoV2CFPO8zYPGPWx71Q+Pe8byGRdNYyM+1W8SNxMFyHdqexOTCfw1C
    YrFQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 07/38] tools: unify type checking for data pfns in migration stream
Date: Tue,  1 Jun 2021 18:10:47 +0200
Message-Id: <20210601161118.18986-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper which decides if a given pfn type has data
for the migration stream.

No change in behavior intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 17 ++++++++++++++++
 tools/libs/saverestore/restore.c | 34 +++++---------------------------
 tools/libs/saverestore/save.c    | 14 ++-----------
 3 files changed, 24 insertions(+), 41 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 36946e5d48..50a8479d39 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -467,6 +467,23 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
+static inline bool page_type_has_stream_data(uint32_t type)
+{
+    bool ret;
+
+    switch (type)
+    {
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        ret = false;
+        break;
+    default:
+        ret = true;
+        break;
+    }
+    return ret;
+}
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index cccb0dcb71..700f9e74b5 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
-        if ( (!types || (types &&
-                         (types[i] != XEN_DOMCTL_PFINFO_XTAB &&
-                          types[i] != XEN_DOMCTL_PFINFO_BROKEN))) &&
+        if ( (!types ||
+              (types && page_type_has_stream_data(types[i]) == true)) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
             rc = pfn_set_populated(ctx, original_pfns[i]);
@@ -233,25 +232,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     {
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_NOTAB:
-
-        case XEN_DOMCTL_PFINFO_L1TAB:
-        case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L2TAB:
-        case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L3TAB:
-        case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L4TAB:
-        case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
+        if ( page_type_has_stream_data(types[i]) == true )
             mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
-            break;
-        }
     }
 
     /* Nothing to do? */
@@ -271,14 +253,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0, j = 0; i < count; ++i )
     {
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_XTAB:
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-            /* No page data to deal with. */
+        if ( page_type_has_stream_data(types[i]) == false )
             continue;
-        }
 
         if ( map_errs[j] )
         {
@@ -413,7 +389,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
             goto err;
         }
 
-        if ( type < XEN_DOMCTL_PFINFO_BROKEN )
+        if ( page_type_has_stream_data(type) == true )
             /* NOTAB and all L1 through L4 tables (including pinned) should
              * have a page worth of data in the record. */
             pages_of_data++;
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 8d449ee0ae..bcff2d28f5 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -153,13 +153,8 @@ static int write_batch(struct xc_sr_context *ctx)
             goto err;
         }
 
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-        case XEN_DOMCTL_PFINFO_XTAB:
+        if ( page_type_has_stream_data(types[i]) == false )
             continue;
-        }
 
         mfns[nr_pages++] = mfns[i];
     }
@@ -177,13 +172,8 @@ static int write_batch(struct xc_sr_context *ctx)
 
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
-            switch ( types[i] )
-            {
-            case XEN_DOMCTL_PFINFO_BROKEN:
-            case XEN_DOMCTL_PFINFO_XALLOC:
-            case XEN_DOMCTL_PFINFO_XTAB:
+            if ( page_type_has_stream_data(types[i]) == false )
                 continue;
-            }
 
             if ( errors[p] )
             {

