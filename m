Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A03FCFEF2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 18:32:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHsMe-0001f5-L8; Tue, 08 Oct 2019 16:29:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=93Dx=YB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iHsMc-0001f0-OJ
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 16:29:31 +0000
X-Inumbo-ID: cd0c2e4e-e9e8-11e9-97d6-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd0c2e4e-e9e8-11e9-97d6-12813bfff9fa;
 Tue, 08 Oct 2019 16:29:29 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EEA321EA7;
 Tue,  8 Oct 2019 12:29:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 12:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9zhadu
 3XT7lEKzFfYsTvuyffqAc9qZtyo2UtsQLgKts=; b=Nefz0iSkvoJ9G0JU2I3eeN
 o43lPMefjlyI8HRaIBq/zwAS584VlYhWgojqz5uDWwxWfXI2DY6a59hzvJLjqt/b
 J1y9mbpxvL8uGyW7e7OH/ixUna4c3T/BF0UWZoXcYo45YzhGTW0SZd18Wtmu0GRO
 pHdYkzLGOIbz5fmxb6fyrBv2mi1E5UG8/A8mv1ix+9pkTxNCV2lIT7B1GVMRp4kK
 IBXOTIKO2sUHLhHBK5rh+p+rRHyNAU1u7jc3+aBNAbet2gaANqNfWEY6BK0P2Ij6
 TKUHZacdfFye3U3DQWtaox6rNHWdx1cCjvnEDMbs0TAV3foQspHASv2wLRswwg4Q
 ==
X-ME-Sender: <xms:aLmcXYrJZ_PuL8ICHVZMf4pNgsnuchTy2nqq4ecx_LMmgCoAB6Ba3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:aLmcXR7U-I2Hk3EuIL1pRe9n0ZKBUw50LpKA_KPv9zioxid2SX6B9w>
 <xmx:aLmcXWrI93kpfQrSb-fMJy3i38wXB80kuEIHiee0tZ5p2gCDAzRvtw>
 <xmx:aLmcXbgMqaSmjeRFx4OFgZzoB1y6yJKOGTKIXaFuru2lFcmiDluxrA>
 <xmx:abmcXUHLgDLvgdVli2BxiaYS0TUFSweJMUCkC40HpcFpSLcdAa5hLQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1DC8CD6005D;
 Tue,  8 Oct 2019 12:29:28 -0400 (EDT)
Date: Tue, 8 Oct 2019 18:29:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008162922.GL8065@mail-itl>
References: <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
 <20190807160451.GB3257@mail-itl>
 <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
MIME-Version: 1.0
In-Reply-To: <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
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
Content-Type: multipart/mixed; boundary="===============1483168606756998424=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1483168606756998424==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iZ6mOkMR8xnvq2vL"
Content-Disposition: inline


--iZ6mOkMR8xnvq2vL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Tue, Oct 08, 2019 at 04:19:13PM +0200, Jan Beulich wrote:
> On 08.10.2019 15:52, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Tue, Oct 08, 2019 at 03:08:29PM +0200, Jan Beulich wrote:
> >> On 08.10.2019 13:50, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> I explored it a bit more and talked with a few people doing firmware
> >>> development and few conclusions:
> >>> 1. Not calling SetVirtualAddressMap(), while technically legal, is
> >>> pretty uncommon and not recommended if you want to avoid less tested
> >>> (aka buggy) UEFI code paths.
> >>> 2. Every UEFI call before SetVirtualAddressMap() call should be done
> >>> with flat physical memory. This include SetVirtualAddressMap() call
> >>> itself. Implicitly this means such calls can legally access memory ar=
eas
> >>> not marked with EFI_MEMORY_RUNTIME.
> >>
> >> I don't think this is quite right - whether non-runtime memory may
> >> be touched depends exclusively on ExitBootServices() (not) having
> >> got called (yet).
> >=20
> > That would be logical. In practice however we have evidences firmware
> > vendors have different opinion... A comment from Linux (already quoted
> > here 2 months ago):
> >=20
> >     /*
> >      * The UEFI specification makes it clear that the operating system =
is
> >      * free to do whatever it wants with boot services code after
> >      * ExitBootServices() has been called. Ignoring this recommendation=
 a
> >      * significant bunch of EFI implementations continue calling into b=
oot
> >      * services code (SetVirtualAddressMap). In order to work around su=
ch
> >      * buggy implementations we reserve boot services region during EFI
> >      * init and make sure it stays executable. Then, after
> >      * SetVirtualAddressMap(), it is discarded.
> >      *
> >      * However, some boot services regions contain data that is required
> >      * by drivers, so we need to track which memory ranges can never be
> >      * freed. This is done by tagging those regions with the
> >      * EFI_MEMORY_RUNTIME attribute.
> >      *
> >      * Any driver that wants to mark a region as reserved must use
> >      * efi_mem_reserve() which will insert a new EFI memory descriptor
> >      * into efi.memmap (splitting existing regions if necessary) and tag
> >      * it with EFI_MEMORY_RUNTIME.
> >      */
>=20
> But you realize that the comment specifically talks about
> the call tree underneath SetVirtualAddressMap() being the violator.
> As long as we don't call this function, we're unaffected as far as
> this comment goes.

