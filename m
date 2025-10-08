Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE36BC4899
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 13:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139508.1474824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SFw-000433-95; Wed, 08 Oct 2025 11:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139508.1474824; Wed, 08 Oct 2025 11:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6SFw-000404-5j; Wed, 08 Oct 2025 11:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1139508;
 Wed, 08 Oct 2025 11:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDDy=4R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v6SFu-0003zw-DQ
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 11:22:50 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e352a5d-a439-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 13:22:48 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 10E951D000F0;
 Wed,  8 Oct 2025 07:22:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 08 Oct 2025 07:22:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Oct 2025 07:22:45 -0400 (EDT)
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
X-Inumbo-ID: 1e352a5d-a439-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1759922566; x=1760008966; bh=/c
	u2AmkFqeE42OtFNStfcQiDZvkP/s9/PGI1GxMLXv4=; b=UBteTneGYywlWzGKM0
	bTuTurvb+iPtY1ZK0RPYL1pdQ7hfLrHc1OCUnBzKU471zT3IW0oxM6RNNVgzTF4o
	CCLoCeFTj/O1nMQH4YGI47phYipi5JA2XMZ6vr7yjDPJwNJrlxiYXpMnT9o4jGup
	CKttjNUolWvfvmEs0hScbH6mWRDCNG2WcoXOA2W5IyGB1nD9c7Il3DJIAD0JHHYl
	mM+HyX8UPfpvC76cQDjX+t+gK63pQJm+d0OlnNfmCpOgQ3dqCY35EP0ZqJ+Q9gkE
	AtumDwAhB7Lxe5jDwPzGkWAxBOAlprbXMMnfMQivIrX+DyEKi5FZcdoRiybYf4qk
	NhgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759922566; x=
	1760008966; bh=/cu2AmkFqeE42OtFNStfcQiDZvkP/s9/PGI1GxMLXv4=; b=C
	MwJELz/W3UOea2xH8d+TO/rGo/kbgJ5vwZRGKYWgk1hyDmN+oIIycHb544hHL2pE
	GkzQ/mr2KEqGI6Q63mM9hqDSMsgAMnEZjmIvAvGJEL5MIms6f+EwQlItNzALUYum
	sHWP5U/OYBJLm64Fq84Hll1rq5MzfY5c/nYZDVqhcH01wMIVlce5CB2B1Ra/HLaN
	e/tFP4pQonrGQ4wD2pRTEGHK1MjsdH85XFseMJWXr8tP+Xox9RYYcRRjME/MrVSr
	+AE4L/pLsNsUbq4rIiQBiBQ/KYxwreanTeZTtf1igmUsIsvBXns1gb6RnDkjN4Ud
	yR1+TCDFnHAMp9bIP977g==
X-ME-Sender: <xms:hknmaEi69fr4KYEYt1U_n_DxckV7fveo-Y9arPvDdj2v_BAogaaiwg>
    <xme:hknmaDCg8KKWNfgDei-9zXLhI_gxwiYIencAEOe2B4kWhy-9Wibi7ML97GogjBZ2P
    n2oeXjrMcUJ4p6i7edv-8Q1YtFEulwVMXyhvSBh7Ean3Lpm>
X-ME-Received: <xmr:hknmaJtK6BCRMoPkSOxZ6kHa_2LBLBAs9HmY2Vp0DBCLLlz-tzLHgIIQosgsrw_Q_qYZ62C5YY7G6HH8LRPFZWcr1lvxPZwvf50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdefudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfggfeileeu
    ueektdfhffelvdfhjeeffeehueeikefhleduleejjeelgeejudffnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:hknmaAZPrT4JF3lbIQgmm1WAErF-MVb4MNGpRqUvbvqYbZrFv8whsA>
    <xmx:hknmaEWHGFxnGk1vaV_dN1Nr1ZPa8r54C0Wdy8oObHKCCgofP1IdeA>
    <xmx:hknmaM6BLWctt7lP7nIGNGR48VrXU1ELD5O7hkm6OCuTM2DVb-mrNQ>
    <xmx:hknmaHgLfPqhEpZPnihm8NuKz9mgPa_mBVbtYWY9f90KcnRfkc-irg>
    <xmx:hknmaITnfzgi0vUXRicFWrSR-a8u7R7lwJbk0dqo075p_TvL5Mgv3Oah>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 8 Oct 2025 13:22:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Subject: race condition when re-connecting vif after backend died
