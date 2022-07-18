Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCA57836B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369780.601283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQay-0004KO-HO; Mon, 18 Jul 2022 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369780.601283; Mon, 18 Jul 2022 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQay-0004I8-Cr; Mon, 18 Jul 2022 13:15:32 +0000
Received: by outflank-mailman (input) for mailman id 369780;
 Mon, 18 Jul 2022 13:15:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDQaw-0004Hy-P1
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:15:30 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1d05f4a-069b-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 15:15:29 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C9E185C0143;
 Mon, 18 Jul 2022 09:15:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 18 Jul 2022 09:15:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 09:15:27 -0400 (EDT)
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
X-Inumbo-ID: b1d05f4a-069b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658150128; x=
	1658236528; bh=qDGdge5HDpcv5FvWy7Sp5xLgHmmVwmK1YF57eXOyyKE=; b=v
	SweDqcbhq92p/115aL8eEWeNCtWdxJddttH+HtVI3kaOoofET+t7NrXMYsZLXSY6
	qqk5rZemRG2T5slOss4XM0hPAkzGp2LRnPqohCOiIeNtem9uWu0wD2DSmXNj+xKa
	Jw5JQbnbvPO45JJe3FtzC1M7Xp0e//XU9xEiZuObuXoE5V4m+MBz7iv+WdGyhmFz
	eXKuCkZHInbbTueTVWs9i6yNyDPZbKui8kA1K+RpOJuVxvA8KDHgJLe7rQrkTb+L
	QCtJTIMcKnSK+Q1rzf1faDKvqmWxDMGc1TmAKxh3nufktl9z8XhZJV+QquKF9JmU
	agZrdPATqnSP4ZBJ5PEew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658150128; x=1658236528; bh=qDGdge5HDpcv5FvWy7Sp5xLgHmmV
	wmK1YF57eXOyyKE=; b=2VEM5y8wpjde0su4Lg1zz9hRj1Rszpcy1dCcTPzNYyEL
	ME1vy37RAOJ0tMZVKAO4Y6q10kSgRBqZ1tzIdT/ICm9Bs/W10RDQ9hZ0JBODRrRk
	mHkW5FIdO9zGhq4xjvO8pt6dOzMgBV3RoAcY7YvvHhy7OEYHwb/98gWqBWSOZDzo
	ey3GbTN+pgDKs0P3Mj0vbE2UC5Q/ArsewwRBU6koWtlMF+bEhIa5Q4yQuYvmapUx
	+lP5pXsuTYtxeu26kyYG+pqaR/0N7Pj/rh1VtUe211uFz2RaAeobwAQeqeC9bCrv
	C/1HlSP96KgVOQ5LUQSRpO9d0a9BXkVhdLsuqqfQKA==
X-ME-Sender: <xms:8FzVYmcAKan4YNZUOChkoR8UXQ8Sm1z9Honkex-Yyn2z_a5rHMGQaQ>
    <xme:8FzVYgPSu9U3PrZsAYzOtf_w1-yG-_lTgecFSg-_HYPq-NV-G5_o0WhAixGp6aV5L
    t6AaEDSKy2ylg>
X-ME-Received: <xmr:8FzVYnh1y-vExXEhfo-JmqSNxdYLPbaI_T0kl_Or5H9Us5gzgJ-ArqcP9Afnx_BNnYSwMl9PiIZURCt0Y9NL6JDrNIOCj-VUKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:8FzVYj9ArtCnTM2HqN9xvaJS5ju92iMHodnS-1XtouRlA1brgo36lQ>
    <xmx:8FzVYiu5QYD7wjUEca_xIa7OXEnmR-fK4CfYB_lFQco1wJMapL8DkA>
    <xmx:8FzVYqEV4ybaAy1q66r5fsMSi7IFZhhm_I_3m8orzuj1aZYUK218mg>
    <xmx:8FzVYkXt7FQKvZZ5sfQybKgY5IAcmYZibTNUODhMsWYsSMSASGylyw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 15:15:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device
Message-ID: <YtVc7OeF9PHGH9uU@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6HzafAOzFEH4+k5"
Content-Disposition: inline
In-Reply-To: <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com>


--h6HzafAOzFEH4+k5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 15:15:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device

On Thu, Jul 14, 2022 at 01:51:06PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > The important part is to include those buffers in IOMMU page table
> > relevant for the USB controller. Otherwise, DbC will stop working as
> > soon as IOMMU is enabled, regardless of to which domain device assigned
> > (be it xen or dom0).
> > If the device is passed through to dom0 or other domain (see later
> > patches), that domain will effectively have access to those buffers too.
> > It does give such domain yet another way to DoS the system (as is the
> > case when having PCI device assigned already), but also possibly steal
> > the console ring content. Thus, such domain should be a trusted one.
> > In any case, prevent anything else being placed on those pages by adding
> > artificial padding.
>=20
> I don't think this device should be allowed to be assigned to any
> DomU. Just like the EHCI driver, at some point in the series you
> will want to call pci_hide_device() (you may already do, and I may
> merely have missed it).

There is the major difference compared to the EHCI driver: the XHCI
hardware interface was designed for debug capability to be driven by
separate driver (see description of patch 9). The device reset is the
only action that needs some coordination and this patch series follows
what Linux does (re-enable DbC part, when it detects the XHCI reset).
Having this capability is especially important when one has only a
single USB controller (many, if not most recent Intel platforms) and has
some important devices on USB (for example system disk, or the only ethernet
controller - I have both of those cases in my test lab...).

Anyway, this patch is necessary even if no domain would use the device.
As Andrew explained in response to the cover letter of the RFC series,
Xen doesn't have IOMMU context for devices used by Xen exclusively. So,
with the current model, it would be pci_ro_device() + dom0's IOMMU
context.

> > Using this API for DbC pages requires raising MAX_USER_RMRR_PAGES.
>=20
> I disagree here: This is merely an effect of you re-using the pre-
> existing functionality there with too little customization. I think
> the respective check shouldn't be applied for internal uses.

Ok, I'll move the check.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--h6HzafAOzFEH4+k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVXOwACgkQ24/THMrX
1yz09gf/X58LpRLr29WTiBrEt+tJhQ3axtnrZ+r+azNLtGaRcOj0FeuFOluuSgSo
jCdo/e5dgBtQE2iE2ZCAea0SDQEYXGVc78JqixycnClHX9ApvV20hg5HOADTCDxQ
zEEF+bEkuy9vfdPqKdtcLO2TKQWBzlCxR5uE4cn6XWQt4uYgO2Mc5gx0VYYXEY2Z
w5P61JxIrUqyIndkRGQoqO7HpoR8Lvmt8e89JaWb2xF5w3xnposzC8kk1hyrwVmx
ddRi29bEqT0VMzsPVrgYm7un8oAfkDn63e0IZKwLy52Y3mxBU10yicmq8cwWAd0H
q0FsKMpTYHYkLbwrD3DaRno+VSkCbA==
=0C9S
-----END PGP SIGNATURE-----

--h6HzafAOzFEH4+k5--