Well, this very thread proves it isn't only about
SetVirtualAddressMap(). I _guess_ it's about calls before
SetVirtualAddressMap() returns (which supposedly do some cleanups). In
Linux case, it is only that one call.

> > Regardless of SetVirtualAddressMap() discussion, I propose to
> > automatically map boot services code/data, to make Xen work on more
> > machines (even if _we_ consider those buggy).=20
>=20
> I remain on my prior position: Adding command line triggerable
> workarounds for such cases is fine. Defaulting to assume buggy
> firmware is acceptable only if this means no extra penalty to
> systems with conforming firmware. Hence, for the case at hand,
> I object to doing this automatically; we already have the
> /mapbs workaround in place to deal with the case when xen.efi
> is used. Judging from the title here there may need to be an
> addition to also allow triggering this from the MB2 boot path.

What about mirroring Linux behavior? I.e. mapping those regions for the
SetVirtualAddressMap() time (when enabled) and unmapping after - unless
tagged with EFI_MEMORY_RUNTIME?=20
Similarly to Andrew, I'd really prefer for Xen to work out of the box,
with as little as possible manual tweaks needed.

> >>> Then I've tried a different approach: call SetVirtualAddressMap(), but
> >>> with an address map that tries to pretend physical addressing (the co=
de
> >>> under #ifndef USE_SET_VIRTUAL_ADDRESS_MAP). This mostly worked, I nee=
ded
> >>> only few changes:
> >>>  - set VirtualStart back to PhysicalStart in that memory map (it was =
set
> >>>    to directmap)
> >>>  - map boot services (at least for the SetVirtualAddressMap() call ti=
me,
> >>>    but haven't tried unmapping it later)
> >>>  - call SetVirtualAddressMap() with that "1:1" map in place, using
> >>>    efi_rs_enter/efi_rs_leave.
> >>>
> >>> This fixed the issue for me, now runtime services do work even without
> >>> disabling ExitBootServices() call. And without any extra
> >>> platform-specific command line arguments. And I think it also shouldn=
't break
> >>> kexec, since it uses 1:1-like map, but I haven't tried. One should
> >>> simply ignore EFI_UNSUPPORTED return code (I don't know how to avoid =
the
> >>> call at all after kexec).
> >>
> >> That's the point - it can't be avoided, and hence it failing is not
> >> an option. Or else there needs to be a protocol telling kexec what
> >> it is to expect, and that it in particular can't change the virtual
> >> address map to its liking. Back at the time when I put together the
> >> EFI booting code, no such protocol existed, and hence calling
> >> SetVirtualAddressMap() was not an option. I have no idea whether
> >> things have changed in the meantime.
> >=20
> > Hmm, how is it different from the current situation? Not calling
> > SetVirtualAddressMap() means UEFI will not be notified about new address
> > map. It does _not_ mean it will use 1:1 map, it will use what was
> > previously set.
>=20
> What do you mean by "previously set"? SetVirtualAddressMap() can be
> invoked only once during a given session (i.e. without intervening
> boot). How would other than a 1:1 map have got set?

Like, in the very next sentence of my answer:

> > What if Xen was kexec'ed from Linux?

> > In Linux case, it looks like it passes around the EFI memory map using
> > some Linux-specific mechanism, but I don't find it particularly
> > appealing option.
>=20
> Indeed.
>=20
> > What about something in between: make this SetVirtualAddressMap() call
> > compile-time option (kconfig), depending on !CONFIG_KEXEC ? And when
> > enabled, properly handle SetVirtualAddressMap() failure.
>=20
> What is "proper handling" here?

Logging the error and either panic or disabling runtime services (I tend
to the latter).

> > I my case,
> > where I do care about supporting various UEFI implementations, I don't
> > need kexec support. And apparently people carrying about kexec don't
> > have problems with lack of SetVirtualAddressMap(), so that would be
> > win-win, no?
>=20
> Allowing SetVirtualAddressMap() when !KEXEC would be fine with me.
> The fly in the ointment here is that we'd prefer not to have such
> Kconfig options (at least not without EXPERT qualifier), as
> (security) supporting all the possible combinations would be a
> nightmare. If an EXPERT dependency is okay with you, then I'll be
> looking forward to your patch.

EXPERT is fine with me.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--iZ6mOkMR8xnvq2vL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2cuWIACgkQ24/THMrX
1yyjKQgAmN6gw2HXIXgF5EsYEscDtFu69FLEiOZL+VM7DXgBqM2aJv4VqSlT2F5c
UpBd3he0U8WkjSyI/vIUFaG5p3uUegDMPvFcAJmiCbvaaT0DGim/wqdZlPCni0C6
Pt/wbsz3e6m0ag22etprS1rKWSPQFNHy40cnSPs093TOltBihWyhWsMVSU8emxA+
QV9oohPjItNprYKDbZ9yddAA49QFUCE8cj8kzc0B1itZd4UNdvNaYPzWFOKHx9gy
hujyXGc6hsT5IAfw/gjPADrZxZoZ4W962k7jyPzobUS0bmcNHBIvf0A74TjcNll6
aENc0CPXLu7+mlF4Lb3Ny7E+XoldRw==
=/QPX
-----END PGP SIGNATURE-----

--iZ6mOkMR8xnvq2vL--


--===============1483168606756998424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1483168606756998424==--

