Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58F2F9BCA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69477.124355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qeq-00049o-9T; Mon, 18 Jan 2021 09:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69477.124355; Mon, 18 Jan 2021 09:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qeq-00049O-5c; Mon, 18 Jan 2021 09:17:08 +0000
Received: by outflank-mailman (input) for mailman id 69477;
 Mon, 18 Jan 2021 09:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Qeo-00049J-Eh
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:17:06 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c35a5a43-1ca2-47ee-9d63-96f54e4406d3;
 Mon, 18 Jan 2021 09:17:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 190so12897871wmz.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:17:04 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id q2sm5211786wma.6.2021.01.18.01.17.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:17:03 -0800 (PST)
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
X-Inumbo-ID: c35a5a43-1ca2-47ee-9d63-96f54e4406d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=XUKccalUV5ZkdKfQu6KoyxQXRiYraFDMacnwKvFi/dw=;
        b=VKRCaVT6XCBkCcadUppOJrr1ezC4doAADxRsxKTVG3Himd0F4B2WqvnlFUk5n+OoRQ
         AkpS/ybpVR5kXyrR+xseilZHsrbCuBZSk7PTpLF+7YVEqB567+w1+No4ZpVWcn6RmKr5
         U+ynbPoNLQYHnqQ50elpFe9JemuYOz0o1grKOlvOdD4HUk7E7IBVaZ6U0pHo3il0Hk/H
         Rn+NxEKcTy9vKlrxP18DQKEO7U3AdPVWazotTx+0kRbePo90FCzxwvOFZMAcMrUl+KNN
         akJTJ0H6JRt4PYgnYHrs4Ve7aJnhCmwyKgbbxD8SiTNjn72zEFlW4memLFnm5YTUYyAl
         576w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=XUKccalUV5ZkdKfQu6KoyxQXRiYraFDMacnwKvFi/dw=;
        b=UIxYlbzNOFRRJOMv4RAZUVKx9oNHiOcOe/uZ3pypbl6mBs12PbZpYofezueswJ5ekH
         clw3Gjm9Lc8Dm67sSKdlEoLIO4ayOj6OruDoSmyIXopOURZQy1oSAAzWbwqVlJRFW+BJ
         zAUn0meEcXgRtYFCZKhgPC0OMlibhodXxac63sdITu/R7ZCMQm2/yKMhP/oeLOb/QvQx
         DSB2yr7A7ThFbq5GO6ygNR5sw3dJ9gR2RglO7yQPv/tHjy9QZd5ZbPm3niENk3YHRP/7
         nK/Pj3NGSzBdk4tZnGZnqIF4VUbhDyecx0qFXw0VHUV5elGLGKZdbrccpUjd2YyUiBXD
         j4wg==
X-Gm-Message-State: AOAM531pZlbkTnEiHnz3LclxCDjkXUFiuR8kTLwEd4J9qm7jrxbyIZI3
	8KbzTQQltF+IUYIuahax23w=
X-Google-Smtp-Source: ABdhPJzl0Oo6HEqK7LbqExWnyS+6K0SFnHyufqF9Ka5RKwt8GjoC6miDsL7FJywhu/Xdr8d6PLIQbA==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr19132749wmk.70.1610961423745;
        Mon, 18 Jan 2021 01:17:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Julien Grall'" <julien.grall@arm.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Daniel De Graaf'" <dgdegra@tycho.nsa.gov>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-10-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op handling common
