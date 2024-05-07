Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3538BE5C5
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718211.1120767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Ljd-0005lL-HE; Tue, 07 May 2024 14:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718211.1120767; Tue, 07 May 2024 14:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Ljd-0005i9-Db; Tue, 07 May 2024 14:24:01 +0000
Received: by outflank-mailman (input) for mailman id 718211;
 Tue, 07 May 2024 14:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4Ljb-0005i3-FD
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:23:59 +0000
Received: from wfhigh7-smtp.messagingengine.com
 (wfhigh7-smtp.messagingengine.com [64.147.123.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f224551-0c7d-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 16:23:57 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 34FB318000EA;
 Tue,  7 May 2024 10:23:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 07 May 2024 10:23:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 10:23:51 -0400 (EDT)
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
X-Inumbo-ID: 6f224551-0c7d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715091832;
	 x=1715178232; bh=bGrzyVzYoeNKTDEvT1NrsJFQfSswRRZA4mlVkdChOC4=; b=
	Cm7+rs0r8ymQVUtc8inDSyNVEkJLu5ayDCehlqhXXc71cIwoHE/Nz0AAZIOgvFrJ
	hEtpAsyNgX0wxsgdvSTzCslDdwqtHNfYxx6SMps6Sx+Xgb9KKXJKzjaOp7/i2Gud
	Zf58qfY+HYmaCCxNEH/CVG2sWja3Jlu8zU9r3qZOM7lQ0RBZFJ5AwkhvfPQj/8FL
	8GHCsaRDWJ0kOqB5yCT0G84YfvaexyOXRPwYcp8gT69m4Ts3qxN95EYFfgvzMwpI
	eEifKZljeyJLAtMZ0M3g4u8NLAv3L99KXgdhBj+731jE8nMbMY7roiVLsZAW2kgS
	zko2qpKXUJlTvmopHDuJsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715091832; x=1715178232; bh=bGrzyVzYoeNKTDEvT1NrsJFQfSsw
	RRZA4mlVkdChOC4=; b=hzXkfExpFRItLKuQ9AYF3TPLX7FGI4GAfk5wAGNQkq82
	k2F/yBC4ZYzJqNK5mbfHoXaai1Xe/DgILBQjrLdxhPTkEPYRl5U1F2IY0E+tsSD+
	4epJVQMaDDkcxnMBufXLQmChpKwqXGWF1R9+OzD/livRj3MWDXJcRW9DjQuGsbOK
	wIFqIr/7315sOzcHNnflTQnybIjw/LvqdODk8LYeU/LQKal0fvg7uzAI6b9Q5YT8
	V2Mtshd5hf4vPIBdT+CU/MxRcbmx8B5Fj9CccQXvSvqm7Awduh7rp+wbtVTFJNqS
	PUidUHfs8NkwZKE80ohgBWqYig8/mXjeyd7gm9orUw==
X-ME-Sender: <xms:eDk6ZlfdjMhVvyzSofE3nMe8ghxQHsDDrrlD3OJX9j0tfEd7qeShAQ>
    <xme:eDk6ZjOEALkEnnbQAvlMqR34wh5e_GLI8sixzmQOtbSPs-TeX8HkbBYukgH5Ki1Y3
    GSkhWiaMKHB5g>
X-ME-Received: <xmr:eDk6ZuhzYkzZNQ5WD8IJHxOWdCStzfiSth38jQPQnc0HezENhQ4B3VbCn_CwgYj6IL1VfNzQy7JkR5MrY0XZmFDYpkQErCnrtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:eDk6Zu810UixtwjIhVt40vcfCGxwmWA60AlPhY7qVjBjE-J7zZ34xg>
    <xmx:eDk6Zht1IC5qsvT6Qv5NibcsrmZLYwPdZ3cyPFq-tk6A1QsBMs1WLA>
    <xmx:eDk6ZtG60qxqPRfFGJsmUv9HtXJ5bXDCUMpVB8eaHv6_Cwpqa1Kgnw>
    <xmx:eDk6ZoPi2tJtTbcBNmxU0_7GrhDJ2h2nvvbR6a77ekgJrML8QNFhDQ>
    <xmx:eDk6ZrIex4-1S7RnuC_XK2g3uA-G9vsb1xV9gGaaLC-oC97WhJINCFfH>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 May 2024 16:23:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC
Message-ID: <Zjo5dbC6iaFWUA8R@mail-itl>
References: <20240507110806.1692135-1-andrew.cooper3@citrix.com>
 <ZjoRMHmL8_K9_lsL@mail-itl>
 <549a101f-b9b6-47fb-a782-c716f1ce49ec@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eURIAwtQ8LuabfNF"
Content-Disposition: inline
In-Reply-To: <549a101f-b9b6-47fb-a782-c716f1ce49ec@citrix.com>


--eURIAwtQ8LuabfNF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 May 2024 16:23:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC

On Tue, May 07, 2024 at 03:15:48PM +0100, Andrew Cooper wrote:
> On 07/05/2024 12:32 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, May 07, 2024 at 12:08:06PM +0100, Andrew Cooper wrote:
> >> `xl devd` has been observed leaking /var/log/xldevd.log into children.
> >>
> >> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> >> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Anthony PERARD <anthony@xenproject.org>
> >> CC: Juergen Gross <jgross@suse.com>
> >> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> >> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >>
> >> Also entirely speculative based on the QubesOS ticket.
> >> ---
> >>  tools/xl/xl_utils.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> >> index 17489d182954..060186db3a59 100644
> >> --- a/tools/xl/xl_utils.c
> >> +++ b/tools/xl/xl_utils.c
> >> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pid=
file)
> >>          exit(-1);
> >>      }
> >> =20
> >> -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND,=
 0644));
