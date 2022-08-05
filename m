Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A1158AD7F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381383.616040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzaS-0002vV-2h; Fri, 05 Aug 2022 15:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381383.616040; Fri, 05 Aug 2022 15:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzaR-0002t8-V9; Fri, 05 Aug 2022 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 381383;
 Fri, 05 Aug 2022 15:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJzaQ-0002t2-3K
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 15:50:06 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44499257-14d6-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 17:50:03 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 367D13200942;
 Fri,  5 Aug 2022 11:50:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Aug 2022 11:50:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 11:49:58 -0400 (EDT)
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
X-Inumbo-ID: 44499257-14d6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659714599; x=
	1659800999; bh=Y17z3AMHco75C6mzY36PJmWyn+CLGKO7LtBoysDQTec=; b=d
	HUcA+/c4wdeIcnkgjGvA8d27YLsfL7+0zUiyDp/Gb+PQjOsdPVLZx/ZPOP6k4KkJ
	Rr2fh/5bHWyGj94EoZaR4Cvk2p1BVZmsLdKF06C4vJVeQrST47TclmKp9x+kYat8
	8ONedGFkBSx2nz27vkU7ygwybe7GiRKlrd14KVHPRfRKWeQE24Vqm7qswqputN+x
	w/MeTwKPq3NdbBu2ODeakPhjFqmnx+GKp3QPIgjc51uVz8NOlH20nez+BOiiKyYm
	LUCspvCQCV0KCmqVQmUvk9nPSKD3UM7VDNLOXEkCeXLX2N1lblutifp0POEwU5KY
	E2YBmXLPo/Er7lhNcH/PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659714599; x=1659800999; bh=Y17z3AMHco75C6mzY36PJmWyn+CL
	GKO7LtBoysDQTec=; b=OGWl9Gv1iyYvKa2RM5MzIYwqrobiZKnyMT+JHTXpD4FI
	dnMBiGV7WytP95ARcHBx2oKEM0xhuawzd/9WTJjZNlUCoZHayRc+ThIIcUkJ5HhM
	qCEZ66319+9elmO989KSIMyarU3+6kYb+ETeAvnfC8M0W1lqgPriDEkxA0BG0OOY
	qnW1vt6rRC10o4qZnpcFM0Q62q3+DZYUJjtKyiL/mkTScjHK0tOAi4vQbxrA3EFQ
	tUiRyuriP3xOuSM5bVKb7jj5e5IIQNiY7z7YlN11DLQfmYQmYlMOGmqFWnr5U22A
	RBsjabLTAPFWz2NpmYxD6YU/V2Ha62yinsOTazOhbA==
X-ME-Sender: <xms:JzztYiHkKUEtOySZpvqQHNDr8RNYHXrIXAIge8luqoam9QPWF1zB0g>
    <xme:JzztYjXkLZbXQFWevZdpSroqWyhQc2Z7--fsM3hoGLspzO6m6dq4eZdGYsvGgoPOF
    YcJo-nJXteaqw>
X-ME-Received: <xmr:JzztYsIgznpC_mhCMGvFaOmgALPM05P153RXoCLjzw9f6_e4AvCJGJj-efqaKqVx7eMw_2qDfnh43O-XcbUR2iAGutjjhM7Z3oV4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:JzztYsGq7S5J3lcot1dEXd9B8eom_rktpdkcu8nTjmJhiasjCfaDiQ>
    <xmx:JzztYoXeyobWqApaci8NXRzKwYI_gDoWJRSWU6FX5B6eZxG2uUY1dg>
    <xmx:JzztYvPYzqHLivhtT8OwJSOTh6dbpe3TvowRz_dKao0KGWmhvL2yQQ>
    <xmx:JzztYmxUhG5x1nePX_RpRYrtmd8T6uaLWnq6OHnWqhoD6nAfFsyawg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 17:49:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 09/10] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC
Message-ID: <Yu08ItSlvtqALMvS@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <dcbe3f53bd6d88fbf2a20970d4fdfe93479a5f59.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e98ca967-8ae5-3aad-6449-c3689e88bbe8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FeBDfD/FXRWlzqIh"
Content-Disposition: inline
In-Reply-To: <e98ca967-8ae5-3aad-6449-c3689e88bbe8@suse.com>


--FeBDfD/FXRWlzqIh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 17:49:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 09/10] drivers/char: allow driving the rest of XHCI by
 a domain while Xen uses DbC

