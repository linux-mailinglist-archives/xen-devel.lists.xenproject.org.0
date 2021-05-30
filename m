Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1212395255
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134310.250018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPEB-0007HI-1S; Sun, 30 May 2021 17:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134310.250018; Sun, 30 May 2021 17:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPEA-00070q-CN; Sun, 30 May 2021 17:27:54 +0000
Received: by outflank-mailman (input) for mailman id 134310;
 Sun, 30 May 2021 15:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN2M-0000PC-1b
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:07:34 +0000
Received: from mail-pg1-x531.google.com (unknown [2607:f8b0:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf0b8c41-fb1f-455e-ad3b-9c9f328fc9cd;
 Sun, 30 May 2021 15:06:54 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 29so6414704pgu.11
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:54 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:53 -0700 (PDT)
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
X-Inumbo-ID: cf0b8c41-fb1f-455e-ad3b-9c9f328fc9cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M1xVjAHigQsVBryVftpCCjvg81+wOTUQfr50wSa0z0o=;
        b=sNrdoZzEG12p5juMA3jBGdhwekq2aogyv4cWLt3Q9FFTt7/sBUDijWvM58X66976BO
         kJv1GfqQauUiQ6UDwB4KHSHKbqJdsTij6qKiS0I1JyaL90iuEOJ7P6aw8mucrerUw4kZ
         ynS7ThiT7E4/MDPzHnf4KZGFeGtrUHktekJ3Mt5GvomdItXJaCyBS0do306K1hhxXMvs
         vsFRVkYt5+hsjyFrhhoRTY51WzHW2c3gzdOCyN9MeS3XIsh08U9XZ1UHO+ZUZlEe0ZZh
         UW0FBTRMxa8o7owQlLms0NBS25OrbKF7Oojybmwzo1E4d4fQhPlIDfgLBDz6BGXt3erV
         1vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1xVjAHigQsVBryVftpCCjvg81+wOTUQfr50wSa0z0o=;
        b=abzUiziIt+zvbmZG4ET23op6nwaH/O8QIGGtMfUpPCq7XslgMeu5102GFsxO+MBbTE
         bzpjzTupkGw8r0uN7OmC3fi+g4bRALtWdd2UK9tQvh7ioasDxNL8AHbK6VpXyBK0/Drj
         1ZLUnymTOTZMI2F8ZrnrKznDXFiHYhmGK53hYimpXysLBOhP0m7NK7h8UusmX0LjpZVj
         N2MpjrOxrvBqUiH0n4W+0FyfzI4lJ82J4GmOZvz0Ph7MfBMdoLncKi7rvPRMab95p6Kz
         r7jLa36ZigaqTSU4clIdISqjnUtrjz4ZUcISdnwNH4b3opgJVRsRD/lZMI7yR/XpZIFl
         f+6g==
X-Gm-Message-State: AOAM533fZP4349E1T0OT30m013VkqgY93Hn/G30IuB2uVijq+ufS+VHb
	PjHmbLMuvOBSUT/nnAsH+II=
X-Google-Smtp-Source: ABdhPJziJtspWVCmOHJqaVbfIhz+FLD7bwtV5SoxX2/+91foGt0Wvcd+JVLZUDMoLpg47iIDkrNTHQ==
X-Received: by 2002:a05:6a00:1c6b:b029:2e2:caff:13fa with SMTP id s43-20020a056a001c6bb02902e2caff13famr12601991pfw.59.1622387213561;
        Sun, 30 May 2021 08:06:53 -0700 (PDT)
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
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	cai@lca.pw,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	Tianyu.Lan@microsoft.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	xen-devel@lists.xenproject.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: [RFC PATCH V3 11/11] HV/Storvsc: Add Isolation VM support for storvsc driver
Date: Sun, 30 May 2021 11:06:28 -0400
Message-Id: <20210530150628.2063957-12-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530150628.2063957-1-ltykernel@gmail.com>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Isolation VM, all shared memory with host needs to mark visible
to host via hvcall. vmbus_establish_gpadl() has already done it for
storvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
mpb_desc() still need to handle. Use DMA API to map/umap these
memory during sending/receiving packet and Hyper-V DMA ops callback
will use swiotlb function to allocate bounce buffer and copy data
from/to bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/scsi/storvsc_drv.c | 63 +++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 403753929320..32da419c134e 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -21,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/hyperv.h>
 #include <linux/blkdev.h>
+#include <linux/io.h>
+#include <linux/dma-mapping.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
@@ -427,6 +429,8 @@ struct storvsc_cmd_request {
 	u32 payload_sz;
 
 	struct vstor_packet vstor_packet;
+	u32 hvpg_count;
+	struct hv_dma_range *dma_range;
 };
 
 
@@ -1267,6 +1271,7 @@ static void storvsc_on_channel_callback(void *context)
 	struct hv_device *device;
 	struct storvsc_device *stor_device;
 	struct Scsi_Host *shost;
+	int i;
 
 	if (channel->primary_channel != NULL)
 		device = channel->primary_channel->device_obj;
@@ -1321,6 +1326,17 @@ static void storvsc_on_channel_callback(void *context)
 				request = (struct storvsc_cmd_request *)scsi_cmd_priv(scmnd);
 			}
 
+			if (request->dma_range) {
+				for (i = 0; i < request->hvpg_count; i++)
+					dma_unmap_page(&device->device,
+							request->dma_range[i].dma,
+							request->dma_range[i].mapping_size,
+							request->vstor_packet.vm_srb.data_in
+							     == READ_TYPE ?
+							DMA_FROM_DEVICE : DMA_TO_DEVICE);
+				kfree(request->dma_range);
+			}
+
 			storvsc_on_receive(stor_device, packet, request);
 			continue;
 		}
