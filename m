Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F6D0CE2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:35:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9GH-0002bZ-JY; Wed, 09 Oct 2019 10:32:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iI9GG-0002bU-2Y
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:32:04 +0000
X-Inumbo-ID: 07fa1380-ea80-11e9-97e6-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07fa1380-ea80-11e9-97e6-12813bfff9fa;
 Wed, 09 Oct 2019 10:32:02 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7812D4E1;
 Wed,  9 Oct 2019 06:32:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 06:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7Wb90S
 wxKhHP8TlDIALRP81zILsAhi2s8uzq5Ah2r4w=; b=dpbFQ8FGuvuR0y6RXyw4IT
 5wDqUEca2DIvSfu02VGm3XU4N+feyVqzfTzNQ+Gs+cuQoZKYXfG1vAVDQ1jVF2Rc
 sIv7vguQSm9tlucR1oLps5344X6h5aZYo0Zj518C+8lEiqk3gAhtDeL2U1obfp3U
 PBc2E58pDEwvB/I5curnyuh+WBDXtBiyR/fIUnCav85/YR3sJFRhuj3dwviX8tPP
 xpVP7CQQxsuZEn4id6dcb4w3mtPOdp8FEjaXQr1pzUTuEEhCKyGT0CcrKpc5QMms
 /Sun+/xpBV+uv6fRJgZdMOHKb9llS1PcoO/cdM4NOmBHnjVKhyh0fObhEsw1XeWg
 ==
X-ME-Sender: <xms:ILedXedHIqwtmugZIxsl3CI4cUkbEqcITroKllj8lWSRM4rBKFNr9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeekrddugeejrdduudef
 rddvfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ILedXdPES_hWuzj60QIZMWrWUTR85jfTX98lKXYAzYQNZRZ27-xLmw>
 <xmx:ILedXQYnCVNEx5a8vp5yU7VgJo3cttU9GOXgn8aoUW3K4PoKVeBWQw>
 <xmx:ILedXRtFO5Z-GCq5qaHNHe8Gv7rn-1tWxfWx7ktJncSud2X3FXB80g>
 <xmx:IbedXRc9n50faCWRt6kbkNxYVERDyzcdCQtRN7WgX9zf_5k99SiqjQ>
Received: from mail-itl (188.147.113.233.nat.umts.dynamic.t-mobile.pl
 [188.147.113.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3734280062;
 Wed,  9 Oct 2019 06:31:59 -0400 (EDT)
Date: Wed, 9 Oct 2019 12:31:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009103153.GO8065@mail-itl>
References: <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
MIME-Version: 1.0
In-Reply-To: <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3338122189340154543=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3338122189340154543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3OSb9WzKdbgbGDbF"
Content-Disposition: inline


--3OSb9WzKdbgbGDbF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 10:56:56AM +0200, Jan Beulich wrote:
> On 08.10.2019 18:29, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Tue, Oct 08, 2019 at 04:19:13PM +0200, Jan Beulich wrote:
> >> On 08.10.2019 15:52, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> Regardless of SetVirtualAddressMap() discussion, I propose to
> >>> automatically map boot services code/data, to make Xen work on more
> >>> machines (even if _we_ consider those buggy).=20
> >>
> >> I remain on my prior position: Adding command line triggerable
> >> workarounds for such cases is fine. Defaulting to assume buggy
> >> firmware is acceptable only if this means no extra penalty to
> >> systems with conforming firmware. Hence, for the case at hand,
> >> I object to doing this automatically; we already have the
> >> /mapbs workaround in place to deal with the case when xen.efi
> >> is used. Judging from the title here there may need to be an
> >> addition to also allow triggering this from the MB2 boot path.
> >=20
> > What about mirroring Linux behavior? I.e. mapping those regions for the
> > SetVirtualAddressMap() time (when enabled) and unmapping after - unless
> > tagged with EFI_MEMORY_RUNTIME?=20
> > Similarly to Andrew, I'd really prefer for Xen to work out of the box,
> > with as little as possible manual tweaks needed.
>=20
> If there's going to be a config where SetVirtualAddressMap() is to
> be called - why not? But the same logic doesn't make sense when
> such a call won#t happen in the first place.

See my other email, I think I've found a better (simple and working!)
solution.

> >>> What if Xen was kexec'ed from Linux?
>=20
> Honestly - I'm getting tired. You said yourself ...
>=20
> >>> In Linux case, it looks like it passes around the EFI memory map using
> >>> some Linux-specific mechanism, but I don't find it particularly
> >>> appealing option.
>=20
> ... that this would require Xen following a Linux protocol.
> This is nothing that can work building on EFI interfaces alone.

Actually, there is something that could be used: presence of boot
services. If the call to SetVirtualAddressMap() is bound to initial
presence of boot services, then it surely won't happen after kexec, as
boot services are not available anymore. In fact the patch I've sent
does exactly that - call SetVirtualAddressMap() directly after
ExitBootServices(), but I've realized this property only now. In this
case, maybe kconfig option is not needed anymore?

BTW How runtime services work after kexec? I don't see EFI handles
handed over kexec, are they somehow re-discovered?

> >>> What about something in between: make this SetVirtualAddressMap() call
> >>> compile-time option (kconfig), depending on !CONFIG_KEXEC ? And when
> >>> enabled, properly handle SetVirtualAddressMap() failure.
> >>
> >> What is "proper handling" here?
> >=20
> > Logging the error and either panic or disabling runtime services (I tend
> > to the latter).
>=20
> Hmm, yes, disabling runtime services in this case makes sense.
> But are you sure a SetVirtualAddressMap() failure doesn't incur
> other potential issues later on? (Calling panic() is what I'd
> rather not call "proper handling", but rather "emergency
> handling".)

Well, as for being sure, one could say calling ExitBootServices() but
not SetVirtualAddressMap() definitely won't cause any troubles. I can't
say anything about UEFI for sure. But UEFI spec doesn't mention any side
effect of a failed call.

BTW Linux panic on failed SetVirtualAddressMap(). But on kexec, if
didn't received address map for EFI RS calls, it simply disable RS.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3OSb9WzKdbgbGDbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2dtxkACgkQ24/THMrX
1yxekwf+OWjGgxibs2lGGHUi9Ns9WWyxeo8vr668ZfTD1W9U3G24CstmQeLULCe5
GzZbU/+tOzUr664U2DtY09PzL3Cfa28L5YQFTVR1C2cjIM51EnQx4JKDcEWaCf7k
fY+xfJEeQvEsR5LkYHKZcT6XVQ8MJ3ok7YO9SbfDYU6pHoL4R+GViXGpRnAMrpAS
D2PMAzorHmnWNWKuZ2k7o4ma+zvneKSxb6m6le47B5gpr2Wv547gSB33oQwDpfV/
MlWDPqYn6qej5QpuiaCUnPsnqhb/bg5SrsvfAWCCuYrKb18D0NbreztyFKzF/MWc
tERC+k3rzDO67umkexWruu1D/ST8WA==
=8e7Q
-----END PGP SIGNATURE-----

--3OSb9WzKdbgbGDbF--


--===============3338122189340154543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3338122189340154543==--

