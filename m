Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283E395254
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134306.249996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE8-0006hE-QI; Sun, 30 May 2021 17:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134306.249996; Sun, 30 May 2021 17:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE8-0006R6-9H; Sun, 30 May 2021 17:27:52 +0000
Received: by outflank-mailman (input) for mailman id 134306;
 Sun, 30 May 2021 15:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN27-0000PC-18
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:07:19 +0000
Received: from mail-pj1-x1032.google.com (unknown [2607:f8b0:4864:20::1032])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6e39b98-5c8d-4af8-a799-88933df614f0;
 Sun, 30 May 2021 15:06:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso7260069pjb.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:50 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:49 -0700 (PDT)
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
X-Inumbo-ID: f6e39b98-5c8d-4af8-a799-88933df614f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8QttpWnu2vUzDHi+PZwCcYLiEemtutjgmMI/iodwPTk=;
        b=W8ClChNy/zGX4qaFJXG3v36CEkmNBgz6cFpUbxLY1MtMXiB3DOS0OEuklRIaJsUjfV
         CqNiLrgh8G3MDnqTm2tqCifdbbiQ71hz1sqU7R2dyMZh7qX5GiL+3tYuOVCF6CIkTiBu
         3WfmClEYRfWncVxeql61AC3bv02+aSKH2VTtSAeNX9rR2YLgnBdcXZAj+2VP8OnvpswI
         6IrYrAMKWnDk1x5midWNyrQPk4MmHUTraFR4iwofk71RKNS/2odDBr6VNdmfIBv6hgpz
         ljYhxqjLMoxzQDxzPB8RVmA3zmgl1Y0LYpfklpdG8vApkDP75Koqa6Bu6f2ftX6QddwC
         sV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8QttpWnu2vUzDHi+PZwCcYLiEemtutjgmMI/iodwPTk=;
        b=GZDC3q7X4298aDVxCCsz4O7VvtqMsAtUoZ2sTfMGwbHT2UVjNi38mvSqFhGzLS9Ymt
         qSquu3Nc2NqqsFbpAoCAgi5wxNskhLF1b90aPRf/2v8DfffLxUSchTRq9R+FH69DbLm8
         cihhWtXuL6l2UG+hH29Q7obmLTASmwRvF2S8TTPTDA9KEXn265e0f8BrpybHEG1IS4w8
         HnWVE3Xp3q5XObYezXGzn3hbxXLBo/Oztv7SE8PxEcQk1wl8qVmlEJOyASx6PXpz9UAb
         R08aXQzUpNyZMfbMZ07HtlfccrJrXAKb4uPOqWLygkoaNk7DkrhSZKyI1B4XjRvskG4e
         dpng==
X-Gm-Message-State: AOAM531fifVeMtENLDD6uR1wL3EUlsekQYzRddCYY8LAtdFV/GnNbckO
	EriV2pzLetj7P9ayyNYXGxU=
X-Google-Smtp-Source: ABdhPJwOFhoVhELuBsoR0x6Bkk9R5eQShuRJkYgZiLaNrPrGgc4hr2L1c/qfttmLx9Y24CFWGvaVqQ==
X-Received: by 2002:a17:902:d2d1:b029:ef:8d29:3a64 with SMTP id n17-20020a170902d2d1b02900ef8d293a64mr16523183plc.38.1622387209666;
        Sun, 30 May 2021 08:06:49 -0700 (PDT)
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
Subject: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address setting function
Date: Sun, 30 May 2021 11:06:25 -0400
Message-Id: <20210530150628.2063957-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530150628.2063957-1-ltykernel@gmail.com>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
needs to be accessed via extra address space(e.g address above bit39).
Hyper-V code may remap extra address space outside of swiotlb. swiotlb_
bounce() needs to use remap virtual address to copy data from/to bounce
buffer. Add new interface swiotlb_set_bounce_remap() to do that.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  5 +++++
 kernel/dma/swiotlb.c    | 14 +++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 216854a5e513..43f53cf52f48 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -113,8 +113,13 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
 void __init swiotlb_adjust_size(unsigned long size);
+void swiotlb_set_bounce_remap(unsigned char *vaddr);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
+static inline void swiotlb_set_bounce_remap(unsigned char *vaddr)
+{
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8ca7d505d61c..fbc827ab5fb4 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -70,6 +70,7 @@ struct io_tlb_mem *io_tlb_default_mem;
  * not be bounced (unless SWIOTLB_FORCE is set).
  */
 static unsigned int max_segment;
+static unsigned char *swiotlb_bounce_remap_addr;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 
@@ -334,6 +335,11 @@ void __init swiotlb_exit(void)
 	io_tlb_default_mem = NULL;
 }
 
+void swiotlb_set_bounce_remap(unsigned char *vaddr)
+{
+	swiotlb_bounce_remap_addr = vaddr;
+}
+
 /*
  * Bounce: copy the swiotlb buffer from or back to the original dma location
  */
@@ -345,7 +351,13 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
 	unsigned long pfn = PFN_DOWN(orig_addr);
-	unsigned char *vaddr = phys_to_virt(tlb_addr);
+	unsigned char *vaddr;
+
+	if (swiotlb_bounce_remap_addr)
+		vaddr = swiotlb_bounce_remap_addr + tlb_addr -
+			io_tlb_default_mem->start;
+	else
+		vaddr = phys_to_virt(tlb_addr);
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
-- 
2.25.1


