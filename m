Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC32DC686
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 19:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55569.96721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpbaC-0003In-1t; Wed, 16 Dec 2020 18:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55569.96721; Wed, 16 Dec 2020 18:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpbaB-0003IO-Uo; Wed, 16 Dec 2020 18:31:27 +0000
Received: by outflank-mailman (input) for mailman id 55569;
 Wed, 16 Dec 2020 18:31:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnmN=FU=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kpbaA-0003IJ-N6
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 18:31:27 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 07553f4c-28fc-4f26-9653-59abcf24ce19;
 Wed, 16 Dec 2020 18:31:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-K3ZasvZfMDWhYHoTxaZAjQ-1; Wed, 16 Dec 2020 13:31:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9896B801817;
 Wed, 16 Dec 2020 18:31:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD9D062AF7;
 Wed, 16 Dec 2020 18:31:04 +0000 (UTC)
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
X-Inumbo-ID: 07553f4c-28fc-4f26-9653-59abcf24ce19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608143484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8R8yMuE3L37hwwvSDxqlIu1MnWMQCBHRhIccuK6Xuts=;
	b=DuJQrgKXeNMbn+6Bnht25S04z9f/92crR0hGMbODyL61/hOumPqLmA94ZVzM7bU9+CiEHi
	ADcqyJ0WRw6Uod61dajyuCZr+UqiP8AwmK/6oWqY2FAXuWcEZZP/D4wkNZeBshB+DHRX1i
	P7CKu+Mn4CzL53i8/fwc3Le+sz0K/Hw=
X-MC-Unique: K3ZasvZfMDWhYHoTxaZAjQ-1
Date: Wed, 16 Dec 2020 19:31:02 +0100
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
Message-ID: <20201216183102.GH7548@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20201216145502.yiejsw47q5pfbzio@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline

--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
> On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> > Am 15.12.2020 um 18:23 hat Sergio Lopez geschrieben:
> > > On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> > > > Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > > > > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > > > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > > > > While processing the parents of a BDS, one of the parents may=
 process
> > > > > > > the child that's doing the tail recursion, which leads to a B=
DS being
> > > > > > > processed twice. This is especially problematic for the aio_n=
otifiers,
> > > > > > > as they might attempt to work on both the old and the new AIO
> > > > > > > contexts.
> > > > > > >=20
> > > > > > > To avoid this, add the BDS pointer to the ignore list, and ch=
eck the
> > > > > > > child BDS pointer while iterating over the children.
> > > > > > >=20
> > > > > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > > > >=20
> > > > > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? =
:-/
> > > > >=20
> > > > > I know, it's effective but quite ugly...
> > > > >=20
> > > > > > What is the specific scenario where you saw this breaking? Did =
you have
> > > > > > multiple BdrvChild connections between two nodes so that we wou=
ld go to
> > > > > > the parent node through one and then come back to the child nod=
e through
> > > > > > the other?
> > > > >=20
> > > > > I don't think this is a corner case. If the graph is walked top->=
down,
> > > > > there's no problem since children are added to the ignore list be=
fore
> > > > > getting processed, and siblings don't process each other. But, if=
 the
> > > > > graph is walked bottom->up, a BDS will start processing its paren=
ts
> > > > > without adding itself to the ignore list, so there's nothing
> > > > > preventing them from processing it again.
> > > >=20
> > > > I don't understand. child is added to ignore before calling the par=
ent
> > > > callback on it, so how can we come back through the same BdrvChild?
> > > >=20
> > > >     QLIST_FOREACH(child, &bs->parents, next_parent) {
> > > >         if (g_slist_find(*ignore, child)) {
> > > >             continue;
> > > >         }
> > > >         assert(child->klass->set_aio_ctx);
> > > >         *ignore =3D g_slist_prepend(*ignore, child);
> > > >         child->klass->set_aio_ctx(child, new_context, ignore);
> > > >     }
> > >=20
> > > Perhaps I'm missing something, but the way I understand it, that loop
> > > is adding the BdrvChild pointer of each of its parents, but not the
> > > BdrvChild pointer of the BDS that was passed as an argument to
> > > b_s_a_c_i.
> >=20
> > Generally, the caller has already done that.
> >=20
> > In the theoretical case that it was the outermost call in the recursion
> > and it hasn't (I couldn't find any such case), I think we should still
> > call the callback for the passed BdrvChild like we currently do.
> >=20
> > > > You didn't dump the BdrvChild here. I think that would add some
> > > > information on why we re-entered 0x555ee2fbf660. Maybe you can also=
 add
