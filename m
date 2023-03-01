Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E886A721C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 18:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504185.776757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQGq-00053q-Nu; Wed, 01 Mar 2023 17:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504185.776757; Wed, 01 Mar 2023 17:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQGq-00051O-KS; Wed, 01 Mar 2023 17:29:40 +0000
Received: by outflank-mailman (input) for mailman id 504185;
 Wed, 01 Mar 2023 17:29:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYBP=6Z=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pXQGo-00051I-2b
 for xen-devel@lists.xen.org; Wed, 01 Mar 2023 17:29:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a688ae-b856-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 18:29:33 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-AmWt6nP_Mm2y_Io2Gr2Kzw-1; Wed, 01 Mar 2023 12:29:29 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DA843C18346;
 Wed,  1 Mar 2023 17:29:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAFD0492C14;
 Wed,  1 Mar 2023 17:29:27 +0000 (UTC)
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
X-Inumbo-ID: a0a688ae-b856-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677691771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GNUtwYSzrma9QPDi9kyv0SaiYSEO9P+i9joIVnBked8=;
	b=DW9OztKZh+W3ovLp86zzNTEJWa4C0m4F7cfUfPs+7MuAjUG8b7GRj9Ug7FynI/VG8Tv5NL
	gE5DrDsFgswM1PJ2z50VejJuPI6sguSom3PNZt4dAYbgR5kTnnYhH9176Ew1h1tfN1uXK+
	BBYw3HGqYsszISxY0LD57FW/PWR3894=
X-MC-Unique: AmWt6nP_Mm2y_Io2Gr2Kzw-1
Date: Wed, 1 Mar 2023 12:29:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <Y/+LdfF0rL3wEqfd@fedora>
References: <Y/9zkDAS4odz93GM@fedora>
 <877cw0ctpr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ji5TbNtGJsInl60F"
Content-Disposition: inline
In-Reply-To: <877cw0ctpr.fsf@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9


