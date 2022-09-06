Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF755AF742
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400301.642004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRe-0005Ef-Kz; Tue, 06 Sep 2022 21:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400301.642004; Tue, 06 Sep 2022 21:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRe-0005B3-FX; Tue, 06 Sep 2022 21:49:22 +0000
Received: by outflank-mailman (input) for mailman id 400301;
 Tue, 06 Sep 2022 21:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBQK=ZJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVgHo-0000Cs-CJ
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:12 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cab9a6a-2dfb-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:46:20 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 16FD53200488;
 Tue,  6 Sep 2022 11:46:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 06 Sep 2022 11:46:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 11:46:15 -0400 (EDT)
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
X-Inumbo-ID: 0cab9a6a-2dfb-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662479176; x=
	1662565576; bh=V7/fLWTP7eSQOSpSIE+MW9OQc508pI6balfpUeNEzQo=; b=i
	cdOFr1alaippbqRJ8AByRl0JHs70eO9yY/jCHb8HKT+9PgnmMUc30FRbMHFCBlUl
	4ApiuFGwz+bCg/6aW3rfMT9Vhao57CtXx+whNsXqsPcn5saO8kdVvXx/nyv0Ip1Q
	6nK5XvzIZrzrjK++8kGvLEJ4SXdko8o9cUPawIkLu2cz5lcTZUNG0M1x4oKUTxes
	UAtrLZ0mFxvOZSX2jEjKd63YleveMceW7K/DU3f9l3ci47im2QE9tJ60zBfZAVJr
	fPoSbFFi4+c/rQTPu42hnWKryHEF/QBkvmfWMN2mvOpDj7xQRZ9KPDWnNK4uLdnK
	K7zPojUmuVNpGcpfwGKWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662479176; x=1662565576; bh=V7/fLWTP7eSQOSpSIE+MW9OQc508
	pI6balfpUeNEzQo=; b=NXengI6HxWhkhBAhHesl6KYFhcX3GIyW7LySC7cgT6q6
	4mJpeNhKqf2WHh1OiTrDSb6tjz1s6w2iLZMHdJygIh/RiJJf7b7KsPsy37f205Po
	xw0ziCb0/XmuubaLgq8h3y1kRPyVCsZm6up3cKkVTE5B6nTQLhQnYPlb6O0iJxk8
	VG0kOQzpD8B31XmMUL2KPvNDonSHs8McNhLhNKKyY3LdRlx44p0KVvvUe1wSPlax
	t9vTeXwySl684h7I3LsAArAQz85GH96TnJcd5VOvEi7e8DgdbrBpCUJ31YmVdT4D
	gUolqY31Xq0ArhZdcEDJB2w28gzsrB2T9GFA6aK1DQ==
X-ME-Sender: <xms:SGsXY56NoNICcT8gaJAFGFsj6dvs22dgQFcBv59Pav9fSUEeCD0Ifg>
    <xme:SGsXY25cNsfIUBrmXYnIS6cGf82DiH43BZetsxoYRabPhMGFDKTRRUO7qS6TqwZPC
    EgZU4XHATQUBQ>
X-ME-Received: <xmr:SGsXYweH-DkNCUlfkgVroXjBtnXmgwNKhaVxj_QfA2EeEmOfWeajo_ZOaKAXdxuIR-N1kLAFKHJTS5Gs4O9Uga-_ib3HSNVc_3HX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:SGsXYyI0ecmc5F25WZZesWPZX5I17wmJqKikHwLxE0XfOe9lizL0RQ>
    <xmx:SGsXY9KCDXUq4ln-i32ggmARsoZkovFNnMib1k-y_c_knZilb-Aqkg>
    <xmx:SGsXY7z7xzA5zout6w56mXIVFqp6gaDI9EMo8jD-YYLz3OnE54R_cA>
    <xmx:SGsXY6H30e8OT8FD8yOK56HMvlZNWWn-T0wkh4U7jYAIKjBNiNuyig>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Sep 2022 17:46:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 01/10] drivers/char: allow using both dbgp=xhci and
 dbgp=ehci
Message-ID: <YxdrRUEJ31ZgmilH@mail-itl>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <f9c4f0df804ed406dea0e480614a033d5bd434c6.1662124370.git-series.marmarek@invisiblethingslab.com>
 <08c9df71-0470-c9eb-94f0-776eaacefa5b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QVef3WGluHOc9mqh"
