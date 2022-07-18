Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4E57800A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369556.600996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOG5-0006yR-Vu; Mon, 18 Jul 2022 10:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369556.600996; Mon, 18 Jul 2022 10:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOG5-0006vk-T1; Mon, 18 Jul 2022 10:45:49 +0000
Received: by outflank-mailman (input) for mailman id 369556;
 Mon, 18 Jul 2022 10:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDOG4-0006vc-7R
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:45:48 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65980a9-0686-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:45:45 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CBFF95C00B5;
 Mon, 18 Jul 2022 06:45:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 18 Jul 2022 06:45:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 06:45:42 -0400 (EDT)
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
X-Inumbo-ID: c65980a9-0686-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658141143; x=
	1658227543; bh=LMJuxnGnJ+U5QCPNRgg8fL8m8II2urSozxMf60fUk14=; b=I
	Jtqy5qGu4i1j+QdwrVqqjJ+TXmki2zRTyOhiOgIBcr/asFoQR+6huW/56oxHposP
	noAY1xLOkf0UH5nsLIMUTsyVhiaMwBQau8oZw0lMK6302Hkhwjq1k53hVyjLPfLD
	VeYXL0pHKJs/fUNacHHMI2TlE5kV1j1LoWEnmGpflH6q6B4unGIF+GbY6NIEU0D/
	6D/q+UTQmGgu5QlEnzle83NZ0ttCmE9yNk9H/RCh257y2sTuu1x7YmC22TrZ433x
	XFXJVJvOI3T6lV5xr9MmFAFsFKuE7yuY84iyORp12//PDz7jqNg6TccYPuV/plEq
	zqD1SQOZMVdiQ6eIJ7HIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658141143; x=1658227543; bh=LMJuxnGnJ+U5QCPNRgg8fL8m8II2
	urSozxMf60fUk14=; b=ZQ5vcDajj2Nxf9+mntGbUiiVhgIEg7PsH2pOWkWZqKg1
	KVSk/+oIRu5LhKLGuqbXz3RSDhPSoyvIkA6L+XmmvLDpusbV/ovKYtuQaQ63kP1D
	vDyWIzBr34+LYYYYNTXreslgZJIY7klXW4K48qgQnhwAtCcJfXUtkleat9p3Jb37
	J+noxCK/QVPkOiGQD9XyogRr9ruGsPmMwl4t6LJ4IGTuw5tUVSsVqO3j/XViojXh
	bliixe5/1fhLr7BC/ZMWFRZyHFHgy2aazDlIYN8sNOnKFPL0OxCZ0Xd0BGVMs+BG
	CGZOSRebywXeRBVe8VFbR6f4aQWklXT2ckV7iohrwA==
X-ME-Sender: <xms:1znVYptnt5yoyUde-s6NloNxxTCmKzwcbF4N0nhfe2OupF9zyCzuCw>
    <xme:1znVYid7BraoOSbRUgWxt9lJDS46Lax9dXIIYEgOYAUIPhPmiJeceF1aOr1U2xm-n
    CYl_z0UaJqAAA>
X-ME-Received: <xmr:1znVYszRu6Sb5Vt9adGsegFllymbaLSi4Kg_M95e3_rDogrzCBA84cvxQYY7mnCtHjhrYA0EY6D2MF49I49HeQtk1fg6rN7cPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeg
    ueekveetudfghefgieevffelieeiueekffdtgeejkeelgeffudfhfffhjeefnecuffhomh
    grihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:1znVYgMIaXeEp_22pdA8VHeAMp_b2uySUPRh1wK1MUy7X1LToFF6vA>
    <xmx:1znVYp_f8m0h-0xVGzOuQrl0yr_57T3QcduQ6VTMoN5kNILRAwZm1g>
    <xmx:1znVYgWtzI76jFFqkAjSDt8iDTs9ssWz_vx6MuYIKHdgnCqtlcvTDg>
    <xmx:1znVYpzpCfcw3sdfaxGO3NuYPo1NcgW1XL76aS8J4_khB9qRQx8ECg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 12:45:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Message-ID: <YtU50+Wz4HWQ6p2Q@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
 <5a283b4d-8d1a-52cf-d863-350e2ff39566@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Up8UBq8qqDpu2mBW"
Content-Disposition: inline
In-Reply-To: <5a283b4d-8d1a-52cf-d863-350e2ff39566@suse.com>


--Up8UBq8qqDpu2mBW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 12:45:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger

