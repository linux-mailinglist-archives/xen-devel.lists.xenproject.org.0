Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40444468A0F
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 09:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238268.413043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj8-0007sb-0E; Sun, 05 Dec 2021 08:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238268.413043; Sun, 05 Dec 2021 08:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj7-0007np-NY; Sun, 05 Dec 2021 08:18:29 +0000
Received: by outflank-mailman (input) for mailman id 238268;
 Sun, 05 Dec 2021 08:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5+j=QW=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mtmj5-0006T9-Jk
 for xen-devel@lists.xenproject.org; Sun, 05 Dec 2021 08:18:27 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb385bbb-55a3-11ec-a5e1-b9374ead2679;
 Sun, 05 Dec 2021 09:18:26 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id k4so7393590pgb.8
 for <xen-devel@lists.xenproject.org>; Sun, 05 Dec 2021 00:18:26 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:87aa:e334:f070:ebca])
 by smtp.gmail.com with ESMTPSA id s8sm6439905pgl.77.2021.12.05.00.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 00:18:24 -0800 (PST)
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
X-Inumbo-ID: eb385bbb-55a3-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1g0RnzssZkBnBKymEz0YZXD32oRDdHA8PZSX43vBfcQ=;
        b=GLV5SN0aM1zX+npMBCV8ehIn8sPfIInvB3Ok1Q4s5tUiQaAawCS8qK3tyqYp4kzUH5
         5M+CDcEFe/xznZhgI6svYBO7tH1vy2jUjd0iDZAslp8luBrXA4gwa4dv62TXBbjsL7vU
         wtuuFui9z2YcQ2TZW5S66WgyU7CFrMAAvJrs0pjOjOwGlzLTdMAk2UMnlIo5wl2UHp44
         ABgxN2MdvrXhMQXihZYqv5SV/KRdJcQwPPAviTcO9YhrXmi+FzfdEW9Buo+LhuQKqR/l
         D2TGTok8m6RystIaIp4W9W7MTsZ2tg/WrRu/nvb0xaRoRMRIo2qahZ5P0NT/wzY8ANCE
         XmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1g0RnzssZkBnBKymEz0YZXD32oRDdHA8PZSX43vBfcQ=;
        b=phfPtu8wPIKCktiVxaPTvWFCLgfY0oNSuAN7PDvVwx3KMWilEcOumEdL3opVIyLmS2
         KC40UbSW5AYe/26v3Tu2toMEKZw4d0otnrU2WvyNJEfnBWN/4Tgr5YKt2n32THB4dXfz
         hluUdE2NMtAvTF3uQZIYZ18daj9FqUhEdM9wwfaWZTMU+clvIcg6tN4+r4qw0xTrT1zS
         2NXeuQYHPdQp8BH5JD6I1tupsL7QRy2WPajsZPtiOgLgNrfztqY2iQL/OcbD0p9veSJc
         18bRn5OrvfIE58dHvnH6c8cdvyJj3IXWZ9x+ICxjtQWgtLcnBEloV8UL4ugayLwke5i4
         +A3g==
X-Gm-Message-State: AOAM532MelV6qnU9xLhdxdoV/VnRx9hHWj3VOPeYHLiXFByx03tsZGUw
	oCBukMkHZ0+PMbEo53XngZA=
X-Google-Smtp-Source: ABdhPJzmsHani2koAEhC+FclZq201HIttbqR1IpHXAGPX5Onn+eERvWMeBnYUf+pPYE3TO/rGmUFsA==
X-Received: by 2002:a62:8042:0:b0:4a8:15eb:db10 with SMTP id j63-20020a628042000000b004a815ebdb10mr29233467pfd.28.1638692305084;
        Sun, 05 Dec 2021 00:18:25 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@infradead.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 5/5] hv_netvsc: Add Isolation VM support for netvsc driver
Date: Sun,  5 Dec 2021 03:18:13 -0500
Message-Id: <20211205081815.129276-6-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205081815.129276-1-ltykernel@gmail.com>
References: <20211205081815.129276-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Isolation VM, all shared memory with host needs to mark visible
to host via hvcall. vmbus_establish_gpadl() has already done it for
netvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
pagebuffer() stills need to be handled. Use DMA API to map/umap
these memory during sending/receiving packet and Hyper-V swiotlb
bounce buffer dma address will be returned. The swiotlb bounce buffer
has been masked to be visible to host during boot up.

