Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5829F2E1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14418.35672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbF-0003iJ-Tk; Thu, 29 Oct 2020 17:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14418.35672; Thu, 29 Oct 2020 17:20:33 +0000
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
	id 1kYBbF-0003hG-HM; Thu, 29 Oct 2020 17:20:33 +0000
Received: by outflank-mailman (input) for mailman id 14418;
 Thu, 29 Oct 2020 17:20:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbD-0003MC-LT
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:31 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16a7cb04-a854-45a3-a90c-5042f3c0a328;
 Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKB3fE
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:11 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbD-0003MC-LT
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:31 +0000
X-Inumbo-ID: 16a7cb04-a854-45a3-a90c-5042f3c0a328
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 16a7cb04-a854-45a3-a90c-5042f3c0a328;
	Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992018;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=kQfsNVsKk3NxmO3L5ZaWoX8Fyv7MojyLwaUWzvd0rkk=;
	b=JOaVgOC3U0ye2T8Mnibg30o5Jl8LZLeoDlyFpQLyZUKZFpI1iVDy7YlGuUBHw7k7pJ
	lEBMhciP8OGN8a5nfrNQk4oCPIgo5zi6pddlxJGdYLZWlDJaEi2Xa8HVMo1rIj9r34w6
	MKK6aDe3IpPqQipPLV1/ZVSyXj/+ypvK9Hx1nYvNdDEmaZTzFehzTUQagbUWpLfFIjRh
	rGmfWtMa4cuprrWipm6rfNzoRwQYolDgKdx76KZC22iwTfhDkWK5dcerSup7q1xAgAAq
	N0wtO9sckmXzuzqgbrSaKdEmzPeUv+JDqwpRBlsNLjN/LFOAZCOk1dlhf5EWaF3UhfIg
	tUsA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKB3fE
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:11 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 09/23] tools/guest: save: move types array
Date: Thu, 29 Oct 2020 18:19:49 +0100
Message-Id: <20201029172004.17219-10-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move types array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h | 2 ++
 tools/libs/guest/xg_sr_save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0c2bef8f78..3cbadb607b 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -215,6 +215,8 @@ struct xc_sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     /* write_batch: Mfns of the batch pfns. */
     xen_pfn_t mfns[MAX_BATCH_SIZE];
+    /* write_batch: Types of the batch pfns. */
+    xen_pfn_t types[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index cdab288c3f..6678df95b8 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = ctx->save.m->types;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
     errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
@@ -116,7 +114,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -274,7 +272,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(local_pages);
     free(guest_data);
     free(errors);
-    free(types);
 
     return rc;
 }

