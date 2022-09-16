Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2F5BB0E2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 18:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408080.650777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZDsF-0002wR-F0; Fri, 16 Sep 2022 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408080.650777; Fri, 16 Sep 2022 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZDsF-0002u9-CE; Fri, 16 Sep 2022 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 408080;
 Fri, 16 Sep 2022 16:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=diiU=ZT=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oZDsE-0002u3-F9
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 16:07:26 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6effc5d-35d9-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 18:07:24 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id z9so5501163qvn.9
 for <xen-devel@lists.xenproject.org>; Fri, 16 Sep 2022 09:07:24 -0700 (PDT)
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
X-Inumbo-ID: a6effc5d-35d9-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tLur3LQQNH99RcHI26JTcESnrDemBht0MgeTi6Y96vQ=;
        b=Oa5Feg4Q4/IG4bZWEdBQ1/eIelFz+L7TjTKWp7esOiuZedHNtPy8b53HovGrX5aK2Q
         8bARaLnxj5JEGTl6GJQEzJ6yYwvuRbONVBuLYk7GKNvQ74vzYu+jpZ2MqeFfz6nTGj/e
         5AJUW5fDlcZ0ckrigrszVz0rCUligNUpnzb5NBBUVf6GDrjKCBhU5jx7iJVkM6W3DboN
         v+d22bDqu83KbidqT5QTgE9eKrCxgH/DkDqvvIt06NpFCiOr7+8QM8+J1uGBJ1kRbhxE
         GQgmfmTRvgyGabXigCI8bIdprzPWxgevxLcpxhzdhOo2Isf00pjJIPVXg6GtyeyPRlz3
         Wn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tLur3LQQNH99RcHI26JTcESnrDemBht0MgeTi6Y96vQ=;
        b=IgrlzKjiaFwq67Q9IIE/4n8d30bniFmjaiG0ZKvl6j/0QhOiDf2fs1uJ6NhdfaCL4Y
         vaHoelhvxujgV/1MCk3pB0lPmJewiF0ny6kxgeZpTP2Ex6Ta059vvq3hvyhkviKv6h2p
         /dHEGMPG/vxYuIflhJnubj70Doz+PkwTj/BNJtqh+pyNBzNC7beaP0YxpLit8As7xpc0
         uaMvrsZmYIRvi3HZURXFy6sdQOifqHRx+kl29aPcgskAt76IBcfIFclHg84eHQgOeMoS
         xMUXhFKr0LSxSshqkcxUJt3LI0XEWgc8TooL8RZTImaQYVpCmOzaMJt9iZ4MYpc75pk5
         dSsQ==
X-Gm-Message-State: ACrzQf0yGvBiKqvQlpIsAVLqalCiEkpfuWzRewjkmQ4TivJ5GpQan64L
	G4UTHI/flXFU+b/R63PgKW5l6jEPE/BZOkPEP00cYA==
X-Google-Smtp-Source: AMsMyM4C8iBFx6mzhXCDt0m1+AVoWx+oxSSR5u+kHKS4QTDcTRvF5UYaRwuCtVSQ+O8JpYTGFY6GwHOA/uYiHL4k1pU=
X-Received: by 2002:ad4:5bac:0:b0:4ac:929b:3363 with SMTP id
 12-20020ad45bac000000b004ac929b3363mr4643672qvq.32.1663344443813; Fri, 16 Sep
 2022 09:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech> <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
In-Reply-To: <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 16 Sep 2022 18:07:13 +0200
Message-ID: <CAG+AhRVRQ9ey9NzsDo4Np+z0V=sX-uGYL_zLhJ9Z9zFb3v+Hkg@mail.gmail.com>
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thu, Sep 15, 2022 at 3:25 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.08.2022 14:51, Carlo Nonato wrote:
> > --- a/xen/common/vmap.c
> > +++ b/xen/common/vmap.c
> > @@ -8,6 +8,9 @@
> >  #include <xen/types.h>
> >  #include <xen/vmap.h>
> >  #include <asm/page.h>
> > +#ifdef CONFIG_CACHE_COLORING
> > +#include <asm/coloring.h>
> > +#endif
>
> Even independent of my earlier question towards more code becoming common,
> I think there will want to be a xen/coloring.h which takes care of this
> abstraction, requiring such #ifdef in just a single place.
>
> > @@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
> >      return va;
> >  }
> >
> > +#ifdef CONFIG_CACHE_COLORING
> > +void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
> > +                      unsigned int flags, enum vmap_region type)
>
> Please no new functions with double underscores as prefix. Only static
> symbol names may start with an underscore, and then also only with a
> single one.
>
> > +{
> > +    void *va = vm_alloc(nr, align, type);
> > +    unsigned long cur = (unsigned long)va;
> > +    paddr_t pa = mfn_to_maddr(*mfn);
> > +
> > +    for ( ; va && nr-- ; cur += PAGE_SIZE )
> > +    {
> > +        pa = next_xen_colored(pa);
>
> This may alter the address, yet the caller expects that the original
> address be mapped. I must be missing something?

If the original address color is assigned to Xen, then next_xen_colored()
simply returns that address. If this isn't the case, then you're right: the
address changes to the correct, colored, one. The caller should expect
this behavior since this is the colored version of vmap, the one that takes
into account the Xen coloring configuration.

> > +        if ( map_pages_to_xen(cur, maddr_to_mfn(pa), 1, flags) )
> > +        {
> > +            vunmap(va);
> > +            return NULL;
> > +        }
> > +        pa += PAGE_SIZE;
> > +    }
> > +    return va;
> > +}
>
> Afaics you only consume the first slot of *mfn. What about the other
> (nr - 1) ones?

Not sure I understood. The first slot is used as the starting point and then
the addr of that mfn plus next_xen_colored() are the mechanism used to select
the next mfns. Probably the first argument of vmap_colored is a bit
misleading.

> And compared to __vmap() there's no "granularity"
> parameter, which is what controls the mapping of multiple contiguous
> pages.

That's because we don't support multiple contiguous pages in the sense that
we only operate on one page at a time (like explained in the
"Known limitations" doc section and elsewhere in those discussions).

> > --- a/xen/include/xen/vmap.h
> > +++ b/xen/include/xen/vmap.h
> > @@ -14,6 +14,10 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
> >
> >  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> >               unsigned int align, unsigned int flags, enum vmap_region);
> > +#ifdef CONFIG_CACHE_COLORING
> > +void *__vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
> > +                     unsigned int flags, enum vmap_region);
> > +#endif
>
> I don't think such a declaration really needs putting inside #ifdef.
>
> Jan

Thanks.

- Carlo Nonato

