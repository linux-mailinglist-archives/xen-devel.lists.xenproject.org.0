Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0766ACFD5B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008013.1387222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRLo-00087o-Tr; Fri, 06 Jun 2025 07:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008013.1387222; Fri, 06 Jun 2025 07:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRLo-00085v-RK; Fri, 06 Jun 2025 07:18:52 +0000
Received: by outflank-mailman (input) for mailman id 1008013;
 Fri, 06 Jun 2025 07:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNRLm-00085p-Lo
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:18:51 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776363b4-42a6-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:18:38 +0200 (CEST)
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
X-Inumbo-ID: 776363b4-42a6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749194317; x=1749453517;
	bh=kHTft95SokdX/vhaJIbupMclTjGrHlhG6AlJxlMLmCU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FRjisVGZlP4pXB4m8+8/B+lx/AjxEXr7LI7NNeKwlcgCy9qkB6P7K+/zaOh7+yRlu
	 +P7UugF0mCcfwimCO8alfBC+knuH5d1fuXmTn4ethRbrxoau7Z0r5vSZ/tAsMpnEN2
	 TMDdajpbeRRZ/hHa1GXhbY0iun6q+2XUB8cy6EbAIto7Q/HjvK7gykAinNMm75pYX0
	 2mBvjFGMS6PynbSjF80nJ17LoBtfQaEPx8PXJbZNJITHkWF2kZelzQ1C7ygMSGQxjL
	 uop/2/J+E5q7F78Nu/UJ61iUq4oUbOtXGDgBOAbrjjLZii0zsnfmg1+0YYk21FVntL
	 oNj9OVaDJv7Tw==
Date: Fri, 06 Jun 2025 07:18:32 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation flags
Message-ID: <aEKWQusrcPERP0qe@kraken>
In-Reply-To: <aEFed_4esi3J_Tw-@macbook.local>
References: <20250602191717.148361-1-dmukhin@ford.com> <20250602191717.148361-2-dmukhin@ford.com> <aEFed_4esi3J_Tw-@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 32b51bb41785c6dabfc55254e3f5dacc563899a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 11:08:07AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jun 02, 2025 at 07:17:30PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add common emulation_flags for configuring domain emulation features.
> >
> > Print d->emulation_flags from 'q' keyhandler for better traceability wh=
ile
> > debugging.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes since v4:
> > - kept Stefano's R-b
> > ---
> >  xen/arch/x86/domain.c             |  2 +-
> >  xen/arch/x86/domctl.c             |  2 +-
> >  xen/arch/x86/include/asm/domain.h | 25 +++++++++++--------------
> >  xen/common/keyhandler.c           |  1 +
> >  xen/include/xen/sched.h           |  2 ++
> >  5 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 7536b6c871..0363ccb384 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -831,7 +831,7 @@ int arch_domain_create(struct domain *d,
> >                 emflags);
> >          return -EOPNOTSUPP;
> >      }
> > -    d->arch.emulation_flags =3D emflags;
> > +    d->emulation_flags =3D emflags;
> >
> >  #ifdef CONFIG_PV32
> >      HYPERVISOR_COMPAT_VIRT_START(d) =3D
> > diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> > index 3044f706de..37d848f683 100644
> > --- a/xen/arch/x86/domctl.c
> > +++ b/xen/arch/x86/domctl.c
> > @@ -144,7 +144,7 @@ void arch_get_domain_info(const struct domain *d,
> >      if ( paging_mode_hap(d) )
> >          info->flags |=3D XEN_DOMINF_hap;
> >
> > -    info->arch_config.emulation_flags =3D d->arch.emulation_flags;
> > +    info->arch_config.emulation_flags =3D d->emulation_flags;
> >      info->gpaddr_bits =3D hap_paddr_bits;
> >  }
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index 8c0dea12a5..eafd5cfc90 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -455,9 +455,6 @@ struct arch_domain
> >
> >      /* Don't unconditionally inject #GP for unhandled MSRs. */
> >      bool msr_relaxed;
> > -
> > -    /* Emulated devices enabled bitmap. */
> > -    uint32_t emulation_flags;
> >  } __cacheline_aligned;
> >
> >  #ifdef CONFIG_HVM
> > @@ -494,17 +491,17 @@ struct arch_domain
> >                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |     =
  \
> >                                   X86_EMU_VPCI)
> >
> > -#define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAP=
IC))
> > -#define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPE=
T))
> > -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM)=
)
> > -#define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC=
))
> > -#define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOA=
PIC))
> > -#define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC=
))
> > -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA=
))
> > -#define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOM=
MU))
> > -#define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT=
))
> > -#define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE=
_PIRQ))
> > -#define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPC=
I))
> > +#define has_vlapic(d)      (!!((d)->emulation_flags & X86_EMU_LAPIC))
> > +#define has_vhpet(d)       (!!((d)->emulation_flags & X86_EMU_HPET))
> > +#define has_vpm(d)         (!!((d)->emulation_flags & X86_EMU_PM))
> > +#define has_vrtc(d)        (!!((d)->emulation_flags & X86_EMU_RTC))
> > +#define has_vioapic(d)     (!!((d)->emulation_flags & X86_EMU_IOAPIC))
> > +#define has_vpic(d)        (!!((d)->emulation_flags & X86_EMU_PIC))
> > +#define has_vvga(d)        (!!((d)->emulation_flags & X86_EMU_VGA))
> > +#define has_viommu(d)      (!!((d)->emulation_flags & X86_EMU_IOMMU))
> > +#define has_vpit(d)        (!!((d)->emulation_flags & X86_EMU_PIT))
> > +#define has_pirq(d)        (!!((d)->emulation_flags & X86_EMU_USE_PIRQ=
))
> > +#define has_vpci(d)        (!!((d)->emulation_flags & X86_EMU_VPCI))
> >
> >  #define gdt_ldt_pt_idx(v) \
> >        ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
> > diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> > index 0bb842ec00..cd731452ba 100644
> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key=
)
> >              if ( test_bit(i, &d->watchdog_inuse_map) )
> >                  printk("    watchdog %d expires in %d seconds\n",
> >                         i, (u32)((d->watchdog_timer[i].expires - NOW())=
 >> 30));
> > +        printk("    emulation_flags %#x\n", d->emulation_flags);
>=20
> No strong opinion, but my preference would be to print those as
> strings if possible, ie:
>=20
> printk("    emulation_flags: %s%s%s...(%#x)\n",
>        !d->emulation_flags ? "none " : "",
>        has_vlapic(d) ? "vlapic " : "",
>        has_vhpet(d) ? "hpet " : "",
>        ...,
>        d->emulation_flags);

Thanks for suggestion.

There was the same feedback already:
  https://lore.kernel.org/xen-devel/aDd9Z3eY3RQgTTdy@kraken/

Is it OK to address it in the follow on change for both Arm and x86?

>=20
> Thanks, Roger.


