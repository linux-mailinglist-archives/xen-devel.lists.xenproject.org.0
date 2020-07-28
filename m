Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9636F231572
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 00:17:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Xu1-0004Tm-Jm; Tue, 28 Jul 2020 22:16:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bBlf=BH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k0Xu0-0004Th-SY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 22:16:53 +0000
X-Inumbo-ID: 093b26a8-d120-11ea-8be7-bc764e2007e4
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 093b26a8-d120-11ea-8be7-bc764e2007e4;
 Tue, 28 Jul 2020 22:16:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 522667F8;
 Tue, 28 Jul 2020 18:16:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 28 Jul 2020 18:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NJE5iT
 bRAUSREXOKgGh/V5hHtyKpPpr+YxsVQQIVXfw=; b=VAwexPhjsAYtJl+3RV8sxf
 W6L9ExR0YsPrABe6GY4zkf0pT2fj3NKMCPldVBVjlCXuamZ49UTrau8n5fwu3OFn
 HT0WIs+4KKd6bzYkwk9QmjN2U4rIvTjBavaoMXsqoouI02FkQDZYwo2c/4SmKql6
 MOWIDi4Q3fdcet40QZNj8IHaBEkRForUlhLR2cckRLoBsLxGtPitfgB1ztyzUa/n
 nBy+qf9PoFUz0F8kTDh3g/ZeP+eHGkZb8A4vHoFjPi/Wi8RrVV+YRHXy+fC6Qvfg
 JZntbHlpdbMNN5n7gcWAjb+bskOOl/oMFqfhdSfEY0lCbxhEVVaKttrvOi5lHPMg
 ==
X-ME-Sender: <xms:0aMgX_rxB4W3dg_swZGOt22JfWo-RoilDBPkmS_za_1U19oZ9Y3tDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
 gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
 drieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
 homh
X-ME-Proxy: <xmx:0aMgX5q_Nu4lUOz7HRbxefy9MKBiwyFesYjYoCYglKnesYM0KKpZFw>
 <xmx:0aMgX8NIzMIwLIBwnUU9TloPGpTNPfvylJIaX1rEuusyTEuncQS0mQ>
 <xmx:0aMgXy6ZAe0KL6Y8anKJdFLOYwSQZYBxEUfhn8pueXnA8RoYjZL-Aw>
 <xmx:0aMgX0RcVVylnKxWO8Jv56uzckTjdin5-cQ8Fjfnyj7aMmcPq80crQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 379513280060;
 Tue, 28 Jul 2020 18:16:48 -0400 (EDT)
Date: Wed, 29 Jul 2020 00:16:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule
Message-ID: <20200728221645.GO1626@mail-itl>
References: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
 <39be665c-b6c8-23e3-b18b-d38cfe5c1286@suse.com>
 <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline
In-Reply-To: <bbe85f76-0999-1150-3d48-c7f9e1796dac@citrix.com>
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
Cc: piotr.krol@3mdeb.com, xen-devel@lists.xenproject.org,
 Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 Jan Beulich <jbeulich@suse.com>, Norbert Kaminski <norbert.kaminski@3mdeb.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: fwupd support under Xen - firmware updates with the UEFI capsule

On Tue, Jul 28, 2020 at 10:01:33PM +0100, Andrew Cooper wrote:
> On 28/07/2020 21:00, Jan Beulich wrote:
> > On 28.07.2020 09:41, Norbert Kaminski wrote:
> >> I'm trying to add support for the firmware updates with the UEFI
> >> capsule in
> >> Qubes OS. I've got the troubles with reading ESRT (EFI System
> >> Resource Table)
> >> in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is n=
ot
> >> enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and
> >> kernel
> >> cmdline parameters (add_efi_memmap):
> >>
> >> ```
> >> [=C2=A0=C2=A0=C2=A0 3.451249] efi: EFI_MEMMAP is not enabled.
> >> ```
> >
> > It is, according to my understanding, a layering violation to expose
> > the EFI memory map to Dom0. It's not supposed to make use of this
> > information in any way. Hence any functionality depending on its use
> > also needs to be implemented in the hypervisor, with Dom0 making a
> > suitable hypercall to access this functionality. (And I find it
> > quite natural to expect that Xen gets involved in an update of the
> > firmware of a system.)
>=20
> ERST is a table (read only by the looks of things) which is a catalogue
> of various bits of firmware in the system, including GUIDs for
> identification, and version information.
>=20
> It is the kind of data which the hardware domain should have access to,
> and AFAICT, behaves just like a static ACPI table.
>=20
> Presumably it wants to an E820 reserved region so dom0 gets indent
> access, and something in the EFI subsystem needs extending to pass the
> ERST address to dom0.

