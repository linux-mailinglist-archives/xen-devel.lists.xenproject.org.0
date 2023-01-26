Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA667D07C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 16:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485094.752062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL4OV-0007E6-SG; Thu, 26 Jan 2023 15:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485094.752062; Thu, 26 Jan 2023 15:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL4OV-0007Bm-Ob; Thu, 26 Jan 2023 15:42:31 +0000
Received: by outflank-mailman (input) for mailman id 485094;
 Thu, 26 Jan 2023 15:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5Fb=5X=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pL4OU-0007Bg-C6
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 15:42:30 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 0957f3d6-9d90-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 16:42:28 +0100 (CET)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179]) by
 c0240418b22b with SMTP id 63d29f6241f80c63a459d68c (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 26 Jan 2023 15:42:26 GMT
Received: by mail-yb1-f179.google.com with SMTP id 123so2438690ybv.6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 07:42:26 -0800 (PST)
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
X-Inumbo-ID: 0957f3d6-9d90-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1674747746; x=1674754946; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=o5LlAxm5OT7NlU/UHCsH/EC8XsY/l2h67gaOon1D984=;
 b=jwoREEcpVTayJiH2Ikc8XGnjKB5tND7Gx/Xn1KqRVhbchl7sKxy086nKH+SsZVSHC1k9il+9OY6YrJgKxHBTVlZyfruIjkMGVpId+AXcvPAsTncsvIPWVM/3jOIkvAsHEU/dzey3TguglWDnMmHb+OQLEtXN3hJreYBn9SH4VjDwD4g0BydKP+dLipemyIsItDyQWzPik9P/LZaTFmx3p2/4+uF5DytNjVBZhJC+n6omyLOS97Gm/m2FQXCxY+IEVmCVURpg5ARLiL+XOZbNvHVEEV6EU3TW1dwr45QeefodeVbF5ilXtHerQLII8Bhl+BXw17qvr01OKTdJsWnvMA==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AFqh2koUvt9zWZqzKn524aIOqcxJ5rett87VxsY/hB1veMY85Gz8oA4I
	EagYQa5u9hxPO0HdYYnB3qBAmXC0btsvJh8vyBU=
X-Google-Smtp-Source: AMrXdXuSqMC+T7CjEFrOtcBhFSv0+T0wPEDQwTvKipL7Qg0sdKhNTE0df15tTgfdfOTc4kxVG29IOrmOCOrpFxYoteo=
X-Received: by 2002:a25:af8a:0:b0:7fc:a696:981c with SMTP id
 g10-20020a25af8a000000b007fca696981cmr2981028ybh.165.1674747746093; Thu, 26
 Jan 2023 07:42:26 -0800 (PST)
MIME-Version: 1.0
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com> <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com> <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
 <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com> <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
 <cfffcf15-c2fa-6529-d1ff-a71a7571bfe2@suse.com>
In-Reply-To: <cfffcf15-c2fa-6529-d1ff-a71a7571bfe2@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Jan 2023 10:41:49 -0500
X-Gmail-Original-Message-ID: <CABfawhm_b=MskQN_zZsuKz0FDtZzZNvBMa8bXtxxUZU9rXbUCA@mail.gmail.com>
Message-ID: <CABfawhm_b=MskQN_zZsuKz0FDtZzZNvBMa8bXtxxUZU9rXbUCA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000007e917105f32c98ab"

--0000000000007e917105f32c98ab
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 3:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.01.2023 16:34, Tamas K Lengyel wrote:
> > On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 23.01.2023 19:32, Tamas K Lengyel wrote:
> >>> On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com>
wrote:
> >>>> On 23.01.2023 17:09, Tamas K Lengyel wrote:
> >>>>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com>
wrote:
> >>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>>>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
> >>>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>>>>>  }
> >>>>>>
> >>>>>> +static int copy_guest_area(struct guest_area *cd_area,
> >>>>>> +                           const struct guest_area *d_area,
> >>>>>> +                           struct vcpu *cd_vcpu,
> >>>>>> +                           const struct domain *d)
> >>>>>> +{
> >>>>>> +    mfn_t d_mfn, cd_mfn;
> >>>>>> +
> >>>>>> +    if ( !d_area->pg )
> >>>>>> +        return 0;
> >>>>>> +
> >>>>>> +    d_mfn = page_to_mfn(d_area->pg);
> >>>>>> +
> >>>>>> +    /* Allocate & map a page for the area if it hasn't been
already.
> >>> */
> >>>>>> +    if ( !cd_area->pg )
> >>>>>> +    {
> >>>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >>>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> >>>>>> +        p2m_type_t p2mt;
> >>>>>> +        p2m_access_t p2ma;
> >>>>>> +        unsigned int offset;
> >>>>>> +        int ret;
> >>>>>> +
> >>>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
> >>> NULL);
> >>>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >>>>>> +        {
> >>>>>> +            struct page_info *pg =
> > alloc_domheap_page(cd_vcpu->domain,
> >>>>> 0);
> >>>>>> +
> >>>>>> +            if ( !pg )
> >>>>>> +                return -ENOMEM;
> >>>>>> +
> >>>>>> +            cd_mfn = page_to_mfn(pg);
> >>>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >>>>>> +
> >>>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
> >>>>> p2m_ram_rw,
> >>>>>> +                                 p2m->default_access, -1);
> >>>>>> +            if ( ret )
> >>>>>> +                return ret;
> >>>>>> +        }
> >>>>>> +        else if ( p2mt != p2m_ram_rw )
> >>>>>> +            return -EBUSY;
> >>>>>> +
> >>>>>> +        /*
> >>>>>> +         * Simply specify the entire range up to the end of the
> > page.
> >>>>> All the
> >>>>>> +         * function uses it for is a check for not crossing page
> >>>>> boundaries.
> >>>>>> +         */
> >>>>>> +        offset = PAGE_OFFSET(d_area->map);
> >>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
> >>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
> >>>>>> +        if ( ret )
> >>>>>> +            return ret;
> >>>>>> +    }
> >>>>>> +    else
> >>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
> >>>>>
> >>>>> Everything to this point seems to be non mem-sharing/forking
related.
> >>> Could
> >>>>> these live somewhere else? There must be some other place where
> >>> allocating
> >>>>> these areas happens already for non-fork VMs so it would make sense
to
> >>> just
> >>>>> refactor that code to be callable from here.
> >>>>
> >>>> It is the "copy" aspect with makes this mem-sharing (or really fork)
> >>>> specific. Plus in the end this is no different from what you have
> >>>> there right now for copying the vCPU info area. In the final patch
> >>>> that other code gets removed by re-using the code here.
> >>>
> >>> Yes, the copy part is fork-specific. Arguably if there was a way to do
> > the
> >>> allocation of the page for vcpu_info I would prefer that being
> > elsewhere,
> >>> but while the only requirement is allocate-page and copy from parent
> > I'm OK
> >>> with that logic being in here because it's really straight forward.
But
> > now
> >>> you also do extra sanity checks here which are harder to comprehend in
> > this
> >>> context alone.
> >>
> >> What sanity checks are you talking about (also below, where you claim
> >> map_guest_area() would be used only to sanity check)?
> >
> > Did I misread your comment above "All the function uses it for is a
check
> > for not crossing page boundaries"? That sounds to me like a simple
sanity
> > check, unclear why it matters though and why only for forks.
>
> The comment is about the function's use of the range it is being passed.
> It doesn't say in any way that the function is doing only sanity checking.
> If the comment wording is ambiguous or unclear, I'm happy to take
> improvement suggestions.

