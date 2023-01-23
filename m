Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43B6784F8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 19:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483176.749166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK1cs-00065D-Vk; Mon, 23 Jan 2023 18:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483176.749166; Mon, 23 Jan 2023 18:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK1cs-00062n-Se; Mon, 23 Jan 2023 18:33:02 +0000
Received: by outflank-mailman (input) for mailman id 483176;
 Mon, 23 Jan 2023 18:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FuoH=5U=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pK1cr-00062h-Ci
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 18:33:01 +0000
Received: from m228-12.mailgun.net (m228-12.mailgun.net [159.135.228.12])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id 5baaebac-9b4c-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 19:32:58 +0100 (CET)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177]) by
 0ee4fa7eb591 with SMTP id 63ced2d85a6accb7bc5d1e89 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 23 Jan 2023 18:32:56 GMT
Received: by mail-yb1-f177.google.com with SMTP id d62so15986650ybh.8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 10:32:56 -0800 (PST)
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
X-Inumbo-ID: 5baaebac-9b4c-11ed-b8d1-410ff93cb8f0
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1674498776; x=1674505976; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=LGB29pxzb5btJ5hSYYdA6mTpc+hdzrCf1QUGnXiIyXM=;
 b=rfS2ayXlwQ8NByY6xycf69JhX0jWSGaR07w5Hll0p5+OIzIi2tN3Yrl2nHhhIj54w3HtKtrNgw1iHt1ZAjoEVqgCncMEpT+IN6F+EZEv3S2c8fB0dpf1g4PDPmbaEmTJYLjWTZr0C6kAnDcurR2OkbKyqK1+RDDmVO/j2WUVtNXphA5r+TQEtMU8UXwjTO4kR6d45Zccn4wBSM7lhZNDh19UoC2DysO+7Vm7YKcrI0qN5ZwPmsuSSf6z4vuYaKUKI+U2pfh81927GyKwiliUnunGl3cbaC99CczPzqcqDp2R3+HeHKlzAgmfvadKssF01aHBnHFvcuqQnxZIRM89gg==
X-Mailgun-Sending-Ip: 159.135.228.12
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AFqh2kqZI9oiGznABPcj4cNYTYyOtSykEfLDN4Q+E5Wq6Y65es20gbVs
	noJQKweqyf9/LbvmS+bN1ljGSq995nmMnPYUEk4=
X-Google-Smtp-Source: AMrXdXuJpvEMmnpUcv0t7QXW4xRwP38dTmWln4+johZCwx4GhzwMNXO+zsv8V4vxIdF97mtwW2sWYYzB1sGbEGjUpHM=
X-Received: by 2002:a25:ae8d:0:b0:7fb:dcd4:475 with SMTP id
 b13-20020a25ae8d000000b007fbdcd40475mr2069340ybj.31.1674498776399; Mon, 23
 Jan 2023 10:32:56 -0800 (PST)
MIME-Version: 1.0
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com> <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
In-Reply-To: <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 23 Jan 2023 13:32:20 -0500
X-Gmail-Original-Message-ID: <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
Message-ID: <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000be97bf05f2f2a008"

