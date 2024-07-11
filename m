Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C492F152
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 23:51:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757719.1166840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS1fs-0001X1-Ra; Thu, 11 Jul 2024 21:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757719.1166840; Thu, 11 Jul 2024 21:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS1fs-0001UU-Oq; Thu, 11 Jul 2024 21:50:00 +0000
Received: by outflank-mailman (input) for mailman id 757719;
 Thu, 11 Jul 2024 21:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3TmJ=OL=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sS1fr-0001UO-6Y
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 21:49:59 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8315171e-3fcf-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 23:49:56 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id Dbccd106BLnb0ux
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 11 Jul 2024 23:49:37 +0200 (CEST)
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
X-Inumbo-ID: 8315171e-3fcf-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1720734578; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Isq1bo/D8SOOekgHNt724WJz5TuJmEEKlmRn/YJhq95nGYkMcZ5cJXu6/+0TVThYmH
    yQWbA/AQ28A02sl4agBdgcBJN/8YG9gL0X8WceJc8N/9cGH/ddhFP/XYp+Kbt8Brdvcj
    5QYwU9NrLQFP4tD8/wdt0AiVS6YvD5k4sd8DByGR0kUprjKdHpepDihQV8XabHJC4xtp
    E0T5+SlDTDWgueobkDikMz/nUrEim5lBVs+Iit2GdEonWudK6BpCF0VxsPLIMTwUNKcs
    DGqpqcGLrXPvCfuI/AvLJ3dwshAczgmuvLuRPpaehEiKNIYPa2pU961AWYPOv0gSxSRA
    Ij8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720734578;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FI0Q5Sygxw/2mwb4H3sNZSZxawggu6d0L/9G7T/Zc64=;
    b=PmAVZ9H4cwbtQdTZVESS04LpFC6LodufSm18NV9bciDgM2UH7EiDVIfQSIFwelJs7t
    xEjAXxFEEeyHzeX2/ACmFvzxv4ybOCN7M6OEz/KsXDiTNffu+K0jxt5qxXFbWmfPp6uC
    Vw2THRBy51gwAAOHvGuZzRfiHNNMJG6Vu9fgNXc1R/3Zj33CA5jA6nig8uNTHNs0vj85
    xtD3Sz67MVjaA0OBJ5bpTo+6CzzjQCBok17iCqc0e9bf7XKiJbkC8vIBpEMtKeY5f9un
    +ceU4ZMqOizsooDowEhqLW+YBD7oxuHqK29ZMz6Cfa2gdDEd9c62EYfoBHW1eOuQ3486
    FVyA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720734578;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FI0Q5Sygxw/2mwb4H3sNZSZxawggu6d0L/9G7T/Zc64=;
    b=Dc0AOUiXnZjVPxxkqN9Q7yN64jR+eIjRLRUsrS1kXJ11p5iVsa0RbKxn7feNm7nhJd
    gY/UBM7DIUXBj8he+kKbLdwRvu7yTFrSkCndUtIG2Z9/B6G+ofw7j3QX+pENtjzW1Sux
    dZlpv9pQTQSYXZpBQVTFwu4ShMJ4ismjUWZpzftH8RkE9ZOCTKlheuyYS+gy4kjYDhsv
    Ha12wPvKcr8p8OoOM16z/I4Ri1eqiqglr7ZUl5EhKwrbzhKqyT8gq9z1Q9NyVDcrNxU+
    YUtRUAlikZchhheKYHQCqywOlwPx8T1UmYto1L5KG4kTjqFZHRSKEK2FdyUBXASu+0VO
    9ITQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720734578;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=FI0Q5Sygxw/2mwb4H3sNZSZxawggu6d0L/9G7T/Zc64=;
    b=BkSvsy3r08YECycs6/bDOKdrEXnB8f0zPCAL7lMpLmiLWo15E9AEWRWGxtUX6n4k6p
    WCids+gXlvg+bOjDd5DA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BkKIOBzsrQFE/ZQyiRRrPkprT4fzoKOdWSb+rw=="
Date: Thu, 11 Jul 2024 23:49:25 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Roger Pau
 =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 13/12] CI: Refresh OpenSUSE Tumbleweed container
Message-ID: <20240711234925.189e16d5.olaf@aepfle.de>
In-Reply-To: <20240711202337.3128473-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
	<20240711202337.3128473-1-andrew.cooper3@citrix.com>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SPWqmII4uCxS7clJkqzZCqY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/SPWqmII4uCxS7clJkqzZCqY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Thu, 11 Jul 2024 21:23:37 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> use the zypper long names for the benefit of those wondering what was bei=
