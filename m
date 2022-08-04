Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDF589CFE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380414.614552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJb8G-0003RY-A1; Thu, 04 Aug 2022 13:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380414.614552; Thu, 04 Aug 2022 13:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJb8G-0003Ot-5p; Thu, 04 Aug 2022 13:43:24 +0000
Received: by outflank-mailman (input) for mailman id 380414;
 Thu, 04 Aug 2022 13:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGyI=YI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJb8E-0003Ok-9P
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:43:22 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64366558-13fb-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 15:43:18 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6196A5C00BC;
 Thu,  4 Aug 2022 09:43:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 04 Aug 2022 09:43:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 09:43:13 -0400 (EDT)
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
X-Inumbo-ID: 64366558-13fb-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659620595; x=
	1659706995; bh=JH+4zo2qcCvINb3gN4LPh4tkWxvaN2tRfcaf+e0qFas=; b=H
	198Y0CCN5OPJ/MoQ8/Gli85n+RujTBhOSaQ0IE5Fc/RiFlCXt6lcR6PXjprCPCrI
	ttciSyxSN+IuBv5753DfB7HqhYlPXP71qWmi/UGxM35mkLGuaTdXW6QB7i+GLeui
	x6NjDEwrxbmYtgRbCj2gptFB5IEWcPBMLoYekFu37OrnqL1bSpRauh3BzMxhtsyA
	i+nW2zT8pwcUvTAyGflPmrZq5ELuQzYGZF5d9zaSyRqifAAgMTcSGOmUXgV0BDTl
	7H35PYvOZAPwxkmkj0/NEMQqzuG4nk9x6aIZO7Sv6mETJ9i/uWA0FrGLICwEgyQz
	gffKs8FDTHhs+eR8mrZsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659620595; x=1659706995; bh=JH+4zo2qcCvINb3gN4LPh4tkWxva
	N2tRfcaf+e0qFas=; b=QFUgaOfeIfkhUVfMcbhI5gsr7HoQzVHU9rjUXiLrXMUQ
	n4pn5Ojtz3UE72/+0kSdkyu3IYvCDBqAcWkTr8/xgrPTTWBEP7t5usQQTR1TyAA5
	SAGAtkXmqpf2W3aicQRN0mdn1KcMe1I2Wr5MrrJ4lzDJIK9NlznalRMeKHpyOMzF
	A8qQ9oPPtz8cju5r7a5icn9O5dhmf8WGAmi6ZncFG9OMJ4o57V3Dp/La/EwRHBW8
	MUfRUMKWGeU7EulnrNDidFwyI0PsXrEGEJcqZvDCYUe9arUSzR0dGXAeulHcV3BC
	JBMjfZ14sIkCe2JwwqTnOM2GjXkZ9w9E34AbL1mhjA==
X-ME-Sender: <xms:88zrYpcgaeGydwFcc2XaL9uScu-0ccg8_uF_Zy4Rg7E0rNjcpurxKA>
    <xme:88zrYnOmNLLP9fI9yW0Lch1AEb9Z178vryisnQRLR4m0lmFYlc7M8fF6yad9W1lP7
    YXosDaokfZORg>
X-ME-Received: <xmr:88zrYiiJWlHLtEuLHwsYZDoLkIQyJ4PmeUJf06N2nTDINDmLEmt9OZYXPCvrr1UfLzf1Mm5yvj6W5KXHyTW76UFyYg3BFX5pGCBJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:88zrYi_CiWD5nEYu9VrrybVFJtwaEoRcwIfa1E4cJcSKY-0tc56LMw>
    <xmx:88zrYlusteCSKO0J-fz2e8n9kQquPmWu3zDFT1tCKo0tsFioVXSkgQ>
    <xmx:88zrYhHB_jRJ5eO_OcIf8Dy2XAH-j8t8I6Avgomdbj__dg2nrgic_A>
    <xmx:88zrYjXMAyQnH9dYDG-KCnznx0JAmtDVjIn-voA2uRRb3dlJ0G4d6g>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Aug 2022 15:43:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Message-ID: <YuvM7vElH/IdBJjq@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nk1fkjOg/PvuRQA1"
Content-Disposition: inline
In-Reply-To: <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com>


--nk1fkjOg/PvuRQA1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Aug 2022 15:43:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger

On Thu, Aug 04, 2022 at 02:57:49PM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > +/* Defines the size in bytes of TRB rings as 2^DBC_TRB_RING_ORDER * 40=
96 */
> > +#ifndef DBC_TRB_RING_ORDER
> > +#define DBC_TRB_RING_ORDER 4
> > +#endif
> > +#define DBC_TRB_RING_CAP (DBC_TRB_PER_PAGE * (1 << DBC_TRB_RING_ORDER))
>=20
> I have to admit that I'm always puzzled when seeing such - why not
>=20
> #define DBC_TRB_RING_CAP (DBC_TRB_PER_PAGE << DBC_TRB_RING_ORDER)
>=20
> ?

