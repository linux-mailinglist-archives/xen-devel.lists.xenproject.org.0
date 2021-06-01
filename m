Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B93977C2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135036.251264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71e-0003V4-8K; Tue, 01 Jun 2021 16:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135036.251264; Tue, 01 Jun 2021 16:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71e-0003RG-1n; Tue, 01 Jun 2021 16:13:54 +0000
Received: by outflank-mailman (input) for mailman id 135036;
 Tue, 01 Jun 2021 16:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo706-0005Ec-2L
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:18 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be339adb-dd1c-4964-8c19-30734b5a23c9;
 Tue, 01 Jun 2021 16:11:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBW1BL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:32 +0200 (CEST)
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
X-Inumbo-ID: be339adb-dd1c-4964-8c19-30734b5a23c9
ARC-Seal: i=1; a=rsa-sha256; t=1622563892; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nJcQYmO6JnmLStShMuTZQonJW5TWgz38m7lw0d/r/IqhqEV2gKDq9WZAJNkYtU/XSf
    eYyhmN6HJBIsX724ecE3F0P8Z7koT/VKw+jZQdB4H+n3jUS3o4niHB+jEaBdSbgoi8Yd
    XC3mC9XKLMMDTsphTsnOw8iA8cZC3upIcCjKn+sKFUs+LYk9nP1YugRuPRIbybwCu3mD
    nrgGWnwn63YGL0tWo774GMfJAI4C31sBbuRkLCv3FXbfIjouI+GsyeY2l7+T5oWiEBgS
    Uf39W9IzR88idjE1m2JX/nW1ki9Gd0CZVZqfqc69dnDCzRlGlr+ZXw4D26tYQzzEzUho
    rsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563892;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=g1Kh05gVx9V+bsfHm/5UnEfyde3/5C+vW/1l/cFLlB4=;
    b=s3dv8RdGvOGeCiV5xxKydBo1IbVjzseWzGCzyT8acdVIbcoK7RNzB667vBy2yGDpfp
    89BmgTIJ9mPZWdetQoHaQl4SoPgp5u3DWstQkkz6T3m0nVYZkeiD2mm6XSpuZHcFU5SR
    iNs0CDjf8fv9DT/5u+gWQLILZa4q4DqWT5zSRQ4ua02JcbVZmoC20PlI6pCIyULi7Dvn
    zJElbnLCraXVAmoFCWhRsfxORfqjLSgS6e+7rxyqLy1mXVPYeeE40v/LbVOr0YSCSfO7
    hLmFFvA25HXZwfj7tqoD4ib5b+8m9zbHZ4TeR6OTdSKW+bG5c711hIQ+npu/pp7E7IBf
    pphQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563892;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=g1Kh05gVx9V+bsfHm/5UnEfyde3/5C+vW/1l/cFLlB4=;
    b=jhGd+n8lCtV8YEc926r5Ve7N+wO2Yxb2jBOXUezA4E7pFOGtvqMr7tHK0JrDnsGVPB
    fqGeClsc90b6TzarLUpFj2E6OMw+GKxHjTzSi7+LqGVD6dPmE/fyoAn8oFP3H5897b5f
    U/fmnS27fNRulyB5izkZH9atT66SUjMyXIp89ylsdI+wGAs5p+Ku4RA+1zESwl8Z1G0u
    g/vKk/yrmI/QHZYmWmsuG7xrKSFZA2a1AOjAmb370VcTTgO+F4I/MTYYbiYjfmhoITlN
    iTXrFOtlXuGIgfF1dC3vMscb0r+aS5azW/D7DDOjl0wVRLLyjDNjwGU4AIaCVojNQTGY
    k6CQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 16/38] tools/guest: save: move guest_data array
Date: Tue,  1 Jun 2021 18:10:56 +0200
Message-Id: <20210601161118.18986-17-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move guest_data array into preallocated space.

Because this was allocated with calloc:
Adjust the loop to clear unused entries as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 6a2f266469..098aa39667 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -235,6 +235,8 @@ struct xc_sr_save_arrays {
     struct iovec iov[MAX_BATCH_SIZE + 4];
     /* write_batch */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Pointers to page data to send. Mapped gfns or local allocations. */
+    void *guest_data[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index ba8046b530..c4fd9a15f0 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -90,7 +90,7 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
+    void **guest_data = ctx->save.m->guest_data;
     void **local_pages = NULL;
     int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -105,12 +105,10 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
 
-    if ( !guest_data || !local_pages )
+    if ( !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -166,7 +164,10 @@ static int write_batch(struct xc_sr_context *ctx)
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
             if ( page_type_has_stream_data(types[i]) == false )
+            {
+                guest_data[i] = NULL;
                 continue;
+            }
 
             if ( errors[p] )
             {
@@ -183,6 +184,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
+                guest_data[i] = NULL;
                 if ( rc == -1 && errno == EAGAIN )
                 {
                     set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
@@ -256,7 +258,6 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
     free(local_pages);
-    free(guest_data);
 
     return rc;
 }

