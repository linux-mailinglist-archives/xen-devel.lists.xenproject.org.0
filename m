Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEA248885
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 17:00:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k836K-0008CQ-HB; Tue, 18 Aug 2020 15:00:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1vP=B4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k836I-0008Bg-Gp
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 15:00:34 +0000
X-Inumbo-ID: e7674d43-5502-4e60-91a2-bd462028c9a7
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7674d43-5502-4e60-91a2-bd462028c9a7;
 Tue, 18 Aug 2020 15:00:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E1E510C5;
 Tue, 18 Aug 2020 11:00:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 Aug 2020 11:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8S7o2W
 itJx0pvqq+v4qz1FcBNywixhV6Vrq1Sr74rOw=; b=IeUFct3LDCNutJP+hMWOsL
 f7wWiak+icSFW+MvRxJnmmDGVyq+QoNjV0u0h4diVV85i1/bFgS5beDJp4GT+BI5
 e/88q9Otlp5sm33ZVUNDGIdy0Uxvd3inGz9wbsS38qsBvAEyeJ4vFMjjAHAyTaIH
 ekE21bRWkxHpuHdnUnYWo4SwU71GkUekGLPLWKBktRuwREBNnDBzfNbzjhP+2w+z
 TPzOUMmikQGgs+METUaEul7INBjjAQyARvMXa6zOEKm3HjE/XMbzmIEo/qJ8Ipzw
 FCpGsI0LkRZoSUVTuwq+O08Qsaz7dmMA2CK8i1eFzKAOVsTKInwba/eHBoHXOrhg
 ==
X-ME-Sender: <xms:Du07X4wwgPwBWcNAvrSn1iRQao6L6jxNoEUJRph4lHXYzBSrngnqqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtiedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeeg
 iedvleekjeegteekleegveeghfefgefhffeiheduueetkeeuteegteeigfenucffohhmrg
 hinhepmhgrrhhkmhgrihhlrdhorhhgnecukfhppeeluddrieegrddujedtrdekleenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
 gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Du07X8SPOB_hyzkXYgeEq9bJ2pYBd98O9jD72RPbDr8CCMQ3MkBwfA>
 <xmx:Du07X6WmT5S8CagUx1Gs1I6N7wHAHwb61jqpSn_skwZdSaPJDdGhnw>
 <xmx:Du07X2ieobDKlLmeb_mQEy-JiqzqUHoGC8RHIX3xHEMQgSrbOLFn6A>
 <xmx:D-07X74Ol74v2NphVCtLF4ypBLH_KCh_kpsDKDD3EPcH7Yscu5YTdg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9ACC4306005F;
 Tue, 18 Aug 2020 11:00:29 -0400 (EDT)
Date: Tue, 18 Aug 2020 17:00:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
 norbert.kaminski@3mdeb.com, xen-devel@lists.xenproject.org,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200818150020.GL1679@mail-itl>
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
 <20200817090013.GN975@Air-de-Roger>
 <20200818120135.GK1679@mail-itl>
 <20200818124710.GK828@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pe+tqlI1iYzVj1X/"
Content-Disposition: inline
In-Reply-To: <20200818124710.GK828@Air-de-Roger>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--pe+tqlI1iYzVj1X/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too

On Tue, Aug 18, 2020 at 02:47:10PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 18, 2020 at 02:01:35PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Do you mean PV dom0 should receive full EFI memory map? Jan already
> > objected this as it would be a layering violation.
>=20
> dom0 is already capable of getting the native e820 memory map using
> XENMEM_machine_memory_map, I'm not sure why allowing to return the
> memory map in EFI form would be any different (or a layering
> violation in the PV dom0 case).
>
> Do you have a reference to that thread? I certainly missed it.

See this thread: http://markmail.org/message/nrrvuau5whebksy2

> For PVH dom0 we could consider something different, since in that case
> there's a guest memory map which could likely be returned in EFI
> format and with the EFI regions if required.
>=20
> > > > Skip this part on Xen PV (let Xen do the right thing if it deems
> > > > necessary) and use ESRT table normally.
> > >=20
> > > Maybe it would be better to introduce a new hypercall (or add a
> > > parameter to XENMEM_machine_memory_map) in order to be able to fetch
> > > the EFI memory map?
> > >
> > > That should allow a PV dom0 to check the ESRT is correct and thus not
> > > diverge from bate metal.
> >=20
> > Note the EFI memory map there is used not just to check things, but to
> > actually modify it to reserve the region. I think that's rather Xen
> > responsibility, not dom0. See the comment from Ard.
>=20
> But that would modify Linux copy of the memory map, which is fine? My
> understanding of EFI is limited, but I don't think such changes are
> feed back into EFI, so Linux is completely free to do whatever it
> wants with it's copy of the EFI memory map.

