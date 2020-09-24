Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A2276EFD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOn4-00071L-4C; Thu, 24 Sep 2020 10:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLOn2-00071E-La
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:47:52 +0000
X-Inumbo-ID: 434a6460-af67-42d0-9988-21651d3b0a54
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 434a6460-af67-42d0-9988-21651d3b0a54;
 Thu, 24 Sep 2020 10:47:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so3038404wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=iNll3D5dGwAEE/ocC0LlyI424nsPmqVj/NO8w8FekYA=;
 b=K4/HUNkyG5e1ztK7gdfDU/r9SAavXq3xU9r5/HI75XIsoJjFKN6l9aWlUwJyHonvT8
 ygWddbt+iBzNkOeDwRysPPldKxy9TXe2uPnwn0BglJ1VOlt/CdyIo+QVlv7EM71z9YHT
 3I260jvY4hjLN+Zz+Nq5cvI+kTENm8yIWsEXED9Z9T+VRrECZrp2AP6/eM4ByZscI91y
 NhPgxSvxv1i/NGOGgsSNYboOItWXt6b+nd/Q05uYFkf4/gf6cIL0J1MiqSJS/15TIAXj
 3hWxrNWHxApGYAbrCEPVUQXR8eHa9BG28zV3uAyBDtWzP2VyXuc6jD1yJwUGNu8jbqaY
 jkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=iNll3D5dGwAEE/ocC0LlyI424nsPmqVj/NO8w8FekYA=;
 b=PHokatlMcekE5vBUC1Ez2NZSgZY1FsmUA5n457jGsmuVhtKWRw1e9rEZnXQJWXHCVe
 LzmDs3YtQthpuc7F2ZTT+DGaGexVBz1QN/tclr4Im9ngecX1JnfQY/RYFH+Oe7XBgnLD
 eJjLhxIErQNJwr4MC7ZUW6hWjt5J6x4c4sDEPCwkuiyeE32Ji2j82U5pYMrxC/TMhdOd
 nGi9n5jc1K9yEzcmUSsG5WRcJiBruu5KZgwZ+PrrGe81VwNhlspZSk7zuXASkLvFJ4Dc
 JlPpEIPWHlWqlRBaWIn7N3U/tTXSQCa2xI+pbIKOaUdNt9aFCJx/pfvFfj3JWXRCC3b+
 Mp1Q==
X-Gm-Message-State: AOAM532iPPpnWTsIxTK8iS6Q3pPQ4A4de0S1GKChpevwWUc8UQs/nap5
 ifKx3smpl4xHJMBxfaITBf8=
X-Google-Smtp-Source: ABdhPJwjRP7df9/fK6zgzbB+6uuXcNxHYzZGHZReVsfPZ9f05a/El7czp+ARihszos1+zpWC4p83Fg==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr4091757wmc.73.1600944469040; 
 Thu, 24 Sep 2020 03:47:49 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id w14sm3004711wrk.95.2020.09.24.03.47.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 03:47:48 -0700 (PDT)
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
 <20200922182444.12350-10-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-10-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
Date: Thu, 24 Sep 2020 11:47:47 +0100
Message-ID: <007a01d69260$248a2fc0$6d9e8f40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyALaoSEkqQLVJ2A=
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
> Subject: [PATCH v2 09/11] xen/memory: Fix mapping grant tables with =
XENMEM_acquire_resource
>=20
> A guests default number of grant frames is 64, and =
XENMEM_acquire_resource

Nit: s/guests/guest's

