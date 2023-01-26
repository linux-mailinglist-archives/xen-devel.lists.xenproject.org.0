Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A667D301
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 18:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485159.752168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5zi-0007gR-1Q; Thu, 26 Jan 2023 17:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485159.752168; Thu, 26 Jan 2023 17:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5zh-0007dw-Sr; Thu, 26 Jan 2023 17:25:01 +0000
Received: by outflank-mailman (input) for mailman id 485159;
 Thu, 26 Jan 2023 17:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5Fb=5X=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pL5zf-0007do-TN
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 17:25:00 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 5a9123ef-9d9e-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 18:24:57 +0100 (CET)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181]) by
 8b0d0d3a25e8 with SMTP id 63d2b76782f0767c3ece081d (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 26 Jan 2023 17:24:55 GMT
Received: by mail-yb1-f181.google.com with SMTP id e15so2827103ybn.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 09:24:55 -0800 (PST)
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
X-Inumbo-ID: 5a9123ef-9d9e-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1674753895; x=1674761095; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=oWmW0uMkRjvQW4Jx9crNRfjROinoQ8/2XaMKFAATFnc=;
 b=IJb0E3a012sACQ9mtw29ajMWmEUEVZGZ3FkU0yeFXzbQDq32ylg8qX/MMw+wq/sx0g68YtF2JMVAWANfT78eZHYh0i+yBJPIkyRWGxgR+nlZatoqhvtoEX6Mm1uaslkMcixzKIOluuTUHk9LpWQ8x/T7EDgiRvsRS+OuiJd42G+nZLlkWsE5h3sySRLk2HujitBfL3WpaP7Plfjp9aWp2lShFthJUvrrv14pKQNe5q/ZjwXXPqWHzP/YXBB0yKubdtPFBp2n/JPE+N8+6d5Ioo3ul8Uqzic/NzLQTXiPCNmUPwaSRbWKIKZT/WUDQ+9TBL9vAbnDrK3/Zy6FTzvVmQ==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKUNhsNHp010vQgiNUV2MaKmHrUr/ac8nos9EGVHQkJNTFE3nNYS
	ImsHd38G63eoQ33UQtxboK8qYRXljk2uL3Q2Kqw=
X-Google-Smtp-Source: AK7set8rESRTIvWHaUTBKPZsAsAOp52Y+oMzYBVC/fYc8FMvr27JSWFt+lI0Kaln3nk0sMbr2WVHaoTdxflDxuYaNxg=
X-Received: by 2002:a05:6902:1345:b0:80b:9496:2179 with SMTP id
 g5-20020a056902134500b0080b94962179mr993222ybu.31.1674753895273; Thu, 26 Jan
 2023 09:24:55 -0800 (PST)
MIME-Version: 1.0
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com> <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com> <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
 <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com> <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
 <cfffcf15-c2fa-6529-d1ff-a71a7571bfe2@suse.com> <CABfawhm_b=MskQN_zZsuKz0FDtZzZNvBMa8bXtxxUZU9rXbUCA@mail.gmail.com>
 <151a70b0-fcb6-9b0f-7834-d2cc15b5d9b0@suse.com>
In-Reply-To: <151a70b0-fcb6-9b0f-7834-d2cc15b5d9b0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Jan 2023 12:24:18 -0500
X-Gmail-Original-Message-ID: <CABfawh=Q7b9NVEn7YXZ3Bgu+N1tY4_o-_HqhbVH0tn5GjXVpew@mail.gmail.com>
Message-ID: <CABfawh=Q7b9NVEn7YXZ3Bgu+N1tY4_o-_HqhbVH0tn5GjXVpew@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest areas
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000039b2705f32e07cd"

--000000000000039b2705f32e07cd
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 11:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.01.2023 16:41, Tamas K Lengyel wrote:
> > On Thu, Jan 26, 2023 at 3:14 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 25.01.2023 16:34, Tamas K Lengyel wrote:
> >>> On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 23.01.2023 19:32, Tamas K Lengyel wrote:
> >>>>> On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com>
> > wrote:
> >>>>>> On 23.01.2023 17:09, Tamas K Lengyel wrote:
> >>>>>>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com>
> > wrote:
> >>>>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>>>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>>>>>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
> >>>>>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>>>>>>>  }
> >>>>>>>>
> >>>>>>>> +static int copy_guest_area(struct guest_area *cd_area,
> >>>>>>>> +                           const struct guest_area *d_area,
> >>>>>>>> +                           struct vcpu *cd_vcpu,
> >>>>>>>> +                           const struct domain *d)
> >>>>>>>> +{
> >>>>>>>> +    mfn_t d_mfn, cd_mfn;
> >>>>>>>> +
> >>>>>>>> +    if ( !d_area->pg )
> >>>>>>>> +        return 0;
> >>>>>>>> +
> >>>>>>>> +    d_mfn = page_to_mfn(d_area->pg);
> >>>>>>>> +
> >>>>>>>> +    /* Allocate & map a page for the area if it hasn't been
> > already.
> >>>>> */
> >>>>>>>> +    if ( !cd_area->pg )
> >>>>>>>> +    {
> >>>>>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >>>>>>>> +        struct p2m_domain *p2m =
p2m_get_hostp2m(cd_vcpu->domain);
> >>>>>>>> +        p2m_type_t p2mt;
> >>>>>>>> +        p2m_access_t p2ma;
> >>>>>>>> +        unsigned int offset;
> >>>>>>>> +        int ret;
> >>>>>>>> +
> >>>>>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
> >>>>> NULL);
> >>>>>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >>>>>>>> +        {
> >>>>>>>> +            struct page_info *pg =
> >>> alloc_domheap_page(cd_vcpu->domain,
> >>>>>>> 0);
> >>>>>>>> +
> >>>>>>>> +            if ( !pg )
> >>>>>>>> +                return -ENOMEM;
> >>>>>>>> +
> >>>>>>>> +            cd_mfn = page_to_mfn(pg);
> >>>>>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >>>>>>>> +
> >>>>>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn,
PAGE_ORDER_4K,
> >>>>>>> p2m_ram_rw,
> >>>>>>>> +                                 p2m->default_access, -1);
> >>>>>>>> +            if ( ret )
> >>>>>>>> +                return ret;
> >>>>>>>> +        }
> >>>>>>>> +        else if ( p2mt != p2m_ram_rw )
> >>>>>>>> +            return -EBUSY;
> >>>>>>>> +
> >>>>>>>> +        /*
> >>>>>>>> +         * Simply specify the entire range up to the end of the
> >>> page.
> >>>>>>> All the
> >>>>>>>> +         * function uses it for is a check for not crossing page
> >>>>>>> boundaries.
> >>>>>>>> +         */
> >>>>>>>> +        offset = PAGE_OFFSET(d_area->map);
> >>>>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) +
offset,
> >>>>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
> >>>>>>>> +        if ( ret )
> >>>>>>>> +            return ret;
> >>>>>>>> +    }
> >>>>>>>> +    else
> >>>>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
> >>>>>>>
> >>>>>>> Everything to this point seems to be non mem-sharing/forking
> > related.
> >>>>> Could
> >>>>>>> these live somewhere else? There must be some other place where
> >>>>> allocating
> >>>>>>> these areas happens already for non-fork VMs so it would make
sense
> > to
> >>>>> just
> >>>>>>> refactor that code to be callable from here.
> >>>>>>
> >>>>>> It is the "copy" aspect with makes this mem-sharing (or really
fork)
> >>>>>> specific. Plus in the end this is no different from what you have
> >>>>>> there right now for copying the vCPU info area. In the final patch
> >>>>>> that other code gets removed by re-using the code here.
> >>>>>
> >>>>> Yes, the copy part is fork-specific. Arguably if there was a way to
do
> >>> the
> >>>>> allocation of the page for vcpu_info I would prefer that being
> >>> elsewhere,
> >>>>> but while the only requirement is allocate-page and copy from parent
> >>> I'm OK
> >>>>> with that logic being in here because it's really straight forward.
> > But
> >>> now
> >>>>> you also do extra sanity checks here which are harder to comprehend
in
> >>> this
> >>>>> context alone.
> >>>>
> >>>> What sanity checks are you talking about (also below, where you claim
> >>>> map_guest_area() would be used only to sanity check)?
> >>>
> >>> Did I misread your comment above "All the function uses it for is a
> > check
> >>> for not crossing page boundaries"? That sounds to me like a simple
> > sanity
> >>> check, unclear why it matters though and why only for forks.
> >>
> >> The comment is about the function's use of the range it is being
passed.
> >> It doesn't say in any way that the function is doing only sanity
checking.
> >> If the comment wording is ambiguous or unclear, I'm happy to take
> >> improvement suggestions.
> >
> > Yes, please do, it definitely was confusing while reviewing the patch.
>
> I'm sorry, but what does "please do" mean when I asked for improvement
> suggestions? I continue to think the comment is quite clear as is, so
> if anything needs adjusting, I'd need to know pretty precisely what it
> is that needs adding and/or re-writing. I can't, after all, guess what
> your misunderstanding resulted from.

