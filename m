Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08379A5D398
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909559.1316499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fr-0002em-QE; Wed, 12 Mar 2025 00:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909559.1316499; Wed, 12 Mar 2025 00:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fr-0002Xf-Lw; Wed, 12 Mar 2025 00:10:15 +0000
Received: by outflank-mailman (input) for mailman id 909559;
 Wed, 12 Mar 2025 00:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ts9dY-00013p-4W
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:07:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07a42816-fed6-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 01:07:48 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-vkQ8710FPFOYX9_CxAjz-Q-1; Tue,
 11 Mar 2025 20:07:42 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2CA19195608F; Wed, 12 Mar 2025 00:07:38 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3CA451955F0F; Wed, 12 Mar 2025 00:07:30 +0000 (UTC)
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
X-Inumbo-ID: 07a42816-fed6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741738067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ceDeMBe52N2seuUa756T2OuNElv+sx4xmpEJqAZFNJ0=;
	b=ZA625eOmgzmi/qVEmreX+Of5XknsZbrx9v9HYLM2bBfRxHjNLMpkTIOxLdDhhEwjHdC9P/
	FYqvhMsklJql6XiqJPlz5bnnVIHcjGm7aMIPvX4go8q7w0ZnjIaowlKC4uSVmgIU7HT/l/
	Z75IbqeNuZS0bOislCEbadalJCNd1LA=
X-MC-Unique: vkQ8710FPFOYX9_CxAjz-Q-1
X-Mimecast-MFC-AGG-ID: vkQ8710FPFOYX9_CxAjz-Q_1741738058
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
Subject: [RFC 1/5] meminfo: add a per node counter for balloon drivers
Date: Tue, 11 Mar 2025 18:06:56 -0600
Message-ID: <20250312000700.184573-2-npache@redhat.com>
In-Reply-To: <20250312000700.184573-1-npache@redhat.com>
References: <20250312000700.184573-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add NR_BALLOON_PAGES counter to track memory used by balloon drivers and
expose it through /proc/meminfo and other memory reporting interfaces.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 fs/proc/meminfo.c      | 2 ++
 include/linux/mmzone.h | 1 +
 mm/memcontrol.c        | 1 +
 mm/show_mem.c          | 4 +++-
 mm/vmstat.c            | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

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
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 4de6acb9b8ec..182b44646bfa 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1377,6 +1377,7 @@ static const struct memory_stat memory_stats[] = {
 #ifdef CONFIG_HUGETLB_PAGE
 	{ "hugetlb",			NR_HUGETLB			},
 #endif
+	{ "nr_balloon_pages",		NR_BALLOON_PAGES		},
 
 	/* The memory events */
 	{ "workingset_refault_anon",	WORKINGSET_REFAULT_ANON		},
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


