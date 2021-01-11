Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3332F1D1C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65267.115700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1L4-0007fu-6S; Mon, 11 Jan 2021 17:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65267.115700; Mon, 11 Jan 2021 17:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1L4-0007fC-29; Mon, 11 Jan 2021 17:50:46 +0000
Received: by outflank-mailman (input) for mailman id 65267;
 Mon, 11 Jan 2021 17:50:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1EM-0002a6-1c
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:50 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6448801a-c22c-48a4-8a7b-4362a293639f;
 Mon, 11 Jan 2021 17:42:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgdM3i
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:39 +0100 (CET)
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
X-Inumbo-ID: 6448801a-c22c-48a4-8a7b-4362a293639f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386966;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=7l8yhNQOQPrO7fe+7mN7zL3gcTrejyHmlkzb9nVzYkU=;
	b=rSRwKX91cXdJvXMAXT01h/ExFoeKv6yzX08/tzyjgmqnelwhcKZy+wfK768rEjr9xB
	oRPYul6Z+eZds7otY7KB3goXtfTuPw+3DCCD61BumbtbPsqujwgB23B414lHyZ9xntJg
	FW4Da6CCUAdE6pG+MMeVAnxi8XFMsNFwdLmF1G1WKYcudnoyM3VJY9XHUaCEm4ZOm9La
	XpHU9ZD6grpHqDpON1XxBp5zGhsX2ujvvdBCjPcShF9NEXW3NiiPbNf7/HJO9CtT2xdn
	jQpsiECBfiCURI705hRQpVTzVb64I3V/ch6UI1yFjGmmuavh39lg12q6xNgtlKsf6OT3
	hKRw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 28/39] tools/guest: restore: move pfns array in populate_pfns
Date: Mon, 11 Jan 2021 18:42:13 +0100
Message-Id: <20210111174224.24714-29-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns' pfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 11 +----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 96a77b5969..3fe665b91d 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -232,6 +232,7 @@ struct xc_sr_restore_arrays {
     int map_errs[MAX_BATCH_SIZE];
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
+    xen_pfn_t pp_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 85a32aaed2..71b39612ee 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -139,17 +139,10 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
-        *pfns = malloc(count * sizeof(*pfns));
+        *pfns = ctx->restore.m->pp_pfns;
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !pfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
-
     for ( i = 0; i < count; ++i )
     {
         if ( (!types ||
@@ -190,8 +183,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     rc = 0;
 
  err:
-    free(pfns);
-
     return rc;
 }
 

