Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6305972E5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 17:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389070.625886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKxb-0001CH-Qm; Wed, 17 Aug 2022 15:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389070.625886; Wed, 17 Aug 2022 15:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOKxb-00018m-Mo; Wed, 17 Aug 2022 15:27:59 +0000
Received: by outflank-mailman (input) for mailman id 389070;
 Wed, 17 Aug 2022 15:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Di75=YV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oOKxZ-00012D-35
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 15:27:57 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29c72b84-1e41-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 17:27:55 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B3F43320095D;
 Wed, 17 Aug 2022 11:27:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Aug 2022 11:27:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 11:27:50 -0400 (EDT)
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
X-Inumbo-ID: 29c72b84-1e41-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1660750072; x=
	1660836472; bh=/phj973pQy9PADy4yrfTn9/lln+0IgCl4wIlRpnRngo=; b=t
	Thf72vMG5gRMutkRt8KAsLsCwUkE9vgwf3YqVh7KjfuEzZz6CKoAIS2CbOZKYtvF
	g8R7VyzcNom+iZwDQRZVD5RftsZayAoHX0iVSyi6B0WD2qZsIlZj+M1oWEmyxqiZ
	0LUn/DHLKcprx814eUgryupakRiV1sEwJVkaaQOso27J/bxzEzsHkRwCPj47gaq9
	kA6QIzMM6btEImk6+agpDfqWkRy8lPPx9eV9zvjybs8PFKVNvaI2W8vwI6Znq5fy
	3a34nKJdOFh2ISyEE+B0cLQ/VM6CL0lpR6r/FL380n/AOk3AU6z+xJKCqJQLeFMT
	5QgBd0TgvT6jg502yqx3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660750072; x=1660836472; bh=/phj973pQy9PADy4yrfTn9/lln+0
	IgCl4wIlRpnRngo=; b=lNW8A6ob9iaHPl13jN77IvkH/BJZ+uubDZVNQ6FRozRI
	uapH2+AvTkjO+Qni8HXU9b3wsH3978hFnCUHvnvqg8d/LcwPPC60DUw2lbJL/VDf
	GQIkdQdclyoX7cE7FER9a0WXrIobeeeejXvxDn7hio2rq5vHc8OD2KqY7sgL4o5u
	aiinsb+xL38ug8hZeJGADo4T5IeOCUpHJ0abGhux3gbOtDBdXVG1GA9ldNTrLqO0
	QwlnaG47Gd5AmuAfRwcH9y2cji3PHlTxf8v+29t0uwjKsqH7fqYgM1nS1GKvsfhr
	Rz3CUoznHxP6b/nrKaipDB+udxQQ51VtJdF6tiAA3w==
X-ME-Sender: <xms:9wj9YoOZIpB7JTCUn61Avr-vsFYUAXKQcQWhITanlaU_MPqFJR5vdg>
    <xme:9wj9Yu8qYduS62Ava8TApYxg_ZS3DJFCeI3JaJXX8DKUrx4S_NuibIl7EQ12RaMAq
    995hnlbzvauxw>
X-ME-Received: <xmr:9wj9YvRZpoICXERB-boKqVJ99vHmXhrE4s4YeuYIA6_dK-1PERuGb4M9nMeirbaNlOMEng_Im-STVgJGQ_vaxMK6Cm9M2hI_0Zao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:9wj9YgvxeN_YowkF4ov3L9AbgCTfN2JBhpetges0nDM9HanqbMMGTA>
    <xmx:9wj9YgdIdsvfJEkRfB6UVKvHIQEIr8LFDeZMkm5xQn_RZMdx9EJkAg>
    <xmx:9wj9Yk2Rbd_7CIO-hTwPtn4MXAga_xgVGd74jGwdoHQx-hWEUsO0pQ>
    <xmx:-Aj9Yv7mTxCdYT09Ibeud6JMXSRlTvrpd_zodANu20i8x6cnFQ0w7Q>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 17 Aug 2022 17:27:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 11/11] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Message-ID: <Yv0I9L/a+xR199r1@mail-itl>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <403daba6911a3d40e4774b46ba555f6d76b3c249.1660354597.git-series.marmarek@invisiblethingslab.com>
 <141cb0d0-3563-1376-a6b0-a977142c1873@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nSMhtkCqUlOTccdf"
Content-Disposition: inline
In-Reply-To: <141cb0d0-3563-1376-a6b0-a977142c1873@suse.com>


--nSMhtkCqUlOTccdf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Aug 2022 17:27:47 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 11/11] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC

