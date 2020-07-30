Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F046232EBC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 10:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k143A-0000R3-Vu; Thu, 30 Jul 2020 08:36:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gz/s=BJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1438-0000Qy-O7
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 08:36:26 +0000
X-Inumbo-ID: c0ca213c-d23f-11ea-8d1c-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0ca213c-d23f-11ea-8d1c-bc764e2007e4;
 Thu, 30 Jul 2020 08:36:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q76so4198377wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 01:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=lrWz9GohPCP+KkZeOmNoHCKzgKvkGS2JUwGp7tx/H9A=;
 b=dfS2F0rleBnQvMPbEbqZus0Aacym8oJFeszkDNu4jzclxOt84lrM1/IGUUBbw1MUlV
 L9qmssxHFon1KPzHunfQnhYecJU47d7C8av6RO/HaKFQFx+S/RYH4dYitapIPAtt/9cc
 8uF5UU50ZFLze6vFKcHjuaUbcruEvK7WCc+bT55wXdaLUBB0xsYb3N4Gtz17x9fR56Ff
 vhdAmj1OZgF6n5VquYE/0XTA0YLZ4eDAF1vEYyBmH40w3ChcuaxSBvyG6UMg4tDb6bo1
 uUO+owuqAgsEZNs0AxHzzKagsKYSIH7p5meU09un76u4xYhYJVf3PUXr30yEOZ7QSFEA
 Ga0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=lrWz9GohPCP+KkZeOmNoHCKzgKvkGS2JUwGp7tx/H9A=;
 b=ocolpPSKNpcmQGpOj4Ssol3jBsqSicZ5+O9BTriGmFiGF6dB+hAcyVBbObXiTiqo06
 6HUsmJSn790KTEdB+Ib/194OWJs8TWWpJsihXn4D8RxWqp36bCGVcmuIumHCXVL/CmVL
 k1ZyAGH1QR1UsRkY41tKy6NS1j/CpfgotT73Tf2ONxKuNKGBZxbbEtlgBNzysoeJIgk2
 IHyp1ed9DQ0w7y7eLXEQ0nkdNoASkcTTZ8lVCapUQE6M+mgCbUsIrsNTRju0TQcgHddM
 wXwO6udgyeYCCa5NKMHF+B7kWnvMO5rRASrGXH5yiIqDPptWUhzh/V1ZearSQYYm3DAY
 FQLw==
X-Gm-Message-State: AOAM533bxkMN7S74ucrYHlFnPT9E9JbK/ArVJKc4vavAyKkKl0y0hOKr
 Lq09lW0oGTqrYSnLWwIwCgw=
X-Google-Smtp-Source: ABdhPJyqdbBGNiTqnqcTDhk+LJAVhAYv/+unGaOVBLbeGblJZJxOpu0KBL0D7lafmrAngSCN5n/nZQ==
X-Received: by 2002:a1c:b787:: with SMTP id h129mr4626243wmf.93.1596098184337; 
 Thu, 30 Jul 2020 01:36:24 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 31sm8937764wrj.94.2020.07.30.01.36.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 01:36:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
In-Reply-To: <20200728113712.22966-5-andrew.cooper3@citrix.com>
Subject: RE: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
Date: Thu, 30 Jul 2020 09:31:10 +0100
Message-ID: <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQF6ExwjYkgZ+OK4ROtT1vtJIEnjiAEymWI6qc7ZiMA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Andrew Cooper
> Sent: 28 July 2020 12:37
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien
> Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; George
> Dunlap <George.Dunlap@eu.citrix.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; Paul Durrant
> <paul@xen.org>; Jan Beulich <JBeulich@suse.com>; Micha=C5=82 =
Leszczy=C5=84ski <michal.leszczynski@cert.pl>; Ian
> Jackson <ian.jackson@citrix.com>
> Subject: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
>=20
> Calling XENMEM_acquire_resource with a NULL frame_list is a request =
for the
> size of the resource, but the returned 32 is bogus.
>=20
> If someone tries to follow it for XENMEM_resource_ioreq_server, the =
acquire
> call will fail as IOREQ servers currently top out at 2 frames, and it =
is only
> half the size of the default grant table limit for guests.
>=20
> Also, no users actually request a resource size, because it was never =
wired up
> in the sole implemenation of resource aquisition in Linux.
>=20
> Introduce a new resource_max_frames() to calculate the size of a =
resource, and
> implement it the IOREQ and grant subsystems.
>=20
> It is impossible to guarentee that a mapping call following a =
successful size