I meant please do add the extra information you just spelled out in your
previous email. "Map the page into the guest. We pass the entire range to
map_guest_area so that it can check that no cross-page mapping is taking
place (in which case it will fail). If no such issue is present the page is
being mapped and made accessible to the guest."

If that's not what the function is doing, please explain clearly what it
will do.

Tamas

--000000000000039b2705f32e07cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Jan 26, 2023 at 11:48 AM Jan Beulich &lt;<=
a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br>&gt=
;<br>&gt; On 26.01.2023 16:41, Tamas K Lengyel wrote:<br>&gt; &gt; On Thu, =
Jan 26, 2023 at 3:14 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com=
">jbeulich@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On 25.=
01.2023 16:34, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt; On Tue, Jan 24, =
2023 at 6:19 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeuli=
ch@suse.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt=
; On 23.01.2023 19:32, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;&gt;&gt;&gt; =
On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich &lt;<a href=3D"mailto:jbeulich=
@suse.com">jbeulich@suse.com</a>&gt;<br>&gt; &gt; wrote:<br>&gt; &gt;&gt;&g=
t;&gt;&gt;&gt; On 23.01.2023 17:09, Tamas K Lengyel wrote:<br>&gt; &gt;&gt;=
&gt;&gt;&gt;&gt;&gt; On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich &lt;<a hre=
f=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt;<br>&gt; &gt; wrote=
:<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/arch/x86/mm/mem_sharin=
g.c<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/x86/mm/mem_shar=
ing.c<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -1653,6 +1653,65 @@ stati=
c void copy_vcpu_nonreg_state(struc<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
; =C2=A0 =C2=A0 =C2=A0hvm_set_nonreg_state(cd_vcpu, &amp;nrs);<br>&gt; &gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0}<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +static int copy_guest_area(str=
uct guest_area *cd_area,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const struct guest_area *d_area,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vcpu *cd_vcpu,<br>&gt; &gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct domain *d)<br>&gt; &gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt; +{<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0mfn_t d_mfn, cd_mfn;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<b=
r>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0if ( !d_area-&gt;pg =
)<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn 0;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt; + =C2=A0 =C2=A0d_mfn =3D page_to_mfn(d_area-&gt;pg);<br>&gt=
; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&g=
t; + =C2=A0 =C2=A0/* Allocate &amp; map a page for the area if it hasn&#39;=
t been<br>&gt; &gt; already.<br>&gt; &gt;&gt;&gt;&gt;&gt; */<br>&gt; &gt;&g=
t;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0if ( !cd_area-&gt;pg )<br>&gt; &g=
t;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0{<br>&gt; &gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_t gfn =3D mfn_to_gfn(d, d_mf=
n);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
truct p2m_domain *p2m =3D p2m_get_hostp2m(cd_vcpu-&gt;domain);<br>&gt; &gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<=
br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_a=
ccess_t p2ma;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned int offset;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
d_mfn =3D p2m-&gt;get_entry(p2m, gfn, &amp;p2mt, &amp;p2ma, 0, NULL,<br>&gt=
; &gt;&gt;&gt;&gt;&gt; NULL);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( mfn_eq(cd_mfn, INVALID_MFN) )<br>&gt; &gt;&=
gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>&gt; &gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct =
page_info *pg =3D<br>&gt; &gt;&gt;&gt; alloc_domheap_page(cd_vcpu-&gt;domai=
n,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; 0);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if ( !pg )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>&=
gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D page_to_mfn(pg);=
<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));<br>&gt; &gt;&gt;&gt=
;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D p2m-&gt;set_entry(p2m, gfn, cd_mf=
n, PAGE_ORDER_4K,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; p2m_ram_rw,<br>&gt; =
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
2m-&gt;default_access, -1);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret )<br>&gt; &gt;&gt;&gt;&gt;&g=
t;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn ret;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else if ( p2mt !=3D p2m_ram_rw )<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>&gt; &gt;&gt=
;&gt;&gt;&gt;&gt;&gt;&gt; +<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/*<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * Simply specify the entire range up to the end of=
 the<br>&gt; &gt;&gt;&gt; page.<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; All th=
e<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 * =
function uses it for is a check for not crossing page<br>&gt; &gt;&gt;&gt;&=
gt;&gt;&gt;&gt; boundaries.<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 */<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0offset =3D PAGE_OFFSET(d_area-&gt;map);<br>&gt; &gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D map_gues=
t_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_SIZE - offset, cd_area, NULL);<br>&=
gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret =
)<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =
=C2=A0}<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0else<br>&gt=
; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0cd_mfn =3D =
page_to_mfn(cd_area-&gt;pg);<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &=
gt;&gt;&gt;&gt;&gt;&gt;&gt; Everything to this point seems to be non mem-sh=
aring/forking<br>&gt; &gt; related.<br>&gt; &gt;&gt;&gt;&gt;&gt; Could<br>&=
gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; these live somewhere else? There must be s=
ome other place where<br>&gt; &gt;&gt;&gt;&gt;&gt; allocating<br>&gt; &gt;&=
gt;&gt;&gt;&gt;&gt;&gt; these areas happens already for non-fork VMs so it =
would make sense<br>&gt; &gt; to<br>&gt; &gt;&gt;&gt;&gt;&gt; just<br>&gt; =
&gt;&gt;&gt;&gt;&gt;&gt;&gt; refactor that code to be callable from here.<b=
r>&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; It is the =
&quot;copy&quot; aspect with makes this mem-sharing (or really fork)<br>&gt=
; &gt;&gt;&gt;&gt;&gt;&gt; specific. Plus in the end this is no different f=
rom what you have<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt; there right now for copy=
ing the vCPU info area. In the final patch<br>&gt; &gt;&gt;&gt;&gt;&gt;&gt;=
 that other code gets removed by re-using the code here.<br>&gt; &gt;&gt;&g=