On Tue, Jul 12, 2022 at 05:59:51PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -721,10 +721,15 @@ Available alternatives, with their meaning, are:
> > =20
> >  ### dbgp
> >  > `=3D ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> > +> `=3D xue`
> > =20
> >  Specify the USB controller to use, either by instance number (when goi=
ng
> >  over the PCI busses sequentially) or by PCI device (must be on segment=
 0).
> > =20
> > +Use `ehci` for EHCI debug port, use `xue` for XHCI debug capability.
> > +Xue driver will wait indefinitely for the debug host to connect - make=
 sure the
> > +cable is connected.
>=20
> Especially without it being clear what "xue" stands for, I wonder
> whether "xhci" would be the better (more commonly known) token to
> use here.

Sure, I can change that. I modify this code heavily anyway, so there is
little point in keeping it similar to the original xue driver.

> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -946,6 +946,9 @@ void __init noreturn __start_xen(unsigned long mbi_=
p)
> >      ns16550.irq     =3D 3;
> >      ns16550_init(1, &ns16550);
> >      ehci_dbgp_init();
> > +#ifdef CONFIG_HAS_XHCI
> > +    xue_uart_init();
> > +#endif
>=20
> Can you make an empty inline stub to avoid the #ifdef here?

Ok.

> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -74,3 +74,12 @@ config HAS_EHCI
> >  	help
> >  	  This selects the USB based EHCI debug port to be used as a UART. If
> >  	  you have an x86 based system with USB, say Y.
> > +
> > +config HAS_XHCI
> > +	bool "XHCI DbC UART driver"
>=20
> I'm afraid I consider most of the other options here wrong in
> starting with HAS_: Such named options should have no prompt, and
> be exclusively engaged by "select". Hence I'd like to ask to drop
> the HAS_ here.

Ok.

> > +	depends on X86
> > +	help
> > +	  This selects the USB based XHCI debug capability to be used as a UA=
RT.
>=20
> s/used/usable/?

Yes.

> > --- /dev/null
> > +++ b/xen/drivers/char/xue.c
> > @@ -0,0 +1,933 @@
> > +/*
> > + * drivers/char/xue.c
> > + *
> > + * Xen port for the xue debugger
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> > + *
> > + * Copyright (c) 2019 Assured Information Security.
> > + */
> > +
> > +#include <xen/delay.h>
> > +#include <xen/types.h>
> > +#include <asm/string.h>
> > +#include <asm/system.h>
> > +#include <xen/serial.h>
> > +#include <xen/timer.h>
> > +#include <xen/param.h>
> > +#include <asm/fixmap.h>
> > +#include <asm/io.h>
> > +#include <xen/mm.h>
>=20
> Please sort xen/ before asm/ and alphabetically within each group.

Ok.

> > +/* uncomment to have xue_uart_dump() debug function */
> > +/* #define XUE_DEBUG 1 */
> > +
> > +#define XUE_POLL_INTERVAL 100 /* us */
> > +
> > +#define XUE_PAGE_SIZE 4096ULL
>=20
> I think I had asked before - why this odd suffix?
>=20
> > +static void xue_sys_pause(void)
> > +{
> > +    asm volatile("pause" ::: "memory");
> > +}
>=20
> I wonder whether the open-coded inline assembly is really needed
> here: Can't you use cpu_relax()? If not, style nit: Several blanks
> missing.

Probably I can.

> > +static bool __init xue_init_xhc(struct xue *xue)
> > +{
> > +    uint32_t bar0;
> > +    uint64_t bar1;
> > +    uint64_t devfn;
> > +
> > +    /*
> > +     * Search PCI bus 0 for the xHC. All the host controllers supporte=
d so far
> > +     * are part of the chipset and are on bus 0.
> > +     */
> > +    for ( devfn =3D 0; devfn < 256; devfn++ )
> > +    {
> > +        pci_sbdf_t sbdf =3D PCI_SBDF(0, 0, devfn);
> > +        uint32_t hdr =3D pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> > +
> > +        if ( hdr =3D=3D 0 || hdr =3D=3D 0x80 )
> > +        {
> > +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) =3D=
=3D XUE_XHC_CLASSC )
> > +            {
> > +                xue->sbdf =3D sbdf;
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> > +    if ( !xue->sbdf.sbdf )
> > +    {
> > +        xue_error("Compatible xHC not found on bus 0\n");
> > +        return false;
> > +    }
> > +
> > +    /* ...we found it, so parse the BAR and map the registers */
> > +    bar0 =3D pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
> > +    bar1 =3D pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
> > +
> > +    /* IO BARs not allowed; BAR must be 64-bit */
> > +    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) !=3D PCI_BASE_ADDRESS_SPACE_M=
EMORY ||
> > +         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) !=3D PCI_BASE_ADDRESS=
_MEM_TYPE_64 )
> > +        return false;
> > +
> > +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
> > +    xue->xhc_mmio_size =3D ~(pci_conf_read32(xue->sbdf, PCI_BASE_ADDRE=
SS_0) & 0xFFFFFFF0) + 1;
> > +    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, bar0);
>=20
> Why is a 64-bit BAR required when you size only the low 32 bits?

xHCI spec says the first BAR is required to be 64-bit, so I'm checking
this assumption to handle just this one case. But then, the size is 64K
in practice (and xue_sys_map_xhc() checks for that), so just 32 bits are
enough. Anyway, I can add sizing the whole thing, for consistency.

> Also you need to disable memory decoding around this (and
> somewhere you also need to explicitly enable it, assuming here
> you would afterwards restore the original value of the command
> register).=20

Actually, this is a good place to enable memory decoding.

> Further you're still open-coding
> PCI_BASE_ADDRESS_MEM_MASK here.
>=20
> > +/**
> > + * The first register of the debug capability is found by traversing t=
he
> > + * host controller's capability list (xcap) until a capability
> > + * with ID =3D 0xA is found. The xHCI capability list begins at address
> > + * mmio + (HCCPARAMS1[31:16] << 2)
> > + */
> > +static struct xue_dbc_reg *xue_find_dbc(struct xue *xue)
> > +{
> > +    uint32_t *xcap;
> > +    uint32_t next;
> > +    uint32_t id;
> > +    uint8_t *mmio =3D (uint8_t *)xue->xhc_mmio;
> > +    uint32_t *hccp1 =3D (uint32_t *)(mmio + 0x10);
> > +    const uint32_t DBC_ID =3D 0xA;
> > +
> > +    /**
> > +     * Paranoid check against a zero value. The spec mandates that
> > +     * at least one "supported protocol" capability must be implemente=
d,
> > +     * so this should always be false.
> > +     */
> > +    if ( (*hccp1 & 0xFFFF0000) =3D=3D 0 )
> > +        return NULL;
> > +
> > +    xcap =3D (uint32_t *)(mmio + (((*hccp1 & 0xFFFF0000) >> 16) << 2));
>=20
> Why not either
>=20
>     xcap =3D (uint32_t *)(mmio + ((*hccp1 >> 16) << 2));
>=20
> or
>=20
>     xcap =3D (uint32_t *)(mmio + ((*hccp1 & 0xFFFF0000) >> 14));
>=20
> ?

Ok.

> > +    next =3D (*xcap & 0xFF00) >> 8;
> > +    id =3D *xcap & 0xFF;
> > +
> > +    /**
> > +     * Table 7-1 states that 'next' is relative to
> > +     * the current value of xcap and is a dword offset.
> > +     */
> > +    while ( id !=3D DBC_ID && next ) {
>=20
> Nit: Brace placement.
>=20
> > +        xcap +=3D next;
> > +        id =3D *xcap & 0xFF;
> > +        next =3D (*xcap & 0xFF00) >> 8;
> > +    }
>=20
> Is this loop guaranteed to terminate? See drivers/pci/pci.c where
> circular chains are being dealt with in a similar situation.

Proper device shouldn't have circular chains here, but yes, adding
protection against this is a good idea.

> > +/* Initialize the DbC info with USB string descriptor addresses */
> > +static void xue_init_strings(struct xue *xue, uint32_t *info)
> > +{
> > +    uint64_t *sda;
> > +
> > +    /* clang-format off */
>=20
> What's this?
>=20
> > +    const char strings[] =3D {
>=20
> static?
>=20
> > +        6,  3, 9, 0, 4, 0,
> > +        8,  3, 'A', 0, 'I', 0, 'S', 0,
> > +        30, 3, 'X', 0, 'u', 0, 'e', 0, ' ', 0,
> > +               'D', 0, 'b', 0, 'C', 0, ' ', 0,
> > +               'D', 0, 'e', 0, 'v', 0, 'i', 0, 'c', 0, 'e', 0,
> > +        4, 3, '0', 0
> > +    };
> > +    /* clang-format on */
> > +
> > +    memcpy(xue->dbc_str, strings, sizeof(strings));
>=20
> Can't you simply assign to xue->dbc_str? I don't see this being used
> elsewhere, so it might even be possible to omit the field altogether
> (and with it the str_buf static variable consuming an entire page).

That is an option, but honestly (as you note below), there is a bit too
much magic here.

> > +    sda =3D (uint64_t *)&info[0];
> > +    sda[0] =3D virt_to_maddr(xue->dbc_str);
> > +    sda[1] =3D sda[0] + 6;
> > +    sda[2] =3D sda[0] + 6 + 8;
> > +    sda[3] =3D sda[0] + 6 + 8 + 30;
> > +    info[8] =3D (4 << 24) | (30 << 16) | (8 << 8) | 6;
>=20
> Wow, magic numbers. And, apparently, some used several times.

I think I can make this whole string table init a bit clearer (at a
negligible higher runtime cost).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Up8UBq8qqDpu2mBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVOdMACgkQ24/THMrX
1yzH/ggAiMyT1/hzBWzPSpsJDxVXO6+MhtCv6pOaZ4cGRoojehKs9Cz/nKfylaMC
oEuR+NcTG8UADvOXr1PsK9thKTNNFE8Ci5MA47/aQ8I+ZR0bgHwzixSrib/VADvU
aRE/UGpbKtHKGin5f/21DhNfZg87Klof1VCysVCDd5dEJI8L80BkAjEFq01IlkT2
SMJwwsP7zywJyGkmwdTcK8x5ery6lUpVU4voWJugdvTd7tSbyvKgeoHYUPWd+2rl
xxjUebI7OFVO8E9gR7st+jg+QEfqlOCHyhZBZrRXcCR6GnE2xTa5x6eNIGcn4U/P
oMtKlhnZG1rsxx8AWv26nSG8Lr5m6A==
=Rss7
-----END PGP SIGNATURE-----

--Up8UBq8qqDpu2mBW--