Message-ID: <aOZJhD6_F_ceHoCb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I/3cDkDYYNNpIlvP"
Content-Disposition: inline


--I/3cDkDYYNNpIlvP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Oct 2025 13:22:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Subject: race condition when re-connecting vif after backend died

Hi,

I have the following scenario:
1. Start backend domain (call it netvm1)
2. Start frontend domain (call it vm1), with
vif=3D['backend=3Dnetvm2,mac=3D00:16:3e:5e:6c:00,script=3Dvif-route-qubes,i=
p=3D10.138.17.244']
3. Pause vm1 (not strictly required, but makes reproducing much easier)
5. Crash/shutdown/destroy netvm1
4. Start another backend domain (call it netvm2)
5. In quick succession:
   5.1. unpause vm1
   5.2. detach (or actually cleanup) vif from vm1 (connected to now dead
        netvm1)
   5.3. attach similar vif with backend=3Dnetvm2

Sometimes it ends up with eth0 being present in vm1, but its xenstore
state key is still XenbusStateInitializing. And the backend state is at
XenbusStateInitWait.
In step 5.2, normally libxl waits for the backend to transition to state
XenbusStateClosed, and IIUC backend waits for the frontend to do the
same too. But when the backend is gone, libxl seems to simply removes
frontend xenstore entries without any coordination with the frontend
domain itself.
What I suspect happens is that xenstore events generated at 5.2 are
getting handled by the frontend's kernel only after 5.3.  At this stage,
frontend sees device that was is XenbusStateConnected transitioning to
XenbusStateInitializing (not really expected by the frontend to somebody
else change its state key) and (I guess) doesn't notice device vanished
for a moment (xenbus_dev_changed() doesn't hit the !exists path). I
haven't verified it, but I guess it also doesn't notice backend path
change, so it's still watching the old one (gone at this point).

If my diagnosis is correct, what should be the solution here? Add
handling for XenbusStateUnknown in xen-netfrontc.c:netback_changed()? If
so, it should probably carefully cleanup the old device while not
touching xenstore entries (which belong to the new instance already) and
then re-initialize the device (xennet_connect()? call).
Or maybe it should be done in generic way in xenbus_probe.c, in
xenbus_dev_changed()? Not sure how exactly - maybe by checking if
backend path (or just backend-id?) changed? And then call both
device_unregister() (again, being careful to not change xenstore,
especially not set XenbusStateClosed) and then xenbus_probe_node()?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I/3cDkDYYNNpIlvP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjmSYQACgkQ24/THMrX
1yywnQf+P9jmf46w20d371lWsS1Bm37HxcKEkjUMTV6YEZXjFH0vmK7DnrfXwQhT
Z9GwASlualC3SAq352wLsjRMxa6C8KRKtZOPZL2SRN9u5upzAuKKmtwsxCj4fN9/
GjxhMuCuzkzxI47fstBm1CrkT5Z94Le5JrddH7YQ2AdLSzKmL8Yuomw17pHf+sSk
vs3DWnluSUMmk/flfx+o2raV9zoNbULi9x/lI7MKTVtch4h9nhFZu5xUeClAE+pK
cDMBumM0+RMNyOV6fts9fuMMWkJc56jJLtk1RqFXsUu4Bh4YkmCJfB6PuAmV9T6H
7QGaftZEoxC7fripf5VZsfnwnvgQ/w==
=12ot
-----END PGP SIGNATURE-----

--I/3cDkDYYNNpIlvP--