> will reject an attempt to map more than 32 frames.  This limit is =
caused by
> the size of mfn_list[] on the stack.
>=20
> Fix mapping of arbitrary size requests by looping over batches of 32 =
in
> acquire_resource(), and using hypercall continuations when necessary.
>=20
> To start with, break _acquire_resource() out of acquire_resource() to =
cope
> with type-specific dispatching, and update the return semantics to =
indicate
> the number of mfns returned.  Update gnttab_acquire_resource() and =
x86's
> arch_acquire_resource() to match these new semantics.
>=20
> Have do_memory_op() pass start_extent into acquire_resource() so it =
can pick
> up where it left off after a continuation, and loop over batches of 32 =
until
> all the work is done, or a continuation needs to occur.
>=20
> compat_memory_op() is a bit more complicated, because it also has to =
marshal
> frame_list in the XLAT buffer.  Have it account for continuation =
information
> itself and hide details from the upper layer, so it can marshal the =
buffer in
> chunks if necessary.
>=20
> With these fixes in place, it is now possible to map the whole grant =
table for
> a guest.
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
> ---
>  xen/arch/x86/mm.c          |   4 +-
>  xen/common/compat/memory.c |  96 =
++++++++++++++++++++++++++++++--------
>  xen/common/grant_table.c   |   3 ++
>  xen/common/memory.c        | 114 =
++++++++++++++++++++++++++++++++++-----------
>  4 files changed, 168 insertions(+), 49 deletions(-)
>=20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e82307bdae..8628f51402 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4632,7 +4632,6 @@ int arch_acquire_resource(struct domain *d, =
unsigned int type,
>          if ( id !=3D (unsigned int)ioservid )
>              break;
>=20
> -        rc =3D 0;
>          for ( i =3D 0; i < nr_frames; i++ )
>          {
>              mfn_t mfn;
> @@ -4643,6 +4642,9 @@ int arch_acquire_resource(struct domain *d, =
unsigned int type,
>=20
>              mfn_list[i] =3D mfn_x(mfn);
>          }
> +        if ( i =3D=3D nr_frames )
> +            /* Success.  Passed nr_frames back to the caller. */

Nit: s/passed/pass

> +            rc =3D nr_frames;
>          break;
>      }
>  #endif
> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
> index 834c5e19d1..17619f26ed 100644
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -402,23 +402,10 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>          case XENMEM_acquire_resource:
>          {
>              xen_pfn_t *xen_frame_list =3D NULL;
> -            unsigned int max_nr_frames;
>=20
>              if ( copy_from_guest(&cmp.mar, compat, 1) )
>                  return -EFAULT;
>=20
> -            /*
> -             * The number of frames handled is currently limited to a
> -             * small number by the underlying implementation, so the
> -             * scratch space should be sufficient for bouncing the
> -             * frame addresses.
> -             */
> -            max_nr_frames =3D (COMPAT_ARG_XLAT_SIZE - =
sizeof(*nat.mar)) /
> -                sizeof(*xen_frame_list);
> -
> -            if ( cmp.mar.nr_frames > max_nr_frames )
> -                return -E2BIG;
> -
>              /* Marshal the frame list in the remainder of the xlat =
space. */
>              if ( !compat_handle_is_null(cmp.mar.frame_list) )
>                  xen_frame_list =3D (xen_pfn_t *)(nat.mar + 1);
> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>=20
>              if ( xen_frame_list && cmp.mar.nr_frames )
>              {
> +                unsigned int xlat_max_frames =3D
> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> +                    sizeof(*xen_frame_list);
> +
> +                if ( start_extent >=3D nat.mar->nr_frames )
> +                    return -EINVAL;
> +
> +                /*
> +                 * Adjust nat to account for work done on previous
> +                 * continuations, leaving cmp pristine.  Hide the =
continaution
> +                 * from the native code to prevent double accounting.
> +                 */
> +                nat.mar->nr_frames -=3D start_extent;
> +                nat.mar->frame +=3D start_extent;
> +                cmd &=3D MEMOP_CMD_MASK;
> +
> +                /*
> +                 * If there are two many frames to fit within the =
xlat buffer,
> +                 * we'll need to loop to marshal them all.
> +                 */
> +                nat.mar->nr_frames =3D min(nat.mar->nr_frames, =
xlat_max_frames);
> +
>                  /*
>                   * frame_list is an input for translated guests, and =
an output
>                   * for untranslated guests.  Only copy in for =
translated guests.
> @@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                                               cmp.mar.nr_frames) ||
>                           __copy_from_compat_offset(
>                               compat_frame_list, cmp.mar.frame_list,
> -                             0, cmp.mar.nr_frames) )
> +                             start_extent, nat.mar->nr_frames) )
>                          return -EFAULT;
>=20
>                      /*
>                       * Iterate backwards over compat_frame_list[] =
expanding
>                       * compat_pfn_t to xen_pfn_t in place.
>                       */
> -                    for ( int x =3D cmp.mar.nr_frames - 1; x >=3D 0; =
--x )
> +                    for ( int x =3D nat.mar->nr_frames - 1; x >=3D 0; =
--x )
>                          xen_frame_list[x] =3D compat_frame_list[x];
>                  }
>              }
> @@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>          case XENMEM_acquire_resource:
>          {
>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
> +            unsigned int done;
>=20
>              if ( compat_handle_is_null(cmp.mar.frame_list) )
>              {
> +                ASSERT(split =3D=3D 0 && rc =3D=3D 0);
>                  if ( __copy_field_to_guest(
>                           guest_handle_cast(compat,
>                                             =
compat_mem_acquire_resource_t),
> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                  break;
>              }
>=20
> +            if ( split < 0 )
> +            {
> +                /* Contintuation occured. */
> +                ASSERT(rc !=3D XENMEM_acquire_resource);

Do you mean "op !=3D" here?

> +                done =3D cmd >> MEMOP_EXTENT_SHIFT;
> +            }
> +            else
> +            {
> +                /* No continuation. */
> +                ASSERT(rc =3D=3D 0);

"!rc" for consistency with other code perhaps?

> +                done =3D nat.mar->nr_frames;
> +            }
> +
> +            ASSERT(done <=3D nat.mar->nr_frames);
> +
>              /*
>               * frame_list is an input for translated guests, and an =
output for
>               * untranslated guests.  Only copy out for untranslated =
guests.
> @@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                   */
>                  BUILD_BUG_ON(sizeof(compat_pfn_t) > =
sizeof(xen_pfn_t));
>=20
> -                for ( i =3D 0; i < cmp.mar.nr_frames; i++ )
> +                for ( i =3D 0; i < done; i++ )
>                  {
>                      compat_pfn_t frame =3D xen_frame_list[i];
>=20
> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                      compat_frame_list[i] =3D frame;
>                  }
>=20
> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
> -                                             compat_frame_list,
> -                                             cmp.mar.nr_frames) )
> +                if ( __copy_to_compat_offset(
> +                         cmp.mar.frame_list, start_extent,
> +                         compat_frame_list, done) )
>                      return -EFAULT;
>              }
> -            break;
> +
> +            start_extent +=3D done;
> +
> +            /* Completely done. */
> +            if ( start_extent =3D=3D cmp.mar.nr_frames )
> +                break;
> +
> +            /*
> +             * Done a "full" batch, but we were limited by space in =
the xlat
> +             * area.  Go around the loop again without necesserily =
returning
> +             * to guest context.
> +             */
> +            if ( done =3D=3D nat.mar->nr_frames )
> +            {
> +                split =3D 1;
> +                break;
> +            }
> +
> +            /* Explicit continuation request from a higher level. */
> +            if ( done < nat.mar->nr_frames )
> +                return hypercall_create_continuation(
> +                    __HYPERVISOR_memory_op, "ih",
> +                    op | (start_extent << MEMOP_EXTENT_SHIFT), =
compat);
> +
> +            /*
> +             * Well... Somethings gone wrong with the two levels of =
chunking.
> +             * My condolences to whomever next has to debug this =
mess.
> +             */
> +            ASSERT_UNREACHABLE();
> +            goto crash;
>          }
>=20
>          default:
> +        crash:
>              domain_crash(current->domain);
>              split =3D 0;
>              break;
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 8c401a5540..81db47f8fd 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4105,6 +4105,9 @@ int gnttab_acquire_resource(
>      for ( i =3D 0; i < nr_frames; ++i )
>          mfn_list[i] =3D virt_to_mfn(vaddrs[frame + i]);
>=20
> +    /* Success.  Passed nr_frames back to the caller. */
> +    rc =3D nr_frames;
> +
>   out:
>      grant_write_unlock(gt);
>=20
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 369154b7c0..ec276cb9b1 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1027,17 +1027,31 @@ static unsigned int resource_max_frames(struct =
domain *d,
>      }
>  }
>=20
> +/*
> + * Returns -errno on error, or positive in the range [1, nr_frames] =
on
> + * success.  Returning less than nr_frames contitutes a request for a
> + * continuation.
> + */
> +static int _acquire_resource(
> +    struct domain *d, unsigned int type, unsigned int id, unsigned =
long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    switch ( type )
> +    {
> +    case XENMEM_resource_grant_table:
> +        return gnttab_acquire_resource(d, id, frame, nr_frames, =
mfn_list);
> +
> +    default:
> +        return arch_acquire_resource(d, type, id, frame, nr_frames, =
mfn_list);
> +    }
> +}
> +
>  static int acquire_resource(
> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> +    unsigned long start_extent)
>  {
>      struct domain *d, *currd =3D current->domain;
>      xen_mem_acquire_resource_t xmar;
> -    /*
> -     * The mfn_list and gfn_list (below) arrays are ok on stack for =
the
> -     * moment since they are small, but if they need to grow in =
future
> -     * use-cases then per-CPU arrays or heap allocations may be =
required.
> -     */
> -    xen_pfn_t mfn_list[32];
>      unsigned int max_frames;
>      int rc;
>=20
> @@ -1055,9 +1069,6 @@ static int acquire_resource(
>      if ( xmar.pad !=3D 0 )
>          return -EINVAL;
>=20
> -    if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> -        return -E2BIG;
> -
>      rc =3D rcu_lock_remote_domain_by_id(xmar.domid, &d);
>      if ( rc )
>          return rc;
> @@ -1074,7 +1085,7 @@ static int acquire_resource(
>=20
>      if ( guest_handle_is_null(xmar.frame_list) )
>      {
> -        if ( xmar.nr_frames )
> +        if ( xmar.nr_frames || start_extent )
>              goto out;
>=20
>          xmar.nr_frames =3D max_frames;
> @@ -1087,26 +1098,47 @@ static int acquire_resource(
>          goto out;
>      }
>=20
> +    /*
> +     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't =
ideal.  If
> +     * it ever becomes a practical problem, we can switch to mutating
> +     * xmar.{frame,nr_frames,frame_list} in guest memory.
> +     */
> +    rc =3D -EINVAL;
> +    if ( start_extent >=3D xmar.nr_frames ||
> +         xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
> +        goto out;
> +
> +    /* Adjust for work done on previous continuations. */
> +    xmar.nr_frames -=3D start_extent;
> +    xmar.frame +=3D start_extent;
> +    guest_handle_add_offset(xmar.frame_list, start_extent);
> +
>      do {
> -        switch ( xmar.type )
> -        {
> -        case XENMEM_resource_grant_table:
> -            rc =3D gnttab_acquire_resource(d, xmar.id, xmar.frame, =
xmar.nr_frames,
> -                                         mfn_list);
> -            break;
> +        /*
> +         * Arbitrary size.  Not too much stack space, and a =
reasonable stride
> +         * for continutation checks.
> +         */
> +        xen_pfn_t mfn_list[32];
> +        unsigned int todo =3D MIN(ARRAY_SIZE(mfn_list), =
xmar.nr_frames), done;
>=20
> -        default:
> -            rc =3D arch_acquire_resource(d, xmar.type, xmar.id, =
xmar.frame,
> -                                       xmar.nr_frames, mfn_list);
> -            break;
> -        }
> +        rc =3D _acquire_resource(d, xmar.type, xmar.id, xmar.frame,
> +                               todo, mfn_list);
> +        if ( rc < 0 )
> +            goto out;
>=20
> -        if ( rc )
> +        done =3D rc;
> +        rc =3D 0;
> +        if ( done =3D=3D 0 || done > todo )
> +        {
> +            ASSERT_UNREACHABLE();
> +            rc =3D -EINVAL;
>              goto out;
> +        }
>=20
> +        /* Adjust guest frame_list appropriately. */
>          if ( !paging_mode_translate(currd) )
>          {
> -            if ( copy_to_guest(xmar.frame_list, mfn_list, =
xmar.nr_frames) )
> +            if ( copy_to_guest(xmar.frame_list, mfn_list, done) )
>                  rc =3D -EFAULT;
>          }
>          else
> @@ -1114,10 +1146,10 @@ static int acquire_resource(
>              xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
>              unsigned int i;
>=20
> -            if ( copy_from_guest(gfn_list, xmar.frame_list, =
xmar.nr_frames) )
> +            if ( copy_from_guest(gfn_list, xmar.frame_list, done) )
>                  rc =3D -EFAULT;
>=20
> -            for ( i =3D 0; !rc && i < xmar.nr_frames; i++ )
> +            for ( i =3D 0; !rc && i < done; i++ )
>              {
>                  rc =3D set_foreign_p2m_entry(currd, gfn_list[i],
>                                             _mfn(mfn_list[i]));
> @@ -1126,7 +1158,32 @@ static int acquire_resource(
>                      rc =3D -EIO;
>              }
>          }
> -    } while ( 0 );
> +
> +        if ( rc )
> +            goto out;
> +
> +        xmar.nr_frames -=3D done;
> +        xmar.frame +=3D done;
> +        guest_handle_add_offset(xmar.frame_list, done);
> +        start_extent +=3D done;
> +
> +        /*
> +         * Explicit contination request from _acquire_resource(), or =
we've
> +         * still got work to do other work is pending.

I think "still got work to do" or " other work is pending", not both?

  Paul

> +         */
> +        if ( done < todo ||
> +             (xmar.nr_frames && hypercall_preempt_check()) )
> +        {
> +            rc =3D hypercall_create_continuation(
> +                __HYPERVISOR_memory_op, "lh",
> +                XENMEM_acquire_resource | (start_extent << =
MEMOP_EXTENT_SHIFT),
> +                arg);
> +            goto out;
> +        }
> +
> +    } while ( xmar.nr_frames );
> +
> +    rc =3D 0;
>=20
>   out:
>      rcu_unlock_domain(d);
> @@ -1593,7 +1650,8 @@ long do_memory_op(unsigned long cmd, =
XEN_GUEST_HANDLE_PARAM(void) arg)
>=20
>      case XENMEM_acquire_resource:
>          rc =3D acquire_resource(
> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
> +            guest_handle_cast(arg, xen_mem_acquire_resource_t),
> +            start_extent);
>          break;
>=20
>      default:
> --
> 2.11.0



