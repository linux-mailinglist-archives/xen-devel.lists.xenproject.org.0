Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093567BFD1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 23:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484620.751291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKo7k-0003PA-9n; Wed, 25 Jan 2023 22:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484620.751291; Wed, 25 Jan 2023 22:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKo7k-0003Mp-6d; Wed, 25 Jan 2023 22:20:08 +0000
Received: by outflank-mailman (input) for mailman id 484620;
 Wed, 25 Jan 2023 22:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6li=5W=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pKo7j-0002mN-2E
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:20:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ab7840e-9cfe-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 23:20:05 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-dZa9kRTuPoi_YhvH_rzgJQ-1; Wed, 25 Jan 2023 17:19:59 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D7D7100F903;
 Wed, 25 Jan 2023 22:19:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B172F1121330;
 Wed, 25 Jan 2023 22:19:57 +0000 (UTC)
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
X-Inumbo-ID: 6ab7840e-9cfe-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674685204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Na3xe+QZCW01A+v/Yj9/ftxjQvjcENPbaW+sNyyenXI=;
	b=hjaRrraQwN1OUa+3jPir2N2v2uRYvv1fwKVHsz5Y2ogcLPnV7nNcFnIBgb3cagFlPZWDMH
	U5hLWDwq22ZPRp2D9lb7EGTqC74KxbGEM78uOopLse5dW+Aa2y11ltFuP9e+SO3iUdc7NI
	0cAaRkA18kw8ZiUll34Y0PVtfEbeenQ=
X-MC-Unique: dZa9kRTuPoi_YhvH_rzgJQ-1
Date: Wed, 25 Jan 2023 17:19:55 -0500
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
Message-ID: <Y9GrC87Nbp6ViSBj@fedora>
References: <20230119070308.321653-1-alxndr@bu.edu>
 <20230119070308.321653-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PR/kp6ea097A6OkX"
Content-Disposition: inline
In-Reply-To: <20230119070308.321653-4-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3


--PR/kp6ea097A6OkX
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--PR/kp6ea097A6OkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRqwsACgkQnKSrs4Gr
c8j5WQf9F8Eg3nUxaGWZRHD3I8wFILb8NIBkmrWVzzVmfcZcxecQEQX/AJnoFfSP
7SY83PXVaWxyH5HHtNQMGMMchQ2bMO4m/8Rci3LPGKgDkauPzWbQVdj4mqkODrnl
/T+qIamwv5Zu7ddBh68Fi5qnA9OUGc6ycrKaQ0tDjA0xQ9j2ubdIw3i+KLLuUKLo
woyYb5kim7fMMt/1kVhUOM21c85TsFqe1hsyUjkbWN5fO3JifQPwoFjpYvNWDHdu
ysmdkchT2ekz2COepAVv5yc7yWI1ID8r7i//3xKrA486/GIm3XickhVNWoYNoU0e
Qo53IYuDqiMcWlTjSsfBJbq4CQa5iw==
=f/lH
-----END PGP SIGNATURE-----

--PR/kp6ea097A6OkX--


