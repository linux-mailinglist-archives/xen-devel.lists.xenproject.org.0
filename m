Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA5ABA500
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 23:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987543.1372737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG2Np-0001XU-Jo; Fri, 16 May 2025 21:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987543.1372737; Fri, 16 May 2025 21:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG2Np-0001V1-Fe; Fri, 16 May 2025 21:14:21 +0000
Received: by outflank-mailman (input) for mailman id 987543;
 Fri, 16 May 2025 21:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uG2Nm-0001Uv-QP
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 21:14:19 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b892d80d-329a-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 23:14:16 +0200 (CEST)
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
X-Inumbo-ID: b892d80d-329a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747430053; x=1747689253;
	bh=ILiVZTEkfcZao/WTFBJRIR+pWAqLu86c0kGxkMkuxS0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hF0vtq3y4OxYs3No8LLJQ6xwWdvXATzNd+Nk/Sq0/umCbVlrXdPnnM+2WZPunu+SS
	 i9aqO0rBzCHVDTbF+A8us417Vu3G8bmr2W0OKd8W/1Egj5Gxqc0bCR+U+CJxwJQe6T
	 MvjgmXHgwPr2oFQq7a7FzKyXQavUxMgpCt1TS4+tfOzQLtHQl6VA9b/YTWkJye2nMm
	 E+hJ02n9qqWdPF27rr6UHUr3et+Mtpgf/52AFTVulvcxwU5hNNhy3diIsKQc1KQmOF
	 e5Plv+S8zblsgRuGtMgJferrx9+KFMHyDkcvoYgp/u8sRqkElaCxQ8oINl0CPqNhcC
	 k73/Y297GWr8Q==