I think the former is a bit more clear what's the actual size, but the
end result is the same, I can change that.

> > +struct dbc {
> > +    struct dbc_reg __iomem *dbc_reg;
> > +    struct xhci_dbc_ctx *dbc_ctx;
> > +    struct xhci_erst_segment *dbc_erst;
> > +    struct xhci_trb_ring dbc_ering;
> > +    struct xhci_trb_ring dbc_oring;
> > +    struct xhci_trb_ring dbc_iring;
> > +    struct dbc_work_ring dbc_owork;
> > +    struct xhci_string_descriptor *dbc_str;
>=20
> I'm afraid I still don't see why the static page this field is being
> initialized with is necessary. Can't you have a static variable (of
> some struct type) all pre-filled at build time, which you then apply
> virt_to_maddr() to in order to fill the respective dbc_ctx fields?

I need to keep this structure somewhere DMA-reachable for the device (as
in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
also, patch 8/10 is putting it together with other DMA-reachable
structures (not a separate page on its own). If I'd make it a separate
static variable (not part of that later struct), I'd need to reserve the
whole page for it - to guarantee no unrelated data lives on the same
(DMA-reachable) page.

As for statically initializing it, if would require the whole
(multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
binary (not a huge concern due to compression, but still). But more
importantly, I don't know how to do it in a readable way, and you have
complained about readability of initializer of this structure in v2.

> That struct will be quite a bit less than a page's worth in size.

See above - it cannot share page with unrelated Xen data.

> If you build the file with -fshort-wchar, you may even be able to
> use easy to read string literals for the initializer.

I can try, but I'm not exactly sure how to make readable UTF-16
literals...

> > +static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
> > +{
> > +    size_t i;
> > +
> > +    if ( size !=3D MAX_XHCI_PAGES * DBC_PAGE_SIZE )
> > +        return NULL;
> > +
> > +    for ( i =3D FIX_XHCI_END; i >=3D FIX_XHCI_BEGIN; i-- )
> > +    {
> > +        set_fixmap_nocache(i, phys);
> > +        phys +=3D DBC_PAGE_SIZE;
>=20
> While there may be an assumption of DBC_PAGE_SIZE =3D=3D PAGE_SIZE, the
> constant used here clearly needs to be PAGE_SIZE, as that's the unit
> set_fixmap_nocache() deals with.

Ok.

> > +static bool __init dbc_init_xhc(struct dbc *dbc)
> > +{
> > +    uint32_t bar0;
> > +    uint64_t bar1;
> > +    uint64_t bar_size;
> > +    uint64_t devfn;
> > +    uint16_t cmd;
> > +    size_t xhc_mmio_size;
> > +
> > +    /*
> > +     * Search PCI bus 0 for the xHC. All the host controllers supporte=
d so far
> > +     * are part of the chipset and are on bus 0.
> > +     */
> > +    for ( devfn =3D 0; devfn < 256; devfn++ )
> > +    {
> > +        pci_sbdf_t sbdf =3D PCI_SBDF(0, 0, devfn);
> > +        uint8_t hdr =3D pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> > +
> > +        if ( hdr =3D=3D 0 || hdr =3D=3D 0x80 )
> > +        {
> > +            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) =3D=
=3D DBC_XHC_CLASSC )
> > +            {
> > +                dbc->sbdf =3D sbdf;
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> > +    if ( !dbc->sbdf.sbdf )
> > +    {
> > +        dbc_error("Compatible xHC not found on bus 0\n");
> > +        return false;
> > +    }
> > +
> > +    /* ...we found it, so parse the BAR and map the registers */
> > +    bar0 =3D pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
> > +    bar1 =3D pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1);
> > +
> > +    /* IO BARs not allowed; BAR must be 64-bit */
> > +    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) !=3D PCI_BASE_ADDRESS_SPACE_M=
EMORY ||
> > +         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) !=3D PCI_BASE_ADDRESS=
_MEM_TYPE_64 )
> > +        return false;
> > +
> > +    cmd =3D pci_conf_read16(dbc->sbdf, PCI_COMMAND);
> > +    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY=
);
> > +
> > +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
> > +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, 0xFFFFFFFF);
> > +    bar_size =3D pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
> > +    bar_size |=3D (uint64_t)pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRES=
S_1) << 32;
> > +    xhc_mmio_size =3D ~(bar_size & PCI_BASE_ADDRESS_MEM_MASK) + 1;
> > +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, bar0);
> > +    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, bar1);
> > +
> > +    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
> > +
> > +    dbc->xhc_mmio_phys =3D (bar0 & PCI_BASE_ADDRESS_MEM_MASK) | (bar1 =
<< 32);
> > +    dbc->xhc_mmio =3D dbc_sys_map_xhc(dbc->xhc_mmio_phys, xhc_mmio_siz=
e);
>=20
> Before actually using the address to map the MMIO you will want to make
> somewhat sure firmware did initialize it: The EHCI driver checks for
> all zeroes or all ones in the writable bits.

