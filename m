Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AACFBAE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 15:56:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHpvQ-00053y-O3; Tue, 08 Oct 2019 13:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=93Dx=YB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iHpvO-00053t-Va
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 13:53:15 +0000
X-Inumbo-ID: f8c6ef80-e9d2-11e9-80e3-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8c6ef80-e9d2-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 13:53:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A03DE21857;
 Tue,  8 Oct 2019 09:53:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 09:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nfVXq+
 d+QGvdVONXilsnqCaOThx6cj+k/RFTh+nTTqQ=; b=lhgwEpoKuVfAbWKLoK7GZu
 XFfTECFN+pf525o9IbbtaFo8STsphH6SNzePBIxg23HHbCmWdBDY78lowrxOqPj0
 wxzlsf3pluN4xNYtojQ5IF3SO4wXTGB9JvHRjRGMO+CATfBO/UiY2Hqgv1tjhhH0
 enwSGPxSxhRcnQN3pMXRCS/P+DoaXmcNSt2HEtfdjQwGnhQV2E+Qj2dXKcQSbjdR
 IJ5cnzguw0CMkM3tvOV5fLAdWzCvz0bnj0dBF4eYfMq+y5+gsR3zObHQH9+Y9TDC
 AtFr0D39maxOd/2JwIWeEe9TJLUzpPUxcf2sLM+ZsngKyzUEmn150lZ43k1MuENQ
 ==
X-ME-Sender: <xms:yZScXSEJkM9lvFxP7-4vZIEC6sRr84_Rc7yV_7BOXfuE4LTkEwm4Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:yZScXa8Bq8isCOEIrw5zZeyN1bCZ_y-GwJfRbdM2sTM0bMUoMIt36Q>
 <xmx:yZScXcX4b3m-pj7KIFSe56YYaWOq5ereHcvkTJGQQdMpIRKqjomWnA>
 <xmx:yZScXUHPi-DlHf_F16Yhjnm8xRBL1dYAPfNPfTKrNb0nJm4x7_eGpA>
 <xmx:yZScXUhwTvHbdruRWZvhvUITVSJd1EHtBimWqwYGTwT4UH7XeqA-nQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3DE6980060;
 Tue,  8 Oct 2019 09:53:12 -0400 (EDT)
Date: Tue, 8 Oct 2019 15:52:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008135252.GK8065@mail-itl>
References: <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
 <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
 <20190807160451.GB3257@mail-itl>
 <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
MIME-Version: 1.0
In-Reply-To: <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
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
Content-Type: multipart/mixed; boundary="===============8637336845000449543=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8637336845000449543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liLRoGuMkvkNxyGo"
Content-Disposition: inline


--liLRoGuMkvkNxyGo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Tue, Oct 08, 2019 at 03:08:29PM +0200, Jan Beulich wrote:
> On 08.10.2019 13:50, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Thu, Aug 08, 2019 at 08:03:49AM +0200, Jan Beulich wrote:
> >> On 08.08.2019 04:53, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> On Wed, Aug 07, 2019 at 09:26:00PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> >>>> Ok, regardless of adding proper option for that, I've hardcoded map_=
bs=3D1
> >>>> and it still crashes, just slightly differently:
> >>>>
> >>>>      Xen call trace:
> >>>>         [<0000000000000080>] 0000000000000080
> >>>>         [<8c2b0398e0000daa>] 8c2b0398e0000daa
> >>>>
> >>>>      Pagetable walk from ffffffff858483a1:
> >>>>         L4[0x1ff] =3D 0000000000000000 ffffffffffffffff
> >>>>
> >>>>      ****************************************
> >>>>      Panic on CPU 0:
> >>>>      FATAL PAGE FAULT
> >>>>      [error_code=3D0002]
> >>>>      Faulting linear address: ffffffff858483a1
> >>>>      ****************************************
> >>>>
> >>>> Full message attached.
> >>>
> >>> After playing more with it and also know workarounds for various EFI
> >>> issues, I've found a way to boot it: avoid calling Exit BootServices.
> >>> There was a patch from Konrad adding /noexit option, that never get
> >>> committed. Similar to efi=3Dmapbs option, I'd add efi=3Dno-exitboot t=
oo
> >>> (once efi=3Dmapbs patch is accepted).
> >>>
> >>> Anyway, I'm curious what exactly is wrong here. Is it that the firmwa=
re
> >>> is not happy about lack of SetVirtualAddressMap call? FWIW, the crash=
 is
