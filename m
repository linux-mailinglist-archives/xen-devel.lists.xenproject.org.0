Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B96CBFD1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515775.798933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8oj-0000Mg-Nb; Tue, 28 Mar 2023 12:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515775.798933; Tue, 28 Mar 2023 12:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8oj-0000Ky-Kf; Tue, 28 Mar 2023 12:52:49 +0000
Received: by outflank-mailman (input) for mailman id 515775;
 Tue, 28 Mar 2023 12:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ph8oi-0000Kr-5w
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:52:48 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7019c9c4-cd67-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 14:52:47 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 20FD25C00EC;
 Tue, 28 Mar 2023 08:52:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 28 Mar 2023 08:52:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 08:52:44 -0400 (EDT)
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
X-Inumbo-ID: 7019c9c4-cd67-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680007966; x=1680094366; bh=8nEn154hhQTFvoDQzXmV54xbCE34vLtQH2U
	SJVF4R0s=; b=lgrSyOOuk/rcUtCL7gmkhwctJh9Q1oxWWYay5KLQfQ+JmJunJOl
	cYHhXyy1U3pYAyKLZ6ybHlsvmT8ocQStN7lzGqA6xYYi1xaQjy6m1129zUWzaqjI
	/rNm2cWjXlFpODlRGyYZhjOOFx/wxtG07FTxarX6c9AWrJum7v6GVEATm0RjR+Wj
	jEomBVZW9ICnqQqLnx7QiGHNPyNdjtaobfXMwziKblqgr1gup3PNhBtOeMUEFZko
	lLbrN2BoOTFWc6nCFNG/aKVaz51vOc25ny9jEP9HRlG+w7i2IR5YkF3qKBJMsJ5W
	YhnX7pUgD6HJ83u0RddjXq/2KjHVOx9W3qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680007966; x=1680094366; bh=8nEn154hhQTFv
	oDQzXmV54xbCE34vLtQH2USJVF4R0s=; b=P7iRMiOCYvJGsc4iZ7sX2YS+Nk73q
	4/DQkbk6+FHO4yvyzqTbFj8P9VMjPibaTuk/35w7o6E2ODnh4WzzIHYES/4KjMcU
	5UM4M3k2U0IG8vvWDbpHbxm4tc/lTm0csgbtnFwfRp31QZhlUSfd6tdbsKbTgGPq
	0YZBGETZkvLJgZpQvKEI8/x2YC5MlLMjOZ3mQQen2ZKM3it3L3LZCca75qTzh7JT
	AkzDOz/u3I+48f0aNXJD2/vEdE79wHBIZD2EAmc0ZZlU0WwB56yBNrbcHKjNtIvL
	/CaoQZfYWOKO9BZCdlNQZd4a+RAIczRR+EZNHZp3Ks9PegW3bWCB/2/Jg==
X-ME-Sender: <xms:HeMiZC3ZNoLiHUrUkqVdAoE89VyYvA96UGt2syY-uC3doOQbnWqq4A>
    <xme:HeMiZFEC6zudTxzW3RnMkKKbfnraP9TcTNfNCUy4PMk1e2hUB6Nkom7Nr8U_FoZ0T
    s5K6GF3gAbf-g>
X-ME-Received: <xmr:HeMiZK4aMf-X0X01hNL9N2jF9lQiTwbZc6IebbNUCmrGUadcRp_zgNIn7qSx2T8udAQH_sUDCSP2R1UJAL-AtAxE6NuxUA-Iwpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:HeMiZD0cLIde6ueNUh8lR44tEr450_FwYTyWVsKJriSxBkowBpACTQ>
    <xmx:HeMiZFGYplkAmzztPD5aBOzFxYFNxIyKf89xlHePpl3b66cmbKjxTQ>
    <xmx:HeMiZM88WgK2iEiZkRkp9PPgPU6kdcixqQPbAWZYrnT8nj3EqjDo0w>
    <xmx:HuMiZFDN-Zlx1lH1YDY12IhcJpfIXKCTabiG5Suywe-bphY11P1gtw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 28 Mar 2023 14:52:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Message-ID: <ZCLjGhbzGD2jykT9@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger>
 <ZCLX1qD/FmbF5ulu@mail-itl>
 <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DPxcdv3g2IgGGUVa"