Date: Fri, 16 May 2025 21:14:10 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v6 1/2] xen/domain: unify domain ID allocation
Message-ID: <aCeqnVcXIV3dyPBg@kraken>
In-Reply-To: <2e5afdf1-3913-4b6f-86ea-21b3ccd0833c@xen.org>
References: <20250516020434.1145337-1-dmukhin@ford.com> <20250516020434.1145337-2-dmukhin@ford.com> <3c9f60b3-cedb-4689-a3b4-15ebddcf9f67@vates.tech> <aCd+vEOrQcbCYFgY@kraken> <2e5afdf1-3913-4b6f-86ea-21b3ccd0833c@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c8f9c67d200afb1dd42d8e7230606b6607f2a054
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 09:35:35PM +0100, Julien Grall wrote:
> Hi Denis and Teddy,
>=20
> I haven't looked at the rest of the series. Just answering
> to the discussion between both of you.
>=20
> On 16/05/2025 19:06, dmkhn@proton.me wrote:
> > On Fri, May 16, 2025 at 08:43:35AM +0000, Teddy Astie wrote:
> >>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/dev=
ice-tree/dom0less-build.c
> >>> index 2c56f13771..9236dbae11 100644
> >>> --- a/xen/common/device-tree/dom0less-build.c
> >>> +++ b/xen/common/device-tree/dom0less-build.c
> >>> @@ -850,15 +850,13 @@ void __init create_domUs(void)
> >>>            struct xen_domctl_createdomain d_cfg =3D {0};
> >>>            unsigned int flags =3D 0U;
> >>>            bool has_dtb =3D false;
> >>> +        domid_t domid;
> >>>            uint32_t val;
> >>>            int rc;
> >>>
> >>>            if ( !dt_device_is_compatible(node, "xen,domain") )
> >>>                continue;
> >>>
> >>> -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> >>> -            panic("No more domain IDs available\n");
> >>> -
> >>>            d_cfg.max_evtchn_port =3D 1023;
> >>>            d_cfg.max_grant_frames =3D -1;
> >>>            d_cfg.max_maptrack_frames =3D -1;
> >>> @@ -981,7 +979,11 @@ void __init create_domUs(void)
> >>>             * very important to use the pre-increment operator to cal=
l
> >>>             * domain_create() with a domid > 0. (domid =3D=3D 0 is re=
served for Dom0)
> >>>             */
> >>> -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> >>> +        domid =3D domid_alloc(++max_init_domid);
> >>> +        if ( domid =3D=3D DOMID_INVALID )
> >>> +            panic("Error allocating ID for domain %s\n", dt_node_nam=
e(node));
> >>> +
> >>> +        d =3D domain_create(domid, &d_cfg, flags);
> >>>            if ( IS_ERR(d) )
> >>>                panic("Error creating domain %s (rc =3D %ld)\n",
> >>>                      dt_node_name(node), PTR_ERR(d));
> >>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >>> index abf1969e60..0ba3cdc47d 100644
> >>> --- a/xen/common/domain.c
> >>> +++ b/xen/common/domain.c
> >>> @@ -66,6 +66,74 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >>>    static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >>>    struct domain *domain_list;
> >>>
> >>> +/* Non-system domain ID allocator. */
> >>> +static DEFINE_SPINLOCK(domid_lock);
> >>> +static struct rangeset *domid_rangeset;
> >>> +static unsigned int domid_last;
> >>> +
> >>> +void __init domid_init(void)
> >>> +{
> >>> +    domid_rangeset =3D rangeset_new(NULL, "domid", RANGESETF_prettyp=
rint_hex);
> >>> +    if ( !domid_rangeset )
> >>> +        panic("cannot allocate domain ID rangeset\n");
> >>> +
> >>> +    rangeset_limit(domid_rangeset, DOMID_FIRST_RESERVED);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Allocate new non-system domain ID based on the hint.
> >>> + *
> >>> + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range o=
f IDs,
> >>> + * perform an exhaustive search starting from the end of the used do=
main ID
> >>> + * range.
> >>> + */
> >>> +domid_t domid_alloc(domid_t domid)
> >>> +{
> >>> +    spin_lock(&domid_lock);
> >>> +
> >>> +    if ( domid < DOMID_FIRST_RESERVED )
> >>> +    {
> >>> +        if ( rangeset_contains_singleton(domid_rangeset, domid) )
> >>> +            domid =3D DOMID_INVALID;
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        for ( domid =3D domid_last + 1; domid !=3D domid_last; domid=
++ )
> >>> +        {
> >>> +            if ( domid =3D=3D DOMID_FIRST_RESERVED )
> >>> +                domid =3D 0;
> >>> +
> >>> +            if ( !rangeset_contains_singleton(domid_rangeset, domid)=
 )
> >>> +                break;
> >>> +        }
> >>> +
> >>> +        if ( domid =3D=3D domid_last )
> >>> +            domid =3D DOMID_INVALID;
> >>> +    }
> >>> +
> >>> +    if ( domid !=3D DOMID_INVALID )
> >>> +    {
> >>> +        ASSERT(!rangeset_add_singleton(domid_rangeset, domid));
> >>> +
> >>> +        if ( domid !=3D domid_last )
> >>> +            domid_last =3D domid;
> >>> +    }
> >>> +
> >>> +    spin_unlock(&domid_lock);
> >>> +
> >>> +    return domid;
> >>> +}
> >>
> >> It's mostly a matter of implementation choice, but I am not really fan
> >> of relying on rangesets, which to me are meant for address ranges or
> >> something similar but at least large.
> >>
> >> I would rather rely on a bitmap using find_first_zero_bit+set_bit whic=
h
> >> avoids doing a per-domid test, and may be simpler overall. The bitmap
> >> size for 0x3FF0 domains is almost 4KB, which looks acceptable.
>=20
> I guess you meant 0x7FF0?
>=20
> >>
> >> I don't know what other thinks.
> >
> > Thanks for taking a look!
> >
> > TBH, I was initially considering using a bitmap. But then I chose use r=
angesets
> > because statically defined bitmap will increase the binary size, which =
may be
> > indesirable; and for dynamic allocation, rangeset has all convenience A=
PIs
> > implemented...
>=20
> The bitmap helpers have been optimized for fast lookup and insertion.
> They could also potentially be used lockless.
>=20
> On the other hand, the rangeset is a linear search from start. So for
> instance, AFAIU, "rangeset_contains_singleton()" will start looking up
> from the first range until it found the highest range lower or
> containing the singleton. It also contains an internal read-write lock.
> So we are taking two locks now.
>=20
> This means the loop:
>=20
>  > for ( domid =3D domid_last + 1; domid !=3D domid_last; domid++ )
>  >    [...]
>  >    if ( !rangeset_contains_singleton(...) )
>=20
> is going to be fairly ineffient. I haven't check whether we can do
> better with the rangeset.
>=20
> Also, the overhead of a range is actually quite high if the domain IDs
> are not contiguous (for Arm 64-bit, it is 16-byte per range and 72-byte
> for the the rangeset structure).
>=20
> Lastly, as you pointed out this is requiring dynamic allocation. Which
> means domid_alloc() could now fail because Xen is out of memory. This
> feels a little be odd to have domid_alloc() returning -ENOMEM.
>=20
> BTW, I noticed in your code you are using:
>=20
> ASSERT(!rangeset_add_singleton(...))
>=20
> In production build, ASSERTs() behaves like a NOP:
>=20
> #define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
>=20
> So rangeset_add_singleton() would not be called at all. This is also not
> the right way to handle failure that can happen at runtime. Instead, the
> error should be propagated.
>=20
> Overall, I think a bitmap is more suitable to keep track of the domids
> allocated.
>=20
> To make clear, I think increase the binary by 4KB is fine in this case.
> If someone is really concern of the increase, they would most likely not
> try to run 4KB domains, so we could potentially introduce
> CONFIG_MAX_DOMAIN to reduce the bitmap size and the number of domains
> (it is not a ask for this series).

Thanks for taking a look!

I will drop ASSERT()s and switch to bitmaps.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20


