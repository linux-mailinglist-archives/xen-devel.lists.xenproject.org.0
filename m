Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B677EE50A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634503.990005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3f7E-0005EA-Hf; Thu, 16 Nov 2023 16:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634503.990005; Thu, 16 Nov 2023 16:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3f7E-0005C5-F4; Thu, 16 Nov 2023 16:21:16 +0000
Received: by outflank-mailman (input) for mailman id 634503;
 Thu, 16 Nov 2023 16:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1T5=G5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r3f7C-0005By-Kq
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:21:14 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27f54963-849c-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 17:21:11 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAGGKuWDC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Nov 2023 17:20:56 +0100 (CET)
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
X-Inumbo-ID: 27f54963-849c-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1700151656; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OVWmPaWyQ0SBfLbuvwYsVMQXoZm/cK6W6D2YO9LHWUdpobOgvRy96y0maiyQ/N5FuS
    gqZtA/NvToqfxepXV8sfDOfcdEFKU1ZwQooC6eNTto+H0zT54R3GEd41WCRfl5E/t1qP
    P7XnAXakmnGXIhQVjPiTDyuNZTJSuq+B3/CBIEyYiy98yDkPbvd+SMU15PxQN5PY9EOF
    9gmKYxPwf8wdIKxrcx+c/za8oyOu8qjs4vCdKwlGFqIpu+6dG2X2oG5QZZPkdGgR2FlM
    oqXiuFwT++3GTXjxJKIqlXV6/PSEn7v4j8en08coHUmi68XF+fha6mLOvlCFL7whgN4A
    +ToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700151656;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eMeji3C6FNAgNGJKxUonP8+P4cFYr4LlEyq7GSw2XxE=;
    b=Mg6WVT8q3uON6RIQaMIW1NFMKLXkEGyoIX2JaWD8bdZ3KwFh2QLqLtethYBWyx/BHv
    9+iBRPyeHBM+nUwowVN4pKf5vRExxP3y2kAPQcojdKmQCA478apjX3DOKCvXswTgBYSW
    xZX7GLlYxsZ3TP7WL0w+Nk07fOTS0MogKWO+06UlHI9ZWnPQoND+qwtnrMjnGIQsNRlE
    Kll8qZFRuPnoH+/khzKrw9J2/ATdZH3sWKDhQRd5wjZidy3S882EvWON0OHyz4szR1FH
    WKNyHQo340q9pZxuVvrgkf16YSMdQOB39dCz1SfCBdvZZZavQVUTw5uZ94UR2JKfheiM
    aMGA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700151656;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eMeji3C6FNAgNGJKxUonP8+P4cFYr4LlEyq7GSw2XxE=;
    b=cmBGqfJpNu3h0la/22IYL9jEz3iBCvmY7ShO2BIyG8DLF+BADNqXi5OB/8etD1b6VU
    Z1EG7b52ftA6LMn9gnhP0KNZpdaa7iEFiJ3OPXcJ3JZUO3h+cqnx3uCcb6HB/CIRZ4Pw
    oKvuWDAMl3OKNVgSQ/F3wJ/5ZF9lw3C6P8ob4ROKQ2f/DI4J8Y+SEpBnbovoAC5VGt6W
    e4AQxsTtH0oDDmVf9LsVXXGnTwfJzHTsWxJHoXnW2MS9/a1jM+IsY+tDNbnU+tBLeXgQ
    9i2VIf3EE2zwoUyFxAvlDghLIr7S8ODh3WmS1X5JIUS9iPUyqf2aVaIn/KPnr6lgQK71
    unGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700151656;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eMeji3C6FNAgNGJKxUonP8+P4cFYr4LlEyq7GSw2XxE=;
    b=Vxb0C3ndowyR+Bjmy4ZVRD/oG3wedXYMMO9EPqG/K4Igu82ZXtznlIxJRFjyczhX6e
    w2NCjP43AB0MMBSmvjCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BhaIaRnsNaqJN2h0dTFZeqQ89seVgD7Tlo9gNQ=="
Date: Thu, 16 Nov 2023 17:20:48 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Message-ID: <20231116172048.0ca018e7.olaf@aepfle.de>
In-Reply-To: <20231115121632.63868-1-julien@xen.org>
References: <20231115121632.63868-1-julien@xen.org>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0L5YPd88iNXT7OqukmtQFw_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/0L5YPd88iNXT7OqukmtQFw_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 15 Nov 2023 12:16:32 +0000 Julien Grall <julien@xen.org>:

> +++ b/SUPPORT.md
...
>  Release Notes
>  : <a href=3D"https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_N=
otes">RN</a>


This X.YY needs to be adjusted as well. Hopefully this detail is mentioned =
in the release-process.txt.


Olaf

--Sig_/0L5YPd88iNXT7OqukmtQFw_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVWQWAACgkQ86SN7mm1
DoAylQ/+KZg51AyaQrYzgOGn2GJR79ZVgCsfd+7yfi7DYe3+P8rSN4t3mu/eDez+
uIeOh7VQ4uDWmktqCbUJdlPK124lWtWbfQPa2JPFNT4X6AIDn0PiXnLIyPucuzJI
ucOireNt17ou3cdkrpvxOejsYzO6F/aG2Q0U1lCXgzSFgviYYPcyhyOgluasy/Y2
7+trqOu0/JlyKfdT2ivqEKOG8FExDbf1vSO16Wa623nAYg7ygPmm8pUsWUGiIWp0
fJdz+1cew2PksSkqJNxJjYoGA259VyNYjuk1TwreZTik8f+kcKJ+cuuRBFa3lRFx
ZszLohLbfnH13IFkxnirmHGa2yU+GQSPI+UVIVu7dhmSIfBzBdbcF2ZLrjFd+kuW
OYQfwCH9EoW8/6QCXDbHpy5cV8ko8BcbMsSBJA+WM0ki6dHqVgnk/FzRIrEtv0A5
W0DqbwxdDoABpIcs7wvxHBVKwtgo3sQpwIjBkBjuM0IX1O+QEskWmjRW1cuZLJgm
kc5D1VQigrmRTXyT19FS65esU7rRvlxGLEfGpRjEtFaMGVj2DcKFitYg5qvzBQqh
AfiiJQX9ASsoiT8+zSzX/O9BKwP8HuoWzkJHjnsC8ovtN8GzS5KjiNrzVYuWlGWR
iNFxv3N+F8ZHDgt3oZMrLBDLX+k+qXEdY/ZyZzk2L5hyxz+yDSQ=
=qyh3
-----END PGP SIGNATURE-----

--Sig_/0L5YPd88iNXT7OqukmtQFw_--

