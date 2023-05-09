Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349236FCDDF
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 20:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532431.828641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSBM-0001ho-GC; Tue, 09 May 2023 18:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532431.828641; Tue, 09 May 2023 18:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSBM-0001f3-DP; Tue, 09 May 2023 18:35:28 +0000
Received: by outflank-mailman (input) for mailman id 532431;
 Tue, 09 May 2023 18:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4ct=A6=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pwSBK-0001ex-B2
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 18:35:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42c75559-ee98-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 20:35:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-DaIJTyJ1OoywXMxBU_OwCg-1; Tue, 09 May 2023 14:35:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB1E38184E0;
 Tue,  9 May 2023 18:35:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0084140C2063;
 Tue,  9 May 2023 18:35:13 +0000 (UTC)
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
X-Inumbo-ID: 42c75559-ee98-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683657323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hK66GgZK4oBJTlqAp6Gt40la0pcXeIc5sZ5w97pfWSM=;
	b=dtOCS4w3fYTvi2jAsD99shMd27u5kkI2v6iVqXB6Obu46+6yn7uvQwfCQsOuJSt0c362Fl
	eSUP5A2K5LHUhdPUabQKgDPmxW3atW+KCjryVjR10zL5NYYlfxxAq6+jMc5xvT/fWTbnGx
	ETae1VkSQFWmdGh/LHMWvraoy5h91og=
X-MC-Unique: DaIJTyJ1OoywXMxBU_OwCg-1
Date: Tue, 9 May 2023 20:35:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
Message-ID: <ZFqSYJaOeKwU1DIo@redhat.com>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <ZFQnSjGiEWuSFWTh@redhat.com>
 <20230509175138.GC1018047@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+wtMkZiYhpfvLEAI"
Content-Disposition: inline
In-Reply-To: <20230509175138.GC1018047@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1


--+wtMkZiYhpfvLEAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 09.05.2023 um 19:51 hat Stefan Hajnoczi geschrieben:
> On Thu, May 04, 2023 at 11:44:42PM +0200, Kevin Wolf wrote:
> > Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> > > v5:
> > > - Use atomic accesses for in_flight counter in vhost-user-server.c [K=
evin]
> > > - Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET ev=
ent
> > >   before unrealizing the SCSIDevice [Kevin]
> > > - Keep vhost-user-blk export .detach() callback so ctx is set to NULL=
 [Kevin]
> > > - Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} call=
backs from
> > >   IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
> > > - Include Kevin's "block: Fix use after free in blockdev_mark_auto_de=
l()" to
> > >   fix a latent bug that was exposed by this series
> >=20
> > I only just finished reviewing v4 when you had already sent v5, but it
> > hadn't arrived yet. I had a few more comments on what are now patches
> > 17, 18, 19 and 21 in v5. I think they all still apply.
>=20
> I'm not sure which comments from v4 still apply. In my email client all
> your replies were already read when I sent v5.

Yes, but I added some more replies after you had sent v5 (and before I
fetched mail again to actually see v5).

> Maybe you can share the Message-Id of something I still need to address?

I thought the patch numbers identified them and were easier, but sure:

Message-ID: <ZFQc89cFJuoGF+qI@redhat.com>
Message-ID: <ZFQgBvWShB4NCymj@redhat.com>
Message-ID: <ZFQivbkVPcX3nECA@redhat.com>
Message-ID: <ZFQk2TdhZ6DiwM4t@redhat.com>

Kevin

--+wtMkZiYhpfvLEAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRakmAACgkQfwmycsiP
L9aOzw//eu0aqw74PsvIWZfWFl7KSwRHbJx2OOazG9pWzqezZB/pFVvTwtGHL4+Q
ltXsY1aWDqysXFihI1AGxyqK16v0o8oSdxIk+dDAdU8FGgqJu70yk1nH7fYJUnW4
CYITZ0TE4w8OESRt4E219tfd/JsZmKzHnmY5cULkogXGhwSRZlekD3BTB5rXAhGh
gOOR97HNmyWa5/syO1Z5XNd6G79z6AWUg1es9IxEaYziuViRPjTPMVfpbm0BiF8I
O46S+Iz9S2yFAT18pOdnp5Vq51qerrNQzuhJZ++SktVRgUIjLoHtwxnGTf2eB7Jk
Rf9K9rBu0H2Yoj0Lgt7uOvNSGqnH+9gcYiZltqseArCwsozeJhZDwMnYpEe/USYP
PROvYwT7il2VsqYgKIvVuUcw3ev3tH9aoreHe1e6uYjfBFpVDKL0yCc3SLZ/Kezw
hd8Vpa0Hff0zf8cbhb3IEkP0wr0W4I6ccMSzvTvJoG8hC+YVHu0vSqZ9eQYLFhnf
P8R9xnNDt5RaLyzNcCAuD2D4NAOK/D2tnJ7BpDhaxqqT1AoQPHvBj3vIW8b56/rk
PWJ1h6qNz524X617jMUKC8cMoyUuVFt5mghZyT3krbT49IIteY2H2vS0AnRrLSSs
+qsNnB6Ol7zV2j/aFK+IqKsc6rFIRnFm6LiI/JBhIdbduWMpv3c=
=67t7
-----END PGP SIGNATURE-----

--+wtMkZiYhpfvLEAI--


