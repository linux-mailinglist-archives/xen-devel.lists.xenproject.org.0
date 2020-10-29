Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D723729F2F0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14441.35793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbe-0004dB-SG; Thu, 29 Oct 2020 17:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14441.35793; Thu, 29 Oct 2020 17:20:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbe-0004bN-9e; Thu, 29 Oct 2020 17:20:58 +0000
Received: by outflank-mailman (input) for mailman id 14441;
 Thu, 29 Oct 2020 17:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbc-0003MC-MN
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:56 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c76ea11-9640-4cc7-aaec-5b32a0503c23;
 Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKF3fP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:15 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbc-0003MC-MN
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:56 +0000
X-Inumbo-ID: 3c76ea11-9640-4cc7-aaec-5b32a0503c23
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3c76ea11-9640-4cc7-aaec-5b32a0503c23;
	Thu, 29 Oct 2020 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992020;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=7yf5VgvfryEVAPtE1hdfDVCjjHFoZWgCpzJbwfomFp0=;
	b=F1zOdzX4p3t36MPCxlIyOJl3UjwfgkUMdjSGnCnrZM1vBjOziZWe4u7r0N1usI9uxI
	/wAvj56seYsFj6DLNdrq/GRUelq8pKby205Sa/hAl+tLzu5GRZDztj9HqBdh3n1roAja
	+B0EjX80SKUXiyshn72T84QMG1H8gBxT46K8WQaN534jyMgmID8f/ZMhI10Ur2n83aF9
	/xJP6sK3L0YLKjepBC/Nh7fCgdXOwB6PFwNM6ZBKnD3R8fliR+hjj8V3R2KyMATJlaDV
	Kwwp78xhCIdUKendWi+7nepwG/cW1uya5Lxqbc5BY+w2YiFHPR0suWeeJnonu/5htLRR
	Dx4A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKF3fP
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:15 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 17/23] tools/guest: restore: move mfns array
Date: Thu, 29 Oct 2020 18:19:57 +0100
Message-Id: <20201029172004.17219-18-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 2 ++
 tools/libs/guest/xg_sr_restore.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0ceecb289d..5731a5c186 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -227,6 +227,8 @@ struct xc_sr_restore_arrays {
     /* handle_page_data */
     xen_pfn_t pfns[MAX_BATCH_SIZE];
     uint32_t types[MAX_BATCH_SIZE];
+    /* process_page_data */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 7729071e41..3ba089f862 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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

