Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB782E7E7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 03:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667622.1039085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPZ4k-0002Nq-Dd; Tue, 16 Jan 2024 02:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667622.1039085; Tue, 16 Jan 2024 02:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPZ4k-0002L1-AO; Tue, 16 Jan 2024 02:21:14 +0000
Received: by outflank-mailman (input) for mailman id 667622;
 Tue, 16 Jan 2024 02:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7at1=I2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rPZ4h-0002Kv-MZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 02:21:12 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6538606-b415-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 03:21:07 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3B7E63200AE8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 21:21:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 15 Jan 2024 21:21:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 21:21:01 -0500 (EST)
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
X-Inumbo-ID: e6538606-b415-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1705371662; x=1705458062; bh=hS0UojFRdh
	zBlNJfcpyO9rDBLkhBtNBQSaj5BRPJAUA=; b=JnyaKQD+NlFrEv1IMtMPFvzce9
	TooW77e4eBmGqZubiE3AhEasgOufrLN9XuMyCUGQPmrxSFwHB9/WO1LOJDGyt4Yk
	GwQ0PWVQT7iKhyIfKtLQQdFqguT2z1LTZnpalzbLWz2JvWg8tC0nYcUW/NAsBBLZ
	AhjHWLg8zOQ19jT+9Mh41/WtXkQrWoG5MeQHGKwavtQP8qrC87U+5WzSZ7uYzsJx
	QozvG395HQ8aCUqh/KOihCehAJ8SDF9F+pRDljRclmjocX15XbFosk2dUvdhKbKp
	Bbc9XrXDwS82OWqjj83MQmBKqhr2nZ6sp6ArVP1uyKccBxz2q2CdeXJOOYTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1705371662; x=1705458062; bh=hS0UojFRdhzBlNJfcpyO9rDBLkhBtNBQSaj
	5BRPJAUA=; b=kQLCbKFdRQU1o3IgFcvBWeSKk32Lt30huN1YLtkOwi43x9ykxDE
	40c84wRuPvDfFJJgCR3T+IRB8896VUL0b8U2FNxB2zas+96yx/rxgIbwioqT2Giy
	w+nBkfUyahEUGNUTlxM/oh8iGt8QxuKsNw82SgCzzLphqSnupPkOi11co5OecrLQ
	ulGy4z2SftVdx8eGxTwWOjZnUzrEvodRN24ECGs6nFxsyKdkkvq7vgJy7KALl3rT
	YriNhiS5aa/VREscC9vqWUifEf6v9LS0QZ2Q63PW0B2HcS+5SLnCkpE2/5mzf1je
	EAuEn+WpbwoNTCftuA9i0EmomNqtxnQOyhA==
X-ME-Sender: <xms:DuilZVuD03qECbo1otNupUpahyDsq6ODvhwLiDKowwkIFHFINO7tBg>
    <xme:DuilZefL7J0Ye0Yklf2vFMF7XG-Io-pSrNAqg-HN2Z3FNlExrar5QfE5kR4-4uTvl
    5Edy3tVuDl5AA>
X-ME-Received: <xmr:DuilZYyzWD-ksZVBWkC8pGXkHRuj9kkDkHIiqnm5ME57uAun9R3OPLBn6QTN-uF95AOrsXsNcaDTnuv40Q3cSTa1ZLR0iSOTLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejvddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtroertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekhfefjedvvdfffeffgeeitdevhefhfeetteetffeigfei
    keelteeuffetjeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:DuilZcOmB9wXFypfRbjx7rTfQe-WNszhg6B8Mn6koYBueRYSYPEp9g>
    <xmx:DuilZV_3HKE9wJ44TX3kaMwXJ_ZzbAPoSEBDb2V2CwAOBmxJmBPc7g>
    <xmx:DuilZcVJD46-_1kipHwpmz5zJsSv5roCkgWS8_AucZRANCkHuyv-7w>
    <xmx:DuilZYLeUEEvr-0IuTTUBYyAMOGMp-SWdtjnKWhmPw0pxflb5t4DIA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jan 2024 03:20:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Thunderbolt (and other PCI hotplug) isolation
