Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5225A6A14
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 19:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395104.634675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT4zN-0005nX-Sx; Tue, 30 Aug 2022 17:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395104.634675; Tue, 30 Aug 2022 17:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT4zN-0005kE-NY; Tue, 30 Aug 2022 17:25:25 +0000
Received: by outflank-mailman (input) for mailman id 395104;
 Tue, 30 Aug 2022 17:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oT4zM-0005k8-Ly
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 17:25:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba5ba812-2888-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 19:25:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6C16B81D1B;
 Tue, 30 Aug 2022 17:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4462BC433C1;
 Tue, 30 Aug 2022 17:25:20 +0000 (UTC)
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
X-Inumbo-ID: ba5ba812-2888-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661880320;
	bh=57FBQPKO2Lxnd/oVEDX3iEa74oeqtUbc6zdvm11XQl0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2d0qhDdN/WPXHJHQwH9lPZcxWPPi/MM91snIA/FUalWWhnzutreF2HaJMbwl1kq7
	 73rgu3ZX6OGS19woXywOqVYE67KxnluRndAmVaewgQoTUq6r/NcQd3XN4Qvgrz4ZiS
	 amuL35QSjxz2zyDQcmw0CM/K481y4Qyi7qjO0B3o7Ck/BojYmVewxE3i60YaO2e0vZ
	 En9wUE5ZsyxhYXsSv6uanz9u+L/FmVMm9uwn3rQ6ebsI00ZEJhYlU/NNN9wO/MaUIe
	 omcPiHN+getU9Nmd9T+SKXd64ViE5Gjx2SNNGJU+sFNw5LZ17COmV7edn/iNW6J7MZ
	 suhGOeOqf0Caw==
Date: Tue, 30 Aug 2022 10:25:19 -0700 (PDT)
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
In-Reply-To: <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop> <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Aug 2022, Henry Wang wrote:
> > >      /*
> > >       * If the user has not requested otherwise via the command line
> > >       * then locate the xenheap using these constraints:
> > > @@ -743,7 +766,8 @@ static void __init setup_mm(void)
> > >       * We try to allocate the largest xenheap possible within these
> > >       * constraints.
> > >       */
> > > -    heap_pages = ram_pages;
> > > +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
> > > +
> > >      if ( opt_xenheap_megabytes )
> > >          xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
> > >      else
> > > @@ -755,17 +779,21 @@ static void __init setup_mm(void)
> > >
> > >      do
> > >      {
> > > -        e = consider_modules(ram_start, ram_end,
> > > +        e = !reserved_heap ?
> > > +            consider_modules(ram_start, ram_end,
> > >                               pfn_to_paddr(xenheap_pages),
> > > -                             32<<20, 0);
> > > +                             32<<20, 0) :
> > > +            reserved_heap_end;
> > > +
> > >          if ( e )
> > >              break;
> > >
> > >          xenheap_pages >>= 1;
> > >      } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
> > PAGE_SHIFT) );
> > >
> > > -    if ( ! e )
> > > -        panic("Not not enough space for xenheap\n");
> > > +    if ( ! e ||
> > > +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
> > > +        panic("Not enough space for xenheap\n");
> > 
> > 
> > I would skip the do/while loop completely if reserved_heap. We don't
> > need it anyway
> 
> I agree with this.
> 
> > and we can automatically calculate xenheap_pages in a single line.
> 
> Here I am a little bit confused. Sorry to ask but could you please explain
> a little bit more about why we can calculate the xenheap_pages in a single
> line? Below is the code snippet in my mind, is this correct?
> 
> if (reserved_heap)

coding style

>     e = reserved_heap_end;
> else
> {
>     do
>     {
>         e = consider_modules(ram_start, ram_end,
>                              pfn_to_paddr(xenheap_pages),
>                              32<<20, 0);
>         if ( e )
>             break;
> 
>         xenheap_pages >>= 1;
>     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-PAGE_SHIFT) );
> }

Yes, this is what I meant.

But also, here the loop is also for adjusting xenheap_pages, and
xenheap_pages is initialized as follows:


    if ( opt_xenheap_megabytes )
        xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
    else
    {
        xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
        xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
        xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
    }


In the reserved_heap case, it doesn't make sense to initialize
xenheap_pages like that, right? It should be something like:

    if ( opt_xenheap_megabytes )
        xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
    else if ( reserved_heap )
        xenheap_pages = heap_pages;
    else
    {
        xenheap_pages = (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
        xenheap_pages = max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
        xenheap_pages = min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
    }

But also it looks like that on arm32 we have specific requirements for
Xen heap:

     *  - must be 32 MiB aligned
     *  - must not include Xen itself or the boot modules
     *  - must be at most 1GB or 1/32 the total RAM in the system if less
     *  - must be at least 32M

I think we should check at least the 32MB alignment and 32MB minimum
size before using the xen_heap bank.


In short I think this patch should:

- add a check for 32MB alignment and size of the xen_heap memory bank
- if reserved_heap, set xenheap_pages = heap_pages
- if reserved_heap, skip the consider_modules do/while

Does it make sense?

