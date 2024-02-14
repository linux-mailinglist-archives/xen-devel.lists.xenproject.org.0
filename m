Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27F854C91
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680986.1059480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raH55-0005h4-U8; Wed, 14 Feb 2024 15:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680986.1059480; Wed, 14 Feb 2024 15:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raH55-0005f0-QU; Wed, 14 Feb 2024 15:21:51 +0000
Received: by outflank-mailman (input) for mailman id 680986;
 Wed, 14 Feb 2024 15:21:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltoc=JX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1raH54-0005NE-Uf
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:21:51 +0000
Received: from wfout8-smtp.messagingengine.com
 (wfout8-smtp.messagingengine.com [64.147.123.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49a2fbc-cb4c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 16:21:48 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id 5614F1C0007E;
 Wed, 14 Feb 2024 10:21:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 14 Feb 2024 10:21:46 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Feb 2024 10:21:43 -0500 (EST)
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
X-Inumbo-ID: c49a2fbc-cb4c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707924104;
	 x=1708010504; bh=B9oNuKADKFiXlV8IGd26mv+ZZa9laBxiIk3H/egj2d0=; b=
	Eqq9Ue8/lwaNXBOQzmRoA3SIHBYCIjMYDqBOC61QNozvW+wYGEhmYwGoagysFV7L
	2Oyke7afD55W2SqYyQOVxT7TEYtIZPg9Z7jvdjJFeHpWUwpZrAKStMzaahsZJRzj
	m/rXWk7e524tTL5s5WR67nrv4EQXLQEEeCkYZRznBdusEnc4+gisP9J6uSFPpxrE
	/8KczKQTJoSYqR62/25m4mpiuDkMVDiwpphYRojo+sItrL95AEqV4F9QaxnZRGX0
	P3gy1wnUnwcj+SQ4KUaThBigjV3mA2Gv9SSjlVjuFbsmupR4/uI7B+22CAhAmCP1
	14KIJFmctTOOqBb/bzrnLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707924104; x=1708010504; bh=B9oNuKADKFiXlV8IGd26mv+ZZa9l
	aBxiIk3H/egj2d0=; b=xXPXzmXhfkKRVA/xPjBjdp62CSOm2Unwb6xQCYthT23a
	Kt6HUzbmoEePi03+FbssDokHk1ULmVkflqjgqWKRwS0xFaOC7/+Re9NP/w/c8L+U
	xa8MdbMVZCsXOFHBMCg+YfUU/Aa4a8bQC0ZczcOPGZ4Rs77lBrNRRELv+up/0Vnn
	U5fia9VpJmlDo35bjZMXd3u4sqCQCebtvSNpRBjDOMenZAaEQfDaCnmhK5JnePcL
	p8WMvNieGSU8u9HLS6cWV0oQaF/t4tFXsiBCZrbWjsJMN9XaaoMRusjEfg1Zxklk
	wcBxIe+p5K34L4qSB7R3W9mVt/XmiMy6ZAeiEfGV4A==
X-ME-Sender: <xms:iNrMZWBTogZ708axZ-ySUAGTtVfOUYqJDGtZogSwh02w08Q1YZ5M_A>
    <xme:iNrMZQjcew6phf7yyPi2FihawuhPhwj8TUz8D4JdfpaJjuYzOomVOoAdPOyTKgLXC
    MJUgWeFziWiRg>
X-ME-Received: <xmr:iNrMZZk3LDFaOnih7XSuJpi20v0nuASr2x69ydBjsdi3BBoV0I8hhoDGy1AEWWtF--vOw8bGebZ0dr0kJO2E6uS_UwEPmkXpaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:iNrMZUyOtt3CHxWfybPj5StYI22EheGNfthX7FxVLGewjrFi550HLQ>
    <xmx:iNrMZbSi5rz5ynHmZokAi4_q1-7WjfFjVRi34ZZNpVUdOm7f-S2EuA>
    <xmx:iNrMZfaaNztUhZphyyLAHNa7ywC40doJl_P52ofVHl4vwHqrNibyaA>
    <xmx:iNrMZUR4NEvjs5H7845_KouI9fwzQOlYi1ZYA-Wb80jMHImYjN78391EnKc>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 Feb 2024 16:21:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] build: Replace `which` with `command -v`
Message-ID: <ZczaheI7kIVrluHh@mail-itl>
References: <20240214143411.37957-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b2ha0LXU7iibO0rD"
Content-Disposition: inline
In-Reply-To: <20240214143411.37957-1-anthony.perard@citrix.com>


--b2ha0LXU7iibO0rD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Feb 2024 16:21:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] build: Replace `which` with `command -v`

On Wed, Feb 14, 2024 at 02:34:11PM +0000, Anthony PERARD wrote:
> The `which` command is not standard, may not exist on the build host,
> or may not behave as expected. It is recommanded to use `command -v`
> to find out if a command exist and have it's path, and it's part of a
> POSIX shell standard.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

This fixes build on fedora 39:

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/Makefile b/xen/Makefile
> index 21832d6402..767e47d6c7 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -25,8 +25,8 @@ export XEN_BUILD_HOST	:=3D $(shell hostname)
>  endif
> =20
>  # Best effort attempt to find a python interpreter, defaulting to Python=
 3 if
> -# available.  Fall back to just `python` if `which` is nowhere to be fou=
nd.
> -PYTHON_INTERPRETER	:=3D $(word 1,$(shell which python3 python python2 2>=
/dev/null) python)
> +# available.  Fall back to just `python`.
> +PYTHON_INTERPRETER	:=3D $(word 1,$(shell command -v python3 || command -=
v python || command -v python2) python)
>  export PYTHON		?=3D $(PYTHON_INTERPRETER)
> =20
>  export CHECKPOLICY	?=3D checkpolicy
> --=20
> Anthony PERARD
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--b2ha0LXU7iibO0rD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXM2oUACgkQ24/THMrX
1yyMcwgAkqphKADojZKY+urm5UcOwU44kgQgjSwAt+Ud1TVvanBliaW8eKUMGyjz
yB6I94Uzxj0eN2n9w+ohTbWDAQzS/CbngocKKHIR1gzSywv08GUSi96w8qlc8uZY
0sKWmZZ/kntBbnnlP9c8q/b5B2jEkx13LBTrBPfi0OlpTWd1KH9F9cOf3Rn+2VJt
c/8K4mbOd9j5OTJTGX7GoKRMR5Ft31myzZb4S+HU17MmW6XX+HA1+7GH9YDV/utd
5GNOaC3ikyJtoPy1miwkmLRMwrJHnY4egD6L2732iMVvYoKvAE6NaA9HyR7he5jD
MDowZkl90yM5zJMmZNpjskcTxSx+EQ==
=wmkT
-----END PGP SIGNATURE-----

--b2ha0LXU7iibO0rD--

