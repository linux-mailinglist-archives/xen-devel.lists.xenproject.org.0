Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABC4D28EB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 07:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287614.487681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRper-0003Rc-F4; Wed, 09 Mar 2022 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287614.487681; Wed, 09 Mar 2022 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRper-0003Pp-82; Wed, 09 Mar 2022 06:18:49 +0000
Received: by outflank-mailman (input) for mailman id 287614;
 Wed, 09 Mar 2022 06:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=360z=TU=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nRpep-0003Pf-Cl
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 06:18:47 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5d7925a-9f70-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 07:18:45 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A4A1568AFE; Wed,  9 Mar 2022 07:18:40 +0100 (CET)
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
X-Inumbo-ID: c5d7925a-9f70-11ec-8eba-a37418f5ba1a
Date: Wed, 9 Mar 2022 07:18:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
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
Message-ID: <20220309061840.GA31435@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 08, 2022 at 04:38:21PM -0500, Boris Ostrovsky wrote:
>
> On 3/1/22 5:53 AM, Christoph Hellwig wrote:
>> Allow to pass a remap argument to the swiotlb initialization functions
>> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
>> from xen_swiotlb_fixup, so we don't even need that quirk.
>
>
> Any chance this patch could be split? Lots of things are happening here and it's somewhat hard to review. (Patch 7 too BTW but I think I managed to get through it)

What would be your preferred split?

>> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
>> index e0def4b1c3181..2f2c468acb955 100644
>> --- a/arch/x86/kernel/pci-dma.c
>> +++ b/arch/x86/kernel/pci-dma.c
>> @@ -71,15 +71,12 @@ static inline void __init pci_swiotlb_detect(void)
>>   #endif /* CONFIG_SWIOTLB */
>>     #ifdef CONFIG_SWIOTLB_XEN
>> -static bool xen_swiotlb;
>> -
>>   static void __init pci_xen_swiotlb_init(void)
>>   {
>>   	if (!xen_initial_domain() && !x86_swiotlb_enable)
>>   		return;
>
>
> Now that there is a single call site for this routine I think this check can be dropped. We are only called here for xen_initial_domain()==true.

The callsite just checks xen_pv_domain() and itself is called
unconditionally during initialization.