On Fri, Aug 05, 2022 at 10:15:59AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > That's possible, because the capability was designed specifically to
> > allow separate driver handle it, in parallel to unmodified xhci driver
> > (separate set of registers, pretending the port is "disconnected" for
> > the main xhci driver etc). It works with Linux dom0, although requires
> > an awful hack - re-enabling bus mastering behind dom0's backs.
>=20
> Which is one of the main reasons why I view DomU exposure as
> going too far, despite recognizing the argument that this would only
> be done if that DomU is fully trusted.
>=20
> Furthermore - what's the effect of this? It would seem to me that
> while bus mastering is off, the device will not function. What happens
> to output occurring during that time window?=20

If no reset happens, the controller will continue sending the data after
bus mastering is enabled back - no data lost in this case. If reset does
happen, data that was already handed off to the controller (TRB queued)
but not sent yet, is lost. But data that is still queued only in the
work_ring, will be sent after controller is re-initialized. I did
several tests of this, and I have not noticed any data loss in practice.

> Rather than needing to
> re-enable bus mastering behind the owning domain's back, can't the
> disabling of bus mastering be avoided in the driver there?

Linux disables bus mastering when PCI devices are enumerated (before
xhci driver is loaded at all), and enables it back only when xhci driver
tells it so. So, if xhci driver in dom0 is blacklisted (which is the
case in qubes by default...), the console would be much less useful, so
to say. And I don't think Linux maintainers will appreciate xen-xhci-dbc
specific code in core PCI handling...
It isn't an issue for EHCI driver, because EHCI debug port
interface does not seem to use DMA.

>  As we can
> see from the EHCI driver, there certainly can be communication
> between Xen and Dom0 for functionality-impacting operations Dom0
> might perform (there it's a device reset iirc).

Yes, I can see how controller reset can be coordinated this way. But
also, I see it more like a future improvement if it deemed to be
necessary, than a strict requirement, as the controller reset is a quick
event that in practice does not impact the functionality in any
significant way (with the current code shape). On the other hand, adding
such synchronization feels like several more iterations of this
series...

And BTW, if Linux crashes in the middle of controller reset, with such
synchronization you would not get the crash message at all. While
admittedly such issue is rather unlikely, I see it as a potential
downside of coordination here (you could still avoid it by
`share=3Dnone`/`share=3Dno`, with all its consequences).

Generally, what would be your minimal acceptable version? If support for
sharing the controller with a domain (including dom0) requires
significantly more work to be accepted, I'd much prefer to drop it in
this series and have it possibly introduced later (and in the meantime,
possibly carry as a downstream patch). Unfortunately, I have limited
time to work on the series, but also, I think having this feature
upstream - even in partial form - will be very useful for many Xen users
and developers. Especially, I'd like this series (in some shape) to be
included in Xen 4.17.


> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
> > =20
> >  ### dbgp
> >  > `=3D ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
> > -> `=3D xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
> > +> `=3D xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=3Dnone|hwdom=
|any]`
> > =20
> >  Specify the USB controller to use, either by instance number (when goi=
ng
> >  over the PCI busses sequentially) or by PCI device (must be on segment=
 0).
> > @@ -732,6 +732,16 @@ over the PCI busses sequentially) or by PCI device=
 (must be on segment 0).
> >  Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (=
output
> >  only). XHCI driver will wait indefinitely for the debug host to connec=
t - make
> >  sure the cable is connected.
> > +The `share` option for xhci controls who else can use the controller:
> > +* `none`: use the controller exclusively for console, even hardware do=
main
> > +  (dom0) cannot use it; this is the default
> > +* `hwdom`: hardware domain may use the controller too, ports not used =
for debug
> > +  console will be available for normal devices
> > +* `any`: the controller can be assigned to any domain; it is not safe =
to assign
> > +  the controller to untrusted domain
>=20
> I'm sorry, upon looking here more closely, can we use proper boolean
> here as we do elsewhere, i.e. share=3Dno|yes|hwdom (or more generically
> expressed share=3D<boolean>|hwdom)?
>=20
> I also think 'hwdom' should be the default, like we do for EHCI (with,
> at present, not even a way to override).

Yes, I can do that.

> > +Choosing `share=3Dhwdom` or `share=3Dany` allows a domain to reset the=
 controller,
> > +which may cause small portion of the console output to be lost.
>=20
> As said above - this ought to be avoidable if the period of time the
> reset takes is bounded and if the controlling domain announces the
> reset and its completion. See ehci-dbgp.c:dbgp_op().
>=20
> In any event I'd like to ask that you add a statement to the effect of
> "no security support when using 'any'".

