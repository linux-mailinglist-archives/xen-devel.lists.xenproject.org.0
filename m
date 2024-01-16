Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45482EDEC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 12:40:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667709.1039228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPhmO-0005kT-5r; Tue, 16 Jan 2024 11:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667709.1039228; Tue, 16 Jan 2024 11:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPhmO-0005iu-2t; Tue, 16 Jan 2024 11:38:52 +0000
Received: by outflank-mailman (input) for mailman id 667709;
 Tue, 16 Jan 2024 11:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7at1=I2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rPhmL-0005il-Gh
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 11:38:49 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ced498c6-b463-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 12:38:47 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C4085C0116;
 Tue, 16 Jan 2024 06:38:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jan 2024 06:38:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jan 2024 06:38:44 -0500 (EST)
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
X-Inumbo-ID: ced498c6-b463-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705405125;
	 x=1705491525; bh=2yY2Tr8GxZ+QrXBWIju3oEgr92Ynbhk54Bf5jwPCn/E=; b=
	WSH/sEbp/IueFwiWTWP0L4YEPWqHKXpynFsTGvzOuzAJHOBRoKAGo6/Fv8EnNQra
	ygg5IPEK6/b32mV5kGOU+vyjlQfVH6Qmw3hRsff79TrlrFqgdBRWES3015lSxD0q
	TtLvm3Du6GnkAmzpNAkJBGmwoeoIHcJkrCmFgQGWyvnbB1Ed/YvJV8tAaGkgohN4
	CLMxxPthzcgBwWvHaRCY0BIJUF40WWjUBtSLxPAbyBV4BoSzLBk5+FDn7lGSEq6l
	4hwhkUbq4hNzsk2vbLC1pTxyvWINu+dIa4FCeqh4xJOyRhO3y13dkYZWXXINEo1a
	BYHD+S3vrkfxBu8+NB5+xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705405125; x=1705491525; bh=2yY2Tr8GxZ+QrXBWIju3oEgr92Yn
	bhk54Bf5jwPCn/E=; b=VVXpNqInFdbDhGoAPUFILNMxzqqYfc173q5Z8reLoc8i
	cQpHx/LF8lqKKeSWVpRyf7oTxquIm7CGab3G7So6ktfV+hyBgtGLAov0ZmgskOXY
	nFPH/GXOYdBr15pmybU1AY4UwKB8xWEXH1Z62KRvwCi2IfbCWFXoxj+20Hz14+A9
	GBTSZ1MFatYkQUNHo2hsDWrrxMbCq5GV5m7dgL0iyRGYWA881jiKRu3iwY5n98bY
	p6kJ6f4jjFw+cKmLO7AnHWQmyege+SjUMNMgbPcNwsjgTCS2dERYdWkLAgtPw1IP
	zRsnDdQ99IJ12p46s146UzWbshJTAXqP77zn4phZSA==
X-ME-Sender: <xms:xWqmZc2kCLCJmAohFDN7jRZPRAQSpqQ4GuR-w97be5mRQtJNozvRow>
    <xme:xWqmZXF1sLLaxbFeVUszSC9ASoBxnW6_8T-CZ8NhCHwwIqrpsMJPczxj1H-k9NCzx
    vd5vurJZOr4Gw>
X-ME-Received: <xmr:xWqmZU7fMdjeGdWzS9h3GXJAC39uw6dyykU78PBco4NeUkRZsn_b8M6lP6PFO3IwyFJxXziGMkEn7MANAEbxOQ8oUSq374eDlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejfedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdet
    vdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xWqmZV2Up6D0HF5yf7d3TKUKb8tBkX-kobeNsFt9Z4KVJtozFW1yqw>
    <xmx:xWqmZfF9pZ5kv3SXo7hRU0Hzy_KHMGbpknJKrLJ82pNkW2phz-oB8A>
    <xmx:xWqmZe_Br9R-gGQBrBkUU6OaRQvOblenBh5YXaH0x_85mHKPyk8m2A>
    <xmx:xWqmZWyFyTk0USPsG1ep0kC2UI_70QM39RuCcZWtKePWk2EEjcj42w>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 16 Jan 2024 12:38:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Thunderbolt (and other PCI hotplug) isolation
Message-ID: <ZaZqwkAXuKtvzPBM@mail-itl>
References: <ZaXoCXNhYSnhLyOe@mail-itl>
 <cafae481-d193-433f-bffb-5e80a9dd7646@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jPC/jKSKfW+dEf8J"
Content-Disposition: inline
In-Reply-To: <cafae481-d193-433f-bffb-5e80a9dd7646@suse.com>


--jPC/jKSKfW+dEf8J
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jan 2024 12:38:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Thunderbolt (and other PCI hotplug) isolation