I think most (if not all) pieces in Xen are already there - there is
XENPF_firmware_info with XEN_EFW_EFI_INFO + XEN_FW_EFI_CONFIG_TABLE
that gives address of the EFI config table. Linux saves it in
efi_systab_xen.tables (arch/x86/xen/efi.c:xen_efi_probe().
I haven't figured out yet if it does anything with that information, but
the content of /sys/firmware/efi/systab suggests it does.

It seems ESRT driver in Linux uses memmap just for some sanity checks
(if the ESRT points at memory with EFI_MEMORY_RUNTIME and appropriate
type). Perhaps the check (if really necessary) can be added to Xen and
in case of dom0 simply skipped in Linux.

Norbert, if you're brave enough ;) I would suggests trying the (Linux)
patch below:

-----8<-----
diff --git a/drivers/firmware/efi/esrt.c b/drivers/firmware/efi/esrt.c
index e3d692696583..a2a5ccbb00a8 100644
--- a/drivers/firmware/efi/esrt.c
+++ b/drivers/firmware/efi/esrt.c
@@ -245,13 +245,14 @@ void __init efi_esrt_init(void)
 	int rc;
 	phys_addr_t end;
=20
-	if (!efi_enabled(EFI_MEMMAP))
+	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
 		return;
=20
 	pr_debug("esrt-init: loading.\n");
 	if (!esrt_table_exists())
 		return;
=20
+	if (!efi_enabled(EFI_PARAVIRT)) {
 	rc =3D efi_mem_desc_lookup(efi.esrt, &md);
 	if (rc < 0 ||
 	    (!(md.attribute & EFI_MEMORY_RUNTIME) &&
@@ -276,6 +277,7 @@ void __init efi_esrt_init(void)
 		       size, max);
 		return;
 	}
+	}
=20
 	va =3D early_memremap(efi.esrt, size);
 	if (!va) {
@@ -331,7 +333,8 @@ void __init efi_esrt_init(void)
=20
 	end =3D esrt_data + size;
 	pr_info("Reserving ESRT space from %pa to %pa.\n", &esrt_data, &end);
-	if (md.type =3D=3D EFI_BOOT_SERVICES_DATA)
+
+	if (!efi_enabled(EFI_PARAVIRT) && md.type =3D=3D EFI_BOOT_SERVICES_DATA)
 		efi_mem_reserve(esrt_data, esrt_data_size);
=20
 	pr_debug("esrt-init: loaded.\n");
----8<-----


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl8go80ACgkQ24/THMrX
1yxHfgf/Vba4UEFX2tdHVYoNTsDpl0iM6Z3iYuX8dpbhaZoTUIjEJNmxPIW9xh3t
kmMbaCSh4ovvwKI1ltbwoayclM+k1IFc655whzcM9NZLVF2mSsYbOPzK8K7348Um
miSjjv5fkB+dRlXg68FZPGQpKnXDa8oR3UoVUNCG0B1ezfY7gVA92TdempMgp7C2
hBaHulUhcNT7bAc0+NBpO+kvGcO0yQnCB29LI0V9RDmyP0oyhdZ6bbtWuTnpDv/W
YIhxMiN0Qqyq1rFKdYaX4lrnJes0PQDupJhLFTZQjY57l9U8h7nBeJosep1C1SvS
LYPnAOw+IFXjfTzixD9zv0iU7QZ/bQ==
=2EKX
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--

