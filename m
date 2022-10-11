Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F915FB89D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420460.665304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiIUw-0002a9-Mf; Tue, 11 Oct 2022 16:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420460.665304; Tue, 11 Oct 2022 16:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiIUw-0002Xe-JX; Tue, 11 Oct 2022 16:52:54 +0000
Received: by outflank-mailman (input) for mailman id 420460;
 Tue, 11 Oct 2022 16:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsRG=2M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oiIUv-0002XY-1n
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:52:53 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 235cd4ea-4985-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:52:50 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E7E95C0091;
 Tue, 11 Oct 2022 12:52:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 11 Oct 2022 12:52:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Oct 2022 12:52:48 -0400 (EDT)
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
X-Inumbo-ID: 235cd4ea-4985-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1665507168; x=
	1665593568; bh=C3UQ9ArIG3SiYomPhWP9uLz4e7VzNrkJ8+iF2qlT7Q0=; b=k
	Ygu/R1rubFOjsxjr2rg/eMWJ1VPHmbmNnGYftqVhGkSHux5kvV3PlCO44SR8GWpm
	X/iKLXC4JhvQydF5Bxyfr7+Kaf8kTlSdlWPAhvkvar1OIk8wJ0AWEToVB1qilz6O
	370FlI5zEe9qVyEvWtVUt1heQvMhx25jQVQcW4AzBynQgREFcB8ZbrVPNUCbwgw4
	ZO1uVqnXHXWoc6oBhlUmYyG4Dk4kHgQNpu8f1sVFvguCyrjvyRzjOqJp1kcRHNT1
	cD1ti3zRpoSbCKF+UdT+qVDM4PE6m9WU2rTKYPA4IW0Y83XyF9z9hO4aUPGGpFJn
	f0k2hpvzXeEx7CaHrx4tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665507168; x=1665593568; bh=C3UQ9ArIG3SiYomPhWP9uLz4e7Vz
	NrkJ8+iF2qlT7Q0=; b=VY2onS2t8ckFZzhCdiWJbY8L1hhspdrb6xTCxz1s40SY
	L1uA0r0cl3NbP/ILZBF0EuJdEDEUbNjIxZovx0++jTGoIng+TSevNLA9Il8KL7aC
	kUuxgMiMS5aJd1fdBBw9JvmrPX2kvfVoHjuFAWTQxGQxIy+vcEnKS8+o0kZFRMbd
	G/PSJ45bs9njaKSqT48fn4HlubtUskLWunpKbK+txd6yTKhNk+NrlfXK/gu9y6MA
	EE3X4ttnyAH1eb8fRWV+USk+EKMOeSKmRNUprmWQLsbCOqDXYXGISpvWqvTgTI5N
	KjAYu5O0InkHEnMWebIgQKHFFLfFi558uQ2N5687ug==
X-ME-Sender: <xms:YJ9FY_ET-TYNogzIayHDRCG-IrL3glUjWnxYi1rO28fAB1-YHXbmIg>
    <xme:YJ9FY8UfGtiTSzmN82i7LvckFtV-QSH-uqmFvWu5h5p8EMdOlrkuSBYo2o2S8Po3E
    Vjyu9FrCC35smQ>
X-ME-Received: <xmr:YJ9FYxLdppJIFmrHS0fpKN5lltHDAuBNwRDBdYnL6G0alQu14NAzkiet4CjE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejiedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvuedtgefhffffvdegtedtkedt
    hfduffdtudeigeeugfejieekueffueekgfevgeenucffohhmrghinhepgigvnhhprhhojh
    gvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:YJ9FY9G4JQk9_TEFqhUaULl3RyHCflHl_r4YE1uF_Tr4pGNeDA9H0Q>
    <xmx:YJ9FY1U7C6SxI1mRfk6d_eYLsfvVU1exYYJO52-xx658JirYlhm00g>
    <xmx:YJ9FY4M9WdlnYToZe8fyGzccGYKtYZG6C0V_ISByEhk8X-SRNBK_9A>
    <xmx:YJ9FY2fKt9QYjhEVeoWev5RMTeaAh8_rBrgH0F-FSPexk9B5GxxQuA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 11 Oct 2022 12:52:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Y0WfXttQHfFle2R7@itl-email>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <9c1731eb-44f6-41c6-cb4e-51abf0c50052@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzkCLTD7EOYUE31i"
