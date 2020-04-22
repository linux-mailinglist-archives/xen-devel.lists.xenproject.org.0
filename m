Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD11B454E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 14:43:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jREip-00085K-Pp; Wed, 22 Apr 2020 12:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXoo=6G=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jREio-00085F-N4
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 12:43:22 +0000
X-Inumbo-ID: d927fe76-8496-11ea-b4f4-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d927fe76-8496-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 12:43:21 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id x1so1731032ejd.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 05:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IuQCr5WXRmfAZXY/oAwjRLg3LntkbJRVPIjlT0Xz4ZE=;
 b=DCC6+C8mcc7b5sAHRV4xj4X/RWVzN2xcMdShrMXQHscIoXwD7RTLiXFn1RsoCmokt4
 99NeYdUoC6f7aD1rRv4ejj21QkxhOE7IgHWrphaCo+ryV1ZrLULTFtiIhqDYYIOZjUAw
 qh/8ZAiM31pVcx6o08GsSt20vGRcu39qyFJlB0vBQZD7lq6nepgmvEDe7OrPFkN6my9u
 fJwg+jJtABfszfY7GxkOZTPx1mKJzPCVxSwtjJM2RpoTfiV3J2hc8AuKUTYvFeasATtn
 w0Xhi0NL3yGv9vcuLTtfEWoKyJgBgm+oCTX+yjpB7/8pNNOs01eIcZjXKK1kDojLQNpQ
 PqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IuQCr5WXRmfAZXY/oAwjRLg3LntkbJRVPIjlT0Xz4ZE=;
 b=WYkG3fAWoJnoIdRW5M81Y9aPb1IDmO1uxTnPZdJW7fmu3D6Z+liiSMg7+x/qEZEkkI
 FEKBb67QgXXBUX9X90Bm5u2soBVabaSfAaChJUYjuulyyRip6RYz4SzpN7UspjX9Lrf5
 r3yOflEDxz17x+YVdGaNO1p4kpHmzVEtJitzjxUd69JNFqIjlVn0O17bS6EqAUfoi8kk
 T6tRqgPeu7+rzgYCEI6mK6U19lhRWzm5ZlZeQT3641Nmmw0iINx7m3MNmKdZOmsLpy0g
 x5QFh+MuK7GwtIsOyw2MbiZF6uJ2TNdsQy9xZuldmFE8ENzr9GQufvI8bC5Hdvsdcqhv
 ytWA==
X-Gm-Message-State: AGi0PuagUmjSJOzzJ/94kPVZxHQbv47i7vcgNCumKn1yMfM//tXAiRni
 FOPcNxbO8RRr53Y5/Q+6vEWmnnpQPtM=
X-Google-Smtp-Source: APiQypKrYpklhsS2DGHtMAwfR9XTJr2ZoEWTaX2XlZl/E2ToBh6Zur7Cq9dlN1EL0UoBQ0Nl4X+xHQ==
X-Received: by 2002:a17:906:4e46:: with SMTP id
 g6mr25313432ejw.36.1587559400278; 
 Wed, 22 Apr 2020 05:43:20 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id t12sm921928ejx.30.2020.04.22.05.43.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 05:43:19 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id y24so2189554wma.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 05:43:18 -0700 (PDT)
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr10191128wml.84.1587559398437; 
 Wed, 22 Apr 2020 05:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
 <20200422085953.GB28601@Air-de-Roger>
In-Reply-To: <20200422085953.GB28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Apr 2020 06:42:42 -0600
X-Gmail-Original-Message-ID: <CABfawhmBW4kiv_mCUrH_JTdCDZWdbb7Qf65_i350apx-q7NXbg@mail.gmail.com>
Message-ID: <CABfawhmBW4kiv_mCUrH_JTdCDZWdbb7Qf65_i350apx-q7NXbg@mail.gmail.com>
Subject: Re: [PATCH v16 1/3] mem_sharing: fix sharability check during fork
 reset
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 3:00 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Apr 21, 2020 at 10:47:23AM -0700, Tamas K Lengyel wrote:
> > When resetting a VM fork we ought to only remove pages that were alloca=
ted for
> > the fork during it's execution and the contents copied over from the pa=
rent.
> > This can be determined if the page is sharable as special pages used by=
 the
> > fork for other purposes will not pass this test.
>
> Would it be easier to just check if the page refcount is > 1? (as I
> expect Xen is also holding a reference to this page)

That by itself is not necessarily enough.