> >>> during GetVariable RS call. I've verified that the function itself is
> >>> within EfiRuntimeServicesCode, but I don't feel like tracing Lenovo
> >>> UEFI...
> >>
> >> This suggests that the firmware zaps a few too many pointers
> >> during ExitBootServices(). Perhaps internally they check
> >> whether pointers point into BootServices* memory, and hence the
> >> wrong marking in the memory map has consequences beyond the OS
> >> re-using such memory?
> >>
> >> A proper answer to your question can of course only be given
> >> by someone knowing this specific firmware version.
> >=20
> > I explored it a bit more and talked with a few people doing firmware
> > development and few conclusions:
> > 1. Not calling SetVirtualAddressMap(), while technically legal, is
> > pretty uncommon and not recommended if you want to avoid less tested
> > (aka buggy) UEFI code paths.
> > 2. Every UEFI call before SetVirtualAddressMap() call should be done
> > with flat physical memory. This include SetVirtualAddressMap() call
> > itself. Implicitly this means such calls can legally access memory areas
> > not marked with EFI_MEMORY_RUNTIME.
>=20
> I don't think this is quite right - whether non-runtime memory may
> be touched depends exclusively on ExitBootServices() (not) having
> got called (yet).

That would be logical. In practice however we have evidences firmware
vendors have different opinion... A comment from Linux (already quoted
here 2 months ago):

    /*
     * The UEFI specification makes it clear that the operating system is
     * free to do whatever it wants with boot services code after
     * ExitBootServices() has been called. Ignoring this recommendation a
     * significant bunch of EFI implementations continue calling into boot
     * services code (SetVirtualAddressMap). In order to work around such
     * buggy implementations we reserve boot services region during EFI
     * init and make sure it stays executable. Then, after
     * SetVirtualAddressMap(), it is discarded.
     *
     * However, some boot services regions contain data that is required
     * by drivers, so we need to track which memory ranges can never be
     * freed. This is done by tagging those regions with the
     * EFI_MEMORY_RUNTIME attribute.
     *
     * Any driver that wants to mark a region as reserved must use
     * efi_mem_reserve() which will insert a new EFI memory descriptor
     * into efi.memmap (splitting existing regions if necessary) and tag
     * it with EFI_MEMORY_RUNTIME.
     */

Regardless of SetVirtualAddressMap() discussion, I propose to
automatically map boot services code/data, to make Xen work on more
machines (even if _we_ consider those buggy).=20

> > Then I've tried a different approach: call SetVirtualAddressMap(), but
> > with an address map that tries to pretend physical addressing (the code
> > under #ifndef USE_SET_VIRTUAL_ADDRESS_MAP). This mostly worked, I needed
> > only few changes:
> >  - set VirtualStart back to PhysicalStart in that memory map (it was set
> >    to directmap)
> >  - map boot services (at least for the SetVirtualAddressMap() call time,
> >    but haven't tried unmapping it later)
> >  - call SetVirtualAddressMap() with that "1:1" map in place, using
> >    efi_rs_enter/efi_rs_leave.
> >=20
> > This fixed the issue for me, now runtime services do work even without
> > disabling ExitBootServices() call. And without any extra
> > platform-specific command line arguments. And I think it also shouldn't=
 break
> > kexec, since it uses 1:1-like map, but I haven't tried. One should
> > simply ignore EFI_UNSUPPORTED return code (I don't know how to avoid the
> > call at all after kexec).
>=20
> That's the point - it can't be avoided, and hence it failing is not
> an option. Or else there needs to be a protocol telling kexec what
> it is to expect, and that it in particular can't change the virtual
> address map to its liking. Back at the time when I put together the
> EFI booting code, no such protocol existed, and hence calling
> SetVirtualAddressMap() was not an option. I have no idea whether
> things have changed in the meantime.

Hmm, how is it different from the current situation? Not calling
SetVirtualAddressMap() means UEFI will not be notified about new address
map. It does _not_ mean it will use 1:1 map, it will use what was
previously set. What if Xen was kexec'ed from Linux?
In Linux case, it looks like it passes around the EFI memory map using
some Linux-specific mechanism, but I don't find it particularly
appealing option.

What about something in between: make this SetVirtualAddressMap() call
compile-time option (kconfig), depending on !CONFIG_KEXEC ? And when
enabled, properly handle SetVirtualAddressMap() failure. I my case,
where I do care about supporting various UEFI implementations, I don't
need kexec support. And apparently people carrying about kexec don't
have problems with lack of SetVirtualAddressMap(), so that would be
win-win, no?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--liLRoGuMkvkNxyGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2clLQACgkQ24/THMrX
1yzssQf+KepSgyzazwb8ko1M2eZYounaEeBwmbA9GcE/PyOxul0WBveMyTZaMk+K
yt9qE/V3Qlx0fFrbBJ1oQ8ipfGiWAlrvfBBZg9bTTCaZamOutgieVxGnnlC0q6bk
XEOe6TXRpvpcQQUln/oYKYahBw+g3Uxymbb5CPqhmCN3cZ02kDElK40esqKNzFoX
cZrDz6LPnMOSFnFfELz25sr9B9H3Xtvt8zEDuFa+TcElM964o4ilPfyFIMu1q79m
3559nWGvZilR01D+KeK1I59QRFcvgdMXCsFEeRCYND4CrufNQGUPpYtOdCvmnGWj
FyU6jyVLNA1xiCxPWKvuOGJq3M63vQ==
=fxux
-----END PGP SIGNATURE-----

--liLRoGuMkvkNxyGo--


--===============8637336845000449543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8637336845000449543==--

