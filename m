Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B8C848DC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171848.1496865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqaJ-0005IL-Db; Tue, 25 Nov 2025 10:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171848.1496865; Tue, 25 Nov 2025 10:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqaJ-0005GC-Ab; Tue, 25 Nov 2025 10:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1171848;
 Tue, 25 Nov 2025 10:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lEWo=6B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vNqaH-0005G6-Jb
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:47:45 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aaa2922-c9ec-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 11:47:42 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id BBB32EC0213;
 Tue, 25 Nov 2025 05:47:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 25 Nov 2025 05:47:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 05:47:39 -0500 (EST)
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
X-Inumbo-ID: 2aaa2922-c9ec-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764067660;
	 x=1764154060; bh=vKvzwv2WuQx8tfsEJ9gD04sEa7ga8SrxGx+O8by6l90=; b=
	IJfPmT6liRs/R6ItRZciU/VGCWg3QMHEI8FRy9dFM6RrkpUb7QBuPguMfvEWJUST
	cKkgN+uAWT5cYFK6M0qCsLxfUxu9VKvOP1a64JweIU1kKHlub4UzSqxVC01j/8mq
	fJ4PO+SmoPZHO3CoglI34Fu2ykQMMf7c+OPYqcxLOxbyNGqk0f/FlE/UPaOgfN1O
	YtDlccRslDIDMjE8Y+RpBqGJuEp3+fNDbDRqY6AKxXZLtxjggPbzDIWiv/ac81Jz
	aXw1IpRInwaEWXXy8jT/fAbynbktcVw7q9ncUWnbR0Um3mTIt6TTT6aANCG51pYg
	e3dSH5nd2CVX1J4Sl2OW0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1764067660; x=1764154060; bh=vKvzwv2WuQx8tfsEJ9gD04sEa7ga8SrxGx+
	O8by6l90=; b=2rXsaqUl+8MWJP5Edq8YpVA/Jek40Eg5zVUmFrbX2XTyVMqgAQC
	Yz0t9N0JIWNFcoGhaKn+EOglxEBB2abEtSLHegO2xtTqf1dBMDv8SOwTW7nkY9s8
	sVAqcJj/GII7SY1UHugbX59KK8P+gp2eiEUL4S7tGWv9zQCJBciFhRHghVlw7tj0
	9UXTZ0Gjnjo7Yd62mciOW4LYe1/KbVortW8nloHHKPYgw2u8eRkIaai8O+m0ENKy
	AvQWHdWxIEdIsxbGgoN6xoA/dVLwewycAmYn5QF94iN+262KQX27q92MLaoDwg7n
	ZQxKS9qAYMYDsvk6voa/mDVXJHCfzcr4Zjg==
X-ME-Sender: <xms:TIklaY0o_gIR-ZrMb_4Z6f3EJ93S4s42hEBcOuKC7I_dmW3p6HjECg>
    <xme:TIklaTxgUdWz3eCVIGsT3UwWL7mGxfa6YspIbYq1Z728NVjGwUWN3eh68fERQFAPn
    Qv7dpZB4niGQ0SjkKC528_lzs4KqmmCA5uzxTdQrr6v_XSo7w>
X-ME-Received: <xmr:TIklafG1IPflOUXfgghrO3aV5I5bcS3lz38_7qjeeKUq4HuP9KNIMa6Bqk7u0IGmlxJt2Z1paSdmfhOofSuMzWTs5SU2D4P66TE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeduvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepjedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdp
    rhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghpthhtoh
    epshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghk
    shgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdrtghomhdprhgtphhtthhopeihrg
    hnnhdrshhiohhnnhgvrghusehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:TIklaWZd3aaslcowgYsy2f2JnUHeexvy8jgdMEngtzeu8Ob9HkG8cg>
    <xmx:TIklaRDEDPBbXW0jGUphUXvlnJQz6KLQ8d6rujH7u6xZF0KXvmxN5A>
    <xmx:TIklaenVvtqNSWiXiQpIhCj5vlcxMomk2bJh2-1uXjdKZHMeSWl00g>
    <xmx:TIklaSwoyWv4d11bt5CKsfYuVrABdFrND4UuoKOvxBVnK17XjKbLqg>
    <xmx:TIklaVE3MO2R59rTd75kH6C-4ZCUcKDHCpTUssiQqOjntrIwTOPSqPcB>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Nov 2025 11:47:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