Content-Disposition: inline
In-Reply-To: <08c9df71-0470-c9eb-94f0-776eaacefa5b@suse.com>


--QVef3WGluHOc9mqh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Sep 2022 17:46:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 01/10] drivers/char: allow using both dbgp=xhci and
 dbgp=ehci

On Tue, Sep 06, 2022 at 05:07:27PM +0200, Jan Beulich wrote:
> On 02.09.2022 15:17, Marek Marczykowski-G=C3=B3recki wrote:
> > This allows configuring EHCI and XHCI consoles separately,
> > simultaneously.
> >=20
> > This changes string_param() to custom_param() in both ehci and xhci
> > drivers. Both drivers parse only values applicable to them.
> >=20
> > While at it, drop unnecessary memset() of a static variable.
>=20
> Are you sure of this? What if there are two "dbgp=3Dxhci,..." options
> on the command line, the latter intended to override the earlier but
> malformed. Then ->enabled would be left set from parsing the first
> instance, afaict.

Right.

> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -409,7 +409,7 @@ The following are examples of correct specification=
s:
> >  Specify the size of the console ring buffer.
> > =20
> >  ### console
> > -> `=3D List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | none ]`
> > +> `=3D List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | xhci | none=
 ]`
>=20
> Personally I consider "dbc" more in line with "dbgp", but I'm okay
> with "xhci". We may want to allow for "ehci" then as an alias of
> "dbgp", though (in a separate, later patch).

I've changed "dbc" to "xhci", as "dbc" isn't really surfaced to the user
anywhere else. As in - it requires some deeper knowledge to draw a
connection between console=3Ddbc and dbgp=3Dxhci. And yes, when going this
way, "ehci" alias would make sense.

>=20
> > --- a/xen/drivers/char/ehci-dbgp.c
> > +++ b/xen/drivers/char/ehci-dbgp.c
> > @@ -1464,7 +1464,18 @@ static struct uart_driver __read_mostly ehci_dbg=
p_driver =3D {
> >  static struct ehci_dbgp ehci_dbgp =3D { .state =3D dbgp_unsafe, .phys_=
port =3D 1 };
> > =20
> >  static char __initdata opt_dbgp[30];
> > -string_param("dbgp", opt_dbgp);
> > +
> > +static int __init parse_ehci_dbgp(const char *opt)
> > +{
> > +    if ( strncmp(opt, "ehci", 4) )
> > +        return 0;
> > +
> > +    strlcpy(opt_dbgp, opt, sizeof(opt_dbgp));
> > +
> > +    return 0;
> > +}
> > +
> > +custom_param("dbgp", parse_ehci_dbgp);
>=20
> We commonly don't put a blank line between the function and this
> construct. (Same again further down then.)
>=20
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -245,6 +245,7 @@ struct dbc {
> >      uint64_t xhc_dbc_offset;
> >      void __iomem *xhc_mmio;
> > =20
> > +    bool enable; /* whether dbgp=3Dxhci was set at all */
>=20
> In dbc_init_xhc() there's an assumption that the "sbdf" field is
> always non-zero. Do you really need this separate flag then?

Not really, sbdf =3D=3D 0 means "find Nth xhci", where N=3Dxhc_num+1 (and
xhc_num can be zero too). See the "if" at the very top of
dbc_init_xhc().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QVef3WGluHOc9mqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMXa0QACgkQ24/THMrX
1yytjwf/UlINwGQ3CDJK60Agz88bEOg0oOhqZrjAu5H0t+6yypWKZWBmyLkHfnz5
/oRMJ+fjcy2+S+JFi/8QWna4vg9+uYeLkrpQjHu/0e71EsHhq+FbEX4Pi2LcY/7k
WCI5NvtIJJyIxhsBNIp4a8+5AtKLCn8m5buboIlta5FNGcoGsceDFoWSiEbfb6Gx
TUAjXXWse3DzjSeFbe1BeXcN9hKz3+4FD017N3QsLJwcLDXkHDcGwGH1+OURPAQa
q6ZiMeQ3f0SoR6Z9QVUyPdlyHtSHGw/tXoHgq67r/vM95JeAuua8ijahNlsZu96I
wx88tuzbtI6G44pNT7t5L4wlmtv+tA==
=Jbn+
-----END PGP SIGNATURE-----

--QVef3WGluHOc9mqh--

