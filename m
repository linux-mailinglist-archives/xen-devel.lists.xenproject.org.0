Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350C3E4B8F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165133.301847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WO-0004Ax-U0; Mon, 09 Aug 2021 17:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165133.301847; Mon, 09 Aug 2021 17:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WO-00046J-PS; Mon, 09 Aug 2021 17:57:08 +0000
Received: by outflank-mailman (input) for mailman id 165133;
 Mon, 09 Aug 2021 17:57:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9WN-0000Aq-22
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:57:07 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d799969d-565d-4d8b-bb4c-072978d5fdb9;
 Mon, 09 Aug 2021 17:56:44 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id ca5so29226119pjb.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:44 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:43 -0700 (PDT)
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
X-Inumbo-ID: d799969d-565d-4d8b-bb4c-072978d5fdb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+b7Gns6iR6iBk57ZYV5BIIcLDAAVsJ8v7NH3zL5Mg1I=;
        b=aU1nKcQ+nDmPFPy36XWpKTjwCuvMuOeOtKNuk1xPVGyxoxuMnaSYJneUW5xBdbS4mF
         EZRJlDW66/oI7E2Wx1IyV4mhOHU6VQLaysOdIZbmSWHfd5VhmRrwCUwrJRyfkyOnvk8c
         DABDw5o5QtCXWs7FVD6Yq7Noy7Bsts5MhfH7PiPCCCJ7RsIqAKrZykyMiDF/7fbZuHNb
         1vMOIuVj+np2mkftpmkIY+gc57uZn61TrGeij/c4Wr9ZmZ2meUgtSPOJJW3jk0oHauD7
         kGA8EGt3TprQFQB2ozu34RJbI1rKaUnojprdLwAyt6vGvk8hoDFLsG1rF5/di6hAastF
         RUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+b7Gns6iR6iBk57ZYV5BIIcLDAAVsJ8v7NH3zL5Mg1I=;
        b=OjffJrDc8BSVBDc6whn8cPD+AX5gbXkNKU5A216erj7RzBDhSSflQnXpcXgsYJ9D5u
         YKJghZyx5i9j3rG6DfcKenkl6zO6dGwOzIfjSllWxKqM/55dAvBBXUuCeeD1mBFLLRlb
         9dm3nNXT/SX+rxyUXWVPsUJ2VldCJt/NLw+PKAdhBdxee11d16mt0gWCa36LL99dJCXL
         bV84Knh6Mi7f2q0VAeU+I8hwBtahMihzHkQkJKGFio+C3i38KO/4FYdYf/tSF+Ek6G5b
         VCs1poq7H0auQi2s/P+dYXl7Q53otiwUbZ8p1aa9m+fWZYv3Co8axSHk8hvVtEXIcHmK
         VvDw==
X-Gm-Message-State: AOAM531YxwolD+/h/qfOT4f5oNn2hkA7oaOd8qG3rT2q9AKm+sZf/KFi
	YTs00L5cVOHPRvu/ssqYOIM=
X-Google-Smtp-Source: ABdhPJyE8zgrTkf5TWCMZX5Y6wi/PvPkIAsiw37aMcRj/e7Da+SgSl/RYbFUmBp26CFz8LzJX3R2bw==
X-Received: by 2002:a63:ff4d:: with SMTP id s13mr397127pgk.237.1628531803843;
        Mon, 09 Aug 2021 10:56:43 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
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
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
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
Subject: [PATCH V3 08/13] HV/Vmbus: Initialize VMbus ring buffer for Isolation VM
Date: Mon,  9 Aug 2021 13:56:12 -0400
Message-Id: <20210809175620.720923-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

VMbus ring buffer are shared with host and it's need to
be accessed via extra address space of Isolation VM with
SNP support. This patch is to map the ring buffer
address in extra address space via ioremap(). HV host
visibility hvcall smears data in the ring buffer and
so reset the ring buffer memory to zero after calling
visibility hvcall.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/hv/Kconfig        |  1 +
 drivers/hv/channel.c      | 10 +++++
 drivers/hv/hyperv_vmbus.h |  2 +
 drivers/hv/ring_buffer.c  | 84 ++++++++++++++++++++++++++++++---------
 4 files changed, 79 insertions(+), 18 deletions(-)

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
index 4c4717c26240..60ef881a700c 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -712,6 +712,16 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	if (err)
 		goto error_clean_ring;
 
+	err = hv_ringbuffer_post_init(&newchannel->outbound,
+				      page, send_pages);
+	if (err)
+		goto error_free_gpadl;
+
+	err = hv_ringbuffer_post_init(&newchannel->inbound,
+				      &page[send_pages], recv_pages);
+	if (err)
+		goto error_free_gpadl;
+
 	/* Create and init the channel open message */
 	open_info = kzalloc(sizeof(*open_info) +
 			   sizeof(struct vmbus_channel_open_channel),
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 40bc0eff6665..15cd23a561f3 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -172,6 +172,8 @@ extern int hv_synic_cleanup(unsigned int cpu);
 /* Interface */
 
 void hv_ringbuffer_pre_init(struct vmbus_channel *channel);
+int hv_ringbuffer_post_init(struct hv_ring_buffer_info *ring_info,
+		struct page *pages, u32 page_cnt);
 
 int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
 		       struct page *pages, u32 pagecnt, u32 max_pkt_size);
