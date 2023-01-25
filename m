Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8667BFD0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 23:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484619.751282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKo7i-00035B-2a; Wed, 25 Jan 2023 22:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484619.751282; Wed, 25 Jan 2023 22:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKo7h-00033G-UK; Wed, 25 Jan 2023 22:20:05 +0000
Received: by outflank-mailman (input) for mailman id 484619;
 Wed, 25 Jan 2023 22:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6li=5W=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pKo7g-0002mN-Cv
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:20:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6898e916-9cfe-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 23:20:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-Eg2ockkrMBCcGSKv08KftQ-1; Wed, 25 Jan 2023 17:19:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2F43C0CD39;
 Wed, 25 Jan 2023 22:19:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4F4CC15BA0;
 Wed, 25 Jan 2023 22:19:51 +0000 (UTC)
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
X-Inumbo-ID: 6898e916-9cfe-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674685200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXWTS7PEfK4jfis5AMTJ0jfF1+NWNTH+CYWW0b9TfAk=;
	b=IVY4iK60xsypQIQzi6BKwM4EAFcXxDsEmaTwU9c1UiyJaR4RTOjldQ4B9NxX7VTpqpxE35
	exrVAU2L4q2yijlNQtBbQDfAp9J0QLIJ8k0ZevUvCfgMhvAWg/kb1QKMJ6g1n8QVruFIX5
	qkqBv6Q7y0qC4mgmBdFtoFdLOiYrezE=
X-MC-Unique: Eg2ockkrMBCcGSKv08KftQ-1
Date: Wed, 25 Jan 2023 17:19:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Mauro Matteo Cascella <mcascell@redhat.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Fam Zheng <fam@euphon.net>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	"open list:virtio-blk" <qemu-block@nongnu.org>,
	"open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
	"open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v4 3/3] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Message-ID: <Y9GrBTALs18YkSKG@fedora>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M2N6eqImXDUC6qNs"
Content-Disposition: inline
In-Reply-To: <20230119070308.321653-4-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--M2N6eqImXDUC6qNs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 02:03:08AM -0500, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  hw/9pfs/xen-9p-backend.c        | 4 +++-
>  hw/block/dataplane/virtio-blk.c | 3 ++-
>  hw/block/dataplane/xen-block.c  | 5 +++--
>  hw/block/virtio-blk.c           | 5 +++--
>  hw/char/virtio-serial-bus.c     | 3 ++-
>  hw/display/qxl.c                | 9 ++++++---
>  hw/display/virtio-gpu.c         | 6 ++++--
>  hw/ide/ahci.c                   | 3 ++-
>  hw/ide/core.c                   | 3 ++-
>  hw/misc/imx_rngc.c              | 6 ++++--
>  hw/misc/macio/mac_dbdma.c       | 2 +-
>  hw/net/virtio-net.c             | 3 ++-
>  hw/nvme/ctrl.c                  | 6 ++++--
>  hw/scsi/mptsas.c                | 3 ++-
>  hw/scsi/scsi-bus.c              | 3 ++-
>  hw/scsi/vmw_pvscsi.c            | 3 ++-
>  hw/usb/dev-uas.c                | 3 ++-
>  hw/usb/hcd-dwc2.c               | 3 ++-
>  hw/usb/hcd-ehci.c               | 3 ++-
>  hw/usb/hcd-uhci.c               | 2 +-
>  hw/usb/host-libusb.c            | 6 ++++--
>  hw/usb/redirect.c               | 6 ++++--
>  hw/usb/xen-usb.c                | 3 ++-
>  hw/virtio/virtio-balloon.c      | 5 +++--
>  hw/virtio/virtio-crypto.c       | 3 ++-
>  25 files changed, 66 insertions(+), 35 deletions(-)

Should scripts/checkpatch.pl complain when qemu_bh_new() or aio_bh_new()
are called from hw/? Adding a check is important so new instances cannot
be added accidentally in the future.

Stefan

--M2N6eqImXDUC6qNs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRqwUACgkQnKSrs4Gr
c8gRpgf/XSMSSsqXecEYX86MfvLzEtDZEi3FpITflNUsNp60gUR3RxhOHYM1uYKt
JJsD58pqNmAqE+w3Yp3IfsHiqN2/Nn4M11DhA+LTtr/aOBDj2Avtn8cjlD9B/9sv
pdBlSmT9qdqNSMV0Vf3PeTQoFPgO0HfszA90SWOxVtRSPY5+I0ogrcBQnF9CniKP
ckWq3++62BxEnQDD74thjGagTPexUnMER/G5RGu7bEHZZPnVCUZSrRN413f5eco2
8hJZwVfvUmr/28Pn57ShdIm0T4VAr8A2T4+BpaGpc5oiBL5Jxblkj7J8+A78tv0v
jeSYTaMqrl98ceiYFrymlZCjC9aaOQ==
=MJ1Z
-----END PGP SIGNATURE-----

--M2N6eqImXDUC6qNs--