Sure, I can add it more even explicitly (there is already "it is not
safe to assign the controller to untrusted domain").

>=20
> > @@ -1005,10 +1050,32 @@ static void __init cf_check dbc_uart_init_posti=
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
>=20
> How can this allow use of the device by a domain? Is there some sort of
> guarantee that nothing else will live in the same 4k range? I can't
> infer such from xhci_find_dbc().

That's a very good question. From what I see, it lives on a page
together with other extended capabilities (but nothing else). Most of
registers in other capabilities are read-only, but there are some
read-write. It seems Linux driver works fine without writing to any of
them, but it sounds very fragile...

The main reason for this code is to prevent Linux initializing DbC for
itself. But AFAIK Linux does not do it on its own, it requires explicit
action from the system admin (a write to sysfs or kernel option).
I'm not exactly sure what will happen if Linux will try to use DbC too,
my guess is either Xen console will stall, or they will fight each other
by re-initializing DbC over and over. Neither of them look appealing...

Would you prefer to drop this part, in favor of documenting it's the
system admin responsibility to prevent Linux from using it? In that
case, I think the default should remain `share=3Dno` (possibly changing
only after implementing some coordination with Linux side).

> > @@ -1085,7 +1153,7 @@ void __init xhci_dbc_uart_init(void)
> >          unsigned int bus, slot, func;
> > =20
> >          e =3D parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
> > -        if ( !e || *e )
> > +        if ( !e || (*e && *e !=3D ',') )
> >          {
> >              printk(XENLOG_ERR
> >                     "Invalid dbgp=3D PCI device spec: '%s'\n",
> > @@ -1094,6 +1162,37 @@ void __init xhci_dbc_uart_init(void)
> >          }
> >          dbc->sbdf =3D PCI_SBDF(0, bus, slot, func);
> >      }
> > +    opt =3D e;
>=20
> Looks like e (and hence opt) cannot be NULL here, ...
>=20
> > +    /* other options */
> > +    while ( opt && *opt =3D=3D ',' )
> > +    {
> > +        opt++;
> > +        e =3D strchr(opt, ',');
> > +        if ( !e )
> > +            e =3D strchr(opt, '\0');
> > +
> > +        if ( !strncmp(opt, "share=3D", 6) )
> > +        {
> > +            if ( !cmdline_strcmp(opt + 6, "none") )
> > +                dbc->share =3D XHCI_SHARE_NONE;
> > +            else if ( !cmdline_strcmp(opt + 6, "hwdom") )
> > +                dbc->share =3D XHCI_SHARE_HWDOM;
> > +            else if ( !cmdline_strcmp(opt + 6, "any") )
> > +                dbc->share =3D XHCI_SHARE_ANY;
> > +            else
> > +                break;
> > +        }
> > +        else
> > +            break;
> > +
> > +        opt =3D e;
>=20
> ... nor here. Hence I wonder why the while() and ...
>=20
> > +    }
> > +    if ( !opt || *opt )
>=20
> ... this if() check for it being (non-)NULL. At which point ...
>=20
> > +    {
> > +        printk(XENLOG_ERR "Invalid dbgp=3D parameters: '%s'\n", opt_db=
gp);
>=20
> ... you could make the message here more specific by passing "opt"
> instead of the full "opt_dbgp".

Yes, indeed.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FeBDfD/FXRWlzqIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLtPCIACgkQ24/THMrX
1yxevQf+My0Omo9i/UezE6gkgrDXhWjwQwpLQjQNdYZxBbJojdaV1+x3M2tTx5h7
xEt44kvx3S+B5qof0LLKqZaGwiMV7Ey4W9syPzRN58mUe8staxlo0CdIxRtGnp1e
jMF3vQeXiF3ImixLLXfQbG0dyxSlPTAQPn14vtQCeaR9yhMXnYkCdxSQIkkttTWf
sD3/m6LeSAF6n/J7eRR/RqZqGM/6qLlP9TvkuTp/oQ9LkQ9gDWzztfuZ7VKAu8bi
G7N44P45a9LyMDC1ZyxzR+B2eiEGIs35k7UAxvSrq5D3IIXeQasypvZDxtyBJKCx
dVUtMESnEz6qZPnrMx2tA/H9OhepDg==
=6q87
-----END PGP SIGNATURE-----

--FeBDfD/FXRWlzqIh--

