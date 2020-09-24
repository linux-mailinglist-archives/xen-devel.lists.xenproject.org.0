Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FA276DE3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 11:52:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLNuj-0001FZ-Ko; Thu, 24 Sep 2020 09:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLNuh-0001FU-I7
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 09:51:43 +0000
X-Inumbo-ID: ef8e033b-f542-4b36-bf3a-aa69cf1a4844
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef8e033b-f542-4b36-bf3a-aa69cf1a4844;
 Thu, 24 Sep 2020 09:51:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so3056441wrm.9
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jwyNFhqjSaJQ/LmtWgzTzyHieHcd3IxZ5mY63Xk5XGM=;
 b=DHVS6VnxXqHzKScYaP8MyMgz62x2aJAxpVpPdb64gH9oRQRmfq6PT3rJrwETdnvN5O
 ob6bPLNKSmPgbsjbRtbW6R2xI6/543NCW0zt1ZBSdEBXQY6bUsnAVAzlHOrLUtsV9eVH
 x0mWxY6RoGx3MR4LdMGhA2OtJlgsEAxYjOJ5Us4DZpMLzWgb4Os4J+7fkQf84mI7vOKt
 /j6DXd/3rzg9z1G2h99gNQCTeSfK+Xtzhj1DdjJbR74k1DSPHG7g4bUFFPqGMJa18nGu
 ih6ePGAjI/6cc7XFIoz8/IaRsO4Kc0+tHBfEeST/EFJ31uyyIB8IPzJiso2tnjJyzfZz
 +1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jwyNFhqjSaJQ/LmtWgzTzyHieHcd3IxZ5mY63Xk5XGM=;
 b=esefQJZGDm/ijcKLAcgD0f7qQp+15PobA5+/ekxrijmUK2zn14k2DfKkF9BmrV26Sp
 E1naVQ5rqQ0aJsG31eHHJGKXF4Oxg4DLPReWlFAIKNLfzrLE6PtD3ezOGKWspGnn6rgT
 TpQggHyH4BCeDR/Ls+J7MIMpu++3LlA0LJ9qMOLHpvDOSu0mFlQw6h+RHOzg4d5NhKTp
 g17/RTJbFaK4g8t5atD3t/dsywUThC6k5y6347KLq/y0ev0ja4Mk/z7+GLG4oXIh1xXO
 Odvm57eCCSPKzU+b85sMbZ9HITmS01ya/awagwMjibM8Ejp9AmokLG/A9xVhyexT4FB2
 K04A==
X-Gm-Message-State: AOAM530KZCRJQop/rFLVYDCsOfNLW/buVoFG54piIqIMuajZylLXsmbj
 WXytAwKHLd0ptlUTD/+yhUI=
X-Google-Smtp-Source: ABdhPJycUpZ2OhdKts/cSyMD3+zfTsbzDKnaNg3jhIB0BkYiIVmUl0hwqy5l8iKmItC5cll9aOHiWw==
X-Received: by 2002:a5d:660d:: with SMTP id n13mr4293431wru.308.1600941101341; 
 Thu, 24 Sep 2020 02:51:41 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id o15sm2719004wmh.29.2020.09.24.02.51.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 02:51:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <George.Dunlap@eu.citrix.com>,
 "'Ian Jackson'" <iwj@xenproject.org>, "'Jan Beulich'" <JBeulich@suse.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 "'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
 "'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-3-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
Date: Thu, 24 Sep 2020 10:51:39 +0100
Message-ID: <001601d69258$4d6a7c90$e83f75b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyALWxT5UqQLkKxA=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 22 September 2020 19:25
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Jan Beulich <JBeulich@suse.com>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Paul Durrant
> <paul@xen.org>; Micha=C5=82 Leszczy=C5=84ski =
<michal.leszczynski@cert.pl>; Hubert Jasudowicz
> <hubert.jasudowicz@cert.pl>; Tamas K Lengyel <tamas@tklengyel.com>
> Subject: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
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
> The new gnttab_acquire_resource() function subsumes the previous two
> gnttab_get_{shared,status}_frame() helpers.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
>=20
> v2:
>  * Fix CentOS 6 build by initialising vaddrs to NULL
>  * Add ASSERT_UNREACHABLE() and gt->status typecheck
> ---
>  xen/common/grant_table.c      | 102 =
+++++++++++++++++++++++++++++++-----------
>  xen/common/memory.c           |  42 +----------------
>  xen/include/xen/grant_table.h |  19 +++-----
>  3 files changed, 84 insertions(+), 79 deletions(-)
>=20
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index a5d3ed8bda..912f07be47 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct =
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
> +    mfn_t tmp;
> +    void **vaddrs =3D NULL;
> +    int rc;
> +
> +    /* Input sanity. */

Nit: inconsistency with full stops on single line comments.

> +    if ( !nr_frames )
> +        return -EINVAL;
> +
> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames =3D frame + nr_frames;
> +    if ( tot_frames !=3D frame + nr_frames )
> +        return -EINVAL;
> +
> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        rc =3D gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( gt->gt_version !=3D 2 )
> +        {
> +    default:

Personally I dislike this kind of thing. IMO it would be neater to =
initialise rc to -EINVAL at the top, then this could just be a 'break' =
(so no braces) and you could have a simple 'default: break;' case =
instead.

> +            rc =3D -EINVAL;
> +            break;
> +        }
> +        rc =3D gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +    }
> +

I think you could drop the write lock here...

> +    /* Any errors from growing the table? */
> +    if ( rc )
> +        goto out;
> +

...and acquire it read here, since we know the table cannot shrink. =
You'd need to re-check the gt_version for safety though.=20

  Paul

> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        vaddrs =3D gt->shared_raw;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        /* Check that void ** is a suitable representation for =
gt->status. */
> +        BUILD_BUG_ON(!__builtin_types_compatible_p(
> +                         typeof(gt->status), grant_status_t **));
> +        vaddrs =3D (void **)gt->status;
> +        break;
> +    }
> +
> +    if ( !vaddrs )
> +    {
> +        ASSERT_UNREACHABLE();
> +        rc =3D -EINVAL;
> +        goto out;
> +    }
> +
> +    for ( i =3D 0; i < nr_frames; ++i )
> +        mfn_list[i] =3D virt_to_mfn(vaddrs[frame + i]);
> +
> + out:
> +    grant_write_unlock(gt);
> +
> +    return rc;
> +}
> +
>  int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, =
mfn_t *mfn)
>  {
>      int rc =3D 0;
> @@ -4047,33 +4122,6 @@ int gnttab_map_frame(struct domain *d, unsigned =
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
> index 1bab0e80c2..177fc378d9 100644
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
> @@ -1099,8 +1061,8 @@ static int acquire_resource(
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



