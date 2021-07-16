Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519B3CB2DA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 08:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157036.289832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Hdl-0001xq-04; Fri, 16 Jul 2021 06:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157036.289832; Fri, 16 Jul 2021 06:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Hdk-0001vR-SW; Fri, 16 Jul 2021 06:48:04 +0000
Received: by outflank-mailman (input) for mailman id 157036;
 Fri, 16 Jul 2021 06:48:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CyKe=MI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m4Hdj-0001vL-Ea
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 06:48:03 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5462847-dac3-497f-ad08-c76478c2cdf4;
 Fri, 16 Jul 2021 06:48:01 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6A4781FE78;
 Fri, 16 Jul 2021 06:48:00 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3D9CE13357;
 Fri, 16 Jul 2021 06:48:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nZMuDKAr8WCjRQAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 16 Jul 2021 06:48:00 +0000
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
X-Inumbo-ID: e5462847-dac3-497f-ad08-c76478c2cdf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1626418080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuSCFj0HLKiDL6B5nZAmC6sccbjLsD/lms7yNPDhfLI=;
	b=jLVBBd0wkFwVVFAHX+IKb8M1Qz0nvXmaL36tPhi5IUhf/IyjhEIiERwX4+LQ0fEH9rI2OV
	8Dgg2KxrBfq3pNk64RvWhBXeHnxkenZDWM3A2cCmaJHAHWsBIDZDTKN3UmG8lFFxvkeip8
	V6ptpoDBPDwfBIkvIzbrNFhFC2GsAFI=
Subject: Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20210702142944.1698-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
Date: Fri, 16 Jul 2021 08:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702142944.1698-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="D1QEOYA3CJOVjGDG6SEiaroVJh0aEYbGN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D1QEOYA3CJOVjGDG6SEiaroVJh0aEYbGN
Content-Type: multipart/mixed; boundary="ny1gN91qbXXbYYL295902lUUTDGenPpQL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Message-ID: <b871c368-0e9b-20d4-ad18-55c5d8be881e@suse.com>
Subject: Re: [PATCH-4.15] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
References: <20210702142944.1698-1-jgross@suse.com>
In-Reply-To: <20210702142944.1698-1-jgross@suse.com>

--ny1gN91qbXXbYYL295902lUUTDGenPpQL
Content-Type: multipart/mixed;
 boundary="------------5A87F5F0F20AC31707ECC2F4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5A87F5F0F20AC31707ECC2F4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ping?

On 02.07.21 16:29, Juergen Gross wrote:
> The core of a pv linux guest produced via "xl dump-core" is not usable
> as since kernel 4.14 only the linear p2m table is kept if Xen indicates=

> it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
> supporting the 3-level p2m tree only.
>=20
> Fix that by copying the functionality of map_p2m() from libxenguest to
> libxenctrl.
>=20
> Additionally the mapped p2m isn't of a fixed length now, so the
> interface to the mapping functions needs to be adapted. In order not to=

