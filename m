Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7903B5CFC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147785.272758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxp9u-0005eC-UV; Mon, 28 Jun 2021 11:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147785.272758; Mon, 28 Jun 2021 11:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxp9u-0005bI-Qu; Mon, 28 Jun 2021 11:10:34 +0000
Received: by outflank-mailman (input) for mailman id 147785;
 Mon, 28 Jun 2021 11:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fuEk=LW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lxp9t-0005bC-0O
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:10:33 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc6d4dc2-636a-41dd-b4ea-a0918186f289;
 Mon, 28 Jun 2021 11:10:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.5 AUTH)
 with ESMTPSA id j0443ex5SBATHnv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 28 Jun 2021 13:10:29 +0200 (CEST)
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
X-Inumbo-ID: dc6d4dc2-636a-41dd-b4ea-a0918186f289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624878629;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0foUv8GlEVBTaZG8KN9P9hiU8JchAeoSOcQivY/DUqc=;
    b=LK5GXEzNJu2fdqzsXnT+sDnHIqQv88h3P/2WewPYCrBDmCo8PC10F5jGcugFZgkCEG
    /iv/do5xca7CeJwZb6IEJ5aj5so8XGkQDpBwDUChR9PXGkbaM9/rBVKANVG6StuXUKx7
    IIObEVE12GxLyL1fXLs5fbFNjeJjMqa3OpYHJzpgehLSxL0M48rH76yt2KHlhLgCE+0h
    yxmgCbuhfkWCr9UGQMi598QqoV1fLA8QXADV1NBmhzZPgtdVGIdZjJhUnYQ5JXC0QVrP
    9YAkdaygzDfk0qhcmRWjhopB5i8sz4v+oADBMbA9/JI6OAcy9DIcMuRP0bT4waHqMlGc
    4VtA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF1Uh6FPk3sesKYv+F4ULcnddTEqNLurekxi0Bc"
X-RZG-CLASS-ID: mo00
Date: Mon, 28 Jun 2021 13:10:22 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 02/12] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <20210628131022.3f2f2c4b.olaf@aepfle.de>
In-Reply-To: <4e3afc8e-1ed8-2e27-b583-476d35352efd@suse.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
	<46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
	<5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
	<4e3afc8e-1ed8-2e27-b583-476d35352efd@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=L9YIJzssQbWgKVfvv0DFqD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=L9YIJzssQbWgKVfvv0DFqD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 28 Jun 2021 09:48:26 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> On 25.06.2021 18:36, Andrew Cooper wrote:
> > This is an external interface, and I'm not sure it will tolerate finding
> > more than p2m_size allegedly dirty. =20
> But you do realize that a few lines down from here there already was
>         policy_stats->dirty_count   =3D -1;
> ? Or are you trying to tell me that -1 (documented as indicating
> "unknown") is okay on subsequent iterations, but not on the first one?

precopy_policy() gets called twice during each iteration.
Last time I tried to use this API it was difficult to work with.
It is required to look at dirty_count and iteration to see the actual state.
Maybe it was just me who initially failed to fully understand the intent.

I think as it is right now, the first run with iteration being zero is the =
only way to know the actual p2m_size, in case the consumer really wants to =
know this detail.

Olaf

--Sig_/=L9YIJzssQbWgKVfvv0DFqD
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDZrh4ACgkQ86SN7mm1
DoDgsxAAo4EpHM2/NEx0qMy5VzNwt2XT+YhzGYa0uLItyw80q0i+L3fIFA4elAlU
xYF5oNWAbTGyg2cjdEAL/nUN7eFhnSF6I+VP2olrC5UpodYPAzM/XKzxeIyV4UvP
FlwRgMwS952yMdQ8VRlEyaXIZkSBspsv2UoDl5vWKFzY/TKLzt8bbCxjsdD2zSCB
zjJyZvdcdm77FsaG8x+ZwPLpLCmC+NMx9ZuIzajwD2OIpHb9wdwFBVwJc9tFZ7cq
HUeynqwcs2RZ3uh4SFV8N02iOtAtoEheSLDX+SzL1u6go6hiRLP8PJH6z6scyHCc
P+EOKWE86cYAbrIX7m5+M0SiunlPfF7zQ1Yjzqy+LtGIibRzZrpsiJfR6mWK5Rwm
Ks2c4jJLFpklwHV4gl1cTbm19bjqfi44lXXNg6+gEk5NHoH4D/B1BjrLjyN4dd6x
af/1s57+IgmFQwgrZmWibyHEwZmTitY/0e6aHefiPR9JsvtyUtUJoHri04aIuwFc
9KA4b2+xha8pKRdcUhw5WBY43MbxNdhAMHBJXdK4Uem+d0OPADQGYsVu/4XGehHB
oOZ9NYQUDGXrY5IgZ1wiM6GJollJW8Re/aCS/eD3BFOoAyLX7psp+40dG11PR5AS
34RAk4F0WdIQL1JaGpTk0+Bl5KYfACbzEfm+UTjAujE0oIPm95Y=
=BFdC
-----END PGP SIGNATURE-----

--Sig_/=L9YIJzssQbWgKVfvv0DFqD--

