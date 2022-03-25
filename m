Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C694E7487
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294750.501314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkO8-0003Pr-TH; Fri, 25 Mar 2022 13:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294750.501314; Fri, 25 Mar 2022 13:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkO8-0003O0-Py; Fri, 25 Mar 2022 13:54:00 +0000
Received: by outflank-mailman (input) for mailman id 294750;
 Fri, 25 Mar 2022 13:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ci4N=UE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXkO7-0003Nu-8O
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:53:59 +0000
Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com
 [198.54.122.105]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0383e943-ac43-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 14:53:57 +0100 (CET)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 56CA418000A3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 09:53:55 -0400 (EDT)
Received: from mail-oa1-f50.google.com (unknown [10.20.151.194])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 31A0218000A2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 09:53:55 -0400 (EDT)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so8195498fac.7
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 06:53:55 -0700 (PDT)
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
X-Inumbo-ID: 0383e943-ac43-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648216435;
	bh=XUFzPRyKCp2j4zYz9JlZuJ5ms63NILvxPLxFOvxogHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CFH3ISdlj6ZRv9d6itg5EQjxqjEs+S2BWl+4e9X7yHtZSh8bDARVeqNwbigsM4h2+
	 BuBUqwelypHVBALpE6e1K7nQcrWjadpLCRvWXlDCPNiK1+Mku1UeSznDJr6wIX8N9p
	 1k+XaSRUapNCR5ydOcaZYWvB5xrlUsbcozpFOBAkuBlHub+se1JrowoTcjMsaD0X3/
	 P/fFmQfvg72BJt/rGbZ+zw0CRDILUsBFvn0v6orbd0btZVRBG3RU5sKGidLy/8JVBJ
	 L+YhVk4Ly3IrIvOaenbnOD+A+050aISSty8gW57/ir0mIU2613IvWacSc+xD5yqhd6
	 /BJDq007YP/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648216435;
	bh=XUFzPRyKCp2j4zYz9JlZuJ5ms63NILvxPLxFOvxogHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CFH3ISdlj6ZRv9d6itg5EQjxqjEs+S2BWl+4e9X7yHtZSh8bDARVeqNwbigsM4h2+
	 BuBUqwelypHVBALpE6e1K7nQcrWjadpLCRvWXlDCPNiK1+Mku1UeSznDJr6wIX8N9p
	 1k+XaSRUapNCR5ydOcaZYWvB5xrlUsbcozpFOBAkuBlHub+se1JrowoTcjMsaD0X3/
	 P/fFmQfvg72BJt/rGbZ+zw0CRDILUsBFvn0v6orbd0btZVRBG3RU5sKGidLy/8JVBJ
	 L+YhVk4Ly3IrIvOaenbnOD+A+050aISSty8gW57/ir0mIU2613IvWacSc+xD5yqhd6
	 /BJDq007YP/dA==
X-Gm-Message-State: AOAM532OD4K6IwQiJ9VT+cXn9djpDVtqeLYoNWu2p3/DgpZURiG8Mtue
	nFRorxGuX3//zfQ3RFPDCACuUemclDNvK2G8vCg=
X-Google-Smtp-Source: ABdhPJzxZc8w687pxH2LmPSV7dYykC6VTh9EkoLI+haqNIlqIR+pDgkNbYIhc7oJs7kjT+Fhxw5YwdO8nfXOfyXO4IQ=
X-Received: by 2002:a05:6870:b250:b0:de:afd3:e1c4 with SMTP id
 b16-20020a056870b25000b000deafd3e1c4mr1194577oam.128.1648216434518; Fri, 25
 Mar 2022 06:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <Yj3Grwx3IZLnfEdt@Air-de-Roger>
