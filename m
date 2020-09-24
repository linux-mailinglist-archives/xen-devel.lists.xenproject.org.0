Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F6276E2D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLO9I-0002Qz-9o; Thu, 24 Sep 2020 10:06:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLO9H-0002Qu-8w
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:06:47 +0000
X-Inumbo-ID: 62af37fd-f49f-4fc3-8c5a-2398e8195b5c
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62af37fd-f49f-4fc3-8c5a-2398e8195b5c;
 Thu, 24 Sep 2020 10:06:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so3158903wrt.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 03:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=qIENhfjqxBiI5QlG7ZY5YDBwQY5lCW+IF3ZzSo8UkJ0=;
 b=kmWNkzaq1lTue+8jivrcY0mUyQxOUV8+Pi2DKGD3E0Qm1j/bf0OoEy8IpH00McRdFj
 vUOFm47f5/0G01Mgc9YeiGYslx6CQ+HbfgKtr9jHK2oMyeYl3+cYu3Co4F4gsE3AXCJ6
 LzPfdF0h5/yoo/GZSen/XV+Q0OcJIG+hWbkET3z7VVFp19xQDeS5eTDvM2hPET17hF8G
 4DqM+ZMh4wmrAg5j2XETiPUuqdXALMU1YMOd/4LbMFkQhZCWkS3bIy6Kor8BwzgvAFiA
 1/Z8iLSt1X2DtQJQN3VGMyDarFjCtVIrvm7eyxKPfhmD7HWbU/aCu+i1c3/F5N9+ty7e
 e2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=qIENhfjqxBiI5QlG7ZY5YDBwQY5lCW+IF3ZzSo8UkJ0=;
 b=BC20GwJoz5cdAg2te75sqqNPk+FStMteI+fBjpQmmbBgBqZCcPGYbqd5/UIyNPNzhj
 2HxqMAqycYrOOXzE6uAjSHoyA+A3msagLxv7Ik526fqDpG8nIQ4YG5YI8BCm2XrMElCn
 bi61CfSKK2P3cTt+UESbgqtp6Y+f3gkd/n/xzA12vzCBNfcpfByHz0qd5te2QXI2MW2L
 0joI677z84qW39jylE/cAOUe5gUw7+bENKd6208CC0jh6qyS+M+kdyxF6BqdGnZYkTTW
 VXGb6v+o+Do0xCGHM8iC/FT+autM+MdTN2A0K4N+lDIpmNRyd1be6iyXCr/ot4II1hTX
 0anQ==
X-Gm-Message-State: AOAM530CmMaCs6ElNovh/cTrY5UOWq7zHpMMZkJPNimwBJskvqFh6hj4
 7178QopyYn9Uno+MNr7DWRI=
X-Google-Smtp-Source: ABdhPJyx9NXud0vFGJb8fyIfIF4dD0Pz5GjcPwVnIl/Ssgpr9HaZQuc5v+YjbwrNEaX+VnHYjpygNQ==
X-Received: by 2002:a5d:6552:: with SMTP id z18mr4147517wrv.32.1600942004870; 
 Thu, 24 Sep 2020 03:06:44 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id t4sm2968009wrr.26.2020.09.24.03.06.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 03:06:44 -0700 (PDT)
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
 <20200922182444.12350-5-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-5-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 04/11] xen/memory: Fix acquire_resource size semantics
Date: Thu, 24 Sep 2020 11:06:43 +0100
Message-ID: <003b01d6925a$67f9e2b0$37eda810$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyAFQUlblqQ8gF4A=
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
> Subject: [PATCH v2 04/11] xen/memory: Fix acquire_resource size =
semantics
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
> in the sole implementaion of resource acquisition in Linux.
>=20
> Introduce a new resource_max_frames() to calculate the size of a =
resource, and
> implement it the IOREQ and grant subsystems.
>=20
> It is impossible to guarantee that a mapping call following a =
successful size
> call will succeed (e.g. The target IOREQ server gets destroyed, or the =
domain
> switches from grant v2 to v1).  Document the restriction, and use the
> flexibility to simplify the paths to be lockless.
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
>  * Spelling fixes
>  * Add more local variables.
>  * Don't return any status frames on ARM where v2 support is compiled =
out.
> ---
>  xen/arch/x86/mm.c             | 20 ++++++++++++++++
>  xen/common/grant_table.c      | 23 ++++++++++++++++++
>  xen/common/memory.c           | 55 =
+++++++++++++++++++++++++++++++++----------
>  xen/include/asm-x86/mm.h      |  3 +++
>  xen/include/public/memory.h   | 16 +++++++++----
>  xen/include/xen/grant_table.h |  8 +++++++
>  xen/include/xen/mm.h          |  6 +++++
>  7 files changed, 114 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index d1cfc8fb4a..e82307bdae 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4591,6 +4591,26 @@ int xenmem_add_to_physmap_one(
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

The buf-ioreq ring is optional so a caller using this value may still =
get a resource acquisition failure unless the id is used to actually =
look up and check the ioreq server in question for the actual maximum. =
So this needs to call into a new function in ioreq.c.

  Paul

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
> index 912f07be47..8c401a5540 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,29 @@ static int gnttab_get_shared_frame_mfn(struct =
domain *d,
>      return 0;
>  }
>=20
> +unsigned int gnttab_resource_max_frames(struct domain *d, unsigned =
int id)
> +{
> +    const struct grant_table *gt =3D d->grant_table;
> +    unsigned int nr =3D 0;
> +
> +    /* Don't need the grant lock.  This limit is fixed at domain =
create time. */
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        nr =3D gt->max_grant_frames;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( GNTTAB_MAX_VERSION < 2 )
> +            break;
> +
> +        nr =3D grant_to_status_frames(gt->max_grant_frames);
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
> index 177fc378d9..c559935732 100644
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
> + * property of the domain), and describe the full resource (i.e. =
mapping the
> + * result of this call will be the entire resource).
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
>      /*
> @@ -1034,19 +1055,6 @@ static int acquire_resource(
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
> @@ -1058,6 +1066,27 @@ static int acquire_resource(
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
> index deeba75a1c..13977652a8 100644
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -639,6 +639,9 @@ static inline bool arch_mfn_in_directmap(unsigned =
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
> index 21d483298e..d7eb34f167 100644
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
> +     * guarantee that a subsequent mapping request will be =
successful.  There
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
> index 26a4a3d350..d686876b0e 100644
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



