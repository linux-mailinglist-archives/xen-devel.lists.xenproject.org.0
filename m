Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5EE2DC05A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 13:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55212.96145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpW1q-0006qK-7j; Wed, 16 Dec 2020 12:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55212.96145; Wed, 16 Dec 2020 12:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpW1q-0006pv-4I; Wed, 16 Dec 2020 12:35:38 +0000
Received: by outflank-mailman (input) for mailman id 55212;
 Wed, 16 Dec 2020 12:35:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnmN=FU=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kpW1o-0006pl-1X
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 12:35:36 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ad8e701d-6b5a-499b-ab13-6d2981795dec;
 Wed, 16 Dec 2020 12:35:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-hCDAhdqZMsqRsPvKKMnrMQ-1; Wed, 16 Dec 2020 07:35:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA8C100C600;
 Wed, 16 Dec 2020 12:35:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8DD5D9C0;
 Wed, 16 Dec 2020 12:35:15 +0000 (UTC)
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
X-Inumbo-ID: ad8e701d-6b5a-499b-ab13-6d2981795dec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608122134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtNZYdo9xoytjzGiKwk4LzakyNj0adxhgOtO55qRA30=;
	b=hP7Sgvfg/3paJ/4nXIJJiMkYve/McVngcPYsKcHqLIySp/vRTnJXQ8yQfDUhxN5U08McsQ
	ZldUz/MrY4SqM0QdYGdgw+RnyIiQ1d0J6uFnz0JI9EsYgJmDpFn0DlARBaySUmGof3pLVy
	ud4iFU5/amsD7+1SYOiuLKiawhItahg=
X-MC-Unique: hCDAhdqZMsqRsPvKKMnrMQ-1
Date: Wed, 16 Dec 2020 13:35:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201216123514.GD7548@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20201215172337.w7vcn2woze2ejgco@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 15.12.2020 um 18:23 hat Sergio Lopez geschrieben:
> On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> > Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > > While processing the parents of a BDS, one of the parents may pro=
cess
> > > > > the child that's doing the tail recursion, which leads to a BDS b=
eing
> > > > > processed twice. This is especially problematic for the aio_notif=
iers,
> > > > > as they might attempt to work on both the old and the new AIO
> > > > > contexts.
> > > > >=20
> > > > > To avoid this, add the BDS pointer to the ignore list, and check =
the
> > > > > child BDS pointer while iterating over the children.
> > > > >=20
> > > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > >=20
> > > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/
> > >=20
> > > I know, it's effective but quite ugly...
> > >=20
> > > > What is the specific scenario where you saw this breaking? Did you =
have
> > > > multiple BdrvChild connections between two nodes so that we would g=
o to
> > > > the parent node through one and then come back to the child node th=
rough
> > > > the other?
> > >=20
> > > I don't think this is a corner case. If the graph is walked top->down=
,
> > > there's no problem since children are added to the ignore list before
> > > getting processed, and siblings don't process each other. But, if the
> > > graph is walked bottom->up, a BDS will start processing its parents
> > > without adding itself to the ignore list, so there's nothing
> > > preventing them from processing it again.
> >=20
> > I don't understand. child is added to ignore before calling the parent
> > callback on it, so how can we come back through the same BdrvChild?
> >=20
> >     QLIST_FOREACH(child, &bs->parents, next_parent) {
> >         if (g_slist_find(*ignore, child)) {
> >             continue;
> >         }
> >         assert(child->klass->set_aio_ctx);
> >         *ignore =3D g_slist_prepend(*ignore, child);
> >         child->klass->set_aio_ctx(child, new_context, ignore);
> >     }
>=20
> Perhaps I'm missing something, but the way I understand it, that loop
> is adding the BdrvChild pointer of each of its parents, but not the
> BdrvChild pointer of the BDS that was passed as an argument to
> b_s_a_c_i.

Generally, the caller has already done that.

In the theoretical case that it was the outermost call in the recursion
and it hasn't (I couldn't find any such case), I think we should still
call the callback for the passed BdrvChild like we currently do.