> add even more parameters, expand struct domain_info_context and use a
> pointer to that as a parameter.
>=20
> This is a backport of upstream commit bd7a29c3d0b937ab542a.
>=20
> As the original patch includes a modification of a data structure
> passed via pointer to a library function, the related function in the
> library is renamed in order to be able to spot any external users of
> that function. Note that it is extremely unlikely any such users
> outside the Xen git tree are existing, so the risk to break any
> existing programs is very unlikely. In case such a user is existing,
> changing the name of xc_map_domain_meminfo() will at least avoid
> silent breakage.
>=20
> Fixes: dc6d60937121 ("libxc: set flag for support of linear p2m list in=
 domain builder")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/include/xenguest.h      |   2 +
>   tools/libs/ctrl/xc_core.c     |   5 +-
>   tools/libs/ctrl/xc_core.h     |   8 +-
>   tools/libs/ctrl/xc_core_arm.c |  23 +--
>   tools/libs/ctrl/xc_core_x86.c | 256 ++++++++++++++++++++++++++++-----=
-
>   tools/libs/ctrl/xc_private.h  |   1 +
>   tools/libs/guest/xg_domain.c  |  17 +--
>   7 files changed, 234 insertions(+), 78 deletions(-)
>=20
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 217022b6e7..36a26deba4 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -700,8 +700,10 @@ struct xc_domain_meminfo {
>       xen_pfn_t *pfn_type;
>       xen_pfn_t *p2m_table;
>       unsigned long p2m_size;
> +    unsigned int p2m_frames;
>   };
>  =20
> +#define xc_map_domain_meminfo xc_map_domain_meminfo_mod
>   int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
>                             struct xc_domain_meminfo *minfo);
>  =20
> diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/ctrl/xc_core.c
> index b47ab2f6d8..9576bec5a3 100644
> --- a/tools/libs/ctrl/xc_core.c
> +++ b/tools/libs/ctrl/xc_core.c
> @@ -574,8 +574,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
>               goto out;
>           }
>  =20
> -        sts =3D xc_core_arch_map_p2m(xch, dinfo->guest_width, &info, l=
ive_shinfo,
> -                                   &p2m, &dinfo->p2m_size);
> +        sts =3D xc_core_arch_map_p2m(xch, dinfo, &info, live_shinfo, &=
p2m);
>           if ( sts !=3D 0 )
>               goto out;
>  =20
> @@ -945,7 +944,7 @@ out:
>       if ( memory_map !=3D NULL )
>           free(memory_map);
>       if ( p2m !=3D NULL )
> -        munmap(p2m, PAGE_SIZE * P2M_FL_ENTRIES);
> +        munmap(p2m, PAGE_SIZE * dinfo->p2m_frames);
>       if ( p2m_array !=3D NULL )
>           free(p2m_array);
>       if ( pfn_array !=3D NULL )
> diff --git a/tools/libs/ctrl/xc_core.h b/tools/libs/ctrl/xc_core.h
> index 36fb755da2..8ea1f93a10 100644
> --- a/tools/libs/ctrl/xc_core.h
> +++ b/tools/libs/ctrl/xc_core.h
> @@ -138,14 +138,14 @@ int xc_core_arch_memory_map_get(xc_interface *xch=
,
>                                   xc_dominfo_t *info, shared_info_any_t=
 *live_shinfo,
>                                   xc_core_memory_map_t **mapp,
>                                   unsigned int *nr_entries);
> -int xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width,
> +int xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context=
 *dinfo,
