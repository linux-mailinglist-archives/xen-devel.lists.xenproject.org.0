Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E764409E5C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 22:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185924.334680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPst2-00007u-C6; Mon, 13 Sep 2021 20:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185924.334680; Mon, 13 Sep 2021 20:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPst2-000050-8u; Mon, 13 Sep 2021 20:49:08 +0000
Received: by outflank-mailman (input) for mailman id 185924;
 Mon, 13 Sep 2021 20:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+zYr=OD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mPst1-00004u-Ix
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 20:49:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 092b0662-14d4-11ec-b3cc-12813bfff9fa;
 Mon, 13 Sep 2021 20:49:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6463A610FE;
 Mon, 13 Sep 2021 20:49:05 +0000 (UTC)
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
X-Inumbo-ID: 092b0662-14d4-11ec-b3cc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631566145;
	bh=hUiqmRGtEXepWEODLRwwvcp5j41ZXDQIlBCemxiVKNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DHwsMX7ikvWdd/BI8zDeHuw+7Tapq9FDRv/8U/Wc5GJhsdDEr0PZBkADcNC3Cw4/l
	 XVIYVS3fpf4IB/pEf/TBDYctfkgqE5TknKGwK5w28r1T0PfvZgGxfh5u4emxheYskE
	 tfJGnP6f/saAr4DBa9u2FuM//73eD3+3Ma38STWt9N64jckrDfpLuZsst7TasKtIXx
	 vFlplwL562zn3HK9rwxFYC1y4bQe7btGfdnMb5FDi/TilVePV2YX60eoSVjbN+C9Oj
	 eGh0ylJCU9jw2iP9ocX1Qp0BMnuv15otYWsJrZYReV/tsLjmDecY0Nc2ev8c2d0QaN
	 wqK6HMy1fcSRg==
Date: Mon, 13 Sep 2021 13:49:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    the arch/x86 maintainers <x86@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
In-Reply-To: <ea90d3d7-22c7-604f-d0c8-f83c2a58554d@suse.com>
Message-ID: <alpine.DEB.2.21.2109131331570.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com> <YThiyxG0d2tmCtb+@infradead.org> <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s> <ea90d3d7-22c7-604f-d0c8-f83c2a58554d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Sep 2021, Jan Beulich wrote:
> On 11.09.2021 01:48, Stefano Stabellini wrote:
> > On Wed, 8 Sep 2021, Christoph Hellwig wrote:
> >> On Tue, Sep 07, 2021 at 02:13:21PM +0200, Jan Beulich wrote:
> >>> The code is unreachable for HVM or PVH, and it also makes little sense
> >>> in auto-translated environments. On Arm, with
> >>> xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
> >>> time seeing what good the Xen specific variant does - the generic one
> >>> ought to be fine for all purposes there. Still Arm code explicitly
> >>> references symbols here, so the code will continue to be included there.
> >>
> >> Can the Xen/arm folks look into that?  Getting ARM out of using
> >> swiotlb-xen would be a huge step forward cleaning up some DMA APIs.
> > 
> > On ARM swiotlb-xen is used for a different purpose compared to x86.
> > 
> > Many ARM SoCs still don't have an IOMMU covering all DMA-mastering
> > devices (e.g. Raspberry Pi 4). As a consequence we map Dom0 1:1 (guest
> > physical == physical address).
> > 
> > Now if it was just for Dom0, thanks to the 1:1 mapping, we wouldn't need
> > swiotlb-xen. But when we start using PV drivers to share the network or
> > disk between Dom0 and DomU we are going to get DomU pages mapped in
> > Dom0, we call them "foreign pages".  They are not mapped 1:1. It can
> > happen that one of these foreign pages are used for DMA operations
> > (e.g. related to the NIC). swiotlb-xen is used to detect these
> > situations and translate the guest physical address to physical address
> > of foreign pages appropriately.
> 
> Thinking about this some more - if Dom0 is 1:1 mapped, why don't you
> map foreign pages 1:1 as well then?

That's because the foreign page, from Linux POV, would appear out of
thin air. It would just show up in a region not considered memory just
few moments before, so there would be no memblock, no struct page,
nothing. At least in the past that caused serious issues to the kernel.

This is the reason why the kernel is using ballooned-out pages to map
foreign pages even on x86:

drivers/block/xen-blkback/blkback.c:xen_blkbk_map -> gnttab_page_cache_get
drivers/xen/grant-table.c:gnttab_page_cache_get
drivers/xen/grant-table.c:gnttab_alloc_pages
drivers/xen/unpopulated-alloc.c:xen_alloc_unpopulated_pages
drivers/xen/balloon.c:alloc_xenballooned_pages

