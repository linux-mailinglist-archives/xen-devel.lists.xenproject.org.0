Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDF3977A8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134994.251107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zp-0001Ye-7C; Tue, 01 Jun 2021 16:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134994.251107; Tue, 01 Jun 2021 16:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zo-0001LY-UB; Tue, 01 Jun 2021 16:12:00 +0000
Received: by outflank-mailman (input) for mailman id 134994;
 Tue, 01 Jun 2021 16:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zm-0005X1-Vx
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:11:59 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6934594f-8962-4454-8048-10c9b500185c;
 Tue, 01 Jun 2021 16:11:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBY1BP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:34 +0200 (CEST)
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
X-Inumbo-ID: 6934594f-8962-4454-8048-10c9b500185c
ARC-Seal: i=1; a=rsa-sha256; t=1622563894; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ClxwDl0qOSDjoIzNwbzCmJ4ADXloUwbcJ7wlHM4iM61l6JqODFCZZpqcu0/GlNFtlG
    5oA2jSfzWBMYdDDzvhd3lnaUbTHRVkTFASjvrgWoXjHxyBLaXavo/dcy3Cl1KKGpfRwa
    6t240vWP1WoA+vo0e/qyvLEoJCqXumv1FMIpvN7F6F/xFhtb4lS0FM/Q2dK+bwxgH44M
    HG4dud/1aqI7dpg0Lp5tO4CYltpEK0jqmgTkRZ3ErK8vc8LRIwB60FsntryBmVe6sRvK
    DwT9ikobnc+pdygCRehXCwJU2aWA0mpVU+tady/FNC63CQYB2hvwic+r8nmyhQ9xEgz6
    9nKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563894;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z4yh0601yitxQDA4KYzEdbnjeAj2W9nnPiW8js19Yoc=;
    b=tRhf971bAx8V7lliMKUwnmZnrWq10x1IewtiX9BIroszIi5zpyi9whPdppL+JfkjWh
    48m1XweFg1qyXLA++7UWS6rAierRXtXnKrY/0X4250XBEqxd9y13pBuViuPEqz9wc9lv
    1GOQh10dVz9lVYEZsR2K2dJA1hU6XoquqN9Pkexf3heRUUqE4rOFndz10ooMqqwKvmXR
    Yq4Nsc8l0Ne2n6e49UJktQOK+b4qCX6j4IFEBjGdrLJZiI34aw1P2hZHSe7h/FGE+sAl
    GHGTFexX7BV9by0Xn5jz71OeoBzZbW0BEZSS7mz0xLL9nDgHGNJS631r1ue1yZdQG4Wb
    4Hrw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563894;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z4yh0601yitxQDA4KYzEdbnjeAj2W9nnPiW8js19Yoc=;
    b=JL0R7wiQcmcqwYI3HwBz4r03ZaCVbE7XBGrVZIHr49HwKasO7txilGAoztHfqC/8Za
    fbrsr0orj2xYnTaByMb4rQqkb3KnydVeOKdhvFV9xzNVPFM6QoqJowWvTSqPkSq2StxM
    xKAq3fwBOCVknK6+1S14D3+RLEIwviAlTl+gIYjN3rkj9F/jVOqAeOYSmgBCCwtJEKU9
    zTF0zC8IdF+lSl2B17vPfcVeZpwDCqQpjddYhQOZIYDWy9kMkLodPhKjp5KiGSL685WF
    rnZ5/qcRV1+ptvuhFxLCdaTK14i0Dhu/ZhlRB1p3x137VvJ1p6DOmIqNLI02+9TNx0+2
    3RcA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 20/38] tools/guest: restore: move mfns array
Date: Tue,  1 Jun 2021 18:11:00 +0200
Message-Id: <20210601161118.18986-21-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 96cd60e0d6..c7291bb5ca 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -239,6 +239,8 @@ struct xc_sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
     uint32_t types[MAX_BATCH_SIZE];
+    /* process_page_data */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 815a2d5a12..aadf322428 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -205,7 +205,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
                              xen_pfn_t *pfns, uint32_t *types, void *page_data)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
+    xen_pfn_t *mfns = ctx->restore.m->mfns;
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
@@ -213,7 +213,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !mfns || !map_errs )
+    if ( !map_errs )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
@@ -299,7 +299,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
     free(map_errs);
-    free(mfns);
 
     return rc;
 }