>                            xc_dominfo_t *info, shared_info_any_t *live_=
shinfo,
> -                         xen_pfn_t **live_p2m, unsigned long *pfnp);
> +                         xen_pfn_t **live_p2m);
>  =20
> -int xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int gues=
t_width,
> +int xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_inf=
o_context *dinfo,
>                                     xc_dominfo_t *info,
>                                     shared_info_any_t *live_shinfo,
> -                                  xen_pfn_t **live_p2m, unsigned long =
*pfnp);
> +                                  xen_pfn_t **live_p2m);
>  =20
>   int xc_core_arch_get_scratch_gpfn(xc_interface *xch, uint32_t domid,
>                                     xen_pfn_t *gpfn);
> diff --git a/tools/libs/ctrl/xc_core_arm.c b/tools/libs/ctrl/xc_core_ar=
m.c
> index 7b587b4cc5..93765a565f 100644
> --- a/tools/libs/ctrl/xc_core_arm.c
> +++ b/tools/libs/ctrl/xc_core_arm.c
> @@ -66,33 +66,24 @@ xc_core_arch_memory_map_get(xc_interface *xch, stru=
ct xc_core_arch_context *unus
>  =20
>   static int
>   xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context=
 *dinfo, xc_dominfo_t *info,
> -                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m,
> -                        unsigned long *pfnp, int rw)
> +                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m, int rw)
>   {
>       errno =3D ENOSYS;
>       return -1;
>   }
>  =20
>   int
> -xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width, xc_d=
ominfo_t *info,
> -                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m,
> -                        unsigned long *pfnp)
> +xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *di=
nfo, xc_dominfo_t *info,
> +                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m)
>   {
> -    struct domain_info_context _dinfo =3D { .guest_width =3D guest_wid=
th };
> -    struct domain_info_context *dinfo =3D &_dinfo;
> -    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
> -                                   live_shinfo, live_p2m, pfnp, 0);
> +    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live=
_p2m, 0);
>   }
>  =20
>   int
> -xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int guest_wi=
dth, xc_dominfo_t *info,
> -                              shared_info_any_t *live_shinfo, xen_pfn_=
t **live_p2m,
> -                              unsigned long *pfnp)
> +xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_co=
ntext *dinfo, xc_dominfo_t *info,
> +                              shared_info_any_t *live_shinfo, xen_pfn_=
t **live_p2m)
>   {
> -    struct domain_info_context _dinfo =3D { .guest_width =3D guest_wid=
th };
> -    struct domain_info_context *dinfo =3D &_dinfo;
> -    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
> -                                   live_shinfo, live_p2m, pfnp, 1);
> +    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live=
_p2m, 1);
>   }
>  =20
>   int
> diff --git a/tools/libs/ctrl/xc_core_x86.c b/tools/libs/ctrl/xc_core_x8=
6.c
> index cb76e6207b..c8f71d4b75 100644
> --- a/tools/libs/ctrl/xc_core_x86.c
> +++ b/tools/libs/ctrl/xc_core_x86.c
> @@ -17,6 +17,7 @@
>    *
>    */
>  =20
> +#include <inttypes.h>
>   #include "xc_private.h"
>   #include "xc_core.h"
>   #include <xen/hvm/e820.h>
> @@ -65,34 +66,169 @@ xc_core_arch_memory_map_get(xc_interface *xch, str=
uct xc_core_arch_context *unus
>       return 0;
>   }
>  =20
> -static int
> -xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context =
*dinfo, xc_dominfo_t *info,
> -                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m,
> -                        unsigned long *pfnp, int rw)
> +static inline bool is_canonical_address(uint64_t vaddr)
>   {
> -    /* Double and single indirect references to the live P2M table */
> -    xen_pfn_t *live_p2m_frame_list_list =3D NULL;
> -    xen_pfn_t *live_p2m_frame_list =3D NULL;
> -    /* Copies of the above. */
> -    xen_pfn_t *p2m_frame_list_list =3D NULL;
> -    xen_pfn_t *p2m_frame_list =3D NULL;
> +    return ((int64_t)vaddr >> 47) =3D=3D ((int64_t)vaddr >> 63);
> +}
>  =20
> -    uint32_t dom =3D info->domid;
> -    int ret =3D -1;
> -    int err;
> -    int i;
> +/* Virtual address ranges reserved for hypervisor. */
> +#define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
> +#define HYPERVISOR_VIRT_END_X86_64   0xFFFF87FFFFFFFFFFULL
>  =20
> -    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
> +#define HYPERVISOR_VIRT_START_X86_32 0x00000000F5800000ULL
> +#define HYPERVISOR_VIRT_END_X86_32   0x00000000FFFFFFFFULL
> +
> +static xen_pfn_t *
> +xc_core_arch_map_p2m_list_rw(xc_interface *xch, struct domain_info_con=
text *dinfo,
> +                             uint32_t dom, shared_info_any_t *live_shi=
nfo,
> +                             uint64_t p2m_cr3)
> +{
> +    uint64_t p2m_vaddr, p2m_end, mask, off;
> +    xen_pfn_t p2m_mfn, mfn, saved_mfn, max_pfn;
> +    uint64_t *ptes =3D NULL;
> +    xen_pfn_t *mfns =3D NULL;
> +    unsigned int fpp, n_pages, level, n_levels, shift,
> +                 idx_start, idx_end, idx, saved_idx;
> +
> +    p2m_vaddr =3D GET_FIELD(live_shinfo, arch.p2m_vaddr, dinfo->guest_=
width);
> +    fpp =3D PAGE_SIZE / dinfo->guest_width;
> +    dinfo->p2m_frames =3D (dinfo->p2m_size - 1) / fpp + 1;
> +    p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE - 1;
> +
> +    if ( dinfo->guest_width =3D=3D 8 )
>       {
> -        ERROR("Could not get maximum GPFN!");
> -        goto out;
> +        mask =3D 0x0000ffffffffffffULL;
> +        n_levels =3D 4;
> +        p2m_mfn =3D p2m_cr3 >> 12;
> +        if ( !is_canonical_address(p2m_vaddr) ||
> +             !is_canonical_address(p2m_end) ||
> +             p2m_end < p2m_vaddr ||
> +             (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_64 &&
> +              p2m_end > HYPERVISOR_VIRT_START_X86_64) )
> +        {
> +            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx=
64,
> +                  p2m_vaddr, p2m_end);
> +            errno =3D ERANGE;
> +            goto out;
> +        }
> +    }
> +    else
> +    {
> +        mask =3D 0x00000000ffffffffULL;
> +        n_levels =3D 3;
> +        if ( p2m_cr3 & ~mask )
> +            p2m_mfn =3D ~0UL;
> +        else
> +            p2m_mfn =3D (uint32_t)((p2m_cr3 >> 12) | (p2m_cr3 << 20));=

> +        if ( p2m_vaddr > mask || p2m_end > mask || p2m_end < p2m_vaddr=
 ||
> +             (p2m_vaddr <=3D HYPERVISOR_VIRT_END_X86_32 &&
> +              p2m_end > HYPERVISOR_VIRT_START_X86_32) )
> +        {
> +            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx=
64,
> +                  p2m_vaddr, p2m_end);
> +            errno =3D ERANGE;
> +            goto out;
> +        }
>       }
>  =20
> -    if ( dinfo->p2m_size < info->nr_pages  )
> +    mfns =3D malloc(sizeof(*mfns));
> +    if ( !mfns )
>       {
> -        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, in=
fo->nr_pages - 1);
> +        ERROR("Cannot allocate memory for array of %u mfns", 1);
>           goto out;
>       }
> +    mfns[0] =3D p2m_mfn;
> +    off =3D 0;
> +    saved_mfn =3D 0;
> +    idx_start =3D idx_end =3D saved_idx =3D 0;
> +
> +    for ( level =3D n_levels; level > 0; level-- )
> +    {
> +        n_pages =3D idx_end - idx_start + 1;
> +        ptes =3D xc_map_foreign_pages(xch, dom, PROT_READ, mfns, n_pag=
es);
> +        if ( !ptes )
> +        {
> +            PERROR("Failed to map %u page table pages for p2m list", n=
_pages);
> +            goto out;
> +        }
> +        free(mfns);
> +
> +        shift =3D level * 9 + 3;
> +        idx_start =3D ((p2m_vaddr - off) & mask) >> shift;
> +        idx_end =3D ((p2m_end - off) & mask) >> shift;
> +        idx =3D idx_end - idx_start + 1;
> +        mfns =3D malloc(sizeof(*mfns) * idx);
> +        if ( !mfns )
> +        {
> +            ERROR("Cannot allocate memory for array of %u mfns", idx);=

> +            goto out;
> +        }
> +
> +        for ( idx =3D idx_start; idx <=3D idx_end; idx++ )
> +        {
> +            mfn =3D (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;=

> +            if ( mfn =3D=3D 0 )
> +            {
> +                ERROR("Bad mfn %#lx during page table walk for vaddr %=
#" PRIx64 " at level %d of p2m list",
> +                      mfn, off + ((uint64_t)idx << shift), level);
> +                errno =3D ERANGE;
> +                goto out;
> +            }
> +            mfns[idx - idx_start] =3D mfn;
> +
> +            /* Maximum pfn check at level 2. Same reasoning as for p2m=
 tree. */
> +            if ( level =3D=3D 2 )
> +            {
> +                if ( mfn !=3D saved_mfn )
> +                {
> +                    saved_mfn =3D mfn;
> +                    saved_idx =3D idx - idx_start;
> +                }
> +            }
> +        }
> +
> +        if ( level =3D=3D 2 )
> +        {
> +            if ( saved_idx =3D=3D idx_end )
> +                saved_idx++;
> +            max_pfn =3D ((xen_pfn_t)saved_idx << 9) * fpp;
> +            if ( max_pfn < dinfo->p2m_size )
> +            {
> +                dinfo->p2m_size =3D max_pfn;
> +                dinfo->p2m_frames =3D (dinfo->p2m_size + fpp - 1) / fp=
p;
> +                p2m_end =3D p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE =
- 1;
> +                idx_end =3D idx_start + saved_idx;
> +            }
> +        }
> +
> +        munmap(ptes, n_pages * PAGE_SIZE);
> +        ptes =3D NULL;
> +        off =3D p2m_vaddr & ((mask >> shift) << shift);
> +    }
> +
> +    return mfns;
> +
> + out:
> +    free(mfns);
> +    if ( ptes )
> +        munmap(ptes, n_pages * PAGE_SIZE);
> +
> +    return NULL;
> +}
> +
> +static xen_pfn_t *
> +xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_con=
text *dinfo,
> +                             uint32_t dom, shared_info_any_t *live_shi=
nfo)
> +{
> +    /* Double and single indirect references to the live P2M table */
> +    xen_pfn_t *live_p2m_frame_list_list;
> +    xen_pfn_t *live_p2m_frame_list =3D NULL;
> +    /* Copies of the above. */
> +    xen_pfn_t *p2m_frame_list_list =3D NULL;
> +    xen_pfn_t *p2m_frame_list;
> +
> +    int err;
> +    int i;
>  =20
>       live_p2m_frame_list_list =3D
>           xc_map_foreign_range(xch, dom, PAGE_SIZE, PROT_READ,
> @@ -151,10 +287,60 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct=
 domain_info_context *dinfo, xc
>           for ( i =3D P2M_FL_ENTRIES - 1; i >=3D 0; i-- )
>               p2m_frame_list[i] =3D ((uint32_t *)p2m_frame_list)[i];
>  =20
> +    dinfo->p2m_frames =3D P2M_FL_ENTRIES;
> +
> +    return p2m_frame_list;
> +
> + out:
> +    err =3D errno;
> +
> +    if ( live_p2m_frame_list_list )
> +        munmap(live_p2m_frame_list_list, PAGE_SIZE);
> +
> +    if ( live_p2m_frame_list )
> +        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
> +
> +    free(p2m_frame_list_list);
> +
> +    errno =3D err;
> +
> +    return NULL;
> +}
> +
> +static int
> +xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context =
*dinfo, xc_dominfo_t *info,
> +                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m, int rw)
> +{
> +    xen_pfn_t *p2m_frame_list =3D NULL;
> +    uint64_t p2m_cr3;
> +    uint32_t dom =3D info->domid;
> +    int ret =3D -1;
> +    int err;
> +
> +    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
> +    {
> +        ERROR("Could not get maximum GPFN!");
> +        goto out;
> +    }
> +
> +    if ( dinfo->p2m_size < info->nr_pages  )
> +    {
> +        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, in=
fo->nr_pages - 1);
> +        goto out;
> +    }
> +
> +    p2m_cr3 =3D GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_widt=
h);
> +
> +    p2m_frame_list =3D p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, din=
fo, dom, live_shinfo, p2m_cr3)
> +                             : xc_core_arch_map_p2m_tree_rw(xch, dinfo=
, dom, live_shinfo);
> +
> +    if ( !p2m_frame_list )
> +        goto out;
> +
>       *live_p2m =3D xc_map_foreign_pages(xch, dom,
>                                       rw ? (PROT_READ | PROT_WRITE) : P=
ROT_READ,
>                                       p2m_frame_list,
> -                                    P2M_FL_ENTRIES);
> +                                    dinfo->p2m_frames);
>  =20
>       if ( !*live_p2m )
>       {
> @@ -162,21 +348,11 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct=
 domain_info_context *dinfo, xc
>           goto out;
>       }
>  =20
> -    *pfnp =3D dinfo->p2m_size;
> -
>       ret =3D 0;
>  =20
>   out:
>       err =3D errno;
>  =20
> -    if ( live_p2m_frame_list_list )
> -        munmap(live_p2m_frame_list_list, PAGE_SIZE);
> -
> -    if ( live_p2m_frame_list )
> -        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
> -
> -    free(p2m_frame_list_list);
> -
>       free(p2m_frame_list);
>  =20
>       errno =3D err;
> @@ -184,25 +360,17 @@ out:
>   }
>  =20
>   int
> -xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width, xc_d=
ominfo_t *info,
> -                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m,
> -                        unsigned long *pfnp)
> +xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *di=
nfo, xc_dominfo_t *info,
> +                        shared_info_any_t *live_shinfo, xen_pfn_t **li=
ve_p2m)
>   {
> -    struct domain_info_context _dinfo =3D { .guest_width =3D guest_wid=
th };
> -    struct domain_info_context *dinfo =3D &_dinfo;
> -    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
> -                                   live_shinfo, live_p2m, pfnp, 0);
> +    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live=
_p2m, 0);
>   }
>  =20
>   int
> -xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int guest_wi=
dth, xc_dominfo_t *info,
> -                              shared_info_any_t *live_shinfo, xen_pfn_=
t **live_p2m,
> -                              unsigned long *pfnp)
> +xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_co=
ntext *dinfo, xc_dominfo_t *info,
> +                              shared_info_any_t *live_shinfo, xen_pfn_=
t **live_p2m)
>   {
> -    struct domain_info_context _dinfo =3D { .guest_width =3D guest_wid=
th };
> -    struct domain_info_context *dinfo =3D &_dinfo;
> -    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
> -                                   live_shinfo, live_p2m, pfnp, 1);
> +    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live=
_p2m, 1);
>   }
>  =20
>   int
> diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.=
h
> index f0b5f83ac8..8ebc0b59da 100644
> --- a/tools/libs/ctrl/xc_private.h
> +++ b/tools/libs/ctrl/xc_private.h
> @@ -79,6 +79,7 @@ struct iovec {
>  =20
>   struct domain_info_context {
>       unsigned int guest_width;
> +    unsigned int p2m_frames;
>       unsigned long p2m_size;
>   };
>  =20
> diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.=
c
> index 5019c84e0e..dd7db2cbd8 100644
> --- a/tools/libs/guest/xg_domain.c
> +++ b/tools/libs/guest/xg_domain.c
> @@ -24,13 +24,9 @@
>  =20
>   int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_memin=
fo *minfo)
>   {
> -    struct domain_info_context _di =3D { .guest_width =3D minfo->guest=
_width,
> -                                       .p2m_size =3D minfo->p2m_size};=

> -    struct domain_info_context *dinfo =3D &_di;
> -
>       free(minfo->pfn_type);
>       if ( minfo->p2m_table )
> -        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
> +        munmap(minfo->p2m_table, minfo->p2m_frames * PAGE_SIZE);
>       minfo->p2m_table =3D NULL;
>  =20
>       return 0;
> @@ -40,7 +36,6 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t=
 domid,
>                             struct xc_domain_meminfo *minfo)
>   {
>       struct domain_info_context _di;
> -    struct domain_info_context *dinfo =3D &_di;
>  =20
>       xc_dominfo_t info;
>       shared_info_any_t *live_shinfo;
> @@ -96,16 +91,16 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32=
_t domid,
>           return -1;
>       }
>  =20
> -    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,=

