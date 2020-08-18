Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529B248E0F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 20:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k86X6-0003Vv-Dp; Tue, 18 Aug 2020 18:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1vP=B4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k86X4-0003Vq-MC
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 18:40:26 +0000
X-Inumbo-ID: c9f7ee12-5088-40ad-8509-82b7527a1015
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9f7ee12-5088-40ad-8509-82b7527a1015;
 Tue, 18 Aug 2020 18:40:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EF325C0103;
 Tue, 18 Aug 2020 14:40:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 Aug 2020 14:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DLEOdn
 0ZYH7rfqxZIVt9qEq5wO+o1yaDM7tmzdVy9bA=; b=SSQsUiDQHx32Bo+0i+QyGD
 RioGu7LADwWEY+v7JGo2rp1E4bWhXwKf/0nVvfoKUFBnInJeyhmcXuYIx9Cicmru
 QmXDG9LWmXtrIWzS/2A2CVUBj3iIruilidp2x6Usq1pVXiNN/VAzmfEjCDn0Xrcq
 xiq3sxX0eLxb3q6bj2QT6yiu0rkZdT+K5V8bzI1JdpQQaoP3Wi7YMmvAlPuM09ZE
 5zh4pQNLR1q83a21wG51vM88Fz2SEb61CSPOfk+UN8eoQ5ht0GeXeRIJEdwQ1FzF
 8MlyMnEE0auEhx3KGqfrGsD80TUGgd2obGR9qo4G2N5IzKeYDguRnYYoX4ul6lrQ
 ==
X-ME-Sender: <xms:mCA8X5EFwgouVL0bwhFIA_yIoP-aU9CVqiqhoinL1VdSBKcZjv9eiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtiedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
 ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppe
 eluddrieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhm
X-ME-Proxy: <xmx:mCA8X-XAPg1dICFKWXcU84bswEGrc09dlJXR5LCspxS8QX_gkcemXQ>
 <xmx:mCA8X7I3gmV5pcaQ1igFgTJEM2aTcbNHasD-KktkTW3Ca3nQ4baI-g>
 <xmx:mCA8X_EOdy8p6UFP5STgge7CgyXhRBEwbjetuhb1ulwLobA0V7cbSw>
 <xmx:mSA8X2enzAPIUAZ-60kTvVEC3rCYgRBFLwsorxaz_o4nCsmKXBxvlQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 73B8230600A3;
 Tue, 18 Aug 2020 14:40:23 -0400 (EDT)
Date: Tue, 18 Aug 2020 20:40:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
 norbert.kaminski@3mdeb.com, xen-devel@lists.xenproject.org,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too
Message-ID: <20200818184018.GN1679@mail-itl>
References: <20200816001949.595424-1-marmarek@invisiblethingslab.com>
 <20200817090013.GN975@Air-de-Roger>
 <20200818120135.GK1679@mail-itl>
 <20200818124710.GK828@Air-de-Roger>
 <20200818150020.GL1679@mail-itl>
 <20200818172114.GO828@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Content-Disposition: inline
In-Reply-To: <20200818172114.GO828@Air-de-Roger>
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


--zPXeIxDajdrcF2en
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] efi: discover ESRT table on Xen PV too

