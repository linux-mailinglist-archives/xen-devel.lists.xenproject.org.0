Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B6A5D397
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909565.1316518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9ft-0002wU-1R; Wed, 12 Mar 2025 00:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909565.1316518; Wed, 12 Mar 2025 00:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fs-0002r1-MV; Wed, 12 Mar 2025 00:10:16 +0000
Received: by outflank-mailman (input) for mailman id 909565;
 Wed, 12 Mar 2025 00:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ts9dp-00013H-H0
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:08:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13d008cd-fed6-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 01:08:09 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-hcKnUj3kOH-9CB9AP-czdw-1; Tue,
 11 Mar 2025 20:08:04 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 629D51800259; Wed, 12 Mar 2025 00:08:00 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 989161956094; Wed, 12 Mar 2025 00:07:53 +0000 (UTC)
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
X-Inumbo-ID: 13d008cd-fed6-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741738087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2Hs8hV+/gJc3OfaS9x8cWsCD/xR9fjklu355DFl/Jo=;
	b=h7/LFnaVkUYIZb6F2nEvZdEmWqyBt7dDEoFTk6ZMcX6Yr9FDZx5P6Ae5JoY0MvpIMc4slf
	JAiMNoXzTIJupuEUWPld4ASXPr5kuPjJCoZYDNSwMok8CcUvuHlf8NstIYCrh3GKq5l/c3
	858BXLn+8xhqsQOkMCp996R9oXOPdz0=
X-MC-Unique: hcKnUj3kOH-9CB9AP-czdw-1
X-Mimecast-MFC-AGG-ID: hcKnUj3kOH-9CB9AP-czdw_1741738080
From: Nico Pache <npache@redhat.com>
To: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	mst@redhat.com,
	david@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	nphamcs@gmail.com,
	yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com,
	alexander.atanasov@virtuozzo.com
Subject: [RFC 4/5] vmx_balloon: update the NR_BALLOON_PAGES state
Date: Tue, 11 Mar 2025 18:06:59 -0600
Message-ID: <20250312000700.184573-5-npache@redhat.com>
In-Reply-To: <20250312000700.184573-1-npache@redhat.com>
References: <20250312000700.184573-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Update the NR_BALLOON_PAGES counter when pages are added to or
removed from the VMware balloon.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 drivers/misc/vmw_balloon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index c817d8c21641..2c70b08c6fb3 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -673,6 +673,8 @@ static int vmballoon_alloc_page_list(struct vmballoon *b,
 
 			vmballoon_stats_page_inc(b, VMW_BALLOON_PAGE_STAT_ALLOC,
 						 ctl->page_size);
+			mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
+				vmballoon_page_in_frames(ctl->page_size));
 		}
 
 		if (page) {
@@ -915,6 +917,8 @@ static void vmballoon_release_page_list(struct list_head *page_list,
 	list_for_each_entry_safe(page, tmp, page_list, lru) {
 		list_del(&page->lru);
 		__free_pages(page, vmballoon_page_order(page_size));
+		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
+			-vmballoon_page_in_frames(page_size));
 	}
 
 	if (n_pages)
@@ -1129,7 +1133,6 @@ static void vmballoon_inflate(struct vmballoon *b)
 
 		/* Update the balloon size */
 		atomic64_add(ctl.n_pages * page_in_frames, &b->size);
-
 		vmballoon_enqueue_page_list(b, &ctl.pages, &ctl.n_pages,
 					    ctl.page_size);
 
-- 
2.48.1