On Wed, Aug 17, 2022 at 05:08:35PM +0200, Jan Beulich wrote:
> On 13.08.2022 03:39, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
> > =20
> >  ### dbgp
> >  > `=3D ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> > -> `=3D xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
> > +> `=3D xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=3D<bool>|hwd=
om]`
> > =20
> >  Specify the USB controller to use, either by instance number (when goi=
ng
> >  over the PCI busses sequentially) or by PCI device (must be on segment=
 0).
> > @@ -732,6 +732,19 @@ over the PCI busses sequentially) or by PCI device=
 (must be on segment 0).
> >  Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability.
> >  XHCI driver will wait indefinitely for the debug host to connect - make
> >  sure the cable is connected.
> > +The `share` option for xhci controls who else can use the controller:
> > +* `no`: use the controller exclusively for console, even hardware doma=
in
> > +  (dom0) cannot use it
> > +* `hwdom`: hardware domain may use the controller too, ports not used =
for debug
> > +  console will be available for normal devices; this is the default
> > +* `yes`: the controller can be assigned to any domain; it is not safe =
to assign
> > +  the controller to untrusted domain
> > +
> > +Choosing `share=3Dhwdom` (the default) or `share=3Dno` allows a domain=
 to reset the
>=20
> DYM "... or `share=3Dyes` ..." here?

Yes.

> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -23,6 +23,7 @@
> >  #include <xen/iommu.h>
> >  #include <xen/mm.h>
> >  #include <xen/param.h>
> > +#include <xen/rangeset.h>
> >  #include <xen/serial.h>
> >  #include <xen/timer.h>
> >  #include <xen/types.h>
> > @@ -232,6 +233,14 @@ struct dbc_work_ring {
> >      uint64_t dma;
> >  };
> > =20
> > +enum xhci_share {
> > +    XHCI_SHARE_NONE =3D 0,
> > +#ifdef CONFIG_XHCI_SHARE
> > +    XHCI_SHARE_HWDOM,
> > +    XHCI_SHARE_ANY
> > +#endif
> > +};
>=20
> Hmm, this suggests that Dom0 cannot use the controller without the Kconfig
> enabled, which I hope is not the case.=20

It is the case, because you requested reset quirk to be behind
"experimental" tag in kconfig. This quirk is (currently) necessary even
if just dom0 uses the controller.
I'm happy to include the quirk by default, but I got impression you
wouldn't accept it. And I'd rather avoid marking the whole driver as
"experimental" (which hides it unless you select UNSUPPORTED) just
because of a small code necessary to share it with dom0.

> But I notice that patch 1, which
> was committed already, still uses pci_ro_device() rather than
> pci_hide_device() (like ehci-dbgp.c does).

>=20
> > @@ -1128,10 +1181,34 @@ static void __init cf_check dbc_uart_init_posti=
rq(struct serial_port *port)
> >      init_timer(&uart->timer, dbc_uart_poll, port, 0);
> >      set_timer(&uart->timer, NOW() + MILLISECS(1));
> > =20
> > -    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> > -        printk(XENLOG_WARNING
> > -               "Failed to mark read-only %pp used for XHCI console\n",
> > -               &uart->dbc.sbdf);
> > +    switch ( uart->dbc.share )
> > +    {
> > +    case XHCI_SHARE_NONE:
> > +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn=
) )
> > +            printk(XENLOG_WARNING
> > +                   "Failed to mark read-only %pp used for XHCI console=
\n",
> > +                   &uart->dbc.sbdf);
> > +        break;
> > +#ifdef CONFIG_XHCI_SHARE
> > +    case XHCI_SHARE_HWDOM:
> > +        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.dev=
fn) )
> > +            printk(XENLOG_WARNING
> > +                   "Failed to hide %pp used for XHCI console\n",
> > +                   &uart->dbc.sbdf);
> > +        break;
> > +    case XHCI_SHARE_ANY:
> > +        /* Do not hide. */
> > +        break;
> > +#endif
> > +    }
> > +#ifdef CONFIG_X86
> > +    if ( rangeset_add_range(mmio_ro_ranges,
> > +                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_o=
ffset),
> > +                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_off=
set +
> > +                       sizeof(*uart->dbc.dbc_reg)) - 1) )
> > +        printk(XENLOG_INFO
> > +               "Error while adding MMIO range of device to mmio_ro_ran=
ges\n");
> > +#endif
>=20
> I did comment on this last part before. There very minimum that I'd expect
> to appear here is a comment as to the issue with other elements living on
> the same page which a domain's driver may actually find a need to write t=
o.
> As said before - as soon as such a report would surface, we'd likely need
> to add write emulation support for the leading/traling parts of the page(=
s)
> that Xen doesn't use itself.

I did included paragraph in the commit message:
| In any case, to avoid Linux messing with the DbC, mark this MMIO area as
| read-only. This might cause issues for Linux's driver (if it tries to
| write something on the same page - like anoter xcap), but makes Xen's
| use safe. In practice, as of Linux 5.18, it seems to work without
| issues.