Ok.

>=20
> > +/**
> > + * The first register of the debug capability is found by traversing t=
he
> > + * host controller's capability list (xcap) until a capability
> > + * with ID =3D 0xA is found. The xHCI capability list begins at address
> > + * mmio + (HCCPARAMS1[31:16] << 2).
> > + */
> > +static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
> > +{
> > +    uint32_t *xcap;
>=20
> const?
>=20
> > +    uint32_t xcap_val;
> > +    uint32_t next;
> > +    uint32_t id =3D 0;
> > +    uint8_t *mmio =3D (uint8_t *)dbc->xhc_mmio;
>=20
> Can't this be const void * (and probably wants to also use __iomem),
> avoiding the cast here, ...
>=20
> > +    uint32_t *hccp1 =3D (uint32_t *)(mmio + 0x10);
>=20
> ... here, ...
>=20
> > +    const uint32_t DBC_ID =3D 0xA;
> > +    int ttl =3D 48;
> > +
> > +    xcap =3D (uint32_t *)dbc->xhc_mmio;
>=20
> ... and here (if actually using the local variable you've got).

Ok.

> > +/*
> > + * Note that if IN transfer support is added, then this
> > + * will need to be changed; it assumes an OUT transfer ring only
> > + */
>=20
> Hmm, is this comment telling me that this driver is an output-only one?

At this point, yes. Input support is added in patch 10/10.

> Or is it simply that input doesn't use this code path?
>=20
> > +static void dbc_init_string_single(struct xhci_string_descriptor *stri=
ng,
> > +                                   char *ascii_str,
>=20
> If this function has to survive, then const please here and ...
>=20
> > +                                   uint64_t *str_ptr,
> > +                                   uint8_t *str_size_ptr)
> > +{
> > +    size_t i, len =3D strlen(ascii_str);
> > +
> > +    string->size =3D offsetof(typeof(*string), string) + len * 2;
> > +    string->type =3D XHCI_DT_STRING;
> > +    /* ASCII to UTF16 conversion */
> > +    for (i =3D 0; i < len; i++)
>=20
> ... this missing blanks added here.

Ok.

> > +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_erst_segment erst __aligned(64);
> > +static struct xhci_dbc_ctx ctx __aligned(64);
> > +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> > +static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> > +static char __initdata opt_dbgp[30];
> > +
> > +string_param("dbgp", opt_dbgp);
>=20
> This duplicates what ehci-dbgp.c already has. I guess we can live with
> it for now and de-duplicate later, but it's still a little odd. In any
> even please move the blank line up be a line, so that string_param()
> and its referenced array are kept together.
>=20
> > +void __init xhci_dbc_uart_init(void)
> > +{
> > +    struct dbc_uart *uart =3D &dbc_uart;
> > +    struct dbc *dbc =3D &uart->dbc;
> > +
> > +    if ( strncmp(opt_dbgp, "xhci", 4) )
> > +        return;
> > +
> > +    memset(dbc, 0, sizeof(*dbc));
>=20
> Why? dbc_uart is a static variable, and hence already zero-initialized.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nk1fkjOg/PvuRQA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLrzO4ACgkQ24/THMrX
1yw01wgAgoD5t7ncCjs6WqA/wjy/xIA76/8Ms6ngLDd/xNxPQcgoM+C9ORGIGrGi
nPgUtcWzZTud/m+Ll15iqzvvP3FgiYUJIvnsI2wdZV3eKXTzpOziXFpCGnFDOeyM
Q35DQj04gRqA+8LbWDKJZ974sZqVSR4uK4Sj+LgCRGz+VaTJ4qCsjkGLtovgK2Me
dQIWuJftt74oqjEn89+XQkkz72c0q4I7gURiyT0xO7Lo3M5PvjQWs14cltx8ErdP
Pb5+9PvhGgAUG4rtVm01uM2ipvEYHlOSWmT691I9kXa+Sjllpwv62U8eZEc5Xbjy
JarhD9Ylk0jmqQNVYYY/CFxaQwB3MA==
=EF02
-----END PGP SIGNATURE-----

--nk1fkjOg/PvuRQA1--