diff --git a/drivers/hv/ring_buffer.c b/drivers/hv/ring_buffer.c
index 2aee356840a2..d4f93fca1108 100644
--- a/drivers/hv/ring_buffer.c
+++ b/drivers/hv/ring_buffer.c
@@ -17,6 +17,8 @@
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/prefetch.h>
+#include <linux/io.h>
+#include <asm/mshyperv.h>
 
 #include "hyperv_vmbus.h"
 
@@ -179,43 +181,89 @@ void hv_ringbuffer_pre_init(struct vmbus_channel *channel)
 	mutex_init(&channel->outbound.ring_buffer_mutex);
 }
 
-/* Initialize the ring buffer. */
-int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
-		       struct page *pages, u32 page_cnt, u32 max_pkt_size)
+int hv_ringbuffer_post_init(struct hv_ring_buffer_info *ring_info,
+		       struct page *pages, u32 page_cnt)
 {
+	u64 physic_addr = page_to_pfn(pages) << PAGE_SHIFT;
+	unsigned long *pfns_wraparound;
+	void *vaddr;
 	int i;
-	struct page **pages_wraparound;
 
-	BUILD_BUG_ON((sizeof(struct hv_ring_buffer) != PAGE_SIZE));
+	if (!hv_isolation_type_snp())
+		return 0;
+
+	physic_addr += ms_hyperv.shared_gpa_boundary;
 
 	/*
 	 * First page holds struct hv_ring_buffer, do wraparound mapping for
 	 * the rest.
 	 */
-	pages_wraparound = kcalloc(page_cnt * 2 - 1, sizeof(struct page *),
+	pfns_wraparound = kcalloc(page_cnt * 2 - 1, sizeof(unsigned long),
 				   GFP_KERNEL);
-	if (!pages_wraparound)
+	if (!pfns_wraparound)
 		return -ENOMEM;
 
-	pages_wraparound[0] = pages;
+	pfns_wraparound[0] = physic_addr >> PAGE_SHIFT;
 	for (i = 0; i < 2 * (page_cnt - 1); i++)
-		pages_wraparound[i + 1] = &pages[i % (page_cnt - 1) + 1];
-
-	ring_info->ring_buffer = (struct hv_ring_buffer *)
-		vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP, PAGE_KERNEL);
-
-	kfree(pages_wraparound);
+		pfns_wraparound[i + 1] = (physic_addr >> PAGE_SHIFT) +
+			i % (page_cnt - 1) + 1;
 
-
-	if (!ring_info->ring_buffer)
+	vaddr = vmap_pfn(pfns_wraparound, page_cnt * 2 - 1, PAGE_KERNEL_IO);
+	kfree(pfns_wraparound);
+	if (!vaddr)
 		return -ENOMEM;
 
-	ring_info->ring_buffer->read_index =
-		ring_info->ring_buffer->write_index = 0;
+	/* Clean memory after setting host visibility. */
+	memset((void *)vaddr, 0x00, page_cnt * PAGE_SIZE);
+
+	ring_info->ring_buffer = (struct hv_ring_buffer *)vaddr;
+	ring_info->ring_buffer->read_index = 0;
+	ring_info->ring_buffer->write_index = 0;
 
 	/* Set the feature bit for enabling flow control. */
 	ring_info->ring_buffer->feature_bits.value = 1;
 
+	return 0;
+}
+
+/* Initialize the ring buffer. */
+int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
+		       struct page *pages, u32 page_cnt, u32 max_pkt_size)
+{
+	int i;
+	struct page **pages_wraparound;
+
+	BUILD_BUG_ON((sizeof(struct hv_ring_buffer) != PAGE_SIZE));
+
+	if (!hv_isolation_type_snp()) {
+		/*
+		 * First page holds struct hv_ring_buffer, do wraparound mapping for
+		 * the rest.
+		 */
+		pages_wraparound = kcalloc(page_cnt * 2 - 1, sizeof(struct page *),
+					   GFP_KERNEL);
+		if (!pages_wraparound)
+			return -ENOMEM;
+
+		pages_wraparound[0] = pages;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pages_wraparound[i + 1] = &pages[i % (page_cnt - 1) + 1];
+
+		ring_info->ring_buffer = (struct hv_ring_buffer *)
+			vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP, PAGE_KERNEL);
+
+		kfree(pages_wraparound);
+
+		if (!ring_info->ring_buffer)
+			return -ENOMEM;
+
+		ring_info->ring_buffer->read_index =
+			ring_info->ring_buffer->write_index = 0;
+
+		/* Set the feature bit for enabling flow control. */
+		ring_info->ring_buffer->feature_bits.value = 1;
+	}
+
 	ring_info->ring_size = page_cnt << PAGE_SHIFT;
 	ring_info->ring_size_div10_reciprocal =
 		reciprocal_value(ring_info->ring_size / 10);
-- 
2.25.1


