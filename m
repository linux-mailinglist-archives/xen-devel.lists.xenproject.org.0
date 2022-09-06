Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213225AEFE0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 18:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399954.641397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVb56-0001WF-Vx; Tue, 06 Sep 2022 16:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399954.641397; Tue, 06 Sep 2022 16:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVb56-0001Tk-TF; Tue, 06 Sep 2022 16:05:44 +0000
Received: by outflank-mailman (input) for mailman id 399954;
 Tue, 06 Sep 2022 16:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBQK=ZJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oVb55-0001Te-WB
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 16:05:44 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfb9d491-2dfd-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 18:05:41 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7EDB23200980;
 Tue,  6 Sep 2022 12:05:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 06 Sep 2022 12:05:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Sep 2022 12:05:33 -0400 (EDT)
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
X-Inumbo-ID: bfb9d491-2dfd-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662480336; x=
	1662566736; bh=/b6rewTD15B8psl8ty/HKy9EqprqbU19r3TMw5yOkrg=; b=E
	a0Jr9DymTMgk0LTPGt8Gs3LJtRxKkUzN9yeFBLHtFm8G3DoUfjsYdajA42K3nlnc
	vko4dJb+ujYLA4jW5BowPOssVE+I2ws7+XwWfCBP1mQD+CpZvmA33fneoTEbvLI+
	NJ/REGJXUopb7BUFDtiuL7fSfaOAyu+SRtRxidML/ldceYE8h/8gQHao2AAp+kZv
	xcPn1ezb8ux1ZruLQrJFxZWP8DI5dKDCEWDuRSWaWK2Njca33dPTTql0RcYz8QP6
	zIC1B7HXTgBuXY0DGoRAjsb6XSqyP/LTcY5Xu3ooQSedRVTjIQ6l8ngMtupPDPdh
	H8rjV/noQrxW3Ojux1nMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662480336; x=1662566736; bh=/b6rewTD15B8psl8ty/HKy9Eqprq
	bU19r3TMw5yOkrg=; b=hMxt2vq79N2J/uLCLtChtd1L9TZ76YA/Z+r/T+e40b4E
	d/Gfq1nnAEWsVNxH/OM5c1musYdTggsq5p8Br+EjyoVwU2zFMMpORWQ0BF615Adn
	S5w2AnKqqYq54dsW8Mp2/PNhZ4zbM2ZApGeLoT86b9EAq00eB8qZb6z0VhjzZ1pp
	sJn2LCyVEhwRsJt0oSGeWzh4xO02jzvb2dVe6sLwAEsU8X5A/gLuEwVUxJ/FgO0a
	AaqmZEBu7vto8tlr0mLbr9Hs2zkbmT757hX9wTOunY+zP9rwfCFUIEY5r+h2uvx7
	VQzPAQplWKw096sFA7Cw6Ll0cKESw2zO9CjWdOqBbA==
X-ME-Sender: <xms:z28XY7kgm7Q_7SBhmNdHG3g1LTwtE1zm4whWZU_GxbR_AOYPQeq3qQ>
    <xme:z28XY-1A9SXWkPOFK7u30WKmW4YWm-9LtgfotBNAkT4bv6bWsD0WE4ok9jArXDUnj
    md6XFSiYdRrvg>
X-ME-Received: <xmr:z28XYxrrndmUqPftalEMerezfQV2zqJHkzgmKfKzgrFKCCK0wZrKfK7R7y-38-66Snpz8w1v6lcypi2XCuRJFsfS_k5edWU9ZXWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:z28XYzniURY02rIbKh9RDBtapM0rsx5gN2V_3Hhkjt6b3w6Fonlp0w>
    <xmx:z28XY51M7EgJtJuplWfPitbJvwbJEGyHYQqQfCMxgxb6IbgN0N2qHw>
    <xmx:z28XYytJFKFpeY8UXxzb0OUe4sNhVruwIvgQeCloRTLAS8Kasvp1MA>
    <xmx:0G8XYyLOZfzJuAu3jTHOm6gP849qS8swD8oHtGb0ZOPjnUKROlyQTA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Sep 2022 18:05:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 00/10] Add Xue - console over USB 3 Debug Capability
Message-ID: <Yxdvy8VTBMT3uMzt@mail-itl>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
 <2f7b3495-7963-fa4a-f4c0-5b668238d337@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3eL0aqiAVgK7gIV0"
Content-Disposition: inline
In-Reply-To: <2f7b3495-7963-fa4a-f4c0-5b668238d337@suse.com>


--3eL0aqiAVgK7gIV0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Sep 2022 18:05:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 00/10] Add Xue - console over USB 3 Debug Capability

On Tue, Sep 06, 2022 at 05:11:24PM +0200, Jan Beulich wrote:
> On 02.09.2022 15:17, Marek Marczykowski-G=C3=B3recki wrote:
> > Marek Marczykowski-G=C3=B3recki (10):
> >   drivers/char: allow using both dbgp=3Dxhci and dbgp=3Dehci
> >   console: support multiple serial console simultaneously
> >   IOMMU: add common API for device reserved memory
> >   IOMMU/VT-d: wire common device reserved memory API
> >   IOMMU/AMD: wire common device reserved memory API
> >   drivers/char: mark DMA buffers as reserved for the XHCI
> >   drivers/char: add RX support to the XHCI driver
> >   drivers/char: allow driving the rest of XHCI by a domain while Xen us=
es DbC
> >   drivers/char: fix handling cable re-plug in XHCI console driver
> >   drivers/char: use smp barriers in xhci driver
>=20
> I wonder in how far it would be possible to commit parts of this series.
> Aiui patches 3-6 belong together (lacking a suitable ack on 4), but are
> independent of 1 and 2. What I can't really tell is whether 7-9 are
> independent of 1-6 and could hence go in.

7 share some context with at least patches 1 and 8 (but no functional
dependency), and 9 modifies what 7 adds. But otherwise 7-9 should be
independent of 2-6.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3eL0aqiAVgK7gIV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMXb8oACgkQ24/THMrX
1yxBkAgAg+2f1fYspzmSsXSSczfN5GJTvZ2CxTF7FLLPCLx9xwSMg5jqeo6T1/6g
OP6fuBKY+4E0iQn+yNF+2vLMHo0QzHay7IQXxZ91gvIsypjedQF1CkvaGjnJ4gg/
11URSDJ+/StsmGJJd18tLCI9oBT1KDPKrs7gm+9q++M7cl4ykmOrGTKhlOmaXd4R
OVhCBMuDA8KBUy4Cd/hmzzwI6Pgh4+8iej3yEs7po+6tfr0JNgq4iRuu6nreVcTm
7i7R4n6O+4cdLeGxLDgunvEFhu1Eoq/BE1uBwre6CMab1H/c3YbYNlPFTiRG/A6Q
8E0kYIDdQqJ3UADUvF/SXGhO98T8eA==
=jD8S
-----END PGP SIGNATURE-----

--3eL0aqiAVgK7gIV0--

