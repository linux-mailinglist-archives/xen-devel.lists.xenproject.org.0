Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F215505F1
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 17:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351934.578667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2aon-00086I-Ks; Sat, 18 Jun 2022 15:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351934.578667; Sat, 18 Jun 2022 15:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2aon-00084U-GL; Sat, 18 Jun 2022 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 351934;
 Sat, 18 Jun 2022 15:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qCNw=WZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o2aom-00084J-8i
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 15:57:00 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4700c7ea-ef1f-11ec-bd2d-47488cf2e6aa;
 Sat, 18 Jun 2022 17:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 986BC2015C;
 Sat, 18 Jun 2022 17:56:55 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfNSFwHv7YZv; Sat, 18 Jun 2022 17:56:55 +0200 (CEST)
Received: from begin (201.52.205.77.rev.sfr.net [77.205.52.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 5385A20003;
 Sat, 18 Jun 2022 17:56:55 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o2aog-00Bc2C-Cm;
 Sat, 18 Jun 2022 17:56:54 +0200
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
X-Inumbo-ID: 4700c7ea-ef1f-11ec-bd2d-47488cf2e6aa
Date: Sat, 18 Jun 2022 17:56:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/3] mini-os: fix number of pages for PVH
Message-ID: <20220618155654.kcvodnjcd7khwspl@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220618104816.11527-1-jgross@suse.com>
 <20220618104816.11527-4-jgross@suse.com>
 <20220618121328.54byw5ggucap6x5j@begin>
 <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8815b69d-f687-3b0f-1b9c-6bd273cd3404@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le sam. 18 juin 2022 16:07:07 +0200, a ecrit:
> On 18.06.22 14:13, Samuel Thibault wrote:
> > Hello,
> > 
> > Juergen Gross, le sam. 18 juin 2022 12:48:16 +0200, a ecrit:
> > > @@ -124,7 +126,7 @@ void arch_mm_preinit(void *p)
> > >           do_exit();
> > >       }
> > > -    last_free_pfn = e820_get_maxpfn(ret);
> > > +    last_free_pfn = e820_get_maxpfn(ret - e820_initial_reserved_pfns);
> > 
> > Mmm, but the reserved pfn could be in the middle of the e820 address
> > space.
> 
> That doesn't matter.
> 
> e820_get_maxpfn(n) will just return the pfn of the n-th RAM pfn it is
> finding in the E820 map.

Yes, but subtracting at this point looks a bit hacky to me.

It seems to me that it'd be better to make e820_get_maxpfn count by
itself the reserved pages (but never return its pfn of course), rather
than having to make e820_sanitize look at the reserved pages, store
it somewhere, and hope that other code will remember to subtract that
before calling e820_get_maxpfn.

I mean something like:

unsigned long e820_get_maxpfn(unsigned long pages)
{
    int i;
    unsigned long pfns = 0, start = 0;

    if ( !e820_entries )
        e820_get_memmap();

    for ( i = 0; i < e820_entries; i++ )
    {
        pfns = e820_map[i].size >> PAGE_SHIFT;

	if ( e820_map[i].type == E820_RESERVED )
	{
	    /* This counts in the memory reservation, but is not usable */
            pages -= pfns;
	    continue;
	}
        if ( e820_map[i].type != E820_RAM )
            continue;

        start = e820_map[i].addr >> PAGE_SHIFT;
        if ( pages <= pfns )
            return start + pages;
        pages -= pfns;
    }

    return start + pfns;
}

Samuel

