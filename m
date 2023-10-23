Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03407D2E49
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621152.967300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurGK-0006IF-6G; Mon, 23 Oct 2023 09:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621152.967300; Mon, 23 Oct 2023 09:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurGK-0006Et-3L; Mon, 23 Oct 2023 09:30:16 +0000
Received: by outflank-mailman (input) for mailman id 621152;
 Mon, 23 Oct 2023 09:30:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yq7o=GF=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1qurGI-0006En-3D
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:30:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2356b0f-7186-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:30:10 +0200 (CEST)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-OWYvf_aIPHiF9PfXZGZ50Q-1; Mon, 23 Oct 2023 05:30:08 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-41cb7904d5aso44889291cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:30:08 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac8776b000000b004194c21ee85sm2617680qtu.79.2023.10.23.02.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:30:06 -0700 (PDT)
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
X-Inumbo-ID: c2356b0f-7186-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698053410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BY/1jIiNPqSgcmKMDKFvLxbpat0MCdq78Cpr8NP41hU=;
	b=L0bAAPcBfRA7kd1Ffg0BdiW6LWDnFD9MPw5EcVOZ9FK+GzH2mIHz/g9+nU5wPmeROlyqP9
	bqmhv06nwXCJgJlSLUP0Ca4akmG0u8O1clDSrP4PVtM2JdfXVQGmHoeZtSKZFYYGtBWNC6
	7x1NsVyvVoh2bouBZ0avM8WP2ADo3wk=
X-MC-Unique: OWYvf_aIPHiF9PfXZGZ50Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698053408; x=1698658208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWRH/UhKo/xZsmdbBLpR3mKt4IiEjfeUIaolB7vdgHA=;
        b=fjLRrFDhxcB8LVcrvOQ1Kf41t5ulenMTrcNxhMlRfhoBtjlgn0zEIPoj8EStAhA/qw
         RJtsqjTLSVmkDQqJaLNZK9FYwsoBDHBJ3w6Sq/xQNH/nTpn0FlVPWvi+bzLbovWPN9u3
         2vOuJTGTo3anQPzwKVuLK3TDUlcEGtA7UGWRwKz1Lo7AHYtZGDhWq7T15HudTJ1QMmXh
         ExWyvUnh+kS4Heq1Z066MbIPYazUrTYuYKqncuwhdycRTOuR++PpaiZqXNBu0pfJG7J5
         fltp2uBquxTzZkwF5yd1346MfU/KA9Yafv9FZgGIIEY2HPmq/osi8aZsmAhg8p+pGWW6
         KN5w==
X-Gm-Message-State: AOJu0YySEM2pLmF8xl7VclU47iwIXJRGE/P/TxSsBeraMcjgM0x/xtsK
	VH5gSbedONHPENtV8OG/kgwZx97WR1GlnMAf9oo5vcP2Td9pafEvFNkyB/B/jZ8ZvEFKNn5GsBo
	4Vk7cV45tscUla06kZp2YliMRVTo=
X-Received: by 2002:ac8:4e86:0:b0:41b:826b:1be8 with SMTP id 6-20020ac84e86000000b0041b826b1be8mr11973485qtp.17.1698053407906;
        Mon, 23 Oct 2023 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk3I1W94WildIJnzyBvuTUwKjpxDbfTwVQeJ7fvAykTJzbav/T0qXVcTdryJEKL/kx9hWMBA==
X-Received: by 2002:ac8:4e86:0:b0:41b:826b:1be8 with SMTP id 6-20020ac84e86000000b0041b826b1be8mr11973463qtp.17.1698053407595;
        Mon, 23 Oct 2023 02:30:07 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:30:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau         <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 11/12] hw/xen: automatically assign device index to
 block devices
Message-ID: <20231023113002.0e83c209@imammedo.users.ipa.redhat.com>
In-Reply-To: <3f3487af227dcdce7afb37e8406d5ce8dcdbf55f.camel@infradead.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
	<20231016151909.22133-12-dwmw2@infradead.org>
	<20231018093239.3d525fd8@imammedo.users.ipa.redhat.com>
	<3f3487af227dcdce7afb37e8406d5ce8dcdbf55f.camel@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Oct 2023 09:32:47 +0100
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2023-10-18 at 09:32 +0200, Igor Mammedov wrote:
> > On Mon, 16 Oct 2023 16:19:08 +0100
> > David Woodhouse <dwmw2@infradead.org> wrote:
> >  =20
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >  =20
> >=20
> > is this index a user (guest) visible? =20
>=20
> Yes. It defines what block device (e.g. /dev/xvda) the disk appears as
> in the guest. In the common case, it literally encodes the Linux
> major/minor numbers. So xvda (major 202) is 0xca00, xvdb is 0xca10 etc.

that makes 'index' an implicit ABI and a subject to versioning
when the way it's assigned changes (i.e. one has to use versioned
machine types to keep older versions working the they used to).

From what I remember it's discouraged to make QEMU invent
various IDs that are part of ABI (guest or mgmt side).
Instead it's preferred for mgmt side/user to provide that explicitly.

Basically you are trading off manageability/simplicity at QEMU
level with CLI usability for human user.
I don't care much as long as it is hidden within xen code base,
but maybe libvirt does.

