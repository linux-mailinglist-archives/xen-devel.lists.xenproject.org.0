Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F28466754
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236831.410750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoRL-0002qA-HV; Thu, 02 Dec 2021 15:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236831.410750; Thu, 02 Dec 2021 15:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoRL-0002o1-EQ; Thu, 02 Dec 2021 15:56:07 +0000
Received: by outflank-mailman (input) for mailman id 236831;
 Thu, 02 Dec 2021 15:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4zFf=QT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1msoRJ-0002nv-Lp
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:56:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f43b87-5388-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 16:56:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-143-5ye8EyOSNHGK2TwQJ_F6aQ-1; Thu, 02 Dec 2021 10:55:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C39A2190D340;
 Thu,  2 Dec 2021 15:55:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5423E10023B8;
 Thu,  2 Dec 2021 15:55:55 +0000 (UTC)
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
X-Inumbo-ID: 58f43b87-5388-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638460561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAQHhiGj0Hm+ap6kk3Z+FJrUCF740xv8Es/itHFsW3o=;
	b=QJAnN3yKV+iHSViHjE+Mq/0ae7nGwBQXBXCshlwh8w72jOqVXuctM+c398a+9FMFIfx3d0
	zZ/9p0lo+RDKhpvg0fzikN9XMIH1+F/2e1I9oG0M5Y//ljSg7Xp+k6rz0qNfVpKPEKv915
	ATdL/sw7tHXk3xO3Hbjrx21Ghf0CuIs=
X-MC-Unique: 5ye8EyOSNHGK2TwQJ_F6aQ-1
Date: Thu, 2 Dec 2021 15:55:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Coiby Xu <Coiby.Xu@gmail.com>,
	qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org, Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v2 0/6] aio-posix: split poll check from ready handler
Message-ID: <YajsimpUt5FNUSlx@stefanha-x1.localdomain>
References: <20211202153402.604951-1-stefanha@redhat.com>
 <20211202154908.GW1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211202154908.GW1127@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KOuTwbKWisAWfM5Q"
Content-Disposition: inline

--KOuTwbKWisAWfM5Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 03:49:08PM +0000, Richard W.M. Jones wrote:
>=20
> Not sure if this is related, but builds are failing with:
>=20
> FAILED: libblockdev.fa.p/block_export_fuse.c.o=20
> cc -m64 -mcx16 -Ilibblockdev.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shade=
r -I/usr/include/fuse3 -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/=
usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Da=
uto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g -isystem /home/rjones/d/qemu/li=
nux-headers -isystem linux-headers -iquote . -iquote /home/rjones/d/qemu -i=
quote /home/rjones/d/qemu/include -iquote /home/rjones/d/qemu/disas/libvixl=
 -iquote /home/rjones/d/qemu/tcg/i386 -pthread -DSTAP_SDT_V2 -U_FORTIFY_SOU=
RCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFI=
LE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wm=
issing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-decl=
aration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k=
 -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-lab=
els -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-=
dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -M=
D -MQ libblockdev.fa.p/block_export_fuse.c.o -MF libblockdev.fa.p/block_exp=
ort_fuse.c.o.d -o libblockdev.fa.p/block_export_fuse.c.o -c ../block/export=
/fuse.c
> ../block/export/fuse.c: In function =E2=80=98setup_fuse_export=E2=80=99:
> ../block/export/fuse.c:226:59: warning: passing argument 7 of =E2=80=98ai=
o_set_fd_handler=E2=80=99 from incompatible pointer type [-Wincompatible-po=
inter-types]
>   226 |                        read_from_fuse_export, NULL, NULL, exp);
>       |                                                           ^~~
>       |                                                           |
>       |                                                           FuseExp=
ort *
> In file included from ../block/export/fuse.c:22:
> /home/rjones/d/qemu/include/block/aio.h:472:36: note: expected =E2=80=98v=
oid (*)(void *)=E2=80=99 but argument is of type =E2=80=98FuseExport *=E2=
=80=99
>   472 |                         IOHandler *io_poll_ready,
>       |                         ~~~~~~~~~~~^~~~~~~~~~~~~
> ../block/export/fuse.c:224:5: error: too few arguments to function =E2=80=
=98aio_set_fd_handler=E2=80=99
>   224 |     aio_set_fd_handler(exp->common.ctx,
>       |     ^~~~~~~~~~~~~~~~~~
> In file included from ../block/export/fuse.c:22:
> /home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
>   466 | void aio_set_fd_handler(AioContext *ctx,
>       |      ^~~~~~~~~~~~~~~~~~
> ../block/export/fuse.c: In function =E2=80=98fuse_export_shutdown=E2=80=
=99:
> ../block/export/fuse.c:268:13: error: too few arguments to function =E2=
=80=98aio_set_fd_handler=E2=80=99
>   268 |             aio_set_fd_handler(exp->common.ctx,
>       |             ^~~~~~~~~~~~~~~~~~
> In file included from ../block/export/fuse.c:22:
> /home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
>   466 | void aio_set_fd_handler(AioContext *ctx,
>       |      ^~~~~~~~~~~~~~~~~~

Yes, thanks!

Stefan

--KOuTwbKWisAWfM5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGo7IoACgkQnKSrs4Gr
c8hhnwgAsylfZZ3Az6JIYycSiNK75rEOP3cIy34Pz1M55Y99XAiKnZWFAfgU+5Mw
Fh+lFqoDroRS7gA5iTUbBozi5FsT70aFs+/OVExNfSeqnObRXcDJEPGZZ+JZDi16
ub6W/hMxnvD8sf5TL1GvuuG26gV+baEbU4DHpzeDe6/QX1fdh7ZuSKh3YmesUEB9
INBBSj180damsjMCVRJsUW0tSUaayWoHcp/rMEGQhw7auLV97kNgHKyk406fbIBi
XdSS9uAma/KjAFSflsfdhLNfMuc6++Xcgh6x4YGQNHwcKGuU4TZEPE2W1IFyt5r0
dcEdqxoXgaXGLfTATFmQ16+gyNI8DA==
=8Hst
-----END PGP SIGNATURE-----

--KOuTwbKWisAWfM5Q--


