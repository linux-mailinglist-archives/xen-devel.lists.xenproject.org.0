Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341522DAF9A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 16:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54309.94278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBq0-0001Ef-Ks; Tue, 15 Dec 2020 15:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54309.94278; Tue, 15 Dec 2020 15:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBq0-0001EG-H4; Tue, 15 Dec 2020 15:02:04 +0000
Received: by outflank-mailman (input) for mailman id 54309;
 Tue, 15 Dec 2020 15:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sb05=FT=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kpBpy-0001E9-Qf
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:02:02 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 31d492a8-d1e8-4453-aae4-9d978f5c4156;
 Tue, 15 Dec 2020 15:02:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-G2MurdU8PqS7AuSKestIwA-1; Tue, 15 Dec 2020 10:01:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6AD5192CC7A;
 Tue, 15 Dec 2020 15:01:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C545B19C44;
 Tue, 15 Dec 2020 15:01:21 +0000 (UTC)
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
X-Inumbo-ID: 31d492a8-d1e8-4453-aae4-9d978f5c4156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608044520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jf3sbZ3jClT4129xhsQLzjLRz8BmOvREW3TyV/kU598=;
	b=WpioA3Pxlzqo+rwf7Uf3j4S2gJ+Me2ltc3GISGL4yX/MaSOSlOYYxCNe22WBJ49W3N+FFU
	cf0hhhktrtVTVZ68zAAj8q4hWrsbdhNsGSwfWD6+0F66Ck08DAfRsSFg5Td/yiMVaWHFsY
	Fa1Mkd8fQjr2ZMqvsNQ+GzE6E5Ub2gM=
X-MC-Unique: G2MurdU8PqS7AuSKestIwA-1
Date: Tue, 15 Dec 2020 16:01:19 +0100
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
Message-ID: <20201215150119.GE8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-3-slp@redhat.com>
 <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20201215131527.evpidxevevtfy54n@mhamilton>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 15.12.2020 um 14:15 hat Sergio Lopez geschrieben:
> On Tue, Dec 15, 2020 at 01:12:33PM +0100, Kevin Wolf wrote:
> > Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > > While processing the parents of a BDS, one of the parents may process
> > > the child that's doing the tail recursion, which leads to a BDS being
> > > processed twice. This is especially problematic for the aio_notifiers=
,
> > > as they might attempt to work on both the old and the new AIO
> > > contexts.
> > >=20
> > > To avoid this, add the BDS pointer to the ignore list, and check the
> > > child BDS pointer while iterating over the children.
> > >=20
> > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> >=20
> > Ugh, so we get a mixed list of BdrvChild and BlockDriverState? :-/
>=20
> I know, it's effective but quite ugly...
>=20
> > What is the specific scenario where you saw this breaking? Did you have
> > multiple BdrvChild connections between two nodes so that we would go to
> > the parent node through one and then come back to the child node throug=
h
> > the other?
>=20
> I don't think this is a corner case. If the graph is walked top->down,
> there's no problem since children are added to the ignore list before
> getting processed, and siblings don't process each other. But, if the
> graph is walked bottom->up, a BDS will start processing its parents
> without adding itself to the ignore list, so there's nothing
> preventing them from processing it again.

I don't understand. child is added to ignore before calling the parent
callback on it, so how can we come back through the same BdrvChild?

    QLIST_FOREACH(child, &bs->parents, next_parent) {
        if (g_slist_find(*ignore, child)) {
            continue;
        }
        assert(child->klass->set_aio_ctx);
        *ignore =3D g_slist_prepend(*ignore, child);
        child->klass->set_aio_ctx(child, new_context, ignore);
    }

> I'm pasting here an annotated trace of bdrv_set_aio_context_ignore I
> generated while triggering the issue:
>=20
> <----- begin ------>
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing children
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 processing children
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing children
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing parents
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e52060 processing itself
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e5d420 processing parents
>=20
>  - We enter b_s_a_c_i with BDS 2fbf660 the first time:
> =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing children
>=20
>  - We enter b_s_a_c_i with BDS 3bc0c00, a child of 2fbf660:
> =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 processing children
> bdrv_set_aio_context_ignore: bs=3D0x555ee3bc0c00 processing parents

