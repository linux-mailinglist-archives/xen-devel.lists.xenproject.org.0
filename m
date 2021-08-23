Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E2D3F4811
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 11:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170275.311038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6jR-0005gh-Fm; Mon, 23 Aug 2021 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170275.311038; Mon, 23 Aug 2021 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6jR-0005et-Cd; Mon, 23 Aug 2021 09:59:05 +0000
Received: by outflank-mailman (input) for mailman id 170275;
 Mon, 23 Aug 2021 09:59:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cmfa=NO=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1mI6jP-0005en-Tu
 for xen-devel@lists.xen.org; Mon, 23 Aug 2021 09:59:04 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bdc62580-03f8-11ec-a86d-12813bfff9fa;
 Mon, 23 Aug 2021 09:59:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-XuRXJwcmOoOrjRgUS5BQsA-1; Mon, 23 Aug 2021 05:58:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B76C7402;
 Mon, 23 Aug 2021 09:58:53 +0000 (UTC)
Received: from localhost (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E095019C44;
 Mon, 23 Aug 2021 09:58:52 +0000 (UTC)
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
X-Inumbo-ID: bdc62580-03f8-11ec-a86d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629712741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YzGe2IEY0KZ8Y4xV34CSaJqV45CvoHN7keeVYoFE7J4=;
	b=YSq+Y4XXIK3poM93h+84b2hzdMEY5Igz1AyVZrQdl1CbJNy6vD0dU3DsEIOAZ45Y9lr5wm
	OMVCkyM7N/V7OBTgS2mQJvfsEQYBKoVBk2MwsMI7nnI8jyJHwG29WkIR2v93+T8iD74Nd5
	h+gtcXZ3a/yHGZMXa1ToJ6b5dI3ikAY=
X-MC-Unique: XuRXJwcmOoOrjRgUS5BQsA-1
Date: Mon, 23 Aug 2021 10:58:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Alex Benn??e <alex.bennee@linaro.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
Message-ID: <YSNxVjlpCsc+chEC@stefanha-x1.localdomain>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <20210823062500.GC40863@laputa>
MIME-Version: 1.0
In-Reply-To: <20210823062500.GC40863@laputa>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yK3XVrpRKx0e7peX"
Content-Disposition: inline

--yK3XVrpRKx0e7peX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 03:25:00PM +0900, AKASHI Takahiro wrote:
> Hi Stefan,
>=20
> On Tue, Aug 17, 2021 at 11:41:01AM +0100, Stefan Hajnoczi wrote:
> > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > > Could we consider the kernel internally converting IOREQ messages f=
rom
> > > > the Xen hypervisor to eventfd events? Would this scale with other k=
ernel
> > > > hypercall interfaces?
> > > >=20
> > > > So any thoughts on what directions are worth experimenting with?
> > > =20
> > > One option we should consider is for each backend to connect to Xen v=
ia
> > > the IOREQ interface. We could generalize the IOREQ interface and make=
 it
> > > hypervisor agnostic. The interface is really trivial and easy to add.
> > > The only Xen-specific part is the notification mechanism, which is an
> > > event channel. If we replaced the event channel with something else t=
he
> > > interface would be generic. See:
> > > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/=
hvm/ioreq.h#L52
> >=20
> > There have been experiments with something kind of similar in KVM
> > recently (see struct ioregionfd_cmd):
> > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.16=
13828727.git.eafanasova@gmail.com/
>=20
> Do you know the current status of Elena's work?
> It was last February that she posted her latest patch
> and it has not been merged upstream yet.

Elena worked on this during her Outreachy internship. At the moment no
one is actively working on the patches.

> > > There is also another problem. IOREQ is probably not be the only
> > > interface needed. Have a look at
> > > https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2. Don't we =
also need
> > > an interface for the backend to inject interrupts into the frontend? =
And
> > > if the backend requires dynamic memory mappings of frontend pages, th=
en
> > > we would also need an interface to map/unmap domU pages.
> > >=20
> > > These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> > > and self-contained. It is easy to add anywhere. A new interface to
> > > inject interrupts or map pages is more difficult to manage because it
> > > would require changes scattered across the various emulators.
> >=20
> > Something like ioreq is indeed necessary to implement arbitrary devices=
,
> > but if you are willing to restrict yourself to VIRTIO then other
> > interfaces are possible too because the VIRTIO device model is differen=
t
> > from the general purpose x86 PIO/MMIO that Xen's ioreq seems to support=
.
>=20
> Can you please elaborate your thoughts a bit more here?
>=20
> It seems to me that trapping MMIOs to configuration space and
> forwarding those events to BE (or device emulation) is a quite
> straight-forward way to emulate device MMIOs.
> Or do you think of something of protocols used in vhost-user?
>=20
> # On the contrary, virtio-ivshmem only requires a driver to explicitly
> # forward a "write" request of MMIO accesses to BE. But I don't think
> # it's your point.=20

See my first reply to this email thread about alternative interfaces for
VIRTIO device emulation. The main thing to note was that although the
shared memory vring is used by VIRTIO transports today, the device model
actually allows transports to implement virtqueues differently (e.g.
making it possible to create a VIRTIO over TCP transport without shared
memory in the future).

It's possible to define a hypercall interface as a new VIRTIO transport
that provides higher-level virtqueue operations. Doing this is more work
than using vrings though since existing guest driver and device
emulation code already supports vrings.

I don't know the requirements of Stratos so I can't say if creating a
new hypervisor-independent interface (VIRTIO transport) that doesn't
rely on shared memory vrings makes sense. I just wanted to raise the
idea in case you find that VIRTIO's vrings don't meet your requirements.

Stefan

--yK3XVrpRKx0e7peX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEjcVYACgkQnKSrs4Gr
c8gdnAgAn5gW6trpxBI4eF3tg90QZzgHc+llyARWpRx0MUGkK75BecJy82x/sqWR
G8WZ8c9xn8iU1kCI4FBoknRE6dG2aUh5uoJIiXpdCXjGZ/18vJe+jVRcWDJsa+NR
cf65FiH+7GkDOZRpS0NvJp1e4a3h5Azb1QN9QsS+FK4MEQBZN3tL4UEsmwOk40eM
uT9HMUS+4RIvmkqk5ejtvPIUYyZV4viqHB3/g6K7HdK4TvbrrB1h1jmRlQBP9td9
i3h8N9ApALn0n16tknYTWz8ivBAksA6g/L38G0tSlI+G8SBmoYBKNaDJa8ZPq/BM
K9d+4v1ErJfsigKIsff6wXsdqf5cug==
=dIhB
-----END PGP SIGNATURE-----

--yK3XVrpRKx0e7peX--


