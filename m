Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D952E6BB795
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510116.787230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSyu-0000s9-HB; Wed, 15 Mar 2023 15:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510116.787230; Wed, 15 Mar 2023 15:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSyu-0000q9-E7; Wed, 15 Mar 2023 15:24:00 +0000
Received: by outflank-mailman (input) for mailman id 510116;
 Wed, 15 Mar 2023 15:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szRX=7H=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pcSys-0000q1-Nb
 for xen-devel@lists.xen.org; Wed, 15 Mar 2023 15:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f73eb8-c345-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 16:23:57 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-em-7fTesP0K7Dia1OiuQ0g-1; Wed, 15 Mar 2023 11:23:49 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD832801206;
 Wed, 15 Mar 2023 15:23:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32CEF400F5D;
 Wed, 15 Mar 2023 15:23:47 +0000 (UTC)
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
X-Inumbo-ID: 66f73eb8-c345-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678893836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTxjUwaGNrU997YXmd1Gd07OQ6YXEnGZ+ubJOcPfNTY=;
	b=P7ruHrbm681cjZ6ufsJD1l9DijICSkhq522buP4vgl4Uomr209BhmA+3/pxgS1LP2a/yLu
	ytTjCc89gC4jYTU6f2xZcQnS+GISTzXQumlj9yjiAn5Ue1tflC6fhyDXbKyLeUapbt1/8w
	DM4tsaOdbXV2HriHyWVX7X3U4p8GCTY=
X-MC-Unique: em-7fTesP0K7Dia1OiuQ0g-1
Date: Wed, 15 Mar 2023 11:23:46 -0400
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
Subject: Re: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory mapping
 support
Message-ID: <20230315152346.GB16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P0+YC7C2o+OYytsg"
Content-Disposition: inline
In-Reply-To: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--P0+YC7C2o+OYytsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:21:01PM +0530, Viresh Kumar wrote:
> The current model of memory mapping at the back-end works fine where a
> standard call to mmap() (for the respective file descriptor) is enough
> before the front-end can start accessing the guest memory.
>=20
> There are other complex cases though where the back-end needs more
> information and simple mmap() isn't enough. For example Xen, a type-1
> hypervisor, currently supports memory mapping via two different methods,
> foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
> both these cases, the back-end needs to call mmap() and ioctl(), with
> extra information like the Xen domain-id of the guest whose memory we
> are trying to map.
>=20
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
> the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end will send the additional
> information within the memory regions themselves.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--P0+YC7C2o+OYytsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR4wIACgkQnKSrs4Gr
c8ijJQf/ROItbOzK05kO+CNPMWwO1kNa7SCAoOi6cgj452PZmF2b9cMDlBDfbsL6
jliMKUFGBKkpKxBUD8JcxGlRwcJQT8AwG0KFjCWLwkzNx7BxnrDaXf0I2UgR5E/6
nwHD2R+3K4Ay9QCyIUVrOWmId37SHX2e04d+1+iy7lWdQ1FM5/wc43Bt8aq80oYK
YSuDIuFRXxJdr2Uxr8J9tKgukl3AkoKP8wzFUilzBN9GIMe9wPet8WF7sPwCi5+s
QiQ9CVojLmqiXSDYUrAa2/Y8SypGimyvuy1C3kbNl7i2ow9r7vMr9Vw+/X0uhXb9
Klhmo2NzmGmYT3bQ8RzENH0DYPwCNQ==
=4b2c
-----END PGP SIGNATURE-----

--P0+YC7C2o+OYytsg--


