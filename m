Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07107F528D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 22:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639177.996189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ukl-0003db-Ml; Wed, 22 Nov 2023 21:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639177.996189; Wed, 22 Nov 2023 21:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ukl-0003bN-K9; Wed, 22 Nov 2023 21:27:23 +0000
Received: by outflank-mailman (input) for mailman id 639177;
 Wed, 22 Nov 2023 21:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOK2=HD=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r5ukk-0003bH-Qo
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 21:27:22 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebe5d368-897d-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 22:27:21 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAMLRIsQS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 22 Nov 2023 22:27:18 +0100 (CET)
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
X-Inumbo-ID: ebe5d368-897d-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1700688439; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=r+tqHCtbtCmApSvipIm1/8KHbfVAzRLLot/AXWrQ6246M4abd/ifSVUN45qiAp8lRH
    v9EA4xkmhIeVTJDQiezUzyuhPremQk6TNEFub18rIz3OuKwNGlwSXh1idAdxaK4CviHI
    0d2+2B3iv/OU2L/Wj9WWYd7w1KB9s5G8mFDvZ1S0MYv4zeAZ7YiFGjx0x9HQJpo/M6sF
    53bxmGOldnvP5kMv1gTmAWkxE01+H6spX1/M0A6IjhXyWk0fD4xltPJiT28bEtsc9dYL
    TCLqJbXF2NsZxfMBcFN6mm89uoqYpa42w/e6pgI8p7Kv46TTnHzJQr6FzHYWZHXg+9q3
    u4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700688439;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=foTJpU454EL4ah/g/oxUuKjnhAc7F+3XC0RxCXsR93s=;
    b=UKDtVp2lIgcDZ34a2j4kRLYeMJL/z0vhb4HDpV7Lf2ulYQIoWCXhkPj8rxs6vXUVho
    5fHbhgfIJPJiKGLxn/QS4nHZLPixlqlOjJFbAHAbbGXd+UYZhOPBGUXK3GwQGD8gwHvd
    1A5NydEdRJ7tPhmnu8xyy8YLwitaaRgFgPVRAg1A+9/VTdKNMULDc0cf9mjuhJVMmMzw
    2zdEo3QnCjglKVIsEUVzcSGrpUhzCEfUJ0EVW/UUFmEE4zDnjBZA+1Sdkg5+b3rTWWYa
    byKJeIfxagr2WLkM4nDOkqocSf6EIbp8CXqPxS4V8Dl5/GAuJQx+3iu1ZOuzln0OKlK1
    Ql9w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700688439;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=foTJpU454EL4ah/g/oxUuKjnhAc7F+3XC0RxCXsR93s=;
    b=fm8vlGF06puq9F+pUaix6XA+obL87NbX3E8upVWwE6Y1z9nJvBo14AfBWYGLNU6+E3
    /Hi7+M6IZ+5ZoulWFfu9CdnMeMOm9YyWXJqlSB6LQT1fLYJZ9ag4rWjCyBhtIWDdicd9
    gXL2dNlRwZxSL4HaIWUfGVEWX5MLJuv7kWIr9+UMDLZH75bSWTbmm6mYns/S2ZRELgel
    T6PPlzYiHAtwee2JMHbiN54zMyRqyvB/1zeUfP2zg8ZBSbbMJFN3jOYC62k2T0qdE2M2
    t/yD7Ubk3YqbzQ9Vwa1kVbktDNEMtyUWNhowncmsraE7D/fIYZwTgSjbCCh6U4UcMj0A
    OBiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700688439;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=foTJpU454EL4ah/g/oxUuKjnhAc7F+3XC0RxCXsR93s=;
    b=fAUlbszEOldEnDrFp4czJERQYEQLvi966W4ugS89+62yGKkDQIf7tAEnzrjfogiav+
    Y30838dmtAiphZkN8ECg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5VxOIOx7sW7Yq7k+0gzUhLCSnSrvMYFPvEI3Cdw=="
Date: Wed, 22 Nov 2023 22:27:09 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/xenpvboot: remove as unable to convert to Python
 3
Message-ID: <20231122222709.68904661.olaf@aepfle.de>
In-Reply-To: <32049b29-39eb-4031-b5ef-45d591208686@citrix.com>
References: <20231006145046.98450-1-roger.pau@citrix.com>
	<b46b276d-4df0-4c28-ba4c-e0147d0b98fd@citrix.com>
	<20231122214342.66d40d6c.olaf@aepfle.de>
	<32049b29-39eb-4031-b5ef-45d591208686@citrix.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0kiu05xIrxGj/67VmJuJDM0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/0kiu05xIrxGj/67VmJuJDM0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 22 Nov 2023 20:46:15 +0000 Andrew Cooper <andrew.cooper3@citrix.com>:

> But that entirely depends on whether you think anyone is using it or not.

We never got any bugreport, nor have we any indication for actual usage.
The script was in the sources. Python3 is supposed to be the default
interpreter since a number of years, so something had to be done with
every installed python script in the sources.

I think if anyone shows up and demands this script, it could be restored.
Otherwise it is one less thing to worry about.


Olaf

--Sig_/0kiu05xIrxGj/67VmJuJDM0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVeci0ACgkQ86SN7mm1
DoAb+A/5AVENxx+ypDaOlDmfF264Lksgh+rgcrhUDU8qb3h63X+6xgWwu0bmoqqN
+diaJRU4HkDv2zM7f2hcyCq1D0VBGwiJr66kiok3GnSqLyxminQWG90E5oDwvVp8
jiBdfnQSDHwTLS2YCqaW6RT4Uz0zQHIGHBWvj9keVk/xnDaCaf7egypkdjvuODEO
/xUXjK2IrXU0PldNtTpyOP7/rVNtYC+59pMOjTN79Rd9ZgkdLG+oHsN5Eq3B2pQR
Yv7bJRElu05SsRNn5gGe1NORcdJV1yWVgMVoJ/edvW/K44Pq1UuLXQ3JeokpZ0Ex
zbzCLBGOVm0H3w86dFGrEvlLm9kXIYd2CWtH94FxFaxSPwyvL5rJwMubCvPZc++H
cVEzmKbcc46HT+uNYfl7XYKLygx98qthdBD36Vgx4MTEj8vSX3iIAHDgupBHRx0R
b/e5j59Z4uxO3w0v1WMc/6bqSGfKwG80Ww2jRBG4cQUEx7zuBfZIIQZAejrt0Dgd
33nSz4Ndpv5jUwiflGomJdOU304mOX+nITqvK8DB6FJiG7HOQkvwVm5adleEqEHT
Djkw6ZU5yC7J2fiq8aIHmdwH6+mgv+GMJ+g+peDDb3dfwHqWrpFOzKK/NCAKLbZe
Anz3IWWQ3UBjF85lcbh0KVH4Qj/go3QSxcoUgF5S0/WtRJaJfeQ=
=YSm/
-----END PGP SIGNATURE-----

--Sig_/0kiu05xIrxGj/67VmJuJDM0--