--000000000000be97bf05f2f2a008
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 17:09, Tamas K Lengyel wrote:
> > On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> --- a/xen/arch/x86/mm/mem_sharing.c
> >> +++ b/xen/arch/x86/mm/mem_sharing.c
> >> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
> >>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>  }
> >>
> >> +static int copy_guest_area(struct guest_area *cd_area,
> >> +                           const struct guest_area *d_area,
> >> +                           struct vcpu *cd_vcpu,
> >> +                           const struct domain *d)
> >> +{
> >> +    mfn_t d_mfn, cd_mfn;
> >> +
> >> +    if ( !d_area->pg )
> >> +        return 0;
> >> +
> >> +    d_mfn = page_to_mfn(d_area->pg);
> >> +
> >> +    /* Allocate & map a page for the area if it hasn't been already.
*/
> >> +    if ( !cd_area->pg )
> >> +    {
> >> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> >> +        p2m_type_t p2mt;
> >> +        p2m_access_t p2ma;
> >> +        unsigned int offset;
> >> +        int ret;
> >> +
> >> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
NULL);
> >> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >> +        {
> >> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain,
> > 0);
> >> +
> >> +            if ( !pg )
> >> +                return -ENOMEM;
> >> +
> >> +            cd_mfn = page_to_mfn(pg);
> >> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >> +
> >> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
> > p2m_ram_rw,
> >> +                                 p2m->default_access, -1);
> >> +            if ( ret )
> >> +                return ret;
> >> +        }
> >> +        else if ( p2mt != p2m_ram_rw )
> >> +            return -EBUSY;
> >> +
> >> +        /*
> >> +         * Simply specify the entire range up to the end of the page.
> > All the
> >> +         * function uses it for is a check for not crossing page
> > boundaries.
> >> +         */
> >> +        offset = PAGE_OFFSET(d_area->map);
> >> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> >> +                             PAGE_SIZE - offset, cd_area, NULL);
> >> +        if ( ret )
> >> +            return ret;
> >> +    }
> >> +    else
> >> +        cd_mfn = page_to_mfn(cd_area->pg);
> >
> > Everything to this point seems to be non mem-sharing/forking related.
Could
> > these live somewhere else? There must be some other place where
allocating
> > these areas happens already for non-fork VMs so it would make sense to
just
> > refactor that code to be callable from here.
>
> It is the "copy" aspect with makes this mem-sharing (or really fork)
> specific. Plus in the end this is no different from what you have
> there right now for copying the vCPU info area. In the final patch
> that other code gets removed by re-using the code here.

Yes, the copy part is fork-specific. Arguably if there was a way to do the
allocation of the page for vcpu_info I would prefer that being elsewhere,
but while the only requirement is allocate-page and copy from parent I'm OK
with that logic being in here because it's really straight forward. But now
you also do extra sanity checks here which are harder to comprehend in this
context alone. What if extra sanity checks will be needed in the future? Or
the sanity checks in the future diverge from where this happens for normal
VMs because someone overlooks this needing to be synched here too?

> I also haven't been able to spot anything that could be factored
> out (and one might expect that if there was something, then the vCPU
> info area copying should also already have used it). map_guest_area()
> is all that is used for other purposes as well.

Well, there must be a location where all this happens for normal VMs as
well, no? Why not factor that code so that it can be called from here, so
that we don't have to track sanity check requirements in two different
locations? Or for normal VMs that sanity checking bit isn't required? If
so, why?

