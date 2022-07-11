Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA75701CC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 14:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365069.595116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsHK-0000Nu-Uo; Mon, 11 Jul 2022 12:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365069.595116; Mon, 11 Jul 2022 12:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsHK-0000L6-Rz; Mon, 11 Jul 2022 12:12:42 +0000
Received: by outflank-mailman (input) for mailman id 365069;
 Mon, 11 Jul 2022 12:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZ7N=XQ=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oAsHI-0000L0-QS
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 12:12:41 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1c45128-0112-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 14:12:39 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id dn9so8465620ejc.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jul 2022 05:12:39 -0700 (PDT)
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
X-Inumbo-ID: c1c45128-0112-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nTRT+XvoLmZyFBS9ZT/hZlO9oFkjTu8ilUIyvvo4P5U=;
        b=e72/LW3C62xDZsxNAUCJngRk/D2pUS72363cHsdZWnHUo8TLyt24sognz47ExuJgyG
         VLiienT09YmWUueSzkiZniz67eI/cZbrXZ53ZNx53ZlBP0n3joud7ZAXXgE0Ah18qWS0
         s4vUBKTvxrhJzWrpwcZsC7sFkfNUR6aWeSeqH1TnQ0LVlXtU2JZWyF/RYY5wiiT9mWU9
         NR+Jj3zFvXRcAxjZr/s2ycGS8NUcbEPX3k2kUbf4MQZecG8iNQC7BM68MzHWfn5d+7Co
         YoTykfHh44G/uG/8XayDPycaA8xrE22A0gJEDJ/SFgMhZ6squcJ3udbWDqfiupbfgyh2
         /3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nTRT+XvoLmZyFBS9ZT/hZlO9oFkjTu8ilUIyvvo4P5U=;
        b=nVyZnjwnbdhoiFBCeE+W0KTPpPDDzOxRlfGAftNIhH3jZVsk8RmeU3Z80tMsBzI6WP
         NyFt7ix2xLWbl3JZq8MyOD95AZGa12NMjFr6bc0nwcxeqUR7UtHUwT/UNHheUHWO/9Wu
         pxuoIU2BfwbggnWuhAC+i+5L6DidvcS784GW2ZYgkWR3420T6BhrFK+g7o4PYTYiysZt
         p1LV5iqwH/C3c4EwrfvJKtH5mAnYoQ4HBtR+mEm/+yK+YSgiS1HEyfDNnwn+b9NkMcmN
         Pood0Re7lB/RE3g2kZcSnA3WVai60kYaLxrnWrATT3CmADbYjKNta2/SgpPh07IZxFH1
         w2DQ==
X-Gm-Message-State: AJIora9n3TpT/2OCxg00apaxMaHLUbVJrfHi1vF7k3pD5CRn30zzBg90
	XVbQVcU/G3iZWgYFBa4DVe8+/HQyVKm9470lP7X6X1B69qY=
X-Google-Smtp-Source: AGRyM1ueXzbRF75hXioHAVQ4PEaDlANe+MkONanAm8tQMA0Z09PolfEgkpA7PjJCDNW7fH+Rg8qSDnFTCMx5wXjZj60=
X-Received: by 2002:a17:906:dc8f:b0:725:28d1:422d with SMTP id
 cs15-20020a170906dc8f00b0072528d1422dmr17845553ejc.131.1657541558625; Mon, 11
 Jul 2022 05:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com> <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
In-Reply-To: <20f563b2-68e1-e429-f762-78474c566d04@suse.com>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Mon, 11 Jul 2022 15:12:27 +0300
Message-ID: <CACM97VWWz-L8XvJkAUmfU2cOTwu=Hhhu3=w9n9sbi2cSDJk5+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools: remove xenstore entries on vchan server closure
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Dmytro Semenets <dmytro_semenets@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 10:09, Juergen Gro=
ss <jgross@suse.com>:
>
> On 09.07.22 12:10, dmitry.semenets@gmail.com wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > vchan server creates XenStore entries to advertise its event channel an=
d
> > ring, but those are not removed after the server quits.
> > Add additional cleanup step, so those are removed, so clients do not tr=
y
> > to connect to a non-existing server.
> >
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> > ---
> >   tools/include/libxenvchan.h |  5 +++++
> >   tools/libs/vchan/init.c     | 23 +++++++++++++++++++++++
> >   tools/libs/vchan/io.c       |  4 ++++
> >   tools/libs/vchan/vchan.h    | 31 +++++++++++++++++++++++++++++++
> >   4 files changed, 63 insertions(+)
> >   create mode 100644 tools/libs/vchan/vchan.h
> >
> > diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
> > index d6010b145d..30cc73cf97 100644
> > --- a/tools/include/libxenvchan.h
> > +++ b/tools/include/libxenvchan.h
> > @@ -86,6 +86,11 @@ struct libxenvchan {
> >       int blocking:1;
> >       /* communication rings */
> >       struct libxenvchan_ring read, write;
> > +     /**
> > +      * Base xenstore path for storing ring/event data used by the ser=
ver
> > +      * during cleanup.
> > +      * */
> > +     char *xs_path;
> >   };
> >
> >   /**
> > diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> > index c8510e6ce9..c6b8674ef5 100644
> > --- a/tools/libs/vchan/init.c
> > +++ b/tools/libs/vchan/init.c
> > @@ -46,6 +46,8 @@
> >   #include <xen/sys/gntdev.h>
> >   #include <libxenvchan.h>
> >
> > +#include "vchan.h"
> > +
> >   #ifndef PAGE_SHIFT
> >   #define PAGE_SHIFT 12
> >   #endif
> > @@ -251,6 +253,10 @@ static int init_xs_srv(struct libxenvchan *ctrl, i=
nt domain, const char* xs_base
> >       char ref[16];
> >       char* domid_str =3D NULL;
> >       xs_transaction_t xs_trans =3D XBT_NULL;
> > +
> > +     // store the base path so we can clean up on server closure
>
> Please don't introduce new usages of the C++ comment style.
Most comments in this file are C++ style since libvchan introduced
>
> > +     ctrl->xs_path =3D strdup(xs_base);
>
> Return an error in case of strdup() failure?
>
> > +
> >       xs =3D xs_open(0);
> >       if (!xs)
> >               goto fail;
> > @@ -298,6 +304,23 @@ retry_transaction:
> >       return ret;
> >   }
> >
> > +void close_xs_srv(struct libxenvchan *ctrl)
> > +{
> > +     struct xs_handle *xs;
> > +
> > +     if (!ctrl->xs_path)
> > +             return;
> > +
> > +     xs =3D xs_open(0);
> > +     if (!xs)
> > +             goto fail;
> > +
> > +     xs_rm(xs, XBT_NULL, ctrl->xs_path);
>
> In this simple case I'd prefer
>
> if (xs)
>      xs_rm(xs, XBT_NULL, ctrl->xs_path);
>
> > +
> > +fail:
> > +     free(ctrl->xs_path);
>
> No xs_close()?
>
>
> Juergen

