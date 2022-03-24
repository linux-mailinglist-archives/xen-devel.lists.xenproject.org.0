Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C34E65E6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294438.500673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPBn-0004Bs-Qg; Thu, 24 Mar 2022 15:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294438.500673; Thu, 24 Mar 2022 15:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPBn-00048m-Ne; Thu, 24 Mar 2022 15:15:51 +0000
Received: by outflank-mailman (input) for mailman id 294438;
 Thu, 24 Mar 2022 15:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZOSR=UD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXPBl-00048g-S9
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:15:50 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4778b2a3-ab85-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 16:15:47 +0100 (CET)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id 4B3B118000AE
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 11:15:45 -0400 (EDT)
Received: from mail-ot1-f54.google.com (unknown [10.20.151.145])
 by mta-09.privateemail.com (Postfix) with ESMTPA id 28ADA18000AA
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 11:15:45 -0400 (EDT)
Received: by mail-ot1-f54.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so3495009oti.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 08:15:45 -0700 (PDT)
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
X-Inumbo-ID: 4778b2a3-ab85-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648134945;
	bh=b/gOg7X3ZvtJ6+TC9Y6eYzuA/EWT8wPFREbprwYESh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LjqRXUZ46YJ4xs1Q9P5QOCgYuWmrCTpTZlzbNfAJYM78UYKybyRzahoMZm9AoYJKc
	 daaEe6XyYNJQzU9DXG/otQj68AknfT4bURCpkJpcRoxnLQtvN+zHn2NvC1buetUgyT
	 m6zG+u8yrEzfFk2o3SQs/rqmAiNb8Ndhufp3CMmL7aev/hB9e/8J/ovkDlY49HoRrh
	 d9dWBqFsYusCEOIQrdjpVWjOACxiLkF6MT+/S9jWiLaLVvAc/dMrYiRejd2ZUklLG0
	 hTXc5OZueLtORqvz0N86YEtSYLtUD2Md1+qLLrhqDzUXMubGSW73MrLPhtyUtyHQZJ
	 MpB930lIpzX8w==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648134945;
	bh=b/gOg7X3ZvtJ6+TC9Y6eYzuA/EWT8wPFREbprwYESh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LjqRXUZ46YJ4xs1Q9P5QOCgYuWmrCTpTZlzbNfAJYM78UYKybyRzahoMZm9AoYJKc
	 daaEe6XyYNJQzU9DXG/otQj68AknfT4bURCpkJpcRoxnLQtvN+zHn2NvC1buetUgyT
	 m6zG+u8yrEzfFk2o3SQs/rqmAiNb8Ndhufp3CMmL7aev/hB9e/8J/ovkDlY49HoRrh
	 d9dWBqFsYusCEOIQrdjpVWjOACxiLkF6MT+/S9jWiLaLVvAc/dMrYiRejd2ZUklLG0
	 hTXc5OZueLtORqvz0N86YEtSYLtUD2Md1+qLLrhqDzUXMubGSW73MrLPhtyUtyHQZJ
	 MpB930lIpzX8w==
X-Gm-Message-State: AOAM5327XF0p0eUfV14/4GAHpSYkXJoWXzHO3KGScpbvw/g9gsUFFvrE
	WZdrMTVpunZi7N2dcyMTg79w19VV7jUDqBxbozI=
X-Google-Smtp-Source: ABdhPJyn42So2l+Megiwq5URQjW0+hfJtjaRKR/n+kF9a/Iyx+9P++a1GzCd7b3satFGdXMxusmKGJOcL14cDN73RIU=
X-Received: by 2002:a9d:638a:0:b0:5cd:a7fc:aa89 with SMTP id
 w10-20020a9d638a000000b005cda7fcaa89mr2350300otk.204.1648134944393; Thu, 24
 Mar 2022 08:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <YjyFODl7VFJLaj0c@Air-de-Roger>
In-Reply-To: <YjyFODl7VFJLaj0c@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 24 Mar 2022 11:15:08 -0400
X-Gmail-Original-Message-ID: <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
Message-ID: <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > Add option to the fork memop to skip populating the fork with special p=
ages.
> > These special pages are only necessary when setting up forks to be full=
y
> > functional with a toolstack. For short-lived forks where no toolstack i=
s active
> > these pages are uneccesary.
>
> I'm not sure those are strictly related to having a toolstack. For
> example the vcpu_info has nothing to do with having a toolstack, and
> is only used by the guest in order to receive events or fetch time
> related data. So while a short-lived fork might not make use of those,
> that has nothing to do with having a toolstack or not.

Fair enough, the point is that the short live fork doesn't use these pages.

> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
> >  xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++----------
> >  xen/include/public/memory.h           |  4 ++--
> >  3 files changed, 26 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/inclu=
de/asm/hvm/domain.h
> > index 698455444e..446cd06411 100644
> > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > @@ -31,7 +31,9 @@
> >  #ifdef CONFIG_MEM_SHARING
> >  struct mem_sharing_domain
> >  {
> > -    bool enabled, block_interrupts;
> > +    bool enabled;
> > +    bool block_interrupts;
> > +    bool skip_special_pages;
> >
> >      /*
> >       * When releasing shared gfn's in a preemptible manner, recall whe=
re
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index 15e6a7ed81..84c04ddfa3 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, stru=
ct domain *d)
> >      return 0;
> >  }
> >
> > -static int copy_vcpu_settings(struct domain *cd, const struct domain *=
d)
> > +static int copy_vcpu_settings(struct domain *cd, const struct domain *=
d,
> > +                              bool skip_special_pages)
> >  {
> >      unsigned int i;
> >      struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > @@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *cd, =
const struct domain *d)
> >
> >          /* Copy & map in the vcpu_info page if the guest uses one */
> >          vcpu_info_mfn =3D d_vcpu->vcpu_info_mfn;
> > -        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > +        if ( !skip_special_pages && !mfn_eq(vcpu_info_mfn, INVALID_MFN=
) )
> >          {
> >              mfn_t new_vcpu_info_mfn =3D cd_vcpu->vcpu_info_mfn;
> >
> > @@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain *cd=
, struct domain *d)
> >      return 0;
> >  }
> >
> > -static int copy_settings(struct domain *cd, struct domain *d)
> > +static int copy_settings(struct domain *cd, struct domain *d,
> > +                         bool skip_special_pages)
> >  {
> >      int rc;
> >
> > -    if ( (rc =3D copy_vcpu_settings(cd, d)) )
> > +    if ( (rc =3D copy_vcpu_settings(cd, d, skip_special_pages)) )
> >          return rc;
> >
> >      if ( (rc =3D hvm_copy_context_and_params(cd, d)) )
> >          return rc;
> >
> > -    if ( (rc =3D copy_special_pages(cd, d)) )
> > +    if ( !skip_special_pages && (rc =3D copy_special_pages(cd, d)) )
> >          return rc;
> >
> >      copy_tsc(cd, d);
> > @@ -1826,9 +1828,11 @@ static int copy_settings(struct domain *cd, stru=
ct domain *d)
> >      return rc;
> >  }
> >
> > -static int fork(struct domain *cd, struct domain *d)
> > +static int fork(struct domain *cd, struct domain *d, uint16_t flags)
> >  {
> >      int rc =3D -EBUSY;
> > +    bool block_interrupts =3D flags & XENMEM_FORK_BLOCK_INTERRUPTS;
> > +    bool skip_special_pages =3D flags & XENMEM_FORK_SKIP_SPECIAL_PAGES=
;
> >
> >      if ( !cd->controller_pause_count )
> >          return rc;
> > @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain=
 *d)
> >      if ( (rc =3D bring_up_vcpus(cd, d)) )
> >          goto done;
> >
> > -    rc =3D copy_settings(cd, d);
> > +    if ( !(rc =3D copy_settings(cd, d, skip_special_pages)) )
>
> Can you set
> cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages} earlier
> so that you don't need to pass the options around to copy_settings and
> copy_vcpu_settings?

Would be possible yes, but then we would have to clear them in case
the forking failed at any point. Setting them only at the end when the
fork finished ensures that those fields are only ever valid if the VM
is a fork. Both are valid approaches and I prefer this over the other.

>
> > +    {
> > +        cd->arch.hvm.mem_sharing.block_interrupts =3D block_interrupts=
;
> > +        cd->arch.hvm.mem_sharing.skip_special_pages =3D skip_special_p=
ages;
> > +        /* skip mapping the vAPIC page on unpause if skipping special =
pages */
> > +        cd->creation_finished =3D skip_special_pages;
>
> I think this is dangerous. While it might be true at the moment that
> the arch_domain_creation_finished only maps the vAPIC page, there's no
> guarantee it couldn't do other stuff in the future that could be
> required for the VM to be started.

I understand this domain_creation_finished route could be expanded in
the future to include other stuff, but IMHO we can evaluate what to do
about that when and if it becomes necessary. This is all experimental
to begin with.

> Does it add much overhead to map the vAPIC page?

I don't have numbers but it does add overhead. When we do a fork reset
we loop through all pages in the physmap to determine what needs to be
removed. So having an extra page means that loop is always larger than
it actually needs to be. Considering we do the reset thousands of
times per second per core, you can imagine it adding up over time.

Tamas

