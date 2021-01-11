Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A92F1CFD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65171.115474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jc-00050F-9C; Mon, 11 Jan 2021 17:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65171.115474; Mon, 11 Jan 2021 17:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jc-0004zm-5K; Mon, 11 Jan 2021 17:49:16 +0000
Received: by outflank-mailman (input) for mailman id 65171;
 Mon, 11 Jan 2021 17:49:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1EM-0002aB-R3
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:50 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a100a665-bacf-4531-9345-0276e38292bc;
 Mon, 11 Jan 2021 17:42:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgdM3h
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
X-Inumbo-ID: a100a665-bacf-4531-9345-0276e38292bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386966;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=fJgEN/Sdwhd/b4yPCS/UDhsI4V1GTM00uHRSqwAWm0w=;
	b=mrjmBFrJxDIN7zFSIApZ4lVi/8BwEEPUNWogPS5GHeajyBtJebIX3lxy59XCP1CyAo
	Ew1Dh/V3kdJLv/l4P99e/VMFk0XFSyv4T+WqMWIvSdwv6lERak+P3t004R9Z2ZCSnNFV
	NgW2mcvMwwiUklsvYYrbvAafNwb0r5CEl6r2DWKOa4VXqgBEPOjFm3bC7F63X7g9XJD1
	6lV3Dex2YmLCenWSt8Q4j0mh3umdkLz7KFbRjwhtqLCOGUpicOPt4+o2fRJVfJDwzAyF
	mxVxSkM33HZJ6Q6GtNWMgT6Qp/u3X1vPAF29nKuxv6uM36iP6f6iYj7B/2QI4xG9RHlM
	HO+A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 27/39] tools/guest: restore: move mfns array in populate_pfns
Date: Mon, 11 Jan 2021 18:42:12 +0100
Message-Id: <20210111174224.24714-28-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns mfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 2 ++
 tools/libs/guest/xg_sr_restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index eba3a49877..96a77b5969 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -230,6 +230,8 @@ struct xc_sr_restore_arrays {
     /* process_page_data */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     int map_errs[MAX_BATCH_SIZE];
+    /* populate_pfns */
+    xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 94c329032f..85a32aaed2 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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