Content-Disposition: inline
In-Reply-To: <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com>


--DPxcdv3g2IgGGUVa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2023 14:52:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table

On Tue, Mar 28, 2023 at 02:34:23PM +0200, Jan Beulich wrote:
> On 28.03.2023 14:05, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monn=C3=A9 wrote:
> >> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> +static bool cf_check msixtbl_page_accept(
> >>> +        const struct hvm_io_handler *handler, const ioreq_t *r)
> >>> +{
> >>> +    ASSERT(r->type =3D=3D IOREQ_TYPE_COPY);
> >>> +
> >>> +    return msixtbl_page_handler_get_hwaddr(
> >>> +            current->domain, r->addr, r->dir =3D=3D IOREQ_WRITE);
> >>
> >> I think you want to accept it also if it's a write to the PBA, and
> >> just drop it.  You should always pass write=3Dfalse and then drop it in
> >> msixtbl_page_write() if it falls in the PBA region (but still return
> >> X86EMUL_OKAY).
> >=20
> > I don't want to interfere with msixtbl_mmio_page_ops, this handler is
> > only about accesses not hitting actual MSI-X structures.
>=20
> In his functionally similar vPCI change I did ask Roger to handle the
> "extra" space right from the same handlers. Maybe that's going to be
> best here, too.

I have considered this option, but msixtbl_range() is already quite
complex, adding yet another case there won't make it easier to follow.
I mean, technically I can probably merge those two handlers together,
but I don't think it will result in nicer code. Especially since the
general direction is to abandon split of MSI-X table access handling
between Xen and QEMU and go with just QEMU doing it, hopefully at some
point not needing msixtbl_mmio_ops anymore (but still needing the one
for adjacent accesses).

> >>> --- a/xen/arch/x86/msi.c
> >>> +++ b/xen/arch/x86/msi.c
> >>> @@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *=
dev,
> >>>                  domain_crash(d);
> >>>              /* XXX How to deal with existing mappings? */
> >>>          }
> >>> +
> >>> +        /*
> >>> +         * If the MSI-X table doesn't start at the page boundary, ma=
p the first page for
> >>> +         * passthrough accesses.
> >>> +         */
> >>
> >> I think you should initialize
> >> msix->adj_access_table_idx[ADJ_IDX_{FIRST,LAST}] to -1?
>=20
> Or better not use a signed type there and set to UINT_MAX here.

If not using 0 as unused entry (see the other commend I made in response
to Roger), then that's probably the way to go.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DPxcdv3g2IgGGUVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQi4xoACgkQ24/THMrX
1yzvKAf8CTEChxywfyFBs4MSJLFYlMwM4zkOdi/Gf3bsDgvSjAiUSejvNFGPqJaf
ThQjMa8wEH1/QXiHRDvOYIYDWyIMn77HVYyMTtnodlwZefxgWQzsIcoD2/WcVerG
AyH8m3skeny2lV+SHwTTdvqMQaPmDTM9+CdKs2cOlgIAjoDDe+mCov4cR3P6+4lf
j8AeCkGLltigN6tWsxwsGlCgI2zcE8eIqHBTiDwsurdUubDPqCAoYv8ZJ/TL8uGp
qFSGA8kfDG8cq87VU7cisbu6szrvLnN4GoZFCX+OiDutc4VhUrdQNDfLZs6hmCK+
1UFN6Sn3OJbnhK2V61d4SZqFimb3Hg==
=60Jc
-----END PGP SIGNATURE-----

--DPxcdv3g2IgGGUVa--

