Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA707A61E56
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915465.1321002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjm-0008QM-Kj; Fri, 14 Mar 2025 21:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915465.1321002; Fri, 14 Mar 2025 21:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjm-0008NT-Hc; Fri, 14 Mar 2025 21:38:38 +0000
Received: by outflank-mailman (input) for mailman id 915465;
 Fri, 14 Mar 2025 21:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLrw=WB=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ttCjl-000827-06
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:38:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af13fe1c-011c-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 22:38:36 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-0r6UKT9IMtuF-Il_bN2UWQ-1; Fri,
 14 Mar 2025 17:38:30 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A8BDC195608D; Fri, 14 Mar 2025 21:38:22 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.80.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6352D1944E42; Fri, 14 Mar 2025 21:38:17 +0000 (UTC)
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
X-Inumbo-ID: af13fe1c-011c-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741988315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RXL+coJsdtD8dzVN3au7Q2NbBlOYxUwoHTJ/KoQPU4=;
	b=DI/0F6cdNKPnPLBqukHBXVa5rFs6vXRJriXpiLIanfhiv9rIRXWELF9e9oqlnZHXYFXowF
	pTIYWg0QnhP76BrUyTurfg7Fnco06zBf9/o5noftNo0VG0jtW/5OfxZ+4xxpXP7iYlkxjg
	puSmDYjwuteCj28N5eULfMOs7nw9tU4=
X-MC-Unique: 0r6UKT9IMtuF-Il_bN2UWQ-1
X-Mimecast-MFC-AGG-ID: 0r6UKT9IMtuF-Il_bN2UWQ_1741988303
From: Nico Pache <npache@redhat.com>
To: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	virtualization@lists.linux.dev
Cc: alexander.atanasov@virtuozzo.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	mhocko@kernel.org,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org,
	mst@redhat.com,
	david@redhat.com,
	yosry.ahmed@linux.dev,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	kanchana.p.sridhar@intel.com,
	llong@redhat.com,
	shakeel.butt@linux.dev
Subject: [PATCH v2 2/4] balloon_compaction: update the NR_BALLOON_PAGES state
Date: Fri, 14 Mar 2025 15:37:55 -0600
Message-ID: <20250314213757.244258-3-npache@redhat.com>
In-Reply-To: <20250314213757.244258-1-npache@redhat.com>
References: <20250314213757.244258-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Update the NR_BALLOON_PAGES counter when pages are added or removed using
the balloon compaction interface.

The virtio, Vmware, and pseries-cmm balloon drivers utilize the
balloon_compaction interface to allocate and free balloon pages. Other
balloon drivers will have to maintain this counter manually.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/balloon_compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 6597ebea8ae2..d3e00731e262 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -24,6 +24,7 @@ static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 	balloon_page_insert(b_dev_info, page);
 	unlock_page(page);
 	__count_vm_event(BALLOON_INFLATE);
+	inc_node_page_state(page, NR_BALLOON_PAGES);
 }
 
 /**
@@ -103,6 +104,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
 		unlock_page(page);
+		dec_node_page_state(page, NR_BALLOON_PAGES);
 		n_pages++;
 	}
 	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
-- 
2.48.1


