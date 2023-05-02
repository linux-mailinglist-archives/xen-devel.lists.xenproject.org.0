Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BC6F49F6
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 20:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528780.822348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvAy-00007Z-Va; Tue, 02 May 2023 18:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528780.822348; Tue, 02 May 2023 18:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvAy-00005k-Ry; Tue, 02 May 2023 18:56:36 +0000
Received: by outflank-mailman (input) for mailman id 528780;
 Tue, 02 May 2023 18:56:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGWT=AX=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ptvAw-0008UA-N0
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 18:56:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ddd27c4-e91b-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 20:56:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-hz_-_nNRNHKLUa7zat10Kw-1; Tue, 02 May 2023 14:56:28 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF841811E7C;
 Tue,  2 May 2023 18:56:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A29F492B03;
 Tue,  2 May 2023 18:56:26 +0000 (UTC)
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
X-Inumbo-ID: 0ddd27c4-e91b-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683053792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JvqiB11pwfyb9mMlyyPXLE6NQZxd1luK1o/19K1fqnk=;
	b=Jl4gsC1KlQMRK0juJOoLPeJbdKQyXa0ar5TmsH51hUb7c8IzyFWx7oVpcQ7KsZ9fLU7e1y
	FFDf3I/nseYyoInDjLMk+EgL4IQGvKr/69RhcjVt0ePFUCGVC9phJK8ASvlRD0ivqxXZWi
	yTiPIzIo+9+GB2mMV5BEfCF3edfSXxs=
X-MC-Unique: hz_-_nNRNHKLUa7zat10Kw-1
Date: Tue, 2 May 2023 14:56:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 03/20] virtio-scsi: avoid race between unplug and
 transport event
Message-ID: <20230502185624.GA535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-4-stefanha@redhat.com>
 <ZFEqEkG4ktn9bBFN@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qd9ljEEGWct7+HKe"
Content-Disposition: inline
In-Reply-To: <ZFEqEkG4ktn9bBFN@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--Qd9ljEEGWct7+HKe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 05:19:46PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:26 hat Stefan Hajnoczi geschrieben:
> > Only report a transport reset event to the guest after the SCSIDevice
> > has been unrealized by qdev_simple_device_unplug_cb().
> >=20
> > qdev_simple_device_unplug_cb() sets the SCSIDevice's qdev.realized field
> > to false so that scsi_device_find/get() no longer see it.
> >=20
> > scsi_target_emulate_report_luns() also needs to be updated to filter out
> > SCSIDevices that are unrealized.
> >=20
> > These changes ensure that the guest driver does not see the SCSIDevice
> > that's being unplugged if it responds very quickly to the transport
> > reset event.
> >=20
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > @@ -1082,6 +1073,15 @@ static void virtio_scsi_hotunplug(HotplugHandler=
 *hotplug_dev, DeviceState *dev,
> >          blk_set_aio_context(sd->conf.blk, qemu_get_aio_context(), NULL=
);
> >          virtio_scsi_release(s);
> >      }
> > +
> > +    if (virtio_vdev_has_feature(vdev, VIRTIO_SCSI_F_HOTPLUG)) {
> > +        virtio_scsi_acquire(s);
> > +        virtio_scsi_push_event(s, sd,
> > +                               VIRTIO_SCSI_T_TRANSPORT_RESET,
> > +                               VIRTIO_SCSI_EVT_RESET_REMOVED);
> > +        scsi_bus_set_ua(&s->bus, SENSE_CODE(REPORTED_LUNS_CHANGED));
> > +        virtio_scsi_release(s);
> > +    }
> >  }
>=20
> s, sd and s->bus are all unrealized at this point, whereas before this
> patch they were still realized. I couldn't find any practical problem
> with it, but it made me nervous enough that I thought I should comment
> on it at least.
>=20
> Should we maybe have documentation on these functions that says that
> they accept unrealized objects as their parameters?

s is the VirtIOSCSI controller, not the SCSIDevice that is being
unplugged. The VirtIOSCSI controller is still realized.

s->bus is the VirtIOSCSI controller's bus, it is still realized.

You are right that the SCSIDevice (sd) has been unrealized at this
point:
- sd->conf.blk is safe because qdev properties stay alive the
  Object is deleted, but I'm not sure we should rely on that.
- virti_scsi_push_event(.., sd, ...) is questionable because the LUN
  that's fetched from sd no longer belongs to the unplugged SCSIDevice.

How about I change the code to fetch sd->conf.blk and the LUN before
unplugging?

Stefan

--Qd9ljEEGWct7+HKe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRXNgACgkQnKSrs4Gr
c8ipsAf+MYIOWS+2lk+xRt3nEDpVri7B1MaNSrlKDWSw2vK6J34jE0bGdHF3I5kZ
cS6XFEpcK0BRYes0zRpFZyksJFYS1033b2up4HGodKOJp34ahYy7Vg4yNrov6pzO
pZHJAEeEkK0FrHHJkho15qjoOykxt4bib6RzUFN+EdKo3KGQzk1dEyh8fzPEm40x
CwNN7D/FJAOOM3CpgsHLUGu6EvOBlfGkd8kS7It3qOD+/BeLFHKDiLBaU5w/IXtA
WmgFKnZiOEsMQIEIFgcg+m/YrlomPy0kRPFFSFNn7/5yCmhLCU5WNY/1sTiM3LEi
20aCYTqXQJt5E6c1jk1x21IACc9qRA==
=PP5I
-----END PGP SIGNATURE-----

--Qd9ljEEGWct7+HKe--