> >> +
> >> +    copy_domain_page(cd_mfn, d_mfn);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>  static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >>  {
> >>      struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> >> @@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom
> >>              copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
> >>          }
> >>
> >> +        /* Same for the (physically registered) runstate and time info
> > areas. */
> >> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> >> +                              &d_vcpu->runstate_guest_area, cd_vcpu,
d);
> >> +        if ( ret )
> >> +            return ret;
> >> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> >> +                              &d_vcpu->arch.time_guest_area, cd_vcpu,
d);
> >> +        if ( ret )
> >> +            return ret;
> >> +
> >>          ret = copy_vpmu(d_vcpu, cd_vcpu);
> >>          if ( ret )
> >>              return ret;
> >> @@ -1987,7 +2056,10 @@ int mem_sharing_fork_reset(struct domain
> >>
> >>   state:
> >>      if ( reset_state )
> >> +    {
> >>          rc = copy_settings(d, pd);
> >> +        /* TBD: What to do here with -ERESTART? */
> >
> > Where does ERESTART coming from?
>
> From map_guest_area()'s attempt to acquire the hypercall deadlock mutex,
> in order to then pause the subject vCPU. I suppose that in the forking
> case it may already be paused, but then there's no way map_guest_area()
> could know. Looking at the pause count is fragile, as there's no
> guarantee that the vCPU may be unpaused while we're still doing work on
> it. Hence I view such checks as only suitable for assertions.

Since map_guest_area is only used to sanity check, and it only happens when
the page is being setup for the fork, why can't the sanity check be done on
the parent? The parent is guaranteed to be paused when forks are active so
there is no ERESTART concern and from the looks of it if there is a concern
the sanity check is looking for it would be visible on the parent just as
well as the fork. But I would like to understand why that sanity checking
is required in the first place.

Thanks,
Tamas

--000000000000be97bf05f2f2a008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich &lt;<=
a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt=
;<br>&gt; On 23.01.2023 17:09, Tamas K Lengyel wrote:<br>&gt; &gt; On Mon, =
Jan 23, 2023 at 9:55 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt; --- a/xen/arch/x86/mm/m=
em_sharing.c<br>&gt; &gt;&gt; +++ b/xen/arch/x86/mm/mem_sharing.c<br>&gt; &=
gt;&gt; @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc<br>=
&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0hvm_set_nonreg_state(cd_vcpu, &amp;nrs);<=
br>&gt; &gt;&gt; =C2=A0}<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; +static int copy=
_guest_area(struct guest_area *cd_area,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const struct guest_area *d_area,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct vcpu *cd_vcpu,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct domain=
 *d)<br>&gt; &gt;&gt; +{<br>&gt; &gt;&gt; + =C2=A0 =C2=A0mfn_t d_mfn, cd_mf=
n;<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; + =C2=A0 =C2=A0if ( !d_area-&gt;pg )=
<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>&gt; &gt;&gt; +=
<br>&gt; &gt;&gt; + =C2=A0 =C2=A0d_mfn =3D page_to_mfn(d_area-&gt;pg);<br>&=
gt; &gt;&gt; +<br>&gt; &gt;&gt; + =C2=A0 =C2=A0/* Allocate &amp; map a page=
 for the area if it hasn&#39;t been already. */<br>&gt; &gt;&gt; + =C2=A0 =
=C2=A0if ( !cd_area-&gt;pg )<br>&gt; &gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_t gfn =3D mfn_to_gfn(d, d_mfn);<br>&g=
t; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0struct p2m_domain *p2m =3D p2m_get=
_hostp2m(cd_vcpu-&gt;domain);<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0p2m_type_t p2mt;<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_acces=
s_t p2ma;<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset=
;<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>&gt; &gt;&gt; +=
<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D p2m-&gt;get_entry=
(p2m, gfn, &amp;p2mt, &amp;p2ma, 0, NULL, NULL);<br>&gt; &gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ( mfn_eq(cd_mfn, INVALID_MFN) )<br>&gt; &gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct page_info *pg =3D alloc_domheap_page(cd_vcpu-&gt;domai=
n,<br>&gt; &gt; 0);<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if ( !pg )<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>&gt; &gt;&gt; +<br>&gt=
; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mf=
n(pg);<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_gpfn=
_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D p2m-&gt;set_entry(p2m, gf=
n, cd_mfn, PAGE_ORDER_4K,<br>&gt; &gt; p2m_ram_rw,<br>&gt; &gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m-&gt;default_access, -1);<br>&gt; &gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&=
gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0else if ( p2mt !=3D p2m_ram_rw )<br>&gt; &gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>&gt; &gt;&gt; +<br>&gt=
; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>&gt; &gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 * Simply specify the entire range up to the end of the page.=
<br>&gt; &gt; All the<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * func=
tion uses it for is a check for not crossing page<br>&gt; &gt; boundaries.<=
br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>&gt; &gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0offset =3D PAGE_OFFSET(d_area-&gt;map);<br>&gt; &gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D map_guest_area(cd_vcpu, gfn_to_gadd=
r(gfn) + offset,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE - off=
set, cd_area, NULL);<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret=
 )<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<=
br>&gt; &gt;&gt; + =C2=A0 =C2=A0}<br>&gt; &gt;&gt; + =C2=A0 =C2=A0else<br>&=
gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mfn(cd_area-&g=
t;pg);<br>&gt; &gt;<br>&gt; &gt; Everything to this point seems to be non m=
em-sharing/forking related. Could<br>&gt; &gt; these live somewhere else? T=
here must be some other place where allocating<br>&gt; &gt; these areas hap=
pens already for non-fork VMs so it would make sense to just<br>&gt; &gt; r=
efactor that code to be callable from here.<br>&gt;<br>&gt; It is the &quot=
;copy&quot; aspect with makes this mem-sharing (or really fork)<br>&gt; spe=
cific. Plus in the end this is no different from what you have<br>&gt; ther=
e right now for copying the vCPU info area. In the final patch<br>&gt; that=
 other code gets removed by re-using the code here.<br><div><br></div><div>
