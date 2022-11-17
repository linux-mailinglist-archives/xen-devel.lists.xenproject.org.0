Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A2B62D933
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 12:16:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445117.700171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcru-0007SR-FC; Thu, 17 Nov 2022 11:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445117.700171; Thu, 17 Nov 2022 11:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcru-0007QE-Ba; Thu, 17 Nov 2022 11:15:42 +0000
Received: by outflank-mailman (input) for mailman id 445117;
 Thu, 17 Nov 2022 11:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9yL=3R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ovcrs-0007Q8-8k
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 11:15:40 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d378db-6669-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 12:15:28 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C9E35C0760;
 Thu, 17 Nov 2022 06:15:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Nov 2022 06:15:36 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 06:15:35 -0500 (EST)
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
X-Inumbo-ID: 23d378db-6669-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668683736; x=
	1668770136; bh=fRC9zntwG89J7/RUbd4ryrJLykigctEhig3DEmAzbqk=; b=C
	AGag0iPzG1x4VKKK2AvuzKLpmPJ7eEr9cN2CTY3nBaypDZ79RqslS4Ih99Kr6doi
	MXodUbw0hufmd6s0SsEQs2GVFD2up+DFiIPNiGk3YqU3I0AOix3gesMNLlLyzHYm
	lWlavYJMCxS/uK3lRjCwILSP/5lB1xcbuCd+NDmPF5H21gsEjeG+iHr2rSTo15zP
	Truy0W8pz6dqlUUu9zYpbsSRM80e6UMOeBG2bWdDA0K2XGoYyiflDwJuIp3C5Xq5
	S59iVHeWU1WjYuRucQUqC1POA8rIXEgDuWChHQ6bpYHXklUCS8n6Pm9NTAXegHt0
	XtcWdeGsNgJ1jYOzq3QaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668683736; x=1668770136; bh=fRC9zntwG89J7/RUbd4ryrJLykig
	ctEhig3DEmAzbqk=; b=RS/LCuRXwyq+8kQc6o7zNJklNM/JE755mOJLIvxD25wh
	zN1UlKlA5KA+SAy5BIQjNmOHlIz7yO/eHyqYq45h1YDemwIPQvhRtAAtgWDxSoDK
	pcSU8QKyKONVZP8pToWYt2BSaTpsOdAkS0D/9l9EHOLLuGMBP8V7yP021b+5CtRg
	+l6nUle7PVoFFBhEFD8dIQdeTmtXqbfIMxCC9dfrmmD3tqhlM6u7ZHbdzT2dEp5Y
	+hG8Y7mHOvyIBSgVdkBojKBRBLlY0eZz5pJUlpJL51Tx+xDCrVZU8fItPu95cevP
	ncig8foWEE9TgnV0L5Sd7r5t2INBX44TQLmMiP/ddQ==
X-ME-Sender: <xms:2Bd2Y9L6NmldMoRdl7Bfcv31eCvvq-hvIxaImPB3lJ7EshDjAkWakg>
    <xme:2Bd2Y5KTT894Q1NvrzIEwPsctM8XJo-gYpsSDTMHh71Hld0M2UmygYVxT5DBMjGSU
    d78cIvOD3lDjQ>
X-ME-Received: <xmr:2Bd2Y1tZb2GTiTav-d7OmVzO1chaOzyC6SUX5357_N39qVIMVYdCRLQ0ajyOxrdC6vY_uXKE2capDgwfCoGxAKRFrqmwQDnaBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeet
    teeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:2Bd2Y-Y5eBURZIbl3KlVldryFYvglcvzgWjhfr_cHA_q7DxE6ZcDtw>
    <xmx:2Bd2Y0YPgTg7U89I271IZBqKczMXN_aszw6SL9Xvw2e5PK4Wbv9kUA>
    <xmx:2Bd2YyABG0yjyAen7UPJLqIAKCx82f164Oi1xbW-Zueje4EtOXGN1A>
    <xmx:2Bd2Y7V51Gq60GBkcRElwoSd5su744BHSuuMTw72UewWwydRWZwc9w>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Nov 2022 12:15:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Message-ID: <Y3YX04aorSaDhk6l@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
 <Y3VYs/sS4VddrBCK@mail-itl>
 <Y3WruE/VOBZFfHfi@mail-itl>
 <1443e924-5b53-9ee0-00fb-4d790d404b08@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fJdg5cbyRovzVsoQ"
Content-Disposition: inline
In-Reply-To: <1443e924-5b53-9ee0-00fb-4d790d404b08@suse.com>


