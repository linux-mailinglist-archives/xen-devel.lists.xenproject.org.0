Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CD56BB7A2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510118.787241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcT09-0001Rl-Qk; Wed, 15 Mar 2023 15:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510118.787241; Wed, 15 Mar 2023 15:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcT09-0001PK-O0; Wed, 15 Mar 2023 15:25:17 +0000
Received: by outflank-mailman (input) for mailman id 510118;
 Wed, 15 Mar 2023 15:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szRX=7H=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pcT08-0001PE-GD
 for xen-devel@lists.xen.org; Wed, 15 Mar 2023 15:25:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94142081-c345-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 16:25:13 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-nlHLXK6FOqadA5943BuqQA-1; Wed, 15 Mar 2023 11:25:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383AA280A322;
 Wed, 15 Mar 2023 15:25:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60E49C164E7;
 Wed, 15 Mar 2023 15:25:05 +0000 (UTC)
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
X-Inumbo-ID: 94142081-c345-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678893912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmsDWDJ1wYkb1pq/w2HSM4F9if02u6jamfytLtq8BF8=;
	b=QdWRmK11CNDsTlVdyi749ESSKHpWhkaAJjUuy1l1hj/gzXhk0yPGBZoy8wOZW4D3FbffJU
	XaZF8Jpkm5LRlWY4uiOqUDWPYGbP+llMUSNx7dTQmv4TnV+5/DklrzlyohUSgBXopN0LFe
	20K1qSj2qMF4avGrCsWjklAyAc3RGO4=
X-MC-Unique: nlHLXK6FOqadA5943BuqQA-1
Date: Wed, 15 Mar 2023 11:25:03 -0400
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
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping
 quirks
Message-ID: <20230315152503.GC16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OCgU33HjGcfce1Ev"
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--OCgU33HjGcfce1Ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:20:59PM +0530, Viresh Kumar wrote:
> Hello,
>=20
> This patchset tries to update the vhost-user protocol to make it support =
special
> memory mapping required in case of Xen hypervisor.
>=20
> The first patch is mostly cleanup and second one introduces a new xen spe=
cific
> feature.
>=20
> V2->V3:
> - Remove the extra message and instead update the memory regions to carry
>   additional data.
>=20
> - Drop the one region one mmap relationship and allow back-end to map onl=
y parts
>   of a region at once, required for Xen grant mappings.
>=20
> - Additional cleanup patch 1/2.
>=20
> V1->V2:
> - Make the custom mmap feature Xen specific, instead of being generic.
> - Clearly define which memory regions are impacted by this change.
> - Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
> - Additional Bit(2) property in flags.

Looks good, thanks!

Michael is the maintainer and this patch series will go through his tree.

Stefan

--OCgU33HjGcfce1Ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR408ACgkQnKSrs4Gr
c8gHnQf/QCidE8WSy1ka0dk9J5LPoXLVAWi2jeZa8dQXbtfkfPLQVuMD94klQw0p
ttlBsAdsyw5lvbC0fdSClu12bCgKzMDVNH/vXFNkSkDWYFX4gIgx0jtDfeYbtW75
YmWbol1fw+CM/RWkUWKm+FsyyGge8iNDf7HfM4BvpzfvdZh+4YSOEj+xBmYaq9VT
NGM5DzCy5N8LpC/oHv3sxnKLXUqML6+rdlHvcAZpDlos4UzcobtHAh7YOhumhBuw
qfCXVKjSQ7hglcFaZRTUtoPOWZR+a3GpRAhS3V6sTryjmal/wuOrKe8SAYXD9ba1
dPqU2PNw8Qq3755oaw/Haw+2cO9JXw==
=BraW
-----END PGP SIGNATURE-----

--OCgU33HjGcfce1Ev--


