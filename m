Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7DA5D39A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909561.1316505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fs-0002kp-6j; Wed, 12 Mar 2025 00:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909561.1316505; Wed, 12 Mar 2025 00:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fs-0002fT-21; Wed, 12 Mar 2025 00:10:16 +0000
Received: by outflank-mailman (input) for mailman id 909561;
 Wed, 12 Mar 2025 00:07:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ts9de-00013p-7i
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:07:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c2d39a6-fed6-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 01:07:56 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-xPY-jPQmOkWtvLqk-0dGRA-1; Tue,
 11 Mar 2025 20:07:50 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C0691956080; Wed, 12 Mar 2025 00:07:46 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5DA631956094; Wed, 12 Mar 2025 00:07:38 +0000 (UTC)
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
X-Inumbo-ID: 0c2d39a6-fed6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741738075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3y2AIYNwaPbCVrw04Rp+BR5zhMHEUrAViSTJpQkqU9Q=;
	b=QE6TZarRP9zEY30q/xfKathh1q4aVtT7e6vGgQ9Nxn/QTss6CuSsPuHENKYnWkMrwCbryj
	WqrltOlGiFkFDKu3WZES+pG0Q/q8Hiwt9EUl6VslXH3dUPUvT0NBWvm1eVe0Zoe5dA/SvO
	RWL4DkX6ZeVyjL3RAyyZruVQZx78O5o=
X-MC-Unique: xPY-jPQmOkWtvLqk-0dGRA-1
X-Mimecast-MFC-AGG-ID: xPY-jPQmOkWtvLqk-0dGRA_1741738067
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
Subject: [RFC 2/5] virtio_balloon: update the NR_BALLOON_PAGES state
Date: Tue, 11 Mar 2025 18:06:57 -0600
Message-ID: <20250312000700.184573-3-npache@redhat.com>
In-Reply-To: <20250312000700.184573-1-npache@redhat.com>
References: <20250312000700.184573-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Update the NR_BALLOON_PAGES counter when pages are added to or
removed from the virtio balloon.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 89da052f4f68..406414dbb477 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -274,6 +274,8 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 
 		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
 		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
+		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
+			VIRTIO_BALLOON_PAGES_PER_PAGE);
 		if (!virtio_has_feature(vb->vdev,
 					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
 			adjust_managed_page_count(page, -1);
@@ -324,6 +326,8 @@ static unsigned int leak_balloon(struct virtio_balloon *vb, size_t num)
 		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
 		list_add(&page->lru, &pages);
 		vb->num_pages -= VIRTIO_BALLOON_PAGES_PER_PAGE;
+		mod_node_page_state(page_pgdat(page), NR_BALLOON_PAGES,
+			-VIRTIO_BALLOON_PAGES_PER_PAGE);
 	}
 
 	num_freed_pages = vb->num_pfns;
-- 
2.48.1