> > > > bs->drv->format_name for each node to make the scenario less abstra=
ct?
> > >=20
> > > I've generated another trace with more data:
> > >=20
> > > bs=3D0x565505e48030 (backup-top) enter
> > > bs=3D0x565505e48030 (backup-top) processing children
> > > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e42090=
 (child->bs=3D0x565505e5d420)
> > > bs=3D0x565505e5d420 (qcow2) enter
> > > bs=3D0x565505e5d420 (qcow2) processing children
> > > bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (chi=
ld->bs=3D0x565505e52060)
> > > bs=3D0x565505e52060 (file) enter
> > > bs=3D0x565505e52060 (file) processing children
> > > bs=3D0x565505e52060 (file) processing parents
> > > bs=3D0x565505e52060 (file) processing itself
> > > bs=3D0x565505e5d420 (qcow2) processing parents
> > > bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a34d=
0
> > > bs=3D0x565505fbf660 (qcow2) enter
> > > bs=3D0x565505fbf660 (qcow2) processing children
> > > bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (chi=
ld->bs=3D0x565506bc0c00)
> > > bs=3D0x565506bc0c00 (file) enter
> > > bs=3D0x565506bc0c00 (file) processing children
> > > bs=3D0x565506bc0c00 (file) processing parents
> > > bs=3D0x565506bc0c00 (file) processing itself
> > > bs=3D0x565505fbf660 (qcow2) processing parents
> > > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7aa=
0
> > > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b851=
0
> > > bs=3D0x565505e48030 (backup-top) enter
> > > bs=3D0x565505e48030 (backup-top) processing children
> > > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c450=
 (child->bs=3D0x565505fbf660)
> > > bs=3D0x565505fbf660 (qcow2) enter
> > > bs=3D0x565505fbf660 (qcow2) processing children
> > > bs=3D0x565505fbf660 (qcow2) processing parents
> > > bs=3D0x565505fbf660 (qcow2) processing itself
> > > bs=3D0x565505e48030 (backup-top) processing parents
> > > bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x565505=
e402d0
> > > bs=3D0x565505e48030 (backup-top) processing itself
> > > bs=3D0x565505fbf660 (qcow2) processing itself
> >=20
> > Hm, is this complete? Is see no "processing itself" for
> > bs=3D0x565505e5d420. Or is this because it crashed before getting there=
?
>=20
> Yes, it crashes there. I forgot to mention that, sorry.
>=20
> > Anyway, trying to reconstruct the block graph with BdrvChild pointers
> > annotated at the edges:
> >=20
> > BlockBackend
> >       |
> >       v
> >   backup-top ------------------------+
> >       |   |                          |
> >       |   +-----------------------+  |
> >       |            0x5655068b8510 |  | 0x565505e3c450
> >       |                           |  |
> >       | 0x565505e42090            |  |
> >       v                           |  |
> >     qcow2 ---------------------+  |  |
> >       |                        |  |  |
> >       | 0x565505e52060         |  |  | ??? [1]
> >       |                        |  |  |  |
> >       v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
> >     file                       v  v  v  v
> >                              qcow2 (backing)
> >                                     |
> >                                     | 0x565505e41d20
> >                                     v
> >                                   file
> >=20
> > [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
> >     BdrvChild directly owned by the backup job.
> >=20
> > > So it seems this is happening:
> > >=20
> > > backup-top (5e48030) <---------| (5)
> > >    |    |                      |
> > >    |    | (6) ------------> qcow2 (5fbf660)
> > >    |                           ^    |
> > >    |                       (3) |    | (4)
> > >    |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> > >    |
> > >    |-> (2) file (5e52060)
> > >=20
> > > backup-top (5e48030), the BDS that was passed as argument in the firs=
t
> > > bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660=
)
> > > is processing its parents, and the latter is also re-entered when the
> > > first one starts processing its children again.
> >=20
> > Yes, but look at the BdrvChild pointers, it is through different edges
> > that we come back to the same node. No BdrvChild is used twice.
> >=20
> > If backup-top had added all of its children to the ignore list before
> > calling into the overlay qcow2, the backing qcow2 wouldn't eventually
> > have called back into backup-top.
>=20
> I've tested a patch that first adds every child to the ignore list,
> and then processes those that weren't there before, as you suggested
> on a previous email. With that, the offending qcow2 is not re-entered,
> so we avoid the crash, but backup-top is still entered twice:

I think we also need to every parent to the ignore list before calling
callbacks, though it doesn't look like this is the problem you're
currently seeing.