rx/tx ring buffer is allocated via vzalloc() and they need to be
mapped into unencrypted address space(above vTOM) before sharing
with host and accessing. Add hv_map/unmap_memory() to map/umap rx
/tx ring buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
       * Replace HV_HYP_PAGE_SIZE with PAGE_SIZE and virt_to_hvpfn()
         with vmalloc_to_pfn() in the hv_map_memory()

Change since v2:
       * Add hv_map/unmap_memory() to map/umap rx/tx ring buffer.
---
 arch/x86/hyperv/ivm.c             |  28 ++++++
 drivers/hv/hv_common.c            |  11 +++
 drivers/net/hyperv/hyperv_net.h   |   5 ++
 drivers/net/hyperv/netvsc.c       | 136 +++++++++++++++++++++++++++++-
 drivers/net/hyperv/netvsc_drv.c   |   1 +
 drivers/net/hyperv/rndis_filter.c |   2 +
 include/asm-generic/mshyperv.h    |   2 +
 include/linux/hyperv.h            |   5 ++
 8 files changed, 187 insertions(+), 3 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 69c7a57f3307..2b994117581e 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -287,3 +287,31 @@ int hv_set_mem_host_visibility(unsigned long kbuffer, int pagecount, bool visibl
 	kfree(pfn_array);
 	return ret;
 }
+
+/*
+ * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
+ */
+void *hv_map_memory(void *addr, unsigned long size)
+{
+	unsigned long *pfns = kcalloc(size / PAGE_SIZE,
+				      sizeof(unsigned long), GFP_KERNEL);
+	void *vaddr;
+	int i;
+
+	if (!pfns)
+		return NULL;
+
+	for (i = 0; i < size / PAGE_SIZE; i++)
+		pfns[i] = vmalloc_to_pfn(addr + i * PAGE_SIZE) +
+			(ms_hyperv.shared_gpa_boundary >> PAGE_SHIFT);
+
+	vaddr = vmap_pfn(pfns, size / PAGE_SIZE, PAGE_KERNEL_IO);
+	kfree(pfns);
+
+	return vaddr;
+}
+
+void hv_unmap_memory(void *addr)
+{
+	vunmap(addr);
+}
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 7be173a99f27..3c5cb1f70319 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -295,3 +295,14 @@ u64 __weak hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_s
 	return HV_STATUS_INVALID_PARAMETER;
 }
 EXPORT_SYMBOL_GPL(hv_ghcb_hypercall);
