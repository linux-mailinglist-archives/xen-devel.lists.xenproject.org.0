Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67F3F77F2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172451.314704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuQb-0003cg-3K; Wed, 25 Aug 2021 15:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172451.314704; Wed, 25 Aug 2021 15:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuQa-0003a3-Vc; Wed, 25 Aug 2021 15:02:56 +0000
Received: by outflank-mailman (input) for mailman id 172451;
 Wed, 25 Aug 2021 15:02:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KJl+=NQ=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1mIuQZ-0003ZD-C7
 for xen-devel@lists.xen.org; Wed, 25 Aug 2021 15:02:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 7755608c-5b7a-4360-ba5b-bb19a429b4d3;
 Wed, 25 Aug 2021 15:02:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-rtw4kdQDPlWw5GjUsBP-JA-1; Wed, 25 Aug 2021 11:02:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0272A180E46D;
 Wed, 25 Aug 2021 15:02:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 172A56E0B7;
 Wed, 25 Aug 2021 15:02:42 +0000 (UTC)
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
X-Inumbo-ID: 7755608c-5b7a-4360-ba5b-bb19a429b4d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629903772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ogdw7Cr9W0IiMxVe5AomUWpBrc+xVG8R0z1NKgDz2Do=;
	b=CDCC8/5AUQGtULB/Ukwhp1DeiCaWJqovHWta2YkRqlpAB/rWy2mPCCAb6WQk69G0EDnScp
	eNi1IY7nFu3e5NnP0TfxZYMCViC0knxyCbeg4vtxLbfapuIdH6W5Y70efL8RnPj/OIgAA/
	u72OVm9EAtfedWorxYxanycn0ztSrf4=
X-MC-Unique: rtw4kdQDPlWw5GjUsBP-JA-1
Date: Wed, 25 Aug 2021 16:02:42 +0100
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
Message-ID: <YSZbknGmyh5HnbCK@stefanha-x1.localdomain>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
 <20210823062500.GC40863@laputa>
 <YSNxVjlpCsc+chEC@stefanha-x1.localdomain>
 <20210825102945.GA89209@laputa>
MIME-Version: 1.0
In-Reply-To: <20210825102945.GA89209@laputa>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q2+xa00iXzNkzj8Y"
Content-Disposition: inline

--Q2+xa00iXzNkzj8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 07:29:45PM +0900, AKASHI Takahiro wrote:
> On Mon, Aug 23, 2021 at 10:58:46AM +0100, Stefan Hajnoczi wrote:
> > On Mon, Aug 23, 2021 at 03:25:00PM +0900, AKASHI Takahiro wrote:
> > > Hi Stefan,
> > >=20
> > > On Tue, Aug 17, 2021 at 11:41:01AM +0100, Stefan Hajnoczi wrote:
> > > > On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > > > > Could we consider the kernel internally converting IOREQ messag=
es from
> > > > > > the Xen hypervisor to eventfd events? Would this scale with oth=
er kernel
> > > > > > hypercall interfaces?
> > > > > >=20
> > > > > > So any thoughts on what directions are worth experimenting with=
?
> > > > > =20
> > > > > One option we should consider is for each backend to connect to X=
en via
> > > > > the IOREQ interface. We could generalize the IOREQ interface and =
make it
> > > > > hypervisor agnostic. The interface is really trivial and easy to =
add.
> > > > > The only Xen-specific part is the notification mechanism, which i=
s an
> > > > > event channel. If we replaced the event channel with something el=
se the
> > > > > interface would be generic. See:
> > > > > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/pub=
lic/hvm/ioreq.h#L52
> > > >=20
> > > > There have been experiments with something kind of similar in KVM
> > > > recently (see struct ioregionfd_cmd):
> > > > https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2ed=
d.1613828727.git.eafanasova@gmail.com/
> > >=20
> > > Do you know the current status of Elena's work?
> > > It was last February that she posted her latest patch
> > > and it has not been merged upstream yet.
> >=20
> > Elena worked on this during her Outreachy internship. At the moment no
> > one is actively working on the patches.
>=20
> Does RedHat plan to take over or follow up her work hereafter?
> # I'm simply asking from my curiosity.

At the moment I'm not aware of anyone from Red Hat working on it. If
someone decides they need this KVM API then that could change.