>=20
>  - We start processing its parents:
> =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing parents
>=20
>  - We enter b_s_a_c_i with BDS 2e48030, a parent of 2fbf660:
> =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing children
>=20
>  - We enter b_s_a_c_i with BDS 2fbf660 again, because of parent
>    2e48030 didn't found us it in the ignore list:
>   =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 enter
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing children
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing parents
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing itself
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing parents
> bdrv_set_aio_context_ignore: bs=3D0x555ee2e48030 processing itself
>=20
>  - BDS 2fbf660 will be processed here a second time, triggering the
>    issue:
>   =20
> bdrv_set_aio_context_ignore: bs=3D0x555ee2fbf660 processing itself
> <----- end ------>

You didn't dump the BdrvChild here. I think that would add some
information on why we re-entered 0x555ee2fbf660. Maybe you can also add
bs->drv->format_name for each node to make the scenario less abstract?

So far my reconstruction of the graph is something like this:

0x555ee2e48030 --+
   |  |          |
   |  |          +-> 0x555ee2e5d420 -> 0x555ee2e52060
   v  v          |
0x555ee2fbf660 --+
           |
           +-------> 0x555ee3bc0c00

It doesn't look quite trivial, but if 0x555ee2e48030 is the filter node
of a block job, it's not hard to imagine either.

> I suspect this has been happening for a while, and has only surfaced
> now due to the need to run an AIO context BH in an aio_notifier
> function that the "nbd/server: Quiesce coroutines on context switch"
> patch introduces. There the problem is that the first time the
> aio_notifier AIO detach function is called, it works on the old
> context (as it should be), and the second one works on the new context
> (which is wrong).
>=20
> > Maybe if what we really need to do is not processing every edge once,
> > but processing every node once, the list should be changed to contain
> > _only_ BDS objects. But then blk_do_set_aio_context() probably won't
> > work any more because it can't have blk->root ignored any more...
>=20
> I tried that in my first attempt and it broke badly. I didn't take a
> deeper look at the causes.
>=20
> > Anyway, if we end up changing what the list contains, the comment needs
> > an update, too. Currently it says:
> >=20
> >  * @ignore will accumulate all visited BdrvChild object. The caller is
> >  * responsible for freeing the list afterwards.
> >=20
> > Another option: Split the parents QLIST_FOREACH loop in two. First add
> > all parent BdrvChild objects to the ignore list, remember which of them
> > were newly added, and only after adding all of them call
> > child->klass->set_aio_ctx() for each parent that was previously not on
> > the ignore list. This will avoid that we come back to the same node
> > because all of its incoming edges are ignored now.
>=20
> I don't think this strategy will fix the issue illustrated in the
> trace above, as the BdrvChild pointer of the BDS processing its
> parents won't be the on ignore list by the time one of its parents
> starts processing its own children.

But why? We do append to the ignore list each time before we recurse
into a child or parent node. The only way I see is if you have two
separate BdrvChild links between the nodes.

Kevin

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl/Yz78ACgkQfwmycsiP
L9abTA/+OSf0+xD2lm5JSqzqGFhGcXKJZqW2/X3Kt1TWhZOsX6Rvlyl0oCqgwOWt
plCkHKjbFzhciuJBhA3OdkrRqHBUlzguRBG3haBITV4KlOnMLcgxvQr1kdB+MUny
ZY7+WBT+NNVFFsfYua14/q7nbjcuyvf+SZa5OYnFN3RRDkQyaKLZnrMJh/0WgQz4
/+s1vGLEyJ2Eh9ASp8N0Td+NBLoQ41nEyGHPYwag7ogpEJakoWEeGhKiNqitJRXs
5y3WWBvM+xt962D9z29lbUcxJiJ97TWpNvebOIRj+EkXUsYfAZKL0Lywaa2CJtu+
++gq0f3dlXW219D90gmWu7pd+DgUFAoZvW7Z80PICkjKMR0Z+YMT5CD2E2jhs/qF
4XYb+6cZJ6pZglqDcKQuGtqqN0i0uvEevrym1S+N0cHQzY05W9wlWZJY33Ie4Lpy
KfaRZ4tdGUryPD1xX3OQSsXh+VFwNM3YAHxgC7h5e0UiNGsN0sllWKDXcevTyxdM
SB1MjvK+AJm/j6C+lF0IAJlEJ3RZq3f77CBYq3kMWHv40ai1lCeTjTaOnTiSarhe
nvqvqbEsf7FRvuP3mnsl1zVBOLNQXxmD4nBveydDrmCid0DCz2Mg/2mGt7tpGV/t
CcMFPCs9RSDWhy5F8m7FOeD5CZZXbFaFnjTuKY6eEfmPjhFNb90=
=PR8T
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


