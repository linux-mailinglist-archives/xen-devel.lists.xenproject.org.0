Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0972EC067
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 16:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62530.110801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAla-0003o6-94; Wed, 06 Jan 2021 15:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62530.110801; Wed, 06 Jan 2021 15:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAla-0003nh-5d; Wed, 06 Jan 2021 15:30:30 +0000
Received: by outflank-mailman (input) for mailman id 62530;
 Wed, 06 Jan 2021 15:30:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEpK=GJ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kxAlY-0003nc-NG
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 15:30:28 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee2259df-0965-44c9-bc51-a92bfa8ab17f;
 Wed, 06 Jan 2021 15:30:27 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 971D88010E
 for <xen-devel@lists.xenproject.org>; Wed,  6 Jan 2021 10:30:26 -0500 (EST)
Received: from mail-wm1-f44.google.com (unknown [10.20.151.223])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 5B837800C6
 for <xen-devel@lists.xenproject.org>; Wed,  6 Jan 2021 15:30:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 190so2760286wmz.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 07:30:26 -0800 (PST)
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
X-Inumbo-ID: ee2259df-0965-44c9-bc51-a92bfa8ab17f
X-Gm-Message-State: AOAM532fYOlCWlJkeW8kp3QaV2r592OnWEkmnqxDKcI4ADggdEMfQHpN
	+zeD3pWQUlOl+Kw/gjSJzd2U+jQh2DHrYPY1B2Q=
X-Google-Smtp-Source: ABdhPJwCmDS4W+3RzFaE49kdihiEsVXXDNjGRokH9loC/8nW6T7xRz5ar96n8CGDZ1VMd3bIHddZgszhvtmXzuBuqQ0=
X-Received: by 2002:a05:600c:211:: with SMTP id 17mr4186020wmi.84.1609947024857;
 Wed, 06 Jan 2021 07:30:24 -0800 (PST)
MIME-Version: 1.0
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
 <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com>
In-Reply-To: <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 6 Jan 2021 10:29:48 -0500
X-Gmail-Original-Message-ID: <CABfawhn3OBbpHW9e1Dd9n4UCOe_KaymBS0QwnJC2tLr-oAnBmg@mail.gmail.com>
Message-ID: <CABfawhn3OBbpHW9e1Dd9n4UCOe_KaymBS0QwnJC2tLr-oAnBmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jan 6, 2021 at 7:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.01.2021 18:41, Tamas K Lengyel wrote:
> > @@ -893,13 +894,11 @@ static int nominate_page(struct domain *d, gfn_t gfn,
> >          goto out;
> >
> >      /*
> > -     * Now that the page is validated, we can lock it. There is no
> > -     * race because we're holding the p2m entry, so no one else
> > -     * could be nominating this gfn.
> > +     * Now that the page is validated, we can make it shared. There is no race
> > +     * because we're holding the p2m entry, so no one else could be nominating
> > +     * this gfn & and it is evidently not yet shared with any other VM, thus we
> > +     * don't need to take the mem_sharing_page_lock here.
> >       */
> > -    ret = -ENOENT;
> > -    if ( !mem_sharing_page_lock(page) )
> > -        goto out;
>
> Isn't it too limited to mention just nomination in the comment?
> Unsharing, for example, also needs to be prevented (or else
> the tail of sharing could race with the beginning of unsharing).
> The other paths looks to similarly hold the GFN, so the
> reasoning is fine for them as well. Except maybe audit() - what
> about races with that one?

Audit is unused and should be removed. I don't plan on maintaining
that bit, it might already be broken and I don't see a use for it.

Unsharing is already protected. No other domain could be doing an
unshare since no other domain can have this page mapped as shared
before nominate finishes as you need a sharing ref for it that's
returned from nominate. If the same domain is triggering an unshare we
are protected because the first thing unshare_page() does is get_gfn,
which we hold already until nominate finishes. So we are all good.

>
> > @@ -1214,7 +1212,7 @@ int __mem_sharing_unshare_page(struct domain *d,
> >      p2m_type_t p2mt;
> >      mfn_t mfn;
> >      struct page_info *page, *old_page;
> > -    int last_gfn;
> > +    int last_gfn, rc = 0;
>
> I consider this unhelpful: last_gfn really wants to be bool, and
> hence wants to not share a declaration with rc. But you're the
> maintainer ...

Doesn't really matter in the end IMHO.

>
> > @@ -1226,6 +1224,15 @@ int __mem_sharing_unshare_page(struct domain *d,
> >          return 0;
> >      }
> >
> > +    /* lock nested p2ms to avoid lock-order violation */
>
> Would you mind mentioning here the other side of the possible
> violation, to aid the reader?

You mean what the nested p2m locks would conflict with? I think in the
context of mem_sharing it's clear that the only thing it can conflict
with is the mem_sharing mm lock.

>
> > +    if ( unlikely(nestedhvm_enabled(d)) )
> > +    {
> > +        int i;
>
> unsigned int please (also further down), no matter that there may
> be other similar examples of (bad) use of plain int.

IMHO this is the type of change request that makes absolutely 0
difference at the end.

>
> > +        for ( i = 0; i < MAX_NESTEDP2M; i++ )
> > +            p2m_lock(d->arch.nested_p2m[i]);
>
> From a brief scan, this is the first instance of acquiring all
> nested p2m locks in one go. Ordering these by index is perhaps
> fine, but I think this wants spelling out in e.g. mm-locks.h. Of
> course the question is if you really need to go this far, i.e.
> whether really all of the locks need holding. This is even more
> so with p2m_flush_table_locked() not really looking to be a
> quick operation, when there have many pages accumulated for it.
> I.e. the overall lock holding time may turn out even more
> excessive this way than it apparently already is.

I agree this is not ideal but it gets things working without Xen
crashing. I would prefer if we could get rid of the mm lock ordering
altogether in this context. We already hold the host p2m lock and the
sharing lock, that ought to suffice. But I don't have a better way to
work around it for now.

>
> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -1598,8 +1598,17 @@ void
> >  p2m_flush_nestedp2m(struct domain *d)
> >  {
> >      int i;
> > +    struct p2m_domain *p2m;
> > +
> >      for ( i = 0; i < MAX_NESTEDP2M; i++ )
> > -        p2m_flush_table(d->arch.nested_p2m[i]);
> > +    {
> > +        p2m = d->arch.nested_p2m[i];
>
> Please move the declaration here, making this the variable's
> initializer (unless line length constraints make the latter
> undesirable).

I really don't get what difference this would make.

Thanks for the review,
Tamas

