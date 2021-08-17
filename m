Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05BC3EECE9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167841.306416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyfa-0006Gk-4D; Tue, 17 Aug 2021 12:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167841.306416; Tue, 17 Aug 2021 12:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyfa-0006Ds-07; Tue, 17 Aug 2021 12:58:18 +0000
Received: by outflank-mailman (input) for mailman id 167841;
 Tue, 17 Aug 2021 12:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T0O=NI=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1mFyfY-0006Dm-TG
 for xen-devel@lists.xen.org; Tue, 17 Aug 2021 12:58:17 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bcd08db7-1b14-472a-8d85-825be23314ad;
 Tue, 17 Aug 2021 12:58:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-A8iHjmldNyCPpTWHkDYjdg-1; Tue, 17 Aug 2021 08:58:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A04F107ACF5;
 Tue, 17 Aug 2021 12:58:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD06519C44;
 Tue, 17 Aug 2021 12:58:07 +0000 (UTC)
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
X-Inumbo-ID: bcd08db7-1b14-472a-8d85-825be23314ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629205094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yxy4RnBBXaJlJtwsS11lGB0KxeEbVc0i8ggXvO44wak=;
	b=OraNdCWrLGubVnBXT2o72Tx6ufKWGwl4chabETDHzP6olLTZRDojXIvBflZxn7h/dTktBk
	WsI4Dq9CzsihGI4e53W0qfFc1uU9f6JJVsb7ylxIaw3k9BAT5s8mOhk9S5f5Rc3YNyvWok
	Z4un0cN6CpmSEgP/VgZudJfSf8of6LA=
X-MC-Unique: A8iHjmldNyCPpTWHkDYjdg-1
Date: Tue, 17 Aug 2021 11:41:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com,
	Srivatsa Vaddagiri <vatsa@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Wei.Chen@arm.com,
	olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
	Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org,
	jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MtdJiD33XPKc+AKR"
Content-Disposition: inline

--MtdJiD33XPKc+AKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > Could we consider the kernel internally converting IOREQ messages from
> > the Xen hypervisor to eventfd events? Would this scale with other kerne=
l
> > hypercall interfaces?
> >=20
> > So any thoughts on what directions are worth experimenting with?
> =20
> One option we should consider is for each backend to connect to Xen via
> the IOREQ interface. We could generalize the IOREQ interface and make it
> hypervisor agnostic. The interface is really trivial and easy to add.
> The only Xen-specific part is the notification mechanism, which is an
> event channel. If we replaced the event channel with something else the
> interface would be generic. See:
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/=
ioreq.h#L52

There have been experiments with something kind of similar in KVM
recently (see struct ioregionfd_cmd):
https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.161382=
8727.git.eafanasova@gmail.com/

> There is also another problem. IOREQ is probably not be the only
> interface needed. Have a look at
> https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2. Don't we also=
 need
> an interface for the backend to inject interrupts into the frontend? And
> if the backend requires dynamic memory mappings of frontend pages, then
> we would also need an interface to map/unmap domU pages.
>=20
> These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> and self-contained. It is easy to add anywhere. A new interface to
> inject interrupts or map pages is more difficult to manage because it
> would require changes scattered across the various emulators.

Something like ioreq is indeed necessary to implement arbitrary devices,
but if you are willing to restrict yourself to VIRTIO then other
interfaces are possible too because the VIRTIO device model is different
from the general purpose x86 PIO/MMIO that Xen's ioreq seems to support.

Stefan

--MtdJiD33XPKc+AKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEbkj0ACgkQnKSrs4Gr
c8jIgAf/ZpT5ZF/StADSes4RfNq0J1UFOgql3jeVsqkD7q9bPZaIvtADoVdSduiw
zDiBNp5q/LkIIhE+rfRjAO2nA3rpYrp6fWlmRh6hmRHiCAFKIQ1lsmi39noeDTe4
IPm7VASzJ0VRtMxJ88a/pS4HldM2pQZLU2q4f2gtXuGD7Kj5VLn/6LfEE6tzU98h
jpGxjZlx/zrc37X9Wk2tL8Zg6PJpug7B308KpaJFB5jHOzSww27+ETTPBV4LKHsf
zMnevfYRDTH3wJObd+FMmzDsD25EHs/hf1VC6yghoNjgkQP//5FYyoN4csg1tAfK
zPFuCYSZ4qMY83x5bbL6i6rqK2jz1g==
=Ehb+
-----END PGP SIGNATURE-----

--MtdJiD33XPKc+AKR--


