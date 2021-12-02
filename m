Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A966C46672C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 16:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236822.410740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoLb-0001zE-Uc; Thu, 02 Dec 2021 15:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236822.410740; Thu, 02 Dec 2021 15:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msoLb-0001wS-QF; Thu, 02 Dec 2021 15:50:11 +0000
Received: by outflank-mailman (input) for mailman id 236822;
 Thu, 02 Dec 2021 15:50:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBuH=QT=redhat.com=rjones@srs-se1.protection.inumbo.net>)
 id 1msoLa-0001wM-2L
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 15:50:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860cafc0-5387-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 16:50:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-165-z5f4yFOxNSqRU_ESNFcjuA-1; Thu, 02 Dec 2021 10:50:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191351023F52;
 Thu,  2 Dec 2021 15:50:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29842196FC;
 Thu,  2 Dec 2021 15:49:09 +0000 (UTC)
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
X-Inumbo-ID: 860cafc0-5387-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638460207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwDFL780Dv/zY+dUlAUznVuZNLTsUT/0J7f+xwGcORw=;
	b=FDbx5rj6uDOtPwxmXcKTY0qAFGFVh9bRpxleWUfKmI0bNOs6DKV1zaWcR8pqacBDv1QhqK
	V2c9scPSZKXJP7sKLNr8A04A4cyD2JCB0eYam6cFq+ZSi1D+zxevOw+tIP3r4dxa3zWndR
	LyUIGMJubIUqk+ShW33nY5hQyrQIlIk=
X-MC-Unique: z5f4yFOxNSqRU_ESNFcjuA-1
Date: Thu, 2 Dec 2021 15:49:08 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
Message-ID: <20211202154908.GW1127@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Not sure if this is related, but builds are failing with:

FAILED: libblockdev.fa.p/block_export_fuse.c.o=20
cc -m64 -mcx16 -Ilibblockdev.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader =
-I/usr/include/fuse3 -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/us=
r/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Daut=
o -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g -isystem /home/rjones/d/qemu/linu=
x-headers -isystem linux-headers -iquote . -iquote /home/rjones/d/qemu -iqu=
ote /home/rjones/d/qemu/include -iquote /home/rjones/d/qemu/disas/libvixl -=
iquote /home/rjones/d/qemu/tcg/i386 -pthread -DSTAP_SDT_V2 -U_FORTIFY_SOURC=
E -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE=
_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmis=
sing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declar=
ation -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -=
Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label=
s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-di=
rs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD =
-MQ libblockdev.fa.p/block_export_fuse.c.o -MF libblockdev.fa.p/block_expor=
t_fuse.c.o.d -o libblockdev.fa.p/block_export_fuse.c.o -c ../block/export/f=
use.c
../block/export/fuse.c: In function =E2=80=98setup_fuse_export=E2=80=99:
../block/export/fuse.c:226:59: warning: passing argument 7 of =E2=80=98aio_=
set_fd_handler=E2=80=99 from incompatible pointer type [-Wincompatible-poin=
ter-types]
  226 |                        read_from_fuse_export, NULL, NULL, exp);
      |                                                           ^~~
      |                                                           |
      |                                                           FuseExpor=
t *
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:472:36: note: expected =E2=80=98voi=
d (*)(void *)=E2=80=99 but argument is of type =E2=80=98FuseExport *=E2=80=
=99
  472 |                         IOHandler *io_poll_ready,
      |                         ~~~~~~~~~~~^~~~~~~~~~~~~
../block/export/fuse.c:224:5: error: too few arguments to function =E2=80=
=98aio_set_fd_handler=E2=80=99
  224 |     aio_set_fd_handler(exp->common.ctx,
      |     ^~~~~~~~~~~~~~~~~~
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
  466 | void aio_set_fd_handler(AioContext *ctx,
      |      ^~~~~~~~~~~~~~~~~~
../block/export/fuse.c: In function =E2=80=98fuse_export_shutdown=E2=80=99:
../block/export/fuse.c:268:13: error: too few arguments to function =E2=80=
=98aio_set_fd_handler=E2=80=99
  268 |             aio_set_fd_handler(exp->common.ctx,
      |             ^~~~~~~~~~~~~~~~~~
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
  466 | void aio_set_fd_handler(AioContext *ctx,
      |      ^~~~~~~~~~~~~~~~~~

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