t;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; Yes, the copy part is fork-specific=
. Arguably if there was a way to do<br>&gt; &gt;&gt;&gt; the<br>&gt; &gt;&g=
t;&gt;&gt;&gt; allocation of the page for vcpu_info I would prefer that bei=
ng<br>&gt; &gt;&gt;&gt; elsewhere,<br>&gt; &gt;&gt;&gt;&gt;&gt; but while t=
he only requirement is allocate-page and copy from parent<br>&gt; &gt;&gt;&=
gt; I&#39;m OK<br>&gt; &gt;&gt;&gt;&gt;&gt; with that logic being in here b=
ecause it&#39;s really straight forward.<br>&gt; &gt; But<br>&gt; &gt;&gt;&=
gt; now<br>&gt; &gt;&gt;&gt;&gt;&gt; you also do extra sanity checks here w=
hich are harder to comprehend in<br>&gt; &gt;&gt;&gt; this<br>&gt; &gt;&gt;=
&gt;&gt;&gt; context alone.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&g=
t; What sanity checks are you talking about (also below, where you claim<br=
>&gt; &gt;&gt;&gt;&gt; map_guest_area() would be used only to sanity check)=
?<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; Did I misread your comment abov=
e &quot;All the function uses it for is a<br>&gt; &gt; check<br>&gt; &gt;&g=
t;&gt; for not crossing page boundaries&quot;? That sounds to me like a sim=
ple<br>&gt; &gt; sanity<br>&gt; &gt;&gt;&gt; check, unclear why it matters =
though and why only for forks.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; The commen=
t is about the function&#39;s use of the range it is being passed.<br>&gt; =
&gt;&gt; It doesn&#39;t say in any way that the function is doing only sani=
ty checking.<br>&gt; &gt;&gt; If the comment wording is ambiguous or unclea=
r, I&#39;m happy to take<br>&gt; &gt;&gt; improvement suggestions.<br>&gt; =
&gt;<br>&gt; &gt; Yes, please do, it definitely was confusing while reviewi=
ng the patch.<br>&gt;<br>&gt; I&#39;m sorry, but what does &quot;please do&=
quot; mean when I asked for improvement<br>&gt; suggestions? I continue to =
think the comment is quite clear as is, so<br>&gt; if anything needs adjust=
ing, I&#39;d need to know pretty precisely what it<br>&gt; is that needs ad=
ding and/or re-writing. I can&#39;t, after all, guess what<br>&gt; your mis=
understanding resulted from.<br><div><br></div><div>I meant please do add t=
he extra information you just spelled out in your previous email. &quot;Map=
 the page into the guest. We pass the entire range to=20
map_guest_area so that it can check that no cross-page mapping is taking pl=
ace (in which case it will fail). If no such issue is present the page is b=
eing mapped and made accessible to the guest.&quot;<br></div><div><br></div=
><div>If that&#39;s not what the function is doing, please explain clearly =
what it will do.<br></div><div><br></div><div>Tamas<br></div></div>

--000000000000039b2705f32e07cd--

