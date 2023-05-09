Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8846FCD09
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 19:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532403.828590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwRVD-0003DJ-9C; Tue, 09 May 2023 17:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532403.828590; Tue, 09 May 2023 17:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwRVD-0003Af-6K; Tue, 09 May 2023 17:51:55 +0000
Received: by outflank-mailman (input) for mailman id 532403;
 Tue, 09 May 2023 17:51:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hm7m=A6=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pwRVA-0003AY-Vk
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 17:51:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0b60cc-ee92-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 19:51:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-PpY0sT0QMaWcAjHy4w3mDQ-1; Tue, 09 May 2023 13:51:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92D92100F651;
 Tue,  9 May 2023 17:51:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2336840C6E67;
 Tue,  9 May 2023 17:51:39 +0000 (UTC)
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
X-Inumbo-ID: 2c0b60cc-ee92-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683654708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YSdkeye67d1BrBNCM3zk98YAc8rNSrDW0Ne/KD+GhLE=;
	b=if8DEJVqJdBu2KnAHtRbUqVg9s7CCbGEDxlp5HlfZFf8Glq5bm8zmBT0SmrMlsmBdKUCiN
	K4+kkRFJ3etTuv7exP/cjTQFgzlQ4fi9sfBgqNHMTZ7vnhr0a/UxcFDMDyW9esk1yA94/l
	2qM06dW9Nsz9GXxabH0RUOS1abNQKFY=
X-MC-Unique: PpY0sT0QMaWcAjHy4w3mDQ-1
Date: Tue, 9 May 2023 13:51:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 00/21] block: remove aio_disable_external() API
Message-ID: <20230509175138.GC1018047@fedora>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <ZFQnSjGiEWuSFWTh@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYR6uqo+9eG5ZY9J"
Content-Disposition: inline
In-Reply-To: <ZFQnSjGiEWuSFWTh@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2


--zYR6uqo+9eG5ZY9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:44:42PM +0200, Kevin Wolf wrote:
> Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> > v5:
> > - Use atomic accesses for in_flight counter in vhost-user-server.c [Kev=
in]
> > - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET event
> >   before unrealizing the SCSIDevice [Kevin]
> > - Keep vhost-user-blk export .detach() callback so ctx is set to NULL [=
Kevin]
> > - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} callba=
cks from
> >   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> > - Include Kevin's "block: Fix use after free in blockdev_mark_auto_del(=
)" to
> >   fix a latent bug that was exposed by this series
>=20
> I only just finished reviewing v4 when you had already sent v5, but it
> hadn't arrived yet. I had a few more comments on what are now patches
> 17, 18, 19 and 21 in v5. I think they all still apply.

I'm not sure which comments from v4 still apply. In my email client all
your replies were already read when I sent v5.

Maybe you can share the Message-Id of something I still need to address?

Thanks,
Stefan

--zYR6uqo+9eG5ZY9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaiCoACgkQnKSrs4Gr
c8jaCggAiPAw+aTVrrMgYTa8ZedRV1wLjpV5lST53EB62gJPS57Ru3GedV9WCoBj
l/s8rZSmlc+p/iO4BTaYSoonSePjzs81JlhDXB3WRYVAFUYplCHGdlOfhkOfueND
T/OCXMkwooUDcUgSJKUCM+gjFw52J2Xppw1HlzOSOxSGmuyJsNPPUlrfjiNDwxGq
THTaMGzpNPvLEQLhw9cLzrg1eE6W6z3vNeJULIYIwYfQE9cIbeo2Hx8c1rmFhasF
mjL0+4PXOjH2CcotBw8EfyUsx3GV1BbjB/RhbEzr7SG4YCC748WCx2xatAIorzZd
Vf68V/bHVGXLlN2FDniw5dFCdMSzUA==
=Vtb2
-----END PGP SIGNATURE-----

--zYR6uqo+9eG5ZY9J--


