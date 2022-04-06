Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C14F486A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 02:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299377.510037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbt7n-0004uT-VG; Wed, 06 Apr 2022 00:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299377.510037; Wed, 06 Apr 2022 00:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbt7n-0004rL-S7; Wed, 06 Apr 2022 00:02:15 +0000
Received: by outflank-mailman (input) for mailman id 299377;
 Wed, 06 Apr 2022 00:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbt7m-0004r9-OE
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 00:02:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfec1a38-b53c-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 02:02:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AA3CB81FF7;
 Wed,  6 Apr 2022 00:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCA0C385A1;
 Wed,  6 Apr 2022 00:02:10 +0000 (UTC)
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
X-Inumbo-ID: cfec1a38-b53c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649203331;
	bh=CAEqWD1UdDVobH0tB9NunoFeyZhUrfVGG8skkoduack=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gzxj9Mr7xCYccx1vi+28W62PCBiye4RTX4eqJXjO6iseVD7+UM9TJH77PG6tGdVDZ
	 bMDa4EKVozTaziXw5hwVbeCtNGO80MSWhYUJp4Vebml2JH1z6NbQDhZ4L1bVKyW0iW
	 bUkqx6/6RtTZ138bsDHDpXEBdnCwuA/o3OOFNHW2NyVuUzZDMVSLF6ofGtyhhPgBvB
	 36bZTFCkki0X4IAKAnvRjAkuJKVolMSybn9+1sTEFcrPIR1A+gXJeG22+C5OgM/uWk
	 pf0RU9Hph0nAg2oxQA+rbYEs1QHVS3e9CgryXEcycaJ9n85u9lKgshCwPIm+AcsA3F
	 n6NzCd3JMTNlA==
Date: Tue, 5 Apr 2022 17:02:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 17/19] xen/arm64: mm: Add memory to the boot allocator
 first
In-Reply-To: <bc1930c6-9264-a6b1-9956-629546cab169@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051701550.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-18-julien@xen.org> <alpine.DEB.2.22.394.2204051444220.2910984@ubuntu-linux-20-04-desktop> <bc1930c6-9264-a6b1-9956-629546cab169@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Apr 2022, Julien Grall wrote:
> On 05/04/2022 22:50, Stefano Stabellini wrote:
> > > +static void __init setup_mm(void)
> > > +{
> > > +    const struct meminfo *banks = &bootinfo.mem;
> > > +    paddr_t ram_start = ~0;
> > > +    paddr_t ram_end = 0;
> > > +    paddr_t ram_size = 0;
> > > +    unsigned int i;
> > > +
> > > +    init_pdx();
> > > +
> > > +    /*
> > > +     * We need some memory to allocate the page-tables used for the
> > > xenheap
> > > +     * mappings. But some regions may contain memory already allocated
> > > +     * for other uses (e.g. modules, reserved-memory...).
> > > +     *
> > > +     * For simplify add all the free regions in the boot allocator.
> > > +     */
> > 
> > We currently have:
> > 
> > BUG_ON(nr_bootmem_regions == (PAGE_SIZE / sizeof(struct bootmem_region)));
> 
> This has enough space for 256 distinct regions on arm64 (512 regions on
> arm32).
> 
> > 
> > Do you think we should check for the limit in populate_boot_allocator?
> 
> This patch doesn't change the number of regions added to the boot allocator.
> So if we need to check the limit then I would rather deal separately (see more
> below).
> 
> > Or there is no need because it is unrealistic to reach it?
> I can't say never because history told us on some UEFI systems, there will be
> a large number of regions exposed. I haven't heard anyone that would hit the
> BUG_ON().
> 
> The problem is what do we do if we hit the limit? We could ignore all the
> regions after. However, there are potentially a risk there would not be enough
> memory to cover the boot memory allocation (regions may be really small).
> 
> So if we ever hit the limit, then I think we should update the boot allocator.

OK, thanks for the explanation.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

