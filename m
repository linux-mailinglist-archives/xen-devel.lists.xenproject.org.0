Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40B232E58
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 10:19:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k13mg-00076X-3r; Thu, 30 Jul 2020 08:19:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k13me-00076S-Py
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 08:19:24 +0000
X-Inumbo-ID: 5fdd718d-d23d-11ea-8d1a-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fdd718d-d23d-11ea-8d1a-bc764e2007e4;
 Thu, 30 Jul 2020 08:19:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r2so18926659wrs.8
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=KzFYpcmZnZRqz7KZaIRB3nffNHWL4lNaRYDakxYMnN0=;
 b=uCP8Gbl7rExrDDTtQS5fmLvJC6XnqiNnE2b3Qc+r2I3fcwZ6MFiy07wYkj9aHeXOF6
 8DiNctKwmDtkjbXWPRjVmmcci0N4ETl83IWWJDoUtgaZ+XArLtNlgjQwdfoT4QSn1oCy
 RHMa4wAs4bnAhkCRZ7RqzPibY8f42wh9h3zEttqTsRtAyNWPL480WTonR7hteLvcLXJr
 /Y3GxVBoEqmtZoj+IPyuY7woHEjs7YVDebJXDzGfvIB4sCqv+kgL7BvxYdwg3sVRvKJY
 D18/EQCn3aw387pfUAqL4bLKdfR2Bn2MSP8hOLHbNg2Dv+ndKY0gda/QtQ/HTi2QK2vT
 w1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=KzFYpcmZnZRqz7KZaIRB3nffNHWL4lNaRYDakxYMnN0=;
 b=H8gaIaF+BiQTNOIyOS3xgs7VEx5mOMzL/g+asuIGJLGgRak1s118lNdJsMMGT1y7Ku
 M0w4qrN3edHon91r/kQVkrlYADd4ZM9Lk8wTt5jrb/N4d0nt3dcg9+79gjxRV2gp8vLT
 /ClcvQi6IMFm58feo+SUhadV8VxVusrtc1t86M23/uzAKpoGWupkK3K4gxYm8WgqhFbl
 PmxktVDeQoA6tLsIrHI66lfLd6wp49XHy9U4d4j2UwZJCzpfJR+hpf/BYhE6Q7MKDozn
 YmaNYMmc2VqYAypJEZFvpEI7DFH6hN+K+0Tjy/eMIqfXFjKO3oK3pgkLKiGlHH3bSXfs
 hX1Q==
X-Gm-Message-State: AOAM532dQbNcrUP9UfIcWLLgKwqYPyUhA9xOkLBQC4m/K6xEU3hoK9HM
 lf7EZvcCz0TCr7e0bHhvr6s=
X-Google-Smtp-Source: ABdhPJwZ1HPqWX2xvE1POlsgMsUmeK7/jWnfAqCaJJdyH5EdXLKM/t5rHdgF7mtmcFN12r0LWCzxsA==
X-Received: by 2002:adf:e550:: with SMTP id z16mr16978855wrm.329.1596097162707; 
 Thu, 30 Jul 2020 01:19:22 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id g188sm9684768wma.5.2020.07.30.01.19.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 01:19:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
In-Reply-To: <20200728113712.22966-3-andrew.cooper3@citrix.com>
Subject: RE: [PATCH 2/5] xen/gnttab: Rework resource acquisition
Date: Thu, 30 Jul 2020 09:14:09 +0100
Message-ID: <002801d66649$67098050$351c80f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiAJ9GaFOqcSAvZA=
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
Reply-To: paul@xen.org
Cc: 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 July 2020 12:37
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; =
Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Wei Liu <wl@xen.org>; Julien
> Grall <julien@xen.org>; Paul Durrant <paul@xen.org>; Micha=C5=82 =
Leszczy=C5=84ski <michal.leszczynski@cert.pl>;
> Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> Subject: [PATCH 2/5] xen/gnttab: Rework resource acquisition
>=20
> The existing logic doesn't function in the general case for mapping a =
guests
> grant table, due to arbitrary 32 frame limit, and the default grant =
table
> limit being 64.
>=20
> In order to start addressing this, rework the existing grant table =
logic by
> implementing a single gnttab_acquire_resource().  This is far more =
efficient
> than the previous acquire_grant_table() in memory.c because it doesn't =
take
> the grant table write lock, and attempt to grow the table, for every =
single
> frame.
>=20

But that should not have happened before because the code deliberately =
iterates backwards, thereby starting with the last frame, thereby =
growing the table at most once. (I agree that dropping and re-acquiring =
the lock every time was sub-optimal).

> The new gnttab_acquire_resource() function subsumes the previous two
> gnttab_get_{shared,status}_frame() helpers.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  xen/common/grant_table.c      | 93 =
++++++++++++++++++++++++++++++-------------
>  xen/common/memory.c           | 42 +------------------
>  xen/include/xen/grant_table.h | 19 ++++-----
>  3 files changed, 75 insertions(+), 79 deletions(-)
>=20
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 9f0cae52c0..122d1e7596 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct =
domain *d,
>      return 0;
>  }
>=20
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt =3D d->grant_table;
> +    unsigned int i =3D nr_frames, tot_frames;
> +    void **vaddrs;
> +    int rc =3D 0;
> +
> +    /* Input sanity. */
> +    if ( !nr_frames )
> +        return -EINVAL;

This was not an error before. Does mapping 0 frames really need to be a =
failure?

> +
> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames =3D frame + nr_frames;

That name is confusing. 'last_frame' perhaps (and then make the -1 =
implicit)?

