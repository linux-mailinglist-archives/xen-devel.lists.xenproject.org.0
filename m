Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80037CF8EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 13:53:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHo0V-00037e-3t; Tue, 08 Oct 2019 11:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=93Dx=YB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iHo0T-00037Z-QY
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 11:50:22 +0000
X-Inumbo-ID: cd9bb810-e9c1-11e9-9bee-bc764e2007e4
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd9bb810-e9c1-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 11:50:20 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1D129381;
 Tue,  8 Oct 2019 07:50:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 07:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m5Mapb
 NXCOIS0TzSXChUl2iJNOE7ZOD/vFmdq2oYij0=; b=iWaR3bxgnIHZdZJK29WG7r
 uqcknfgVm6WRxq+xbAa6Q5xncQdPjmcMgZ2n/O8ViISUS9EgiAQnGo9NyjiIfiNf
 VZiRLyrTePq87mbF07s3h6Q6ujqhhmSBtOK6H7JyJUBquwaRxoAIIg8XdmkpEqLM
 KIoeghCyTbk6KbVjmco5LvM+iy/4V68uN8UMbBrCOHaz9l0LwG+Fw4Alw/igVOok
 oWlGME3yzhnoYDOV40ofUNf5GkhRnMYgXlgB4ggF/FMMdHemdMcf1+sJh0nG4wrm
 udy2BO0dOJgVAf8J9FbW+D5t+37pyJ/33mX4Tu2QSX0s0F0b/a1OtMCFx+Y1qS8A
 ==
X-ME-Sender: <xms:-necXVPjHaoLSqq48UvQyWWZeEgeTH2-viPrPIGQidB0HVpPebcKag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheelgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-necXVU0mC-uv1UKyOuyRhWZGhZcuM-JLQYeKfFdmavEwFs7mYNAmw>
 <xmx:-necXbkdMdBetQXNGmrw4qY8y1PSApG7YpogAlaHAFoV9av9vCziYg>
 <xmx:-necXcNG6i1QhKuhBKrfu3foDTNI4pgqRp42VCTsJ0TnkOkI6sVatw>
 <xmx:-necXURcZLlawKUD9DDaUoCYDnVSTcZWHnIiss5L58rowOfmZFIVGw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A5BB8005A;
 Tue,  8 Oct 2019 07:50:17 -0400 (EDT)
Date: Tue, 8 Oct 2019 13:50:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008115014.GI8065@mail-itl>
References: <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
 <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
 <20190807160451.GB3257@mail-itl>
 <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
MIME-Version: 1.0
In-Reply-To: <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1958393992009700527=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1958393992009700527==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9CGWabQ8wCOOTGwI"
Content-Disposition: inline


--9CGWabQ8wCOOTGwI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Thu, Aug 08, 2019 at 08:03:49AM +0200, Jan Beulich wrote:
> On 08.08.2019 04:53, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Aug 07, 2019 at 09:26:00PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Ok, regardless of adding proper option for that, I've hardcoded map_b=
s=3D1
> > > and it still crashes, just slightly differently:
> > >=20
> > >      Xen call trace:
> > >         [<0000000000000080>] 0000000000000080
> > >         [<8c2b0398e0000daa>] 8c2b0398e0000daa
> > >=20
> > >      Pagetable walk from ffffffff858483a1:
> > >         L4[0x1ff] =3D 0000000000000000 ffffffffffffffff
> > >=20
> > >      ****************************************
> > >      Panic on CPU 0:
> > >      FATAL PAGE FAULT
> > >      [error_code=3D0002]
> > >      Faulting linear address: ffffffff858483a1
> > >      ****************************************
> > >=20
> > > Full message attached.
> >=20
> > After playing more with it and also know workarounds for various EFI
> > issues, I've found a way to boot it: avoid calling Exit BootServices.
> > There was a patch from Konrad adding /noexit option, that never get
> > committed. Similar to efi=3Dmapbs option, I'd add efi=3Dno-exitboot too
> > (once efi=3Dmapbs patch is accepted).
> >=20
> > Anyway, I'm curious what exactly is wrong here. Is it that the firmware
> > is not happy about lack of SetVirtualAddressMap call? FWIW, the crash is
> > during GetVariable RS call. I've verified that the function itself is
> > within EfiRuntimeServicesCode, but I don't feel like tracing Lenovo
> > UEFI...
>=20
> This suggests that the firmware zaps a few too many pointers
> during ExitBootServices(). Perhaps internally they check
> whether pointers point into BootServices* memory, and hence the
> wrong marking in the memory map has consequences beyond the OS
> re-using such memory?
>=20
> A proper answer to your question can of course only be given
> by someone knowing this specific firmware version.