@@ -1817,7 +1833,9 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		unsigned int hvpgoff, hvpfns_to_add;
 		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
 		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
+		dma_addr_t dma;
 		u64 hvpfn;
+		u32 size;
 
 		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
 
@@ -1831,6 +1849,13 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		payload->range.len = length;
 		payload->range.offset = offset_in_hvpg;
 
+		cmd_request->dma_range = kcalloc(hvpg_count,
+				 sizeof(*cmd_request->dma_range),
+				 GFP_ATOMIC);
+		if (!cmd_request->dma_range) {
+			ret = -ENOMEM;
+			goto free_payload;
+		}
 
 		for (i = 0; sgl != NULL; sgl = sg_next(sgl)) {
 			/*
@@ -1854,9 +1879,30 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 			 * last sgl should be reached at the same time that
 			 * the PFN array is filled.
 			 */
-			while (hvpfns_to_add--)
-				payload->range.pfn_array[i++] =	hvpfn++;
+			while (hvpfns_to_add--) {
+				size = min(HV_HYP_PAGE_SIZE - offset_in_hvpg,
+					   (unsigned long)length);
+				dma = dma_map_page(&dev->device,
+							 pfn_to_page(hvpfn++),
+							 offset_in_hvpg, size,
+							 scmnd->sc_data_direction);
+				if (dma_mapping_error(&dev->device, dma)) {
+					ret = -ENOMEM;
+					goto free_dma_range;
+				}
+
+				if (offset_in_hvpg) {
+					payload->range.offset = dma & ~HV_HYP_PAGE_MASK;
+					offset_in_hvpg = 0;
+				}
+
+				cmd_request->dma_range[i].dma = dma;
+				cmd_request->dma_range[i].mapping_size = size;
+				payload->range.pfn_array[i++] = dma >> HV_HYP_PAGE_SHIFT;
+				length -= size;
+			}
 		}
+		cmd_request->hvpg_count = hvpg_count;
 	}
 
 	cmd_request->payload = payload;
@@ -1867,13 +1913,20 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 	put_cpu();
 
 	if (ret == -EAGAIN) {
-		if (payload_sz > sizeof(cmd_request->mpb))
-			kfree(payload);
 		/* no more space */
-		return SCSI_MLQUEUE_DEVICE_BUSY;
+		ret = SCSI_MLQUEUE_DEVICE_BUSY;
+		goto free_dma_range;
 	}
 
 	return 0;
+
+free_dma_range:
+	kfree(cmd_request->dma_range);
+
+free_payload:
+	if (payload_sz > sizeof(cmd_request->mpb))
+		kfree(payload);
+	return ret;
 }
 
 static struct scsi_host_template scsi_driver = {
-- 
2.25.1


