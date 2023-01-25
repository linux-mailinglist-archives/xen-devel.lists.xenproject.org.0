Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DC67B60D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484443.751020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhoF-0003b7-V5; Wed, 25 Jan 2023 15:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484443.751020; Wed, 25 Jan 2023 15:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhoF-0003Ym-SC; Wed, 25 Jan 2023 15:35:35 +0000
Received: by outflank-mailman (input) for mailman id 484443;
 Wed, 25 Jan 2023 15:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/5Q=5W=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pKhoE-0003Yg-SB
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:35:35 +0000
Received: from m228-12.mailgun.net (m228-12.mailgun.net [159.135.228.12])
 by se1-gles-flk1.inumbo.com (Halon) with UTF8SMTPS
 id e6a0976b-9cc5-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:35:31 +0100 (CET)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170]) by
 077977e9653f with SMTP id 63d14c4243cbeb0aa6d64684 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 25 Jan 2023 15:35:30 GMT
Received: by mail-yb1-f170.google.com with SMTP id h5so6548002ybj.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 07:35:30 -0800 (PST)
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
X-Inumbo-ID: e6a0976b-9cc5-11ed-b8d1-410ff93cb8f0
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1674660930; x=1674668130; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=X7l6HbJqqvRylbgNUlZYlc0NjtUAG9ARY9qVVyuvW5M=;
 b=KNfpQHR/hEU21mCwxZzyK8dhYyI8pzM4WBmB7OurY0rYKolqpruV0XVaK5+HbKZaoAPQJhmVVTk7DKTYF4Xp8/adxSZ9S6PHLzznUOV+STHWuqhnI3EJqVlwPFLGX4m1SdktOqQQuT+HpVayHVlE8R0aX2re6KT1kHgOBoOCK7tc3YbJyNHc+UqjBqKfDurQgrs2/ZWnF70PN5mWnmRn4sTvh1qPQJ5Qjg4ZricF0ysaIJXx+136RmVUxcLZsjKUUPD64YAp6AE/4cOAMId7+OBuvTn+R0TxIWhasr3J6RNe85PiXATREjhiOHhdeK83+V59xQ6L/9CcIxLU1a73wQ==
X-Mailgun-Sending-Ip: 159.135.228.12
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AFqh2kr2ALba2enni5p0IaG8HYQ1/4GWxyAWMTl7zQPcl4oWm2lr00bZ
	QAsoGuHDbKnI0O5wKg0nyRYWthHN0PrxHkEbtWc=
X-Google-Smtp-Source: AMrXdXs2nqdRH1H5xL60afJ7t5p/goADoygaHGKB46sYpG4tc7yVX9LT2YAOHDUb4cXAu673rjXC5IzmzXwwJ6s8F94=
X-Received: by 2002:a25:4001:0:b0:803:47:aa4 with SMTP id n1-20020a254001000000b0080300470aa4mr2354070yba.183.1674660929558;
 Wed, 25 Jan 2023 07:35:29 -0800 (PST)
MIME-Version: 1.0
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com> <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com> <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
 <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com>
In-Reply-To: <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Jan 2023 10:34:53 -0500
X-Gmail-Original-Message-ID: <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
Message-ID: <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000d3623505f31861c7"