s/guarantee/guarantee

> call will succedd (e.g. The target IOREQ server gets destroyed, or the =
domain

s/succedd/succeed

> switches from grant v2 to v1).  Document the restriction, and use the
> flexibility to simplify the paths to be lockless.
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
>  xen/arch/x86/mm.c             | 20 ++++++++++++++++
>  xen/common/grant_table.c      | 19 +++++++++++++++
>  xen/common/memory.c           | 55 =
+++++++++++++++++++++++++++++++++----------
>  xen/include/asm-x86/mm.h      |  3 +++
>  xen/include/public/memory.h   | 16 +++++++++----
>  xen/include/xen/grant_table.h |  8 +++++++
>  xen/include/xen/mm.h          |  6 +++++
>  7 files changed, 110 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 82bc676553..f73a90a2ab 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4600,6 +4600,26 @@ int xenmem_add_to_physmap_one(
>      return rc;
>  }
>=20
> +unsigned int arch_resource_max_frames(
> +    struct domain *d, unsigned int type, unsigned int id)
> +{
> +    unsigned int nr =3D 0;
> +
> +    switch ( type )
> +    {
> +#ifdef CONFIG_HVM
> +    case XENMEM_resource_ioreq_server:
> +        if ( !is_hvm_domain(d) )
> +            break;
> +        /* One frame for the buf-ioreq ring, and one frame per 128 =
vcpus. */
> +        nr =3D 1 + DIV_ROUND_UP(d->max_vcpus * sizeof(struct ioreq), =
PAGE_SIZE);
> +        break;
> +#endif
> +    }
> +
> +    return nr;
> +}
> +
>  int arch_acquire_resource(struct domain *d, unsigned int type,
>                            unsigned int id, unsigned long frame,
>                            unsigned int nr_frames, xen_pfn_t =
mfn_list[])
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 122d1e7596..0962fc7169 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,25 @@ static int gnttab_get_shared_frame_mfn(struct =
domain *d,
>      return 0;
>  }
>=20
> +unsigned int gnttab_resource_max_frames(struct domain *d, unsigned =
int id)
> +{
> +    unsigned int nr =3D 0;
> +
> +    /* Don't need the grant lock.  This limit is fixed at domain =
create time. */
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        nr =3D d->grant_table->max_grant_frames;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        nr =3D =
grant_to_status_frames(d->grant_table->max_grant_frames);

Two uses of d->grant_table, so perhaps define a stack variable for it? =
Also, should you not make sure 0 is returned in the case of a v1 table?

> +        break;
> +    }
> +
> +    return nr;
> +}
> +
>  int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index dc3a7248e3..21edabf9cc 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1007,6 +1007,26 @@ static long xatp_permission_check(struct domain =
*d, unsigned int space)
>      return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>  }
>=20
> +/*
> + * Return 0 on any kind of error.  Caller converts to -EINVAL.
> + *
> + * All nonzero values should be repeatable (i.e. derived from some =
fixed
> + * proerty of the domain), and describe the full resource (i.e. =
mapping the

s/property/property

> + * result of this call will be the entire resource).

This precludes dynamically adding a resource to a running domain. Do we =
really want to bake in that restriction?

> + */
> +static unsigned int resource_max_frames(struct domain *d,
> +                                        unsigned int type, unsigned =
int id)
> +{
> +    switch ( type )
> +    {
> +    case XENMEM_resource_grant_table:
> +        return gnttab_resource_max_frames(d, id);
> +
> +    default:
> +        return arch_resource_max_frames(d, type, id);
> +    }
> +}
> +
>  static int acquire_resource(
>      XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
>  {
> @@ -1018,6 +1038,7 @@ static int acquire_resource(
>       * use-cases then per-CPU arrays or heap allocations may be =
required.
>       */
>      xen_pfn_t mfn_list[32];
> +    unsigned int max_frames;
>      int rc;
>=20
>      if ( copy_from_guest(&xmar, arg, 1) )
> @@ -1026,19 +1047,6 @@ static int acquire_resource(
>      if ( xmar.pad !=3D 0 )
>          return -EINVAL;
>=20
> -    if ( guest_handle_is_null(xmar.frame_list) )
> -    {
> -        if ( xmar.nr_frames )
> -            return -EINVAL;
> -
> -        xmar.nr_frames =3D ARRAY_SIZE(mfn_list);
> -
> -        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
> -            return -EFAULT;
> -
> -        return 0;
> -    }
> -
>      if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
>          return -E2BIG;
>=20
> @@ -1050,6 +1058,27 @@ static int acquire_resource(
>      if ( rc )
>          goto out;
>=20
> +    max_frames =3D resource_max_frames(d, xmar.type, xmar.id);
> +
> +    rc =3D -EINVAL;
> +    if ( !max_frames )
> +        goto out;
> +
> +    if ( guest_handle_is_null(xmar.frame_list) )
> +    {
> +        if ( xmar.nr_frames )
> +            goto out;
> +
> +        xmar.nr_frames =3D max_frames;
> +
> +        rc =3D -EFAULT;
> +        if ( __copy_field_to_guest(arg, &xmar, nr_frames) )
> +            goto out;
> +
> +        rc =3D 0;
> +        goto out;
> +    }
> +
>      switch ( xmar.type )
>      {
>      case XENMEM_resource_grant_table:
> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
> index 7e74996053..b0caf372a8 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -649,6 +649,9 @@ static inline bool arch_mfn_in_directmap(unsigned =
long mfn)
>      return mfn <=3D (virt_to_mfn(eva - 1) + 1);
>  }
>=20
> +unsigned int arch_resource_max_frames(struct domain *d,
> +                                      unsigned int type, unsigned int =
id);
> +
>  int arch_acquire_resource(struct domain *d, unsigned int type,
>                            unsigned int id, unsigned long frame,
>                            unsigned int nr_frames, xen_pfn_t =
mfn_list[]);
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 21057ed78e..cea88cf40c 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -639,10 +639,18 @@ struct xen_mem_acquire_resource {
>  #define XENMEM_resource_grant_table_id_status 1
>=20
>      /*
> -     * IN/OUT - As an IN parameter number of frames of the resource
> -     *          to be mapped. However, if the specified value is 0 =
and
> -     *          frame_list is NULL then this field will be set to the
> -     *          maximum value supported by the implementation on =
return.
> +     * IN/OUT
> +     *
> +     * As an IN parameter number of frames of the resource to be =
mapped.
> +     *
> +     * When frame_list is NULL and nr_frames is 0, this is =
interpreted as a
> +     * request for the size of the resource, which shall be returned =
in the
> +     * nr_frames field.
> +     *
> +     * The size of a resource will never be zero, but a nonzero =
result doesn't
> +     * guarentee that a subsequent mapping request will be =
successful.  There

s/guarantee/guarantee

  Paul

> +     * are further type/id specific constraints which may change =
between the
> +     * two calls.
>       */
>      uint32_t nr_frames;
>      uint32_t pad;
> diff --git a/xen/include/xen/grant_table.h =
b/xen/include/xen/grant_table.h
> index 5a2c75b880..bae4d79623 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -57,6 +57,8 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, =
grant_ref_t ref,
>  int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn,
>                       mfn_t *mfn);
>=20
> +unsigned int gnttab_resource_max_frames(struct domain *d, unsigned =
int id);
> +
>  int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[]);
> @@ -93,6 +95,12 @@ static inline int gnttab_map_frame(struct domain =
*d, unsigned long idx,
>      return -EINVAL;
>  }
>=20
> +static inline unsigned int gnttab_resource_max_frames(
> +    struct domain *d, unsigned int id)
> +{
> +    return 0;
> +}
> +
>  static inline int gnttab_acquire_resource(
>      struct domain *d, unsigned int id, unsigned long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 1b2c1f6b32..c184dc1db1 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -686,6 +686,12 @@ static inline void put_page_alloc_ref(struct =
page_info *page)
>  }
>=20
>  #ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
> +static inline unsigned int arch_resource_max_frames(
> +    struct domain *d, unsigned int type, unsigned int id)
> +{
> +    return 0;
> +}
> +
>  static inline int arch_acquire_resource(
>      struct domain *d, unsigned int type, unsigned int id, unsigned =
long frame,
>      unsigned int nr_frames, xen_pfn_t mfn_list[])
> --
> 2.11.0
>=20