> > You didn't dump the BdrvChild here. I think that would add some
> > information on why we re-entered 0x555ee2fbf660. Maybe you can also add
> > bs->drv->format_name for each node to make the scenario less abstract?
>=20
> I've generated another trace with more data:
>=20
> bs=3D0x565505e48030 (backup-top) enter
> bs=3D0x565505e48030 (backup-top) processing children
> bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e42090 (ch=
ild->bs=3D0x565505e5d420)
> bs=3D0x565505e5d420 (qcow2) enter
> bs=3D0x565505e5d420 (qcow2) processing children
> bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (child->=
bs=3D0x565505e52060)
> bs=3D0x565505e52060 (file) enter
> bs=3D0x565505e52060 (file) processing children
> bs=3D0x565505e52060 (file) processing parents
> bs=3D0x565505e52060 (file) processing itself
> bs=3D0x565505e5d420 (qcow2) processing parents
> bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a34d0
> bs=3D0x565505fbf660 (qcow2) enter
> bs=3D0x565505fbf660 (qcow2) processing children
> bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (child->=
bs=3D0x565506bc0c00)
> bs=3D0x565506bc0c00 (file) enter
> bs=3D0x565506bc0c00 (file) processing children
> bs=3D0x565506bc0c00 (file) processing parents
> bs=3D0x565506bc0c00 (file) processing itself
> bs=3D0x565505fbf660 (qcow2) processing parents
> bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7aa0
> bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b8510
> bs=3D0x565505e48030 (backup-top) enter
> bs=3D0x565505e48030 (backup-top) processing children
> bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c450 (ch=
ild->bs=3D0x565505fbf660)
> bs=3D0x565505fbf660 (qcow2) enter
> bs=3D0x565505fbf660 (qcow2) processing children
> bs=3D0x565505fbf660 (qcow2) processing parents
> bs=3D0x565505fbf660 (qcow2) processing itself
> bs=3D0x565505e48030 (backup-top) processing parents
> bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x565505e402=
d0
> bs=3D0x565505e48030 (backup-top) processing itself
> bs=3D0x565505fbf660 (qcow2) processing itself

Hm, is this complete? Is see no "processing itself" for
bs=3D0x565505e5d420. Or is this because it crashed before getting there?

Anyway, trying to reconstruct the block graph with BdrvChild pointers
annotated at the edges:

BlockBackend
      |
      v
  backup-top ------------------------+
      |   |                          |
      |   +-----------------------+  |
      |            0x5655068b8510 |  | 0x565505e3c450
      |                           |  |
      | 0x565505e42090            |  |
      v                           |  |
    qcow2 ---------------------+  |  |
      |                        |  |  |
      | 0x565505e52060         |  |  | ??? [1]
      |                        |  |  |  |
      v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
    file                       v  v  v  v
                             qcow2 (backing)
                                    |
                                    | 0x565505e41d20
                                    v
                                  file

[1] This seems to be a BdrvChild with a non-BDS parent. Probably a
    BdrvChild directly owned by the backup job.

> So it seems this is happening:
>=20
> backup-top (5e48030) <---------| (5)
>    |    |                      |
>    |    | (6) ------------> qcow2 (5fbf660)
>    |                           ^    |
>    |                       (3) |    | (4)
>    |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
>    |
>    |-> (2) file (5e52060)
>=20
> backup-top (5e48030), the BDS that was passed as argument in the first
> bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
> is processing its parents, and the latter is also re-entered when the
> first one starts processing its children again.

Yes, but look at the BdrvChild pointers, it is through different edges
that we come back to the same node. No BdrvChild is used twice.

If backup-top had added all of its children to the ignore list before
calling into the overlay qcow2, the backing qcow2 wouldn't eventually
have called back into backup-top.

Kevin

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/Z/wEACgkQfwmycsiP
L9YaAhAAwCX3qwQuucObmD7XW3Qh3RFNxDtaTW8d1vXXPnMXZdogTbG2SiC5TQ4q
JciH/JgUMisvgGZLLKeNDPjOKh5lLLCoqOjd7Vp6G6R/yDQLaUqgDEtk/fOifAp0
9USYSM6Z20xIhkCGwWsgDcMiFtlkNq5UxJxJ8ObB5BzLeIBXX99hK2xntEhZ3RZk
prxmsGMhWz8XDP2smTSANz99rpszTRDqNM1r8aFhlZ6BySBntJQ0fpjcjq04Xt2X
B7B8WFkWgTP2tf6FS75f7p+uQoM7mllN03Unn9Tr7ZmnVeF3PvVo6p4G5kr1raIC
Qrdo6btc7AhJJGTLE8CYHp3Zc22VDbniNeTqDhk8xfo4u21WZ+qZLg+jQE/jRq6R
EiJVW7kS05P3+zGGV4F6JbqS1NItQFYtu41Tiop68R3YpdyFKviUkzGoXxj1DrxA
h5oQq4jv4xp8eq6dBpBveoPph377pxi76nJE/OLu3+rH/xoyqk8XHfWYiQLuvM8I
FtdYejAnuE/s2/wQpjLa/Jga8A3NSnIs6XRTOhcZ0kHkyeNMnxfYy0hd+uSy8CMw
34Ljkssf/zNnytkDJuKlbckEJTstubpkkYy+t2FUfViqbzAC50diU6MQuO8enDv5
TGcxnqhFGThQU3ZKMQEdVnWyulO2CycskOLBmTYN3jC3ZkuaK9A=
=sPmL
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