--000000000000d3623505f31861c7
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 19:32, Tamas K Lengyel wrote:
> > On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 23.01.2023 17:09, Tamas K Lengyel wrote:
> >>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
> >>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>>>  }
> >>>>
> >>>> +static int copy_guest_area(struct guest_area *cd_area,
> >>>> +                           const struct guest_area *d_area,
> >>>> +                           struct vcpu *cd_vcpu,
> >>>> +                           const struct domain *d)
> >>>> +{
> >>>> +    mfn_t d_mfn, cd_mfn;
> >>>> +
> >>>> +    if ( !d_area->pg )
> >>>> +        return 0;
> >>>> +
> >>>> +    d_mfn = page_to_mfn(d_area->pg);
> >>>> +
> >>>> +    /* Allocate & map a page for the area if it hasn't been already.
> > */
> >>>> +    if ( !cd_area->pg )
> >>>> +    {
> >>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> >>>> +        p2m_type_t p2mt;
> >>>> +        p2m_access_t p2ma;
> >>>> +        unsigned int offset;
> >>>> +        int ret;
> >>>> +
> >>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
> > NULL);
> >>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >>>> +        {
> >>>> +            struct page_info *pg =
alloc_domheap_page(cd_vcpu->domain,
> >>> 0);
> >>>> +
> >>>> +            if ( !pg )
> >>>> +                return -ENOMEM;
> >>>> +
> >>>> +            cd_mfn = page_to_mfn(pg);
> >>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >>>> +
> >>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
> >>> p2m_ram_rw,
> >>>> +                                 p2m->default_access, -1);
> >>>> +            if ( ret )
> >>>> +                return ret;
> >>>> +        }
> >>>> +        else if ( p2mt != p2m_ram_rw )
> >>>> +            return -EBUSY;
> >>>> +
> >>>> +        /*
> >>>> +         * Simply specify the entire range up to the end of the
page.
> >>> All the
> >>>> +         * function uses it for is a check for not crossing page
> >>> boundaries.
> >>>> +         */
> >>>> +        offset = PAGE_OFFSET(d_area->map);
> >>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> >>>> +                             PAGE_SIZE - offset, cd_area, NULL);
> >>>> +        if ( ret )
> >>>> +            return ret;
> >>>> +    }
> >>>> +    else
> >>>> +        cd_mfn = page_to_mfn(cd_area->pg);
> >>>
> >>> Everything to this point seems to be non mem-sharing/forking related.
> > Could
> >>> these live somewhere else? There must be some other place where
> > allocating
> >>> these areas happens already for non-fork VMs so it would make sense to
> > just
> >>> refactor that code to be callable from here.
> >>
> >> It is the "copy" aspect with makes this mem-sharing (or really fork)
> >> specific. Plus in the end this is no different from what you have
> >> there right now for copying the vCPU info area. In the final patch
> >> that other code gets removed by re-using the code here.
> >
> > Yes, the copy part is fork-specific. Arguably if there was a way to do
the
> > allocation of the page for vcpu_info I would prefer that being
elsewhere,
> > but while the only requirement is allocate-page and copy from parent
I'm OK
> > with that logic being in here because it's really straight forward. But
now
> > you also do extra sanity checks here which are harder to comprehend in
this
> > context alone.
>
> What sanity checks are you talking about (also below, where you claim
> map_guest_area() would be used only to sanity check)?

Did I misread your comment above "All the function uses it for is a check
for not crossing page boundaries"? That sounds to me like a simple sanity
check, unclear why it matters though and why only for forks.

>
> > What if extra sanity checks will be needed in the future? Or
> > the sanity checks in the future diverge from where this happens for
normal
> > VMs because someone overlooks this needing to be synched here too?
> >
> >> I also haven't been able to spot anything that could be factored
> >> out (and one might expect that if there was something, then the vCPU
> >> info area copying should also already have used it). map_guest_area()
> >> is all that is used for other purposes as well.
> >
> > Well, there must be a location where all this happens for normal VMs as
> > well, no?
>
> That's map_guest_area(). What is needed here but not elsewhere is the
> populating of the GFN underlying the to-be-mapped area. That's the code
> being added here, mirroring what you need to do for the vCPU info page.
> Similar code isn't needed elsewhere because the guest invoked operation
> is purely a "map" - the underlying pages are already expected to be
> populated (which of course we check, or else we wouldn't know what page
> to actually map).

Populated by what and when?

>
> > Why not factor that code so that it can be called from here, so
> > that we don't have to track sanity check requirements in two different
> > locations? Or for normal VMs that sanity checking bit isn't required? If
> > so, why?
>
> As per above, I'm afraid that I'm lost with these questions. I simply
> don't know what you're talking about.

You are adding code here that allocates memory and copies the content of
similarly allocated memory from the parent. You perform extra sanity checks
for unknown reasons that seem to be only needed here. It is unclear why you
are doing that and why can't the same code-paths that allocate this memory
for the parent be simply reused so the only thing left to do here would be
to copy the content from the parent?

