Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5591B4AA3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 18:34:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRIKS-00064E-5l; Wed, 22 Apr 2020 16:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXoo=6G=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jRIKQ-000645-Cb
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 16:34:26 +0000
X-Inumbo-ID: 20c5d18e-84b7-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20c5d18e-84b7-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 16:34:25 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f12so1961743edn.12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gwL52jhgsPisokJqqP2AaJci4wTaX2YHQDDtdSUNJHY=;
 b=aYwVQ53Ca3QNtnUqsJokxb0Vmp20nBKVeS0wo4H0ifBGhDZlnaU82gkpQpZegJowr2
 sVWyDw0ApJFgVhc/YqvU6HcFbhziKsKVEGjCl0nN4rWjBq0FUsNC+BrwtvXVVObmcyvM
 gsKenSylaSb2NT67jZHY23u+tQvVE1r4auAjdQK0//4te6qZc7qzb90jq149TSKw6kJt
 t4fVtkMFNanbKu8DKmp1lCCwDo2yylRF2Gk6X/68Xj0NQLAWFDBVr0075qfuTHI8rBR/
 Bbto67cjDOoGF9JeiBxhgnp7OBhEqZfQJUpMqJ3MpmWrwAzgwXy/9l6zBNDUNJ/z6oKB
 OmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gwL52jhgsPisokJqqP2AaJci4wTaX2YHQDDtdSUNJHY=;
 b=UwLCBnSG4dXRBS1lk2ycIiqhzWbsAXr3XSAnSukhO+WQd8r6GYZlNZPrWLPSbI4wOf
 gyAkaB2kP+0R0701LGxdLYJryM99WuURWk5DaN9OdzZmZfxdkX5ZxxUgDBLx+tJWl4yq
 I7qo3+pqOR+i9Kefgv0PJZ0YEJ1UUx4gkzVuaZ/VOjX2HSXD7tgHvRq4dhVhexbO1mZT
 D6ZEXfJXQclKDAo21byAHAoafA+zzdQICCtvJCGTZoXtpc4cui7NcHMKkhteUJj9hrcJ
 m68VEf9jg3MFh9QQvBuQeovie9q3cn/ZKjLx56VW1crvQGu5q4aEjqma+Ai6g7DZoPBq
 iDJg==
X-Gm-Message-State: AGi0PuYX1pru2QSdeXnkJ6erKp3vXacTNt+zNmFw/zkw8SQBZdZhq2eW
 EZCaHttHv/Wdqb+4UmvbTcgUeBAZVNs=
X-Google-Smtp-Source: APiQypKjovmCYBTvIi1rjLD22D0kuAPnQOWa1v+VxWzwOMiWeRZeFnx4a3RA9nKmLbDGydYUT3xgPA==
X-Received: by 2002:aa7:d481:: with SMTP id b1mr2080111edr.226.1587573264439; 
 Wed, 22 Apr 2020 09:34:24 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id r26sm670398edw.34.2020.04.22.09.34.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 09:34:23 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id h2so3117854wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 09:34:22 -0700 (PDT)
X-Received: by 2002:a7b:c858:: with SMTP id c24mr12056096wml.51.1587573262084; 
 Wed, 22 Apr 2020 09:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
 <20200422085953.GB28601@Air-de-Roger>
 <CABfawhmBW4kiv_mCUrH_JTdCDZWdbb7Qf65_i350apx-q7NXbg@mail.gmail.com>
 <20200422154956.GE28601@Air-de-Roger>
In-Reply-To: <20200422154956.GE28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Apr 2020 10:33:45 -0600
X-Gmail-Original-Message-ID: <CABfawhnfgd8AMuovdcdYcraSk5GOszum71RYBAOZq46uSscs4g@mail.gmail.com>
Message-ID: <CABfawhnfgd8AMuovdcdYcraSk5GOszum71RYBAOZq46uSscs4g@mail.gmail.com>
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

On Wed, Apr 22, 2020 at 9:50 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Wed, Apr 22, 2020 at 06:42:42AM -0600, Tamas K Lengyel wrote:
> > On Wed, Apr 22, 2020 at 3:00 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Tue, Apr 21, 2020 at 10:47:23AM -0700, Tamas K Lengyel wrote:
> > > > @@ -666,20 +670,31 @@ static int page_make_sharable(struct domain *=
d,
> > > >       */
> > > >      if ( page->count_info !=3D (PGC_allocated | (2 + expected_refc=
nt)) )
> > > >      {
> > > > -        spin_unlock(&d->page_alloc_lock);
> > > >          /* Return type count back to zero */
> > > >          put_page_and_type(page);
> > > > -        return -E2BIG;
> > > > +        rc =3D -E2BIG;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    rc =3D 0;
> > > > +
> > > > +    if ( validate_only )
> > > > +    {
> > > > +        put_page_and_type(page);
> > >
> > > You seem to check some page attributes but then put the page again,
> > > which looks racy to me. Since you put the page, couldn't the checks
> > > that you have performed be stale by the point the data is consumed by
> > > the caller?
> >
> > During fork reset when this is called with validate_only =3D true the
> > domain is paused. Furthermore, fork reset is only for forks that have
> > no device model running, so nothing is interacting with its memory
> > that could acquire extra references. So no, this isn't racy since
> > there is nothing to race against that I'm aware of. Also, this check
> > is really to check for special pages, all of which are setup during
> > the initial fork process, not during runtime of the fork.
>
> Right, it would feel safer to me however if you just return from
> page_make_sharable while having a page reference, and drop it in
> mem_sharing_fork_reset if the page shouldn't be removed from the fork.
>
> This way you could also avoid having to take an extra reference just
> after returning from nominate_page in mem_sharing_fork_reset.
> page_make_sharable already returns while having taken an extra
> reference to the page in the non validate only case anyway.

Ah yea, that would make sense. Good idea!

> > >
> > > > +        goto out;
> > > >      }
> > > >
> > > >      page_set_owner(page, dom_cow);
> > > >      drop_dom_ref =3D !domain_adjust_tot_pages(d, -1);
> > > >      page_list_del(page, &d->page_list);
> > > > -    spin_unlock(&d->page_alloc_lock);
> > > >
> > > > +out:
> > > > +    if ( !validate_only )
> > > > +        spin_unlock(&d->page_alloc_lock);
> > > >      if ( drop_dom_ref )
> > > >          put_domain(d);
> > > > -    return 0;
> > > > +
> > > > +    return rc;
> > > >  }
> > > >
> > > >  static int page_make_private(struct domain *d, struct page_info *p=
age)
> > > > @@ -809,8 +824,8 @@ static int debug_gref(struct domain *d, grant_r=
ef_t ref)
> > > >      return debug_gfn(d, gfn);
> > > >  }
> > > >
> > > > -static int nominate_page(struct domain *d, gfn_t gfn,
> > > > -                         int expected_refcnt, shr_handle_t *phandl=
e)
> > > > +static int nominate_page(struct domain *d, gfn_t gfn, int expected=
_refcnt,
> > >
> > > Is there any reason for expected_refcnt to be signed? All callers use
> > > unsigned values.
> >
> > No reason. It's just how the code was written by the original author
> > and we never changed it.
>
> Since you are already changing those lines, can I ask you to also
> change it to unsigned in the places that you touch?

Sure thing.

Thanks,
Tamas