--fJdg5cbyRovzVsoQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Nov 2022 12:15:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Thu, Nov 17, 2022 at 09:04:40AM +0100, Jan Beulich wrote:
> On 17.11.2022 04:34, Marek Marczykowski-G=C3=B3recki wrote:
> > Ok, I found what is wrong. Enabling MSI-X is refused, because INTx isn't
> > disabled at this point yet. And apparently I was testing this with
> > permissive=3D1...
> >=20
> > Linux does this:
> > https://github.com/torvalds/linux/blob/master/drivers/pci/msi/msi.c#L611
> > In short:
> > 1. Enable MSI-X with MASKALL=3D1
> > 2. Setup MSI-X table
> > 3. Disable INTx
> > 4. Set MASKALL=3D0
> >=20
> > This patch on top should fix this:
> > ----8<----
> > diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/=
xen/xen-pciback/conf_space_capability.c
> > index 097316a74126..f4c4381de76e 100644
> > --- a/drivers/xen/xen-pciback/conf_space_capability.c
> > +++ b/drivers/xen/xen-pciback/conf_space_capability.c
> > @@ -235,7 +235,7 @@ static int msi_msix_flags_write(struct pci_dev *dev=
, int offset, u16 new_value,
> >  	    (new_value ^ old_value) & ~field_config->allowed_bits)
> >  		return PCIBIOS_SET_FAILED;
> > =20
> > -	if (new_value & field_config->enable_bit) {
> > +	if ((new_value & field_config->allowed_bits) =3D=3D field_config->ena=
ble_bit) {
> >  		/* don't allow enabling together with other interrupt types */
> >  		int int_type =3D xen_pcibk_get_interrupt_type(dev);
> > =20
> > ----8<----
> >=20
> > Jan, is the above safe? It should prevent clearing MASKALL if INTx isn't
> > disabled, unless I missed something? But also, it will allow enabling
> > MSI-X with MASKALL=3D1 together with MSI, which I'm not sure if should =
be
> > allowed.
>=20
> While it would probably be okay with what we have now (after your earlier
> patch introducing allowed_bits), it's likely not going to be correct once
> further bits would be added to allowed_bits (which clearly is going to be
> wanted sooner or later, e.g. for multi-vector MSI). Hence I think ...
>=20
> > Alternatively to the above patch, I could allow specifically setting
> > MSIX_FLAGS_ENABLE + MSIX_FLAGS_MASKALL while INTx isn't disabled as a
> > single exception,
>=20
> ... this is the way to go, and ...

Ok, I'll go this way then.

> > but at this point I'm not sure if some other driver or
> > OS wouldn't approach this in yet another way.
>=20
> ... I guess we need to further add exceptions as needed - the one further
> approach I could see is to keep all entry's mask bits set until setting
> "INTx disable", without using MASKALL.
>=20
> I'd like to note though that the PCI spec has no such exception. It,
> however, also doesn't mandate setting "INTx disable" - that's merely a
> workaround for flawed hardware afaik. (In Xen we also only cross check
> MSI and MSI-X. IOW we rely on Dom0 anyway when it comes to driving
> "INTx disable".) Therefore in the end pciback looks to be going too far
> in enforcing such dependencies.
>=20
> Thinking of this - what about making the change in
> xen_pcibk_get_interrupt_type() instead, setting INTERRUPT_TYPE_MSIX only
> when MASKALL is clear (alongside ENABLE being set)? This would then also
> cover command_write().

That may be a good idea, but wouldn't cover the case here:
xen_pcibk_get_interrupt_type() at this time returns INTERRUPT_TYPE_INTX
only, and setting MSIX_FLAGS_ENABLE is prevented.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fJdg5cbyRovzVsoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN2F9MACgkQ24/THMrX
1ywedAf/dOdpvHMdqxqZIURx2tzub79X1LxTrSa9mqH/9utKQj2xrBX2UAjQ53pi
3q4t9afEFRzYKqGTolbTmY+YGHDEKNFfHxN4UMo97V3qD89WsaKTtL02YRf8FgXn
A5qIicth/fwYhP1XSHuTTc9JGGi0+b1i0eULWDM6Kv9nqJCmPXQgxoNKv9Y3/n8w
cBYBhuII6SPgHnaFsFmpcra7XfGoOUF8fz0zh99/f0v+M/Q1oASezM4Bq1EylM8u
bJa9MyRaIhOH1CB1tzZVCRHFpH1ifoXFQNck8jFuaa0DTVTMOV4rWD7ncFvfRJ3d
cpn/DJ2kgMrr9tjAAaXnwK2DTxDK0A==
=Xa69
-----END PGP SIGNATURE-----

--fJdg5cbyRovzVsoQ--