Message-ID: <aSWJSb4OK645r3tk@mail-itl>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
 <1c991699-51b7-4284-8179-6bc78f8f4eac@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MtahxU80cAG7ZM06"
Content-Disposition: inline
In-Reply-To: <1c991699-51b7-4284-8179-6bc78f8f4eac@suse.com>


--MtahxU80cAG7ZM06
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Nov 2025 11:47:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices

On Tue, Nov 25, 2025 at 09:20:55AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 19.11.25 23:47, Jason Andryuk wrote:
> > The goal is to fix s2idle and S3 for Xen PV devices.  A domain resuming
> > from s3 or s2idle disconnects its PV devices during resume.  The
> > backends are not expecting this and do not reconnect.
> >=20
> > b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
> > resume/chkpt") changed xen_suspend()/do_suspend() from
> > PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
> > suspend/resume callbacks remained.
> >=20
> > .freeze/restore are used with hiberation where Linux restarts in a new
> > place in the future.  .suspend/resume are useful for runtime power
> > management for the duration of a boot.
> >=20
> > The current behavior of the callbacks works for an xl save/restore or
> > live migration where the domain is restored/migrated to a new location
> > and connecting to a not-already-connected backend.
> >=20
> > Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
> > .suspend/resume hook.  This matches the use in drivers/xen/manage.c for
> > save/restore and live migration.  With .suspend/resume empty, PV devices
> > are left connected during s2idle and s3, so PV devices are not changed
> > and work after resume.
> >=20
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>=20
> Acked-by: Juergen Gross <jgross@suse.com>
>=20
> Marek, could you please give this patch a try with QubesOS? I think this
> patch should be verified not to break your use cases regarding suspend /
> resume.

Sure, but I can't promise it will be this week, I have some deadlines to
meet...

> Juergen
>=20
> > ---
> >   drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/x=
enbus/xenbus_probe_frontend.c
> > index 6d1819269cbe..199917b6f77c 100644
> > --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
> > +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
> > @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct de=
vice *_dev)
> >   }
> >   static const struct dev_pm_ops xenbus_pm_ops =3D {
> > -	.suspend	=3D xenbus_dev_suspend,
> > -	.resume		=3D xenbus_frontend_dev_resume,
> >   	.freeze		=3D xenbus_dev_suspend,
> >   	.thaw		=3D xenbus_dev_cancel,
> > -	.restore	=3D xenbus_dev_resume,
> > +	.restore	=3D xenbus_frontend_dev_resume,
> >   };
> >   static struct xen_bus_type xenbus_frontend =3D {
>=20






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MtahxU80cAG7ZM06
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkliUkACgkQ24/THMrX
1yxzGQf9GdYrtkeG1m/vQPue+cfveXJFKVm7XfGujsqM4nGtAx8hSG/XwFNDEvgN
ILoh86xZh/eJZpMiN7kZqc8irWoYEgG97GSyAnItDBOUyC4XSJfilsksf9COlWWp
il6kV0BUHIZLb3kGrU7Uj4rFv1WIWc5mpbmbPrhYsoXtXi+e9ujHyqc07upOSk9O
oScpLREBGgsHdXZjzyY6qyVjvkjpYooodoB0tE3SVC8gppuAkkVNxO9PyJiGkI+u
rltOL8xc3y51ldLUoxoyd0+KfttAEy7UsZR72dLvUyirfDn61Y9HvAuDUs4tJXxZ
vzj9C1Y58zQrwZVkkzPpF9ZVURwyJg==
=cKIe
-----END PGP SIGNATURE-----

--MtahxU80cAG7ZM06--

