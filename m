Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC92DFEC0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 18:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57465.100549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOf8-0002OD-1i; Mon, 21 Dec 2020 17:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57465.100549; Mon, 21 Dec 2020 17:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOf7-0002No-Uj; Mon, 21 Dec 2020 17:07:57 +0000
Received: by outflank-mailman (input) for mailman id 57465;
 Mon, 21 Dec 2020 17:07:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UJ16=FZ=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1krOf6-0002Nj-Fh
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 17:07:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 341aaed0-5ab3-4888-9864-5a8fdecaadfd;
 Mon, 21 Dec 2020 17:07:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-mdHOWa_6MG2mqk5i0E4Gjg-1; Mon, 21 Dec 2020 12:07:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15171054F8B;
 Mon, 21 Dec 2020 17:07:47 +0000 (UTC)
Received: from localhost (ovpn-117-28.rdu2.redhat.com [10.10.117.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58BC85B695;
 Mon, 21 Dec 2020 17:07:37 +0000 (UTC)
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
X-Inumbo-ID: 341aaed0-5ab3-4888-9864-5a8fdecaadfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608570473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ql3QY2EZmY15Osz1anO3jVM9GRD3QvHydriR29vDEaE=;
	b=HivKIw9/SOjS4obWNyF2SHA0S0i4rsY3TelFbwXpvovZihoIjXt1L/EW+uEmA1DuITLHnX
	0LzLRp4FnGgiP9jeDkoF2Z6LsRcWeoEgQIUR59ks82oSEq9skaTia+Y+w6pgo5VmyFAid4
	po170njrXNzZ158nkugVjxhVAcbaCnQ=
X-MC-Unique: mdHOWa_6MG2mqk5i0E4Gjg-1
Date: Mon, 21 Dec 2020 18:07:36 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 4/4] block: Close block exports in two steps
Message-ID: <20201221170736.6rf4ip7xpvcho2eq@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-5-slp@redhat.com>
 <20201215153405.GF8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215153405.GF8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nrplgk2vygihh27c"
Content-Disposition: inline

--nrplgk2vygihh27c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:34:05PM +0100, Kevin Wolf wrote:
> Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > There's a cross-dependency between closing the block exports and
> > draining the block layer. The latter needs that we close all export's
> > client connections to ensure they won't queue more requests, but the
> > exports may have coroutines yielding in the block layer, which implies
> > they can't be fully closed until we drain it.
>=20
> A coroutine that yielded must have some way to be reentered. So I guess
> the quesiton becomes why they aren't reentered until drain. We do
> process events:
>=20
>     AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
>=20
> So in theory, anything that would finalise the block export closing
> should still execute.
>=20
> What is the difference that drain makes compared to a simple
> AIO_WAIT_WHILE, so that coroutine are reentered during drain, but not
> during AIO_WAIT_WHILE?
>=20
> This is an even more interesting question because the NBD server isn't a
> block node nor a BdrvChildClass implementation, so it shouldn't even
> notice a drain operation.

OK, took a deeper dive into the issue. While shutting down the guest,
some co-routines from the NBD server are stuck here:

nbd_trip
 nbd_handle_request
  nbd_do_cmd_read
   nbd_co_send_sparse_read
    blk_pread
     blk_prw
      blk_read_entry
       blk_do_preadv
        blk_wait_while_drained
         qemu_co_queue_wait

This happens because bdrv_close_all() is called after
bdrv_drain_all_begin(), so all block backends are quiesced.

An alternative approach to this patch would be moving
blk_exp_close_all() to vl.c:qemu_cleanup, before
bdrv_drain_all_begin().

Do you have a preference for one of these options?

Thanks,
Sergio.

--nrplgk2vygihh27c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/g1lcACgkQ9GknjS8M
AjUBEg/9HoD49y3ShNbcRWwXbZD0eTwreK8HAvqk328INIakQIFw5Y398rFnHUoW
z5tMH/NritkqYA/x6a9qBvH+zEhJW+r4skdFmgqcs5N5DQQA/ImemCD2Oc9ytdXc
CTZYjxx90Mz+X5MO9PUY3Ngbx6+oOCGwGQyVlKD/IqPrMd5Fkq/gQpVdShp7oWY9
guFRVAzTdkH36rMvkmxEwbo4x+1CmKuhiQk7IeKcDS7t45TuPGZXCOqE8HGREH29
z7NjRrdatwlmbta14V5YmU4FOZTJy6vq4wSM23evZ3cNjng4D6d92hjxFS9V8fc6
slwv2Dtj4uZZPg+zxvNjq92j0qUKOuiXNfLsEoPaQWwjsZTa9n6P3qHRo3OFp4Ww
leJiVpNVPD+f/5ophXKbTAB/zaw3a8uMx7oXMgYnXjUS4snIWdJ4h1DnuTIPKBA1
VUyh93uCEInT0VlSYrlYeIDu+lZv9/J3wwtpM/CR/P2xFfxFHNzWpoT461YJgHXU
TMto49ag5KSWya+IWjfUiscWuj0nq2RvZVziYNN93o4ekDaMEC2UV65qZZRdxtI7
mgH1oVmQUruWjiSaCVIxwMPT8KCVkngpOlVHkSuY0nSzTebxxjsoJIynhfy/xJwK
GcFjTLpua/nREnq3qg3WBJHJ1Mo9QjKIQ+/1MLxNU+uYo+lGgZc=
=cw1v
-----END PGP SIGNATURE-----

--nrplgk2vygihh27c--


