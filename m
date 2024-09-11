Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71644975365
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 15:17:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796644.1206388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNDH-0007ia-3P; Wed, 11 Sep 2024 13:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796644.1206388; Wed, 11 Sep 2024 13:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNDH-0007fb-0e; Wed, 11 Sep 2024 13:16:51 +0000
Received: by outflank-mailman (input) for mailman id 796644;
 Wed, 11 Sep 2024 13:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIag=QJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1soNDF-0007fV-IP
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 13:16:49 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 189d8be3-7040-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 15:16:47 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0A3E3114010D;
 Wed, 11 Sep 2024 09:16:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 11 Sep 2024 09:16:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Sep 2024 09:16:44 -0400 (EDT)
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
X-Inumbo-ID: 189d8be3-7040-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726060606;
	 x=1726147006; bh=bYPZEUAipM7u6VdcloST123LXFYtaG/oFP1YO2vnOZ4=; b=
	cIJUKcT9U/nnakcGdyQpUC2wSxkRCn2q4zz7I++XuiIRmvn55m8dGQoqC5kK8hMw
	FMAS1rjRZO27iyqDH9rhuGgzPza6tU36ElJF/q1bta64Xiv20Hv9yyN0GkM7iVQA
	t5IseNrUewWBfDEojUvYWE95wFxqx+1aQkjTjN6wjSs6L749G0GN/vioGUpQolJc
	d1sfA77ucT8K2DdOMyiN9FbjcpiTawnC/pH7DY0NsVMriQh20dvO1F3L7hAKqW7e
	8Ax4sJAnbZQ9r7i/rvMSnfJsiy8EcuxOW6H64kTej9PKGde2MyxGmzcmD44Sd22c
	Iqc4bglXTf1rZgOdFujscQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726060606; x=1726147006; bh=bYPZEUAipM7u6VdcloST123LXFYt
	aG/oFP1YO2vnOZ4=; b=Vek+K6VJuJ/ttZylA1apE4I9BMFCkfKdyp1GhjVjTrD3
	K0wFSIamYaFNKjllV3AAIfDnwrg8dW1/VUzU+AsXWBtGS8WlLYlu+Lspn8AIALzP
	RvYx5aq3g2CdKFiksQjzFb4ww2VzC3tO+ARAVYR8ZsbaGdaRgyuienRz5HOTWsT9
	nQ7TbBRVJtUlSvzzDgyAonBw0hl/lBoouhCpAnX0UOX2Hj42pnrxx895+RZMwBIB
	cXh8cpBlnEOYruCvUiaSXmuFcinTyV6/L099+pwd4zXBNZ+4V1Xp80alYgSkaxBf
	6trC4IprOgRR9OALtLtqWXWvGylmzs4EmxVs8s4UUA==
X-ME-Sender: <xms:PZjhZlty6cLY7ZuiqnPT_F8VOuyK2wg546DMjkD0mS2LqjWHnhjGqA>
    <xme:PZjhZueO_VcbOfnqlU0r819o4a5kWPmVNSY3kqQvBtatsqzWxiwew503jxwJt8BZP
    7c8W-QdWPcsmg>
X-ME-Received: <xmr:PZjhZoy6rUt0t2lXVwQ6POoD4mxoSVARE2P-9kijAZdTEu2uagJQ-ul1JGMZrcvIIAv-0bifj_p-8WRP5BwWCMLWV4OUTSjgFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejuddgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghu
    lhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehfvgguvghrihgtohdrshgvrhgrfh
    hinhhisegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtoheptghonhhsuhhlthhinhhgsegs
    uhhgshgvnhhgrdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsoh
    hluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:PZjhZsOhhfTwTAHAALL7-mH_o67j8xsWW8Xz-iCnK2seXaMZiVW7UQ>
    <xmx:PZjhZl_WQqIcz4ag1yjC-wqjbqespt7O_ASHBMcEqEtZC8oETIlpuQ>
    <xmx:PZjhZsU8iaVMdD10F1LIDW_hyx8jEuVxY4cqnGdHsPg_GtT_7sc4rw>
    <xmx:PZjhZmdvQRa7AjoEQa6anEy3M8pdrxKYDVBWNn-4VlGjNuyjkcZiMQ>
    <xmx:PZjhZonXQWXmRNCHG5Jz5rHdcEBvsov8h2WjRI_O_yHGT-q9sD9_zQ2g>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 11 Sep 2024 15:16:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6
Message-ID: <ZuGYOldX55_ZfJCv@mail-itl>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <2e893e6e83fdfb24c5f9c4d2da59114cba9a1df8.1725994633.git.federico.serafini@bugseng.com>
 <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hCOuS/Lzdo+qqzsp"
Content-Disposition: inline
In-Reply-To: <c068874b-a4bd-4ccc-a9bf-08a996797543@suse.com>


--hCOuS/Lzdo+qqzsp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Sep 2024 15:16:40 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/3] EFI: address violations of MISRA C Rule 13.6

On Wed, Sep 11, 2024 at 02:50:03PM +0200, Jan Beulich wrote:
> On 10.09.2024 21:06, Federico Serafini wrote:
> > Refactor the code to improve readability
>=20
> I question this aspect. I'm not the maintainer of this code anymore, so
> my view probably doesn't matter much here.
>=20
> > and address violations of
> > MISRA C:2012 Rule 13.6 ("The operand of the `sizeof' operator shall
> > not contain any expression which has potential side effect").
>=20
> Where's the potential side effect? Since you move ...
>=20
> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -250,14 +250,20 @@ int efi_get_info(uint32_t idx, union xenpf_efi_in=
fo *info)
> >          info->cfg.addr =3D __pa(efi_ct);
> >          info->cfg.nent =3D efi_num_ct;
> >          break;
> > +
> >      case XEN_FW_EFI_VENDOR:
> > +    {
> > +        XEN_GUEST_HANDLE_PARAM(CHAR16) vendor_name =3D
> > +            guest_handle_cast(info->vendor.name, CHAR16);
>=20
> .. this out, it must be the one. I've looked at it, yet I can't spot
> anything:
>=20
> #define guest_handle_cast(hnd, type) ({         \
>     type *_x =3D (hnd).p;                         \
>     (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
> })
>=20
> As a rule of thumb, when things aren't obvious, please call out the
> specific aspect / property in descriptions of such patches.

I guess it's because guest_handle_cast() is a macro, yet it's lowercase
so looks like a function? Wasn't there some other MISRA rule about
lowercase/uppercase for macro names?

And yes, I don't really see why this would violate the side effect rule
either.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hCOuS/Lzdo+qqzsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmbhmDoACgkQ24/THMrX
1yxSLwf+MN/piLhr4b8GOdFN65JgPK9+efkUAB3oyfes/P9aEMxYJC0XhpIuwvI7
qSQ92AWjaEgyQ83Pc7J/lSlJRwsIxE3OfiscDJyKWlQjPSfj3xgYSVi6pe3xzybn
LRGX9NsXfOWM1DCTzUgtov6PNpZQRljTqikhj/ltx3w0o9Zr+PHHFAsweIxN7fwg
C1aElrmONR3W9zq0mAIxIKB+067UL1Kj2vXj1Gj8FckaJSeqDoqfJF1c5FVSNkmT
mapNQDe2g38xmiYHV1tc/6Q54ZCJLEZmYNj2SpM2oJdCfRQWkloTHWZXdeJ+CPQh
X0i0LlgBRhUvCiyL43pNSyBc8920wA==
=32r1
-----END PGP SIGNATURE-----

--hCOuS/Lzdo+qqzsp--