In-Reply-To: <Yj3Grwx3IZLnfEdt@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 25 Mar 2022 09:53:18 -0400
X-Gmail-Original-Message-ID: <CABfawhmeUM77DEkpiTUVipqM29SP+WPhNmvVxbGUwrLBOjfkGw@mail.gmail.com>
Message-ID: <CABfawhmeUM77DEkpiTUVipqM29SP+WPhNmvVxbGUwrLBOjfkGw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <JBeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Mar 25, 2022 at 9:42 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index a21c781452..bfa6082f13 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1892,15 +1892,19 @@ static int fork(struct domain *cd, struct domai=
n *d, uint16_t flags)
> >   * footprints the hypercall continuation should be implemented (or if =
this
> >   * feature needs to be become "stable").
> >   */
> > -static int mem_sharing_fork_reset(struct domain *d)
> > +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> > +                           bool reset_memory)
> >  {
> > -    int rc;
> > +    int rc =3D 0;
> >      struct domain *pd =3D d->parent;
> >      struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
> >      struct page_info *page, *tmp;
> >
> >      domain_pause(d);
>
> I would assert that at least one of reset_sate or reset_memory is set
> here, as callers already do the checks.

Sure.

>
> >
> > +    if ( !reset_memory )
> > +        goto state;
>
> I don't like using labels and goto like this as I think it makes the
> code harder to follow, and so more likely to introduce bugs. I would
> rather place the memory reset parts inside of an if ( reset_memory ) {
> ... }, but that's my taste.

I did that first but because it requires shifting everything to the
right it requires odd line breaks.

>
> > +
> >      /* need recursive lock because we will free pages */
> >      spin_lock_recursive(&d->page_alloc_lock);
> >      page_list_for_each_safe(page, tmp, &d->page_list)
> > @@ -1933,7 +1937,9 @@ static int mem_sharing_fork_reset(struct domain *=
d)
> >      }
> >      spin_unlock_recursive(&d->page_alloc_lock);
> >
> > -    rc =3D copy_settings(d, pd, d->arch.hvm.mem_sharing.skip_special_p=
ages);
> > + state:
> > +    if ( reset_state )
> > +        rc =3D copy_settings(d, pd, d->arch.hvm.mem_sharing.skip_speci=
al_pages);
> >
> >      domain_unpause(d);
> >
> > @@ -2239,15 +2245,21 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xe=
n_mem_sharing_op_t) arg)
> >
> >      case XENMEM_sharing_op_fork_reset:
> >      {
> > +        bool reset_state =3D mso.u.fork.flags & XENMEM_FORK_RESET_STAT=
E;
> > +        bool reset_memory =3D mso.u.fork.flags & XENMEM_FORK_RESET_MEM=
ORY;
> > +
> >          rc =3D -EINVAL;
> > -        if ( mso.u.fork.pad || mso.u.fork.flags )
> > +        if ( mso.u.fork.pad || (!reset_state && !reset_memory) )
> > +            goto out;
> > +        if ( mso.u.fork.flags &
> > +             ~(XENMEM_FORK_RESET_STATE | XENMEM_FORK_RESET_MEMORY) )
> >              goto out;
> >
> >          rc =3D -ENOSYS;
> >          if ( !d->parent )
> >              goto out;
> >
> > -        rc =3D mem_sharing_fork_reset(d);
> > +        rc =3D mem_sharing_fork_reset(d, reset_state, reset_memory);
> >          break;
> >      }
> >
> > diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> > index 84cf52636b..a7b192be0d 100644
> > --- a/xen/common/vm_event.c
> > +++ b/xen/common/vm_event.c
> > @@ -28,6 +28,11 @@
> >  #include <asm/p2m.h>
> >  #include <asm/monitor.h>
> >  #include <asm/vm_event.h>
> > +
> > +#ifdef CONFIG_MEM_SHARING
> > +#include <asm/mem_sharing.h>
> > +#endif
> > +
> >  #include <xsm/xsm.h>
> >  #include <public/hvm/params.h>
> >
> > @@ -394,6 +399,15 @@ static int vm_event_resume(struct domain *d, struc=
t vm_event_domain *ved)
> >              if ( rsp.reason =3D=3D VM_EVENT_REASON_MEM_PAGING )
> >                  p2m_mem_paging_resume(d, &rsp);
> >  #endif
> > +#ifdef CONFIG_MEM_SHARING
> > +            do {
> > +                bool reset_state =3D rsp.flags & VM_EVENT_FLAG_RESET_F=
ORK_STATE;
> > +                bool reset_mem =3D rsp.flags & VM_EVENT_FLAG_RESET_FOR=
K_MEMORY;
> > +
> > +                if ( reset_state || reset_mem )
> > +                    mem_sharing_fork_reset(d, reset_state, reset_mem);
>
> You seem to drop the error code returned by mem_sharing_fork_reset.

Yes, there is no response that could be sent to the toolstack from
here. I could add an ASSERT that rc is 0 though. If the fork() op
successfully finished then fork_reset() couldn't reasonably end up in
a path where it fails.

>
> > +            } while(0);
> > +#endif
>
> I think you can avoid the do {} while(0); just using the braces will
> allow you to define local variables in the inner block.

Sure.

>
> >              /*
> >               * Check emulation flags in the arch-specific handler only=
, as it
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index 208d8dcbd9..30ce23c5a7 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
> >                  uint32_t gref;     /* IN: gref to debug         */
> >              } u;
> >          } debug;
> > -        struct mem_sharing_op_fork {      /* OP_FORK */
> > +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
> >              domid_t parent_domain;        /* IN: parent's domain id */
> >  /* These flags only makes sense for short-lived forks */
> >  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> >  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
> >  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> > +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> > +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
>
> For backward compatibility purposes should the flags be added
> backwards, ie:
>
> #define XENMEM_FORK_KEEP_STATE        (1u << 3)
> #define XENMEM_FORK_KEEP_MEMORY       (1u << 4)
>
> So that existing callers of XENMEM_sharing_op_fork_reset will continue
> working as expected?
>
> Or we don't care about that as the interface is protected with
> __XEN_TOOLS__?

I would say don't care, we are updating the only toolstack that uses
this in lock-step with Xen.

Tamas

