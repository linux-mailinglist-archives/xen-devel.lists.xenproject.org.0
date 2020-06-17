Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8B1FCE01
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:01:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXgb-0002mf-6R; Wed, 17 Jun 2020 13:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlXgZ-0002ma-GJ
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:00:59 +0000
X-Inumbo-ID: 965f52e4-b09a-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 965f52e4-b09a-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 13:00:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so2223646wrs.11
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v/rW5LTGj4GPKbMakqMHyvbq7KnUYJeC2G+6L8ZtCW4=;
 b=O6HLfmLnIfv3/+A9/zApgvPrdUa2WKqxf9UCNTvt7JT7V9uHMSLFZtkmxRz8D5OdFo
 THN6iOcKkpynDRKg0CmUFQH/dnFbhf2T+sIzAMH1OKfB9YivKn74lUAoPtLUnfsY1TAH
 H+Df//lb9P6hgQYjZmvILGN5PKcEFQlV90Y0D9HfO06nFsUZU8EAjlXRz+xZdYYRCOip
 3TZ8RC+sbPrhTZETlr/cwskBq+4MmbGW+0RBumd9Vra61X0XKAuvv74NgOsTTS/yiQqX
 WlqlTB5lDkdt5duUe33Iny/QdldZef98cnxwUphE4k4XM/uKfCWkBxDP4RX9hUOn/JE8
 TV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v/rW5LTGj4GPKbMakqMHyvbq7KnUYJeC2G+6L8ZtCW4=;
 b=CVn0ZDJbiej53FLmIvBTRK0GnE+4aMi5g4Vv+emHO8tmOOYdSWqPOxjH7aRn8pzbX7
 mrnhmx7bbjgT/CP3ctMH0g8nlqprkLTb96miblEW/UoiZsbrVXPQiOmwtPwNEZ9gcjrR
 X4gTh8pGcuDv3fGPdxQEzF89eyzV+S/pzwK3Wr6pWdCMk1/3enjr863HmA1eOJAxuSeX
 iw0rp3scjyXbYRi1qQOmoUMNYOPEka8OPlEgY30xcIYjUA17vmhUqs6bNytRSEOvRDdM
 ty3TpeAx/Giz3BEFSt7joH0Qf0Vlq2Lb+YD0kMbP1FboFeEVJASt+30ya4FQ7Uo2Uvd7
 HkKA==
X-Gm-Message-State: AOAM5325CzHK8HGrTjyLbOXSfqnBecjMwGDZaDCO/h2nUKiyzBGquBDa
 LKElHjq0mA4EmsbBZ86EnM1GMr5yCh26Z2WYtO0=
X-Google-Smtp-Source: ABdhPJx1SgJMRQ8WjbNV2MT3xCeOdan/gzekjwMelb3d+q6tPwr/G39L6QaJjJvzHgky7TUsdMI9EJE/M903F8CAWeQ=
X-Received: by 2002:a5d:490f:: with SMTP id x15mr8257488wrq.259.1592398857729; 
 Wed, 17 Jun 2020 06:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
In-Reply-To: <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 07:00:22 -0600
Message-ID: <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.06.2020 21:31, Tamas K Lengyel wrote:
> > While forking VMs running a small RTOS systems (Zephyr) a Xen crash has been
> > observed due to a mm-lock order violation while copying the HVM CPU context
> > from the parent. This issue has been identified to be due to
> > hap_update_paging_modes getting a lock on the gfn using get_gfn. This call also
> > creates a shared entry in the fork's memory map for the cr3 gfn. The function
> > later calls hap_update_cr3 while holding the paging_lock, which results in the
> > lock-order violation in vmx_load_pdptrs when it tries to unshare the above entry.
> >
> > This issue has not affected VMs running other OS's as a call to vmx_load_pdptrs
> > is benign if PAE is not enabled or if EFER_LMA is set and returns before
> > trying to unshare and map the page.
> >
> > Using get_gfn_type to get a lock on the gfn avoids this problem as we can
> > populate the fork's gfn with a copied page instead of a shared entry if its
> > needed, thus avoiding the lock order violation while holding paging_lock.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> > The bug seems to have been present since commit 4cb6c4f4941, only discovered
> > now due to the heavy use of mem_sharing with VM forks.
>
> I'm unconvinced that commit is the origin of the problem. Before that,
> get_gfn_unshare() was used, which aiui had/has similar locking
> properties. In fact I'm having trouble seeing how this works at all,
> i.e. with or without mem-sharing: p2m_get_page_from_gfn() at the very
> least uses p2m_read_lock(), which also doesn't nest inside the paging
> lock. What am I overlooking?

I haven't investigated past what git blame showed, that's why I said
"seems to have been present since". Entirely possible it was broken
before as well due to the lock ordering. I'm not sure about
p2m_get_page_from_gfn, haven't ran into an issue there (yet).

>
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -748,12 +748,19 @@ static void hap_update_paging_modes(struct vcpu *v)
> >      struct domain *d = v->domain;
> >      unsigned long cr3_gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
> >      p2m_type_t t;
> > +    p2m_query_t q = P2M_ALLOC;
> >
> > -    /* We hold onto the cr3 as it may be modified later, and
> > -     * we need to respect lock ordering. No need for
> > -     * checks here as they are performed by vmx_load_pdptrs
> > -     * (the potential user of the cr3) */
> > -    (void)get_gfn(d, cr3_gfn, &t);
> > +    /*
> > +     * We hold onto the cr3 as it may be modified later, and
> > +     * we need to respect lock ordering. Unshare here if we have to as to avoid
> > +     * a lock-order violation later while we are holding the paging_lock.
> > +     * Further checks are performed by vmx_load_pdptrs (the potential user of
> > +     * the cr3).
> > +     */
>
> Nit: Please re-flow such that the first line isn't very noticeably
> shorter than the later ones.

Sure.

>
> > +    if ( hvm_pae_enabled(v) && !hvm_long_mode_active(v) )
> > +        q |= P2M_UNSHARE;
> > +
> > +    (void)get_gfn_type(d, cr3_gfn, &t, q);
>
> Imo this then wants to be accompanied by dropping the unsharing
> attempt from vmx_load_pdptrs(). By using get_gfn_query_unlocked()
> there (assuming all code paths hold the paging lock) the lock
> order issue could be addressed in full then. (If taking this
> route, the comment ahead of get_gfn_query_unlocked()'s declaration
> will want adjusting, to drop mentioning shadow mode explicitly as
> leveraging already holding the paging lock.)

There is at least another path to vmx_load_pdptrs from
arch_set_info_hvm_guest as well which doesn't hold the paging lock.

> If there are code paths of both kinds, which approach to use in
> vmx_load_pdptrs() may need to be chosen based on what
> paging_locked_by_me() returns. Or perhaps an unlocked query is
> fine in either case?

Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
fine. But at that point what is the reason for having the lock
ordering at all? Why not just have a single recursive lock and avoid
issues like this altogether?

Tamas

