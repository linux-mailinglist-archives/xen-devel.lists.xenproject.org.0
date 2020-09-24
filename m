Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61F276E6E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOIm-0003oM-NH; Thu, 24 Sep 2020 10:16:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLOIk-0003oF-UH
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:16:35 +0000
X-Inumbo-ID: cd3df1ab-2e0e-4d08-aa3e-273f86f2617c
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd3df1ab-2e0e-4d08-aa3e-273f86f2617c;
 Thu, 24 Sep 2020 10:16:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so2924254wmh.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 03:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=XlG5xS4hFNglQJmo3fHjYYCkVp7IV+ZixoHdwh4p5mM=;
 b=WIHEqPVrYGdw8a579qHGeDAyWdRYM6BuGe3iwK71qtxem6gmDg4UNWL60u1Be2h2d0
 bKmFgJa1skePgEZXU7m7ktK0qzjozaeLstMEOg+yCwMDSSzAeO0jOcZpAmFAe3tKNpCk
 rLI4PJVMuQyGb74H9HHViI7i97rh2d9fUCk+J82rW3Z8mP4D7PtOz7M0D1fegF/FcCiG
 SXcDIbFjlSO0ybo1zNrp7xh5TzFxkx88gY586+p9Se93ejZcsnBP8as43ABzjwznM467
 7cPCUl7k/XZERJ+idbbqiE269PqQmx/lIx1O8pjvEIdbuuEYLU4A+b4tHlrCKtrox0ha
 5kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=XlG5xS4hFNglQJmo3fHjYYCkVp7IV+ZixoHdwh4p5mM=;
 b=V8eicRZ3+0znrkjJEjd3XymvIi7PuYSWT6SsqfRGPnAwYh6HGK6T0C/+xF5XXImYe0
 26MIU+z5ta/by8B9YDIJdM3yr9rvK4nj3nrLhD5i3qiMUdrcSD4EVxcwQWb+UCbRmTWb
 KqHeQLrt1DP4oToKMNLpoWSGvuaED6Jayao1WjqLAWpFD9yQEpg0KfonvyRowUFIhOAg
 40rTNeFLQn2dHekDyU9oABo8bnRo83t80BixXuR88ThD9YVM9jDC7mjlBR1UbwwW05+D
 TexqL9XxcbfbkTYJC6jIav9pFhtM7CesQiEqPD3FKftvHd8+ruASV0ZxnMszoR4cT13C
 S46Q==
X-Gm-Message-State: AOAM5323S82Z2DDp35hDXN/Mw6HTmBfAnc8piC5Nu9+ueNdUTCwdnmgQ
 NJ39fYIHVUvjSZ+g5RA8fho=
X-Google-Smtp-Source: ABdhPJy9KpdrBwVwxCBybME8DqRLgGkn6Dy3QAh1bC5N8FX9TqZmBDXwK2ySRjVlXAiODp0/RQpnug==
X-Received: by 2002:a05:600c:214e:: with SMTP id
 v14mr4172660wml.118.1600942592174; 
 Thu, 24 Sep 2020 03:16:32 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id l3sm2882092wmh.27.2020.09.24.03.16.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 03:16:31 -0700 (PDT)
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
 <20200922182444.12350-8-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-8-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 07/11] xen/memory: Improve compat
 XENMEM_acquire_resource handling
