Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D6B3BEB9B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152555.281863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19qF-0003C9-FI; Wed, 07 Jul 2021 15:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152555.281863; Wed, 07 Jul 2021 15:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19qF-00039z-8j; Wed, 07 Jul 2021 15:52:03 +0000
Received: by outflank-mailman (input) for mailman id 152555;
 Wed, 07 Jul 2021 15:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19mJ-0002ed-6s
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:47:59 +0000
Received: from mail-pf1-x429.google.com (unknown [2607:f8b0:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f9da59-0e9c-4f53-8c76-da520f0ea693;
 Wed, 07 Jul 2021 15:47:11 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id b12so2541184pfv.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:47:11 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:38:6b47:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id q18sm23093560pgj.8.2021.07.07.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:47:10 -0700 (PDT)
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
X-Inumbo-ID: 58f9da59-0e9c-4f53-8c76-da520f0ea693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d9G7rX1Wf2e4jgYzMUXcCiOPT4rIMtwlWsRa/j4ZTx8=;
        b=MBccprpsRZbRBzn6Q74+KmpWH/C6n7RGUH8aA689Jf6+OWOMykcnt/ZY37atWT4gic
         DOjRNhV5KQvMsBL9VxsrKxt3IkxH7xLFDJNZiPni9y6shi6ugb60m7cU9VeXX64Y81LP
         xgPcv35SphN43aCrwRWGJr9XUKndx9QxVUhL/4TdO18lYNSAEJluabGylM3ACDVDtJ/h
         sBUs2A7aqcwl2SUBmvmD4p7RBT0gOmbRB7ShQ8nx7G0M5dGHQbYtntiAQ27Cy6+XC6wa
         f+tRGI3zFgJhUOaZEHGkNaMdOsoeZm+p5CYOC1oMvnExhumjI6l4IEtWCcA/ChkzHZO4
         5tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d9G7rX1Wf2e4jgYzMUXcCiOPT4rIMtwlWsRa/j4ZTx8=;
        b=A8TPfNDrWOTGn2HkaBQq2x6wT3q8KzAMdleh3wfDJajbzUMMGWBI+RqtAhm3s1Ml9z
         jYGvj0oZqmCDbV7P5Qe7SdZXWl7W6u9XLTreSrQRzmhVg54ZqnMhZGnSmqJnwcxX9ipt
         Vxp2mkuSLPzYjvV7cYZNEulg8YE9o0s1KCqDFKqQ8yM46U855hFmDq2MC8lfhbBWiKs5
         vAOGt7Xqf2p3Z3VE05ZdefyKeARV2Q1Wns+WQCl5mtJsb5JTHAzQJmZrwHH2Uk4mJkj+
         KWOQ+LUPbWxHyiucG6IS5pLBZmLSOGg037i07XpWLb3whnapft2WeXpCZRfPs6nNcCi1
         Z5iQ==
X-Gm-Message-State: AOAM530KhN2obSP52bZUqPPWO+gn3HOmwutnWKeaqm04OJaDAlCWUo8P
	fS0zY2SErwtuv6bFsAhjYjE=
X-Google-Smtp-Source: ABdhPJzvlBIKPtUWe4+tZyz+A3EwlEGnKYo9dj5XU3MYJvkGWWUZOwWT2GALfxenXK+wdhiIBd383w==
X-Received: by 2002:a63:d915:: with SMTP id r21mr26953592pgg.283.1625672830421;
        Wed, 07 Jul 2021 08:47:10 -0700 (PDT)
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
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	robh@kernel.org,
	nramas@linux.microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	keescook@chromium.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: [Resend RFC PATCH V4 11/13] HV/Netvsc: Add Isolation VM support for netvsc driver
Date: Wed,  7 Jul 2021 11:46:25 -0400
Message-Id: <20210707154629.3977369-12-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707154629.3977369-1-ltykernel@gmail.com>
References: <20210707154629.3977369-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Isolation VM, all shared memory with host needs to mark visible
to host via hvcall. vmbus_establish_gpadl() has already done it for
netvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
pagebuffer() still need to handle. Use DMA API to map/umap these
memory during sending/receiving packet and Hyper-V DMA ops callback
will use swiotlb function to allocate bounce buffer and copy data
from/to bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/net/hyperv/hyperv_net.h   |   6 ++
 drivers/net/hyperv/netvsc.c       | 144 +++++++++++++++++++++++++++++-
 drivers/net/hyperv/rndis_filter.c |   2 +
 include/linux/hyperv.h            |   5 ++
 4 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hyperv/hyperv_net.h b/drivers/net/hyperv/hyperv_net.h
index b11aa68b44ec..c2fbb9d4df2c 100644
--- a/drivers/net/hyperv/hyperv_net.h
+++ b/drivers/net/hyperv/hyperv_net.h
@@ -164,6 +164,7 @@ struct hv_netvsc_packet {
 	u32 total_bytes;
 	u32 send_buf_index;
 	u32 total_data_buflen;
+	struct hv_dma_range *dma_range;
 };
 
 #define NETVSC_HASH_KEYLEN 40
@@ -1074,6 +1075,7 @@ struct netvsc_device {
 
 	/* Receive buffer allocated by us but manages by NetVSP */
 	void *recv_buf;
+	void *recv_original_buf;
 	u32 recv_buf_size; /* allocated bytes */
 	u32 recv_buf_gpadl_handle;
 	u32 recv_section_cnt;
@@ -1082,6 +1084,8 @@ struct netvsc_device {
 
 	/* Send buffer allocated by us */
 	void *send_buf;
+	void *send_original_buf;
+	u32 send_buf_size;
 	u32 send_buf_gpadl_handle;
 	u32 send_section_cnt;
 	u32 send_section_size;
@@ -1729,4 +1733,6 @@ struct rndis_message {
 #define RETRY_US_HI	10000
 #define RETRY_MAX	2000	/* >10 sec */
 
+void netvsc_dma_unmap(struct hv_device *hv_dev,
+		      struct hv_netvsc_packet *packet);
 #endif /* _HYPERV_NET_H */
diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 7bd935412853..fc312e5db4d5 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -153,8 +153,21 @@ static void free_netvsc_device(struct rcu_head *head)
 	int i;
 
 	kfree(nvdev->extension);
-	vfree(nvdev->recv_buf);
-	vfree(nvdev->send_buf);
+
+	if (nvdev->recv_original_buf) {
+		vunmap(nvdev->recv_buf);
+		vfree(nvdev->recv_original_buf);
+	} else {
+		vfree(nvdev->recv_buf);
+	}
+
+	if (nvdev->send_original_buf) {
+		vunmap(nvdev->send_buf);
+		vfree(nvdev->send_original_buf);
+	} else {
+		vfree(nvdev->send_buf);
+	}
+
 	kfree(nvdev->send_section_map);
 
 	for (i = 0; i < VRSS_CHANNEL_MAX; i++) {
@@ -330,6 +343,27 @@ int netvsc_alloc_recv_comp_ring(struct netvsc_device *net_device, u32 q_idx)
 	return nvchan->mrc.slots ? 0 : -ENOMEM;
 }
 
+static void *netvsc_remap_buf(void *buf, unsigned long size)
+{
+	unsigned long *pfns;
+	void *vaddr;
+	int i;
+
+	pfns = kcalloc(size / HV_HYP_PAGE_SIZE, sizeof(unsigned long),
+		       GFP_KERNEL);
+	if (!pfns)
+		return NULL;
+
+	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
+		pfns[i] = virt_to_hvpfn(buf + i * HV_HYP_PAGE_SIZE)
+			+ (ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
+
+	vaddr = vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE, PAGE_KERNEL_IO);
+	kfree(pfns);
+
+	return vaddr;
+}
+
 static int netvsc_init_buf(struct hv_device *device,
 			   struct netvsc_device *net_device,
 			   const struct netvsc_device_info *device_info)
@@ -340,6 +374,7 @@ static int netvsc_init_buf(struct hv_device *device,
 	unsigned int buf_size;
 	size_t map_words;
 	int i, ret = 0;
+	void *vaddr;
 
 	/* Get receive buffer area. */
 	buf_size = device_info->recv_sections * device_info->recv_section_size;
@@ -375,6 +410,15 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = netvsc_remap_buf(net_device->recv_buf, buf_size);
+		if (!vaddr)
+			goto cleanup;
+
+		net_device->recv_original_buf = net_device->recv_buf;
+		net_device->recv_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -477,6 +521,15 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = netvsc_remap_buf(net_device->send_buf, buf_size);
+		if (!vaddr)
+			goto cleanup;
+
+		net_device->send_original_buf = net_device->send_buf;
+		net_device->send_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -767,7 +820,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 
 	/* Notify the layer above us */
 	if (likely(skb)) {
-		const struct hv_netvsc_packet *packet
+		struct hv_netvsc_packet *packet
 			= (struct hv_netvsc_packet *)skb->cb;
 		u32 send_index = packet->send_buf_index;
 		struct netvsc_stats *tx_stats;
@@ -783,6 +836,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 		tx_stats->bytes += packet->total_bytes;
 		u64_stats_update_end(&tx_stats->syncp);
 
+		netvsc_dma_unmap(ndev_ctx->device_ctx, packet);
 		napi_consume_skb(skb, budget);
 	}
 
@@ -947,6 +1001,82 @@ static void netvsc_copy_to_send_buf(struct netvsc_device *net_device,
 		memset(dest, 0, padding);
 }
 
+void netvsc_dma_unmap(struct hv_device *hv_dev,
+		      struct hv_netvsc_packet *packet)
+{
+	u32 page_count = packet->cp_partial ?
+		packet->page_buf_cnt - packet->rmsg_pgcnt :
+		packet->page_buf_cnt;
+	int i;
+
+	if (!hv_is_isolation_supported())
+		return;
+
+	if (!packet->dma_range)
+		return;
+
+	for (i = 0; i < page_count; i++)
+		dma_unmap_single(&hv_dev->device, packet->dma_range[i].dma,
+				 packet->dma_range[i].mapping_size,
+				 DMA_TO_DEVICE);
+
+	kfree(packet->dma_range);
+}
+
+/* netvsc_dma_map - Map swiotlb bounce buffer with data page of
+ * packet sent by vmbus_sendpacket_pagebuffer() in the Isolation
+ * VM.
+ *
+ * In isolation VM, netvsc send buffer has been marked visible to
+ * host and so the data copied to send buffer doesn't need to use
+ * bounce buffer. The data pages handled by vmbus_sendpacket_pagebuffer()
+ * may not be copied to send buffer and so these pages need to be
+ * mapped with swiotlb bounce buffer. netvsc_dma_map() is to do
+ * that. The pfns in the struct hv_page_buffer need to be converted
+ * to bounce buffer's pfn. The loop here is necessary and so not
+ * use dma_map_sg() here.
+ */
+int netvsc_dma_map(struct hv_device *hv_dev,
+		   struct hv_netvsc_packet *packet,
+		   struct hv_page_buffer *pb)
+{
+	u32 page_count =  packet->cp_partial ?
+		packet->page_buf_cnt - packet->rmsg_pgcnt :
+		packet->page_buf_cnt;
+	dma_addr_t dma;
+	int i;
+
+	if (!hv_is_isolation_supported())
+		return 0;
+
+	packet->dma_range = kcalloc(page_count,
+				    sizeof(*packet->dma_range),
+				    GFP_KERNEL);
+	if (!packet->dma_range)
+		return -ENOMEM;
+
+	for (i = 0; i < page_count; i++) {
+		char *src = phys_to_virt((pb[i].pfn << HV_HYP_PAGE_SHIFT)
+					 + pb[i].offset);
+		u32 len = pb[i].len;
+
+		dma = dma_map_single(&hv_dev->device, src, len,
+				     DMA_TO_DEVICE);
+		if (dma_mapping_error(&hv_dev->device, dma)) {
+			kfree(packet->dma_range);
+			return -ENOMEM;
+		}
+
+		packet->dma_range[i].dma = dma;
+		packet->dma_range[i].mapping_size = len;
+		pb[i].pfn = dma >> HV_HYP_PAGE_SHIFT;
+		pb[i].offset = offset_in_hvpage(dma);
+		pb[i].len = len;
+	}
+
+	return 0;
+}
+
 static inline int netvsc_send_pkt(
 	struct hv_device *device,
 	struct hv_netvsc_packet *packet,
@@ -987,14 +1117,22 @@ static inline int netvsc_send_pkt(
 
 	trace_nvsp_send_pkt(ndev, out_channel, rpkt);
 
+	packet->dma_range = NULL;
 	if (packet->page_buf_cnt) {
 		if (packet->cp_partial)
 			pb += packet->rmsg_pgcnt;
 
+		ret = netvsc_dma_map(ndev_ctx->device_ctx, packet, pb);
+		if (ret)
+			return ret;
+
 		ret = vmbus_sendpacket_pagebuffer(out_channel,
 						  pb, packet->page_buf_cnt,
 						  &nvmsg, sizeof(nvmsg),
 						  req_id);
+
+		if (ret)
+			netvsc_dma_unmap(ndev_ctx->device_ctx, packet);
 	} else {
 		ret = vmbus_sendpacket(out_channel,
 				       &nvmsg, sizeof(nvmsg),
diff --git a/drivers/net/hyperv/rndis_filter.c b/drivers/net/hyperv/rndis_filter.c
index 983bf362466a..9425fee85aa0 100644
--- a/drivers/net/hyperv/rndis_filter.c
+++ b/drivers/net/hyperv/rndis_filter.c
@@ -361,6 +361,8 @@ static void rndis_filter_receive_response(struct net_device *ndev,
 			}
 		}
 
+		netvsc_dma_unmap(((struct net_device_context *)
+			netdev_priv(ndev))->device_ctx, &request->pkt);
 		complete(&request->wait_event);
 	} else {
 		netdev_err(ndev,
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index babbe19f57e2..90abff664495 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1616,6 +1616,11 @@ struct hyperv_service_callback {
 	void (*callback)(void *context);
 };
 
+struct hv_dma_range {
+	dma_addr_t dma;
+	u32 mapping_size;
+};
+
 #define MAX_SRV_VER	0x7ffffff
 extern bool vmbus_prep_negotiate_resp(struct icmsg_hdr *icmsghdrp, u8 *buf, u32 buflen,
 				const int *fw_version, int fw_vercnt,
-- 
2.25.1


