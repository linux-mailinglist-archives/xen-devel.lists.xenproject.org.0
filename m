Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMANCIhllGkFDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:56:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0A14C2E3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 13:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234963.1538030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKch-00050f-62; Tue, 17 Feb 2026 12:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234963.1538030; Tue, 17 Feb 2026 12:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKch-0004xx-24; Tue, 17 Feb 2026 12:56:15 +0000
Received: by outflank-mailman (input) for mailman id 1234963;
 Tue, 17 Feb 2026 12:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mba9=AV=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1vsKcf-0004xm-AS
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 12:56:14 +0000
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02e53af7-0c00-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 13:56:03 +0100 (CET)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260217125600euoutp01e702ba17a82df7a26cb54abe09518e80~VCfFtKJNi2750327503euoutp01K;
 Tue, 17 Feb 2026 12:56:00 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260217125600eucas1p2f5a7aaf272ec1e8419eb4f30114ae4c0~VCfFifkBN0465704657eucas1p2k;
 Tue, 17 Feb 2026 12:56:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260217125557eusmtip157747204999f9293afbbfbea0aadd349~VCfCuB9mO1169311693eusmtip1R;
 Tue, 17 Feb 2026 12:55:57 +0000 (GMT)
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
X-Inumbo-ID: 02e53af7-0c00-11f1-b164-2bf370ae4941
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260217125600euoutp01e702ba17a82df7a26cb54abe09518e80~VCfFtKJNi2750327503euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1771332961;
	bh=kPHvBI1Pan3M4iaidTIFZnbtqSz3AZ7jPYAHqyBo5u8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qE2Na2wFoGobnNwByWm49yVZUxp6ZyqvGOKUcTxQmO/J9J6nwYoOSde40k3tzupbf
	 5drCH58ib86rmTAuEFK3Dh2gBz0w2T0sLKmgAdsu5bu3cX1d1C762Ho+VBd2ZtAcrr
	 Rpa2eUVwXatWI/hNEoqzx/baF+s1uCvrB4JykOMY=
Message-ID: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
Date: Tue, 17 Feb 2026 13:55:56 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Leon
	Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Russell
	King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux
	<sparclinux@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260217125600eucas1p2f5a7aaf272ec1e8419eb4f30114ae4c0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364
X-EPHeader: CA
X-CMS-RootMailID: 20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
	<20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
	<CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
	<e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.18 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glaubitz@physik.fu-berlin.de,m:leon@kernel.org,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:tsbogend@alpha.franken.de,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:geoff@infradead.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-alpha@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[physik.fu-berlin.de,kernel.org,arm.com,armlinux.org.uk,suse.com,epam.com,linaro.org,gmail.com,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,infradead.org,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,nvidia.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 80F0A14C2E3
X-Rspamd-Action: no action

On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Convert sparc architecture DMA code to use .map_phys callback.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
>>   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
>>   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
>>   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
>>   4 files changed, 82 insertions(+), 63 deletions(-)
>>
>> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
>> index da0363692528..46ef88bc9c26 100644
>> --- a/arch/sparc/kernel/iommu.c
>> +++ b/arch/sparc/kernel/iommu.c
>> @@ -260,26 +260,35 @@ static void dma_4u_free_coherent(struct device *dev, size_t size,
>>   		free_pages((unsigned long)cpu, order);
>>   }
>>   
>> -static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>> -				  unsigned long offset, size_t sz,
>> -				  enum dma_data_direction direction,
>> +static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
>> +				  size_t sz, enum dma_data_direction direction,
>>   				  unsigned long attrs)
>>   {
>>   	struct iommu *iommu;
>>   	struct strbuf *strbuf;
>>   	iopte_t *base;
>>   	unsigned long flags, npages, oaddr;
>> -	unsigned long i, base_paddr, ctx;
>> +	unsigned long i, ctx;
>>   	u32 bus_addr, ret;
>>   	unsigned long iopte_protection;
>>   
>> +	if (unlikely(attrs & DMA_ATTR_MMIO))
>> +		/*
>> +		 * This check is included because older versions of the code
>> +		 * lacked MMIO path support, and my ability to test this path
>> +		 * is limited. However, from a software technical standpoint,
>> +		 * there is no restriction, as the following code operates
>> +		 * solely on physical addresses.
>> +		 */
>> +		goto bad_no_ctx;
>> +
>>   	iommu = dev->archdata.iommu;
>>   	strbuf = dev->archdata.stc;
>>   
>>   	if (unlikely(direction == DMA_NONE))
>>   		goto bad_no_ctx;
>>   
>> -	oaddr = (unsigned long)(page_address(page) + offset);
>> +	oaddr = (unsigned long)(phys_to_virt(phys));
>>   	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
>>   	npages >>= IO_PAGE_SHIFT;
>>   
>> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>>   	bus_addr = (iommu->tbl.table_map_base +
>>   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
>>   	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
>> -	base_paddr = __pa(oaddr & IO_PAGE_MASK);
>>   	if (strbuf->strbuf_enabled)
>>   		iopte_protection = IOPTE_STREAMING(ctx);
>>   	else
>> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
>>   	if (direction != DMA_TO_DEVICE)
>>   		iopte_protection |= IOPTE_WRITE;
>>   
>> -	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
>> -		iopte_val(*base) = iopte_protection | base_paddr;
>> +	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
>> +		iopte_val(*base) = iopte_protection | phys;

'base_paddr' was aligned to start of a page before this patch, while 
'phys' includes the offset within a page.


Could You check if the following change fixes the issue?

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 46ef88bc9c26..edb0ffb21e2f 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device 
*dev, phys_addr_t phys,
         if (direction != DMA_TO_DEVICE)
                 iopte_protection |= IOPTE_WRITE;

+       phys -= offset_in_page(phys);
         for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
                 iopte_val(*base) = iopte_protection | phys;

 >> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