Yes, the copy part is fork-specific. Arguably if there was a way to do=20
the allocation of the page for vcpu_info I would prefer that being=20
elsewhere, but while the only requirement is allocate-page and copy from
 parent I&#39;m OK with that logic being in here because it&#39;s really=20
straight forward. But now you also do extra sanity checks here which are
 harder to comprehend in this context alone. What if extra sanity checks
 will be needed in the future? Or the sanity checks in the future=20
diverge from where this happens for normal VMs because someone overlooks
 this needing to be synched here too?

</div><div><br></div>&gt; I also haven&#39;t been able to spot anything tha=
t could be factored<br>&gt; out (and one might expect that if there was som=
ething, then the vCPU<br>&gt; info area copying should also already have us=
ed it). map_guest_area()<br>&gt; is all that is used for other purposes as =
well.<br><div><br></div><div>Well, there must be a location where all this =
happens for normal VMs as well, no? Why not factor that code so that it can=
 be called from here, so that we don&#39;t have to track sanity check requi=
rements in two different locations? Or for normal VMs that sanity checking =
bit isn&#39;t required? If so, why?<br></div><div><br></div>&gt; &gt;&gt; +=
<br>&gt; &gt;&gt; + =C2=A0 =C2=A0copy_domain_page(cd_mfn, d_mfn);<br>&gt; &=
gt;&gt; +<br>&gt; &gt;&gt; + =C2=A0 =C2=A0return 0;<br>&gt; &gt;&gt; +}<br>=
&gt; &gt;&gt; +<br>&gt; &gt;&gt; =C2=A0static int copy_vpmu(struct vcpu *d_=
vcpu, struct vcpu *cd_vcpu)<br>&gt; &gt;&gt; =C2=A0{<br>&gt; &gt;&gt; =C2=
=A0 =C2=A0 =C2=A0struct vpmu_struct *d_vpmu =3D vcpu_vpmu(d_vcpu);<br>&gt; =
&gt;&gt; @@ -1745,6 +1804,16 @@ static int copy_vcpu_settings(struct dom<br=
>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copy_domain_=
page(new_vcpu_info_mfn, vcpu_info_mfn);<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Same for the (physically registered) runstate and time info<br>&g=
t; &gt; areas. */<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D cop=
y_guest_area(&amp;cd_vcpu-&gt;runstate_guest_area,<br>&gt; &gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;d_vcpu-&gt;runstate_guest_area, cd_vcpu, d)=
;<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D copy_guest_area(&amp;cd_vcpu-&gt;arch.ti=
me_guest_area,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;d_vcpu-=
&gt;arch.time_guest_area, cd_vcpu, d);<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return ret;<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D copy_vpmu(d_vcpu, cd_vcpu);<br>&gt; &gt;&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt; @@ -1987,7 +2056,1=
0 @@ int mem_sharing_fork_reset(struct domain<br>&gt; &gt;&gt;<br>&gt; &gt;=
&gt; =C2=A0 state:<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0if ( reset_state )<=
br>&gt; &gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rc =3D copy_settings(d, pd);<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* TBD: What to do here with -ERESTART? */<br>&gt; &gt;<br>&gt; &=
gt; Where does ERESTART coming from?<br>&gt;<br>&gt; From map_guest_area()&=
#39;s attempt to acquire the hypercall deadlock mutex,<br>&gt; in order to =
then pause the subject vCPU. I suppose that in the forking<br>&gt; case it =
may already be paused, but then there&#39;s no way map_guest_area()<br>&gt;=
 could know. Looking at the pause count is fragile, as there&#39;s no<br>&g=
t; guarantee that the vCPU may be unpaused while we&#39;re still doing work=
 on<br>&gt; it. Hence I view such checks as only suitable for assertions.<b=
r><div><br></div><div>Since map_guest_area is only used to sanity check, an=
d it only happens when the page is being setup for the fork, why can&#39;t =
the sanity check be done on the parent? The parent is guaranteed to be paus=
ed when forks are active so there is no ERESTART concern and from the looks=
 of it if there is a concern the sanity check is looking for it would be vi=
sible on the parent just as well as the fork. But I would like to understan=
d why that sanity checking is required in the first place.<br></div><div><b=
r></div><div>Thanks,<br></div><div>Tamas<br></div></div>

--000000000000be97bf05f2f2a008--

