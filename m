Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580FAE63A9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023593.1399586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1wv-0000Kk-Ln; Tue, 24 Jun 2025 11:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023593.1399586; Tue, 24 Jun 2025 11:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1wv-0000JJ-IY; Tue, 24 Jun 2025 11:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1023593;
 Tue, 24 Jun 2025 11:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU1wt-0000J4-JF
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:36:23 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73194b91-50ef-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 13:36:21 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 877891140249;
 Tue, 24 Jun 2025 07:36:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 07:36:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 07:36:19 -0400 (EDT)
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
X-Inumbo-ID: 73194b91-50ef-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750764980;
	 x=1750851380; bh=jGHHXZDvYPXiqdfREX+28aA5rNquNgwNysAfmLeCugA=; b=
	cs0uLU0+9ZmbgiDUU6RZ3AwovGtYpHIRkLOQpUN/Pf3vq5hjNwOaf3h3Gk59MCpj
	XBcHmM5//Yrusqeyef/AdGon+MOt8Uxg66jGp3z7ffqaDdCC6JvNm3gmlTKUpLni
	lfMue9DRvKXUVnD3lhOmb75aq9XZPVqroXqmNYLdcZAt6h/Pg5hAHiZg/5fIr52E
	IN7XgoPokedhoCQSMORbMpSwRicgoTmUuwyYfnyljxKlu4AZRTobzOshZleQcwpg
	JP28YaTRLkhP61M4Odfag3dqGAJZzVb5NWuA/7hjqwypVGdH9FwqhlGRM8SPMuwc
	NGLqARqr4sh56cpcFoX1aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750764980; x=1750851380; bh=jGHHXZDvYPXiqdfREX+28aA5rNquNgwNysA
	fmLeCugA=; b=GPoEBLYPrptBEFz4Y2HgUba+X+Nv/ObYQbTfR1fi6z8NqiMi3Wk
	ynVZw4ODbymkZGUOAvza9XW1TaTz8hjWYVYzh53A9L0ubmqu32ygW4EPL98hTXAD
	0XLsfLsIRPRB7NplW9CL5kPeBC6tsicy0HlO+dS+5EpPMJiKzjAg0WboTU3qZjfx
	5uV7PSUwpkiQ4hnUqJD/Jij6ux98B2hmBgZ7zNuWQ99mLa1Z9Val0woOQNwm3/AJ
	1FPM3NmSIt96rM76nLpKRh66EBFywVIiNzUE4r/UV1xRwtZieWNKY+gD+8g22Nj5
	2+WCvJOJyBqGmsY3BhsH+outG2ua4jpRcpg==
X-ME-Sender: <xms:tI1aaBAZlMdEDFWvSRjDwDy9Be6xJpbvxenSfB9cnY_i8xdSWb6GqQ>
    <xme:tI1aaPgnSUs2GP4Kghj7lMqjp9gLnZ_AhQTXzVJP7moj8E1pHk0H1algpzYPlXarX
    oC-8MH2XrYLpA>
X-ME-Received: <xmr:tI1aaMksD6hmYxzXg8kmsoxSKeVVLooadojGZ_Eexv7ykXxfzSI5nXmcErT5siYBdOwzLciPmZ39z4xT1k-LmMjn9E4x12PcHEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:tI1aaLwT4gyPWCow2bLm9CHnKZ5cBPubUi0fGjrdICb4CciutANapQ>
    <xmx:tI1aaGQTkQ-WqC0MGFpw3vYpq5twwaX08LLXWPsM3JN41d_0JhIhJA>
    <xmx:tI1aaOa1RxEuSCTQeFIgBpIpzN8iqQXawMsJEoD6Kc8gP1OVoWTCOQ>
    <xmx:tI1aaHSoml_wKwgyFAy19UdmLZTS6avFvk8toGjpjtapoQUHQMz-tQ>
    <xmx:tI1aaG-n050CF5zFxSTU0h-llPjXPYYNPDS_q6hw9dbM4x24dCi_v2PG>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 13:36:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not undefined not defined macro
Message-ID: <aFqNsfeXF_C_1LSN@mail-itl>
References: <20250624063611.236876-1-frediano.ziglio@cloud.com>
 <CACHz=ZiP=vLAK1caJymLvazX3KZLUwU9HtymvqWVHzq2xLaBGg@mail.gmail.com>
 <aFqNYxzF7U-E_yH1@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="65ugyNPzkkQuEljJ"
Content-Disposition: inline
In-Reply-To: <aFqNYxzF7U-E_yH1@mail-itl>


--65ugyNPzkkQuEljJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 13:36:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not undefined not defined macro

On Tue, Jun 24, 2025 at 01:34:59PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Jun 24, 2025 at 09:33:41AM +0100, Frediano Ziglio wrote:
> > On Tue, Jun 24, 2025 at 7:36=E2=80=AFAM Frediano Ziglio
> > <frediano.ziglio@cloud.com> wrote:
> > >
> >=20
> > Typo on title "Do not undefined not defined macro" -> "Do not undefine
> > not defined macro"
>=20
> With typo fixed:
>=20
> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.co=
m>

Oh, and maybe:
Fixes: 59e087bf6a9c ("xen/keyhandler: Drop keyhandler_scratch")


> > > The "buffer" macro is not defined.
> > > It was defined till commit 59e087bf6a9c8ad805294c32dfd7c77068d81eff
> > > (cfr "xen/keyhandler: Drop keyhandler_scratch").
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > ---
> > >  xen/common/efi/boot.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > > index ded7cc129d..1a9b4e7dae 100644
> > > --- a/xen/common/efi/boot.c
> > > +++ b/xen/common/efi/boot.c
> > > @@ -513,7 +513,6 @@ static EFI_FILE_HANDLE __init get_parent_handle(c=
onst EFI_LOADED_IMAGE *loaded_i
> > >      else
> > >          *leaf =3D buffer;
> > >  #undef BUFFERSIZE
> > > -#undef buffer
> > >
> > >      return dir_handle;
> > >  }
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--65ugyNPzkkQuEljJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhajbEACgkQ24/THMrX
1ywMRQf9EuzV8PO6Uj5c2ZE+ts4JewX6ABN68oqXWDpnfypBOMpHxuvdNJqqyHn6
bC2b8zDjrpVCxRc/k9Kk7koiRg9aZKpqqSElCnZaSO6KGOJzRYIGOzF3K26y9nKB
RzfT4X4sGqQwzFUc0QCOFEjA2rBZFzipMl5AWydrVPjzJUR1oAiu+l7sR2odbkL6
aANcyDSVkHfJZnx5wtlI0fHQxPcdhMvOftg1gEaXCClW/bm3fwrkS893wjGsnh02
PJ80DCAybzH6fOL+ODd3ai/vZCYQYqiP4qi/OXWtLUYCFEa+qTNnxkzhZb8ykAur
VTKCuJuU9ZX904Ks+2np2Ukhex1R9g==
=ZDHY
-----END PGP SIGNATURE-----

--65ugyNPzkkQuEljJ--

