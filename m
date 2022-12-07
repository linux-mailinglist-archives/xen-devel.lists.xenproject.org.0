Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181964642E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 23:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456681.714466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p333H-0004hE-PC; Wed, 07 Dec 2022 22:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456681.714466; Wed, 07 Dec 2022 22:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p333H-0004ea-LB; Wed, 07 Dec 2022 22:38:07 +0000
Received: by outflank-mailman (input) for mailman id 456681;
 Wed, 07 Dec 2022 22:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV5z=4F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p333F-0004eU-H1
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 22:38:05 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa237b1-767f-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 23:38:04 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C9DE5C00EE;
 Wed,  7 Dec 2022 17:38:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Dec 2022 17:38:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 17:38:02 -0500 (EST)
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
X-Inumbo-ID: cfa237b1-767f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670452683; x=
	1670539083; bh=5jvlZKAc1GkFb1E2a6lBpTO6lLObZ/xQoHLfWhmhXPg=; b=d
	QsxjSR2+11JYkS3Iy7CegPEh9x80Tvvfqx0IfV14vQvCGdRh+2WxZs4dnky1R5Eu
	mre4NYHGerGTvv01YIkNcgvEQH/gGb5o9dmqS+lW3+qHU03s9IWBG30vETRgNNGw
	OUQFOuCJo8aVmaH5560vmGMFF4Pdd1MAX4OmTKhsAT/cLju0qhlOX5frYGOIeo9l
	C9aZcRN6RUS3+URxW283bEIzaQmCtJrNyG0L74o1pUnyRCE9gzQxno2b5ZWD+SfE
	fpCtvIZzqjmFzuKTMGrL8AipNMYjgb+rqPWgMBoMMUVZuz+xzqFj+neM4AZxovZ4
	3ij0TF2XIEj+1AtbBVUhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670452683; x=1670539083; bh=5jvlZKAc1GkFb1E2a6lBpTO6lLOb
	Z/xQoHLfWhmhXPg=; b=slqIqjWsx1nlvYe2KIQswdxqC1+OSKisV3C3+6B53r2G
	5wNhSPLe79CPCDIWBoUr2kLpC+49cCae8Byjy2QxEvJoR8ZaxC8Ob8UkT8D0cnHn
	6RwJzTmoDyL2Xzjmh5Owgt4HFNbtN4F4iI9cVN6ss/HZPD8ARGFD1TC5JpyjYLDW
	3FozBivTSzPafHzlrZ39G2pmSBIa7YvItxo9fTcYc/Q6AM5H5BoCwfS3j++ux+wO
	U6nsLLXtucr3CJvYhI3BmIaCIIf4W9OZbTwdZv1udGpu4GTKsyslV2Iwugy3E8pL
	OwdS9SawhFNlE2bnAK+IYC+u9cbIPYmvqQEeK+kT8w==
X-ME-Sender: <xms:yhWRYwIwSLy56s-iD_Zr_ZMap9VHE_LYlUYQML8wQFFYcesVCrOTzA>
    <xme:yhWRYwJZrEtvD6fxNfeuf_9cb8xx-5GI21PyrVjD8ptvDZ-hJZ6za6Yi53VaJRCoU
    en50DG682sXXwc>
X-ME-Received: <xmr:yhWRYwsKktEuzQukg7vMKJUHQSTEURxf0D7dJZvlRC0XvaC89RTbWuXlOH69>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdehffelieehtdettedtledvuedt
    keeifefgvdehtdelteffudfhkefhheeiteenucffohhmrghinhepgigvnhhprhhojhgvtg
    htrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yhWRY9aUO4G73UY8xe_4o00lWGiYlZHT4LszKRbqnnhKTCbzjxU6Zw>
    <xmx:yhWRY3ZnopP5BqK7M_3pZlObOisE12M81CXiAEb5U4Q2bGTQia8nAw>
    <xmx:yhWRY5CtyPr14oCOYfMbSEDxaAadLdvvWySclNIqIAH8RKnOKZ1hMg>
    <xmx:yxWRY2mtCuHC4w2fz9iGI_Xu664VMmge4R3umy2Ej2jd-K3x4pujxg>
Feedback-ID: iac594737:Fastmail
Date: Wed, 7 Dec 2022 17:37:58 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>, Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Y5EVyHv2Wg+AjgGE@itl-email>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <678b618d-335a-fc9d-97f2-2c6e0e05ed79@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MASToXsrZ+jaYO4q"
Content-Disposition: inline
In-Reply-To: <678b618d-335a-fc9d-97f2-2c6e0e05ed79@suse.com>


--MASToXsrZ+jaYO4q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Dec 2022 17:37:58 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>, Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT

On Wed, Dec 07, 2022 at 11:11:40AM +0100, Jan Beulich wrote:
> On 07.12.2022 00:27, Demi Marie Obenour wrote:
> > A previous patch tried to get Linux to use the ESRT under Xen if it is
> > in memory of type EfiRuntimeServicesData.  However, this turns out to be
> > a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> > winds up fragmenting both the EFI page tables and the direct map, and
> > that EfiACPIReclaimMemory is a much better choice for this purpose.
> >=20
> > Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg0=
1365.html
> > Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> > Should this be included in 4.17?  It is a bug fix for a feature new to
> > 4.17, so I suspect yes, but it is ultimately up to Henry Wang.
>=20
> First I was surprised this is numbered v2. But it indeed looks to be a
> plain re-submission, merely with Henry Cc-ed. You didn't address my
> comments; you didn't even incorporate the one adjustment where you
> suggested alternative wording and where I did signal my agreement. All
> this form of plain re-submission (without any kind of remark in that
> direction) did is that I spent (wasted) time checking what the earlier
> variant had, what was requested to be changed, and whether any of the
> changes were actually carried out.

Whoops, sorry about that.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--MASToXsrZ+jaYO4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmORFcgACgkQsoi1X/+c
IsGWXRAAn7Kz8IA914xqsfiKj4i8+46lTz5U2MGpeItZYB9SWPMF94Mwxvw9W+1r
mHiX+iKDuznULK2Km+QENzHyiPCu/6QD/iks1oM48mAFSrM9OQLAVAF7hg1yJQ2x
e8upj1LtLMugdCCvPEMetmUrj8bVqgV+6yxLKXufh0Og9iwFA1VM4gci7LrPNYGp
ozWgPIa1BrFmxnNriKpG/XZbiMhcYB+PSk3sH4c+vkQ+hBKg7u/Yv7hJ/tnz80P6
D3T6lfWbDK9mJKwhSDAyUHBgiro2n1OLkVRML3sPLtntt6QVlcp5fr5ziqlJRA0a
VP57+pb+lEnTuJcl/xC3DnP79Fg/j9uraY+J18zBfKVjBorYnip5+PjmT2UWVnak
cGvI4AxcXZLos2usdgD3VOxdXX0tlVw0+GmsNBcOMOQfoSC+KCq5KdIGXWznK61o
XAVqLN5R7Lys4UpbeDMLoKZKNhf3cQWavQZZtKhX5NWX+JQEOjpMp1FqD6x+JSi/
Ih0iXfA0iSminVQjSQtI7qZCiDmWNdY3+XfJHns1XOtmN+js+mQ1GqJIzbPM5P0G
jknvSPYitDVv9D7+HYju/6yAMeHSBOqLK19gFkODjenyksqjQSSxVCZZWozPG0g4
2CmZy9WJ7j2mE4cUSPDTq13l/4eOZBaQT/A9se6HrpFyE+t/taE=
=udHZ
-----END PGP SIGNATURE-----

--MASToXsrZ+jaYO4q--

