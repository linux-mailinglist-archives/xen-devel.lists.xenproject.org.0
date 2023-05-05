Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C26F8625
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 17:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530491.826133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxek-0000dp-FN; Fri, 05 May 2023 15:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530491.826133; Fri, 05 May 2023 15:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puxek-0000an-C1; Fri, 05 May 2023 15:47:38 +0000
Received: by outflank-mailman (input) for mailman id 530491;
 Fri, 05 May 2023 15:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V+Y3=A2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1puxei-0000ah-JJ
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 15:47:36 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2701f279-eb5c-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 17:47:34 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965fc25f009so47886666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 08:47:34 -0700 (PDT)
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
X-Inumbo-ID: 2701f279-eb5c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683301654; x=1685893654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7a6OP2ZbfbLEcN+mCIl6WNnEQ1CS2Knx9ltqA+VoLI=;
        b=R1AvNbZqAwJlA3H0R1A+T2HPJ2Zj5UVscGVZpjfbImE5rGBM4MNxQhYvQIR+XVBrFn
         3m4JsqJAIFJxRw/njoLt56SrBW3FuBTSONMORidu89m3odaWR0ZIcYHieiQvRWUxj16H
         cVYSYp/X4VlUpXDksSCC5rIP4VRc3G1g7bQ+PVVNJ+iUO6eJ6nyaQWev6mscWktdNCaA
         hniLE82vr8l1yp1eOHHv6sEbJ2XSBjNtgr0XMSc+KdaSFBprcbOhltEnj2fWpp1ZXkJ2
         kFSOlt0thoskG2rshZF7ShIznTKAFqnX6qHwZzUmFCVKXF6r+18C0lX9X0P9L2jBJ4js
         mD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301654; x=1685893654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7a6OP2ZbfbLEcN+mCIl6WNnEQ1CS2Knx9ltqA+VoLI=;
        b=jMLjoD24EkK48/TuELAqmgeFl3O3Qi0eP0/H8g12GxDvSRFI8cQvQuq0zbPngvFW3T
         4prwYladS32JT19hKR/0HABE8RU7Mi1/jG48SnX76Y/kXe6+gv4q7L2Nlh43zpygs4Zy
         dUQFRuf148Qs2WU3n6KI2LnGZo2R3dl+eD1na58FSQEV2rk+JpRsQqh20g4+cYyetsxd
         p9TucxrrAurM36a4DIR2PdmeGt+3wo4JiXrWg3XbuI0bvH9CLOu/KFuCrLft9Dp9B5Fz
         n2Dzoiq8UtHNl/pen0xLUaP6aSs7udrF1FPW/18Kwj9QUSSgv8qhBClKuLPYb/W6J7ht
         0qFA==
X-Gm-Message-State: AC+VfDyoByORFVCyXUHK6wNnqtkjh4wTaxpxDYUD/A5Cb36jU2VGBblN
	NfmD2T8/hpsyFLN+N88cIBT4USo0Jp6jT9RYQ3g=
X-Google-Smtp-Source: ACHHUZ6hX1NVNdLDX3FwK5tK/XaAcUVGlrMRV5iFAyo2jjZU3aDo2vBO2rgQqXR/dKciAHCN22PumPlOGHa3zLVan2Q=
X-Received: by 2002:a17:906:dc92:b0:955:34a5:ae46 with SMTP id
 cs18-20020a170906dc9200b0095534a5ae46mr1654968ejc.77.1683301653862; Fri, 05
 May 2023 08:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230502143722.15613-1-jandryuk@gmail.com> <43162544.QFhiSxD2Za@silver>
In-Reply-To: <43162544.QFhiSxD2Za@silver>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 May 2023 11:47:22 -0400
Message-ID: <CAKf6xpsAYSd68jhCt7d603eDuLh5YJ9N8zihGBi9XvAZabNVwA@mail.gmail.com>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 6:05=E2=80=AFAM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> Hi Jason,
>
> as this is a Xen specific change, I would like Stefano or another Xen
> developer to take a look at it, just few things from my side ...
>
> On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> > xen_9pfs_free can't use gnttabdev since it is already closed and NULL-e=
d
>
> Where exactly does it do that access? A backtrace or another detailed com=
mit
> log description would help.

The segfault is down in the xen grant libraries during the free
callback.  The call stack is roughly:
xen_pv_del_xendev(struct XenLegacyDevice *xendev)
xen_9pfs_free() (->free() callback)
xen_be_unmap_grant_refs(&xen_9pdev->xendev, ...)
qemu_xen_gnttab_unmap(xendev->gnttabdev, ...)
xengnttab_unmap(xgt, ...) <- segfault.

The device went through the "disconnect" state before free() is
called, so xen_be_disconnect() already ran which did:
    if (xendev->gnttabdev) {
        qemu_xen_gnttab_close(xendev->gnttabdev);
        xendev->gnttabdev =3D NULL;
    }

gnttabdev being used by xengnttab_unmap().