I explored it a bit more and talked with a few people doing firmware
development and few conclusions:
1. Not calling SetVirtualAddressMap(), while technically legal, is
pretty uncommon and not recommended if you want to avoid less tested
(aka buggy) UEFI code paths.
2. Every UEFI call before SetVirtualAddressMap() call should be done
with flat physical memory. This include SetVirtualAddressMap() call
itself. Implicitly this means such calls can legally access memory areas
not marked with EFI_MEMORY_RUNTIME.

For the second point, relevant part of UEFI 2.7 spec (Runtime Services
- Virtual Memory Services chapter):

    This section contains function definitions for the virtual memory suppo=
rt that may be
    optionally used by an operating system at runtime. If an operating syst=
em chooses to
    make EFI runtime service calls in a virtual addressing mode instead of =
the flat physical
    mode, then the operating system must use the services in this section t=
o switch the EFI
    runtime services from flat physical addressing to virtual addressing.
(...)
    The call to SetVirtualAddressMap() must be done with the physical mappi=
ngs. On
    successful return from this function, the system must then make any fut=
ure calls with the
    newly assigned virtual mappings. All address space mappings must be don=
e in
    accordance to the cacheability flags as specified in the original addre=
ss map.

I've tried to poke around this part of Xen code, including resurrecting
SetVirtualAddressMap() (#define USE_SET_VIRTUAL_ADDRESS_MAP in
common/efi/boot.c) and (unsurprisingly) hit multiple issues:
 - at this point of time, Xen is already relocated and paging is enabled
 - SetVirtualAddressMap() is indeed not happy about being called with
   new address map in place already
 - directmap - at which that code points - is mapped with NX, which breaks
   EfiRuntimeServicesCode area

Then I've tried a different approach: call SetVirtualAddressMap(), but
with an address map that tries to pretend physical addressing (the code
under #ifndef USE_SET_VIRTUAL_ADDRESS_MAP). This mostly worked, I needed
only few changes:
 - set VirtualStart back to PhysicalStart in that memory map (it was set
   to directmap)
 - map boot services (at least for the SetVirtualAddressMap() call time,
   but haven't tried unmapping it later)
 - call SetVirtualAddressMap() with that "1:1" map in place, using
   efi_rs_enter/efi_rs_leave.

This fixed the issue for me, now runtime services do work even without
disabling ExitBootServices() call. And without any extra
platform-specific command line arguments. And I think it also shouldn't bre=
ak
kexec, since it uses 1:1-like map, but I haven't tried. One should
simply ignore EFI_UNSUPPORTED return code (I don't know how to avoid the
call at all after kexec).

Any thoughts? If the above sounds good, I'll cleanup the patch and
submit it.
BTW Does it qualify for 4.13? On one hand it may be seen as a bugfix
(fix booting on some UEFI firmwares), but on the other hand, I can't
think of all the side effects.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--9CGWabQ8wCOOTGwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2cd/YACgkQ24/THMrX
1yw7Lgf/dcMSWnDErF/cQUnsJfCg+pAJVx2tFrlizqmnuoM/RQsOfVSvrfbt2Ngd
erd3BFxEaOahTP/cfftubVSOSqzX4/li06vx49uJWt9JSVWc5KqEaymSjqMN9uzj
xf+1HkoiTFR9TRd+Ca+6r2yEq59VbnmBtX5EPez5w5bdggNNm/2tJfbdusEgRRTy
VAYGqNIk9rQM4tZxBt8nSBtshgIwGYAksDjTQiKzfh3JhYg0DKDW0Kpzha/L2t4P
6a77nx7lQP9BGdx4zj/luM9uoZWfrcbNfcb3PKth0mfv2fXqhnIL96P1PkRhU119
8cxVQxi3KFcnAQfTAcPUMxwmD3zdxg==
=oCzp
-----END PGP SIGNATURE-----

--9CGWabQ8wCOOTGwI--


--===============1958393992009700527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1958393992009700527==--