Yes, please do, it definitely was confusing while reviewing the patch.

Thanks,
Tamas

--0000000000007e917105f32c98ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Jan 26, 2023 at 3:14 AM Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt;=
<br>&gt; On 25.01.2023 16:34, Tamas K Lengyel wrote:<br>&gt; &gt; On Tue, J=
an 24, 2023 at 6:19 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com"=
>jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On 23.0=
1.2023 19:32, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Mon, Jan 23, 2=
023 at 11:24 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeuli=
ch@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt; On 23.01.2023 17:09, Ta=
mas K Lengyel wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt; On Mon, Jan 23, 2023 at 9=
:55 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.c=
om</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/arch/x86/mm/me=
m_sharing.c<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/x86/mm/mem_shar=
ing.c<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; @@ -1653,6 +1653,65 @@ static void c=
opy_vcpu_nonreg_state(struc<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =
=C2=A0hvm_set_nonreg_state(cd_vcpu, &amp;nrs);<br>&gt; &gt;&gt;&gt;&gt;&gt;=
&gt; =C2=A0}<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&=
gt; +static int copy_guest_area(struct guest_area *cd_area,<br>&gt; &gt;&gt=
;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct guest_area *d_area,<br>&gt=
; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vcpu *cd_vcpu,<br>&gt;=
 &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct domain *d)<br>&g=
