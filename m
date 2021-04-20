Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE4365534
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 11:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113423.216115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmbG-0004Kb-4n; Tue, 20 Apr 2021 09:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113423.216115; Tue, 20 Apr 2021 09:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmbG-0004KC-1C; Tue, 20 Apr 2021 09:23:18 +0000
Received: by outflank-mailman (input) for mailman id 113423;
 Tue, 20 Apr 2021 09:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmVi=JR=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lYmbE-0004K7-MG
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 09:23:16 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26be06d4-a72d-475a-886d-a39189cab290;
 Tue, 20 Apr 2021 09:23:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 59ECA68C4E; Tue, 20 Apr 2021 11:23:12 +0200 (CEST)
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
X-Inumbo-ID: 26be06d4-a72d-475a-886d-a39189cab290
Date: Tue, 20 Apr 2021 11:23:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: hch@lst.de, dongli.zhang@oracle.com, iommu@lists.linux-foundation.org,
	konrad.wilk@oracle.com, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au, tientzu@chromium.org,
	xen-devel@lists.xenproject.org
Subject: Re: swiotlb cleanups v3
Message-ID: <20210420092312.GB26092@lst.de>
References: <20210318161424.489045-1-hch@lst.de> <0349082c-59c5-20d7-f324-279981c3f6ea@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0349082c-59c5-20d7-f324-279981c3f6ea@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Apr 17, 2021 at 11:39:22AM -0500, Tom Lendacky wrote:
> Somewhere between the 1st and 2nd patch, specifying a specific swiotlb
> for an SEV guest is no longer honored. For example, if I start an SEV
> guest with 16GB of memory and specify swiotlb=131072 I used to get a
> 256MB SWIOTLB. However, after the 2nd patch, the swiotlb=131072 is no
> longer honored and I get a 982MB SWIOTLB (as set via sev_setup_arch() in
> arch/x86/mm/mem_encrypt.c).
> 
> I can't be sure which patch caused the issue since an SEV guest fails to
> boot with the 1st patch but can boot with the 2nd patch, at which point
> the SWIOTLB comes in at 982MB (I haven't had a chance to debug it and so
> I'm hoping you might be able to quickly spot what's going on).

Can you try this patch?

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0a5b6f7e75bce6..ac81ef97df32f5 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -71,15 +71,17 @@ struct io_tlb_mem *io_tlb_default_mem;
  */
 static unsigned int max_segment;
 
-static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long swiotlb_cmdline_size;
 
 static int __init
 setup_io_tlb_npages(char *str)
 {
 	if (isdigit(*str)) {
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
-		default_nslabs =
-			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+		unsigned long nslabs = simple_strtoul(str, &str, 0);
+
+		swiotlb_cmdline_size =
+			ALIGN(nslabs, IO_TLB_SEGSIZE) << IO_TLB_SHIFT;
 	}
 	if (*str == ',')
 		++str;
@@ -108,7 +110,9 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return default_nslabs << IO_TLB_SHIFT;
+	if (swiotlb_cmdline_size)
+		return swiotlb_cmdline_size;
+	return IO_TLB_DEFAULT_SIZE;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -118,9 +122,10 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
+	if (!swiotlb_cmdline_size)
+		swiotlb_cmdline_size = ALIGN(size, IO_TLB_SIZE);
+	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
+		swiotlb_cmdline_size >> 20);
 }
 
 void swiotlb_print_info(void)
@@ -209,7 +214,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	size_t bytes = PAGE_ALIGN(swiotlb_size_or_default());
 	void *tlb;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
@@ -219,7 +224,7 @@ swiotlb_init(int verbose)
 	tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, verbose))
+	if (swiotlb_init_with_tbl(tlb, bytes >> IO_TLB_SHIFT, verbose))
 		goto fail_free_mem;
 	return;
 