Date: Thu, 24 Sep 2020 11:16:30 +0100
Message-ID: <003e01d6925b$c5e9c740$51bd55c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyAKngR3IqQRqFKA=
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
> Subject: [PATCH v2 07/11] xen/memory: Improve compat =
XENMEM_acquire_resource handling
>=20
> The frame_list is an input, or an output, depending on whether the =
calling
> domain is translated or not.  The array does not need marshalling in =
both
> directions.
>=20
> Furthermore, the copy-in loop was very inefficient, copying 4 bytes at =
at
> time.  Rewrite it to copy in all nr_frames at once, and then expand
> compat_pfn_t to xen_pfn_t in place.
>=20
> Re-position the copy-in loop to simplify continuation support in a =
future
> patch, and reduce the scope of certain variables.
>=20
> No change in guest observed behaviour.
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
>  xen/common/compat/memory.c | 65 =
++++++++++++++++++++++++++++------------------
>  1 file changed, 40 insertions(+), 25 deletions(-)
>=20
> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
> index ed92e05b08..834c5e19d1 100644
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -55,6 +55,8 @@ static int get_reserved_device_memory(xen_pfn_t =
start, xen_ulong_t nr,
>=20
>  int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) =
compat)
>  {
> +    struct vcpu *curr =3D current;
> +    struct domain *currd =3D curr->domain;
>      int split, op =3D cmd & MEMOP_CMD_MASK;
>      long rc;
>      unsigned int start_extent =3D cmd >> MEMOP_EXTENT_SHIFT;
> @@ -399,7 +401,7 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>=20
>          case XENMEM_acquire_resource:
>          {
> -            xen_pfn_t *xen_frame_list;
> +            xen_pfn_t *xen_frame_list =3D NULL;
>              unsigned int max_nr_frames;
>=20
>              if ( copy_from_guest(&cmp.mar, compat, 1) )
> @@ -417,28 +419,10 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>              if ( cmp.mar.nr_frames > max_nr_frames )
>                  return -E2BIG;
>=20
> -            if ( compat_handle_is_null(cmp.mar.frame_list) )
> -                xen_frame_list =3D NULL;
> -            else
> -            {
> +            /* Marshal the frame list in the remainder of the xlat =
space. */
> +            if ( !compat_handle_is_null(cmp.mar.frame_list) )
>                  xen_frame_list =3D (xen_pfn_t *)(nat.mar + 1);
>=20
> -                if ( !compat_handle_okay(cmp.mar.frame_list,
> -                                         cmp.mar.nr_frames) )
> -                    return -EFAULT;
> -
> -                for ( i =3D 0; i < cmp.mar.nr_frames; i++ )
> -                {
> -                    compat_pfn_t frame;
> -
> -                    if ( __copy_from_compat_offset(
> -                             &frame, cmp.mar.frame_list, i, 1) )
> -                        return -EFAULT;
> -
> -                    xen_frame_list[i] =3D frame;
> -                }
> -            }
> -
>  #define XLAT_mem_acquire_resource_HNDL_frame_list(_d_, _s_) \
>              set_xen_guest_handle((_d_)->frame_list, xen_frame_list)
>=20
> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>=20
>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>=20
> +            if ( xen_frame_list && cmp.mar.nr_frames )
> +            {
> +                /*
> +                 * frame_list is an input for translated guests, and =
an output
> +                 * for untranslated guests.  Only copy in for =
translated guests.
> +                 */
> +                if ( paging_mode_translate(currd) )
> +                {
> +                    compat_pfn_t *compat_frame_list =3D (void =
*)xen_frame_list;
> +
> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
> +                                             cmp.mar.nr_frames) ||
> +                         __copy_from_compat_offset(
> +                             compat_frame_list, cmp.mar.frame_list,
> +                             0, cmp.mar.nr_frames) )
> +                        return -EFAULT;
> +
> +                    /*
> +                     * Iterate backwards over compat_frame_list[] =
expanding
> +                     * compat_pfn_t to xen_pfn_t in place.
> +                     */
> +                    for ( int x =3D cmp.mar.nr_frames - 1; x >=3D 0; =
--x )

I know it is legal c99 but personally I still dislike declarations like =
this, and I've not seen one elsewhere in the Xen code. But I'm not the =
maintainer, so...

Reviewed-by: Paul Durrant <paul@xen.org>

> +                        xen_frame_list[x] =3D compat_frame_list[x];
> +                }
> +            }
>              break;
>          }
>          default:
> @@ -590,8 +599,6 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>=20
>          case XENMEM_acquire_resource:
>          {
> -            const xen_pfn_t *xen_frame_list =3D (xen_pfn_t *)(nat.mar =
+ 1);
> -            compat_pfn_t *compat_frame_list =3D (compat_pfn_t =
*)(nat.mar + 1);
>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
>=20
>              if ( compat_handle_is_null(cmp.mar.frame_list) )
> @@ -601,9 +608,18 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                                             =
compat_mem_acquire_resource_t),
>                           nat.mar, nr_frames) )
>                      return -EFAULT;
> +                break;
>              }
> -            else
> +
> +            /*
> +             * frame_list is an input for translated guests, and an =
output for
> +             * untranslated guests.  Only copy out for untranslated =
guests.
> +             */
> +            if ( !paging_mode_translate(currd) )
>              {
> +                const xen_pfn_t *xen_frame_list =3D (xen_pfn_t =
*)(nat.mar + 1);
> +                compat_pfn_t *compat_frame_list =3D (compat_pfn_t =
*)(nat.mar + 1);
> +
>                  /*
>                   * NOTE: the smaller compat array overwrites the =
native
>                   *       array.
> @@ -625,7 +641,6 @@ int compat_memory_op(unsigned int cmd, =
XEN_GUEST_HANDLE_PARAM(void) compat)
>                                               cmp.mar.nr_frames) )
>                      return -EFAULT;
>              }
> -
>              break;
>          }
>=20
> --
> 2.11.0