> -                                       live_shinfo, &minfo->p2m_table,=

> -                                       &minfo->p2m_size) )
> +    if ( xc_core_arch_map_p2m_writable(xch, &_di, &info,
> +                                       live_shinfo, &minfo->p2m_table)=
 )
>       {
>           PERROR("Could not map the P2M table");
>           munmap(live_shinfo, PAGE_SIZE);
>           return -1;
>       }
>       munmap(live_shinfo, PAGE_SIZE);
> -    _di.p2m_size =3D minfo->p2m_size;
> +    minfo->p2m_size =3D _di.p2m_size;
> +    minfo->p2m_frames =3D _di.p2m_frames;
>  =20
>       /* Make space and prepare for getting the PFN types */
>       minfo->pfn_type =3D calloc(sizeof(*minfo->pfn_type), minfo->p2m_s=
ize);
> @@ -141,7 +136,7 @@ failed:
>       }
>       if ( minfo->p2m_table )
>       {
> -        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
> +        munmap(minfo->p2m_table, minfo->p2m_frames * PAGE_SIZE);
>           minfo->p2m_table =3D NULL;
>       }
>  =20
>=20


--------------5A87F5F0F20AC31707ECC2F4
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5A87F5F0F20AC31707ECC2F4--

--ny1gN91qbXXbYYL295902lUUTDGenPpQL--

--D1QEOYA3CJOVjGDG6SEiaroVJh0aEYbGN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDxK58FAwAAAAAACgkQsN6d1ii/Ey//
uwf9HoHHe5824V8rhQUmeAj5ogoXxBQ3QPJMyxVMK45H34Vbvi1mn3uoTVNsvLux8QZnOeAVsu7a
XflY+Ipjehlja6PnHSWmkrlCmQKou1GnLs0XMiaSea2W702Ph/3wk8jmIV86ZhDi6JN4MsZTsLzB
ueO9AO/PFCVvepFGZ2x7xuRTQ+Ek9xDZzDtk2589Xzl0J3eWXslrFF2jj3rmG8RiO8kb3L7vzQfd
aOJ+24nIL4LhbiTY9lEsKDfAnDbz/SsreKI4PIPFWjrKW76VBQV6wP8L6ZtR3LwiBNsUpMTVXEWh
EUx0qcqjwKplvKKYnWdYkodoKwYykNBTk+snQX/pcg==
=ZSej
-----END PGP SIGNATURE-----

--D1QEOYA3CJOVjGDG6SEiaroVJh0aEYbGN--

