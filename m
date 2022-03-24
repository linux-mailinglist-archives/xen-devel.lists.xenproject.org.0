Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848D4E66FF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 17:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294468.500761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQJM-0007VZ-4L; Thu, 24 Mar 2022 16:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294468.500761; Thu, 24 Mar 2022 16:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXQJM-0007TL-0s; Thu, 24 Mar 2022 16:27:44 +0000
Received: by outflank-mailman (input) for mailman id 294468;
 Thu, 24 Mar 2022 16:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZOSR=UD=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXQJK-0007TC-GF
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 16:27:42 +0000
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5284d205-ab8f-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 17:27:40 +0100 (CET)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 8263A18000B3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 12:27:39 -0400 (EDT)
Received: from mail-oa1-f49.google.com (unknown [10.20.151.176])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 5D36D18000A2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 12:27:39 -0400 (EDT)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so5399118fac.11
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 09:27:39 -0700 (PDT)
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
X-Inumbo-ID: 5284d205-ab8f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648139259;
	bh=sOmGWXvWba3zw0uZkbQlDsoegecuOkDE/8Nct1skgGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ltClpZaFG6RqAiRFQpFQHORhVlYlBumF9IbH7YbaKYl6cZz5GWtRH/xz5DbfYc7Pi
	 /uYnG/754GRCRFDgfsub7xJx2cAF6xHoXOI0HKH88lzUfyd05YvmFTC7EpKCd6sTxM
	 JY5Z97KhwGENg7apjyYXfE/epKav4+96ZMTuTkqQiWHtWHr7Zhbbs4ndyh80t+yEg3
	 Nf129bYVLGVGVacGEkKn5MuF2ZQ2Yddgtm1SEA73hdF43Mj2dvy1Okpkz3TMNl/Mq6
	 viJgkTGDj0Ot42SYlWb+PfoFXpIRjRfcG1IfvG6xcBU2mfXDlFfxs1XSWl776zulhb
	 4x6RFGAY6EFwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648139259;
	bh=sOmGWXvWba3zw0uZkbQlDsoegecuOkDE/8Nct1skgGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ltClpZaFG6RqAiRFQpFQHORhVlYlBumF9IbH7YbaKYl6cZz5GWtRH/xz5DbfYc7Pi
	 /uYnG/754GRCRFDgfsub7xJx2cAF6xHoXOI0HKH88lzUfyd05YvmFTC7EpKCd6sTxM
	 JY5Z97KhwGENg7apjyYXfE/epKav4+96ZMTuTkqQiWHtWHr7Zhbbs4ndyh80t+yEg3
	 Nf129bYVLGVGVacGEkKn5MuF2ZQ2Yddgtm1SEA73hdF43Mj2dvy1Okpkz3TMNl/Mq6
	 viJgkTGDj0Ot42SYlWb+PfoFXpIRjRfcG1IfvG6xcBU2mfXDlFfxs1XSWl776zulhb
	 4x6RFGAY6EFwQ==
X-Gm-Message-State: AOAM530DjsvhNnCI4u1fKSZVimSDUfMHI6K4h+olFXZtkY6EyfuBgW/6
	mgH5v6RjTXRTM2wJZ4+OcDa92ZuqX+knqIHjJws=
X-Google-Smtp-Source: ABdhPJz7dG4CWV3cPQfwWKUKzos1bhWfrVujLpJ+VmdqnNCGAcV1WsnaAjV5qVM7ntb9Hj9iZMXcfAh+46qA7RoHu0Q=
X-Received: by 2002:a05:6870:ea81:b0:db:3e68:7ae0 with SMTP id
 s1-20020a056870ea8100b000db3e687ae0mr7176271oap.9.1648139258594; Thu, 24 Mar
 2022 09:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <YjyFODl7VFJLaj0c@Air-de-Roger> <CABfawhk9n08bmXWO1iM7Sz-5uhzuT5W6BZzj+yNDW1+FFDA5GA@mail.gmail.com>
 <YjyTf4INCjKWD09n@Air-de-Roger>
In-Reply-To: <YjyTf4INCjKWD09n@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 24 Mar 2022 12:27:02 -0400
X-Gmail-Original-Message-ID: <CABfawhmWtxpb3E_vxRRAV6b=P7_T3Mhd+rZ=_XY+6J3-vv+-+w@mail.gmail.com>
Message-ID: <CABfawhmWtxpb3E_vxRRAV6b=P7_T3Mhd+rZ=_XY+6J3-vv+-+w@mail.gmail.com>
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

