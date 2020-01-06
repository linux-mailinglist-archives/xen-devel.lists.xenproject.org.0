Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B671315A4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:06:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUr7-0005sG-Mp; Mon, 06 Jan 2020 16:03:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tjc+=23=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ioUr5-0005sB-PY
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:03:47 +0000
X-Inumbo-ID: 1e8fa79a-309e-11ea-ab2c-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e8fa79a-309e-11ea-ab2c-12813bfff9fa;
 Mon, 06 Jan 2020 16:03:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9ACF152A;
 Mon,  6 Jan 2020 11:03:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 06 Jan 2020 11:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qtTjES
 fAhsFRc+reBYue8P354BrPh/yRVPv0NYNCF2U=; b=Xx0No3uF1RU6FpZAuCKCP3
 dVivXtVozzICOOpZhESvy9vUcz5bEe6zCPpN8pZ7LbcFfwyCXaQ6CKq/xlkjAefQ
 CmP7+jsHFwbiUKm6gIioWWz/k30A9zPdSXYj5pWdeo/T/FMhnofUonW2IQq9fu4S
 EI+K7KxMddMGV+Gxqpukqgqo0eI2L+S/2r6zNa2oS7OBFIuna0RZbkuqCBa2bi+X
 GcdS8+ErO9NK8l+/HXIu97elDGd1UBBB1lBqFklHMNetCaKJL11MtUB/q0rMNAID
 XeQfcig4mnhhYh5GIR+ztMh49DynJBuGl+k60NI07zBhM8HA9ZWKbxS0azgRKM+g
 ==
X-ME-Sender: <xms:YFoTXoiij0ILOg3JEuxqHxCgs3CP2U7ouk-V6TT-AJGKqn-bIQsOtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:YFoTXu-rx34SuRt-SqfzoSITnAI2BMm2VJ6SwL198QQEcsWtFZlfgg>
 <xmx:YFoTXiYwQhnFajTsMH-MEffappZVrycHXSTczmMNww1CGl2JcesS-w>
 <xmx:YFoTXt3-O9jZReH1G6wLxSAGeyawlOfCQjDNYjRPApO1hlq4txNU0A>
 <xmx:YVoTXlOp37e2FfN9pmm3y2dcDaKVV6KThFeEI5P9EmEqrm_SQA0pTQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id E89F230602DB;
 Mon,  6 Jan 2020 11:03:43 -0500 (EST)
Date: Mon, 6 Jan 2020 17:03:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200106160340.GL1314@mail-itl>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
 <24083.21734.512820.514082@mariner.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <24083.21734.512820.514082@mariner.uk.xensource.com>
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2334914328425272335=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2334914328425272335==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Content-Disposition: inline


--y96v7rNg6HAoELs5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] libxl: create backend/ xenstore dir for driver domains