>
> > Unfortunately during the fork
> > reset loop we only partially check whether that's the case. A page's ty=
pe may
> > indicate it is sharable (pass p2m_is_sharable) but that's not a suffici=
ent
> > check by itself. All checks that are normally performed before a page i=
s
> > converted to the sharable type need to be performed to avoid removing p=
ages
> > from the p2m that may be used for other purposes. For example, currentl=
y the
> > reset loop also removes the vcpu info pages from the p2m, potentially p=
utting
> > the guest into infinite page-fault loops.
> >
> > For this we extend the existing nominate_page and page_make_sharable fu=
nctions
> > to perform a validation-only run without actually converting the page.
>
> Maybe you could split that chunk into a separate helper that just
> performs the checks?

I think it's fine this way that we just bail half-way through the
process of making the page shared. Splitting this out to a helper
would require a lot more code-shuffling.

>
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 79 ++++++++++++++++++++++-------------
> >  1 file changed, 50 insertions(+), 29 deletions(-)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index e572e9e39d..d8ed660abb 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -633,31 +633,35 @@ unsigned int mem_sharing_get_nr_shared_mfns(void)
> >  /* Functions that change a page's type and ownership */
> >  static int page_make_sharable(struct domain *d,
> >                                struct page_info *page,
> > -                              int expected_refcnt)
> > +                              int expected_refcnt,
> > +                              bool validate_only)
> >  {
> > -    bool_t drop_dom_ref;
> > +    int rc;
> > +    bool drop_dom_ref =3D false;
> >
> > -    spin_lock(&d->page_alloc_lock);
> > +    /* caller already has the lock when validating only */
> > +    if ( !validate_only )
> > +        spin_lock(&d->page_alloc_lock);
>
> page_alloc_lock seems to be used as a recursive lock by some callers,
> could you do the same here?

We can do that, yes.

>
> >
> >      if ( d->is_dying )
> >      {
> > -        spin_unlock(&d->page_alloc_lock);
> > -        return -EBUSY;
> > +        rc =3D -EBUSY;
> > +        goto out;
> >      }
> >
> >      /* Change page type and count atomically */
> >      if ( !get_page_and_type(page, d, PGT_shared_page) )
> >      {
> > -        spin_unlock(&d->page_alloc_lock);
> > -        return -EINVAL;
> > +        rc =3D -EINVAL;
> > +        goto out;
> >      }
> >
> >      /* Check it wasn't already sharable and undo if it was */
> >      if ( (page->u.inuse.type_info & PGT_count_mask) !=3D 1 )
> >      {
> > -        spin_unlock(&d->page_alloc_lock);
> >          put_page_and_type(page);
> > -        return -EEXIST;
> > +        rc =3D -EEXIST;
> > +        goto out;
> >      }
> >
> >      /*
> > @@ -666,20 +670,31 @@ static int page_make_sharable(struct domain *d,
> >       */
> >      if ( page->count_info !=3D (PGC_allocated | (2 + expected_refcnt))=
 )
> >      {
> > -        spin_unlock(&d->page_alloc_lock);
> >          /* Return type count back to zero */
> >          put_page_and_type(page);
> > -        return -E2BIG;
> > +        rc =3D -E2BIG;
> > +        goto out;
> > +    }
> > +
> > +    rc =3D 0;
> > +
> > +    if ( validate_only )
> > +    {
> > +        put_page_and_type(page);
>
> You seem to check some page attributes but then put the page again,
> which looks racy to me. Since you put the page, couldn't the checks
> that you have performed be stale by the point the data is consumed by
> the caller?

During fork reset when this is called with validate_only =3D true the
domain is paused. Furthermore, fork reset is only for forks that have
no device model running, so nothing is interacting with its memory
that could acquire extra references. So no, this isn't racy since
there is nothing to race against that I'm aware of. Also, this check
is really to check for special pages, all of which are setup during
the initial fork process, not during runtime of the fork.

>
> > +        goto out;
> >      }
> >
> >      page_set_owner(page, dom_cow);
> >      drop_dom_ref =3D !domain_adjust_tot_pages(d, -1);
> >      page_list_del(page, &d->page_list);
> > -    spin_unlock(&d->page_alloc_lock);
> >
> > +out:
> > +    if ( !validate_only )
> > +        spin_unlock(&d->page_alloc_lock);
> >      if ( drop_dom_ref )
> >          put_domain(d);
> > -    return 0;
> > +
> > +    return rc;
> >  }
> >
> >  static int page_make_private(struct domain *d, struct page_info *page)
> > @@ -809,8 +824,8 @@ static int debug_gref(struct domain *d, grant_ref_t=
 ref)
> >      return debug_gfn(d, gfn);
> >  }
> >
> > -static int nominate_page(struct domain *d, gfn_t gfn,
> > -                         int expected_refcnt, shr_handle_t *phandle)
> > +static int nominate_page(struct domain *d, gfn_t gfn, int expected_ref=
cnt,
>
> Is there any reason for expected_refcnt to be signed? All callers use
> unsigned values.

No reason. It's just how the code was written by the original author
and we never changed it.

Tamas

