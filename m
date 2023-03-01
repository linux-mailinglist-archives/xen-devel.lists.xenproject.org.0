Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A1C6A7028
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504115.776647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOgD-0001fC-Vh; Wed, 01 Mar 2023 15:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504115.776647; Wed, 01 Mar 2023 15:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOgD-0001cC-Sc; Wed, 01 Mar 2023 15:47:45 +0000
Received: by outflank-mailman (input) for mailman id 504115;
 Wed, 01 Mar 2023 15:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYBP=6Z=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pXOgC-0001c5-8l
 for xen-devel@lists.xen.org; Wed, 01 Mar 2023 15:47:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65a72689-b848-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 16:47:42 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-189UUaEtMpOJYaipxaj5jQ-1; Wed, 01 Mar 2023 10:47:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08774800B23;
 Wed,  1 Mar 2023 15:47:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE412166B2A;
 Wed,  1 Mar 2023 15:47:32 +0000 (UTC)
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
X-Inumbo-ID: 65a72689-b848-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677685659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ZcyCRC5iYwgEQEDm61qvHfK7mK/edmDx0UhuNcF9whk=;
	b=Fw4oaOebsJgSlLNsUBFFzlNvf8S3Aj9snsD3DB8qL1aAinLlXaNtqCPtRU9ll9tUtQhI16
	IjGjyXlgjI0mR9ky4tY6kWW1Tr4MDqMPUOrUxj8/hU/TC+arSGTQV16F/A+oIGgN1qYxyl
	RsRMBiRXNF8OBKMAwu/BeuDR2bXo/3o=
X-MC-Unique: 189UUaEtMpOJYaipxaj5jQ-1
Date: Wed, 1 Mar 2023 10:47:28 -0500
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
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Message-ID: <Y/9zkDAS4odz93GM@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="REA+6g3fXhuAA0Hw"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--REA+6g3fXhuAA0Hw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Resend - for some reason my email didn't make it out.

----- Forwarded message from Stefan Hajnoczi <stefanha@redhat.com> -----

Date: Tue, 21 Feb 2023 10:17:01 -0500
=46rom: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S. Tsi=
rkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Alex =
Benn=E9e <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko <olekstysh@gmail.com=
>, xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Juer=
gen Gross <jgross@suse.com>, Sebastien Boeuf
	<sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>, Mathieu =
Poirier <mathieu.poirier@linaro.org>
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory ma=
pping support
Message-ID: <Y/TgbZLY894p4a1S@fedora>

On Tue, Feb 21, 2023 at 03:20:41PM +0530, Viresh Kumar wrote:
> The current model of memory mapping at the back-end works fine with
> Qemu, where a standard call to mmap() for the respective file
> descriptor, passed from front-end, is generally all we need to do before
> the front-end can start accessing the guest memory.
>=20
> There are other complex cases though, where we need more information at
> the backend and need to do more than just an mmap() call. For example,
> Xen, a type-1 hypervisor, currently supports memory mapping via two
> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
> /dev/gntdev). In both these cases, the back-end needs to call mmap()
> followed by an ioctl() (or vice-versa), and need to pass extra
> information via the ioctl(), like the Xen domain-id of the guest whose
> memory we are trying to map.
>=20
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
> lets the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end can send the
> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
> information to the back-end.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

The alternative to an in-band approach is to configure these details
out-of-band. For example, via command-line options to the vhost-user
back-end:

  $ my-xen-device --mapping-type=3Dforeign-mapping --domain-id=3D123

I was thinking about both approaches and don't see an obvious reason to
choose one or the other. What do you think?

> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424eb0..f2b1d705593a 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -258,6 +258,23 @@ Inflight description
> =20
>  :queue size: a 16-bit size of virtqueues
> =20
> +Custom mmap description
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> ++-------+-------+
> +| flags | value |
> ++-------+-------+
> +
> +:flags: 64-bit bit field
> +
> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory map=
ping.
> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
> +
> +:value: a 64-bit hypervisor specific value.
> +
> +- For Xen foreign or grant memory access, this is set with guest's xen d=
omain
> +  id.

This is highly Xen-specific. How about naming the feature XEN_MMAP
instead of CUSTOM_MMAP? If someone needs to add other mmap data later,
they should define their own struct instead of trying to squeeze into
the same fields as Xen.

There is an assumption in this design that a single
VHOST_USER_CUSTOM_MMAP message provides the information necessary for
all mmaps. Are you sure the limitation that every mmap belongs to the
same domain will be workable in the future?

> +
>  C structure
>  -----------
> =20
> @@ -867,6 +884,7 @@ Protocol features
>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
> =20
>  Front-end message types
>  -----------------------
> @@ -1422,6 +1440,20 @@ Front-end message types
>    query the back-end for its device status as defined in the Virtio
>    specification.
> =20
> +``VHOST_USER_CUSTOM_MMAP``

Most vhost-user protocol messages have a verb like
get/set/close/add/listen/etc. I suggest renaming this to
VHOST_USER_SET_XEN_MMAP_INFO.

> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :request payload: Custom mmap description
> +  :reply payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has be=
en
> +  successfully negotiated, this message is submitted by the front-end to
> +  notify the back-end of the special memory mapping requirements, that t=
he
> +  back-end needs to take care of, while mapping any memory regions sent
> +  over by the front-end. The front-end must send this message before
> +  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_T=
ABLE``
> +  or ``VHOST_USER_ADD_MEM_REG`` message types.
> +
> =20
>  Back-end message types
>  ----------------------
> --=20
> 2.31.1.272.g89b43f80a514
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>=20



----- End forwarded message -----

--REA+6g3fXhuAA0Hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP/c5AACgkQnKSrs4Gr
c8j7xQgAvP7ofHadadItgG48Mx2Y5ZxqGbcYrkWl9Z3LFplSdvSL57D89nu+U3I6
YHEQTjc/aXyZHAQJfeQbTMfjAcLzsaLD5dGpmypZN6nwMwMdjkNDIVMgJiac2hau
cqRAcrZcmGYvODag1LKvbofZvYcHspHO/IGF6BMbpFV98d9gpVJFS5NaE+I67Em7
6abQUP4VmzhyO9vqAYxtCjTo+Wt5mCOjHXCBbHFrCS1SeknZDReUQcoE9fmZZjOq
5wxk221ccSUwRM+bRvugkEKi0jzpc9TFJt7sR+hcgHPatPBi/KeLjojHBrRInnfx
CDcx43fMekxlUmcVrsH0AYySsoS0wg==
=zYpW
-----END PGP SIGNATURE-----

--REA+6g3fXhuAA0Hw--