> Previously we had to explicitly set it for each disk in Qemu:
>=20
>   -drive file=3Ddisk1.img,id=3Ddrv1 -device xen-disk,drive=3Ddrv1,vdev=3D=
xvda
>   -drive file=3Ddisk2.img,id=3Ddrv2 -device xen-disk,drive=3Ddrv2,vdev=3D=
xvdb
>=20
> Now we can just do
>=20
>   -drive file=3Ddisk1.img,if=3Dxen -drive file-disk2.img,if=3Dxen
>
> (We could go further and make if=3Dxen the default for Xen guests too,
> but that doesn't work right now because xen-block will barf on the
> default provided CD-ROM when it's empty. It doesn't handle empty
> devices. And if I work around that, then `-hda disk1.img` would work on
> the command line... but would make it appear as /dev/xvda instead of
> /dev/hda, and I don't know how I feel about that.)
>
> [root@localhost ~]# xenstore-ls  -f device/vbd
> device/vbd =3D ""
> device/vbd/51712 =3D ""
> device/vbd/51712/backend =3D "/local/domain/0/backend/qdisk/1/51712"
> device/vbd/51712/backend-id =3D "0"
> device/vbd/51712/device-type =3D "disk"
> device/vbd/51712/event-channel =3D "8"
> device/vbd/51712/feature-persistent =3D "1"
> device/vbd/51712/protocol =3D "x86_64-abi"
> device/vbd/51712/ring-ref =3D "8"
> device/vbd/51712/state =3D "4"
> device/vbd/51712/virtual-device =3D "51712"
>=20
> >  =20
> > > There's no need to force the user to assign a vdev. We can automatica=
lly
> > > assign one, starting at xvda and searching until we find the first di=
sk
> > > name that's unused.
> > >=20
> > > This means we can now allow '-drive if=3Dxen,file=3Dxxx' to work with=
out an
> > > explicit separate -driver argument, just like if=3Dvirtio.
> > >=20
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > ---
> > > =C2=A0blockdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 ++++++++++++---
> > > =C2=A0hw/block/xen-block.c | 25 +++++++++++++++++++++++++
> > > =C2=A02 files changed, 37 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/blockdev.c b/blockdev.c
> > > index 325b7a3bef..9dec4c9c74 100644
> > > --- a/blockdev.c
> > > +++ b/blockdev.c
> > > @@ -255,13 +255,13 @@ void drive_check_orphaned(void)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ignore defau=
lt drives, because we create certain default
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * drives uncon=
ditionally, then leave them unclaimed.=C2=A0 Not the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * users fault.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ignore IF_VIRTIO,=
 because it gets desugared into -device,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * so we can leave f=
ailing to -device.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ignore IF_VIRTIO =
or IF_XEN, because it gets desugared into
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * -device, so we ca=
n leave failing to -device.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ignore IF_NO=
NE, because leaving unclaimed IF_NONE remains
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * available fo=
r device_add is a feature.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dinfo->is_defaul=
t || dinfo->type =3D=3D IF_VIRTIO
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
| dinfo->type =3D=3D IF_NONE) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
| dinfo->type =3D=3D IF_XEN || dinfo->type =3D=3D IF_NONE) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!blk_get_attache=
d_dev(blk)) {
> > > @@ -977,6 +977,15 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockIn=
terfaceType block_default_type,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_opt_set(devopts=
, "driver", "virtio-blk", &error_abort);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_opt_set(devopts=
, "drive", qdict_get_str(bs_opts, "id"),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &error_abort);
> > > +=C2=A0=C2=A0=C2=A0 } else if (type =3D=3D IF_XEN) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QemuOpts *devopts;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devopts =3D qemu_opts_cre=
ate(qemu_find_opts("device"), NULL, 0,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &error_abor=
t);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_opt_set(devopts, "dr=
iver",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (media =3D=3D MEDIA_=
CDROM) ? "xen-cdrom" : "xen-disk",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &error_abort);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_opt_set(devopts, "dr=
ive", qdict_get_str(bs_opts, "id"),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &error_abort);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 filename =3D qemu_opt_get(legacy_opts, "file=
");
> > > diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> > > index 9262338535..20fa783cbe 100644
> > > --- a/hw/block/xen-block.c
> > > +++ b/hw/block/xen-block.c
> > > @@ -34,6 +34,31 @@ static char *xen_block_get_name(XenDevice *xendev,=
 Error **errp)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 XenBlockDevice *blockdev =3D XEN_BLOCK_DEVIC=
E(xendev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 XenBlockVdev *vdev =3D &blockdev->props.vdev=
;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0 if (blockdev->props.vdev.type =3D=3D XEN_BLOCK_VD=
EV_TYPE_INVALID) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char name[11];
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int disk =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long idx;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Find an unoccupied dev=
ice name */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (disk < (1 << 20)) =
{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (disk < (1 << 4)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 idx =3D (202 << 8) | (disk << 4);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 else {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 idx =3D (1 << 28) | (disk << 8);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
nprintf(name, sizeof(name), "%lu", idx);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (!xen_backend_exists("qdisk", name)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vdev->type =3D XEN_BLOCK_VDEV_TYPE_XVD;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vdev->partition =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vdev->disk =3D disk;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vdev->number =3D idx;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return g_strdup(name);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
isk++;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "cannot =
find device vdev for block device");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return g_strdup_printf("%lu", vdev->number);
> > > =C2=A0}
> > > =C2=A0 =20
> >=20
> >  =20
>=20


