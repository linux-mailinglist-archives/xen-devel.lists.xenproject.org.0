Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A78BE5DE
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718219.1120785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LmC-0007OV-5I; Tue, 07 May 2024 14:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718219.1120785; Tue, 07 May 2024 14:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LmC-0007MZ-2i; Tue, 07 May 2024 14:26:40 +0000
Received: by outflank-mailman (input) for mailman id 718219;
 Tue, 07 May 2024 14:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4LmA-0007HX-72
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:26:38 +0000
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb64a1d-0c7d-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 16:26:36 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id A39BF1C0010F;
 Tue,  7 May 2024 10:26:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 07 May 2024 10:26:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 10:26:30 -0400 (EDT)
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
X-Inumbo-ID: cdb64a1d-0c7d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715091992;
	 x=1715178392; bh=thdWYW9Axd3S2TbzcgPEsebhY8W24WIZD54DTU8mwcc=; b=
	nA5KnFuHO6K9cJtYbMOGtqDsm76JyiJBP1TEhs5YliBG734dI1/znAOqMBA+1d08
	UJHdQ3LCPPquYFyKS1OjmsKtvbVpA59lFqQIvCuRY3QfYRPn2XPWw3uiI43U7cwh
	lDcDHiT6Zpw99wPzXSACTjQZ/2Hi3EW2M6FyyocKZ4fMqyFLwr692i9O2bUD6hIt
	5jelM8U68o60tVbrMdyjBV6JnWvkX/iWVHfAwwp0YfXg67hOXoH9CztPrMr1Kk9L
	DGylXWXXFdfk2P8u/kn2+5RnZ4oZtHZUk5puMUvIC4gEDl5XCasfnsfnRyQIkZxh
	dezKCbIdkSQG1HLk8IEfsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715091992; x=1715178392; bh=thdWYW9Axd3S2TbzcgPEsebhY8W2
	4WIZD54DTU8mwcc=; b=SXUeizl+W7owp4VctUFPfE59NQr298xuoAZnyzgAg65B
	+GKTcV414TDY0iZY3Wzj0ysAwhnmllDzLSVGu8087YoRsQNd6QqyR0wwOTXmoM6X
	84Ib8mwOu7yIVM+y4F4x+IV+ZMWLuRJcjWPz+YThvobwzE8ZBLtI4sqqB1XqcWTz
	61zgjiqhZSgZza7D7MArCvBjnWTNT69saRIjOyUcaw9jD3JY0BFDqTQEkGUE/jSU
	o1OkbybCC4PyyBHA/GWoHlv4qx2bggof/DIyrVR91nfXWhnoxi2O5OYW9r0qChzU
	FYpX2oFb8iqBc9k1v4DIsL9+s1+JEDWm6/XaO+zoHg==
X-ME-Sender: <xms:Fzo6ZhjtPA2xk_TXchwOloeqmEXPY3Kv4MQh3AzjgNWYwU1XiI4Qrg>
    <xme:Fzo6ZmCfCgp39eTo0LFhEjl6lcqXu2ZrurCMWPIGaqp0ZLPGjRlxuCrlCj617HWBO
    5rQ6uTKMerqUA>
X-ME-Received: <xmr:Fzo6ZhF0lvVrgM92idJ-NorMNZQq8ad9tyXa2zPg0rXyP88zh8OdQmsxPkQxbAUZxuRYXthHUP6fKxMNTqDRvVEM5u3KuAYFwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:Fzo6ZmQd5r9Qh7YFLalW0qCjrYmjQczJurjHbbssi-u1sD8EdjtHqw>
    <xmx:Fzo6Zuwf1n8OG1bKlCzeWZA1XmIjby_nrHofUqod9NLEckADNpi5Kg>
    <xmx:Fzo6Zs47UGWyVMNhkAADgDhG-4MjgrJmMul26DU4ktY_E7rxA4aN9g>
    <xmx:Fzo6ZjwcanFtziJR8rokr8oItvYHs06Gl6FbTXXU4VE-5NutqWS4Ag>
    <xmx:GDo6Zot21DMmRhIlf19tTvxBUX-nQSEvtlYIt8dEV9qAtLxlY75Plfld>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 May 2024 16:26:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC
