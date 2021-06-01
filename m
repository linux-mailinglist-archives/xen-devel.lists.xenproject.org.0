Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B283977AF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135004.251166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo703-0004mN-0g; Tue, 01 Jun 2021 16:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135004.251166; Tue, 01 Jun 2021 16:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo702-0004jJ-PO; Tue, 01 Jun 2021 16:12:14 +0000
Received: by outflank-mailman (input) for mailman id 135004;
 Tue, 01 Jun 2021 16:12:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo701-0005Ec-1y
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:13 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c478b9f-60b0-4b75-9873-757c55e8a7d0;
 Tue, 01 Jun 2021 16:11:36 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBV1BK
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
X-Inumbo-ID: 6c478b9f-60b0-4b75-9873-757c55e8a7d0
ARC-Seal: i=1; a=rsa-sha256; t=1622563892; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PfsEkPMGS+5tPzW4MpLS4b5cQT/mvpFrBoxLm5VNSVORaH7Jw7/RTMsrI2WRYVOtiF
    y2l8e9TSu1ykKVsd8PLopUW8TJm1oRPVaEIb4Y98rxmjmVHWmN3+YDLPf6mBVmr+gzrM
    aug2asGY0xM/8T3tEflKxKeKLeICjFCs+gGOU3naJsFTJs7RwvxANiR1pltU2F9hYoXs
    t+U67JjJ4Djq7ZjUvsYlQPCibe69wnN6nq1jq/oSoT4uXAiKLf3XpxekLghXdwNbB8lA
    IWyhxl+qrK0LjeVK/fbBOoc+u0EWtO9S8yP9jd8tz3wCPVDmW5n6SxOulL5iBi9t/vP1
    qILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563892;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3eJ8lfkM75YdRBwLz3IvZoNgnQXSN5j9vpY7FzwJfSQ=;
    b=PBFVi+mK0hxstPCEJ4VhRAjU21GlGzuN+SL++kGQ/i2BDcF/NfOW2Zsy3wsKFevozm
    o4kY2J/Avt2CWLPjOaLSDmdm17jyFDcBdbKGaD9WAwcDma/4ho4XGQyMuS6jsvRyaI3N
    Ta/4iLKMo0NAGLSyEpckb/ZVS1/NcJR0fQwyucnYiAFJL+uAWo063RuwiuV7fCDl9ZwD
    uKn5K9niilZV6BIkjqvujNtL389HLKKmVH4LyqQ6u6pGqn/MjPKgxIyekIIcd/tYs1WA
    q7HOMX2DHXg3YZ73w8EIU6oW3VFZkWWgjCKYiOq4or/zygr4dI2BNtWFBdivBL972paw
    Outw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563892;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=3eJ8lfkM75YdRBwLz3IvZoNgnQXSN5j9vpY7FzwJfSQ=;
    b=BVfMlPG3S1pF1bPhA5sQHrRPoE/6HsSYf91H0qpFO6TenKzmlcmNlWQZxgoaNC8j0m
    mcGTbchP62wspXpYSY6OtY9HgOUbsK7KAFsIqy0G7oN6XtECFCwlJ8nF/LxW/mkOg9SL
    DTqsAlvt7C/Nw3H2fbilYxL9ajdwTKEbKMlJa+esA/8xW492zYZ88HD1eOTOlKtQGGbJ
    KnRPw1KGLTLI9t2M6BdLUUBUyAvxP7UhmRvHTW2LU5ir+QGfzxt7KwKhWvyUUxwkGMKo
    Qx8088QqIPSHN96IQBSL7PQgUK04uBGFS7MJHTFftmTa0Z2tWjcQf+LeJzROH1eG/vNp
    yV0w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 15/38] tools/guest: save: move rec_pfns array
Date: Tue,  1 Jun 2021 18:10:55 +0200
Message-Id: <20210601161118.18986-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move rec_pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 11 +----------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index b3294e79af..6a2f266469 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -233,6 +233,8 @@ struct xc_sr_save_arrays {
     int errors[MAX_BATCH_SIZE];
     /* write_batch: iovec[] for writev(). */
     struct iovec iov[MAX_BATCH_SIZE + 4];
+    /* write_batch */
+    uint64_t rec_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 1d9e55afe8..ba8046b530 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -96,7 +96,7 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
+    uint64_t *rec_pfns = ctx->save.m->rec_pfns;
     struct iovec *iov = ctx->save.m->iov; int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
@@ -201,14 +201,6 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-    if ( !rec_pfns )
-    {
-        ERROR("Unable to allocate %zu bytes of memory for page data pfn list",
-              nr_pfns * sizeof(*rec_pfns));
-        goto err;
-    }
-
     hdr.count = nr_pfns;
 
     rec.length = sizeof(hdr);
@@ -259,7 +251,6 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    free(rec_pfns);
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )

