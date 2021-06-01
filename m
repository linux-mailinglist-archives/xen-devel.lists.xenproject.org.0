Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2D3977AE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135001.251152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zz-0003xN-I8; Tue, 01 Jun 2021 16:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135001.251152; Tue, 01 Jun 2021 16:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zz-0003ul-1K; Tue, 01 Jun 2021 16:12:11 +0000
Received: by outflank-mailman (input) for mailman id 135001;
 Tue, 01 Jun 2021 16:12:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zw-0005X1-WE
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:09 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f81fd6b4-bf1c-44f2-8abb-fda67d4f1df2;
 Tue, 01 Jun 2021 16:11:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBY1BR
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
X-Inumbo-ID: f81fd6b4-bf1c-44f2-8abb-fda67d4f1df2
ARC-Seal: i=1; a=rsa-sha256; t=1622563895; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GO3QMTQt+1PQdk26evIOQmJRuGWZ+32SI2lYkoj8qbRmKkk1NrTUy+wzUpOONFVLnw
    KkEKVAAInwnepCRZ+sQj8bKk+QyOXZTTXLokE12qjz7M40M38ZRV1uWcYp9QoquE+Agi
    Qn0sUYrTXR49exLojAW154D6BKGwWFlmNPqBLtelADD+sySIVaUgZjU0lBzYW9HEMUdB
    OtNZcmogfjxC0gM3+oLY/B1cj+wL+k+L3FBWHcS22PFL3s0BdcjIUvqrSlq+PN8kB2NY
    ccdHYc5uFS5JOta58Oqwgi8Wa0+54oCzqdZheQXLZz/bi4rtt6Ue7DpUkZPbsvaGOUye
    Qrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563895;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MHTDuRs4KJXGAe1IwzaUM3cPcSsfMCXWpWBD7RHfqcQ=;
    b=oUujeh3ij71G841X2CbWGKoy44B3T2WnsQeioHkz3PBg3S0PdxQH611aIVujvzrMG0
    Jjm1b+Yv6TEPWvjNriLKk1FP1Q0HPpCXu87dXbH3h6DvAEbv9np12AdX/XTWx86KN8Wy
    SNzZvwOcedVzVQ3G5vSWSl8CEIc+SZcMV3AQ9Z1PqzJXFtU0yYRUGGwO0nxiHiVIr2MT
    9cK/1TfRvEtmijw0Cr/9agRs/oa1dPUqPEftRQ8gQ5Wp532nBFF53Iyv0fJur1R5OwB9
    +v9KhZCNQFigNBS7kCzLwT9hbobwKZt5EQ2rPzq46AoYfyZtKaNSo+e7hl0bokvuMkoj
    M9MQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563895;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=MHTDuRs4KJXGAe1IwzaUM3cPcSsfMCXWpWBD7RHfqcQ=;
    b=d1oxsrIGWxW0vEUGvkWomIQ48mfGtUoieX+YZL23ervAaEs2u+g3opolyICVx+cvs5
    jVKNq80IyqWfgXE/ZxU1aYty3h9h0GvJewGqnzwSPTnfu0rkHK14R2frBmNwVgR3vuHk
    Kj/q/LvmKN/YzJckZhATGyEjzOlsVzGQkrzBthtqdUoeVeJl3JJr1kqhI49wEYvXf/Nm
    hKva6W1YFgOL6p8Ikbq00Pp+PdUzT3dxopRat/m3yWKh0RJ/o9HgDem8EJIpFbvS1jwA
    n1/kPRGufXzY3ArMcHxNgYAqLIjMdZj4QKp1OaOnTke5rLXNJ+StHBf6JL6KSaaqj37n
    tZ4Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 22/38] tools/guest: restore: move mfns array in populate_pfns
Date: Tue,  1 Jun 2021 18:11:02 +0200
Message-Id: <20210601161118.18986-23-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns mfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index cea549d129..6ed213e14f 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -242,6 +242,8 @@ struct xc_sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    /* populate_pfns */
+    xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index b534d80cbc..2ab9f792ef 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -138,12 +138,12 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
+    xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
         *pfns = malloc(count * sizeof(*pfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !mfns || !pfns )
+    if ( !pfns )
     {
         ERROR("Failed to allocate %zu bytes for populating the physmap",
               2 * count * sizeof(*mfns));
@@ -191,7 +191,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
  err:
     free(pfns);
-    free(mfns);
 
     return rc;
 }

