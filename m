Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF0BC94A6C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Nov 2025 03:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175244.1500089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPWmo-0005bC-Eq; Sun, 30 Nov 2025 02:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175244.1500089; Sun, 30 Nov 2025 02:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPWmo-0005Y8-95; Sun, 30 Nov 2025 02:03:38 +0000
Received: by outflank-mailman (input) for mailman id 1175244;
 Sun, 30 Nov 2025 02:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B770=6G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vPWml-0005Y1-Ty
 for xen-devel@lists.xenproject.org; Sun, 30 Nov 2025 02:03:36 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c228189b-cd90-11f0-980a-7dc792cee155;
 Sun, 30 Nov 2025 03:03:27 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DD4477A00D4;
 Sat, 29 Nov 2025 21:03:25 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sat, 29 Nov 2025 21:03:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Nov 2025 21:03:24 -0500 (EST)
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
X-Inumbo-ID: c228189b-cd90-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764468205;
	 x=1764554605; bh=VfFTcoiKRLgWpaPbyHNH6HnuHDajzHNJEK5r9l7Aux4=; b=
	ocHB1Sb1xQzi3PacVg5qWvyBvSG1E+Yul7CRNX3LKbgg/YT3GMF+5CDIWKvZf8DA
	TzEOxALQ31ffcfhy4ggI3vefUDrvSEynLovJy625q5VqgvwtkOHg6bVBsK4vtHlC
	lpID0/liwo2fU9XY/9DuG0pXRXshTZak6TrKZ41JO/YKUjiF8m+RXLYYitd7BnR5
	TbAeAP+IRqHjaoStIJy1wj6+ryrM+ndIfIzHgRhEC8MFUu8BrAAGjJBPHgzo9/1m
	zj3qKoBxjgjrQbkvVwNRXgcNRGOB2l/+z/5IbR6P+cSK6ydAyf73hDCpnthap+Tg
	kkZgV+KYkpC1A26AwAA68Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764468205; x=1764554605; bh=VfFTcoiKRLgWpaPbyHNH6HnuHDajzHNJEK5
	r9l7Aux4=; b=bg8HRzhZFYyrx4b2oZTw2dvUjeFpJNAeG0CD9T9UXQmt6m+EsWG
	QX5hcSelmqj6ZiPlo9SvIbm/+ALJRx9CRHSD8BlsIpCFbm1lA0N/RWticEVoDQqW
	TazOxD5/yrB7CITvE3SFD1Amph4B3LfjFcHpFMeB9aH9hGnAUs79lcKxCArtoO/H
	MmdYJsG6N7RBJ7LjWYXCZ/cseArR079DJZUbaewwB/t8Byrlw+fi1PDwhNzzvAOW
	zVQqzfDTkDLTpNEI23TFosyyCugCD24HEUWCAKMC7JJoBYNHxQSWnDrg35XGFs/T
	hDoLloTUmNh3F7bGDJsLGvoR/Ctj5ZF+6gA==
X-ME-Sender: <xms:7aUraWFTKsGH7ah-x_monkKVznCuwYjSSvlRoIcjDKQ6f6097HSnEQ>
    <xme:7aUraYAUCtC7JR7LJUt-FvWbFT9HlcwShQ3mmP6SH6tnENcqQPA_EjHDC9a5lHa7_
    HFhIT-9o1ry_5YmpUCWFgcAc9DS_tEa62Od3GTCmRJePWxDxw>
X-ME-Received: <xmr:7aUraeWOatD6RZ-f9BZksKdiIKkkX5R_t9LMmy5dDjpFTFNUfZeUTM25qXwATDvFoMbi9B2z0lfNzMx-L7Q4UyLbiJyAVUjwHtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheefjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghpthhtohepjhhgrh
    hoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihshhgthhgvnhhkoh
    esvghprghmrdgtohhmpdhrtghpthhtohephigrnhhnrdhsihhonhhnvggruhesvhgrthgv
    shdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7aUraUr1KR1_OTBsMhrrSWw8svfyngjK5pah-PRYhMdso5fEzPUlpQ>
    <xmx:7aUraSRIUN3up5XSO6IHqLmyxACdyEpPzedzYzqdgr_cDFoGdmWQ1g>
    <xmx:7aUraW0KmKNivwL7Krzhfj1lFNqia75hvr9GjT-tq7RpohxWTgW-Uw>
    <xmx:7aUraWAcI_f1b_muMBIQrE-Od9MkG5pDWGz9imBsgUguoSJO_xG34A>
    <xmx:7aUraXWPZkQl2TeovoZ6wb4hEawz_v0_MLRomHGDiOtj7hArkvDPcKDB>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 30 Nov 2025 03:03:22 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