Yes, but the thing is to make sure Xen doesn't use that memory, not only
dom0. See below.

> > > > +	if (efi_enabled(EFI_MEMMAP)) {
> > > > +		rc =3D efi_mem_desc_lookup(efi.esrt, &md);
> > > > +		if (rc < 0 ||
> > > > +		    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
> > > > +		     md.type !=3D EFI_BOOT_SERVICES_DATA &&
> > > > +		     md.type !=3D EFI_RUNTIME_SERVICES_DATA)) {
> > > > +			pr_warn("ESRT header is not in the memory map.\n");
> > > > +			return;
> > > > +		}
> > >=20
> > > Here you blindly trust the data in the ESRT in the PV case, without
> > > checking it matches the regions on the memory map, which could lead to
> > > errors if ESRT turns to be wrong.
> >=20
> > I don't think checking merely if ESRT lives somewhere in
> > EFI_{BOOT,RUNTIME}_SERVICES_DATA area guarantees its correctness.
> >=20
> > On the other hand, this seems to be done to prevent overwriting that
> > memory with something else (see that in case of EFI_BOOT_SERVICES_DATA
> > it is later marked as reserved. I think it should be rather done by Xen,
> > not dom0.
>=20
> Forcing Xen to do all those checks seems quite a tedious work, and in
> fact the memory map that dom0 has might be more complete than the one
> Xen is able to construct, as Xen doesn't have an AML parser so it's
> not able to get all the possible info from ACPI.

Let me draw the picture from the beginning.

EFI memory map contains various memory regions. Some of them are marked
as not needed after ExitBootServices() call (done in Xen before
launching dom0). This includes EFI_BOOT_SERVICES_DATA and
EFI_BOOT_SERVICES_CODE.

EFI SystemTable contains pointers to various ConfigurationTables -
physical addresses (at least in this case). Xen does interpret some of
them, but not ESRT. Xen pass the whole (address of) SystemTable to Linux
dom0 (at least in PV case). Xen doesn't do anything about tables it
doesn't understand.

Now, the code in Linux takes the (ESRT) table address early and checks
the memory map for it. We have 3 cases:
 - it points at area marked as neither EFI_*_SERVICES_DATA, nor with
   EFI_MEMORY_RUNTIME attribute -> Linux refuse to use it
 - it points to EFI_RUNTIME_SERVICES_DATA or with EFI_MEMORY_RUNTIME
   attribute - Linux uses the table; memory map already says the area
   belongs to EFI and the OS should not use it for something else
 - it points to EFI_BOOT_SERVICES_DATA - Linux mark the area as reserved
   to not release it after calling ExitBootServices()

The problematic is the third case - at the time when Linux dom0 is run,
ExitBootServices() was already called and EFI_BOOT_SERVICES_* memory was
already released. It could be already used for something else (for
example Xen could overwrite it while loading dom0).

Note the problematic case should be the most common - UEFI specification
says "The ESRT shall be stored in memory of type EfiBootServicesData"
(chapter 22.3 of UEFI Spec v2.6).

For this reason, to use ESRT in dom0, Xen should do something about it
before ExitBootServices() call. While analyzing all the EFI tables is
probably not a viable option, it can do some simple action:
 - retains all the EFI_BOOT_SERVICES_* areas - there is already code
   for that, controlled with /mapbs boot switch (to xen.efi, would need
   another option for multiboot2+efi)
 - have a list of tables to retain - since Xen already do analyze some
   of the ConfigurationTables, it can also have a list of those to
   preserve even if they live in EFI_BOOT_SERVICES_DATA. In this case,
   while Xen doesn't need to parse the whole table, it need to parse it's
   header to get the table size - to reserve that memory and not reuse
   it after ExitBootServices().

I think the second solution is slightly more elegant.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pe+tqlI1iYzVj1X/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl877QQACgkQ24/THMrX
1ywhywf/eGFZ6OCabrDr7rLIyZb+h0glpr6T/95k3/v/plivK1v3J/tWQ5+0cHtz
+j/6b/jRWGzRiheX22jsuTKWJBr3s04oOJmcrYq2LrdBB5jmR8qLK/nwBrLRZwlt
s1xKHFFYPSOfdNikfBOcHVdzBg4FMEL5ETzLcTjfTme+xHKoZFRQ527GRfrUcxMi
LzHKisOmBOHcBoPbcS0Oe0nH4ZfCsizPIKlsmagytmEq67TEYMcle820BPcI/pv6
dUQaocEaqIqgJIIlRDJ3ouGTOrhh/3ICuu6Zvsm0eolg8Lbw9wPVnXVIHQBToCME
GMmzBJ91gvCMpUiIsugdO77VJfg1eg==
=j7zi
-----END PGP SIGNATURE-----

--pe+tqlI1iYzVj1X/--