On Tue, Jan 16, 2024 at 10:58:05AM +0100, Jan Beulich wrote:
> On 16.01.2024 03:20, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > A little background:
> > In Qubes OS we try to isolate external (especially hot pluggable)
> > devices as much as possible. For PCI devices, we do PCI passthrough to
> > dedicated domains (sys-net, sys-usb - mostly the latter). The goal is to
> > prevent unauthorized device to compromise the whole system, especially
> > using DMA (either initiated by a malicious device itself, or by a
> > compromised driver). For the discussion here, lets ignore what happens
> > before Xen starts.
> >=20
> > The matter becomes much more complicated for hot plugged devices. I did
> > some test recently, enabled PCI hoplug in dom0 kernel (we have it
> > disabled by default), and this is what I got:
> > 1. Hot plugged devices were properly detected, and dom0 told Xen about
> > them. In my case, it was two PCI bridges and an NVMe disk.
> > 2. New devices were assigned to dom0 automatically.
> > 3. New leaf device (the disk) can be assigned to a HVM domU and seems t=
o work.
> > 4. The bridges cannot be assigned to a domU.
> >=20
> > Now, there are (at least) two problems with the above:
> > i) The second point above: new device automatically gain ability to DMA=
 (at
> > least) into dom0 memory. I guess this should be easy-ish solvable for
> > leaf devices by assigning them to a quarantine domain by default. There
> > is an issue how to decide what devices to handle this way (for example,
> > what about external devices present during Xen/dom0 startup already),
> > but it feels like a problem solvable with some configuration. And of
> > course dom0 will need to be adjusted to not talk to such devices
> > automatically (via drivers blacklisting or similar approach). But for
> > the bridge devices, it's more complicated, basically the second point
> > below.
> >=20
> > ii) The fourth point above: an external PCI device remains in dom0
> > (including being able to dom0 into dom0's memory) just because it happen
> > to have some specific bits in its config space set. When considering
> > malicious device, it doesn't even need to function as a bridge - it's
> > just enough to present itself as a bridge, wait for dom0's thunderbolt
> > driver to authorize the device so it gets assigned dom0's IOMMU context,
> > and boom. On the other hand, a bridge has privileged function by
> > design, for example IIUC takes part in discovering devices behind it
> > (which then needs to be properly registered in Xen, assigned IOMMU
> > context etc).
>=20
> I may not be following the underlying concept here: If you consider a
> device potentially malicious, why would you even connect it to your
> system?=20

The thing is I don't know whether I can trust the device or not. It may
be a device I got from somebody, but also it may be a benign but buggy
device that later got its firmware compromised. Take the example of an
external nvme disk - I got some data on it to process, and the data
processing itself can easily be isolated in a separate domU (so, I don't
need to assume too much trust in that data), but also I'd like to not
assume trust in the disk itself.

Besides that, there is also an attack where somebody plugs in a device
without my knowledge (when working in open space, some conference, etc).
I'd like to avoid situation where screenlocker can be very quickly bypassed
with a "screen unlock via DMA" thunderbolt device.

> And if you mean Dom0 to not drive devices, why would you even
> build the respective drivers for such a Dom0 kernel?

I could exclude a lot of drivers indeed, but there are practical issues
with that: for example I do want to use the _internal_ nvme disk in
dom0.

> > iii) Untested, but it feels like there is a lot of room for various race
> > conditions in the hot plug handling. For example, device must be
> > allowed any DMA only after its IOMMU context is properly configured.
>=20
> Isn't that the case already? Any attempt to DMA without respective
> device / context table entry (AMD / Intel terminology) ought to result
> in IOMMU faults.

Ok, so in theory it should be matter of "just" assigning device to
appropriate domain directly, instead of assigning to dom0 first and only
later re-assigning.

> > I
> > believe thunderbolt technically allows that (plain PCIe hotplug most
> > likely not), but my guess is it's not the case currently.
> >=20
> > My question is mostly: what can be done about the "ii" problem above?
> >=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jPC/jKSKfW+dEf8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWmasIACgkQ24/THMrX
1yyF9wf/VKiCe7C3BQ7Ys20xDIqVtpmYnjMhO6q88AEuP1/5AuLiWOS/1wiT4R13
qExz13xSnc8VJ7pRLVQMt3psDRzd80i9KsVVRbInu9HM85T3OSCDPcZA8zIoF/41
Bw08b93iXdZMfv2/od472aYAeO5Ruf8yczuP3I7RxHOz3ik05VG1E1qsrQ5sZAkc
o9RRzLEh7FFXvHIBs1NB7itLl0V357QarxNISyA6FAWPJfWsgRcTkeRpn+aqDh1G
howw+cs94yakCyhyt2pUIabBEJWThJaqXt8fVL5E0fRgWc/mEclhyqV14EEy4qgm
04a8jq08h7LkN8V3iYWtJ1gm9rO60Q==
=R1TA
-----END PGP SIGNATURE-----

--jPC/jKSKfW+dEf8J--

