Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA4718A8C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 21:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541952.845241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4RqS-0001Yq-9y; Wed, 31 May 2023 19:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541952.845241; Wed, 31 May 2023 19:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4RqS-0001W8-7C; Wed, 31 May 2023 19:50:56 +0000
Received: by outflank-mailman (input) for mailman id 541952;
 Wed, 31 May 2023 19:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nj2T=BU=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4RqQ-0001W2-I1
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 19:50:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 711bab0c-ffec-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 21:50:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-5fq1aeImPn-bTRYXg3IKzw-1; Wed, 31 May 2023 15:50:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA493800888;
 Wed, 31 May 2023 19:50:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14743C154D7;
 Wed, 31 May 2023 19:50:43 +0000 (UTC)
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
X-Inumbo-ID: 711bab0c-ffec-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685562649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yidvGRAT/OnP5PqG+xEcTx82SlvRwvyy1Kdgkf5/4pY=;
	b=Q7PZT/zcH91sp9tX066gyFRABstWY8y3ff0JiXFKnbJEO2pO9MJZqVVeQ864we0YD3L2B7
	sk0HnaZcNZ964WiASrU6OqAJvMSWZNOoyaDj1PEk8FOXeg1jI0QNiBGtN7YyKUmuuOKdVH
	gIieZXyJ7XUdMrlmtltQ8RquGOiPvUE=
X-MC-Unique: 5fq1aeImPn-bTRYXg3IKzw-1
Date: Wed, 31 May 2023 15:50:42 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kwolf@redhat.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, eblake@redhat.com,
	Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
	sgarzare@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Julia Suvorova <jusual@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] block: add blk_io_plug_call() API
Message-ID: <20230531195042.GA1509371@fedora>
References: <20230530180959.1108766-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RoKjmCOI6qwAyphs"
Content-Disposition: inline
In-Reply-To: <20230530180959.1108766-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--RoKjmCOI6qwAyphs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,
Do you want to review the thread-local blk_io_plug() patch series or
should I merge it?

Thanks,
Stefan

--RoKjmCOI6qwAyphs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR3pRIACgkQnKSrs4Gr
c8h2Xgf/fXnY9mbKX8MwRoUNXIaProbM9HoJz8wrU/R4i3OpVIfIGHwbXa/Xpt7G
/Oyn/gXv+daEcC7yfOf8B+PzcCucvadYTcN/DvioPKz0ve4czwEjxsJnQznutoUx
kfTVC1OTkgkijEi4GpUNt83ghjVEmp6oos0ggfWSCyQZYWR6MK1/Lh5svV8viiR1
GJq+d2LBDnbC5eCk0dCqdZemAh0tuPr5nSR8edI5WUG830VgsaQnE0gzvF5IsfN5
9VxD3iP6bQHS59zn/hoOV91tqA+ohhwP/qHsUAQQLpQLo5dfH6d6fZ9Y3Y3n53HG
sLBl2KWOYj4e5Q4tSgmBoUplfPCdvQ==
=ndb5
-----END PGP SIGNATURE-----

--RoKjmCOI6qwAyphs--


