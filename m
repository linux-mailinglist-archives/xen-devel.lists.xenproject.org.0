Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57D45A5D4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 15:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229648.397149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWuv-0007Zu-SO; Tue, 23 Nov 2021 14:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229648.397149; Tue, 23 Nov 2021 14:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpWuv-0007XL-Nx; Tue, 23 Nov 2021 14:37:05 +0000
Received: by outflank-mailman (input) for mailman id 229648;
 Tue, 23 Nov 2021 14:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpN+=QK=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mpWuu-0006Ps-4e
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 14:37:04 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d288dc8e-4c6a-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 15:37:03 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so2240929pjb.5
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 06:37:03 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:1:af65:c3d4:6df:5a8b])
 by smtp.gmail.com with ESMTPSA id j13sm11926127pfc.151.2021.11.23.06.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:37:01 -0800 (PST)
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
X-Inumbo-ID: d288dc8e-4c6a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ak926pCUpNKs+47FmVVMlYhwNY9vAunl0LxYrKNKSNw=;
        b=QxxMavfWDAJAz7jNhCS3lNTNa0flyv5hNihdQPccb5eNCjHF55hQpWrnsEQkCVJghc
         7GPdcT9HSD5QViryH0UX4Aun2WA+mGBa3Amr3ad9iSXIuSGQC24/bMpDjGgiFb4k/a9a
         ZAYNXQoeZmxJm3HiW7hj+JkREkiGe8NUYb/+S8lBQGh4bi3TU+N+GfremM9Ba5JS8SPD
         8wNuTIzD34QP1Pzt5TU42nLmCmWJm3r5yxYzZS/tIc11jyeaKntaaRsqcB2DjiSxqBe2
         zqVd2p6oiNp4mOxg/CZiswjoXfCt/DOMgeHrMN9AL4KvPtBfL8X+QWcwzsFyPSdJLLkC
         5TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ak926pCUpNKs+47FmVVMlYhwNY9vAunl0LxYrKNKSNw=;
        b=ibionB6bE/cKw69bsKymXtsaW2Nlqhangc7hbl+PPZsXonrrGkTiWFBw4tRmbv9GnL
         r03UHg+JeUZYoVNgwh1qdRqfaTHBdDeNJDQNhXSGGK1Hrv3g19qqIsU5jwBBOnK9oRAr
         rdjNg3idWZ02fjnxEF8yXubI+RQ8ORe6Ii31bmn/fL0QQir1YG50lBHlt33kmDN2gbfW
         D8SO1AmpeykO9RhGiYRx7R/GwTjunbsQANy0pi2/3Y6jRfsYCB831OzE02jS/FS3m5g/
         31hVwrAtMFGHViV9NlnHyFkqHTLiomA30Li1JJU6qfjRlVE1LjionG+1pHjDiAuYQG3R
         ZdIA==
X-Gm-Message-State: AOAM530q5buvUzL3tC87rFwcvzNQM5hDYvrvY+zq3VmcgH1itcO4DWbe
	R5eW5tG1RJyhtj7BPyvGqus=
X-Google-Smtp-Source: ABdhPJxTU1w0vUGn7mvy7jQu/10DsjPZwfyCqNOGRf+62qAFrRBW+AJvObLD7wd2mtZecQ+9K9O66g==
X-Received: by 2002:a17:90b:1e4e:: with SMTP id pi14mr3462656pjb.161.1637678221896;
        Tue, 23 Nov 2021 06:37:01 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V2 6/6] scsi: storvsc: Add Isolation VM support for storvsc driver
Date: Tue, 23 Nov 2021 09:30:37 -0500
Message-Id: <20211123143039.331929-7-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123143039.331929-1-ltykernel@gmail.com>
References: <20211123143039.331929-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Isolation VM, all shared memory with host needs to mark visible
to host via hvcall. vmbus_establish_gpadl() has already done it for
storvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
mpb_desc() still needs to be handled. Use DMA API(scsi_dma_map/unmap)
to map these memory during sending/receiving packet and return swiotlb
bounce buffer dma address. In Isolation VM, swiotlb  bounce buffer is
marked to be visible to host and the swiotlb force mode is enabled.

Set device's dma min align mask to HV_HYP_PAGE_SIZE - 1 in order to
keep the original data offset in the bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/scsi/storvsc_drv.c | 37 +++++++++++++++++++++----------------
 include/linux/hyperv.h     |  1 +
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 20595c0ba0ae..ae293600d799 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -21,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/hyperv.h>
 #include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
