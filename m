Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB3lKAtqlGmNDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:15:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF2614C794
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:15:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235010.1538077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKvP-0001D7-DV; Tue, 17 Feb 2026 13:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235010.1538077; Tue, 17 Feb 2026 13:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKvP-0001Az-9d; Tue, 17 Feb 2026 13:15:35 +0000
Received: by outflank-mailman (input) for mailman id 1235010;
 Tue, 17 Feb 2026 13:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4p7M=AV=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vsKvO-0001Ap-0Y
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 13:15:34 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb7aebfa-0c02-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 14:15:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 43946406EF;
 Tue, 17 Feb 2026 13:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD7C4CEF7;
 Tue, 17 Feb 2026 13:15:28 +0000 (UTC)
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
X-Inumbo-ID: bb7aebfa-0c02-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771334129;
	bh=IFqWRnMOe90PHPZ6ogIhD60Li5AyK3EFhOC6WZ8V4S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F44Ix8zfCzwWI4AQs9GQP2t1ynVHWLNSCY3twBxZFDsxlSu/RfSxZcW9hg0L7WEMK
	 DVLz5necSLs8Vd9sUbcqNxHiXhSe1wgYUNVz9W3t3HjIlpnMvOSIidbsZRLiskWn68
	 xItdSgwjZ64haQEHc9AA+Car4oFuKE6jJy6K1oZ9qp0NfO17s8m5QhB5G3se54yqng
	 +Woyi/px6vIOOUpaq+Jzvi7e5oKdunoebhikfsFPd3HTxF9VWSvih4dM6ug2R8hcj/
	 MvelNqZrwI6p0ECzsvxqAg+vPD6IuKSVLKEs3YzKCjc2YZAO5l2Mn9P1+IofP43CvT
	 66YAmYLUGAOHw==
Date: Tue, 17 Feb 2026 15:15:25 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v5 11/14] sparc: Use physical address DMA mapping
Message-ID: <20260217131525.GK12989@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-11-3bbfe3a25cdf@kernel.org>
 <CGME20260217123216eucas1p2d74189a3cdf08e9301bebf1840491364@eucas1p2.samsung.com>
 <e294484787a5032c531dcd40071b22362bddcad4.camel@physik.fu-berlin.de>
 <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7131d609-b083-4264-818a-21de38c1c3ed@samsung.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:glaubitz@physik.fu-berlin.de,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:geoff@infradead.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-alpha@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[leon@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[physik.fu-berlin.de,arm.com,armlinux.org.uk,suse.com,kernel.org,epam.com,linaro.org,gmail.com,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,csgroup.eu,infradead.org,davemloft.net,gaisler.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.xenproject.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4DF2614C794
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 01:55:56PM +0100, Marek Szyprowski wrote:
> On 17.02.2026 13:27, John Paul Adrian Glaubitz wrote:
> > On Wed, 2025-10-15 at 12:12 +0300, Leon Romanovsky wrote:
> >> From: Leon Romanovsky <leonro@nvidia.com>
> >>
> >> Convert sparc architecture DMA code to use .map_phys callback.
> >>
> >> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >> ---
> >>   arch/sparc/kernel/iommu.c     | 30 +++++++++++++++++-----------
> >>   arch/sparc/kernel/pci_sun4v.c | 31 ++++++++++++++++++-----------
> >>   arch/sparc/mm/io-unit.c       | 38 ++++++++++++++++++-----------------
> >>   arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++++++---------------------
> >>   4 files changed, 82 insertions(+), 63 deletions(-)

<...>

> >> @@ -296,7 +305,6 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	bus_addr = (iommu->tbl.table_map_base +
> >>   		    ((base - iommu->page_table) << IO_PAGE_SHIFT));
> >>   	ret = bus_addr | (oaddr & ~IO_PAGE_MASK);
> >> -	base_paddr = __pa(oaddr & IO_PAGE_MASK);
> >>   	if (strbuf->strbuf_enabled)
> >>   		iopte_protection = IOPTE_STREAMING(ctx);
> >>   	else
> >> @@ -304,8 +312,8 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
> >>   	if (direction != DMA_TO_DEVICE)
> >>   		iopte_protection |= IOPTE_WRITE;
> >>   
> >> -	for (i = 0; i < npages; i++, base++, base_paddr += IO_PAGE_SIZE)
> >> -		iopte_val(*base) = iopte_protection | base_paddr;
> >> +	for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
> >> +		iopte_val(*base) = iopte_protection | phys;
> 
> 'base_paddr' was aligned to start of a page before this patch, while 
> 'phys' includes the offset within a page.

Thanks for the fix. I had assumed we needed to revert all changes in
iounit_get_area().

Thanks

> 
> 
> Could You check if the following change fixes the issue?
> 
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index 46ef88bc9c26..edb0ffb21e2f 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -312,6 +312,7 @@ static dma_addr_t dma_4u_map_phys(struct device 
> *dev, phys_addr_t phys,
>          if (direction != DMA_TO_DEVICE)
>                  iopte_protection |= IOPTE_WRITE;
> 
> +       phys -= offset_in_page(phys);
>          for (i = 0; i < npages; i++, base++, phys += IO_PAGE_SIZE)
>                  iopte_val(*base) = iopte_protection | phys;
> 
>  >> ...
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

