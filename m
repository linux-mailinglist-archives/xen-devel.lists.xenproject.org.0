Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470222DCE85
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 10:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55809.97383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppjV-0008MA-8S; Thu, 17 Dec 2020 09:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55809.97383; Thu, 17 Dec 2020 09:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kppjV-0008Ll-53; Thu, 17 Dec 2020 09:38:01 +0000
Received: by outflank-mailman (input) for mailman id 55809;
 Thu, 17 Dec 2020 09:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMd0=FV=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1kppjS-0008Lg-Vk
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 09:37:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d3da13aa-2e01-4c0f-bdb0-fad771dbece9;
 Thu, 17 Dec 2020 09:37:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-ZUMVJ2InMn-COX4tGwi0tw-1; Thu, 17 Dec 2020 04:37:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DA6180E46A;
 Thu, 17 Dec 2020 09:37:52 +0000 (UTC)
Received: from localhost (ovpn-112-215.rdu2.redhat.com [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 889771971D;
 Thu, 17 Dec 2020 09:37:45 +0000 (UTC)
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
X-Inumbo-ID: d3da13aa-2e01-4c0f-bdb0-fad771dbece9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608197876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pZiRRy/inHhproaErA7w2RhzvrVms5706fxsIiKShc=;
	b=gZ+f0jAgXfpoEdB45EqVIUcE6dQTMBzh2UmFrHDeytpZVkRFz5nxehGRZpBx2ooYxwoWoS
	CJTQLSMm9OUkBMn44n6kSuR/bHklQQTB/1i8dAvBdFEf/RmKdq2fGNy/j08PwptcS5f2jO
	enrjwkrAh6kzOfciBJSuhrjK8JBtOJc=
X-MC-Unique: ZUMVJ2InMn-COX4tGwi0tw-1
Date: Thu, 17 Dec 2020 10:37:44 +0100
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
Message-ID: <20201217093744.tg6ik73o45nidcs4@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201216183102.GH7548@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tn3wo75ygssgd6yr"
Content-Disposition: inline

--tn3wo75ygssgd6yr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
> Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
> > On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> > > Am 15.12.2020 um 18:23 hat Sergio Lopez geschrieben:
> > > > On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> > > > > Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > > > > > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > > > > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > > > > > While processing the parents of a BDS, one of the parents m=
ay process
> > > > > > > > the child that's doing the tail recursion, which leads to a=
 BDS being
> > > > > > > > processed twice. This is especially problematic for the aio=
_notifiers,
> > > > > > > > as they might attempt to work on both the old and the new A=
IO
> > > > > > > > contexts.
> > > > > > > >=20
> > > > > > > > To avoid this, add the BDS pointer to the ignore list, and =
check the
> > > > > > > > child BDS pointer while iterating over the children.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > > > > >=20
> > > > > > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState=
? :-/
> > > > > >=20
> > > > > > I know, it's effective but quite ugly...
> > > > > >=20
> > > > > > > What is the specific scenario where you saw this breaking? Di=
d you have
> > > > > > > multiple BdrvChild connections between two nodes so that we w=
ould go to
> > > > > > > the parent node through one and then come back to the child n=
ode through
> > > > > > > the other?
> > > > > >=20
> > > > > > I don't think this is a corner case. If the graph is walked top=
->down,
> > > > > > there's no problem since children are added to the ignore list =
before
> > > > > > getting processed, and siblings don't process each other. But, =
if the
> > > > > > graph is walked bottom->up, a BDS will start processing its par=
ents
> > > > > > without adding itself to the ignore list, so there's nothing
> > > > > > preventing them from processing it again.
> > > > >=20
> > > > > I don't understand. child is added to ignore before calling the p=
arent
> > > > > callback on it, so how can we come back through the same BdrvChil=
d?
> > > > >=20
> > > > >     QLIST_FOREACH(child, &bs->parents, next_parent) {
> > > > >         if (g_slist_find(*ignore, child)) {
> > > > >             continue;
> > > > >         }
> > > > >         assert(child->klass->set_aio_ctx);
> > > > >         *ignore =3D g_slist_prepend(*ignore, child);
> > > > >         child->klass->set_aio_ctx(child, new_context, ignore);
> > > > >     }
> > > >=20
> > > > Perhaps I'm missing something, but the way I understand it, that lo=
op
> > > > is adding the BdrvChild pointer of each of its parents, but not the
> > > > BdrvChild pointer of the BDS that was passed as an argument to
> > > > b_s_a_c_i.
> > >=20
> > > Generally, the caller has already done that.
> > >=20
> > > In the theoretical case that it was the outermost call in the recursi=
on
> > > and it hasn't (I couldn't find any such case), I think we should stil=
l
> > > call the callback for the passed BdrvChild like we currently do.
> > >=20
> > > > > You didn't dump the BdrvChild here. I think that would add some
> > > > > information on why we re-entered 0x555ee2fbf660. Maybe you can al=
so add
> > > > > bs->drv->format_name for each node to make the scenario less abst=
ract?
> > > >=20
> > > > I've generated another trace with more data:
> > > >=20
> > > > bs=3D0x565505e48030 (backup-top) enter
> > > > bs=3D0x565505e48030 (backup-top) processing children
> > > > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e420=
90 (child->bs=3D0x565505e5d420)
> > > > bs=3D0x565505e5d420 (qcow2) enter
> > > > bs=3D0x565505e5d420 (qcow2) processing children
> > > > bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (c=
hild->bs=3D0x565505e52060)
> > > > bs=3D0x565505e52060 (file) enter
> > > > bs=3D0x565505e52060 (file) processing children
> > > > bs=3D0x565505e52060 (file) processing parents
> > > > bs=3D0x565505e52060 (file) processing itself
> > > > bs=3D0x565505e5d420 (qcow2) processing parents
> > > > bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a3=
4d0
> > > > bs=3D0x565505fbf660 (qcow2) enter
> > > > bs=3D0x565505fbf660 (qcow2) processing children
> > > > bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (c=
hild->bs=3D0x565506bc0c00)
> > > > bs=3D0x565506bc0c00 (file) enter
> > > > bs=3D0x565506bc0c00 (file) processing children
> > > > bs=3D0x565506bc0c00 (file) processing parents
> > > > bs=3D0x565506bc0c00 (file) processing itself
> > > > bs=3D0x565505fbf660 (qcow2) processing parents
> > > > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7=
aa0
> > > > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b8=
510
> > > > bs=3D0x565505e48030 (backup-top) enter
> > > > bs=3D0x565505e48030 (backup-top) processing children
> > > > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c4=
50 (child->bs=3D0x565505fbf660)
> > > > bs=3D0x565505fbf660 (qcow2) enter
> > > > bs=3D0x565505fbf660 (qcow2) processing children
> > > > bs=3D0x565505fbf660 (qcow2) processing parents
> > > > bs=3D0x565505fbf660 (qcow2) processing itself
> > > > bs=3D0x565505e48030 (backup-top) processing parents
> > > > bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x5655=
05e402d0
> > > > bs=3D0x565505e48030 (backup-top) processing itself
> > > > bs=3D0x565505fbf660 (qcow2) processing itself
> > >=20
> > > Hm, is this complete? Is see no "processing itself" for
> > > bs=3D0x565505e5d420. Or is this because it crashed before getting the=
re?
> >=20
> > Yes, it crashes there. I forgot to mention that, sorry.
> >=20
> > > Anyway, trying to reconstruct the block graph with BdrvChild pointers
> > > annotated at the edges:
> > >=20
> > > BlockBackend
> > >       |
> > >       v
> > >   backup-top ------------------------+
> > >       |   |                          |
> > >       |   +-----------------------+  |
> > >       |            0x5655068b8510 |  | 0x565505e3c450
> > >       |                           |  |
> > >       | 0x565505e42090            |  |
> > >       v                           |  |
> > >     qcow2 ---------------------+  |  |
> > >       |                        |  |  |
> > >       | 0x565505e52060         |  |  | ??? [1]
> > >       |                        |  |  |  |
> > >       v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
> > >     file                       v  v  v  v
> > >                              qcow2 (backing)
> > >                                     |
> > >                                     | 0x565505e41d20
> > >                                     v
> > >                                   file
> > >=20
> > > [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
> > >     BdrvChild directly owned by the backup job.
> > >=20
> > > > So it seems this is happening:
> > > >=20
> > > > backup-top (5e48030) <---------| (5)
> > > >    |    |                      |
> > > >    |    | (6) ------------> qcow2 (5fbf660)
> > > >    |                           ^    |
> > > >    |                       (3) |    | (4)
> > > >    |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> > > >    |
> > > >    |-> (2) file (5e52060)
> > > >=20
> > > > backup-top (5e48030), the BDS that was passed as argument in the fi=
rst
> > > > bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf6=
60)
> > > > is processing its parents, and the latter is also re-entered when t=
he
> > > > first one starts processing its children again.
> > >=20
> > > Yes, but look at the BdrvChild pointers, it is through different edge=
s
> > > that we come back to the same node. No BdrvChild is used twice.
> > >=20
> > > If backup-top had added all of its children to the ignore list before
> > > calling into the overlay qcow2, the backing qcow2 wouldn't eventually
> > > have called back into backup-top.
> >=20
> > I've tested a patch that first adds every child to the ignore list,
> > and then processes those that weren't there before, as you suggested
> > on a previous email. With that, the offending qcow2 is not re-entered,
> > so we avoid the crash, but backup-top is still entered twice:
>=20
> I think we also need to every parent to the ignore list before calling
> callbacks, though it doesn't look like this is the problem you're
> currently seeing.

I agree.

> > bs=3D0x560db0e3b030 (backup-top) enter
> > bs=3D0x560db0e3b030 (backup-top) processing children
> > bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e2f450 (=
child->bs=3D0x560db0fb2660)
> > bs=3D0x560db0fb2660 (qcow2) enter
> > bs=3D0x560db0fb2660 (qcow2) processing children
> > bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db0e34d20 (child=
->bs=3D0x560db1bb3c00)
> > bs=3D0x560db1bb3c00 (file) enter
> > bs=3D0x560db1bb3c00 (file) processing children
> > bs=3D0x560db1bb3c00 (file) processing parents
> > bs=3D0x560db1bb3c00 (file) processing itself
> > bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db16964d0 (child=
->bs=3D0x560db0e50420)
> > bs=3D0x560db0e50420 (qcow2) enter
> > bs=3D0x560db0e50420 (qcow2) processing children
> > bs=3D0x560db0e50420 (qcow2) calling bsaci child=3D0x560db0e34ea0 (child=
->bs=3D0x560db0e45060)
> > bs=3D0x560db0e45060 (file) enter
> > bs=3D0x560db0e45060 (file) processing children
> > bs=3D0x560db0e45060 (file) processing parents
> > bs=3D0x560db0e45060 (file) processing itself
> > bs=3D0x560db0e50420 (qcow2) processing parents
> > bs=3D0x560db0e50420 (qcow2) processing itself
> > bs=3D0x560db0fb2660 (qcow2) processing parents
> > bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1672860
> > bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1b14a20
> > bs=3D0x560db0e3b030 (backup-top) enter
> > bs=3D0x560db0e3b030 (backup-top) processing children
> > bs=3D0x560db0e3b030 (backup-top) processing parents
> > bs=3D0x560db0e3b030 (backup-top) calling set_aio_ctx child=3D0x560db0e3=
32d0
> > bs=3D0x560db0e3b030 (backup-top) processing itself
> > bs=3D0x560db0fb2660 (qcow2) processing itself
> > bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e35090 (=
child->bs=3D0x560db0e50420)
> > bs=3D0x560db0e50420 (qcow2) enter
> > bs=3D0x560db0e3b030 (backup-top) processing parents
> > bs=3D0x560db0e3b030 (backup-top) processing itself
> >=20
> > I see that "blk_do_set_aio_context()" passes "blk->root" to
> > "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
> > so I'm not sure what's happening here. Is backup-top is referenced
> > from two different BdrvChild or is "blk->root" not pointing to
> > backup-top's BDS?
>=20
> The second time that backup-top is entered, it is not as the BDS of
> blk->root, but as the parent node of the overlay qcow2. Which is
> interesting, because last time it was still the backing qcow2, so the
> change did have _some_ effect.
>=20
> The part that I don't understand is why you still get the line with
> child=3D0x560db1b14a20, because when you add all children to the ignore
> list first, that should have been put into the ignore list as one of the
> first things in the whole process (when backup-top was first entered).
>=20
> Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
> but isn't actually present in backup-top's bs->children?

Exactly, that line corresponds to this chunk of code:

<---- begin ---->
    QLIST_FOREACH(child, &bs->parents, next_parent) {
        if (g_slist_find(*ignore, child)) {
            continue;
        }
        assert(child->klass->set_aio_ctx);
        *ignore =3D g_slist_prepend(*ignore, child);
        fprintf(stderr, "bs=3D%p (%s) calling set_aio_ctx child=3D%p\n", bs=
, bs->drv->format_name, child);
        child->klass->set_aio_ctx(child, new_context, ignore);
    }
<---- end ---->

Do you think it's safe to re-enter backup-top, or should we look for a
way to avoid this?

Thanks,
Sergio.

--tn3wo75ygssgd6yr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/bJuUACgkQ9GknjS8M
AjU+fQ//TebTZnzd4upDxj883rb7kSYGIpv0HgiZ7FTIlsUpRCJ2Vfy0fMAadd7X
Xzt9zb1hjXBA6NwLLfXKk18wrPWiZj9hZcvZmmQ7oqH6OqklETpfZab2pIpwypaH
DjG2Q0OSFAi5+n/zALOZIk/habt0XbDLlY17XSd5bAkgk9zAHECooeV+Ohig9l+X
epjlmbQ+RabLpoHDwAQMA1SpRgUX6nIxELrqp6GnCS2eWftknYLgXo3kCG3ukkFV
2e4pjyBRWxFic2GG04ekL8B+Uf4lQPFSpUX0SMTcNVF72b63nEEGet/ziH6vG8qy
Pm9EhbTfqeg99o2h7fm4IBBiu7Je4WSHpgEUtu2L3j4NWpLTFZxFp7jfHtm7jZ+Y
8V2kND2Int2dY5+GePjq8MIHh5DindDkD2Q7sd1vSk2iRcfJsaxT2MMQRZvK7oUX
fJ9vc45Bo3PX4WyIjCuxGQrPg0+85RwLYuQ2WjEd483+6oZNU7yfElAmlsnebKac
2eLSwI3zPdEzY4W8MC8bDTpPdPxHVaRqR8W6CTcz0RPD2KQCvJ4nHG1WGyBa3+ul
PHRDXN3wD2WaSoBEo6N5zg3e88gTcQpotHcFWS48EL9fpzdBQh/ptMZTXtYbf5+f
G+GJ1o6oTbOQ1Birn602cGFknsJhd62OfAVeWbT/BIJJGGRFnKE=
=Vi3P
-----END PGP SIGNATURE-----

--tn3wo75ygssgd6yr--


