Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E704F3D915A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161625.296696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kyN-0000Jl-1f; Wed, 28 Jul 2021 14:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161625.296696; Wed, 28 Jul 2021 14:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kyM-0000HD-Uj; Wed, 28 Jul 2021 14:55:50 +0000
Received: by outflank-mailman (input) for mailman id 161625;
 Wed, 28 Jul 2021 14:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kwa-0002W0-QR
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:54:00 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73f76943-e8a9-476b-b47f-60c6712fe3d1;
 Wed, 28 Jul 2021 14:53:32 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so10411258pjb.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:32 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:32 -0700 (PDT)
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
X-Inumbo-ID: 73f76943-e8a9-476b-b47f-60c6712fe3d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ot9NJwgdtSwny3Hz0sW1NmpmwSF9uMUFojPkk0oFEg8=;
        b=S9fynuTeK9vSXvNUDeY4KnRGKPztyWj8Fnz9B9pB5BahJ6cJS+RVcWxVYle9dJnAIB
         DXvmJ5t+++ZA0+T/R07cFZjYEvWfOBk5aAnD8gwRqttsKg4OchtPTc7bNT+bkFxS0q+T
         TS/EMh8f7+QSBU3kGVcPuPs8WY7W8CHJzLzI6CjPe3REMSyY+WNgH2eXqZDMnV2ZtFhz
         G26GNjCWgJtPCYIYclclGs7MF/0fcsoDjy+ziedykVSkxHQCeVHQSN/W73Qf/d3uXzjp
         f3+qF0i9dOE+cA2voQSGgplfosvRU8qjFeC6hKdER1BDhuJIhBrZI5zNDfVR9HgknOBd
         oryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ot9NJwgdtSwny3Hz0sW1NmpmwSF9uMUFojPkk0oFEg8=;
        b=NDA+O99HxTSE/jyn+GSVuN+sEwYr2p+PDRbEplKl+43kjhraqfQScJqEV3tz7A41kL
         7GWxAJFzDUfxIjHDd6iDo9mbn7bg0wGfinjORXF8dgulIdfzRL0/EFt1v42rDT2zhwq+
         jGpzO77LsRWLjcVsweQt6KkMHKaWN4hmOVW3OkdDlxdYvm42N1mjQB1AoeQ0ZzT1UTd/
         aRSWNGQ7B2luHrw8XZsg+t5Bv0GTrwtMeS2ABCoOU88aT+wFOCbXqW+cD2Af79WyE0Jv
         HAX63S8W46Q8bXOcAvYTmsCLtEvZEMni6patknzy2kI+hE48oVQLvfWxI81BEkFmTgXk
         nsDQ==
X-Gm-Message-State: AOAM530/JP4vJQ2cLNzk+WMR7158k8o4b/4Iv9pNqfuyGymSkZ4SMC3K
	SjwhmPzZYO0gFeJSYx4WoyE=
X-Google-Smtp-Source: ABdhPJwWvL5ltGyV4xAnV2PomvPFPoswsA8DVwzJ1kj0bPYDH6cusQ3v3SJ1R0nnIFdc7ySbf7Z6SQ==
X-Received: by 2002:a17:90a:19db:: with SMTP id 27mr10213457pjj.216.1627484012282;
        Wed, 28 Jul 2021 07:53:32 -0700 (PDT)
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
	rientjes@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	pgonda@google.com,
	david@redhat.com,
	keescook@chromium.org,
	hannes@cmpxchg.org,
	sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	anparri@microsoft.com
Subject: [PATCH 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function for HV IVM
Date: Wed, 28 Jul 2021 10:52:25 -0400
Message-Id: <20210728145232.285861-11-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Isolation VM with AMD SEV, bounce buffer needs to be accessed via
extra address space which is above shared_gpa_boundary
(E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
The access physical address will be original physical address +
shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
spec is called virtual top of memory(vTOM). Memory addresses below
vTOM are automatically treated as private while memory above
vTOM is treated as shared.

Use dma_map_decrypted() in the swiotlb code, store remap address returned
and use the remap address to copy data from/to swiotlb bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  4 ++++
 kernel/dma/swiotlb.c    | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index f507e3eacbea..584560ecaa8e 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -72,6 +72,9 @@ extern enum swiotlb_force swiotlb_force;
  * @end:	The end address of the swiotlb memory pool. Used to do a quick
  *		range check to see if the memory was in fact allocated by this
  *		API.
+ * @vaddr:	The vaddr of the swiotlb memory pool. The swiotlb
+ *		memory pool may be remapped in the memory encrypted case and store
+ *		virtual address for bounce buffer operation.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
  *		@end. For default swiotlb, this is command line adjustable via
  *		setup_io_tlb_npages.
@@ -89,6 +92,7 @@ extern enum swiotlb_force swiotlb_force;
 struct io_tlb_mem {
 	phys_addr_t start;
 	phys_addr_t end;
+	void *vaddr;
 	unsigned long nslabs;
 	unsigned long used;
 	unsigned int index;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1fa81c096c1d..6866e5784b53 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -194,8 +194,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		mem->slots[i].alloc_size = 0;
 	}
 
-	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
-	memset(vaddr, 0, bytes);
+	mem->vaddr = dma_map_decrypted(vaddr, bytes);
+	if (!mem->vaddr) {
+		pr_err("Failed to decrypt memory.\n");
+		return;
+	}
+
+	memset(mem->vaddr, 0, bytes);
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
@@ -360,7 +365,7 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
 	unsigned long pfn = PFN_DOWN(orig_addr);
-	unsigned char *vaddr = phys_to_virt(tlb_addr);
+	unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
 	unsigned int tlb_offset;
 
 	if (orig_addr == INVALID_PHYS_ADDR)
-- 
2.25.1