Do you want this as a code comment too?

> > @@ -1202,13 +1279,18 @@ void __init xhci_dbc_uart_init(void)
> >  {
> >      struct dbc_uart *uart =3D &dbc_uart;
> >      struct dbc *dbc =3D &uart->dbc;
> > -    const char *e;
> > +    const char *e, *opt;
> > =20
> >      if ( strncmp(opt_dbgp, "xhci", 4) )
> >          return;
> > =20
> >      memset(dbc, 0, sizeof(*dbc));
> > =20
> > +#ifdef CONFIG_XHCI_SHARE
> > +    dbc->share =3D XHCI_SHARE_HWDOM;
> > +#endif
>=20
> I think it would be best if the default value was "0"; I can see though
> that "NONE" being zero also makse sense, if the enum was to be used in
> boolean context (which afaics it currently isn't).
>=20
> > +    e =3D &opt_dbgp[4];
> >      if ( isdigit(opt_dbgp[4]) )
> >      {
> >          dbc->xhc_num =3D simple_strtoul(opt_dbgp + 4, &e, 10);
> > @@ -1218,7 +1300,7 @@ void __init xhci_dbc_uart_init(void)
> >          unsigned int bus, slot, func;
> > =20
> >          e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> > -        if ( !e || *e )
> > +        if ( !e || (*e && *e !=3D ',') )
> >          {
> >              printk(XENLOG_ERR
> >                     "Invalid dbgp=3D PCI device spec: '%s'\n",
> > @@ -1228,6 +1310,41 @@ void __init xhci_dbc_uart_init(void)
> > =20
> >          dbc->sbdf =3D PCI_SBDF(0, bus, slot, func);
> >      }
> > +    opt =3D e;
> > +
> > +#ifdef CONFIG_XHCI_SHARE
> > +    /* other options */
> > +    while ( *opt =3D=3D ',' )
> > +    {
> > +        opt++;
> > +        e =3D strchr(opt, ',');
> > +        if ( !e )
> > +            e =3D strchr(opt, '\0');
> > +
> > +        if ( !strncmp(opt, "share=3D", 6) )
> > +        {
> > +            int val =3D parse_bool(opt + 6, e);
> > +            if ( val =3D=3D -1 && !cmdline_strcmp(opt + 6, "hwdom") )
>=20
> Nit: Blank line please between declaration(s) and statement(s).
>=20
> Any reason you're using parse_bool() and not parse_boolean() here?
> That would save you the open-coded strncmp() afaict.

I can probably use parse_boolean() too, but then handling "hwdom"
variant would be a bit weird. I could skip 'share=3Dhwdom' parsing at all,
since that's default if the kconfig option is enabled, but I'm not sure
if that's a good idea.

> Finally a remark seeing the opt_dbgp use here and the identically
> named option in ehci-dbgp.c, taken together with your multiple-
> serial-consoles patch: Since the two option consumers are now
> different, they can't sensibly coexist anymore. There were issues
> already before - it doesn't seem to be possible this way to run
> EHCI and XHCI based consoles in parallel. (An exceptional case
> would be if <integer> for both was intended to be same number.)
> IOW I think one of the options needs renaming; it was a mistake of
> mine to not have pointed this out before committing patch 1.
> Following the name of the source file as well as e.g. the title
> here - maybe "dbc=3D"?

Yes, I can rename the option here. That requires also registering new
SERHND_* and inventing new value for console=3D parameter (implemented in
serial_parse_handle()). "dbc" there too?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nSMhtkCqUlOTccdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmL9CPMACgkQ24/THMrX
1yzL6Qf/WcUZKhQMD0fFXk7Hs2ZQiFvXP/oBGaqlGRHbP4rxU8uV7uQznI1JojQQ
Hrj+RW5dlyR+RTJDgbzy9Os0aAZqSKi9Y94LzNS6pc9I/NYWoTABOj6ltQSlv8EO
t2JX1dylfKAWMt0ily/5vGjeiR1ODA4bIrlWfGEQlxhmI7H6Q2y1UYY+rek+e6m8
UsAfB2CNM5YGlLIfbgh8ne0w9COm6ZmJqJqs25q8jnSOzIqDGE62682h8emBsooP
wD09k9AFEglHr6YeloE/WXMle346ir6JpbR+zSXNZzP9tu85AI9fXahPh7XENdm0
w2uJy2VsVRE51txQZQzJG8wtfAJS3w==
=uviS
-----END PGP SIGNATURE-----

--nSMhtkCqUlOTccdf--

