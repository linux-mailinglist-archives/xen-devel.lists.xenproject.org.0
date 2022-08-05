Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A238E58A92A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380986.615463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu9T-0004NT-23; Fri, 05 Aug 2022 10:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380986.615463; Fri, 05 Aug 2022 10:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu9S-0004Ki-VO; Fri, 05 Aug 2022 10:01:54 +0000
Received: by outflank-mailman (input) for mailman id 380986;
 Fri, 05 Aug 2022 10:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJu9S-0004KW-2u
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:01:54 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c1ade2-14a5-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 12:01:52 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ADB43320092D;
 Fri,  5 Aug 2022 06:01:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 05 Aug 2022 06:01:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 06:01:48 -0400 (EDT)
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
X-Inumbo-ID: a0c1ade2-14a5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659693710; x=
	1659780110; bh=FdzgW5a/85qe8nQR8G8KhuDD9ZlY5A5GrI4upZEiUos=; b=9
	GGjpY7aO3AOU9EVC6p6U5DQY/xIY8Kv3CdQ40j879EPmkFT4h56p5OWnyBiLfkdo
	ZHtS8CrI6AUAFF3bh2jqbZ+d3VXKAnle+qvGPDlDO/V22sFW1kCioVz1r5QejESx
	iRwnn2mtHTEsowYOcYTuOg8QcgNDVJ4pZ3isiPDTZKlX0iC6kWDTvdc8InD3Tcdy
	LJGnKycBwdrG2XlgK4NXvxyFAXcbViemIL2ltTfLIQD2nQ56BjJ3sU1GDGRekL9l
	xC+2z8gCIvhSQN93ylHwqzNYGGqMn6a5tTUB+D0rCdOY4f4z1FC/SbtAtCeQpipp
	rU4BJHuda8O5kbExM0lcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659693710; x=1659780110; bh=FdzgW5a/85qe8nQR8G8KhuDD9ZlY
	5A5GrI4upZEiUos=; b=r3+OcK2LftIYysg9uIkotEfGUwepSn+wA8VFDJLbCZ+7
	j8zejd2nAPnyAH8fdLgZoBFKVM8CX2T8F2cwxQt4IBJxDOzqPkVcu+nqpM+LYXbJ
	785ZPsLPkMfW1uW2GDNZxldF+C7XPHEw2WthlIF41H0m0EzLalY3bxgIz7VhMyyR
	rPDpS5+aVezy4S4hW4AqK+f3KYDEAceaLSN0pcwhqx1tsL4RHJ58W593QYMOY7HY
	D3IB4lGZKQUj1ja6PL+mOj5CJALuDsehnKNJ1AqxTVxisCOCZ68ih1scysVb1dwF
	qM07oBlKBqhxz+WMzs196yWk4XnAkkzGnNU4YuWyEQ==
X-ME-Sender: <xms:jersYvrHKoVZo7_eHtQr2D0a4auWGSTBPFt7hN7f-IfGxuOotGlTPA>
    <xme:jersYprdT5Hingi8mWm7-WJp4eWy05bIIx9pnFGeacDK78NDO9ywjnMT37z9B8mUi
    zDRda-u92bX3Q>
X-ME-Received: <xmr:jersYsMOcm1rHroIJ__9MN10ehqTvPI09gji_xPcSlPGEtKXH1UEeVmrTXo596Tsuj2TPOIpAm6zmAwCI3kIdV0PJeE6ISWJGXrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jursYi7neg36G0e0DTmmjT131tyFqPs5e0fWmuOOuHtO-NFkMfX2wg>
    <xmx:jursYu6Gs2eOWNnzalDdntvg_wF_p8cav34GvjuHfrYzJZXQJ1Ib_A>
    <xmx:jursYqjj-Lp_1jWd-QYatTb-wHdsLAZFKCdKOl0b_jgJaT8JcYHzwQ>
    <xmx:jursYgQRAwzhSZLsnoV57AZWJla-lSq0jR9i-MpRSj9-g9mPkVBVYA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 12:01:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Message-ID: <YuzqilmPM/m4LquD@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <04256d0a-79a1-56f4-d092-de78f629c7f6@suse.com>
 <YuzoIAh+scGcDY1R@mail-itl>
 <bec18d21-5823-0108-e257-8e4732c6d1fc@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rsBdOqiikpfz+SON"
Content-Disposition: inline
In-Reply-To: <bec18d21-5823-0108-e257-8e4732c6d1fc@suse.com>


--rsBdOqiikpfz+SON
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 12:01:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger

On Fri, Aug 05, 2022 at 11:54:06AM +0200, Jan Beulich wrote:
> On 05.08.2022 11:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Aug 05, 2022 at 09:23:32AM +0200, Jan Beulich wrote:
> >> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> >>> +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> >>> +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> >>> +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> >>> +static struct xhci_erst_segment erst __aligned(64);
> >>> +static struct xhci_dbc_ctx ctx __aligned(64);
> >>> +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZ=
E);
> >>
> >> I've been trying to identify the reason for the alignment here,
> >> compared to the other buffers which are no longer page-aligned. I
> >> haven't even been able to locate the place where the address of
> >> this buffer is actually written to hardware; all I could find was
> >> the respective virt_to_maddr(). Could you please point me at that?
> >=20
> > It's dbc_flush() -> dbc_push_trb().
> > And indeed, I think I can drop the alignment when it's moved into
> > structure dedicated for DMA-accessible buffers.
>=20
> Why would you be able to drop the alignment then, but not here?

Similar reason as previously - to guarantee it isn't put with unrelated
stuff on the same page, as this array will be accessed by the controller
directly. But, since this patch doesn't attempt to handle IOMMU
situation yet, I think I can drop it here too as there is little benefit
for trying here.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rsBdOqiikpfz+SON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLs6ooACgkQ24/THMrX
1yyVVwf9EfMuoY2rbahOGHs1q4/f6cAJmOA0n3GifDuQcu3oNQdG1bmqd6n5kVXj
KFt2wihOtdKrwexBPtlnsuiQW3xg9VR2aiA7SjwsudqS6mDcf+hed62+a8U/DiSO
JgeiorSXEwbyE4CUME/LFSQwITOOEjR9EzinxxLE4o+Ot3g3dkd/YfOmp6jCQtYw
7i0ueWuf27RHAif3u5uUnn8vx7fqq6sBMcio33735ucoDudtJlwr+lcj6oNcLnlf
N1ufM3AptmJ1RYt3267jVh/n+lZVhKKfmPQV3IeWYCj0a5d8hrLgxk0+sxOXF5od
JlGdqdDoOhk0+kmxJDZ0ZRY+cKmz5g==
=0lvr
-----END PGP SIGNATURE-----

--rsBdOqiikpfz+SON--