--ji5TbNtGJsInl60F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2023 at 04:31:41PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > [[PGP Signed Part:Undecided]]
> > Resend - for some reason my email didn't make it out.
> >
> > From: Stefan Hajnoczi <stefanha@redhat.com>
> > Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
> >  mapping support
> > To: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S.
> >  Tsirkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org=
>,
> >  Alex Benn=E9e <alex.bennee@linaro.org>,
> > 	stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
> >  <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
> >  <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
> >  Boeuf
> > 	<sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>, Math=
ieu
> >  Poirier <mathieu.poirier@linaro.org>
> > Date: Tue, 21 Feb 2023 10:17:01 -0500 (1 week, 1 day, 1 hour ago)
> > Flags: seen, signed, personal
> >
> > On Tue, Feb 21, 2023 at 03:20:41PM +0530, Viresh Kumar wrote:
> >> The current model of memory mapping at the back-end works fine with
> >> Qemu, where a standard call to mmap() for the respective file
> >> descriptor, passed from front-end, is generally all we need to do befo=
re
> >> the front-end can start accessing the guest memory.
> >>=20
> >> There are other complex cases though, where we need more information at
> >> the backend and need to do more than just an mmap() call. For example,
> >> Xen, a type-1 hypervisor, currently supports memory mapping via two
> >> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (v=
ia
> >> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> >> followed by an ioctl() (or vice-versa), and need to pass extra
> >> information via the ioctl(), like the Xen domain-id of the guest whose
> >> memory we are trying to map.
> >>=20
> >> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> >> lets the back-end know about the additional memory mapping requirement=
s.
> >> When this feature is negotiated, the front-end can send the
> >> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> >> information to the back-end.
> >>=20
> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> ---
> >>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >
> > The alternative to an in-band approach is to configure these details
> > out-of-band. For example, via command-line options to the vhost-user
> > back-end:
> >
> >   $ my-xen-device --mapping-type=3Dforeign-mapping --domain-id=3D123
> >
> > I was thinking about both approaches and don't see an obvious reason to
> > choose one or the other. What do you think?
>=20
> In-band has the nice property of being dynamic and not having to have
> some other thing construct command lines. We are also trying to keep the
> daemons from being Xen specific and keep the type of mmap as an
> implementation detail that is mostly elided by the rust-vmm memory
> traits.

Okay.

> >
> >> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> >> index 3f18ab424eb0..f2b1d705593a 100644
> >> --- a/docs/interop/vhost-user.rst
> >> +++ b/docs/interop/vhost-user.rst
> >> @@ -258,6 +258,23 @@ Inflight description
> >> =20
> >>  :queue size: a 16-bit size of virtqueues
> >> =20
> >> +Custom mmap description
> >> +^^^^^^^^^^^^^^^^^^^^^^^
> >> +
> >> ++-------+-------+
> >> +| flags | value |
> >> ++-------+-------+
> >> +
> >> +:flags: 64-bit bit field
> >> +
> >> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory =
mapping.
> >> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapp=
ing.
> >> +
> >> +:value: a 64-bit hypervisor specific value.
> >> +
> >> +- For Xen foreign or grant memory access, this is set with guest's xe=
n domain
> >> +  id.
> >
> > This is highly Xen-specific. How about naming the feature XEN_MMAP
> > instead of CUSTOM_MMAP? If someone needs to add other mmap data later,
> > they should define their own struct instead of trying to squeeze into
> > the same fields as Xen.
>=20
> We hope to support additional mmap mechanisms in the future - one
> proposal is to use the hypervisor specific interface to support an
> ioctl() that creates a domain specific device which can then be treated
> more generically.
>=20
> Could we not declare the message as flag + n bytes of domain specific
> message as defined my msglen?

What is the advantage over defining separate messages? Separate messages
are cleaner and more typesafe.

> > There is an assumption in this design that a single
> > VHOST_USER_CUSTOM_MMAP message provides the information necessary for
> > all mmaps. Are you sure the limitation that every mmap belongs to the
> > same domain will be workable in the future?
>=20
> Like a daemon servicing multiple VMs? Won't those still be separate
> vhost-user control channels though?

I don't have a concrete example, but was thinking of a guest that shares
memory with other guests (like the experimental virtio-vhost-user
device). Maybe there would be a scenario where some memory belongs to
one domain and some belongs to another (but has been mapped into the
first domain), and the vhost-user back-end needs to access both.

The other thing that comes to mind is that the spec must clearly state
which mmaps are affected by the Xen domain information. For example,
just mem table memory regions and not the
VHOST_USER_PROTOCOL_F_LOG_SHMFD feature?

> >
> >> +
> >>  C structure
> >>  -----------
> >> =20
> >> @@ -867,6 +884,7 @@ Protocol features
> >>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
> >>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
> >>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> >> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
> >> =20
> >>  Front-end message types
> >>  -----------------------
> >> @@ -1422,6 +1440,20 @@ Front-end message types
> >>    query the back-end for its device status as defined in the Virtio
> >>    specification.
> >> =20
> >> +``VHOST_USER_CUSTOM_MMAP``
> >
> > Most vhost-user protocol messages have a verb like
> > get/set/close/add/listen/etc. I suggest renaming this to
> > VHOST_USER_SET_XEN_MMAP_INFO.
>=20
> VHOST_USER_CONFIG_MMAP_QUIRKS?
>=20
> VHOST_USER_CONFIG_MMAP_TYPE?

SET is the verb that's often used when the front-end provides
configuration parameters to the back-end (e.g.
VHOST_USER_SET_MEM_TABLE, VHOST_USER_SET_FEATURES, etc).

Stefan

--ji5TbNtGJsInl60F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP/i3UACgkQnKSrs4Gr
c8g0qgf/aroAfmrv1TKO2MYdPTHh2fwqteXAzCt8TAYg0U3/xHgLY/ao9VPUDPKu
ZJkCQ/HBUSZnHbh8XkXwbq6D7vIyXBi6SYbQ59aLIPojafvrXUaKPgPD/4pr0Qut
bToML/9vzfGInhDDB2b6appsFUVpx2MIJf9mWDhsxeL9TeMcbiy+zefjizBejGAL
OM0aRjnxrG8pB4DIXlLM+K5gNm1hvuE/8SR0gEFQQ8KLmu4HpkTTCm1/hLvrfXRL
uCCAOg6CKfUfxJcxIywC4TgsJ6b3/7r8O3wwItcmvPCup8mc5dnz7c9W9JqkOU/i
MrmqUcDNOLz9nOqJfGufULCLFLawRA==
=OtkO
-----END PGP SIGNATURE-----

--ji5TbNtGJsInl60F--


