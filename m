Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF374CDB32
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 18:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284397.483632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQBxV-0004Zs-3C; Fri, 04 Mar 2022 17:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284397.483632; Fri, 04 Mar 2022 17:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQBxU-0004Xp-Vj; Fri, 04 Mar 2022 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 284397;
 Fri, 04 Mar 2022 17:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2+cs=TP=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nQBxT-0004Xj-3G
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:43:15 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b6cd28-9be2-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:43:13 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 18C7068BEB; Fri,  4 Mar 2022 18:43:09 +0100 (CET)
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
X-Inumbo-ID: 90b6cd28-9be2-11ec-8eba-a37418f5ba1a
Date: Fri, 4 Mar 2022 18:43:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	iommu@lists.linux-foundation.org, x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304174308.GA13515@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop> <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com> <20220304172859.GA12860@lst.de> <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 04, 2022 at 12:36:17PM -0500, Boris Ostrovsky wrote:
>>> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.
>> That looks like the swiotlb buffer did not get initialized at all, but I
>> can't really explain why.
>>
>> Can you stick in a printk and see if xen_swiotlb_init_early gets called
>> at all?
>
>
>
> Actually, that's the only thing I did do so far and yes, it does get called.

So, specifically for "x86: remove the IOMMU table infrastructure" I
think we need the one-liner below so that swiotlb_exit doesn't get called
for the Xen case.  But that should have been fixed up by the next
patch already.

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 2ac0ef9c2fb76..1173aa282ab27 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -70,7 +70,7 @@ static void __init pci_xen_swiotlb_init(void)
 	if (!xen_initial_domain() && !x86_swiotlb_enable &&
 	    swiotlb_force != SWIOTLB_FORCE)
 		return;
-	x86_swiotlb_enable = false;
+	x86_swiotlb_enable = true;
 	xen_swiotlb = true;
 	xen_swiotlb_init_early();
 	dma_ops = &xen_swiotlb_dma_ops;

