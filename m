Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9102DB298
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 18:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54722.95246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpE9r-0007Hr-MP; Tue, 15 Dec 2020 17:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54722.95246; Tue, 15 Dec 2020 17:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpE9r-0007H9-GX; Tue, 15 Dec 2020 17:30:43 +0000
Received: by outflank-mailman (input) for mailman id 54722;
 Tue, 15 Dec 2020 17:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LaZc=FT=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1kpE3N-0006OE-GF
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 17:24:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8aaf35f7-ccc3-450d-ab6c-06d8aaa7d03e;
 Tue, 15 Dec 2020 17:24:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-hCy7xXOIO3OqX7U5VVhdwg-1; Tue, 15 Dec 2020 12:23:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28CE119251A6;
 Tue, 15 Dec 2020 17:23:51 +0000 (UTC)
Received: from localhost (ovpn-114-253.rdu2.redhat.com [10.10.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB8B260C0F;
 Tue, 15 Dec 2020 17:23:38 +0000 (UTC)
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
X-Inumbo-ID: 8aaf35f7-ccc3-450d-ab6c-06d8aaa7d03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608053040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUdEUiX0emWRYmCkDrP17XYuL2iUgaq+xIQzZwTCHCQ=;
	b=BRwvzkGIMMW3Mu7V4aZ64fh6Y1MHI2QgYTctIH/KumD3D/Ff1JZbhkbB4v+npqOa01fnmL
	zVHF9T8ZNwGhjPqzI4C3yvq8tJtOufGvemBHioRg3lf6UtImmfNjf+qP7L5XY/9UUtFkPI
	DOpV+uBtcZwXl/sWwfPv40p54+z0yyE=
X-MC-Unique: hCy7xXOIO3OqX7U5VVhdwg-1
Date: Tue, 15 Dec 2020 18:23:37 +0100
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
Message-ID: <20201215172337.w7vcn2woze2ejgco@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215150119.GE8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="smfgrrjgqasjiwvo"
Content-Disposition: inline

--smfgrrjgqasjiwvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > While processing the parents of a BDS, one of the parents may proce=
ss
> > > > the child that's doing the tail recursion, which leads to a BDS bei=
ng
> > > > processed twice. This is especially problematic for the aio_notifie=
rs,
> > > > as they might attempt to work on both the old and the new AIO
> > > > contexts.
> > > >=20
> > > > To avoid this, add the BDS pointer to the ignore list, and check th=
e
> > > > child BDS pointer while iterating over the children.
> > > >=20
> > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > >=20
> > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/
> >=20
> > I know, it's effective but quite ugly...
> >=20
> > > What is the specific scenario where you saw this breaking? Did you ha=
ve
> > > multiple BdrvChild connections between two nodes so that we would go =
to
> > > the parent node through one and then come back to the child node thro=
ugh
> > > the other?
> >=20
> > I don't think this is a corner case. If the graph is walked top->down,
> > there's no problem since children are added to the ignore list before
> > getting processed, and siblings don't process each other. But, if the
> > graph is walked bottom->up, a BDS will start processing its parents
> > without adding itself to the ignore list, so there's nothing
> > preventing them from processing it again.
>=20
> I don't understand. child is added to ignore before calling the parent
> callback on it, so how can we come back through the same BdrvChild?
>=20
>     QLIST_FOREACH(child, &bs->parents, next_parent) {
>         if (g_slist_find(*ignore, child)) {
>             continue;
>         }
>         assert(child->klass->set_aio_ctx);
>         *ignore =3D g_slist_prepend(*ignore, child);
>         child->klass->set_aio_ctx(child, new_context, ignore);
>     }

Perhaps I'm missing something, but the way I understand it, that loop
is adding the BdrvChild pointer of each of its parents, but not the
BdrvChild pointer of the BDS that was passed as an argument to
b_s_a_c_i.

> You didn't dump the BdrvChild here. I think that would add some
> information on why we re-entered 0x555ee2fbf660. Maybe you can also add
> bs->drv->format_name for each node to make the scenario less abstract?

I've generated another trace with more data:

bs=3D0x565505e48030 (backup-top) enter
bs=3D0x565505e48030 (backup-top) processing children
bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e42090 (chil=
d->bs=3D0x565505e5d420)
bs=3D0x565505e5d420 (qcow2) enter
bs=3D0x565505e5d420 (qcow2) processing children
bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (child->bs=
=3D0x565505e52060)
bs=3D0x565505e52060 (file) enter
bs=3D0x565505e52060 (file) processing children
bs=3D0x565505e52060 (file) processing parents
bs=3D0x565505e52060 (file) processing itself
bs=3D0x565505e5d420 (qcow2) processing parents
bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a34d0
bs=3D0x565505fbf660 (qcow2) enter
bs=3D0x565505fbf660 (qcow2) processing children
bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (child->bs=
=3D0x565506bc0c00)
bs=3D0x565506bc0c00 (file) enter
bs=3D0x565506bc0c00 (file) processing children
bs=3D0x565506bc0c00 (file) processing parents
bs=3D0x565506bc0c00 (file) processing itself
bs=3D0x565505fbf660 (qcow2) processing parents
bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7aa0
bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b8510
bs=3D0x565505e48030 (backup-top) enter
bs=3D0x565505e48030 (backup-top) processing children
bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c450 (chil=
d->bs=3D0x565505fbf660)
bs=3D0x565505fbf660 (qcow2) enter
bs=3D0x565505fbf660 (qcow2) processing children
bs=3D0x565505fbf660 (qcow2) processing parents
bs=3D0x565505fbf660 (qcow2) processing itself
bs=3D0x565505e48030 (backup-top) processing parents
bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x565505e402d0
bs=3D0x565505e48030 (backup-top) processing itself
bs=3D0x565505fbf660 (qcow2) processing itself


So it seems this is happening:

backup-top (5e48030) <---------| (5)
   |    |                      |
   |    | (6) ------------> qcow2 (5fbf660)
   |                           ^    |
   |                       (3) |    | (4)
   |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
   |
   |-> (2) file (5e52060)

backup-top (5e48030), the BDS that was passed as argument in the first
bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
is processing its parents, and the latter is also re-entered when the
first one starts processing its children again.

Sergio.

--smfgrrjgqasjiwvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/Y8RgACgkQ9GknjS8M
AjV8gA/6AzvhEg8xeUBjecxy67BEBGuQYW5n0uFMZ3eWYWc3rtBB2CEWtYIWwtc+
4D74Ez21djBsCAoS3AjQeeMQ6eGSRT7IP3A1g5FONqVqzgouny7jJMUfUgXe12lg
goBFlYA8eoYWB4lVHxLn1vbAImEyOkBg3c1DkMj+auBLkRS7cVGusvWGv8XYqQc5
Nnfu/6MYS2eT0K8noWtRMoccu8nPvAUJP6ijAhA7ktXonsS7B/+IdX0Ongfc0IdU
531DOnmQwm8P67V+EKj7pe5g/W/UKwfeeRbVvIMptUD0wktJfjQUuE9nqeG8iEm/
LH5KcLIZlM9S6EbQp2pXhYWBJR/g4jblbf8dyRYLi/Hv36LI5vQdSg+DghkyhvVp
3RSROZypQxVxBCb3W/5n4OIbpKEm87WnES2Lr5lyzy4QEKSjr6owi6EXP8WTfmU7
0+7HtStBZ51C84ZkvkneV7W9dGwCzzIrQyJ6aRnirwN6fVtrv65GUXkhi/ysln4x
N/j95DF1xZU8yawCKkrP7GY7clHOyYhhpeLvcEmn9mi9r2ypIAlRN7d2tfR5BKjH
cjkF6M5uq9gxrcLFjmLgAGo1f/D5S7T6qo3Pkt6gcuUX0R2SlP0PspN15y1aEjPF
8kiVA9FS+I/zXvLZ3R8Rt/sbZslb5/SNUP4Y1NnwYivDOmVOszI=
=8V3n
-----END PGP SIGNATURE-----

--smfgrrjgqasjiwvo--


