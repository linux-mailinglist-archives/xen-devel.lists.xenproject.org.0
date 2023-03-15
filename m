Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63D6BB777
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510110.787211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSuq-0007Ie-Ly; Wed, 15 Mar 2023 15:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510110.787211; Wed, 15 Mar 2023 15:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSuq-0007Fq-Ip; Wed, 15 Mar 2023 15:19:48 +0000
Received: by outflank-mailman (input) for mailman id 510110;
 Wed, 15 Mar 2023 15:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szRX=7H=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pcSuo-0007Fk-7B
 for xen-devel@lists.xen.org; Wed, 15 Mar 2023 15:19:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf54e288-c344-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 16:19:43 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-Y1iB8-ULMEmIOBRp7xXAWQ-1; Wed, 15 Mar 2023 11:19:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7AD88028B3;
 Wed, 15 Mar 2023 15:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B1CA140E95F;
 Wed, 15 Mar 2023 15:19:28 +0000 (UTC)
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
X-Inumbo-ID: cf54e288-c344-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678893582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mcTfM44RSuru962OZIvDWU0ncftfq86SRtNTtDSqztY=;
	b=OXl+QaTvFoU//CBE4XWfGushgbVrkWxxv4CNvugJgC3VcTxS7M6k0vZW/U5vcNICkItetI
	Qnu5aIjYxNnHbxlCvkPsEsboNf6KwdTaeDsPBg6GyDtvrdniJCrnYxwjl5kJifwTCOBI4B
	ERgGgusOPTus8ZtRdxnjJ5vNWjmw498=
X-MC-Unique: Y1iB8-ULMEmIOBRp7xXAWQ-1
Date: Wed, 15 Mar 2023 11:19:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Message-ID: <20230315151926.GA16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O6Z1j1jWA1rh9Wk0"
Content-Disposition: inline
In-Reply-To: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7


--O6Z1j1jWA1rh9Wk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:21:00PM +0530, Viresh Kumar wrote:
> The same layout is defined twice, once in "single memory region
> description" and then in "memory regions description".
>=20
> Separate out details of memory region from these two and reuse the same
> definition later on.
>=20
> While at it, also rename "memory regions description" to "multiple
> memory regions description", to avoid potential confusion around similar
> names. And define single region before multiple ones.
>=20
> This is just a documentation optimization, the protocol remains the same.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 39 +++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--O6Z1j1jWA1rh9Wk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR4f4ACgkQnKSrs4Gr
c8hxuAgAp4tv1RvL4VEQf8h2eNofdFyh5KtzUUn3Q8+eRtHJ3diMD9MshFHl+4JC
5M+4rQoODTICf0bgn659wYs5D2fF0cSYSAsqJx0594lLJknX0LX+YvRGWycVz/8l
81+iNJPaGsPU5k32TGorK5F3ZoxrnzgH6f8BPnVkACmABhyOZcVd+ZLHZZdatiLr
4En+5Ngv9Fd7eq66UO3JilZJZTTai0zWGU+enR8CmTGoD8olqx9gJvUOJjpEPkcK
3Muq52sLH3DaiK1/KUaz9g6j0TYlHwu+65YGRXE4vNM4Po8bY8GeRZRrnBZFcLmA
OPu6eaIIlskeujoEmUZ0StMCy0BT4w==
=GWpD
-----END PGP SIGNATURE-----

--O6Z1j1jWA1rh9Wk0--


