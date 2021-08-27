Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCE3F9D9B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173818.317180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYK-0004rF-E5; Fri, 27 Aug 2021 17:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173818.317180; Fri, 27 Aug 2021 17:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYK-0004oD-9U; Fri, 27 Aug 2021 17:22:04 +0000
Received: by outflank-mailman (input) for mailman id 173818;
 Fri, 27 Aug 2021 17:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfYI-00016Q-Ny
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:22:02 +0000
Received: from mail-pl1-x631.google.com (unknown [2607:f8b0:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 971e1a30-4c0c-42f9-90ac-9e3670196996;
 Fri, 27 Aug 2021 17:21:42 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id m17so4350645plc.6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:42 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:41 -0700 (PDT)
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
X-Inumbo-ID: 971e1a30-4c0c-42f9-90ac-9e3670196996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4dx9A/B3m5ysOD2+VzBoH5w81i27I/BMJvu/dVa7Ytg=;
        b=d6svu92zxjPI6sOGybaew8LGEzZQzVDWU73Js82UMmjRVPkircRHjJuTwevbiccRtw
         ZOHi8nITISKt1ONd0/XM2BKSMvAJmurxS00i1gBOaGuR027+Kyk7ZjDXFSFBUcP4bTCZ
         +mxTQlEetvL8su0/2uTAqa3IHgMTEZ7T+82SBtlXhSmpM7sNg5mVuophr86XcTcFPq2/
         w+EZ2tpFCYMRtm821G13jWV8IhGq8uTX0NcoMVXtQ+wE1Ha9RrqJUhReEosqrotUQCoQ
         IGgYsbYCnWTzEe07DlxvZ+deZdgduAL0Zs/sUPNCxPdbBV8fooS21ucdofpUlseeIhpm
         zgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dx9A/B3m5ysOD2+VzBoH5w81i27I/BMJvu/dVa7Ytg=;
        b=ss7ueBwSmeI4DA1+QkMG5zmSNQ7jPBUuUhs1X4ob2mSLDHjeF+/CEOw6FYpkj6goBb
         zMEb96Hw+hDwwVPNIXli3t8JQ6h3/IbXns0/RrFY7mESHFsbCwxr6IRM4Z88DYD5D3HW
         TwT1QiXbX158LEcmW6q2pkh+0nN9vNHxXHh4+cSJ1y3l+dr85H3z6ZMWQAO106kZi3Lb
         M8KZSHhxAVCn2P5S6GrgEDRgA7VP3g0Id5bYxsklPkMKBd6g90ceKsAN3pVU0We4tKBa
         XI9QJnCQgJyI56pOt9+7/Yx5v9ZghxN7Cx3xl2X4JAKUpCIfldgc/wwt5SA+MoeHArq1
         +PFA==
X-Gm-Message-State: AOAM5308dSezwFi9IyLwWN5iHCAuX6yrFb+Z7g/Ywe/fEOnmdiQ3NMw0
	MF89gRYqqrKhxoMLwBtujFo=
X-Google-Smtp-Source: ABdhPJwIY8QSecpkOYquBiJzV0Q22b9scRKmqtTl7kB/KD182fzIRPnUqvHG1miAckAMpUlV+5Pz6g==
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id h4-20020a170902f704b029011acdee0490mr9529029plo.37.1630084901556;
        Fri, 27 Aug 2021 10:21:41 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	ardb@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 08/13] hyperv/vmbus: Initialize VMbus ring buffer for Isolation VM
Date: Fri, 27 Aug 2021 13:21:06 -0400
Message-Id: <20210827172114.414281-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

VMbus ring buffer are shared with host and it's need to
be accessed via extra address space of Isolation VM with
AMD SNP support. This patch is to map the ring buffer
address in extra address space via vmap_pfn(). Hyperv set
memory host visibility hvcall smears data in the ring buffer
and so reset the ring buffer memory to zero after mapping.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Remove hv_ringbuffer_post_init(), merge map
	operation for Isolation VM into hv_ringbuffer_init()
	* Call hv_ringbuffer_init() after __vmbus_establish_gpadl().
---
 drivers/hv/Kconfig       |  1 +
 drivers/hv/channel.c     | 19 +++++++-------
 drivers/hv/ring_buffer.c | 56 ++++++++++++++++++++++++++++++----------
 3 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index d1123ceb38f3..dd12af20e467 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -8,6 +8,7 @@ config HYPERV
 		|| (ARM64 && !CPU_BIG_ENDIAN))
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
+	select VMAP_PFN
 	help
 	  Select this option to run Linux as a Hyper-V client operating
 	  system.
diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 82650beb3af0..81f8629e4491 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -679,15 +679,6 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	if (!newchannel->max_pkt_size)
 		newchannel->max_pkt_size = VMBUS_DEFAULT_MAX_PKT_SIZE;
 
-	err = hv_ringbuffer_init(&newchannel->outbound, page, send_pages, 0);
-	if (err)
-		goto error_clean_ring;
-
-	err = hv_ringbuffer_init(&newchannel->inbound, &page[send_pages],
-				 recv_pages, newchannel->max_pkt_size);
-	if (err)
-		goto error_clean_ring;
-
 	/* Establish the gpadl for the ring buffer */
 	newchannel->ringbuffer_gpadlhandle = 0;
 
@@ -699,6 +690,16 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	if (err)
 		goto error_clean_ring;
 
+	err = hv_ringbuffer_init(&newchannel->outbound,
+				 page, send_pages, 0);
+	if (err)
+		goto error_free_gpadl;
+
+	err = hv_ringbuffer_init(&newchannel->inbound, &page[send_pages],
+				 recv_pages, newchannel->max_pkt_size);
+	if (err)
+		goto error_free_gpadl;
+
 	/* Create and init the channel open message */
 	open_info = kzalloc(sizeof(*open_info) +
 			   sizeof(struct vmbus_channel_open_channel),
diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 2aee356840a2..24d64d18eb65 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -17,6 +17,8 @@
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/prefetch.h>
+#include <linux/io.h>
+#include <asm/mshyperv.h>
 
 #include "hyperv_vmbus.h"
 
@@ -183,8 +185,10 @@ void hv_ringbuffer_pre_init(struct vmbus_channel *channel)
 int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
 		       struct page *pages, u32 page_cnt, u32 max_pkt_size)
 {
-	int i;
 	struct page **pages_wraparound;
+	unsigned long *pfns_wraparound;
+	u64 pfn;
+	int i;
 
 	BUILD_BUG_ON((sizeof(struct hv_ring_buffer) != PAGE_SIZE));
 
@@ -192,23 +196,49 @@ int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
 	 * First page holds struct hv_ring_buffer, do wraparound mapping for
 	 * the rest.
 	 */
-	pages_wraparound = kcalloc(page_cnt * 2 - 1, sizeof(struct page *),
-				   GFP_KERNEL);
-	if (!pages_wraparound)
-		return -ENOMEM;
+	if (hv_isolation_type_snp()) {
+		pfn = page_to_pfn(pages) +
+			HVPFN_DOWN(ms_hyperv.shared_gpa_boundary);
 
-	pages_wraparound[0] = pages;
-	for (i = 0; i < 2 * (page_cnt - 1); i++)
-		pages_wraparound[i + 1] = &pages[i % (page_cnt - 1) + 1];
+		pfns_wraparound = kcalloc(page_cnt * 2 - 1,
+			sizeof(unsigned long), GFP_KERNEL);
+		if (!pfns_wraparound)
+			return -ENOMEM;
 
-	ring_info->ring_buffer = (struct hv_ring_buffer *)
-		vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP, PAGE_KERNEL);
+		pfns_wraparound[0] = pfn;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pfns_wraparound[i + 1] = pfn + i % (page_cnt - 1) + 1;
 
-	kfree(pages_wraparound);
+		ring_info->ring_buffer = (struct hv_ring_buffer *)
+			vmap_pfn(pfns_wraparound, page_cnt * 2 - 1,
+				 PAGE_KERNEL);
+		kfree(pfns_wraparound);
 
+		if (!ring_info->ring_buffer)
+			return -ENOMEM;
+
+		/* Zero ring buffer after setting memory host visibility. */
+		memset(ring_info->ring_buffer, 0x00,
+			HV_HYP_PAGE_SIZE * page_cnt);
+	} else {
+		pages_wraparound = kcalloc(page_cnt * 2 - 1,
+					   sizeof(struct page *),
+					   GFP_KERNEL);
+
+		pages_wraparound[0] = pages;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pages_wraparound[i + 1] =
+				&pages[i % (page_cnt - 1) + 1];
+
+		ring_info->ring_buffer = (struct hv_ring_buffer *)
+			vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP,
+				PAGE_KERNEL);
+
+		kfree(pages_wraparound);
+		if (!ring_info->ring_buffer)
+			return -ENOMEM;
+	}
 
-	if (!ring_info->ring_buffer)
-		return -ENOMEM;
 
 	ring_info->ring_buffer->read_index =
 		ring_info->ring_buffer->write_index = 0;
-- 
2.25.1


