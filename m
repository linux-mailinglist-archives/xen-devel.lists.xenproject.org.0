Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91913C28989
	for <lists+xen-devel@lfdr.de>; Sun, 02 Nov 2025 04:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155126.1484691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFOdF-0006Hr-RE; Sun, 02 Nov 2025 03:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155126.1484691; Sun, 02 Nov 2025 03:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFOdF-0006Eo-K8; Sun, 02 Nov 2025 03:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1155126;
 Sun, 02 Nov 2025 03:19:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVbI=5K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vFOdE-0006Ei-5p
 for xen-devel@lists.xenproject.org; Sun, 02 Nov 2025 03:19:52 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6d0a2ef-b79a-11f0-980a-7dc792cee155;
 Sun, 02 Nov 2025 04:19:47 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3466A1400104;
 Sat,  1 Nov 2025 23:19:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sat, 01 Nov 2025 23:19:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Nov 2025 23:19:42 -0400 (EDT)
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
X-Inumbo-ID: c6d0a2ef-b79a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762053583;
	 x=1762139983; bh=A+EkEb1wiboY7+NJehqBDZfNXXlF566BN0a8KAWG6FI=; b=
	VifEd5TzPxmVrugG+te86GelpvifqxEaOrN1bd1awlB5RfaD2EK6CjNXAIM0Z6xY
	u0RjkYzoWzzDsPdh13UdhwJleyPN6PN5DslA1emVEkECUUevjIjbYXZv7/aP9TYG
	1jru4f2n1YaO3Tg0larHbSOYqfwiRCIAwzT2QNuZs0GOEiE4eAmPaHcIKSkIpv9C
	uzkD2+B/Dc7fJqB1w2qteB/pINWRb3mJQ6CBXh1b70AIALWfOml/Igx24/u+QFnl
	CG/CJ+ns4H/lEV6dDDgl7DuQRmULqw79RlxSCNE10WBHh/uS2xSUIVH+jOZvsHGl
	RikOzd5ZTB+spsxOClzXDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762053583; x=1762139983; bh=A+EkEb1wiboY7+NJehqBDZfNXXlF566BN0a
	8KAWG6FI=; b=JTbQx6JAI36N+zRUY0msrgjJ2H176ESvByuK2gVf2MdzudCcjic
	lQPN8jNTlm5/aO72z+5C2bIV8GLob8tjzSz0IjDoKqmRZKvZeUbeOfHscNG1n0/h
	QrtbY0a4bW5QcyC44Y7pQTxmBTQ8C1Ka0/aVdROU8WlIxlcAeoGG6fZo2bREVLPX
	LwcyY1JrREdW3B5sXs0JX/Wuw4ILbLsqDbP/pcMNIh3O2ounmqAlUkM/nCgMZyVA
	r50lA5OUhBy/HxeLmya9NCxLdwUrdP4fqTcLaIfd58kBfIrrGbipmNNTLbacVZAw
	qHwYhXfOWCYjxP1UEG+ZNwKyGsTXMoHuliw==
X-ME-Sender: <xms:zs0GaeombaMWwQwXjm3j74iVW5P8DH4UPs6uT3Qnx5-oZ4-LteRyIQ>
    <xme:zs0GaSptu0p7t2ftQdwTfw9UaBhpPk2NOspeiEnqOH9Ju0c8diYAXlFqDx13kAfMr
    _1vRSk-2Bx_ObpWzAKB--xCfc385S873IuXXAgXFbVRIdx2qA>
X-ME-Received: <xmr:zs0GaQ0t4ngSI-mkq5uW3aZF_fKW8_xHwBxMcgIlVdx-D20A_Bs1o96UM1bipE_KwvIkpWTcPaS--vL075IDsbOWJX6JF_OoLk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeegudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeev
    tedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:zs0GaZAlnaIodNgQ1ZlFpXxjGfDpgt5MdQMHw6qL54zzy-MwJzpIiQ>
    <xmx:zs0GaQfcLte0R6zRoEQOZLy59VL7iZ7lVFlfIdvZ2LZfpIhQWEXwXg>
    <xmx:zs0GaWjkrT6v8t3hPSqrE6FADPrOybLgZC_C4KJzgjxAuE5Q9Gl7mA>
    <xmx:zs0GaQpjtIZUP6Lf9Z8M61W-34x40mhJszk3p6ZtBuT5RH4lx9Xduw>
    <xmx:z80GaVYwg7UYLxa3uEoeT7x-pmcgSxlcz0Jo8S6CBxHLwgxEtdujVjRS>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 2 Nov 2025 04:19:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: race condition when re-connecting vif after backend died
Message-ID: <aQbNzNhwsPWGOb5p@mail-itl>
References: <aOZJhD6_F_ceHoCb@mail-itl>
 <66d8febb-568b-40db-bbe3-d8dfdc43444c@suse.com>
 <aOZvivyZ9YhVWDLN@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Byp0VLSoGkXrFTwA"