+
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
@@ -1336,6 +1338,7 @@ static void storvsc_on_channel_callback(void *context)
 					continue;
 				}
 				request = (struct storvsc_cmd_request *)scsi_cmd_priv(scmnd);
+				scsi_dma_unmap(scmnd);
 			}
 
 			storvsc_on_receive(stor_device, packet, request);
@@ -1749,7 +1752,6 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 	struct hv_host_device *host_dev = shost_priv(host);
 	struct hv_device *dev = host_dev->dev;
 	struct storvsc_cmd_request *cmd_request = scsi_cmd_priv(scmnd);
-	int i;
 	struct scatterlist *sgl;
 	unsigned int sg_count;
 	struct vmscsi_request *vm_srb;
@@ -1831,10 +1833,11 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 	payload_sz = sizeof(cmd_request->mpb);
 
 	if (sg_count) {
-		unsigned int hvpgoff, hvpfns_to_add;
 		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
 		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
-		u64 hvpfn;
+		struct scatterlist *sg;
+		unsigned long hvpfn, hvpfns_to_add;
+		int j, i = 0;
 
 		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
 
@@ -1848,21 +1851,22 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		payload->range.len = length;
 		payload->range.offset = offset_in_hvpg;
 
+		sg_count = scsi_dma_map(scmnd);
+		if (sg_count < 0)
+			return SCSI_MLQUEUE_DEVICE_BUSY;
 
-		for (i = 0; sgl != NULL; sgl = sg_next(sgl)) {
+		for_each_sg(sgl, sg, sg_count, j) {
 			/*
-			 * Init values for the current sgl entry. hvpgoff
-			 * and hvpfns_to_add are in units of Hyper-V size
-			 * pages. Handling the PAGE_SIZE != HV_HYP_PAGE_SIZE
-			 * case also handles values of sgl->offset that are
-			 * larger than PAGE_SIZE. Such offsets are handled
-			 * even on other than the first sgl entry, provided
-			 * they are a multiple of PAGE_SIZE.
+			 * Init values for the current sgl entry. hvpfns_to_add
+			 * is in units of Hyper-V size pages. Handling the
+			 * PAGE_SIZE != HV_HYP_PAGE_SIZE case also handles
+			 * values of sgl->offset that are larger than PAGE_SIZE.
+			 * Such offsets are handled even on other than the first
+			 * sgl entry, provided they are a multiple of PAGE_SIZE.
 			 */
-			hvpgoff = HVPFN_DOWN(sgl->offset);
-			hvpfn = page_to_hvpfn(sg_page(sgl)) + hvpgoff;
-			hvpfns_to_add =	HVPFN_UP(sgl->offset + sgl->length) -
-						hvpgoff;
+			hvpfn = HVPFN_DOWN(sg_dma_address(sg));
+			hvpfns_to_add = HVPFN_UP(sg_dma_address(sg) +
+						 sg_dma_len(sg)) - hvpfn;
 
 			/*
 			 * Fill the next portion of the PFN array with
@@ -1872,7 +1876,7 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 			 * the PFN array is filled.
 			 */
 			while (hvpfns_to_add--)
-				payload->range.pfn_array[i++] =	hvpfn++;
+				payload->range.pfn_array[i++] = hvpfn++;
 		}
 	}
 
@@ -2016,6 +2020,7 @@ static int storvsc_probe(struct hv_device *device,
 	stor_device->vmscsi_size_delta = sizeof(struct vmscsi_win8_extension);
 	spin_lock_init(&stor_device->lock);
 	hv_set_drvdata(device, stor_device);
+	dma_set_min_align_mask(&device->device, HV_HYP_PAGE_SIZE - 1);
 
 	stor_device->port_number = host->host_no;
 	ret = storvsc_connect_to_vsp(device, storvsc_ringbuffer_size, is_fc);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 8882e46d1070..2840e51ee5c5 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1262,6 +1262,7 @@ struct hv_device {
 
 	struct vmbus_channel *channel;
 	struct kset	     *channels_kset;
+	struct device_dma_parameters dma_parms;
 
 	/* place holder to keep track of the dir for hv device in debugfs */
 	struct dentry *debug_dir;
-- 
2.25.1


