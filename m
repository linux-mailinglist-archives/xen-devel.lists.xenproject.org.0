Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B853B9028
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148371.274344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRs-0004ce-V1; Thu, 01 Jul 2021 09:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148371.274344; Thu, 01 Jul 2021 09:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRs-0004PF-N3; Thu, 01 Jul 2021 09:57:32 +0000
Received: by outflank-mailman (input) for mailman id 148371;
 Thu, 01 Jul 2021 09:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRq-0004XT-Sn
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:30 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e4898ce-ebf0-4c88-89ea-58c01de1f9ad;
 Thu, 01 Jul 2021 09:56:51 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uj5Mv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:45 +0200 (CEST)
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
X-Inumbo-ID: 8e4898ce-ebf0-4c88-89ea-58c01de1f9ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133405;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=GgpmM75SuN6FuifeSB8D7d7fIQ+maSMtt/6dbwwV1Ko=;
    b=fiU5zy87RwXUPFQisX2pONK2at9yvFQtBp4h+9vdYhCJe+SDgRUQXXk+jxeGclFdqd
    Ev2LkmLKf+hBiwswf4p6m1UocGilzfNq+eBXul8GlnD3tJWgjyH/+kEmDoWYxezduoTK
    CgAiWo/H73nDfl4vEdBQL/9mwk1YrznITa/wIbO7lEFxg8M4Y2M2MjirFLgVM5KHavnD
    o6hXDTKFpCQCA1/rR+MXQhWjIDDh4rJFu8I2L2Yj/mnCcTiDu0OVAI+SlScDm0hgsPM1
    V0sAhTynfn9HTOUc/kLsT/4Nia9xhWLPZLdRWlwHfM1TNqpUmW8d9jFfjBD7/s7720hk
    yd6g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 13/40] tools: unify type checking for data pfns in migration stream
Date: Thu,  1 Jul 2021 11:56:08 +0200
Message-Id: <20210701095635.15648-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper which decides if a given pfn type has data
in the migration stream.

No change in behavior intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 18 ++++++++++++++++++
 tools/libs/saverestore/restore.c | 29 +++--------------------------
 tools/libs/saverestore/save.c    | 14 ++------------
 3 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index fa242e808d..905b4078f6 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -517,6 +517,24 @@ static inline bool page_type_to_populate(uint32_t type)
     }
     return ret;
 }
+
+static inline bool page_type_has_stream_data(uint32_t type)
+{
+    bool ret;
+
+    switch (type)
+    {
+    case XEN_DOMCTL_PFINFO_BROKEN:
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    case XEN_DOMCTL_PFINFO_XTAB:
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
index 477b7527a1..799170c7a1 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -232,25 +232,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
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
@@ -270,14 +253,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
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
@@ -412,7 +389,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
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

