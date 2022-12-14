Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7E64C957
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 13:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462185.720361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RII-0001qP-Lq; Wed, 14 Dec 2022 12:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462185.720361; Wed, 14 Dec 2022 12:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RII-0001oa-I7; Wed, 14 Dec 2022 12:55:30 +0000
Received: by outflank-mailman (input) for mailman id 462185;
 Wed, 14 Dec 2022 12:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTin=4M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p5RIG-0001oU-Nt
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 12:55:29 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938bb8c0-7bae-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 13:55:26 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B3975C0138;
 Wed, 14 Dec 2022 07:55:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Dec 2022 07:55:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 07:55:21 -0500 (EST)
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
X-Inumbo-ID: 938bb8c0-7bae-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1671022524; x=
	1671108924; bh=erz5Eg3lahj4nJyJfFHnrhEfB1Rx6p+vybp0T8Zf+0E=; b=i
	Qwsu9H52ahuOMD1vHvKd//D2WqD6gXp+nKZn1jrVakXarRUx9aKh+lDQ3yY1CrYR
	3dsEmICMYnZjhBThDegQFM2gxyZkK6OSZ834Q/PMz7gTKaiIkxUI3zW2uI7fMs+T
	wkTw90lgeq+DwR+/qmRPFMUs3ZpixUJUO6f0lVE+WGRhSqS9BFrZoy+/8CWlC1Fw
	6G2h6K+THk4eDL+UXE2knVXQMpRB32/Up/eA45GicPZis044mJSfR8Y9ubsj5azH
	MpILbJc3RvQRylUbDOWfiLwLh5B6xE3Jvedpvlz4YRQZzliKAiWHdRXEHdAm7AvQ
	565LF9+KMRxjS3R5KMA/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671022524; x=1671108924; bh=erz5Eg3lahj4nJyJfFHnrhEfB1Rx
	6p+vybp0T8Zf+0E=; b=YJSUdwohjncF06QHG5PxpZCTvlhnJ7e/iE5jwyV7NPnt
	z1/thB4e1e2FGsB55ae1/CwYhDD5v433jNURa7ycJqST6rbbhCCIyTv0vFmyNoMH
	Nr33fjX51Gd0jBqe7fxL7nEZnWpMPOtdNcyOlFlfPEYdRsP/z7dAGX0w1ogwrpgA
	pikm6gSwlZ3eVDwsecUZDuX3x+OR9foCLPXcKATIpBk2mDTz9+Eo3M5mobPYE5fk
	afR5P7tBMA+iPkjnykbKOg/VlKFz8t//m99B36W4Mdx3b81HtCYVtZanIgHgDRZR
	IsA54vO9u95gAzE/e9nOku5L4S1ZnrCPV5oxGZ0D/Q==
X-ME-Sender: <xms:vMeZY2O3Pe6RN8YeQFFcnhLc41AGNikh2oEBnUg_5y07O3aX764DMw>
    <xme:vMeZY08jRBTXu2scL9pvIZbO9dekLu_Vdto1rzkGbGnr1HGfwr6SK49TwU9dhK5XJ
    jRnKq5sP3OFPA>
X-ME-Received: <xmr:vMeZY9Ra8N42tK8exXhhAw2gHzraMU4DQG0-o3FZI4k0u7TlqbeqYT0mVnYD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:vMeZY2uQRLZBMeEP2qIXqQE5mpjhQyqpUNbHA42Bw9eXRUhKZB2zFg>
    <xmx:vMeZY-dj2V1ct9eU6VleTpobwDCLmWfLaF0j5_xcUQ48WrtMujK3cA>
    <xmx:vMeZY62vKzHnwvdX0U56CyXCyh2gu_bosU-GbGTt38-8lj6MNYE8rg>
    <xmx:vMeZY94RMAx1vTUw0QliMDHXBwMsk3HTa4YZrSeHsYx0al3QiuTagA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 Dec 2022 13:55:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 2/3] drivers/char: search all buses for xhci
Message-ID: <Y5nHt7PGbeBWEOfs@mail-itl>
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
 <34d3e4e4067b86183e6d834c8bc93736f058fe19.1670724490.git-series.marmarek@invisiblethingslab.com>
 <f447c631-720d-0ac0-2f26-21fee800b948@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZIIp5QYUX65rD9D7"
Content-Disposition: inline
In-Reply-To: <f447c631-720d-0ac0-2f26-21fee800b948@suse.com>


--ZIIp5QYUX65rD9D7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Dec 2022 13:55:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 2/3] drivers/char: search all buses for xhci