On Tue, Aug 18, 2020 at 07:21:14PM +0200, Roger Pau Monn=C3=A9 wrote:
> > Let me draw the picture from the beginning.
>=20
> Thanks, greatly appreciated.
>=20
> > EFI memory map contains various memory regions. Some of them are marked
> > as not needed after ExitBootServices() call (done in Xen before
> > launching dom0). This includes EFI_BOOT_SERVICES_DATA and
> > EFI_BOOT_SERVICES_CODE.
> >=20
> > EFI SystemTable contains pointers to various ConfigurationTables -
> > physical addresses (at least in this case). Xen does interpret some of
> > them, but not ESRT. Xen pass the whole (address of) SystemTable to Linux
> > dom0 (at least in PV case). Xen doesn't do anything about tables it
> > doesn't understand.
> >=20
> > Now, the code in Linux takes the (ESRT) table address early and checks
> > the memory map for it. We have 3 cases:
> >  - it points at area marked as neither EFI_*_SERVICES_DATA, nor with
> >    EFI_MEMORY_RUNTIME attribute -> Linux refuse to use it
> >  - it points to EFI_RUNTIME_SERVICES_DATA or with EFI_MEMORY_RUNTIME
> >    attribute - Linux uses the table; memory map already says the area
> >    belongs to EFI and the OS should not use it for something else
> >  - it points to EFI_BOOT_SERVICES_DATA - Linux mark the area as reserved
> >    to not release it after calling ExitBootServices()
> >=20
> > The problematic is the third case - at the time when Linux dom0 is run,
> > ExitBootServices() was already called and EFI_BOOT_SERVICES_* memory was
> > already released. It could be already used for something else (for
> > example Xen could overwrite it while loading dom0).
> >=20
> > Note the problematic case should be the most common - UEFI specification
> > says "The ESRT shall be stored in memory of type EfiBootServicesData"
> > (chapter 22.3 of UEFI Spec v2.6).
> >=20
> > For this reason, to use ESRT in dom0, Xen should do something about it
> > before ExitBootServices() call. While analyzing all the EFI tables is
> > probably not a viable option, it can do some simple action:
> >  - retains all the EFI_BOOT_SERVICES_* areas - there is already code
> >    for that, controlled with /mapbs boot switch (to xen.efi, would need
> >    another option for multiboot2+efi)
> >  - have a list of tables to retain - since Xen already do analyze some
> >    of the ConfigurationTables, it can also have a list of those to
> >    preserve even if they live in EFI_BOOT_SERVICES_DATA. In this case,
> >    while Xen doesn't need to parse the whole table, it need to parse it=
's
> >    header to get the table size - to reserve that memory and not reuse
> >    it after ExitBootServices().
>=20
> Xen seems to already contain skeleton
> XEN_EFI_query_capsule_capabilities and XEN_EFI_update_capsule
> hypercalls which is what should be used in order to perform the
> updates?

I think those covers only runtime service calls similarly named. But you
need also ESRT table to collect info about devices that you can even
attempt to update.

TBH, I'm not sure if those runtime services are really needed. I think
Norbert succeeded UEFI update from within Xen PV dom0 with just access
to the ESRT table, but without those services.

> So yes, I agree Xen should make sure the region of the table is not
> freed when exiting boot services, and that dom0 can access it. I
> guess we should move the checks done by Linux to Xen, and then only
> provide the ESRT table to dom0 if the checks (now done by Xen) pass.

Yes, something like this. But note currently in the (PV) dom0 case, Xen
provides dom0 with a pointer to the whole SystemTable, not individual
ConfigurationTables. Making it filter what dom0 gets would require Xen
to re-construct the whole thing with just those elements that are
desired. Not exactly sure if worth the effort given the privilege dom0
has.

BTW How does it look in PVH dom0 case? Does it also get unmodified host
EFI SystemTable? In that case, it would be more tricky, because (IIUC)
physical addresses (like the one for ESRT table) are not meaningful to
PVH dom0.

> It might be helpful to see the whole picture here with the hooks to
> perform the updates also implemented, as those are missing in Xen (and
> Linux?). That would give a clearer view of what you are trying to
> achieve IMO.

Norbert, can you shed some light on this process?

While those two runtime services seems relevant, I see also an update
process involving simply dropping some file into ESP (/boot/efi). I'm
not sure if some runtime services were involved.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl88IJIACgkQ24/THMrX
1yyGUQf/XyHSwgWMa3bAf29o+euHtEQX2Y9xDY4JNgw+kpV0yXiMFfrif5G09dvF
Ix4e1v0hWImfDv+qzQ+jIpRtwLq6SAa5sMe3v9lCM+dRcj8xc9AxIY1fL7zPXPOt
UXaEiUL6JAXsbVWj/fg8iSyuZKb2EBqVLgk5Gbysq+YRNC1GY5Wf057OLbAFmz0S
yqwHJsBsBk9Tan5qk83oTse4c4azt0AglO+Uw2mzlIvch2Xvu3aSebnyHFpqx3m0
lpWtJ6Zgi7bfcOme7fYi8fNh+09NCQYjP6r+9R2qP32cg4XBRSVGC5g/kFODMFMs
PUP0VVZfphqLpaDlUG/ztaoJ1ZxrwQ==
=iwo+
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--