Message-ID: <Zjo6FNSnL6JNfK9l@mail-itl>
References: <20240507110806.1692135-1-andrew.cooper3@citrix.com>
 <ZjoRMHmL8_K9_lsL@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M/M/fcStNov/GPjV"
Content-Disposition: inline
In-Reply-To: <ZjoRMHmL8_K9_lsL@mail-itl>


--M/M/fcStNov/GPjV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 May 2024 16:26:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC

On Tue, May 07, 2024 at 01:32:00PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, May 07, 2024 at 12:08:06PM +0100, Andrew Cooper wrote:
> > `xl devd` has been observed leaking /var/log/xldevd.log into children.
> >=20
> > Link: https://github.com/QubesOS/qubes-issues/issues/8292
> > Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Anthony PERARD <anthony@xenproject.org>
> > CC: Juergen Gross <jgross@suse.com>
> > CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >=20
> > Also entirely speculative based on the QubesOS ticket.
> > ---
> >  tools/xl/xl_utils.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> > index 17489d182954..060186db3a59 100644
> > --- a/tools/xl/xl_utils.c
> > +++ b/tools/xl/xl_utils.c
> > @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidf=
ile)
> >          exit(-1);
> >      }
> > =20
> > -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND, =
0644));
> > +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APPE=
ND | O_CLOEXEC, 0644));
>=20
> This one might be not enough, as the FD gets dup2()-ed to stdout/stderr
> just outside of the context here, and then inherited by various hotplug
> script. Just adding O_CLOEXEC here means the hotplug scripts will run
> with stdout/stderr closed. The scripts shipped with Xen do redirect
> stderr to a log quite early, but a) it doesn't do it for stdout, and b)
> custom hotplug scripts are a valid use case.
> Without that, I see at least few potential issues:
> - some log messages may be lost (minor, but annoying)
> - something might simply fail on writing to a closed FD, breaking the
>   hotplug script
> - FD 1 will be used as first free FD for any open() or similar call - if
>   a tool later tries writing something to stdout, it will gets written
>   to that FD - worse of all three

Wait, the above is wrong, dup does not copy the O_CLOEXEC flag over to
the new FD. So, maybe your patch is correct after all.

> What should be the behavior of hotplug scripts logging? Should they
> always take care of their own logging? If so, the hotplug calling part
> should redirect stdout/stderr to /dev/null IMO. But if `xl` should
> provide some default logging for them (like, the xldevd.log here?), then
> the O_CLOEXEC should be set only after duplicating logfile over stdout/er=
r.
>=20
> >      free(fullname);
> >      assert(logfile >=3D 3);
> > =20
> >=20
> > base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
> > prerequisite-patch-id: 212e50457e9b6bdfd06a97da545a5aa7155bb919
>=20
> Which one is this? I don't see it in staging, nor in any of your
> branches on xenbits. Lore finds "tools/libxs: Open /dev/xen/xenbus fds
> as O_CLOEXEC" which I guess is correct, but I have no idea how it
> correlates it, as this hash doesn't appear anywhere in the message, nor
> its headers...
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--M/M/fcStNov/GPjV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmY6OhQACgkQ24/THMrX
1yzYxwf/VMal/oF542eF20bsWJ4/D1LGZkkLrWwHBJ7WUll7OfeorN3XU5J1uWuc
Hsbh/rw1VcN1GHsm9BKSuyOdTHarxz2nmueFtTPSC93tLGOwd3E0I5cuD1IJB/tm
TLYbI30cduPZVDpIpbmU5E+7s/fjbWz5KT0Z5yHbUub0CGErF6hqx3YIBcyNut/X
V2reBK/hU97uymaG6r5TfqT0t0ws/2gWYyj331ITkJLwQXd0PRrE9mRFWjxS4l92
nf1/CB53o96HV+wfGKoXSQ4ZgCl81ctFkYDNKcCULs0JMDcIMHBEyVGW+TNKgoG9
WlAw4ani2Qw7LKYwUbsC96G8ts366Q==
=AMNU
-----END PGP SIGNATURE-----

--M/M/fcStNov/GPjV--