ng referenced or duplicated.

Names of rpm packages do change over time, configure already searches for "=
something" where it is available, instead of some library or header.
If it is touched anyway, I would use more instead of less 'pkgconfig(someth=
ing)' references:

libbz2-devel
    pkgconfig(bzip2) =3D 1.0.8
libzstd-devel
    pkgconfig(libzstd) =3D 1.5.6
lzo-devel
    pkgconfig(lzo2) =3D 2.10
xz-devel
    pkgconfig(liblzma) =3D 5.6.2
zlib-devel
    pkgconfig(zlib) =3D 1.3.1
libuuid-devel
    pkgconfig(uuid) =3D 2.40.1
libyajl-devel
    pkgconfig(yajl) =3D 2.1.0
ncurses-devel
    pkgconfig(form) =3D 6.5.20240629
    pkgconfig(formw) =3D 6.5.20240629
    pkgconfig(menu) =3D 6.5.20240629
    pkgconfig(menuw) =3D 6.5.20240629
    pkgconfig(ncurses) =3D 6.5.20240629
    pkgconfig(ncurses++) =3D 6.5.20240629
    pkgconfig(ncurses++w) =3D 6.5.20240629
    pkgconfig(ncursesw) =3D 6.5.20240629
    pkgconfig(panel) =3D 6.5.20240629
    pkgconfig(panelw) =3D 6.5.20240629
    pkgconfig(tic) =3D 6.5.20240629
    pkgconfig(tinfo) =3D 6.5.20240629
glib2-devel
    pkgconfig(gio-2.0) =3D 2.80.3
    pkgconfig(gio-unix-2.0) =3D 2.80.3
    pkgconfig(girepository-2.0) =3D 2.80.3
    pkgconfig(glib-2.0) =3D 2.80.3
    pkgconfig(gmodule-2.0) =3D 2.80.3
    pkgconfig(gmodule-export-2.0) =3D 2.80.3
    pkgconfig(gmodule-no-export-2.0) =3D 2.80.3
    pkgconfig(gobject-2.0) =3D 2.80.3
    pkgconfig(gthread-2.0) =3D 2.80.3
libpixman-1-0-devel
    pkgconfig(pixman-1) =3D 0.43.4

python3-devel is "special", can be used as is.

'git' could be just 'git-core'


Olaf

--Sig_/SPWqmII4uCxS7clJkqzZCqY
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmaQU2UACgkQ86SN7mm1
DoDsFQ/9GWb9BXP8pd15UBUo2sMIBJacMJuRwzxHtAWIguTIK0US31clWHmN9UIA
HmZOcJe8pariVkeGTSncEuDDI1+Rp6zVTPvuQR7nIS4IX6W+lyii1sGhDo6Q8Oxy
R/2SwCHbykEI22wzSlfBDzF58FNGCXZPutyeHkWd8hxJGEh6yzT5l7TEYNB/Z6Ft
ud50CcJYUJnSgQwuCbWm+C/Nq43U7SRimFob1W+H+iKgpyA3nL1/zuW6Qi73B+82
3xvKQSbKROmhvofDjQ7hzd/0XcIbQJJwzQeTFX6D0EpxvfqImEYZOxXydyCtTFMn
Xhl1ENfoVVdJMhbdFXrfT9yF2ls+Mp9dSDdvgVMdtXlDXOiScTFVQ+vMOkCO/GmL
uJFTm4zZlRMiQTbIlDqOgktwh/BBg8kk42Pxike3ZlZo3r8Sxk8HnmhrLtvnERDp
pfXO1WeaG0R48E4oR2e+MLf13P1NRp00qHu+MyUUioGa3gq4+yNdLoEGG9PxuDfL
4jTjlG6f7n4476HGjRDnkBRv5M5FF1jinK+7UzYErAVA7P1qUaAw3tNv3stXs3BU
DktgpvpQNSxMBPJYc2HzfNFpL6MGuoJimcjbqguinfyeTZYmGWByBeHi+a6hXl2J
HP8eWN1frdYNYfhmO261V2t7cUVU03yiYeL73DgdTVxXBDCWuI0=
=GvxD
-----END PGP SIGNATURE-----

--Sig_/SPWqmII4uCxS7clJkqzZCqY--

