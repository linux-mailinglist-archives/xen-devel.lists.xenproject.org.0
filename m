Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA3A61E4B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915460.1320992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCje-000852-At; Fri, 14 Mar 2025 21:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915460.1320992; Fri, 14 Mar 2025 21:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCje-00082u-7Q; Fri, 14 Mar 2025 21:38:30 +0000
Received: by outflank-mailman (input) for mailman id 915460;
 Fri, 14 Mar 2025 21:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLrw=WB=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ttCjc-000827-43
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:38:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8c77410-011c-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 22:38:26 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-ltqb4lcePE69hcWXSe8vYA-1; Fri,
 14 Mar 2025 17:38:21 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 28885180034D; Fri, 14 Mar 2025 21:38:17 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.80.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B05D41944DC5; Fri, 14 Mar 2025 21:38:11 +0000 (UTC)
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
X-Inumbo-ID: a8c77410-011c-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741988304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Syhhy4ulIUlWqTYydvlvGA6nZmvGM1l/r4DiZeh/SB8=;
	b=CtrgY4pF4HK/xRtrdtzhwGvSyf7wQ/oSw54uAhsMrYwEmcYlgu7v4FNzbG0DkIwXAT2y23
	eYTrTmo5jmEukZiJPMa0Uo7sOfOERvRaw8FfrcUhCryxsrH/OdW29LGgNc0xRVjhXdCHUP
	ubZKdCEBQ04dF9O1X9kDSGUH3UoGtMs=
X-MC-Unique: ltqb4lcePE69hcWXSe8vYA-1
X-Mimecast-MFC-AGG-ID: ltqb4lcePE69hcWXSe8vYA_1741988298
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
Subject: [PATCH v2 1/4] meminfo: add a per node counter for balloon drivers
Date: Fri, 14 Mar 2025 15:37:54 -0600
Message-ID: <20250314213757.244258-2-npache@redhat.com>
In-Reply-To: <20250314213757.244258-1-npache@redhat.com>
References: <20250314213757.244258-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
expose it through /proc/meminfo and other memory reporting interfaces.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 fs/proc/meminfo.c      | 2 ++
 include/linux/mmzone.h | 1 +
 mm/show_mem.c          | 4 +++-
 mm/vmstat.c            | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
index 8ba9b1472390..83be312159c9 100644
--- a/fs/proc/meminfo.c
+++ b/fs/proc/meminfo.c
@@ -162,6 +162,8 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
 	show_val_kb(m, "Unaccepted:     ",
 		    global_zone_page_state(NR_UNACCEPTED));
 #endif
+	show_val_kb(m, "Balloon:        ",
+		    global_node_page_state(NR_BALLOON_PAGES));
 
 	hugetlb_report_meminfo(m);
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9540b41894da..71d3ff19267a 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -223,6 +223,7 @@ enum node_stat_item {
 #ifdef CONFIG_HUGETLB_PAGE
 	NR_HUGETLB,
 #endif
+	NR_BALLOON_PAGES,
 	NR_VM_NODE_STAT_ITEMS
 };
 
diff --git a/mm/show_mem.c b/mm/show_mem.c
index 43afb56abbd3..6af13bcd2ab3 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -260,6 +260,7 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
 			" pagetables:%lukB"
 			" sec_pagetables:%lukB"
 			" all_unreclaimable? %s"
+			" Balloon:%lukB"
 			"\n",
 			pgdat->node_id,
 			K(node_page_state(pgdat, NR_ACTIVE_ANON)),
@@ -285,7 +286,8 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
 #endif
 			K(node_page_state(pgdat, NR_PAGETABLE)),
 			K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
-			str_yes_no(pgdat->kswapd_failures >= MAX_RECLAIM_RETRIES));
+			str_yes_no(pgdat->kswapd_failures >= MAX_RECLAIM_RETRIES),
+			K(node_page_state(pgdat, NR_BALLOON_PAGES)));
 	}
 
 	for_each_populated_zone(zone) {
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 16bfe1c694dd..d3b11891a942 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1276,6 +1276,7 @@ const char * const vmstat_text[] = {
 #ifdef CONFIG_HUGETLB_PAGE
 	"nr_hugetlb",
 #endif
+	"nr_balloon_pages",
 	/* system-wide enum vm_stat_item counters */
 	"nr_dirty_threshold",
 	"nr_dirty_background_threshold",
-- 
2.48.1


