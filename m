Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AF368071
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115373.220073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYRC-0005ar-L7; Thu, 22 Apr 2021 12:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115373.220073; Thu, 22 Apr 2021 12:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZYRC-0005aS-Hf; Thu, 22 Apr 2021 12:28:06 +0000
Received: by outflank-mailman (input) for mailman id 115373;
 Thu, 22 Apr 2021 12:28:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jO3=JT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lZYRB-0005aN-6i
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 12:28:05 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63b84bc2-5d8d-4c5c-bcb9-cc658ea06d03;
 Thu, 22 Apr 2021 12:28:04 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.24.3 DYNA|AUTH)
 with ESMTPSA id g00c91x3MCRrVQO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 22 Apr 2021 14:27:53 +0200 (CEST)
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
X-Inumbo-ID: 63b84bc2-5d8d-4c5c-bcb9-cc658ea06d03
ARC-Seal: i=1; a=rsa-sha256; t=1619094473; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EjFZw+gxI29uGmwnmdAdsHLF5Stcyvtp0u9v8NwpeylclnvchAukFhvwalTneYlsTd
    PP3YEfpiUSM/TsiHYHkSg3oV0cg/3JgopFTEERtRjgGoa463pXPR1KBHz7IR+QRT3C/m
    v+m81UgYi88munuRRPg2ylBZ8CUaCfVhAHNUsnV2t/gznqNKcEKfUrcXO+0YFbVCTOfF
    o+0x7nZACSx9ic1i8lO76GVTsYmdKNy+dBijR4L3BOkwkgU/ZDZLwRVgiCnC2L+uxFJR
    PX2x9wAn+wavSSN09H8pb0ngcY1tuljf3jqhZCr7Mt/m7GCie2P0RE9t6+YnI77Nc3dD
    FVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619094473;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=730Zt+z/pf3yHKAMhHCVcudAmd0AB9bXEJc/Sh9aPfo=;
    b=aaR965QpVpZz0185eKRVgoCK0JXnp6esf1eU+ko7g87tSZdWG16mfQrUjre8WonenJ
    p9OOXsPA7ummfuhrQWVwFICsbiBMh3pABwrgA47l1lJbKPMEfsrwXYpNe+istlawN4/Q
    vK6Hl3ecl0WaA433hXTwQxWlKxsx8uiC0qDQQCCF1whhi4a/A49Oc47L0LGgRO4vS8BZ
    W0HWWGgYvzzs/nWIQ1C637LPHFGlWIHqXkNqCCjcV+lnL2wfngRSc6p2gD4AN2tz2P3q
    unOmzy0VmLGyoqZPZaEhuruel9PwJi5FXD2jegK7sYxAaSngmrdlw0gaFXuftVWAROle
    Nj5g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619094473;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=730Zt+z/pf3yHKAMhHCVcudAmd0AB9bXEJc/Sh9aPfo=;
    b=ty74Ey0iotLDVZgBUII7WvZumHc6KqcndW+qhhnS+o7G9M8UKG3TgP9mgOUxNCBMS9
    wxrgQwuGlGzqIplNEeuTx+qVTBSWULryq8llIUdCIkSBNETL58wv++ZAzYChuzioJB9b
    buh9kc/EeQhtKs7w3Xl2forN3HxDMgzqkSsnD94Bz8+UaL0zOT+oRWq1JEi4/mJko1W7
    AFUXKzGTaW8a+9fWp5QkIMMQEQBMqKm9Eep9ZQDD9tt7jQC4OIHSZ3lXaDrIyqc8uqVO
    eFKokyClUB6BmN8iqp1PE3UcX9yLtmhJ12d+msCQ7HmlwnZmoo/1fm92xtUGZvBpIviM
    rA7Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXmEVBDI4vdCIUVoI+BBGA=="
X-RZG-CLASS-ID: mo00
Date: Thu, 22 Apr 2021 14:27:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v4] tools: create libxensaverestore
Message-ID: <20210422142744.22b2a7ef.olaf@aepfle.de>
In-Reply-To: <39eb928b-161d-4870-93d2-8c15929aa32f@citrix.com>
References: <20210415131138.8709-1-olaf@aepfle.de>
	<39eb928b-161d-4870-93d2-8c15929aa32f@citrix.com>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7AK37TEY9PV/Zg8Aokvfh4e"; protocol="application/pgp-signature"

--Sig_/7AK37TEY9PV/Zg8Aokvfh4e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 22 Apr 2021 12:49:14 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> In this form, there's a reasonable chance that it adds to the perf
> problems you're trying to address.

I did not benchmark this code movement.
Now I wonder what the runtime cost of the move really is.

The other pending series eliminates repeated malloc/free, which will
most likely be independent from place where the callers are located.

> I don't think pulling nomigrate into this new library is sensible.=C2=A0 A
> dedicate migration library, stubbed to errors based on some exterior
> setting, is very rude.
>=20
> Given the proposed new structure, the way this ought to be expressed is
> libxl-save-restore-helper being conditional on CONFIG_MIGRATE in the
> first place.

I think being more serious about the CONFIG_MIGRATE conditional is way
outside the scope of this change. Given that this conditional exists
since 15 years, libxl should have been the first user of it by disabling
alot of code that handles save/restore/migrate.

> Also, xensaverestore is a mouthful.=C2=A0 If we are changing things, how
> about xenmigrate instead?

Since the code does just save and restore, "saverestore" looks appropriate
to me. "migrate" just builds on top of the save/restore concept by running
it on two different hosts at the same time.

Olaf

--Sig_/7AK37TEY9PV/Zg8Aokvfh4e
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCBa8EACgkQ86SN7mm1
DoD1ag//Wv4FW+N7Q3U8QBVokMf3b7yO59XY7Jso04+x7YVBudfIzdzI4lXpEKYw
SpfDk4Sv+tUewoHhwO8KTFAtRd/pOj7GnU9LS4zqGt9M5cZALloLdwiJ0J8VPFn8
Y28sImHYi+IO/pDjDkYzFRWJkZ/92VZUAxFN4cp7RtFje4u/TJiF7qAAk+fM7t8s
h7t7sThzucd4393uJ7UVzMOqi3Xmpz09uwEeOfZ923jZE2ly1ZnRv3otG+I9iMaM
+HsIhEJV28MjKkasUuzOewHdGYn+Qxbax6hijHaGsbpaPzxz/MTJILVDoRWIkuXA
jSy5ZnzM8gryDrKEAbtBCj/CW+Y08GAnGr81jKPjWmJc/UCMd7WU56+IxUQFDTb2
eK1EnEbM87v12KChYJmnWe6zyC0wlI4wUoypXgY+i2hBssI97fHg2fh6ByuO7MSe
Nu8k2zGI4tZqpshpSaATrsIHC6bAro7xQMK3U1qDj1Tml9vRl5XmcwwYRNk1RO2m
qPhVuXphSYxsIQSQ8KifZxC0o74BQ3G9Ms7OK4wz9zDBeanh9PsdxzAkgdbYkVMR
2L+QNPPY74tw1rUlXuePccUUKq+OJ/iBXY1SNKF06iAQEG4/lG4MVo8l+Nhc3Dzg
Bb30v7GkFUblEReADgk7pu5vUKhN4+cloxJ8tx8fdYWTgg9/ODM=
=7b7i
-----END PGP SIGNATURE-----

--Sig_/7AK37TEY9PV/Zg8Aokvfh4e--

