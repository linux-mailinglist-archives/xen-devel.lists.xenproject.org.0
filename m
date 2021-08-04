Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C53E0858
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163901.300103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBM3a-0003nO-Ct; Wed, 04 Aug 2021 18:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163901.300103; Wed, 04 Aug 2021 18:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBM3a-0003kE-9V; Wed, 04 Aug 2021 18:55:58 +0000
Received: by outflank-mailman (input) for mailman id 163901;
 Wed, 04 Aug 2021 18:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLum-0005Nn-2N
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:46:52 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af55b08c-165e-49fd-aead-d7b77574f750;
 Wed, 04 Aug 2021 18:45:58 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id mt6so4363003pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:58 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:57 -0700 (PDT)
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
X-Inumbo-ID: af55b08c-165e-49fd-aead-d7b77574f750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29igml5xJQT7NZ/zHELD608zwBtMw+CBZNUu6aD3TXw=;
        b=YYV/m/LMm9LueSaFvS1QqjEzusaN78zRUrtnhZOuMU1heWUA9GqVjn0EIfdioy78dO
         pqyQr1mh3jD0fZRJ227Vtm1Yr/MBIZJfqPV9t2r5oVj/djtM4H34a0d2hv9nWJlmMMMc
         C0ZzKol4Vgsz/Q9xqcn/U6GmtuToaeHJ1NsP9ZfEz7Fm5ahWkDMW7GGoANygL8DZ1y+9
         uQ94GlUlEs4n5qTeavI4gSb/EIbS1zykqnrzZoZRj6oHARuYcWdHel7RiRpwWfqTur7t
         +RFWBknyfar4zEtojp765cEWGfOex77YKgaagkx/IKKYP556Mlmva4L/VpYkV17KUMj1
         QvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29igml5xJQT7NZ/zHELD608zwBtMw+CBZNUu6aD3TXw=;
        b=IhXAAiF2fz8jCPVe6dnvBUCcjAj2GtNXjGiypmxd3zXcJfuKTRucNbnv2Tf2Msbzho
         QSS/NIVph0zia9mSc08qsU/VX5V1emNZI+QCHofBZ9zqgR8hKEO2posetHZcdssv5FKZ
         eb4+JFKtaXUlJMM4jF/DoUfoXX6iew8dk/v5OGRdDqvJJ1cdYP6Ls8KuZpG8u4zCWcOM
         X8k/rSpta/LsDxQUnTz7Irb29nXu/jBmpd3NO36Zhf57B4nLzDwUIN8xXUiAsqsQL9gG
         vadzLV2/UOomTZ11QORWITkt6r3k35BwFE8g9X56BB12ue96xgVyOi1VVL72wjVnw7Kg
         +5rQ==
X-Gm-Message-State: AOAM531Sia9SSvsZoXmvzdm5ePpR6FAi3Z4H92z++E8w2+6WM2+MoDRI
	SQGYORhhEYYxPiGqzfH8fqI=
X-Google-Smtp-Source: ABdhPJys+uUC+8R4d08qbIFnIv7LBHGpTM/c9FmBOlVHRSO99KZWQKeZJC0uWF82I4cQhSNYNbC05Q==
X-Received: by 2002:a17:902:8b83:b029:12c:cbce:a52f with SMTP id ay3-20020a1709028b83b029012ccbcea52fmr546876plb.9.1628102758109;
        Wed, 04 Aug 2021 11:45:58 -0700 (PDT)
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
	Tianyu.Lan@microsoft.com,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	martin.b.radev@gmail.com,
	ardb@kernel.org,
	rientjes@google.com,
	tj@kernel.org,
	keescook@chromium.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com
Subject: [PATCH V2 14/14] HV/Storvsc: Add Isolation VM support for storvsc driver
Date: Wed,  4 Aug 2021 14:45:10 -0400
Message-Id: <20210804184513.512888-15-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804184513.512888-1-ltykernel@gmail.com>
References: <20210804184513.512888-1-ltykernel@gmail.com>
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
 drivers/scsi/storvsc_drv.c | 68 +++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 328bb961c281..78320719bdd8 100644
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
 
 
@@ -509,6 +513,14 @@ struct storvsc_scan_work {
 	u8 tgt_id;
 };
 
+#define storvsc_dma_map(dev, page, offset, size, dir) \
+	dma_map_page(dev, page, offset, size, dir)
+
+#define storvsc_dma_unmap(dev, dma_range, dir)		\
+		dma_unmap_page(dev, dma_range.dma,	\
+			       dma_range.mapping_size,	\
+			       dir ? DMA_FROM_DEVICE : DMA_TO_DEVICE)
+
 static void storvsc_device_scan(struct work_struct *work)
 {
 	struct storvsc_scan_work *wrk;
@@ -1260,6 +1272,7 @@ static void storvsc_on_channel_callback(void *context)
 	struct hv_device *device;
 	struct storvsc_device *stor_device;
 	struct Scsi_Host *shost;
+	int i;
 
 	if (channel->primary_channel != NULL)
 		device = channel->primary_channel->device_obj;
@@ -1314,6 +1327,15 @@ static void storvsc_on_channel_callback(void *context)
 				request = (struct storvsc_cmd_request *)scsi_cmd_priv(scmnd);
 			}
 
+			if (request->dma_range) {
+				for (i = 0; i < request->hvpg_count; i++)
+					storvsc_dma_unmap(&device->device,
+						request->dma_range[i],
+						request->vstor_packet.vm_srb.data_in == READ_TYPE);
+
+				kfree(request->dma_range);
+			}
+
 			storvsc_on_receive(stor_device, packet, request);
 			continue;
 		}
@@ -1810,7 +1832,9 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		unsigned int hvpgoff, hvpfns_to_add;
 		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
 		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
+		dma_addr_t dma;
 		u64 hvpfn;
+		u32 size;
 
 		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
 
@@ -1824,6 +1848,13 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
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
@@ -1847,9 +1878,29 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 			 * last sgl should be reached at the same time that
 			 * the PFN array is filled.
 			 */
-			while (hvpfns_to_add--)
-				payload->range.pfn_array[i++] =	hvpfn++;
+			while (hvpfns_to_add--) {
+				size = min(HV_HYP_PAGE_SIZE - offset_in_hvpg,
+					   (unsigned long)length);
+				dma = storvsc_dma_map(&dev->device, pfn_to_page(hvpfn++),
+						      offset_in_hvpg, size,
+						      scmnd->sc_data_direction);
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
@@ -1860,13 +1911,20 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
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


