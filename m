Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441713A9BAE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143090.263932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHL-0001pZ-Kc; Wed, 16 Jun 2021 13:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143090.263932; Wed, 16 Jun 2021 13:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVHL-0001m7-HL; Wed, 16 Jun 2021 13:08:23 +0000
Received: by outflank-mailman (input) for mailman id 143090;
 Wed, 16 Jun 2021 13:08:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1z-0006lZ-1f
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:31 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65af41dd-a6c9-42f1-bf3a-f6f8f41f3654;
 Wed, 16 Jun 2021 12:51:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpetm7
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:40 +0200 (CEST)
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
X-Inumbo-ID: 65af41dd-a6c9-42f1-bf3a-f6f8f41f3654
ARC-Seal: i=1; a=rsa-sha256; t=1623847901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Y7kTzV20Ryphv7nsbuvcPoIymod2LecV5RXqfm85m6o0JAABVhouZMriYYidwcN8EW
    5OgB6B1FrI8ofK6nne/kDnK5IH+Aw2rD5N+mDtWs+5IIiX81F1XfRbjqYc06Z1PpN7C0
    7nr5hAgrKpq2/ffaI3pu7uaOkLdDDFKmLQRkthc9fL+H6mT/PEnOGtnaLBiy5rFNvyqC
    OwQp4gdqSQpQLrdNbgMI9ba0Go1qx41r7lD7DamchIukCS2rJCo4RAAnf37ZCJ8dqM3h
    079Se9Qjr3dB0kkYSAK2NlKjmYhXCSXKQ+NUCXQ1Dc7FiFmxFFA3tReN/O1YYgNQgxFs
    twew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847901;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YoJCymJybJhr3GQavdsstKKb1/Nvxc490XeqP35kyEU=;
    b=IIuwyi298hRmgHzgfUA0RTSK18HEz9PFjl49wvz4GNtijls/hM1T1lViA5ZZ4FomUo
    dwzf6yJII2jbYgU0OH9x/aOuMv8vCzJBXg3V3I4ErpUNHuNU3Kg/37kSVusFe1UMCqPn
    i/Ucnfv1foekWiHBx7o7H/QkYtGRcabBfS37/dp/XxcmwON/xZG2qzpELliypDrye3MO
    SJtgtUYlGbJ3/0w5/1PSMZPQDGemGYO95P+gZTRBlWASmwk7hqqYDl6VZqHpkd0L2Y6Q
    O1DTTCFb1YCzR8dYzNdyW9p8M/TfTWux7d86Of8/EKkmXJGXA1SJntMrL8wgsctgMiLi
    +xTw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847901;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YoJCymJybJhr3GQavdsstKKb1/Nvxc490XeqP35kyEU=;
    b=KrSUsPk9X2uvD0iK5qKfS6WX1d0Oa4/IkJJIXNSKYMb1lfM3Jcb5oz17Lg2wQ+DKBK
    b3IPkUnj0nDY6OEfxPY/ETIXMQEgLZ5VeEyEB7KXOyjsuJ4eXgc+vJ+00in9mq5YjvKj
    V32FvQ666+Mnn8lJDAeGJLZPPSsaTbIwyZWucHpViSoSVWX1AoajBP2uY92DIEGTmofg
    fMSG53R9gDG4pTJkeKkBUc3vnG80eXabYSLyFXwKJct+1LKle9bJ13NVP0cO6Rx2xf5x
    o0g4ubXe+t6ngvjuds5X8u6iCRC/uY/r1ylFnid1Uke7pSPD6d4FUYqM3t63ttJuRewD
    IrUg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210616 16/36] tools: save: move rec_pfns array
Date: Wed, 16 Jun 2021 14:51:09 +0200
Message-Id: <20210616125129.26563-17-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move rec_pfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h |  2 ++
 tools/libs/saverestore/save.c   | 11 +----------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index ae87954364..2950947f1d 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -233,6 +233,8 @@ struct sr_save_arrays {
     int errors[MAX_BATCH_SIZE];
     /* write_batch: iovec[] for writev(). */
     struct iovec iov[MAX_BATCH_SIZE + 4];
+    /* write_batch */
+    uint64_t rec_pfns[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 1a5f3d29ea..0f02988ff9 100644
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