Date: Mon, 18 Jan 2021 09:17:02 -0000
Message-ID: <00c301d6ed7a$aeeb5660$0cc20320$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQIOlNpDqO/v45A=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Julien Grall <julien.grall@arm.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; =
Julien Grall <julien@xen.org>;
> Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant =
<paul@xen.org>; Daniel De Graaf
> <dgdegra@tycho.nsa.gov>; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>
> Subject: [PATCH V4 09/24] xen/ioreq: Make x86's IOREQ related dm-op =
handling common
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves the IOREQ related dm-op handling to the common code.
>=20
> The idea is to have the top level dm-op handling arch-specific
> and call into ioreq_server_dm_op() for otherwise unhandled ops.
> Pros:
> - More natural than doing it other way around (top level dm-op
> handling common).
> - Leave compat_dm_op() in x86 code.
> Cons:
> - Code duplication. Both arches have to duplicate do_dm_op(), etc.
>=20
> Also update XSM code a bit to let dm-op be used on Arm.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> ***
> I decided to leave common dm.h to keep struct dmop_args declaration
> (to be included by Arm's dm.c), alternatively we could avoid
> introducing new header by moving the declaration into the existing
> header, but failed to find a suitable one which context would fit.
> ***
>=20
> Changes RFC -> V1:
>    - update XSM, related changes were pulled from:
>      [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for =
IOREQ/DM features
>=20
> Changes V1 -> V2:
>    - update the author of a patch
>    - update patch description
>    - introduce xen/dm.h and move definitions here
>=20
> Changes V2 -> V3:
>    - no changes
>=20
> Changes V3 -> V4:
>    - rework to have the top level dm-op handling arch-specific
>    - update patch subject/description, was "xen/dm: Make x86's DM =
feature common"
>    - make a few functions static in common ioreq.c
> ---
>  xen/arch/x86/hvm/dm.c   | 101 +-----------------------------------
>  xen/common/ioreq.c      | 135 =
++++++++++++++++++++++++++++++++++++++++++------
>  xen/include/xen/dm.h    |  39 ++++++++++++++
>  xen/include/xen/ioreq.h |  17 +-----
>  xen/include/xsm/dummy.h |   4 +-
>  xen/include/xsm/xsm.h   |   6 +--
>  xen/xsm/dummy.c         |   2 +-
>  xen/xsm/flask/hooks.c   |   5 +-
>  8 files changed, 171 insertions(+), 138 deletions(-)
>  create mode 100644 xen/include/xen/dm.h
>=20
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index d3e2a9e..dc8e47d 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -16,6 +16,7 @@
>=20
>  #include <xen/event.h>
>  #include <xen/guest_access.h>
> +#include <xen/dm.h>
>  #include <xen/hypercall.h>
>  #include <xen/ioreq.h>
>  #include <xen/nospec.h>
> @@ -29,13 +30,6 @@
>=20
>  #include <public/hvm/hvm_op.h>
>=20
> -struct dmop_args {
> -    domid_t domid;
> -    unsigned int nr_bufs;
> -    /* Reserve enough buf elements for all current hypercalls. */
> -    struct xen_dm_op_buf buf[2];
> -};
> -
>  static bool _raw_copy_from_guest_buf_offset(void *dst,
>                                              const struct dmop_args =
*args,
>                                              unsigned int buf_idx,
> @@ -408,71 +402,6 @@ static int dm_op(const struct dmop_args *op_args)
>=20
>      switch ( op.op )
>      {
> -    case XEN_DMOP_create_ioreq_server:
> -    {
> -        struct xen_dm_op_create_ioreq_server *data =3D
> -            &op.u.create_ioreq_server;
> -
> -        const_op =3D false;
> -
> -        rc =3D -EINVAL;
> -        if ( data->pad[0] || data->pad[1] || data->pad[2] )
> -            break;
> -
> -        rc =3D hvm_create_ioreq_server(d, data->handle_bufioreq,
> -                                     &data->id);
> -        break;
> -    }
> -
> -    case XEN_DMOP_get_ioreq_server_info:
> -    {
> -        struct xen_dm_op_get_ioreq_server_info *data =3D
> -            &op.u.get_ioreq_server_info;
> -        const uint16_t valid_flags =3D XEN_DMOP_no_gfns;
> -
> -        const_op =3D false;
> -
> -        rc =3D -EINVAL;
> -        if ( data->flags & ~valid_flags )
> -            break;
> -
> -        rc =3D hvm_get_ioreq_server_info(d, data->id,
> -                                       (data->flags & =
XEN_DMOP_no_gfns) ?
> -                                       NULL : &data->ioreq_gfn,
> -                                       (data->flags & =
XEN_DMOP_no_gfns) ?
> -                                       NULL : &data->bufioreq_gfn,
> -                                       &data->bufioreq_port);
> -        break;
> -    }
> -
> -    case XEN_DMOP_map_io_range_to_ioreq_server:
> -    {
> -        const struct xen_dm_op_ioreq_server_range *data =3D
> -            &op.u.map_io_range_to_ioreq_server;
> -
> -        rc =3D -EINVAL;
> -        if ( data->pad )
> -            break;
> -
> -        rc =3D hvm_map_io_range_to_ioreq_server(d, data->id, =
data->type,
> -                                              data->start, =
data->end);
> -        break;
> -    }
> -
> -    case XEN_DMOP_unmap_io_range_from_ioreq_server:
> -    {
> -        const struct xen_dm_op_ioreq_server_range *data =3D
> -            &op.u.unmap_io_range_from_ioreq_server;
> -
> -        rc =3D -EINVAL;
> -        if ( data->pad )
> -            break;
> -
> -        rc =3D hvm_unmap_io_range_from_ioreq_server(d, data->id, =
data->type,
> -                                                  data->start, =
data->end);
> -        break;
> -    }
> -
>      case XEN_DMOP_map_mem_type_to_ioreq_server:
>      {
>          struct xen_dm_op_map_mem_type_to_ioreq_server *data =3D
> @@ -523,32 +452,6 @@ static int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>=20
> -    case XEN_DMOP_set_ioreq_server_state:
> -    {
> -        const struct xen_dm_op_set_ioreq_server_state *data =3D
> -            &op.u.set_ioreq_server_state;
> -
> -        rc =3D -EINVAL;
> -        if ( data->pad )
> -            break;
> -
> -        rc =3D hvm_set_ioreq_server_state(d, data->id, =
!!data->enabled);
> -        break;
> -    }
> -
> -    case XEN_DMOP_destroy_ioreq_server:
> -    {
> -        const struct xen_dm_op_destroy_ioreq_server *data =3D
> -            &op.u.destroy_ioreq_server;
> -
> -        rc =3D -EINVAL;
> -        if ( data->pad )
> -            break;
> -
> -        rc =3D hvm_destroy_ioreq_server(d, data->id);
> -        break;
> -    }
> -
>      case XEN_DMOP_track_dirty_vram:
>      {
>          const struct xen_dm_op_track_dirty_vram *data =3D
> @@ -703,7 +606,7 @@ static int dm_op(const struct dmop_args *op_args)
>      }
>=20
>      default:
> -        rc =3D -EOPNOTSUPP;
> +        rc =3D ioreq_server_dm_op(&op, d, &const_op);
>          break;
>      }
>=20
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index a319c88..72b5da0 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -591,8 +591,8 @@ static void hvm_ioreq_server_deinit(struct =
ioreq_server *s)
>      put_domain(s->emulator);
>  }
>=20
> -int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
> -                            ioservid_t *id)
> +static int hvm_create_ioreq_server(struct domain *d, int =
bufioreq_handling,
> +                                   ioservid_t *id)

Would this not be a good opportunity to drop the 'hvm_' prefix (here and =
elsewhere)?

  Paul


