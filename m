Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A61A5D399
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909563.1316514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fs-0002sA-N1; Wed, 12 Mar 2025 00:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909563.1316514; Wed, 12 Mar 2025 00:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fs-0002kg-CU; Wed, 12 Mar 2025 00:10:16 +0000
Received: by outflank-mailman (input) for mailman id 909563;
 Wed, 12 Mar 2025 00:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ts9dk-00013p-3r
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:08:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fdaf5b4-fed6-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 01:08:02 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-DsGHc5fiN22ggfCluAAvjA-1; Tue,
 11 Mar 2025 20:07:56 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58D9B1955BC1; Wed, 12 Mar 2025 00:07:53 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 91DF71955DDD; Wed, 12 Mar 2025 00:07:46 +0000 (UTC)
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
X-Inumbo-ID: 0fdaf5b4-fed6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741738081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPsYu1/Zt9JxInUUfAbvJhaRjTUPwV0c8VAQrmxs/V8=;
	b=iFC4UXK3vhAtOQN71LGaPaE2gbEyL6Ace7aQAAw89ENB0h+rnBsGvAAqNJ8gF3mIYtsHQb
	2c78LkH/3nWwweB6OinJKMqkSUjrPyTn6rtcUN5CG7BbI2GOo2dIht8BT8bspzZfqcNGQO
	7/1m3scQp6LRvpo1cVlTRqJVJh06Yuo=
X-MC-Unique: DsGHc5fiN22ggfCluAAvjA-1
X-Mimecast-MFC-AGG-ID: DsGHc5fiN22ggfCluAAvjA_1741738073
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
Subject: [RFC 3/5] hv_balloon: update the NR_BALLOON_PAGES state
Date: Tue, 11 Mar 2025 18:06:58 -0600
Message-ID: <20250312000700.184573-4-npache@redhat.com>
In-Reply-To: <20250312000700.184573-1-npache@redhat.com>
References: <20250312000700.184573-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Update the NR_BALLOON_PAGES counter when pages are added to or
removed from the Hyper-V balloon.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 drivers/hv/hv_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index fec2f18679e3..2b4080e51f97 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -1192,6 +1192,7 @@ static void free_balloon_pages(struct hv_dynmem_device *dm,
 		__ClearPageOffline(pg);
 		__free_page(pg);
 		dm->num_pages_ballooned--;
+		mod_node_page_state(page_pgdat(pg), NR_BALLOON_PAGES, -1);
 		adjust_managed_page_count(pg, 1);
 	}
 }
@@ -1221,6 +1222,7 @@ static unsigned int alloc_balloon_pages(struct hv_dynmem_device *dm,
 			return i * alloc_unit;
 
 		dm->num_pages_ballooned += alloc_unit;
+		mod_node_page_state(page_pgdat(pg), NR_BALLOON_PAGES, alloc_unit);
 
 		/*
 		 * If we allocatted 2M pages; split them so we
-- 
2.48.1


