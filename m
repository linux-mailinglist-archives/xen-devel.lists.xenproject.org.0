Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628D70E0D6
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 17:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538522.838517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UEd-0006AS-GL; Tue, 23 May 2023 15:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538522.838517; Tue, 23 May 2023 15:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UEd-00067c-DU; Tue, 23 May 2023 15:47:39 +0000
Received: by outflank-mailman (input) for mailman id 538522;
 Tue, 23 May 2023 15:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1UEc-00066y-6e
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 15:47:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2359e778-f981-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 17:47:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-oNyRN5KSNaOub17gdHHNcw-1; Tue, 23 May 2023 11:47:30 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11057858F1B;
 Tue, 23 May 2023 15:47:30 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84A3F492B0A;
 Tue, 23 May 2023 15:47:29 +0000 (UTC)
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
X-Inumbo-ID: 2359e778-f981-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684856855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O3B1/QDqYYFNADsiJ/SScpfUTui+YFuZRwwUutZa9ls=;
	b=b1b2JOHJXB7VhKcjDTl0U8s7kRuuo+eHyMGNzemKdL1kZPNzroAhm4iX8fP1/p/Jx8zvyC
	Yycxls1hojo173myJxCGOP2La9/Vkoev8Hlm79oDUIIktS47dlHPvKBolobzEnmaqbs4sc
	Y/qO/m5Ir7RaaK3EbpGHV1Ikhzs1mm0=
X-MC-Unique: oNyRN5KSNaOub17gdHHNcw-1
Date: Tue, 23 May 2023 11:47:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/6] block/nvme: convert to blk_io_plug_call() API
Message-ID: <20230523154727.GC96478@fedora>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-3-stefanha@redhat.com>
 <utuievutol5cux2axpym7x3t4tueresl4tbqadizc36f5yblpi@ndpva7u6croa>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SagQeXz/GIVguVBW"
Content-Disposition: inline
In-Reply-To: <utuievutol5cux2axpym7x3t4tueresl4tbqadizc36f5yblpi@ndpva7u6croa>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--SagQeXz/GIVguVBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 10:46:25AM +0200, Stefano Garzarella wrote:
> On Wed, May 17, 2023 at 06:10:18PM -0400, Stefan Hajnoczi wrote:
> > Stop using the .bdrv_co_io_plug() API because it is not multi-queue
> > block layer friendly. Use the new blk_io_plug_call() API to batch I/O
> > submission instead.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > block/nvme.c | 44 ++++++++++++--------------------------------
> > 1 file changed, 12 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/block/nvme.c b/block/nvme.c
> > index 5b744c2bda..100b38b592 100644
> > --- a/block/nvme.c
> > +++ b/block/nvme.c
> > @@ -25,6 +25,7 @@
> > #include "qemu/vfio-helpers.h"
> > #include "block/block-io.h"
> > #include "block/block_int.h"
> > +#include "sysemu/block-backend.h"
> > #include "sysemu/replay.h"
> > #include "trace.h"
> >=20
> > @@ -119,7 +120,6 @@ struct BDRVNVMeState {
> >     int blkshift;
> >=20
> >     uint64_t max_transfer;
> > -    bool plugged;
> >=20
> >     bool supports_write_zeroes;
> >     bool supports_discard;
> > @@ -282,7 +282,7 @@ static void nvme_kick(NVMeQueuePair *q)
> > {
> >     BDRVNVMeState *s =3D q->s;
> >=20
> > -    if (s->plugged || !q->need_kick) {
> > +    if (!q->need_kick) {
> >         return;
> >     }
> >     trace_nvme_kick(s, q->index);
> > @@ -387,10 +387,6 @@ static bool nvme_process_completion(NVMeQueuePair =
*q)
> >     NvmeCqe *c;
> >=20
> >     trace_nvme_process_completion(s, q->index, q->inflight);
> > -    if (s->plugged) {
> > -        trace_nvme_process_completion_queue_plugged(s, q->index);
>=20
> Should we remove "nvme_process_completion_queue_plugged(void *s,
> unsigned q_index) "s %p q #%u" from block/trace-events?

Will fix, thanks!

Stefan

--SagQeXz/GIVguVBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRs4A8ACgkQnKSrs4Gr
c8jRLggAnHAGUNyvJQIwz9Dtrtu8UXLxyZdpgSQS/HH5rqZy6JfdddIMYu/fw4JF
3AGDfNBXW+1wq1ox5p45zwVw+Az+NX+m46LDuBjCuEj7dtS7K8ASVrS5UMV1hWQ7
Hb54eovBy/L+nSQBtSX4ILFdyhA+aOIaMC/OFyClMz1/yzNmnUWyupjr/B8jf3Xf
/vGlY2CP3WjoTrYvIDxhZ7JhIStLB3r4VfVIiIMhD3JKkSjxCOjqAiQwPJtFDMQ2
2JI2bZtYLzfxJpq6y1grntDAzDLg3wCYybtPUxMbb45vvR+udLDfN5fcMDkX5vLs
9pChlshANBJlHUF5rzPmx4ROD1Kccw==
=S5t/
-----END PGP SIGNATURE-----

--SagQeXz/GIVguVBW--