Message-ID: <ZaXoCXNhYSnhLyOe@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AEoi9AZsi/4cq/II"
Content-Disposition: inline


--AEoi9AZsi/4cq/II
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jan 2024 03:20:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Thunderbolt (and other PCI hotplug) isolation

Hi,

A little background:
In Qubes OS we try to isolate external (especially hot pluggable)
devices as much as possible. For PCI devices, we do PCI passthrough to
dedicated domains (sys-net, sys-usb - mostly the latter). The goal is to
prevent unauthorized device to compromise the whole system, especially
using DMA (either initiated by a malicious device itself, or by a
compromised driver). For the discussion here, lets ignore what happens
before Xen starts.

The matter becomes much more complicated for hot plugged devices. I did
some test recently, enabled PCI hoplug in dom0 kernel (we have it
disabled by default), and this is what I got:
1. Hot plugged devices were properly detected, and dom0 told Xen about
them. In my case, it was two PCI bridges and an NVMe disk.
2. New devices were assigned to dom0 automatically.
3. New leaf device (the disk) can be assigned to a HVM domU and seems to wo=
rk.
4. The bridges cannot be assigned to a domU.

Now, there are (at least) two problems with the above:
i) The second point above: new device automatically gain ability to DMA (at
least) into dom0 memory. I guess this should be easy-ish solvable for
leaf devices by assigning them to a quarantine domain by default. There
is an issue how to decide what devices to handle this way (for example,
what about external devices present during Xen/dom0 startup already),
but it feels like a problem solvable with some configuration. And of
course dom0 will need to be adjusted to not talk to such devices
automatically (via drivers blacklisting or similar approach). But for
the bridge devices, it's more complicated, basically the second point
below.

ii) The fourth point above: an external PCI device remains in dom0
(including being able to dom0 into dom0's memory) just because it happen
to have some specific bits in its config space set. When considering
malicious device, it doesn't even need to function as a bridge - it's
just enough to present itself as a bridge, wait for dom0's thunderbolt
driver to authorize the device so it gets assigned dom0's IOMMU context,
and boom. On the other hand, a bridge has privileged function by
design, for example IIUC takes part in discovering devices behind it
(which then needs to be properly registered in Xen, assigned IOMMU
context etc).

iii) Untested, but it feels like there is a lot of room for various race
conditions in the hot plug handling. For example, device must be
allowed any DMA only after its IOMMU context is properly configured. I
believe thunderbolt technically allows that (plain PCIe hotplug most
likely not), but my guess is it's not the case currently.

My question is mostly: what can be done about the "ii" problem above?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AEoi9AZsi/4cq/II
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWl6AkACgkQ24/THMrX
1yzaRQf9Gb5nn/liUB+T5nYU/4GN2pIFyBrooeAQ2OwDJUFvS9gpw/3L+jHBWMJO
UsegKxes8mz+9gdJtgVmJ2DOAEMsMsGVbc0s8z8GlMW4w5DQBODYoQ2oebF/o+V7
slBqbHKXJeBXtdKYIdqeHXXyE6mHh7q7nOEdFQWfrqQuNp3sF9LWaNCPlXfJss4t
1QdOXCbW6cyD0GnjpEmhqthv5AyVU69dgvS4eP1leL7Kz3Q17PEavy+FIeJiH2h2
5u8xLZBrullUV3TiG8KWQIeprHu6/aEyGCO7pQAlp1WB6L6V9LkvII/OMC7CGSNg
6K69rCZouA8otttIMbtZaHKvIgsBeA==
=XOdg
-----END PGP SIGNATURE-----

--AEoi9AZsi/4cq/II--