Content-Disposition: inline
In-Reply-To: <9c1731eb-44f6-41c6-cb4e-51abf0c50052@suse.com>


--hzkCLTD7EOYUE31i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Oct 2022 12:52:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT

On Tue, Oct 11, 2022 at 11:59:01AM +0200, Jan Beulich wrote:
> On 11.10.2022 05:42, Demi Marie Obenour wrote:
> > A previous patch tried to get Linux to use the ESRT under Xen if it is
> > in memory of type EfiRuntimeServicesData.  However, this turns out to be
> > a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> > winds up fragmenting both the EFI page tables and the direct map,
>=20
> Can this statement please be made describe Xen, not Linux? Aiui at least
> the directmap aspect doesn't apply to Xen.

Should it apply to Xen?  My understanding is that Ard=E2=80=99s statements
regarding mismatched attributes refer to any kernel, not just Linux.
You would be in a better position to judge that, though.

> > and
> > that EfiACPIReclaimMemory is a much better choice for this purpose.
>=20
> I think the "better" wants explaining here, without requiring people to
> follow ...

Something like, =E2=80=9CEfiACPIReclaimMemory is the correct type for
configuration tables that are only used by the OS.=E2=80=9D?

> > Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg0=
1365.html
>=20
> ... this link. Since the code change looks okay to me, I'd be okay to
> replace the description with an adjusted one while committing.

That is fine with me.

> However,
> if you expect the change to go into 4.17, you will want to resubmit
> with Henry on Cc:, so he can consider giving the now necessary release-
> ack.

Will do, with your updated commit message.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--hzkCLTD7EOYUE31i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmNFn14ACgkQsoi1X/+c
IsH+2Q/6A5XGSxnT0LaZ3RYuDjNltuulYLcvgf3uAzvwRa79sXqgs5U3FYuo35kg
kBoxBz2jwrYYQfNQAUeFp8MjTJYvBLsrwURnMGrtqsaXcypJA28x6RXWZedzNnHx
raY+kBDvJosAOexH+kBXop6FTs/ZobEw5htFny+f7ZRpOMmPQIiTtgjnhyInEOZ3
gw7XvPNvkk+KYvkzR0eT7Yp4OMIjXMi4Cmy8x2Qx1QnHgzoNTFsaGAvOScByFnNR
N8mTFaDaDErIFUySiBkAiFMGNsC90mCNIXHPfGmlFqMwcBoMfjJ4nxFZQKgDTG/p
UZSC1TwRYrx2XbCCh1QpDq01weXOg4witJdExUHQHqoczxrGzdZNXFTcLn0Mgrp+
MsC+QNRjrjBJg7ze0RrXGgFpg8JmbCtfQpabvz03Jripbo5TpvlQvkpH7Xu6p9ym
L0wgWiEdKykBGd89b0zdZDfo+CWFcA8z42vGhhaH7lYgHKwaPvnMYLoj3j07pFyi
PWlQ1HWRBj72RHy/25kzmsoA+A0OJDSpie8mHG1u3GHhU3WIuAgiCjrBI7F3D6Sr
kObxQLZDVTEhQ6tynDLBekwH7LkZQwmRF6PaY+xoxwW8riEAhFMzwTKwb0kNWYlx
R1rjc10Nitwqp3Eyx6OC/7LuES+P0Qh3/SrC07qIjxTQJlKw0mY=
=496+
-----END PGP SIGNATURE-----

--hzkCLTD7EOYUE31i--