Tamas

--000000000000d3623505f31861c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 23.01.2023 19:32, Tamas K Lengyel wrote:<br>&gt; &gt; On Mon, J=
an 23, 2023 at 11:24 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt; On 23.01.2023 17:09, Ta=
mas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Mon, Jan 23, 2023 at 9:55 AM J=
an Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&g=
t; wrote:<br>&gt; &gt;&gt;&gt;&gt; --- a/xen/arch/x86/mm/mem_sharing.c<br>&=
gt; &gt;&gt;&gt;&gt; +++ b/xen/arch/x86/mm/mem_sharing.c<br>&gt; &gt;&gt;&g=
t;&gt; @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc<br>&=
gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0hvm_set_nonreg_state(cd_vcpu, &amp=
;nrs);<br>&gt; &gt;&gt;&gt;&gt; =C2=A0}<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &g=
t;&gt;&gt;&gt; +static int copy_guest_area(struct guest_area *cd_area,<br>&=
gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct guest_area *d_area,<br>=
&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vcpu *cd_vcpu,<br>&gt; &gt=
;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct domain *d)<br>&gt; &gt;&gt;&gt=
;&gt; +{<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0mfn_t d_mfn, cd_mfn;<br>&g=
t; &gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0if ( !d_area-=
&gt;pg )<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>&gt; &gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0d_mfn =3D =
page_to_mfn(d_area-&gt;pg);<br>&gt; &gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;=
&gt; + =C2=A0 =C2=A0/* Allocate &amp; map a page for the area if it hasn&#3=
9;t been already.<br>&gt; &gt; */<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0i=
f ( !cd_area-&gt;pg )<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt=
;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_t gfn =3D mfn_to_gfn(d, d_mf=
n);<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0struct p2m_domain=
 *p2m =3D p2m_get_hostp2m(cd_vcpu-&gt;domain);<br>&gt; &gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<br>&gt; &gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0p2m_access_t p2ma;<br>&gt; &gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset;<br>&gt; &gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>&gt; &gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt=
;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D p2m-&gt;get_entry(p2m, gf=
n, &amp;p2mt, &amp;p2ma, 0, NULL,<br>&gt; &gt; NULL);<br>&gt; &gt;&gt;&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( mfn_eq(cd_mfn, INVALID_MFN) )<br>&gt;=
 &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt;&gt;&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *pg =3D alloc_do=
mheap_page(cd_vcpu-&gt;domain,<br>&gt; &gt;&gt;&gt; 0);<br>&gt; &gt;&gt;&gt=
;&gt; +<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ( !pg )<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>&gt; &gt;&gt;&gt;&gt; +<br>&gt; &gt=
;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to=
_mfn(pg);<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));<br>&gt; &gt;&gt;&gt;&gt; +=
<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D p2m-&gt;set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,<br>&gt; &gt;&gt;&gt;=
 p2m_ram_rw,<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 p2m-&gt;default_access, -1);<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt;&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0else if ( p2mt !=3D p2m_ram_rw )<br>&gt; &gt;&gt;&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>&gt; &gt;&gt;&=
gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>&gt; =
&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Simply specify the entire =
range up to the end of the page.<br>&gt; &gt;&gt;&gt; All the<br>&gt; &gt;&=
gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * function uses it for is a check=
 for not crossing page<br>&gt; &gt;&gt;&gt; boundaries.<br><div>&gt; &gt;&g=
t;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 */</div>&gt; &gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D PAGE_OFFSET(d_area-&gt;map);<br>&gt; =
&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D map_guest_area(cd_vcp=
u, gfn_to_gaddr(gfn) + offset,<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PAGE_SIZE - offset, cd_area, NULL);<br>&gt; &gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0}<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0else<br>&gt; &gt;&gt;&gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mfn(cd_area-&gt;pg);<br>=
&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Everything to this point seems to be=
 non mem-sharing/forking related.<br>&gt; &gt; Could<br>&gt; &gt;&gt;&gt; t=