+
+void __weak *hv_map_memory(void *addr, unsigned long size)
+{
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(hv_map_memory);
+
+void __weak hv_unmap_memory(void *addr)
+{
+}
+EXPORT_SYMBOL_GPL(hv_unmap_memory);
diff --git a/drivers/net/hyperv/hyperv_net.h b/drivers/net/hyperv/hyperv_net.h
index 315278a7cf88..cf69da0e296c 100644
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
 	struct vmbus_gpadl recv_buf_gpadl_handle;
 	u32 recv_section_cnt;
@@ -1082,6 +1084,7 @@ struct netvsc_device {
 
 	/* Send buffer allocated by us */
 	void *send_buf;
+	void *send_original_buf;
 	u32 send_buf_size;
 	struct vmbus_gpadl send_buf_gpadl_handle;
 	u32 send_section_cnt;
@@ -1731,4 +1734,6 @@ struct rndis_message {
 #define RETRY_US_HI	10000
 #define RETRY_MAX	2000	/* >10 sec */
 
+void netvsc_dma_unmap(struct hv_device *hv_dev,
+		      struct hv_netvsc_packet *packet);
 #endif /* _HYPERV_NET_H */
diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 396bc1c204e6..b7ade735a806 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -153,8 +153,21 @@ static void free_netvsc_device(struct rcu_head *head)
 	int i;
 
 	kfree(nvdev->extension);
-	vfree(nvdev->recv_buf);
-	vfree(nvdev->send_buf);
+
+	if (nvdev->recv_original_buf) {
+		hv_unmap_memory(nvdev->recv_buf);
+		vfree(nvdev->recv_original_buf);
+	} else {
+		vfree(nvdev->recv_buf);
+	}
+
+	if (nvdev->send_original_buf) {
+		hv_unmap_memory(nvdev->send_buf);
+		vfree(nvdev->send_original_buf);
+	} else {
+		vfree(nvdev->send_buf);
+	}
+
 	kfree(nvdev->send_section_map);
 
 	for (i = 0; i < VRSS_CHANNEL_MAX; i++) {
@@ -338,6 +351,7 @@ static int netvsc_init_buf(struct hv_device *device,
 	unsigned int buf_size;
 	size_t map_words;
 	int i, ret = 0;
+	void *vaddr;
 
 	/* Get receive buffer area. */
 	buf_size = device_info->recv_sections * device_info->recv_section_size;
@@ -373,6 +387,17 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = hv_map_memory(net_device->recv_buf, buf_size);
+		if (!vaddr) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		net_device->recv_original_buf = net_device->recv_buf;
+		net_device->recv_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -476,6 +501,17 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = hv_map_memory(net_device->send_buf, buf_size);
+		if (!vaddr) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		net_device->send_original_buf = net_device->send_buf;
+		net_device->send_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -766,7 +802,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 
 	/* Notify the layer above us */
 	if (likely(skb)) {
-		const struct hv_netvsc_packet *packet
+		struct hv_netvsc_packet *packet
 			= (struct hv_netvsc_packet *)skb->cb;
 		u32 send_index = packet->send_buf_index;
 		struct netvsc_stats *tx_stats;
@@ -782,6 +818,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 		tx_stats->bytes += packet->total_bytes;
 		u64_stats_update_end(&tx_stats->syncp);
 
+		netvsc_dma_unmap(ndev_ctx->device_ctx, packet);
 		napi_consume_skb(skb, budget);
 	}
 
@@ -946,6 +983,88 @@ static void netvsc_copy_to_send_buf(struct netvsc_device *net_device,
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
+ * to bounce buffer's pfn. The loop here is necessary because the
+ * entries in the page buffer array are not necessarily full
+ * pages of data.  Each entry in the array has a separate offset and
+ * len that may be non-zero, even for entries in the middle of the
+ * array.  And the entries are not physically contiguous.  So each
+ * entry must be individually mapped rather than as a contiguous unit.
+ * So not use dma_map_sg() here.
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
+		/* pb[].offset and pb[].len are not changed during dma mapping
+		 * and so not reassign.
+		 */
+		packet->dma_range[i].dma = dma;
+		packet->dma_range[i].mapping_size = len;
+		pb[i].pfn = dma >> HV_HYP_PAGE_SHIFT;
+	}
+
+	return 0;
+}
+
 static inline int netvsc_send_pkt(
 	struct hv_device *device,
 	struct hv_netvsc_packet *packet,
@@ -986,14 +1105,24 @@ static inline int netvsc_send_pkt(
 
 	trace_nvsp_send_pkt(ndev, out_channel, rpkt);
 
+	packet->dma_range = NULL;
 	if (packet->page_buf_cnt) {
 		if (packet->cp_partial)
 			pb += packet->rmsg_pgcnt;
 
+		ret = netvsc_dma_map(ndev_ctx->device_ctx, packet, pb);
+		if (ret) {
+			ret = -EAGAIN;
+			goto exit;
+		}
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
@@ -1001,6 +1130,7 @@ static inline int netvsc_send_pkt(
 				       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
 	}
 
+exit:
 	if (ret == 0) {
 		atomic_inc_return(&nvchan->queue_sends);
 
diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index 7e66ae1d2a59..17958533bf30 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -2512,6 +2512,7 @@ static int netvsc_probe(struct hv_device *dev,
 	net->netdev_ops = &device_ops;
 	net->ethtool_ops = &ethtool_ops;
 	SET_NETDEV_DEV(net, &dev->device);
+	dma_set_min_align_mask(&dev->device, HV_HYP_PAGE_SIZE - 1);
 
 	/* We always need headroom for rndis header */
 	net->needed_headroom = RNDIS_AND_PPI_SIZE;
diff --git a/drivers/net/hyperv/rndis_filter.c b/drivers/net/hyperv/rndis_filter.c
index f6c9c2a670f9..448fcc325ed7 100644
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
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 3e2248ac328e..94e73ba129c5 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -269,6 +269,8 @@ bool hv_isolation_type_snp(void);
 u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
+void *hv_map_memory(void *addr, unsigned long size);
+void hv_unmap_memory(void *addr);
 #else /* CONFIG_HYPERV */
 static inline bool hv_is_hyperv_initialized(void) { return false; }
 static inline bool hv_is_hibernation_supported(void) { return false; }
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 74f5e92f91a0..b53cfc4163af 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1584,6 +1584,11 @@ struct hyperv_service_callback {
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


