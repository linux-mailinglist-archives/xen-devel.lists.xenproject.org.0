Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562332DD1EB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 14:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55924.97555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpt2N-0005FF-Rv; Thu, 17 Dec 2020 13:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55924.97555; Thu, 17 Dec 2020 13:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpt2N-0005Ep-ON; Thu, 17 Dec 2020 13:09:43 +0000
Received: by outflank-mailman (input) for mailman id 55924;
 Thu, 17 Dec 2020 13:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMd0=FV=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1kpt2L-0005Ej-GJ
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 13:09:41 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de603ec6-41d8-43e5-9925-91d9966e6bcf;
 Thu, 17 Dec 2020 13:09:40 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-rjtvrmtQOwqgUwPTRmmT4g-1; Thu, 17 Dec 2020 08:09:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDDB06D524;
 Thu, 17 Dec 2020 13:09:34 +0000 (UTC)
Received: from localhost (ovpn-112-215.rdu2.redhat.com [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98E3518993;
 Thu, 17 Dec 2020 13:09:27 +0000 (UTC)
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
X-Inumbo-ID: de603ec6-41d8-43e5-9925-91d9966e6bcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608210580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YYl58uYPe2iXP8wZfDNNl6jDEd/ToJVvWvG2lXD7l0E=;
	b=ZmrbH6kohKZk08qrlX4cRslsJw5tQ99Uo2Z9qIBuTIGbFIRMNhgV8cGHP6FAn0n77w0o8E
	xz3MGAUCW0u8HtIvB+TBcy3zpga4NihnILN73zz/7cDLCih9RzeuOf6BhsB69fvADHehXQ
	eM3nqEHJ0Ztf26lqaJxg9yaAPuvbKxM=
X-MC-Unique: rjtvrmtQOwqgUwPTRmmT4g-1
Date: Thu, 17 Dec 2020 14:09:26 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201217130926.lqbthako23t4o3s5@mhamilton>
References: <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201217105830.GA12328@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jvwub2mrtajxdnkv"
Content-Disposition: inline

--jvwub2mrtajxdnkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 11:58:30AM +0100, Kevin Wolf wrote:
> Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
> > Do you think it's safe to re-enter backup-top, or should we look for a
> > way to avoid this?
>=20
> I think it should be avoided, but I don't understand why putting all
> children of backup-top into the ignore list doesn't already avoid it. If
> backup-top is in the parents list of qcow2, then qcow2 should be in the
> children list of backup-top and therefore the BdrvChild should already
> be in the ignore list.
>=20
> The only way I can explain this is that backup-top and qcow2 have
> different ideas about which BdrvChild objects exist that connect them.
> Or that the graph changes between both places, but I don't see how that
> could happen in bdrv_set_aio_context_ignore().

I've been digging around with gdb, and found that, at that point, the
backup-top BDS is actually referenced by two different BdrvChild
objects:

(gdb) p *(BdrvChild *) 0x560c40f7e400
$84 =3D {bs =3D 0x560c40c4c030, name =3D 0x560c41ca4960 "root", klass =3D 0=
x560c3eae7c20 <child_root>,=20
  role =3D 20, opaque =3D 0x560c41ca4610, perm =3D 3, shared_perm =3D 29, h=
as_backup_perm =3D false,=20
  backup_perm =3D 0, backup_shared_perm =3D 31, frozen =3D false, parent_qu=
iesce_counter =3D 2, next =3D {
    le_next =3D 0x0, le_prev =3D 0x0}, next_parent =3D {le_next =3D 0x0, le=
_prev =3D 0x560c40c44338}}

(gdb) p sibling
$72 =3D (BdrvChild *) 0x560c40981840
(gdb) p *sibling
$73 =3D {bs =3D 0x560c40c4c030, name =3D 0x560c4161be20 "main node", klass =
=3D 0x560c3eae6a40 <child_job>,=20
  role =3D 0, opaque =3D 0x560c4161bc00, perm =3D 0, shared_perm =3D 31, ha=
s_backup_perm =3D false,=20
  backup_perm =3D 0, backup_shared_perm =3D 0, frozen =3D false, parent_qui=
esce_counter =3D 2, next =3D {
    le_next =3D 0x0, le_prev =3D 0x0}, next_parent =3D {le_next =3D 0x560c4=
0c442d0, le_prev =3D 0x560c40c501c0}}

When the chain of calls to switch AIO contexts is started, backup-top
is the first one to be processed. blk_do_set_aio_context() instructs
bdrv_child_try_set_aio_context() to add blk->root (0x560c40f7e400) as
the first element in ignore list, but the referenced BDS is still
re-entered through the other BdrvChild (0x560c40981840) by one the
children of the latter.

I can't think of a way of preventing this other than keeping track of
BDS pointers in the ignore list too. Do you think there are any
alternatives?

Thanks,
Sergio.

--jvwub2mrtajxdnkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/bWHwACgkQ9GknjS8M
AjVmmxAAnOyVZGFSmhLixYFUU37Rpkw5SAKaWvauoce3mDVaCBpyDf7NajfTq25j
GK0NOL/mRp+trxC1absAN0tBULadrMbkT4UIUGyrRvcntEGdFrfQJ44LOKZ4lEw+
QlZG/bS0MwDQ+cql/WjWPicqTdr+pdyjzhWxZzoJtUkRKMWBHkt6e2UQMkzR3DaB
eTUdx6LF+Tfm6w36ZqAIdH0pMZu1Te084hWIQmgj+6FMGZSUqYKpKgn8sGxqQ20Y
XOv3PHtuAu6wugqd3bCs5A+mTenG+dtW/NKPFcMkI6U30u8pOciXSMnfx0+o3mpd
L4K+7qXPUSziR+9XRFvPMBwblkKCpP5Zt91CEbES9jRS9EQSnbs3E3eW9tshBUFE
akQD6qJgN3XvfqhqGQDlJGyz0R14qzFrehnbloTFQuOEM2dXEfVo6rXD+pfGX04o
886fgxqJezmL44XdaxLQ8k/Q3ywtnwfgaD/0jK7XKZrD8f/GwSvTp+b+PWmYp2eL
NCO0zWybPocN/5PsYPsnN0+w37GX1vaIhhhCX1nXo2BfbzO3Z/8bfCkLBhUFLfE4
a7/lT7Q3NVvRnIt0o9MEqPXkYTfIN4Zwcji6Zx0jV/ex8o0lCyk/EKL8DiZ5Ri9e
xrDqHyeL1BnTrdSb5quyXv3tS72m9XrpYpgzKNGhD6ZyS+Wi/rU=
=9hdX
-----END PGP SIGNATURE-----

--jvwub2mrtajxdnkv--