hese live somewhere else? There must be some other place where<br>&gt; &gt;=
 allocating<br>&gt; &gt;&gt;&gt; these areas happens already for non-fork V=
Ms so it would make sense to<br>&gt; &gt; just<br>&gt; &gt;&gt;&gt; refacto=
r that code to be callable from here.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; It =
is the &quot;copy&quot; aspect with makes this mem-sharing (or really fork)=
<br>&gt; &gt;&gt; specific. Plus in the end this is no different from what =
you have<br>&gt; &gt;&gt; there right now for copying the vCPU info area. I=
n the final patch<br>&gt; &gt;&gt; that other code gets removed by re-using=
 the code here.<br>&gt; &gt;<br>&gt; &gt; Yes, the copy part is fork-specif=
ic. Arguably if there was a way to do the<br>&gt; &gt; allocation of the pa=
ge for vcpu_info I would prefer that being elsewhere,<br>&gt; &gt; but whil=
e the only requirement is allocate-page and copy from parent I&#39;m OK<br>=
&gt; &gt; with that logic being in here because it&#39;s really straight fo=
rward. But now<br>&gt; &gt; you also do extra sanity checks here which are =
harder to comprehend in this<br>&gt; &gt; context alone.<br>&gt;<br>&gt; Wh=
at sanity checks are you talking about (also below, where you claim<br><div=
>&gt; map_guest_area() would be used only to sanity check)?</div><div><br><=
/div><div>Did I misread your comment above &quot;All the function uses it f=
or is a check for not crossing page boundaries&quot;? That sounds to me lik=
e a simple sanity check, unclear why it matters though and why only for for=
ks.

</div><div><br></div><div>&gt;</div>&gt; &gt; What if extra sanity checks w=
ill be needed in the future? Or<br>&gt; &gt; the sanity checks in the futur=
e diverge from where this happens for normal<br>&gt; &gt; VMs because someo=
ne overlooks this needing to be synched here too?<br>&gt; &gt;<br>&gt; &gt;=
&gt; I also haven&#39;t been able to spot anything that could be factored<b=
r>&gt; &gt;&gt; out (and one might expect that if there was something, then=
 the vCPU<br>&gt; &gt;&gt; info area copying should also already have used =
it). map_guest_area()<br>&gt; &gt;&gt; is all that is used for other purpos=
es as well.<br>&gt; &gt;<br>&gt; &gt; Well, there must be a location where =
all this happens for normal VMs as<br>&gt; &gt; well, no?<br>&gt;<br>&gt; T=
hat&#39;s map_guest_area(). What is needed here but not elsewhere is the<br=
>&gt; populating of the GFN underlying the to-be-mapped area. That&#39;s th=
e code<br>&gt; being added here, mirroring what you need to do for the vCPU=
 info page.<br>&gt; Similar code isn&#39;t needed elsewhere because the gue=
st invoked operation<br>&gt; is purely a &quot;map&quot; - the underlying p=
ages are already expected to be<br>&gt; populated (which of course we check=
, or else we wouldn&#39;t know what page<br><div>&gt; to actually map).</di=
v><div><br></div><div>Populated by what and when? <br></div><div><br></div>=
&gt;<br>&gt; &gt; Why not factor that code so that it can be called from he=
re, so<br>&gt; &gt; that we don&#39;t have to track sanity check requiremen=
ts in two different<br>&gt; &gt; locations? Or for normal VMs that sanity c=
hecking bit isn&#39;t required? If<br>&gt; &gt; so, why?<br>&gt;<br>&gt; As=
 per above, I&#39;m afraid that I&#39;m lost with these questions. I simply=
<br><div>&gt; don&#39;t know what you&#39;re talking about.</div><div><br><=
/div><div>You are adding code here that allocates memory and copies the con=
tent of similarly allocated memory from the parent. You perform extra sanit=
y checks for unknown reasons that seem to be only needed here. It is unclea=
r why you are doing that and why can&#39;t the same code-paths that allocat=
e this memory for the parent be simply reused so the only thing left to do =
here would be to copy the content from the parent?<br></div><div><br></div>=
Tamas<br></div>

--000000000000d3623505f31861c7--