> > out when free is called.  Do the teardown in _disconnect().  This
> > matches the setup done in _connect().
> >
> > trace-events are also added for the XenDevOps functions.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  hw/9pfs/trace-events     |  5 +++++
> >  hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
> >  2 files changed, 28 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
> > index 6c77966c0b..7b5b0b5a48 100644
> > --- a/hw/9pfs/trace-events
> > +++ b/hw/9pfs/trace-events
> > @@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) =
"tag %d id %d fid %d"
> >  v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d i=
d %d name %s"
> >  v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int=
32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64=
_t mtime_sec) "tag %u id %u fid %d iattr=3D{valid %d mode %d uid %d gid %d =
size %"PRId64" atime=3D%"PRId64" mtime=3D%"PRId64" }"
> >  v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
> > +
>
> Nit-picking; missing leading comment:
>
> # xen-9p-backend.c

Will do, thanks.

> > +xen_9pfs_alloc(char *name) "name %s"
> > +xen_9pfs_connect(char *name) "name %s"
> > +xen_9pfs_disconnect(char *name) "name %s"
> > +xen_9pfs_free(char *name) "name %s"
> > diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> > index 0e266c552b..c646a0b3d1 100644
> > --- a/hw/9pfs/xen-9p-backend.c
> > +++ b/hw/9pfs/xen-9p-backend.c
> > @@ -25,6 +25,8 @@
> >  #include "qemu/iov.h"
> >  #include "fsdev/qemu-fsdev.h"
> >
> > +#include "trace.h"
> > +
> >  #define VERSIONS "1"
> >  #define MAX_RINGS 8
> >  #define MAX_RING_ORDER 9
> > @@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDev=
ice *xendev)
> >      Xen9pfsDev *xen_9pdev =3D container_of(xendev, Xen9pfsDev, xendev)=
;
> >      int i;
> >
> > +    trace_xen_9pfs_disconnect(xendev->name);
> > +
> >      for (i =3D 0; i < xen_9pdev->num_rings; i++) {
> >          if (xen_9pdev->rings[i].evtchndev !=3D NULL) {
> >              qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i]=
.evtchndev),
> > @@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyD=
evice *xendev)
> >                                     xen_9pdev->rings[i].local_port);
> >              xen_9pdev->rings[i].evtchndev =3D NULL;
> >          }
> > -    }
> > -}
> > -
> > -static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> > -{
> > -    Xen9pfsDev *xen_9pdev =3D container_of(xendev, Xen9pfsDev, xendev)=
;
> > -    int i;
> > -
> > -    if (xen_9pdev->rings[0].evtchndev !=3D NULL) {
> > -        xen_9pfs_disconnect(xendev);
> > -    }
> > -
> > -    for (i =3D 0; i < xen_9pdev->num_rings; i++) {
> >          if (xen_9pdev->rings[i].data !=3D NULL) {
> >              xen_be_unmap_grant_refs(&xen_9pdev->xendev,
> >                                      xen_9pdev->rings[i].data,
> >                                      xen_9pdev->rings[i].intf->ref,
> >                                      (1 << xen_9pdev->rings[i].ring_ord=
er));
> > +            xen_9pdev->rings[i].data =3D NULL;
> >          }
> >          if (xen_9pdev->rings[i].intf !=3D NULL) {
> >              xen_be_unmap_grant_ref(&xen_9pdev->xendev,
> >                                     xen_9pdev->rings[i].intf,
> >                                     xen_9pdev->rings[i].ref);
> > +            xen_9pdev->rings[i].intf =3D NULL;
> >          }
> >          if (xen_9pdev->rings[i].bh !=3D NULL) {
> >              qemu_bh_delete(xen_9pdev->rings[i].bh);
> > +            xen_9pdev->rings[i].bh =3D NULL;
> >          }
> >      }
> >
> >      g_free(xen_9pdev->id);
> > +    xen_9pdev->id =3D NULL;
> >      g_free(xen_9pdev->tag);
> > +    xen_9pdev->tag =3D NULL;
> >      g_free(xen_9pdev->path);
> > +    xen_9pdev->path =3D NULL;
> >      g_free(xen_9pdev->security_model);
> > +    xen_9pdev->security_model =3D NULL;
> >      g_free(xen_9pdev->rings);
> > +    xen_9pdev->rings =3D NULL;
> > +    return;
> > +}
> > +
> > +static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> > +{
> > +    trace_xen_9pfs_free(xendev->name);
> > +
> >      return 0;
> >  }
>
> xen_9pfs_free() doing nothing, that doesn't look right to me. Wouldn't it=
 make
> sense to turn xen_9pfs_free() idempotent instead?

The callbacks are:
    .alloc      =3D xen_9pfs_alloc,
    .init       =3D xen_9pfs_init,
    .initialise =3D xen_9pfs_connect,
    .disconnect =3D xen_9pfs_disconnect,
    .free       =3D xen_9pfs_free,

.initialise (connect) and .disconnect are matched operations.  So
.disconnect should be cleaning up from .connect, which this patch
implements.

Also, neither xen_9pfs_alloc() nor xen_9pfs_init,() perform any
allocations, so that is why the .free callback is now empty.

Thanks for taking a look!

Regards,
Jason

