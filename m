Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25560386E81
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 02:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128560.241337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linwR-0008Pb-FR; Tue, 18 May 2021 00:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128560.241337; Tue, 18 May 2021 00:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linwR-0008N4-CL; Tue, 18 May 2021 00:50:35 +0000
Received: by outflank-mailman (input) for mailman id 128560;
 Tue, 18 May 2021 00:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1linwP-0008My-AQ
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 00:50:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43b99d20-dbff-4225-8155-6c78ab3c0ab8;
 Tue, 18 May 2021 00:50:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69B49613AE;
 Tue, 18 May 2021 00:50:31 +0000 (UTC)
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
X-Inumbo-ID: 43b99d20-dbff-4225-8155-6c78ab3c0ab8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621299031;
	bh=OTJQP3YJP2vtwFR7puXkTCgaA7pkfGxka3vjjiVAoBc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FggtqzTJ9+aDR3QkqHtBjiYmMvNkD/wseXgNtFiptmLKa794OuSoEfElOgSCto/UY
	 nyXg69W5lshe2Xud5ZjvLdbsI47XQEBgsnJo4j/FQCjzS+AV9LjSP10hnXjVW4Ju/5
	 ZLbl0ZzLDH+BGWlLZgI+ToTrmAwHwrgtHufRxarwyLAMkTL6G52KCco/ZIv9wV65gh
	 jInDcr1RNiGJADQo+/YwbJVyDiAoEVKJRLZVqABNxjv0HNwvdv5tFNCHG+XzQG7dMB
	 oUuDFtbP25BKoVMgYoMSOqqt7++PUne5LL4yRkRypFGQRaQkEIAgYVmAJg8/zZykmF
	 LhA+kN5lZpEPg==
Date: Mon, 17 May 2021 17:50:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 14/15] xen/arm: mm: Rework
 setup_xenheap_mappings()
In-Reply-To: <8cda6d2d-7f3c-fef6-c534-2fadabed1bad@xen.org>
Message-ID: <alpine.DEB.2.21.2105171738320.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-15-julien@xen.org> <alpine.DEB.2.21.2105141646340.14426@sstabellini-ThinkPad-T480s> <8cda6d2d-7f3c-fef6-c534-2fadabed1bad@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 May 2021, Julien Grall wrote:
> Hi,
> 
> On 15/05/2021 00:51, Stefano Stabellini wrote:
> > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > A few issues have been reported with setup_xenheap_mappings() over the
> > > last couple of years. The main ones are:
> > >      - It will break on platform supporting more than 512GB of RAM
> > >        because the memory allocated by the boot allocator is not yet
> > >        mapped.
> > >      - Aligning all the regions to 1GB may lead to unexpected result
> > >        because we may alias non-cacheable region (such as device or
> > > reserved
> > >        regions).
> > > 
> > > map_pages_to_xen() was recently reworked to allow superpage mappings and
> > > deal with the use of page-tables before they are mapped.
> > > 
> > > Most of the code in setup_xenheap_mappings() is now replaced with a
> > > single call to map_pages_to_xen().
> > > 
> > > This also require to re-order the steps setup_mm() so the regions are
> > > given to the boot allocator first and then we setup the xenheap
> > > mappings.
> > 
> > I know this is paranoia but doesn't this introduce a requirement on the
> > size of the first bank in bootinfo.mem.bank[] ?
> > 
> > It should be at least 8KB?
> 
> AFAIK, the current requirement is 4KB because of the 1GB mapping. Long term,
> it would be 8KB.
> 
> > 
> > I know it is unlikely but it is theoretically possible to have a first
> > bank of just 1KB.
> 
> All the page allocators are working at the page granularity level. I am not
> entirely sure whether the current Xen would ignore the region or break.
> 
> Note that setup_xenheap_mappings() is taking a base MFN and a number of pages
> to map. So this doesn't look to be a new problem here.

Yeah... the example of the first bank being 1KB is wrong because, like
you wrote, it wouldn't work before your patches either, and probably it
will never work.

Maybe a better example is a first bank of 4KB exactly.


> For the 8KB requirement, we can look at first all the pages to the boot
> allocator and then do the mapping.
> 
> > 
> > I think we should write the requirement down with an in-code comment?
> > Or better maybe we should write a message about it in the panic below?
> 
> I can write an in-code comment but I think writing down in the panic() would
> be wrong because there is no promise this is going to be the only reason it
> fails (imagine there is a bug in the code...).

Maybe it is sufficient to print out the error code (EINVAL / ENOMEM etc)
in the panic. If you see -12 you know what to look for.

Looking into it I realize that we are not returning -ENOMEM in case of
alloc_boot_pages failures in create_xen_table. It looks like we would
hit a BUG() in the implementation of alloc_boot_pages. Maybe that's good
enough as is then.

