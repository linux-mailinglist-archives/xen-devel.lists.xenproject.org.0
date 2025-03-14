Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E75A61E55
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915469.1321022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjs-0000a3-AT; Fri, 14 Mar 2025 21:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915469.1321022; Fri, 14 Mar 2025 21:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjs-0000WA-3b; Fri, 14 Mar 2025 21:38:44 +0000
Received: by outflank-mailman (input) for mailman id 915469;
 Fri, 14 Mar 2025 21:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLrw=WB=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ttCjq-000827-GO
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:38:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b24b6d7c-011c-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 22:38:42 +0100 (CET)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-4j3QuXoCNQOrm0DeJ5-F4Q-1; Fri,
 14 Mar 2025 17:38:37 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B7E419560BB; Fri, 14 Mar 2025 21:38:34 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.80.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A74201944E42; Fri, 14 Mar 2025 21:38:28 +0000 (UTC)
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
X-Inumbo-ID: b24b6d7c-011c-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741988320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGPxM9RdXtkX+Els8nvXOJm60GkYwZd/fztNUeVaxvI=;
	b=N1KiB4sC3veL8yihY/K7w70PEUapQvZnYNJOxn00MX4IkqAvvXInzqGpxiFnRN3lT4JJW6
	IP+fjhE1uNnCkPswfRlQ76q4V50CCDYc1X9QcBQMsxpYb1Ambma43PLZhuFuyvs1qqXvAI
	SvcAwlSOU9u/3aCDEZS5GAbTZBLmY+g=
X-MC-Unique: 4j3QuXoCNQOrm0DeJ5-F4Q-1
X-Mimecast-MFC-AGG-ID: 4j3QuXoCNQOrm0DeJ5-F4Q_1741988314
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
Subject: [PATCH v2 4/4] xen: balloon: update the NR_BALLOON_PAGES state
Date: Fri, 14 Mar 2025 15:37:57 -0600
Message-ID: <20250314213757.244258-5-npache@redhat.com>
In-Reply-To: <20250314213757.244258-1-npache@redhat.com>
References: <20250314213757.244258-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Update the NR_BALLOON_PAGES counter when pages are added to or
removed from the Xen balloon.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 drivers/xen/balloon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 163f7f1d70f1..65d4e7fa1eb8 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -157,6 +157,8 @@ static void balloon_append(struct page *page)
 		list_add(&page->lru, &ballooned_pages);
 		balloon_stats.balloon_low++;
 	}
+	inc_node_page_state(page, NR_BALLOON_PAGES);
+
 	wake_up(&balloon_wq);
 }
 
@@ -179,6 +181,8 @@ static struct page *balloon_retrieve(bool require_lowmem)
 		balloon_stats.balloon_low--;
 
 	__ClearPageOffline(page);
+	dec_node_page_state(page, NR_BALLOON_PAGES);
+
 	return page;
 }
 
-- 
2.48.1