On Wed, Dec 14, 2022 at 11:51:31AM +0100, Jan Beulich wrote:
> On 11.12.2022 03:10, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -286,39 +286,87 @@ static void *dbc_sys_map_xhc(uint64_t phys, size_=
t size)
> >      return fix_to_virt(FIX_XHCI_END);
> >  }
> > =20
> > +static void xhci_bios_handoff(struct dbc *dbc)
> > +{
> > +    const uint32_t __iomem *xcap;
> > +    uint32_t xcap_val;
> > +    uint32_t next;
> > +    uint32_t id =3D 0;
> > +    const void __iomem *mmio =3D dbc->xhc_mmio;
> > +    const uint32_t __iomem *hccp1 =3D mmio + 0x10;
> > +    const uint32_t LEGACY_ID =3D 0x1;
> > +    int ttl =3D 48;
> > +    int timeout =3D 10000;
> > +
> > +    xcap =3D mmio;
> > +    /*
> > +     * This is initially an offset to the first capability. All the of=
fsets
> > +     * (both in HCCP1 and then next capability pointer) are dword-base=
d.
> > +     */
> > +    next =3D (readl(hccp1) & 0xFFFF0000) >> 16;
> > +
> > +    while ( id !=3D LEGACY_ID && next && ttl-- )
> > +    {
> > +        xcap +=3D next;
> > +        xcap_val =3D readl(xcap);
> > +        id =3D xcap_val & 0xFF;
> > +        next =3D (xcap_val & 0xFF00) >> 8;
> > +    }
> > +
> > +    if ( id !=3D LEGACY_ID )
> > +        return;
> > +
> > +    xcap_val =3D readl(xcap);
> > +#define XHCI_HC_BIOS_OWNED (1U << 16)
> > +#define XHCI_HC_OS_OWNED (1U << 24)
> > +    if (xcap_val & XHCI_HC_BIOS_OWNED) {
> > +        dbc_error("bios owned\n");
> > +        writeb(1, (uint8_t*)xcap + 3);
> > +        while ((readl(xcap) & (XHCI_HC_BIOS_OWNED | XHCI_HC_OS_OWNED))=
 !=3D XHCI_HC_OS_OWNED)
> > +        {
> > +            cpu_relax();
> > +            if (!--timeout)
> > +                break;
> > +        }
> > +        if (!timeout)
> > +            dbc_error("handoff timeout\n");
> > +        xcap_val =3D readl(xcap + 1);
> > +        xcap_val &=3D ((0x7 << 1) + (0xff << 5) + (0x7 << 17)); // XHC=
I_LEGACY_DISABLE_SMI
> > +        xcap_val |=3D (0x7 << 29); // XHCI_LEGACY_SMI_EVENTS
> > +        writel(xcap_val, xcap + 1);
> > +    }
> > +}
> > +
>=20
> Unused new function (introducing a build failure at this point of the ser=
ies)?

Oh, sorry, it wasn't supposed to be included in this patch.

> >  static bool __init dbc_init_xhc(struct dbc *dbc)
> >  {
> >      uint32_t bar0;
> >      uint64_t bar1;
> >      uint64_t bar_val;
> >      uint64_t bar_size;
> > -    uint64_t devfn;
> > +    unsigned int bus, devfn;
> >      uint16_t cmd;
> >      size_t xhc_mmio_size;
> > =20
> >      if ( dbc->sbdf.sbdf =3D=3D 0 )
> >      {
> > -        /*
> > -         * Search PCI bus 0 for the xHC. All the host controllers supp=
orted so
> > -         * far are part of the chipset and are on bus 0.
> > -         */
> > -        for ( devfn =3D 0; devfn < 256; devfn++ )
> > -        {
> > -            pci_sbdf_t sbdf =3D PCI_SBDF(0, 0, devfn);
> > -            uint8_t hdr =3D pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> > -
> > -            if ( hdr =3D=3D 0 || hdr =3D=3D 0x80 )
> > +        for ( bus =3D 0; bus < 0x100; bus++ )
>=20
> Hex here and ...
>=20
> > +            for ( devfn =3D 0; devfn < 256; devfn++ )
>=20
> ... dec here looks odd. Now that you want to fully iterate segment 0,
> may I suggest to move the function closer to ehci-dbgp.c:find_dbgp(),
> making use of pci_device_detect() and iterating over busses, slots,
> and functions separately?

Ok, will look into it.

But still, this all is not enough to get it working on AMD, so I'd wait
with v2 until it starts being functional.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZIIp5QYUX65rD9D7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOZx7cACgkQ24/THMrX
1yzoKQf8DyB8s77UViGZlp4Qsy2RkxjahcXGHdvTYsYu7tI7KDqtNBz27sBkRD8b
jJslnKMBM0BpvdlMkr8yEITvZxoP3T4C0j0rlrvRu6A3pflBwNx9GEMi/fZ/a/Xp
xK/pmVZb/jsBGHkDPVbscpjXEq1WNVGbPZCcRaF+wqErkkWpvtk1DN6aPfEWnNKH
fwQVvcOw1l0/OFZRM+zUk+IghEGzX2dIgmtdynsKtlPHH2uVE5OzEMt7lvAsT+Dt
OW/rfZMPgJmKVWF8BEpTi57jUGlfiULXNZ9lQZlWIZlrzeYauDVphpQFwDMdYuUH
BbHOhiq9QhjfRN8Z0CMjLr+u665rLw==
=GsmY
-----END PGP SIGNATURE-----

--ZIIp5QYUX65rD9D7--