t; &gt;&gt;&gt;&gt;&gt;&gt; +{<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0mfn_t d_mfn, cd_mfn;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&=
gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0if ( !d_area-&gt;pg )<br>&gt; &gt;&gt;&g=
t;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>&gt; &gt;&gt;&gt;&=
gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0d_mfn =3D pag=
e_to_mfn(d_area-&gt;pg);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt=
;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0/* Allocate &amp; map a page for the area =
if it hasn&#39;t been already.<br>&gt; &gt;&gt;&gt; */<br>&gt; &gt;&gt;&gt;=
&gt;&gt;&gt; + =C2=A0 =C2=A0if ( !cd_area-&gt;pg )<br>&gt; &gt;&gt;&gt;&gt;=
&gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gfn_t gfn =3D mfn_to_gfn(d, d_mfn);<br>&gt; &gt;&gt;&gt;&gt;&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0struct p2m_domain *p2m =3D p2m_get_host=
p2m(cd_vcpu-&gt;domain);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0p2m_type_t p2mt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0p2m_access_t p2ma;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned int offset;<br>&gt; &gt;&gt;&gt;&gt;&gt;&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +=
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D p=
2m-&gt;get_entry(p2m, gfn, &amp;p2mt, &amp;p2ma, 0, NULL,<br>&gt; &gt;&gt;&=
gt; NULL);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 ( mfn_eq(cd_mfn, INVALID_MFN) )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *pg =3D<br>&gt; &gt; alloc_domheap=
_page(cd_vcpu-&gt;domain,<br>&gt; &gt;&gt;&gt;&gt;&gt; 0);<br>&gt; &gt;&gt;=
&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ( !pg )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>&gt; &gt=
;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mfn(pg);<br>&gt; &gt;&gt;&gt;=
&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_gpfn_from_mfn(m=
fn_x(cd_mfn), gfn_x(gfn));<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&=
gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D p2m-=
&gt;set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,<br>&gt; &gt;&gt;&gt;&gt;&gt;=
 p2m_ram_rw,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 p2m-&gt;default_access, -1);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;&gt;&gt=
;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r=
et;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;=
 &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0else if ( p2mt !=3D =
p2m_ram_rw )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EBUSY;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt=
;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>&gt; &gt;&gt;&gt;&=
gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Simply specify the entire range=
 up to the end of the<br>&gt; &gt; page.<br>&gt; &gt;&gt;&gt;&gt;&gt; All t=
he<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * functio=
n uses it for is a check for not crossing page<br>&gt; &gt;&gt;&gt;&gt;&gt;=
 boundaries.<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 */<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =
=3D PAGE_OFFSET(d_area-&gt;map);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + off=
set,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE - =
offset, cd_area, NULL);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0}<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0else<br>&gt;=
 &gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_m=
fn(cd_area-&gt;pg);<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&g=
t; Everything to this point seems to be non mem-sharing/forking related.<br=
>&gt; &gt;&gt;&gt; Could<br>&gt; &gt;&gt;&gt;&gt;&gt; these live somewhere =
else? There must be some other place where<br>&gt; &gt;&gt;&gt; allocating<=
br>&gt; &gt;&gt;&gt;&gt;&gt; these areas happens already for non-fork VMs s=
o it would make sense to<br>&gt; &gt;&gt;&gt; just<br>&gt; &gt;&gt;&gt;&gt;=
&gt; refactor that code to be callable from here.<br>&gt; &gt;&gt;&gt;&gt;<=
br>&gt; &gt;&gt;&gt;&gt; It is the &quot;copy&quot; aspect with makes this =
mem-sharing (or really fork)<br>&gt; &gt;&gt;&gt;&gt; specific. Plus in the=
 end this is no different from what you have<br>&gt; &gt;&gt;&gt;&gt; there=
 right now for copying the vCPU info area. In the final patch<br>&gt; &gt;&=
gt;&gt;&gt; that other code gets removed by re-using the code here.<br>&gt;=
 &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Yes, the copy part is fork-specific. Arg=
uably if there was a way to do<br>&gt; &gt; the<br>&gt; &gt;&gt;&gt; alloca=
tion of the page for vcpu_info I would prefer that being<br>&gt; &gt; elsew=
here,<br>&gt; &gt;&gt;&gt; but while the only requirement is allocate-page =
and copy from parent<br>&gt; &gt; I&#39;m OK<br>&gt; &gt;&gt;&gt; with that=
 logic being in here because it&#39;s really straight forward. But<br>&gt; =
&gt; now<br>&gt; &gt;&gt;&gt; you also do extra sanity checks here which ar=
e harder to comprehend in<br>&gt; &gt; this<br>&gt; &gt;&gt;&gt; context al=
one.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; What sanity checks are you talking a=
bout (also below, where you claim<br>&gt; &gt;&gt; map_guest_area() would b=
e used only to sanity check)?<br>&gt; &gt;<br>&gt; &gt; Did I misread your =
comment above &quot;All the function uses it for is a check<br>&gt; &gt; fo=
r not crossing page boundaries&quot;? That sounds to me like a simple sanit=
y<br>&gt; &gt; check, unclear why it matters though and why only for forks.=
<br>&gt;<br>&gt; The comment is about the function&#39;s use of the range i=
t is being passed.<br>&gt; It doesn&#39;t say in any way that the function =
is doing only sanity checking.<br>&gt; If the comment wording is ambiguous =
or unclear, I&#39;m happy to take<br>&gt; improvement suggestions.<br><div>=
<br></div><div>Yes, please do, it definitely was confusing while reviewing =
the patch.<br></div><div><br></div><div>Thanks,<br></div><div>Tamas<br></di=
v></div>

--0000000000007e917105f32c98ab--

