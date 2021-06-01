Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12F3977AB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134996.251122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zs-0002Ke-Og; Tue, 01 Jun 2021 16:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134996.251122; Tue, 01 Jun 2021 16:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zs-0002Fn-FN; Tue, 01 Jun 2021 16:12:04 +0000
Received: by outflank-mailman (input) for mailman id 134996;
 Tue, 01 Jun 2021 16:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zr-0005Ec-1g
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:03 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c456e689-f8e7-4608-a313-5ae1a4025123;
 Tue, 01 Jun 2021 16:11:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBV1BI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:31 +0200 (CEST)
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
X-Inumbo-ID: c456e689-f8e7-4608-a313-5ae1a4025123
ARC-Seal: i=1; a=rsa-sha256; t=1622563891; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LCJtyMR+Zgd7W9rxsbxtC58x5DfEqpSITeFdBdbnYt4fP5IZM6iO61a5JCg+irtKtN
    WF8XQtNF/OaWj6lSX7ugEy9guiW6JR4O94cMSSlJUQhDGZ3OP0PTpsPwEdMtZ8VmDI2r
    Ed9b3gCHYbq3hH1qAhtFLlPuPQVr5A1PrrG66MlKkrH87v3zgeEQOCtBt94mDb3e4jIa
    hbD+kZNaMF2Ix8BEhjmoe/JyS7jEXSYCrC1o0iWeAnjRp+KhxLidp8JX0PYOSMAgnG9c
    FyUNV4og2SgLVQj4v211CNDBBsD6N1GDIGABj/Tb3y+IPC5ukaMF4vUP1aKWJ1bKgAAY
    P6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563891;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1Vlq702zoBkp5PCmpnAeHRVWBwGGiYV8RLsu7fpX0qA=;
    b=jbQ28FbpZshSCLQxBf2YVYZKWlfJQNtSvqQz9GWFU1unQnx11tq3ODYUqT26XjAAC6
    +bIyj4IxL0vdH5I/W9uSsG6HIJq4GkqondTs5j12K8ressIjv1boHQ+UxhFXTILZXfNK
    3BTnKDb6ntItpXfLrM4PSroAB4dAFWvs6GdlH/7Fvuy3evm+rEmRiD/Aa6UPuPeiYsT9
    GvAS/z6VBJzfTkulBz7doXRyhFKtzx4xoJCUGEBrSh4SBPOm15x5VHo4EcMHtHCh9+x+
    r0ZBkT8SotrGgADOvN7BzyYUX7MGRquG4xVNvimOOaeF3v3oQNr6Vy/SBuqJU0Bkf3AP
    6tJw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563891;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=1Vlq702zoBkp5PCmpnAeHRVWBwGGiYV8RLsu7fpX0qA=;
    b=NQ3hEjfyFg2Fe5DZfbqXwhRCjwdZDgKX+fBM2hPIRF7TkVeFsAD4FKQ3HANlaDTW3T
    9QfHm+knoTz8as5wuOjsn99kFxk4CDLtnmo5W9x26Wn1hq1maCxVDMRwBWvKcC5n47BY
    Egi/WhJT/ziSg0OXsPqPk5UGsiN89zInoibcmL6ljx/orY+0PLaEqUHz+GoeOL5vO7Mr
    2bSdv+MT/NwJC4Ya8a+P9Po3sItrOJQOb3qLUmbv4NfqocohCU/m59PrOAJFT4/5WjiB
    bE/imqAhGepO8tu6gzdHJHFVUoBT/+CbHYQ6s2x1uRcJYNDkLtNVVqVIx0FrKhZqcXcH
    en6A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 13/38] tools/guest: save: move errors array
Date: Tue,  1 Jun 2021 18:10:53 +0200
Message-Id: <20210601161118.18986-14-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move errors array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 81d4a79b13..07dfa7d57d 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -229,6 +229,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     /* write_batch: Types of the batch pfns. */
     xen_pfn_t types[MAX_BATCH_SIZE];
+    /* write_batch: Errors from attempting to map the gfns. */
+    int errors[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index be65286570..5033f18bef 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -92,7 +92,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    int *errors = ctx->save.m->errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
@@ -114,7 +112,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !errors || !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -271,7 +269,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(iov);
     free(local_pages);
     free(guest_data);
-    free(errors);
 
     return rc;
 }