> > > > > There is also another problem. IOREQ is probably not be the only
> > > > > interface needed. Have a look at
> > > > > https://marc.info/?l=3Dxen-devel&m=3D162373754705233&w=3D2. Don't=
 we also need
> > > > > an interface for the backend to inject interrupts into the fronte=
nd? And
> > > > > if the backend requires dynamic memory mappings of frontend pages=
, then
> > > > > we would also need an interface to map/unmap domU pages.
> > > > >=20
> > > > > These interfaces are a lot more problematic than IOREQ: IOREQ is =
tiny
> > > > > and self-contained. It is easy to add anywhere. A new interface t=
o
> > > > > inject interrupts or map pages is more difficult to manage becaus=
e it
> > > > > would require changes scattered across the various emulators.
> > > >=20
> > > > Something like ioreq is indeed necessary to implement arbitrary dev=
ices,
> > > > but if you are willing to restrict yourself to VIRTIO then other
> > > > interfaces are possible too because the VIRTIO device model is diff=
erent
> > > > from the general purpose x86 PIO/MMIO that Xen's ioreq seems to sup=
port.
> > >=20
> > > Can you please elaborate your thoughts a bit more here?
> > >=20
> > > It seems to me that trapping MMIOs to configuration space and
> > > forwarding those events to BE (or device emulation) is a quite
> > > straight-forward way to emulate device MMIOs.
> > > Or do you think of something of protocols used in vhost-user?
> > >=20
> > > # On the contrary, virtio-ivshmem only requires a driver to explicitl=
y
> > > # forward a "write" request of MMIO accesses to BE. But I don't think
> > > # it's your point.=20
> >=20
> > See my first reply to this email thread about alternative interfaces fo=
r
> > VIRTIO device emulation. The main thing to note was that although the
> > shared memory vring is used by VIRTIO transports today, the device mode=
l
> > actually allows transports to implement virtqueues differently (e.g.
> > making it possible to create a VIRTIO over TCP transport without shared
> > memory in the future).
>=20
> Do you have any example of such use cases or systems?

This aspect of VIRTIO isn't being exploited today AFAIK. But the
layering to allow other virtqueue implementations is there. For example,
Linux's virtqueue API is independent of struct vring, so existing
drivers generally aren't tied to vrings.

> > It's possible to define a hypercall interface as a new VIRTIO transport
> > that provides higher-level virtqueue operations. Doing this is more wor=
k
> > than using vrings though since existing guest driver and device
> > emulation code already supports vrings.
>=20
> Personally, I'm open to discuss about your point, but
>=20
> > I don't know the requirements of Stratos so I can't say if creating a
> > new hypervisor-independent interface (VIRTIO transport) that doesn't
> > rely on shared memory vrings makes sense. I just wanted to raise the
> > idea in case you find that VIRTIO's vrings don't meet your requirements=
.
>=20
> While I cannot represent the project's view, what the JIRA task
> that is assigned to me describes:
>   Deliverables
>     * Low level library allowing:
>     * management of virtio rings and buffers
>   [and so on]
> So supporting the shared memory-based vring is one of our assumptions.

If shared memory is allowed then vrings are the natural choice. That way
existing virtio code will work with minimal modifications.

Stefan

--Q2+xa00iXzNkzj8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEmW5EACgkQnKSrs4Gr
c8ibrQf/cUFRy2ec/Q4jqmw4tH0GaS+wFtd6J6r1XuFUbh6W5RlyOrIBCJul4yk7
Xf5bWWcaa5EfcXaQ4Hf13BhETJNoHDHRff0NueaZpFzbkSc42gu21Txi3f+DbeFC
5u0OlT/2dSLgvOMyi3HG30QC/G+hv2AaykWjh4XGtDdiprOcfyTy7P21q7KNZo67
WUwQxVvhdJ0btUVK+AN3FJmgT3fJSa6ehLv4jUuGMD0ep/MG5Ta0ne10Xop0OxN3
tGXkjyrKxVgcS/7uydI5cS6y67PamvXzSxafe2Ihs3l9p3TQq9OREquvhpUtuO7M
ZQDxtgo8aG7bRWQEcwrOeLAzMXq7iw==
=7kHC
-----END PGP SIGNATURE-----

--Q2+xa00iXzNkzj8Y--


