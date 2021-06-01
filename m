Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7B3977AD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135000.251143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zx-0003dG-RO; Tue, 01 Jun 2021 16:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135000.251143; Tue, 01 Jun 2021 16:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6zx-0003XJ-Lb; Tue, 01 Jun 2021 16:12:09 +0000
Received: by outflank-mailman (input) for mailman id 135000;
 Tue, 01 Jun 2021 16:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo6zw-0005Ec-1n
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:08 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72e4c8e8-9b99-499b-92c8-dc20ae7426e6;
 Tue, 01 Jun 2021 16:11:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBV1BJ
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
X-Inumbo-ID: 72e4c8e8-9b99-499b-92c8-dc20ae7426e6
ARC-Seal: i=1; a=rsa-sha256; t=1622563891; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Xd7pOeVIiHYXGHD5gRxZOQBgSiSriTJtjfkH69uEPdEq+Nd1KZVpseWUuk97WuPxI1
    qMRegzQl14wS6ijxza1EykXP/NXS714hp2STDA6QpEc6rD5hJuwbl3R7UKHQWH7Azusa
    C+wtWvtN1St4gDsTIg8KTa9Pi3vrpxL8lH1eSryoVSyDKldVJxGtIG9f78eZdTqOKuEI
    8tYccyi/9BvOKkijUOB0irNLd3P/pz8VnqzTMkDNjuVpr7TPAmjtPi89Iknum9aROedD
    3QEYjzmx7IZuMlJ9Pzt3ynOhYKKW6k9aNTGAULanPz+gfGYQnqET+TWastQ2rJ/0PRoA
    q6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563891;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kIq3yzkr1orG0VWk81XmidxQ5pZTMt5qbdvFQWlb7zs=;
    b=UtyPia57fROHf4uKw/IvvaBpuizNrkgb0xR9uBnPu8azM4Y9z+LMDd2yPY9Rv1DqlP
    dVvfQAv1P37lX8P/lugVi81UjUGredLIj1wrEKzmDrlJnFFjpzfPOovx5KfGHuJf6/Og
    1DVdu56tVECjja2o7b/0HusynbosHL5R8qzR+0IfOjbFje+/6E7fMrZhf9SXbNife8pE
    Kzy7fEh07yg65khvuG+LPfPGZAGeJLj19622yk7b3szhI++W3uFZPcoJS2zqb4vFTL+B
    HWsaFbVbIKcMMtUyvWlXqUMD9YLFz7scioMxWwZA8B3Kmta3oPwkYeQZtm7sOqcN+OP2
    tJPw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563891;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kIq3yzkr1orG0VWk81XmidxQ5pZTMt5qbdvFQWlb7zs=;
    b=gDsYGPfPJiR94MM2OVSIHEQY6FxEfWz1Yq9YOXSQ9rDhfFqhTXykv6A1tSFfDcIDVl
    J2g/szHtGlFD1FTmbZjNTOqwsOpkgwysc8x314SwZDDgF3+B3oYTRbVqE3NYtFU/nnQ0
    Ob+gb0DfEk525bhm/NXrkpXo8tpNk4YMjJEempP7HIw5jeC6RqURk1TRCMxqHG6NkINd
    QQUW5YZUsEIJD/tqdby4ixmx+bwBcMCSSA0V9LbiZX+D7oBpO9KTUMHGVbJjkgM1XNO/
    uRMqm6KQ+ymlB5nUrUGDo4DSl/DAxcZZ56QESw/G999enAO9SDxGS7qwyHv/IQ5jvdcv
    BGsg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 14/38] tools/guest: save: move iov array
Date: Tue,  1 Jun 2021 18:10:54 +0200
Message-Id: <20210601161118.18986-15-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move iov array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 07dfa7d57d..b3294e79af 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -231,6 +231,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t types[MAX_BATCH_SIZE];
     /* write_batch: Errors from attempting to map the gfns. */
     int errors[MAX_BATCH_SIZE];
+    /* write_batch: iovec[] for writev(). */
+    struct iovec iov[MAX_BATCH_SIZE + 4];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 5033f18bef..1d9e55afe8 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -97,7 +97,7 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    struct iovec *iov = ctx->save.m->iov; int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
         .type = REC_TYPE_PAGE_DATA,
@@ -109,10 +109,8 @@ static int write_batch(struct xc_sr_context *ctx)
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
-    /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -266,7 +264,6 @@ static int write_batch(struct xc_sr_context *ctx)
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
-    free(iov);
     free(local_pages);
     free(guest_data);
 

