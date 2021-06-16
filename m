Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5073A9B1C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142948.263686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1X-0002ZN-O1; Wed, 16 Jun 2021 12:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142948.263686; Wed, 16 Jun 2021 12:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1X-0002SG-5O; Wed, 16 Jun 2021 12:52:03 +0000
Received: by outflank-mailman (input) for mailman id 142948;
 Wed, 16 Jun 2021 12:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1V-0006lZ-0M
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:01 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a13aee9a-ffdd-4c72-83ef-ec013995368e;
 Wed, 16 Jun 2021 12:51:43 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpbtly
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:37 +0200 (CEST)
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
X-Inumbo-ID: a13aee9a-ffdd-4c72-83ef-ec013995368e
ARC-Seal: i=1; a=rsa-sha256; t=1623847897; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DYoFmxn0Dtbm+VbaZKlDCbmsImsyeyVIbmdVja/WYH7Yh7b3VxzyV+95Rv/od0I/cz
    yz5v+ihbmp6qtr+klmkkX01fY3hxfjDnHfHy82NnPZkcFtuTgOHOvwxSr3wEgXANEMIL
    9vano6TGgNPAjgJ6A26sqYCTr+FtzFAaLdLlib64ZsvtD8UJGPZ5jWklAtDkf8CqqWgI
    NhVoMJ9ZxY4oM2AKtBImnUrA5r8MOYK3gWUZgRHbM/zThMNEN5eklers7DqmTQ8MqZAh
    LEM+/N/41WuijmQ27TTLid+o5rNMAVqVa5eaTZL/7YYlDv/kPRbLuoJqqRObjVrNsn6d
    6eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847897;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=VuUrMSQO4CJqxpoErSuXThYpl5ESMJog6Ej/du7Jhm8=;
    b=L7BIenlD2gLFJY33mpjNEtwdvigxvmiQu8kcfsKPRIaLNvBAF0MhNd3rn7RaNc4F+S
    Iwk3Iff43fgyXwqIo3e+JG/9f8eoWGSR1QVY44AiV42Tv9mn2D+AALn/110YsgRbJF/7
    HUbWydzTUDZQYMWhV86LHLRjJFdriIlXI5/62DRsel2b3g5ALbiohbzX8yDTbZuG0OYo
    2vjvgVJOSDRCm9nTNlngBefJc0QYwsrXZUPs5wY/HQYYz6WUNXxIkAB/Inb5b/rQkIHS
    prRgL18wVgHo1pcWpKYV8SrWVdQHa3RA/NZtYgotR/OEIhwa3QJdaTW+ax+2iOFnWcud
    Bu6g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847897;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=VuUrMSQO4CJqxpoErSuXThYpl5ESMJog6Ej/du7Jhm8=;
    b=fgVuiq6lNo14eMaaSHNN964UZYKMmBml6lOvEjdDo157lZMXSwttn3KdVtF/ybsVr0
    V/1rNHX9ojTlroR5uczwa5SglFU2HT0cvO3VTN+xnF/kXb7/v3Y86wkExfAhM49LTU44
    naNCWgKSBgJqtYDjrzEzsPXh7BQnPXNELk2GhIN2qANRGy8XPKq9k/ZlUsPRcwo/WN43
    HnpOfBzpqr30GsKcBchylGKkbEgiaYju/NEaAGwGZhg4uZorNoAKz0yELULez/AUL/dQ
    Aa8yILmfNI6g5c4dDmOLKZ3c+S7OQZL7cJpgOAwgErSZoQVwo3IeahqISgUuZWtQ1tGA
    yZ1w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 09/36] tools: unify type checking for data pfns in migration stream
Date: Wed, 16 Jun 2021 14:51:02 +0200
Message-Id: <20210616125129.26563-10-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index c9cc4206e5..08bbe902b9 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -500,6 +500,23 @@ static inline bool sr_is_known_page_type(xen_pfn_t type)
     return ret;
 }
 
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
index 324b9050e2..70c92eaadc 100644
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
index 6f820ea432..12598bd4e2 100644
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

