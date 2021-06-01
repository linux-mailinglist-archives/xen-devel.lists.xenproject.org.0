Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4D3977BF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135026.251242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71J-0001xS-Js; Tue, 01 Jun 2021 16:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135026.251242; Tue, 01 Jun 2021 16:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71J-0001rA-EB; Tue, 01 Jun 2021 16:13:33 +0000
Received: by outflank-mailman (input) for mailman id 135026;
 Tue, 01 Jun 2021 16:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70G-0005Ec-2c
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:28 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.169])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54d6a0b-382f-48b9-8b14-afc26fd82239;
 Tue, 01 Jun 2021 16:11:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBX1BO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:33 +0200 (CEST)
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
X-Inumbo-ID: b54d6a0b-382f-48b9-8b14-afc26fd82239
ARC-Seal: i=1; a=rsa-sha256; t=1622563893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UUM+exyc4Jrd1VjUci/3jYH7JekthyphWT5aBWkhbqXHdikeRhjJciVwYbT6pBKxnQ
    sCssb14D+0d2l0ieo61vaGv/+gXHHH0EIgc9VlWAxVVaC2JVUuXpooY0PbGOdAlWumq8
    RLyO6YzqPa4LgKySXRHvrReFKUokuRTDFPvPRMuV0dVCc9atUNRe3fKHl+WpkYSPVpYb
    /bXBKI80r82XVNiBFSE9nsa4s3yxbkV5mbnu3D+UmHk4ZYQzsXJdDNYGA6eEmDhRPI4o
    mohDQD0ZKRxBBq4hWYx24LWbRepKO9i7xRbsPrVxSLnYrDDtpmfVOg4hoSSvmpXU4foG
    vtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aAGkFwdPcwm3sDiRcDYWvmNyL5GfWbZILOcBD1kChMw=;
    b=WuaAIM3CKjPaQpNFLkan3sxYrsUWe15VJwwOkRkJvJxFSNzjJkgTaoyqLco1NVrvik
    rDuEQMjXNbIACUimJfcEG69pNeM6uCtuaQ8Z0EcPFjrWRWCSrNinT7dG9UYinAeNWf+T
    BRt2KbTc/kkZkoBrjm3c1HZ47YFOhYDghdpchGOrTTPl9UGjY570bg0DwOTkK3qwuaoG
    SRr2SfNQAWE/7zZD93V39TnKrzPtr5CXXmJuGhizFzZSHqfgaBwO2qLfL2qHvVJGM4VY
    6E4qdAfjNY0gfHLFNI//uKFaw6X7WqJD6xWS1UjiDHqpzbst0LQKkDn1mIYkH6rGCAro
    Ysew==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563893;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=aAGkFwdPcwm3sDiRcDYWvmNyL5GfWbZILOcBD1kChMw=;
    b=gAzpX16i4/ez6pQcYlrP7qEdVAQ80FBGQ2Dn4f1iV1B3P1h8/2DMCaiMjAm7dN7FBY
    K4uDxEOZ1lMUiga+eZ8g7zG8XAWxCD8uQQB+VJuPiKTt2RXYjN/Nn9VJSLvWtqnvWyM8
    74rtepR3Bi28C+yCKeSQTCT2cbTM3Jt+tP5dwrAi5RuzDyvHI2j+VE8M6NIF8veCY9Vd
    hEwIi+ZSsOg2+MXoDY/5/O+VF8eftF/xaXmYjhTyQENFIZ/kiMKegjykeiUmmzjEATHJ
    2NV34oiv3Aq/xv+TN6oynwFKJ/t0IcuutOZAfKyykRtRW6CKrwrhP4rBNOLCIBnRreE8
    qoJA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 19/38] tools/guest: restore: move types array
Date: Tue,  1 Jun 2021 18:10:59 +0200
Message-Id: <20210601161118.18986-20-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.h  |  1 +
 tools/libs/saverestore/restore.c | 12 +-----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index be6f98af7f..96cd60e0d6 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -238,6 +238,7 @@ struct xc_sr_save_arrays {
 struct xc_sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
+    uint32_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 4d8ee19adf..815a2d5a12 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -316,7 +316,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     int rc = -1;
 
     xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
-    uint32_t *types = NULL, type;
+    uint32_t *types = ctx->restore.m->types, type;
 
     /*
      * v2 compatibility only exists for x86 streams.  This is a bit of a
@@ -363,14 +363,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    types = malloc(pages->count * sizeof(*types));
-    if ( !types )
-    {
-        ERROR("Unable to allocate enough memory for %u pfns",
-              pages->count);
-        goto err;
-    }
-
     for ( i = 0; i < pages->count; ++i )
     {
         pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
@@ -410,8 +402,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     rc = process_page_data(ctx, pages->count, pfns, types,
                            &pages->pfn[pages->count]);
  err:
-    free(types);
-
     return rc;
 }
 