On Mon, Jan 06, 2020 at 03:40:22PM +0000, Ian Jackson wrote:
> Adding Roger to the CC.
>=20
> Marek Marczykowski-G=C3=B3recki writes ("Re: [PATCH] libxl: create backen=
d/ xenstore dir for driver domains"):
> > On Mon, Jan 06, 2020 at 02:20:46PM +0000, Ian Jackson wrote:
> > > Marek Marczykowski-G=C3=B3recki writes ("[PATCH] libxl: create backen=
d/ xenstore dir for driver domains"):
> > > > Cleaning up backend xenstore entries is a responsibility of the bac=
kend.
> > > > When backend lives outside of dom0, the domain needs proper permiss=
ions
> > > > to do it. Normally it is given permission to remove the device dir
> > > > itself, but not the dir containing it (named after frontend ID). Af=
ter a
> > > > whole those empty leftover directories accumulate to the point xens=
tore
> > > > returning E2BIG on listing them.
> > > >=20
> > > > Fix this by giving backend domain write access also to backend/
> > > > directory itself when c_info->driver_domain option is set. The code
> > > > removing relevant dir is already there (just lacked permissions to =
do so).
> > > >=20
> > > > Note this also allows the backend domain to create new entries,
> > > > pretending to host backend devices it don't have. But since libxl u=
ses
> > > > /libxl/ xenstore dir for this information (still outside of backend
> > > > domain control), this shouldn't be an issue.
> > >=20
> > > This seems quite hazardous to me.  The reasoning you use to show that
> > > this iws OK seems fragile, and in general it doesn't feel right to
> > > give the particular backend such wide scope.
> > >=20
> > > Can we find another way to address this problem ?  I think the
> > > containing directory should be removed by the toolstack.  Why is this
> > > difficult ?  (I presume there is a reason or you would have done it
> > > that way...)
> >=20
> > It was done this way previously and caused issues, see this commit:
> >=20
> > commit 546678c6a60f64fb186640460dfa69a837c8fba5
> > Author: Roger Pau Monne <roger.pau@citrix.com>
> > Date:   Wed Sep 23 12:06:56 2015 +0200
> >=20
> >     libxl: fix the cleanup of the backend path when using driver domains
>=20
> Thanks.
>=20
> >     With the current libxl implementation the control domain will
> >     remove both the frontend and the backend xenstore paths of a
> >     device that's handled by a driver domain. This is incorrect,
> >     since the driver domain possibly needs to access the backend
> >     path in order to perform the disconnection and cleanup of the
> >     device.
> >    =20
> >     Fix this by making sure the control domain only cleans the
> >     frontend path, leaving the backend path to be cleaned by the
> >     driver domain. Note that if the device is not handled by a
> >     driver domain the control domain will perform the removal of
> >     both the frontend and the backend paths.
>=20
> Hmm.  I see my Ack on that.  Nevertheless maybe it is wrong.
>=20
> Looking at it afresh, I think maybe the right answer is:
>=20
>  * If the driver domain is expected to be working properly, the
>    toolstack should wait for the driver domain to complete the device
>    shutdown, before removing the backend node.  Indeed, the toolstack
>    ought to wait for this before actually destroying the guest in Xen,
>    by the usual logic for clean domain shutdown.

I think that's not enough. .../state =3D 6 is set by the kernel, but
xl devd in the driver domain may want to cleanup things (hotplug scripts
etc). And indeed libxl__device_destroy() is called from
device_hotplug_done(), not device_backend_callback().

Alternatively, toolstack could wait for the actual backend node to be
removed (by the driver domain), and then cleanup the parent directory (if
empty). I don't find it particularly appealing, as every contact with
libxl async code reduce overall happiness...

>  * There needs to be a way to deal with a broken/unresponsive driver
>    domain.  That will involve not waiting for the backend so must
>    involve simply deleting the backend from xenstore.

It's already there: if driver domain fails to set .../state =3D 6 within
a timeout, toolstack will forcibly remove the entry.

> Is the distinction here between "xl shutdown" and "xl destroy", on the
> actual guest domain, good enough ?  Hopefully if the driver domain
> sees the backend directory simply vanish it can destructively tear
> everything down ?

In the past this lead to multiple issues, where hotplug script didn't
know which device actually was removed. In some cases I needed to
workaround this by saving xenstore dump into a file in an "online"
hotplug script, but it is very ugly solution.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4TWlwACgkQ24/THMrX
1yxnQQf/Snbd9fsYuJXiKbg2HLp0RrYmaHxInij6Nav5XWSrbfETrkEH255AY772
MxSuZiOYAm5K6g33wu+tLL6S3bTyBnwdY1vnAF9l8p58NPra7GKogocqRRbi6TFD
/oEZz54ud5tHwceUNhIU0mQ+v+s8BiN8APYBPC/ZKrw+4r9QVhQSRqkuuB/lz54D
ONuuOCc6MIGjhro1ZSgdb0+HxosGJGNJOB6AgON0vHXPnAalidV2ljFqLVz3ug0V
CU2DCPy49y2nIq/wi0VqJc3u5+Mz/DjbqglYBEKY0JYRncsdbrfPUkL9Ib+lq9YQ
4kUsoJRkP9GKJZYuoymf3ESKxsmpvg==
=sucf
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--


--===============2334914328425272335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2334914328425272335==--