> bs=3D0x560db0e3b030 (backup-top) enter
> bs=3D0x560db0e3b030 (backup-top) processing children
> bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e2f450 (ch=
ild->bs=3D0x560db0fb2660)
> bs=3D0x560db0fb2660 (qcow2) enter
> bs=3D0x560db0fb2660 (qcow2) processing children
> bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db0e34d20 (child->=
bs=3D0x560db1bb3c00)
> bs=3D0x560db1bb3c00 (file) enter
> bs=3D0x560db1bb3c00 (file) processing children
> bs=3D0x560db1bb3c00 (file) processing parents
> bs=3D0x560db1bb3c00 (file) processing itself
> bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db16964d0 (child->=
bs=3D0x560db0e50420)
> bs=3D0x560db0e50420 (qcow2) enter
> bs=3D0x560db0e50420 (qcow2) processing children
> bs=3D0x560db0e50420 (qcow2) calling bsaci child=3D0x560db0e34ea0 (child->=
bs=3D0x560db0e45060)
> bs=3D0x560db0e45060 (file) enter
> bs=3D0x560db0e45060 (file) processing children
> bs=3D0x560db0e45060 (file) processing parents
> bs=3D0x560db0e45060 (file) processing itself
> bs=3D0x560db0e50420 (qcow2) processing parents
> bs=3D0x560db0e50420 (qcow2) processing itself
> bs=3D0x560db0fb2660 (qcow2) processing parents
> bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1672860
> bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1b14a20
> bs=3D0x560db0e3b030 (backup-top) enter
> bs=3D0x560db0e3b030 (backup-top) processing children
> bs=3D0x560db0e3b030 (backup-top) processing parents
> bs=3D0x560db0e3b030 (backup-top) calling set_aio_ctx child=3D0x560db0e332=
d0
> bs=3D0x560db0e3b030 (backup-top) processing itself
> bs=3D0x560db0fb2660 (qcow2) processing itself
> bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e35090 (ch=
ild->bs=3D0x560db0e50420)
> bs=3D0x560db0e50420 (qcow2) enter
> bs=3D0x560db0e3b030 (backup-top) processing parents
> bs=3D0x560db0e3b030 (backup-top) processing itself
>=20
> I see that "blk_do_set_aio_context()" passes "blk->root" to
> "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
> so I'm not sure what's happening here. Is backup-top is referenced
> from two different BdrvChild or is "blk->root" not pointing to
> backup-top's BDS?

The second time that backup-top is entered, it is not as the BDS of
blk->root, but as the parent node of the overlay qcow2. Which is
interesting, because last time it was still the backing qcow2, so the
change did have _some_ effect.

The part that I don't understand is why you still get the line with
child=3D0x560db1b14a20, because when you add all children to the ignore
list first, that should have been put into the ignore list as one of the
first things in the whole process (when backup-top was first entered).

Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
but isn't actually present in backup-top's bs->children?

Kevin

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/aUmYACgkQfwmycsiP
L9a7eBAAhQfYOdhwdHGjyfgOrVAtrXPe/HVx2BROGQdMTOM1AWTYokDVrbFweYkp
jRJXMlNFhCwCZUthexOdvWSIsk8aX92H7YEXi40jypjz3+8QoP8jFqtdHD5m/CiL
HBsE7E/0InJF7DDVz/lCh1fzb5venrFBkVo8uOqEu7/EfQod9JFnDblmCLqwzcOa
d/aDnkcQb6hr4RhE/RdBIcnnDWHIwXU4f00rDxSm/0cJ6Axie+jXWyWZdDnCDnQQ
SWny6JV2GiWjOPPuYgL9WYU18HXLftCoxp35FERjZOMAtNi3uQ8LJ08VjVbJoCB7
Wm9oqA1lYbXl9dXPluzQRPpawo/Fro+Iorx6Ss1N9eFnQPSJi1lxd/y6iKE0VJ56
0YBBqEoMEzdLsxVXu/o3ayYzxI+wm6u/3yPjLQl3MPRacBIGXfBtmXwp21JdTKQL
HhLWE6dGIarB5NuEDI0ri6rlA6SHsfl7i0dWqGAWf5V9bn0kG/JKXQwUJl8QcVJG
neVMaekXwsQ6aZ+y644ehEEWFixxSbbTWLyPfOlf27vU4cc6ANGmPS6YGJxWyaWN
Vm+Cz03nTtOJ4Tm7yLnRFsiDz7+mqWlHhDantQrjSO9QOcoaTyfvnBbVJR+1OPTt
70Ewl3R/h1iNyJHxhN6jDKzfUSsYw9GB+u+ie9waatTQrkm2vkM=
=0pF9
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--