Message-ID: <aSul6qAYTSOSFJR3@mail-itl>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GHry3QnaPKrirc8h"
Content-Disposition: inline
In-Reply-To: <20251119224731.61497-2-jason.andryuk@amd.com>


--GHry3QnaPKrirc8h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Nov 2025 03:03:22 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices

On Wed, Nov 19, 2025 at 05:47:29PM -0500, Jason Andryuk wrote:
> The goal is to fix s2idle and S3 for Xen PV devices. =20

Can you give a little more context of this? We do have working S3 in
qubes with no need for such change. We trigger it via the toolstack (libxl_=
domain_suspend_only()).
Are you talking about guest-initiated suspend here?

We also have kinda working (host) s2idle. You may want to take a look at th=
is
work (some/most of it was posted upstream, but not all got
committed/reviewed):
https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-1538089344
https://github.com/QubesOS/qubes-linux-kernel/pull/910 (some patches
changed since that PR, see the current main too).

> A domain resuming
> from s3 or s2idle disconnects its PV devices during resume.  The
> backends are not expecting this and do not reconnect.
>=20
> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
> resume/chkpt") changed xen_suspend()/do_suspend() from
> PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
> suspend/resume callbacks remained.
>=20
> .freeze/restore are used with hiberation where Linux restarts in a new
> place in the future.  .suspend/resume are useful for runtime power
> management for the duration of a boot.
>=20
> The current behavior of the callbacks works for an xl save/restore or
> live migration where the domain is restored/migrated to a new location
> and connecting to a not-already-connected backend.
>=20
> Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
> .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
> save/restore and live migration.  With .suspend/resume empty, PV devices
> are left connected during s2idle and s3, so PV devices are not changed
> and work after resume.

Is that intended? While it might work for suspend by a chance(*), I'm
pretty sure not disconnecting + re-reconnecting PV devices across
save/restore/live migration will break them.

(*) and even that I'm not sure - with driver domains, depending on
suspend order this feels like might result in a deadlock...

> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xen=
bus/xenbus_probe_frontend.c
> index 6d1819269cbe..199917b6f77c 100644
> --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
> +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
> @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct devi=
ce *_dev)
>  }
> =20
>  static const struct dev_pm_ops xenbus_pm_ops =3D {
> -	.suspend	=3D xenbus_dev_suspend,
> -	.resume		=3D xenbus_frontend_dev_resume,
>  	.freeze		=3D xenbus_dev_suspend,
>  	.thaw		=3D xenbus_dev_cancel,
> -	.restore	=3D xenbus_dev_resume,
> +	.restore	=3D xenbus_frontend_dev_resume,
>  };
> =20
>  static struct xen_bus_type xenbus_frontend =3D {
> --=20
> 2.34.1
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GHry3QnaPKrirc8h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkrpeoACgkQ24/THMrX
1yz/Ogf9Ek/ScDnxgj95/cV4QGqaDGahXHzdfQAL6aWzCCOi4Gt8cgtgEjVGdi1A
ZN5db9IQ1ORWcVPndp+G4rynCxA4n/ccz1S3fbWILhMKaVOpZvTyVqfJETYgKRAk
TlBtCKLUBEMQ/T5Imv2v4OhIJW052FNCFLzQBLElBMUrLYjLb0jqhfEKkQygqRdW
PX2anpJ/0iGcAvXzh72KKIjQpTfLvOjE2vEcAIJ25WFAZTJxmwEnWvpx2M8f8kSs
udLkNZp8WNU5LVMzykRqNT5HSg+3KAEbpbn8xCTUnPv/qWaR2E+zKUg6Zcx27ZoJ
/eOql8bba73bg97GmG7LH34Skvm21g==
=nE9I
-----END PGP SIGNATURE-----

--GHry3QnaPKrirc8h--

