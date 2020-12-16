Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4032DC287
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 15:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55289.96345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpYD0-0003vg-D3; Wed, 16 Dec 2020 14:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55289.96345; Wed, 16 Dec 2020 14:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpYD0-0003vH-9w; Wed, 16 Dec 2020 14:55:18 +0000
Received: by outflank-mailman (input) for mailman id 55289;
 Wed, 16 Dec 2020 14:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VqGa=FU=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1kpYCy-0003vA-M1
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 14:55:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4007072f-f154-407f-9208-4066ec0f5ce1;
 Wed, 16 Dec 2020 14:55:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-foJ0_GvjMiaI7T4WXfgDzA-1; Wed, 16 Dec 2020 09:55:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2939107ACF6;
 Wed, 16 Dec 2020 14:55:09 +0000 (UTC)
Received: from localhost (ovpn-115-223.rdu2.redhat.com [10.10.115.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09C7460C15;
 Wed, 16 Dec 2020 14:55:02 +0000 (UTC)
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
X-Inumbo-ID: 4007072f-f154-407f-9208-4066ec0f5ce1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608130514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWLMB7IDWR7sP3FDJj69QwoPb+z2DnqCQ1Kbpkqm3NA=;
	b=Tbmpg0Wtr9NrgxBlnj9j+Jso5vRqUxjZhog/RmM9GacJx+ccQaTyFqxtIMAPAWul/ie8zB
	sujVeirU9qBwmZ8Wj182DhTCiCQMzVrONoB07uerOjX/Sis+/L+wwCAVC5VmUwvh11dTQK
	Zt5LSH9omHRQ73H80MzhwpXIP9PignE=
X-MC-Unique: foJ0_GvjMiaI7T4WXfgDzA-1
Date: Wed, 16 Dec 2020 15:55:02 +0100
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
Message-ID: <20201216145502.yiejsw47q5pfbzio@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201216123514.GD7548@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yz6yiipnpvshq5nu"
Content-Disposition: inline

--yz6yiipnpvshq5nu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> Am 15.12.2020 um 18:23 hat Sergio Lopez geschrieben:
> > On Tue, Dec 15, 2020 at 04:01:19PM +0100, Kevin Wolf wrote:
> > > Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> > > > On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > > > > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > > > > While processing the parents of a BDS, one of the parents may p=
rocess
> > > > > > the child that's doing the tail recursion, which leads to a BDS=
 being
> > > > > > processed twice. This is especially problematic for the aio_not=
ifiers,
> > > > > > as they might attempt to work on both the old and the new AIO
> > > > > > contexts.
> > > > > >=20
> > > > > > To avoid this, add the BDS pointer to the ignore list, and chec=
k the
> > > > > > child BDS pointer while iterating over the children.
> > > > > >=20
> > > > > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > > > >=20
> > > > > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-=
/
> > > >=20
> > > > I know, it's effective but quite ugly...
> > > >=20
> > > > > What is the specific scenario where you saw this breaking? Did yo=
u have
> > > > > multiple BdrvChild connections between two nodes so that we would=
 go to
> > > > > the parent node through one and then come back to the child node =
through
> > > > > the other?
> > > >=20
> > > > I don't think this is a corner case. If the graph is walked top->do=
wn,
> > > > there's no problem since children are added to the ignore list befo=
re
> > > > getting processed, and siblings don't process each other. But, if t=
he
> > > > graph is walked bottom->up, a BDS will start processing its parents
> > > > without adding itself to the ignore list, so there's nothing
> > > > preventing them from processing it again.
> > >=20
> > > I don't understand. child is added to ignore before calling the paren=
t
> > > callback on it, so how can we come back through the same BdrvChild?
> > >=20
> > >     QLIST_FOREACH(child, &bs->parents, next_parent) {
> > >         if (g_slist_find(*ignore, child)) {
> > >             continue;
> > >         }
> > >         assert(child->klass->set_aio_ctx);
> > >         *ignore =3D g_slist_prepend(*ignore, child);
> > >         child->klass->set_aio_ctx(child, new_context, ignore);
> > >     }
> >=20
> > Perhaps I'm missing something, but the way I understand it, that loop
> > is adding the BdrvChild pointer of each of its parents, but not the
> > BdrvChild pointer of the BDS that was passed as an argument to
> > b_s_a_c_i.
>=20
> Generally, the caller has already done that.
>=20
> In the theoretical case that it was the outermost call in the recursion
> and it hasn't (I couldn't find any such case), I think we should still
> call the callback for the passed BdrvChild like we currently do.
>=20
> > > You didn't dump the BdrvChild here. I think that would add some
> > > information on why we re-entered 0x555ee2fbf660. Maybe you can also a=
dd
> > > bs->drv->format_name for each node to make the scenario less abstract=
?
> >=20
> > I've generated another trace with more data:
> >=20
> > bs=3D0x565505e48030 (backup-top) enter
> > bs=3D0x565505e48030 (backup-top) processing children
> > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e42090 (=
child->bs=3D0x565505e5d420)
> > bs=3D0x565505e5d420 (qcow2) enter
> > bs=3D0x565505e5d420 (qcow2) processing children
> > bs=3D0x565505e5d420 (qcow2) calling bsaci child=3D0x565505e41ea0 (child=
->bs=3D0x565505e52060)
> > bs=3D0x565505e52060 (file) enter
> > bs=3D0x565505e52060 (file) processing children
> > bs=3D0x565505e52060 (file) processing parents
> > bs=3D0x565505e52060 (file) processing itself
> > bs=3D0x565505e5d420 (qcow2) processing parents
> > bs=3D0x565505e5d420 (qcow2) calling set_aio_ctx child=3D0x5655066a34d0
> > bs=3D0x565505fbf660 (qcow2) enter
> > bs=3D0x565505fbf660 (qcow2) processing children
> > bs=3D0x565505fbf660 (qcow2) calling bsaci child=3D0x565505e41d20 (child=
->bs=3D0x565506bc0c00)
> > bs=3D0x565506bc0c00 (file) enter
> > bs=3D0x565506bc0c00 (file) processing children
> > bs=3D0x565506bc0c00 (file) processing parents
> > bs=3D0x565506bc0c00 (file) processing itself
> > bs=3D0x565505fbf660 (qcow2) processing parents
> > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x565505fc7aa0
> > bs=3D0x565505fbf660 (qcow2) calling set_aio_ctx child=3D0x5655068b8510
> > bs=3D0x565505e48030 (backup-top) enter
> > bs=3D0x565505e48030 (backup-top) processing children
> > bs=3D0x565505e48030 (backup-top) calling bsaci child=3D0x565505e3c450 (=
child->bs=3D0x565505fbf660)
> > bs=3D0x565505fbf660 (qcow2) enter
> > bs=3D0x565505fbf660 (qcow2) processing children
> > bs=3D0x565505fbf660 (qcow2) processing parents
> > bs=3D0x565505fbf660 (qcow2) processing itself
> > bs=3D0x565505e48030 (backup-top) processing parents
> > bs=3D0x565505e48030 (backup-top) calling set_aio_ctx child=3D0x565505e4=
02d0
> > bs=3D0x565505e48030 (backup-top) processing itself
> > bs=3D0x565505fbf660 (qcow2) processing itself
>=20
> Hm, is this complete? Is see no "processing itself" for
> bs=3D0x565505e5d420. Or is this because it crashed before getting there?

Yes, it crashes there. I forgot to mention that, sorry.

> Anyway, trying to reconstruct the block graph with BdrvChild pointers
> annotated at the edges:
>=20
> BlockBackend
>       |
>       v
>   backup-top ------------------------+
>       |   |                          |
>       |   +-----------------------+  |
>       |            0x5655068b8510 |  | 0x565505e3c450
>       |                           |  |
>       | 0x565505e42090            |  |
>       v                           |  |
>     qcow2 ---------------------+  |  |
>       |                        |  |  |
>       | 0x565505e52060         |  |  | ??? [1]
>       |                        |  |  |  |
>       v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
>     file                       v  v  v  v
>                              qcow2 (backing)
>                                     |
>                                     | 0x565505e41d20
>                                     v
>                                   file
>=20
> [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
>     BdrvChild directly owned by the backup job.
>=20
> > So it seems this is happening:
> >=20
> > backup-top (5e48030) <---------| (5)
> >    |    |                      |
> >    |    | (6) ------------> qcow2 (5fbf660)
> >    |                           ^    |
> >    |                       (3) |    | (4)
> >    |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> >    |
> >    |-> (2) file (5e52060)
> >=20
> > backup-top (5e48030), the BDS that was passed as argument in the first
> > bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
> > is processing its parents, and the latter is also re-entered when the
> > first one starts processing its children again.
>=20
> Yes, but look at the BdrvChild pointers, it is through different edges
> that we come back to the same node. No BdrvChild is used twice.
>=20
> If backup-top had added all of its children to the ignore list before
> calling into the overlay qcow2, the backing qcow2 wouldn't eventually
> have called back into backup-top.

I've tested a patch that first adds every child to the ignore list,
and then processes those that weren't there before, as you suggested
on a previous email. With that, the offending qcow2 is not re-entered,
so we avoid the crash, but backup-top is still entered twice:

bs=3D0x560db0e3b030 (backup-top) enter
bs=3D0x560db0e3b030 (backup-top) processing children
bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e2f450 (chil=
d->bs=3D0x560db0fb2660)
bs=3D0x560db0fb2660 (qcow2) enter
bs=3D0x560db0fb2660 (qcow2) processing children
bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db0e34d20 (child->bs=
=3D0x560db1bb3c00)
bs=3D0x560db1bb3c00 (file) enter
bs=3D0x560db1bb3c00 (file) processing children
bs=3D0x560db1bb3c00 (file) processing parents
bs=3D0x560db1bb3c00 (file) processing itself
bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db16964d0 (child->bs=
=3D0x560db0e50420)
bs=3D0x560db0e50420 (qcow2) enter
bs=3D0x560db0e50420 (qcow2) processing children
bs=3D0x560db0e50420 (qcow2) calling bsaci child=3D0x560db0e34ea0 (child->bs=
=3D0x560db0e45060)
bs=3D0x560db0e45060 (file) enter
bs=3D0x560db0e45060 (file) processing children
bs=3D0x560db0e45060 (file) processing parents
bs=3D0x560db0e45060 (file) processing itself
bs=3D0x560db0e50420 (qcow2) processing parents
bs=3D0x560db0e50420 (qcow2) processing itself
bs=3D0x560db0fb2660 (qcow2) processing parents
bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1672860
bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db1b14a20
bs=3D0x560db0e3b030 (backup-top) enter
bs=3D0x560db0e3b030 (backup-top) processing children
bs=3D0x560db0e3b030 (backup-top) processing parents
bs=3D0x560db0e3b030 (backup-top) calling set_aio_ctx child=3D0x560db0e332d0
bs=3D0x560db0e3b030 (backup-top) processing itself
bs=3D0x560db0fb2660 (qcow2) processing itself
bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0e35090 (chil=
d->bs=3D0x560db0e50420)
bs=3D0x560db0e50420 (qcow2) enter
bs=3D0x560db0e3b030 (backup-top) processing parents
bs=3D0x560db0e3b030 (backup-top) processing itself

I see that "blk_do_set_aio_context()" passes "blk->root" to
"bdrv_child_try_set_aio_context()" so it's already in the ignore list,
so I'm not sure what's happening here. Is backup-top is referenced
from two different BdrvChild or is "blk->root" not pointing to
backup-top's BDS?

Thanks,
Sergio.

--yz6yiipnpvshq5nu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/aH74ACgkQ9GknjS8M
AjU7/w/5AXB1yOkP+qQSstZ7lYY13rY+gfBW+kR2bprvpAi3evIsPVy7rNQSUn36
/mZhlgIAtgTsmPpNd0BBIfCWRW4ZnIgcKw5XxeKvE2xfZ7wTfjSoXWE+TdbPZWZR
+u+bXcoL4+tLmXPkP4GKTN8MexF4l6MiomcczzbZlezzcWZ4E41Tuha+FuDFKG13
tjCnK7mwk/uqyAkRa7iGb2K3+4iHgUTsXEO2f8CJlsppjW6Opy8FSetQyH3M79yP
lTGV+ttQ14Y3d+HahinQKZPisl+tn5dVhUl2f3H09YkUUW3pH8edyVcX/3fcvuy/
B57eTuKlmdyhSEokmTkt21sOh/9bUgULVHi/QbfG6IqM2+bus+9y67C9+PD/SqEc
IWrO74GOiB8luQua9E1PQhAKjKTwnSQOS9YBO5Lt72c6PJsuTFZ4sifPNo2c+3LE
9+cVcOwYcbM1E+9g7twZqibYQ/9ADZGInHLKqel/h1DsGfEKOL4LN51uziftDSZe
YufQQERp/hE2EzSWSb6IB06AtDAyrzTSnDDQVcHGnh93TxJ4YXa/LSOCfSB1QTAv
4NGHa2QrhXcFBKgqVHRd6lkxr5md0e7iT0hKyaYuep0IBUXVfOUw4QNJKZJ8FSlZ
qA02t67HmJnbFRrydzzKNgJFq0eHMEN3w3VEuO/bZA3QArDDJNk=
=+Grh
-----END PGP SIGNATURE-----

--yz6yiipnpvshq5nu--