> >> +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APP=
END | O_CLOEXEC, 0644));
> > This one might be not enough, as the FD gets dup2()-ed to stdout/stderr
> > just outside of the context here, and then inherited by various hotplug
> > script. Just adding O_CLOEXEC here means the hotplug scripts will run
> > with stdout/stderr closed.
>=20
> Lovely :(=C2=A0 Yes - this won't work.=C2=A0 I guess what we want instead=
 is:
>=20
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 060186db3a59..a0ce7dd7fa21 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -282,6 +282,7 @@ int do_daemonize(const char *name, const char *pidfil=
e)
> =C2=A0=C2=A0=C2=A0=C2=A0 dup2(logfile, 2);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 close(nullfd);
> +=C2=A0=C2=A0=C2=A0 close(logfile);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 CHK_SYSCALL(daemon(0, 1));
> =C2=A0
> which at least means there's not a random extra fd attached to the logfil=
e.

But logfile is a global variable, and it looks to be used in dolog()...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eURIAwtQ8LuabfNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmY6OXUACgkQ24/THMrX
1yxZ+Af9EwBLKKb20LbZ2RZhnpeodi5iGSRiJSHeDv1QDydizP1PDna7iZ2K3zjq
SvsHLknSCxfdZL/pgmG0ZB55/5LFLumX4vg70D1x/Uk14vBQ8Xrcp1LxjYaONjoa
nqlPNIkjBCSgMs5tZAsGa8ghe7uaTIEWvPaEYob+DO2eILvfAZuy4I8os700YhkS
sYsBAF3CD0wYlpBzpSQFh0zM3v6kf8d03b4Yh/p0q5LVmGL5wTKQhPUUCg6y7qCI
VLQLKofqY3B1ydhWCplBQ/TqljUNR/WMYyefDHmTxSOrlx7J8AwYaKgbjPXJAuai
HF4Fm4UhDjxDbBgLtr2aOSKgSUhkhA==
=2Skc
-----END PGP SIGNATURE-----

--eURIAwtQ8LuabfNF--