On Thu, Mar 24, 2022 at 11:51 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
>
> On Thu, Mar 24, 2022 at 11:15:08AM -0400, Tamas K Lengyel wrote:
> > On Thu, Mar 24, 2022 at 10:50 AM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com> wrote:
> > >
> > > On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > > > Add option to the fork memop to skip populating the fork with speci=
al pages.
> > > > These special pages are only necessary when setting up forks to be =
fully
> > > > functional with a toolstack. For short-lived forks where no toolsta=
ck is active
> > > > these pages are uneccesary.
> > >
> > > I'm not sure those are strictly related to having a toolstack. For
> > > example the vcpu_info has nothing to do with having a toolstack, and
> > > is only used by the guest in order to receive events or fetch time
> > > related data. So while a short-lived fork might not make use of those=
,
> > > that has nothing to do with having a toolstack or not.
> >
> > Fair enough, the point is that the short live fork doesn't use these pa=
ges.
> >
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > > ---
> > > >  xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
> > > >  xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++------=
----
> > > >  xen/include/public/memory.h           |  4 ++--
> > > >  3 files changed, 26 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/i=
nclude/asm/hvm/domain.h
> > > > index 698455444e..446cd06411 100644
> > > > --- a/xen/arch/x86/include/asm/hvm/domain.h
> > > > +++ b/xen/arch/x86/include/asm/hvm/domain.h
> > > > @@ -31,7 +31,9 @@
> > > >  #ifdef CONFIG_MEM_SHARING
> > > >  struct mem_sharing_domain
> > > >  {
> > > > -    bool enabled, block_interrupts;
> > > > +    bool enabled;
> > > > +    bool block_interrupts;
> > > > +    bool skip_special_pages;
> > > >
> > > >      /*
> > > >       * When releasing shared gfn's in a preemptible manner, recall=
 where
> > > > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sh=
aring.c
> > > > index 15e6a7ed81..84c04ddfa3 100644
> > > > --- a/xen/arch/x86/mm/mem_sharing.c
> > > > +++ b/xen/arch/x86/mm/mem_sharing.c
> > > > @@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, =
struct domain *d)
> > > >      return 0;
> > > >  }
> > > >
> > > > -static int copy_vcpu_settings(struct domain *cd, const struct doma=
in *d)
> > > > +static int copy_vcpu_settings(struct domain *cd, const struct doma=
in *d,
> > > > +                              bool skip_special_pages)
> > > >  {
> > > >      unsigned int i;
> > > >      struct p2m_domain *p2m =3D p2m_get_hostp2m(cd);
> > > > @@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *=
cd, const struct domain *d)
> > > >
> > > >          /* Copy & map in the vcpu_info page if the guest uses one =
*/
> > > >          vcpu_info_mfn =3D d_vcpu->vcpu_info_mfn;
> > > > -        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> > > > +        if ( !skip_special_pages && !mfn_eq(vcpu_info_mfn, INVALID=
_MFN) )
> > > >          {
> > > >              mfn_t new_vcpu_info_mfn =3D cd_vcpu->vcpu_info_mfn;
> > > >
> > > > @@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain=
 *cd, struct domain *d)
> > > >      return 0;
> > > >  }
> > > >
> > > > -static int copy_settings(struct domain *cd, struct domain *d)
> > > > +static int copy_settings(struct domain *cd, struct domain *d,
> > > > +                         bool skip_special_pages)
> > > >  {
> > > >      int rc;
> > > >
> > > > -    if ( (rc =3D copy_vcpu_settings(cd, d)) )
> > > > +    if ( (rc =3D copy_vcpu_settings(cd, d, skip_special_pages)) )
> > > >          return rc;
> > > >
> > > >      if ( (rc =3D hvm_copy_context_and_params(cd, d)) )
> > > >          return rc;
> > > >
> > > > -    if ( (rc =3D copy_special_pages(cd, d)) )
> > > > +    if ( !skip_special_pages && (rc =3D copy_special_pages(cd, d))=
 )
> > > >          return rc;
> > > >
> > > >      copy_tsc(cd, d);
> > > > @@ -1826,9 +1828,11 @@ static int copy_settings(struct domain *cd, =
struct domain *d)
> > > >      return rc;
> > > >  }
> > > >
> > > > -static int fork(struct domain *cd, struct domain *d)
> > > > +static int fork(struct domain *cd, struct domain *d, uint16_t flag=
s)
> > > >  {
> > > >      int rc =3D -EBUSY;
> > > > +    bool block_interrupts =3D flags & XENMEM_FORK_BLOCK_INTERRUPTS=
;
> > > > +    bool skip_special_pages =3D flags & XENMEM_FORK_SKIP_SPECIAL_P=
AGES;
> > > >
> > > >      if ( !cd->controller_pause_count )
> > > >          return rc;
> > > > @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct do=
main *d)
> > > >      if ( (rc =3D bring_up_vcpus(cd, d)) )
> > > >          goto done;
> > > >
> > > > -    rc =3D copy_settings(cd, d);
> > > > +    if ( !(rc =3D copy_settings(cd, d, skip_special_pages)) )
> > >
> > > Can you set
> > > cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages} earlie=
r
> > > so that you don't need to pass the options around to copy_settings an=
d
> > > copy_vcpu_settings?
> >
> > Would be possible yes, but then we would have to clear them in case
> > the forking failed at any point. Setting them only at the end when the
> > fork finished ensures that those fields are only ever valid if the VM
> > is a fork. Both are valid approaches and I prefer this over the other.
>
> I think I'm confused, doesn't the fork get destroyed if there's a
> failure? In which case the values
> cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages}
> shouldn't really matter?

No, the domain that will be a fork is just a regular domain until the
fork operation completes. If the fork operation fails the domain
remains.

> > >
> > > > +    {
> > > > +        cd->arch.hvm.mem_sharing.block_interrupts =3D block_interr=
upts;
> > > > +        cd->arch.hvm.mem_sharing.skip_special_pages =3D skip_speci=
al_pages;
> > > > +        /* skip mapping the vAPIC page on unpause if skipping spec=
ial pages */
> > > > +        cd->creation_finished =3D skip_special_pages;
> > >
> > > I think this is dangerous. While it might be true at the moment that
> > > the arch_domain_creation_finished only maps the vAPIC page, there's n=
o
> > > guarantee it couldn't do other stuff in the future that could be
> > > required for the VM to be started.
> >
> > I understand this domain_creation_finished route could be expanded in
> > the future to include other stuff, but IMHO we can evaluate what to do
> > about that when and if it becomes necessary. This is all experimental
> > to begin with.
>
> Maybe you could check the skip_special_pages field from
> domain_creation_finished in order to decide whether the vAPIC page
> needs to be mapped?

Could certainly do that but it means adding experimental code in an
#ifdef to the vAPIC mapping logic. Technically nothing wrong with that
but I would prefer keeping all this code in a single-place if
possible.

Tamas

