Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9B2F2CE3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 11:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65572.116191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGwj-0000Lc-3B; Tue, 12 Jan 2021 10:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65572.116191; Tue, 12 Jan 2021 10:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGwi-0000LD-VN; Tue, 12 Jan 2021 10:30:40 +0000
Received: by outflank-mailman (input) for mailman id 65572;
 Tue, 12 Jan 2021 10:30:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8Mo=GP=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1kzGwg-0000L8-WB
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 10:30:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9b32f2d8-87f6-4108-9a79-d621c9eab71f;
 Tue, 12 Jan 2021 10:30:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-yZM83J6cMXCpTgcubcTk1A-1; Tue, 12 Jan 2021 05:30:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D87AFA81;
 Tue, 12 Jan 2021 10:30:29 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 978DF10023B5;
 Tue, 12 Jan 2021 10:30:15 +0000 (UTC)
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
X-Inumbo-ID: 9b32f2d8-87f6-4108-9a79-d621c9eab71f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610447435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtAVZx/m5M42/sCrHG4e0vHzuv3Z13YDXpEzXvGlnvs=;
	b=YjnSOg3jzcgDk3pKzvV3zMlScciAKIgxzGWXA2EP6qz4UU0YbVv5LU4HLJ7aw5O56FWSZe
	eMPcfifqqVuOhPA+trqr0eoRtmgLszjJne1+iW1X1aUSbMgtigEBez19flQSwZZaJZ54VP
	haWtEIq+4n2EjSlXNA4sQZDDcGA8bpc=
X-MC-Unique: yZM83J6cMXCpTgcubcTk1A-1
Date: Tue, 12 Jan 2021 10:30:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 0/2] sysemu: Let VMChangeStateHandler take boolean
 'running' argument
Message-ID: <20210112103014.GB194658@stefanha-x1.localdomain>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 04:20:18PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Trivial prototype change to clarify the use of the 'running'
> argument of VMChangeStateHandler.
>=20
> Green CI:
> https://gitlab.com/philmd/qemu/-/pipelines/239497352
>=20
> Philippe Mathieu-Daud=E9 (2):
>   sysemu/runstate: Let runstate_is_running() return bool
>   sysemu: Let VMChangeStateHandler take boolean 'running' argument
>=20
>  include/sysemu/runstate.h   | 12 +++++++++---
>  target/arm/kvm_arm.h        |  2 +-
>  target/ppc/cpu-qom.h        |  2 +-
>  accel/xen/xen-all.c         |  2 +-
>  audio/audio.c               |  2 +-
>  block/block-backend.c       |  2 +-
>  gdbstub.c                   |  2 +-
>  hw/block/pflash_cfi01.c     |  2 +-
>  hw/block/virtio-blk.c       |  2 +-
>  hw/display/qxl.c            |  2 +-
>  hw/i386/kvm/clock.c         |  2 +-
>  hw/i386/kvm/i8254.c         |  2 +-
>  hw/i386/kvmvapic.c          |  2 +-
>  hw/i386/xen/xen-hvm.c       |  2 +-
>  hw/ide/core.c               |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c |  2 +-
>  hw/intc/arm_gicv3_kvm.c     |  2 +-
>  hw/intc/spapr_xive_kvm.c    |  2 +-
>  hw/misc/mac_via.c           |  2 +-
>  hw/net/e1000e_core.c        |  2 +-
>  hw/nvram/spapr_nvram.c      |  2 +-
>  hw/ppc/ppc.c                |  2 +-
>  hw/ppc/ppc_booke.c          |  2 +-
>  hw/s390x/tod-kvm.c          |  2 +-
>  hw/scsi/scsi-bus.c          |  2 +-
>  hw/usb/hcd-ehci.c           |  2 +-
>  hw/usb/host-libusb.c        |  2 +-
>  hw/usb/redirect.c           |  2 +-
>  hw/vfio/migration.c         |  2 +-
>  hw/virtio/virtio-rng.c      |  2 +-
>  hw/virtio/virtio.c          |  2 +-
>  net/net.c                   |  2 +-
>  softmmu/memory.c            |  2 +-
>  softmmu/runstate.c          |  4 ++--
>  target/arm/kvm.c            |  2 +-
>  target/i386/kvm/kvm.c       |  2 +-
>  target/i386/sev.c           |  2 +-
>  target/i386/whpx/whpx-all.c |  2 +-
>  target/mips/kvm.c           |  4 ++--
>  ui/gtk.c                    |  2 +-
>  ui/spice-core.c             |  2 +-
>  41 files changed, 51 insertions(+), 45 deletions(-)
>=20
> --=20
> 2.26.2
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/9ejYACgkQnKSrs4Gr
c8idIAf/Yau6DdIvJYo0z1xlPWikqBBVOuHPdp3bLO0cxM4ShsmyJBcHVcXht/F5
2dJf4d3ieWtl1MiBHI7VlWPtxfZXjcKLN8TT6wS7IUQOKMUTj7U+kZeplVOeHdJ5
FaBCr4SCux3oJdDYz0V0oYxyZotxXpgV6QcnecOQ8z+3syVSKdPf5ZIDIEEJm9g8
1ZI/HkBoJ6k2glUM83ohVS2K8gQ/eJqANxgKCFqGX2AFcIuQfD2ESotgaq263A0m
WvGwEXcLV6ALMAANVoYBDIPACb3dJFGK4Z9HZnUoV5Cqq14MmTjsIaDCRI7ekmtl
iifLGCKlWmb5Y8rX5WFdfJfWQf/ufg==
=R44D
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--


