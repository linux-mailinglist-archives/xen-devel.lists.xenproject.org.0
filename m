Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FD5A8947
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 00:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396101.636105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWfd-0005i8-Lo; Wed, 31 Aug 2022 22:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396101.636105; Wed, 31 Aug 2022 22:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWfd-0005ep-IN; Wed, 31 Aug 2022 22:58:53 +0000
Received: by outflank-mailman (input) for mailman id 396101;
 Wed, 31 Aug 2022 22:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTWfc-0005ej-93
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 22:58:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1761c8-2980-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 00:58:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77FBC61AC8;
 Wed, 31 Aug 2022 22:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C523C433C1;
 Wed, 31 Aug 2022 22:58:48 +0000 (UTC)
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
X-Inumbo-ID: 7a1761c8-2980-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661986728;
	bh=PBPLUf0tRInRggFIkqzbWmV3QEkrmjeMyJcNTiIfky8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E5NlxrovRM3V9n2ful6Z7ciJ+Vjwgmbc8QOrYQXmWKP8Lil1scr9nQ+AZGIAWjpr4
	 +NclsMUwvoKH2tm7QBih7IsVccv2OK76d9x/RnDARd86exR6IPd/HsSLCTKlViqsNS
	 M8ph+QAmPH5VGyDLnN4p67rkxq4gxnkS20BhiPEgTz1jGY+K1cTtFMYxkskAPQCBSA
	 ji3aamOQux4E0yZeCTUm/2Go8xN6m6M5GMm9VNufaXf+xcu+SoxtKG/Atx+8xsOgPZ
	 iyuYNFKvA9XpzA7T9rgeJ9Z9JWRAV4gCu5qPr13Zjot+TCzMHzQEAMZXGvk/F3uJ+8
	 MRCFLBF6KteLg==
Date: Wed, 31 Aug 2022 15:58:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208311548070.2375071@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop> <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop> <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Aug 2022, Henry Wang wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > and we can automatically calculate xenheap_pages in a single line.
> > >
> > > Here I am a little bit confused. Sorry to ask but could you please explain
> > > a little bit more about why we can calculate the xenheap_pages in a single
> > > line? Below is the code snippet in my mind, is this correct?
> > >
> > > if (reserved_heap)
> > 
> > coding style
> > 
> > >     e = reserved_heap_end;
> > > else
> > > {
> > >     do
> > >     {
> > >         e = consider_modules(ram_start, ram_end,
> > >                              pfn_to_paddr(xenheap_pages),
> > >                              32<<20, 0);
> > >         if ( e )
> > >             break;
> > >
> > >         xenheap_pages >>= 1;
> > >     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
> > PAGE_SHIFT) );
> > > }
> > 
> > Yes, this is what I meant.
> 
> Thank you very much for your detailed explanation below!
> [...]
> 
> > 
> > But also, here the loop is also for adjusting xenheap_pages, and
> > xenheap_pages is initialized as follows:
> > 
> > 
> >     if ( opt_xenheap_megabytes )
> >         xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
> >     else
> >     {
> >         xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
> >         xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
> >         xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
> >     }
> > 
> > 
> > In the reserved_heap case, it doesn't make sense to initialize
> > xenheap_pages like that, right? It should be something like:
> 
> I am not sure about that, since we already have
> heap_pages = reserved_heap ? reserved_heap_pages : ram_pages;
> 
> the heap_pages is supposed to contain domheap_pages + xenheap_pages
> based on the reserved heap definition discussed in the RFC.
> 
> from the code in...
> 
> > 
> >     if ( opt_xenheap_megabytes )
> >         xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
> >     else if ( reserved_heap )
> >         xenheap_pages = heap_pages;
> 
> ...here, setting xenheap_pages to heap_pages makes me a little bit
> confused.
> 
> >     else
> >     {
> >         xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
> >         xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
> >         xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
> >     }
> 
> If we keep this logic as this patch does, we can have the requirements...
> 
> > 
> > But also it looks like that on arm32 we have specific requirements for
> > Xen heap:
> > 
> >      *  - must be 32 MiB aligned
> >      *  - must not include Xen itself or the boot modules
> >      *  - must be at most 1GB or 1/32 the total RAM in the system if less
> >      *  - must be at least 32M
> 
> ...here, with the "1/32 the total RAM" now being "1/32 of the total reserved
> heap region", since heap_pages is now reserved_heap_pages.
 
I see. I didn't realize the full implications of the memory being used
for both xenheap and domheap on arm32. In that case, I would simply do
the following:


    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;

    if ( opt_xenheap_megabytes )
        xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
    else
    {
        xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
        xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
        xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
    }

    if ( reserved_heap )
        e = reserved_heap_end;
    else
    {
        do
        {
            e = consider_modules(ram_start, ram_end,
                                 pfn_to_paddr(xenheap_pages),
                                 32<<20, 0);

            if ( e )
                break;

            xenheap_pages >>= 1;
        } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
    }

    if ( ! e ||
         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
        panic("Not enough space for xenheap\n");

    domheap_pages = heap_pages - xenheap_pages;