Content-Disposition: inline
In-Reply-To: <aOZvivyZ9YhVWDLN@mail-itl>


--Byp0VLSoGkXrFTwA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 2 Nov 2025 04:19:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: race condition when re-connecting vif after backend died

On Wed, Oct 08, 2025 at 04:04:58PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Oct 08, 2025 at 02:32:02PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > On 08.10.25 13:22, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > I have the following scenario:
> > > 1. Start backend domain (call it netvm1)
> > > 2. Start frontend domain (call it vm1), with
> > > vif=3D['backend=3Dnetvm2,mac=3D00:16:3e:5e:6c:00,script=3Dvif-route-q=
ubes,ip=3D10.138.17.244']
> > > 3. Pause vm1 (not strictly required, but makes reproducing much easie=
r)
> > > 5. Crash/shutdown/destroy netvm1
> > > 4. Start another backend domain (call it netvm2)
> > > 5. In quick succession:
> > >     5.1. unpause vm1
> > >     5.2. detach (or actually cleanup) vif from vm1 (connected to now =
dead
> > >          netvm1)
> > >     5.3. attach similar vif with backend=3Dnetvm2
>=20
> The way it's above, it tricky to reproduce (1/20 or even less often).
> But if I move unpause after 5.3, then it's happening reliably. I hope
> it's not too different scenario...
>=20
> > > Sometimes it ends up with eth0 being present in vm1, but its xenstore
> > > state key is still XenbusStateInitializing. And the backend state is =
at
> > > XenbusStateInitWait.
> > > In step 5.2, normally libxl waits for the backend to transition to st=
ate
> > > XenbusStateClosed, and IIUC backend waits for the frontend to do the
> > > same too. But when the backend is gone, libxl seems to simply removes
> > > frontend xenstore entries without any coordination with the frontend
> > > domain itself.
> > > What I suspect happens is that xenstore events generated at 5.2 are
> > > getting handled by the frontend's kernel only after 5.3.  At this sta=
ge,
> > > frontend sees device that was is XenbusStateConnected transitioning to
> > > XenbusStateInitializing (not really expected by the frontend to someb=
ody
> > > else change its state key) and (I guess) doesn't notice device vanish=
ed
> > > for a moment (xenbus_dev_changed() doesn't hit the !exists path). I
> > > haven't verified it, but I guess it also doesn't notice backend path
> > > change, so it's still watching the old one (gone at this point).
> > >=20
> > > If my diagnosis is correct, what should be the solution here? Add
> > > handling for XenbusStateUnknown in xen-netfrontc.c:netback_changed()?=
 If
> > > so, it should probably carefully cleanup the old device while not
> > > touching xenstore entries (which belong to the new instance already) =
and
> > > then re-initialize the device (xennet_connect()? call).
> > > Or maybe it should be done in generic way in xenbus_probe.c, in
> > > xenbus_dev_changed()? Not sure how exactly - maybe by checking if
> > > backend path (or just backend-id?) changed? And then call both
> > > device_unregister() (again, being careful to not change xenstore,
> > > especially not set XenbusStateClosed) and then xenbus_probe_node()?
> > >=20
> >=20
> > I think we need to know what is going on here.
> >=20
> > Can you repeat the test with Xenstore tracing enabled? Just do:
> >=20
> > xenstore-control logfile /tmp/xs-trace
> >=20
> > before point 3. in your list above and then perform steps 3. - 5.3. and
> > then send the logfile. Please make sure not to have any additional acti=
ons
> > causing Xenstore traffic in between, as this would make it much harder =
to
> > analyze the log.
>=20
> I can't completely avoid other xenstore activity, but I tried to reduce
> it as much as possible...
>=20
> I'm attaching reproduction script, its output, and xenstore traces. Note
> I split xenstore trace into two parts, hopefully making it easier to
> analyze.

Ok, I think I managed to fix it. There were two cases: frontend
overriding state key of already re-connected device, and frontend
re-creating state key of device forcefully removed by the toolstack.
I'll post the patch in a moment.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Byp0VLSoGkXrFTwA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkGzcwACgkQ24/THMrX
1yw/NwgAgc3209xCXQ0HJA5C/YP33lGbiBEf2khalvMawSqjcGYKYX5kkZe+K/5j
EKb3InOCu4L1n44AoREdOL3EFWHYj75mQrKIpK2Rnr0PEL69TN8hC90sL4bEFCTa
EDsrDK/2qdxH9WXfrhWIOnVKxmfsA/ovlkUPn8M9w1A8m9tXgFKxAi285bPLQqxU
g8qWv4eeRLxqdeuUAQuNpXYKUq/bdobGVdv11n+/N+w+Vb7lLYSLS+LXWfQ+q1cD
cvjz8ygRWWyJDer+kGHI+qboxawTeYopd3QVUkzTZb9Ej0vCfQ2aI2MAAa+946RH
QuptzXo+KDXSfwWtQRFBCbL0Z/RuEQ==
=/5qI
-----END PGP SIGNATURE-----

--Byp0VLSoGkXrFTwA--

