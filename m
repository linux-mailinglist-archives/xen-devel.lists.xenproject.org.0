Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFD51254B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 00:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315527.534091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqCh-0008QS-Pr; Wed, 27 Apr 2022 22:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315527.534091; Wed, 27 Apr 2022 22:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqCh-0008OT-MD; Wed, 27 Apr 2022 22:32:11 +0000
Received: by outflank-mailman (input) for mailman id 315527;
 Wed, 27 Apr 2022 22:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njqCg-0008KC-6J
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:32:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff0fb50-c679-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:32:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF1AAB8294B;
 Wed, 27 Apr 2022 22:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CC7C385A9;
 Wed, 27 Apr 2022 22:32:07 +0000 (UTC)
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
X-Inumbo-ID: dff0fb50-c679-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651098727;
	bh=T7AIimEtBLbKGzAQJkMGx/guL8LGImB+9SfmyD7tXUs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DwmphQrdLJg9YUl7yMi2k1JibSTYQhs4uwEO3Ej5SJLShx6ZcoEWXaUcY9gQMP4dR
	 GXKQHnBWNp85+jhOdn9N5FafcNzcRE2sGL6NwJk3ChXna7+/LkRI4pqhxgTAlHP/wq
	 Z491AJZ8aPi0iJnju3sn96lvy8vwBL6iB5ZOAn0b9O02VL2OYiH+HZr0wJRQPsNSMJ
	 8jR/4Ym0STm5aL5A2TM0NKGkb2HMoeLgV14tm0D7vcdJMkk12ktxHntmf7+ssZqwJ8
	 V1oFvWDG974R0KpHbJBDDFvEtHP4FPhSw74vi41uXlXMg+46LrJnv7qoiI2MHKUYkG
	 APBnpuky72D+Q==
Date: Wed, 27 Apr 2022 15:32:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: RE: [PATCH v3 5/6] xen/arm: unpopulate memory when domain is
 static
In-Reply-To: <DU2PR08MB73250C2576634910269805CFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2204271531410.915916@ubuntu-linux-20-04-desktop>
References: <20220427092743.925563-1-Penny.Zheng@arm.com> <20220427092743.925563-6-Penny.Zheng@arm.com> <95b1d82e-92fa-7468-d3aa-038f0de937d9@xen.org> <DU2PR08MB73250D118F81DF1FF2C89DAFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com> <433f9e2a-9da7-662f-04b5-0379eca7496f@xen.org>
 <DU2PR08MB73250C2576634910269805CFF7FA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Apr 2022, Penny Zheng wrote:
> > Hi Penny,
> > 
> > On 27/04/2022 11:19, Penny Zheng wrote:
> > >>> +/*
> > >>> + * Put free pages on the resv page list after having taken them
> > >>> + * off the "normal" page list, when pages from static memory  */
> > >>> +#ifdef CONFIG_STATIC_MEMORY
> > >>> +#define arch_free_heap_page(d, pg) ({                   \
> > >>> +    page_list_del(pg, page_to_list(d, pg));             \
> > >>> +    if ( (pg)->count_info & PGC_reserved )              \
> > >>> +        page_list_add_tail(pg, &(d)->resv_page_list);   \
> > >>> +})
> > >>> +#endif
> > >>
> > >> I am a bit puzzled how this is meant to work.
> > >>
> > >> Looking at the code, arch_free_heap_page() will be called from
> > >> free_domheap_pages(). If I am not mistaken, reserved pages are not
> > >> considered as xen heap pages, so we would go in the else which will
> > >> end up to call free_heap_pages().
> > >>
> > >> free_heap_pages() will end up to add the page in the heap allocator
> > >> and corrupt the d->resv_page_list because there are only one link list.
> > >>
> > >> What did I miss?
> > >>
> > >
> > > In my first commit "do not free reserved memory into heap", I've
> > > changed the behavior for reserved pages in free_heap_pages()
> > > +    if ( pg->count_info & PGC_reserved )that
> > > +        /* Reserved page shall not go back to the heap. */
> > > +        return free_staticmem_pages(pg, 1UL << order, need_scrub);
> > > +
> > 
> > Hmmm... somehow this e-mail is neither in my inbox nor in the archives on
> > lore.kernel.org.
> > 
> 
> Oh.... I just got email from tessian that they held my first commit, and needed my
> confirmation to send. So sorry about that!!!
> 
> I'll re-send my first commit ASAP.

Just FYI I still cannot see the first patch anywhere in my inbox

