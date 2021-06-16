Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A13A9B1D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142949.263702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1b-0003Yw-EZ; Wed, 16 Jun 2021 12:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142949.263702; Wed, 16 Jun 2021 12:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV1b-0003Sk-18; Wed, 16 Jun 2021 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 142949;
 Wed, 16 Jun 2021 12:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV1Z-00075D-82
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:05 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 440b148c-5a47-47e7-8268-4fec67cd4e3c;
 Wed, 16 Jun 2021 12:51:48 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpgtmC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:42 +0200 (CEST)
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
X-Inumbo-ID: 440b148c-5a47-47e7-8268-4fec67cd4e3c
ARC-Seal: i=1; a=rsa-sha256; t=1623847903; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=opDqhO4a1Vq4ddVcj+k8tqaWyd7iEl35jDu6mAo2Qt4tu3vXYHrlskuG3lPRYff0ov
    y443MOvX2wXF0kBESl9kaSX8E/AF7MORqBMUI2k0vhRoSUnqrzB09kJ3F+y7YG7LhZ3o
    g0frzi7M7n7ZEhoqv3SccUbu1XdjqdvuS9taPrW3zCAJ/c0BXG0XJ7dU8fQq9S5/ZaEl
    4LJBD/B7XnT8w8kRlGdf3ozpGAu8cLr9nzTxqSFqvO9FKRS5rIQVfdi6WSx7rnqQWVrc
    RAGbuHfYazO1mmNG8JeWeb+JxeM2AqHnxL/uMXS1CeTRPwaV39GFpFVR6Z4WNNtudfQ6
    HCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Nst2DxeDxoQRaBpmHCGwCg/XwLbUQH8n2F7XGaSzYSY=;
    b=THuKMd0uiY8blfLD/vzBCt8CiQ7ynxcB7hOV8Oxqi8BWA7HBC3wUB7Kl7Z1sdXrzM0
    DWYoQvThi6ZX0oD/Yhjwi8w9huvWWniZP73zhjlvzG0vcErO9ANjbQyEDm86iZ6LDmtM
    7ZaI4Aq+d4RowYfo5U8oNd0kOd2i+felN+y7zJWEsXFAYaF+pTUGvRmG8dKdwq3R83Fk
    Xfs8mErtxq5Jx48BYee3841s/5wrSkzDl2U8Gc8qZ7NxmMdhL5JLXPDxSaqSMahq0Axt
    kbEBe1sYMKXH6P6gI2PasDzOlx9o3Zv1qMmXHSwHkHR8grFF2cFQworQ6GR8QvAGDvvu
    mweQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847903;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Nst2DxeDxoQRaBpmHCGwCg/XwLbUQH8n2F7XGaSzYSY=;
    b=tX+SlobqcYRUw8DVNaMA6Zdbbft4TT8fAIUkIPGgXORmYpajCecrKedu0kgLaOCfds
    nKCIO6rQo2jOj2NwcV0xTUF08Rh6GKXcGFyYQdP6FgmgNWIsxSulJH2gwjtprAPSCqee
    ia8rlaZbuMoqapjc6ahFsXkBrKDqgjSnb4snFm0x80hoMN9ptzziYn2KREpVfmoYY/JH
    HDUa33N6zy4VAaGjArJuY1/BccqjgYIa888jm88kcXm/LaUtpgcVmCeC+l+8BNyGyELp
    McljlGSAN26T8QNOvwXKPYQDtf/T7URtuTQx0gByye+vSJ9/aSoyeCLlAN0A51UJk5XX
    +kmA==
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
Subject: [PATCH v20210616 20/36] tools: restore: move mfns array
Date: Wed, 16 Jun 2021 14:51:13 +0200
Message-Id: <20210616125129.26563-21-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h  | 2 ++
 tools/libs/saverestore/restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index fe44302eac..54352f5427 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -239,6 +239,8 @@ struct sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
     uint32_t types[MAX_BATCH_SIZE];
+    /* process_page_data */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index d460a2b2b5..1a7cfbcd47 100644
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

