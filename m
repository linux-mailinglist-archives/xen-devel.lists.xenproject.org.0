Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B240AF84
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186746.335511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8n2-0001a6-Fx; Tue, 14 Sep 2021 13:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186746.335511; Tue, 14 Sep 2021 13:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8n2-0001WV-C1; Tue, 14 Sep 2021 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 186746;
 Tue, 14 Sep 2021 13:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lzK=OE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQ8fq-0001wz-Sx
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:40:34 +0000
Received: from mail-pg1-x52d.google.com (unknown [2607:f8b0:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb471e53-b4b5-4916-b9e9-d353826a2057;
 Tue, 14 Sep 2021 13:39:45 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id w8so12730577pgf.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 06:39:45 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:44 -0700 (PDT)
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
X-Inumbo-ID: eb471e53-b4b5-4916-b9e9-d353826a2057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/usMlQBuF7F2k7aIrpXXc/KIZyi4prmIZLY9hJqrLaI=;
        b=L7DFk/u0wH9b/iGIHpdByH28JFlOCJvQJXIcQEQHfMZXJGvU9AkaMwEr1HnbxliyPL
         kfkbVqsa3rXNVuWDdCe7Bc1f248xQkyj17Gq8RLbwe1bkJrwpIjU2pIVT66S/RvRtCJ+
         XqFp3mMkYzBghBFtb2kQFehpWcmMo4tserFm8EZKV6vENVhy3H9Gs/VmnaI1kPljNwfI
         q5UnZA04pfDmnJfxVMpg0DvIeRkONnlOalgt3Cd3iCECHRA2yCzKdEcsr84DqJJ9hiQL
         0oWKvFTKQvk4YIQRsjK06WsNDVD9CME0l3HHBXaK/AC0I+rdqCj2QaJqIkNYv2L3xIx2
         Iejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/usMlQBuF7F2k7aIrpXXc/KIZyi4prmIZLY9hJqrLaI=;
        b=y1zkA6lqIMBmLFQE/smKc5Ed9fGUYgBuo8cWymDP+HU1JQUSMf1Qxm+6dOC7ypzzQS
         Q51olGoyIJuWVjxEek6WLn/6yp2xmFfV6SRfON62CBMPmeJ9nQjT57LEfAoNRY8pnZLO
         6ZOhJKF9KbI+itDGy6t3qug/3MqUQ1f9bezELzy5OZbJcrOnoDCquHT2ZskN0K1ufT0G
         NtC/DBCghKsnp3p2a6Qxf5Eg5y8kHnIywu5luHJuPV9llcQaVkOOcxC92TyZA5C8bxnD
         dDV4/d9EuR9EcE65dJQrhum6ePyvyOZtlud5E03zcUkiil7nAsNLxLkP6jaAN0JMF/BH
         tQAg==
X-Gm-Message-State: AOAM532PUJFvHuN1Nfwrt+uCTD8fkxg699vKe/oWHc7OO+PB2HmCnIS5
	9wp/Nk/jS/qbipawBDWI1qE=
X-Google-Smtp-Source: ABdhPJwtcm6RMZWi5bhD5h9QY6d/jTIRK78GsCcyNNGg4YhuGPJvGaV4TuX2VKOGUZcAcHGS6Xympw==
X-Received: by 2002:a62:7985:0:b0:437:36f1:d0df with SMTP id u127-20020a627985000000b0043736f1d0dfmr4833203pfc.52.1631626784499;
        Tue, 14 Sep 2021 06:39:44 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	aneesh.kumar@linux.ibm.com,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	rientjes@google.com,
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
Subject: [PATCH V5 08/12] Drivers: hv : vmbus: Initialize VMbus ring buffer for Isolation VM
Date: Tue, 14 Sep 2021 09:39:09 -0400
Message-Id: <20210914133916.1440931-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
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
Change since v4:
	* Use PFN_DOWN instead of HVPFN_DOWN in the hv_ringbuffer_init()

Change since v3:
	* Remove hv_ringbuffer_post_init(), merge map
	operation for Isolation VM into hv_ringbuffer_init()
	* Call hv_ringbuffer_init() after __vmbus_establish_gpadl().
---
 drivers/hv/Kconfig       |  1 +
 drivers/hv/channel.c     | 19 +++++++-------
 drivers/hv/ring_buffer.c | 55 ++++++++++++++++++++++++++++++----------
 3 files changed, 53 insertions(+), 22 deletions(-)

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
index cf419eb1de77..ec847bd14119 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -684,15 +684,6 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
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
 	newchannel->ringbuffer_gpadlhandle.gpadl_handle = 0;
 
@@ -704,6 +695,16 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
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
index 2aee356840a2..5e014d23a7ad 100644
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
 
@@ -192,23 +196,48 @@ int hv_ringbuffer_init(struct hv_ring_buffer_info *ring_info,
 	 * First page holds struct hv_ring_buffer, do wraparound mapping for
 	 * the rest.
 	 */
-	pages_wraparound = kcalloc(page_cnt * 2 - 1, sizeof(struct page *),
-				   GFP_KERNEL);
-	if (!pages_wraparound)
-		return -ENOMEM;
+	if (hv_isolation_type_snp()) {
+		pfn = page_to_pfn(pages) +
+			PFN_DOWN(ms_hyperv.shared_gpa_boundary);
+
+		pfns_wraparound = kcalloc(page_cnt * 2 - 1,
+			sizeof(unsigned long), GFP_KERNEL);
+		if (!pfns_wraparound)
+			return -ENOMEM;
+
+		pfns_wraparound[0] = pfn;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pfns_wraparound[i + 1] = pfn + i % (page_cnt - 1) + 1;
 
-	pages_wraparound[0] = pages;
-	for (i = 0; i < 2 * (page_cnt - 1); i++)
-		pages_wraparound[i + 1] = &pages[i % (page_cnt - 1) + 1];
+		ring_info->ring_buffer = (struct hv_ring_buffer *)
+			vmap_pfn(pfns_wraparound, page_cnt * 2 - 1,
+				 PAGE_KERNEL);
+		kfree(pfns_wraparound);
 
-	ring_info->ring_buffer = (struct hv_ring_buffer *)
-		vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP, PAGE_KERNEL);
+		if (!ring_info->ring_buffer)
+			return -ENOMEM;
+
+		/* Zero ring buffer after setting memory host visibility. */
+		memset(ring_info->ring_buffer, 0x00, PAGE_SIZE * page_cnt);
+	} else {
+		pages_wraparound = kcalloc(page_cnt * 2 - 1,
+					   sizeof(struct page *),
+					   GFP_KERNEL);
+
+		pages_wraparound[0] = pages;
+		for (i = 0; i < 2 * (page_cnt - 1); i++)
+			pages_wraparound[i + 1] =
+				&pages[i % (page_cnt - 1) + 1];
 
-	kfree(pages_wraparound);
+		ring_info->ring_buffer = (struct hv_ring_buffer *)
+			vmap(pages_wraparound, page_cnt * 2 - 1, VM_MAP,
+				PAGE_KERNEL);
 
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