> +    if ( tot_frames !=3D frame + nr_frames )
> +        return -EINVAL;
> +
> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    switch ( id )
> +    {
> +        mfn_t tmp;
> +
> +    case XENMEM_resource_grant_table_id_shared:
> +        rc =3D gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( gt->gt_version !=3D 2 )
> +        {
> +    default:
> +            rc =3D -EINVAL;
> +            break;
> +        }
> +        rc =3D gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +    }
> +
> +    /* Any errors from growing the table? */
> +    if ( rc )
> +        goto out;
> +
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        vaddrs =3D gt->shared_raw;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        vaddrs =3D (void **)gt->status;

Erk. Could we avoid this casting nastiness by putting a loop in each =
switch case. I know it could be considered code duplication but this is =
a bit icky.

> +        break;
> +    }
> +
> +    for ( i =3D 0; i < nr_frames; ++i )
> +        mfn_list[i] =3D virt_to_mfn(vaddrs[frame + i]);
> +
> + out:
> +    grant_write_unlock(gt);

Since you deliberately grew the table first, could you not drop the =
write lock and acquire it a read lock before looping over the frames?

  Paul

> +
> +    return rc;
> +}
> +
>  int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, =
mfn_t *mfn)
>  {
>      int rc =3D 0;
> @@ -4047,33 +4113,6 @@ int gnttab_map_frame(struct domain *d, unsigned =
long idx, gfn_t gfn, mfn_t
> *mfn)
>      return rc;
>  }
>=20
> -int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
> -                            mfn_t *mfn)
> -{
> -    struct grant_table *gt =3D d->grant_table;
> -    int rc;
> -
> -    grant_write_lock(gt);
> -    rc =3D gnttab_get_shared_frame_mfn(d, idx, mfn);
> -    grant_write_unlock(gt);
> -
> -    return rc;
> -}
> -
> -int gnttab_get_status_frame(struct domain *d, unsigned long idx,
> -                            mfn_t *mfn)
> -{
> -    struct grant_table *gt =3D d->grant_table;
> -    int rc;
> -
> -    grant_write_lock(gt);
> -    rc =3D (gt->gt_version =3D=3D 2) ?
> -        gnttab_get_status_frame_mfn(d, idx, mfn) : -EINVAL;
> -    grant_write_unlock(gt);
> -
> -    return rc;
> -}
> -
>  static void gnttab_usage_print(struct domain *rd)
>  {
>      int first =3D 1;
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 714077c1e5..dc3a7248e3 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1007,44 +1007,6 @@ static long xatp_permission_check(struct domain =
*d, unsigned int space)
>      return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>  }
>=20
> -static int acquire_grant_table(struct domain *d, unsigned int id,
> -                               unsigned long frame,
> -                               unsigned int nr_frames,
> -                               xen_pfn_t mfn_list[])
> -{
> -    unsigned int i =3D nr_frames;
> -
> -    /* Iterate backwards in case table needs to grow */
> -    while ( i-- !=3D 0 )
> -    {
> -        mfn_t mfn =3D INVALID_MFN;
> -        int rc;
> -
> -        switch ( id )
> -        {
> -        case XENMEM_resource_grant_table_id_shared:
> -            rc =3D gnttab_get_shared_frame(d, frame + i, &mfn);
> -            break;
> -
> -        case XENMEM_resource_grant_table_id_status:
> -            rc =3D gnttab_get_status_frame(d, frame + i, &mfn);
> -            break;
> -
> -        default:
> -            rc =3D -EINVAL;
> -            break;
> -        }
> -
> -        if ( rc )
> -            return rc;
> -
> -        ASSERT(!mfn_eq(mfn, INVALID_MFN));
> -        mfn_list[i] =3D mfn_x(mfn);
> -    }
> -
> -    return 0;
> -}
> -
>  static int acquire_resource(
>      XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
>  {
> @@ -1091,8 +1053,8 @@ static int acquire_resource(
>      switch ( xmar.type )
>      {
>      case XENMEM_resource_grant_table:
> -        rc =3D acquire_grant_table(d, xmar.id, xmar.frame, =
xmar.nr_frames,
> -                                 mfn_list);
> +        rc =3D gnttab_acquire_resource(d, xmar.id, xmar.frame, =
xmar.nr_frames,
> +                                     mfn_list);
>          break;
>=20
>      default:
> diff --git a/xen/include/xen/grant_table.h =
b/xen/include/xen/grant_table.h
> index 98603604b8..5a2c75b880 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -56,10 +56,10 @@ int mem_sharing_gref_to_gfn(struct grant_table =
*gt, grant_ref_t ref,
>=20
>  int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
>                       mfn_t *mfn);
> -int gnttab_get_shared_frame(struct domain *d, unsigned long idx,
> -                            mfn_t *mfn);
> -int gnttab_get_status_frame(struct domain *d, unsigned long idx,
> -                            mfn_t *mfn);
> +
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[]);
>=20
>  #else
>=20
> @@ -93,14 +93,9 @@ static inline int gnttab_map_frame(struct domain =
*d, unsigned long idx,
>      return -EINVAL;
>  }
>=20
> -static inline int gnttab_get_shared_frame(struct domain *d, unsigned =
long idx,
> -                                          mfn_t *mfn)
> -{
> -    return -EINVAL;
> -}
> -
> -static inline int gnttab_get_status_frame(struct domain *d, unsigned =
long idx,
> -                                          mfn_t *mfn)
> +static inline int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>  {
>      return -EINVAL;
>  }
> --
> 2.11.0



