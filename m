Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C21D7EDE04
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 10:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634102.989333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Z44-0005O0-Sc; Thu, 16 Nov 2023 09:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634102.989333; Thu, 16 Nov 2023 09:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Z44-0005Ls-Pi; Thu, 16 Nov 2023 09:53:36 +0000
Received: by outflank-mailman (input) for mailman id 634102;
 Thu, 16 Nov 2023 09:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1T5=G5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1r3Z43-0005Lg-DV
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 09:53:35 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01393b4f-8466-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 10:53:34 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 49.9.1 AUTH)
 with ESMTPSA id g1b15czAG9rUTbm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Nov 2023 10:53:30 +0100 (CET)
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
X-Inumbo-ID: 01393b4f-8466-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1700128410; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G6wY6AtshmXhqmrxXRbSL/QyvtfsluE1x6DA6srdeQalkyz5E8F/dZ/G2dXF89O5Vq
    PYS/jxIPN2Ty6CGrIf158Sof+7L3uv93SQ32glJmXc3xnS6E//eXA/t3J1TaDlNFIlHC
    Ze7VMsaaIPB4AJT9SvmaJZdqKPXG7c2F2/YP7Fs+fa+fJpwjqP8+zyTUDzskJoh1cDY5
    oElNDL66M8KGj+lFlpOyo3N/sqdRkdrwyMkfwVLuNZUcltDqyeZcAwHxvjqZ2ePCijlo
    +iRrEQ9VDjvRMRjt8vhLTAh68/3yZpKuqu5DYWQ36K6xuP+qjexDSLk8/6M+l6vfTG9q
    S5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1700128410;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a5ntrmbSeDKC3MIUkTN+rwYj0A/SouzIhz0NCta5JaM=;
    b=BP5oWqGJi1NkhQNOSbXu7P+FpSg/hNRmx0B4rO8Gqx85EGok4m3KikT4ANXknBt65A
    fXNSLE0L4huiGQGfuprnbwEuCeQ+qj7UZxLKwKCAxB1JAahabhI2aXavHougCZm/1lvn
    xUbxDjgiiT4Smr2q7swINgDruBWCkqm7/64dRSovBc/DGspmxqigv6NR2y+bSLjoPc57
    is7ZYT3B39VQEf9QRwgVutWdvdA0vkOIREyTw47Apvd/IQQaFFc4yd7vXX6gOPv4fEos
    dVkWjRoTWRc72jIxUWBCKNObIDOaNj9ax85UnBEHLPSg7QxfYCR5pTkgAC5mnpQdZKDb
    PG0w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1700128410;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a5ntrmbSeDKC3MIUkTN+rwYj0A/SouzIhz0NCta5JaM=;
    b=UXQfpDpeBOA/+uQIoH9PCmXFEnvsddqcUNpFfPvniDr88ck7Xx2c1N0P4Pj+BMWFLo
    HQp6iMSjT8kNXq7u/RvM2VHotHPDlNvVGzarsTQn03DoQ+tDG83SUOIHpO6mmSccCQDB
    7M1y1AHog2zekWbWkPXy0RSuZw13OkkSdWkg9A0cQS+YdmsmEiMReCVH3+FAGRrlQytj
    jkpVrVL9GAhsDXAzRCj+KV3cOjGtUBH6RKSmzy+XsmyWdDGv8a6OYv+5JWFM6itLaHbb
    rpi6WE9WZ+Hyq1TumzGWHHnoqyFrNT4oq/Ja22ECrbCyS4yH8inf1gdIhdgTjvPDuRQv
    1J0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1700128410;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=a5ntrmbSeDKC3MIUkTN+rwYj0A/SouzIhz0NCta5JaM=;
    b=yjV8xLA93WZtNSIH3tTzY/2X0yG6Zzoe4u3b9IYAOmCl1AGsjv8F4MX54NemKKrNLI
    s1ovWuEf61101zTE0cBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BhaIaRnsNaqJN2h0dTFZeqQ89seVgD7Tlo9gNQ=="
Date: Thu, 16 Nov 2023 10:53:21 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, "anthony.perard@citrix.com"
 <anthony.perard@citrix.com>, "jgross@suse.com" <jgross@suse.com>, Rahul
 Singh <Rahul.Singh@arm.com>, Divin Raj <Divin.Raj@arm.com>
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable
 through 'xl.conf'
Message-ID: <20231116105321.4a59eed4.olaf@aepfle.de>
In-Reply-To: <A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
	<20231115182340.505df6c3.olaf@aepfle.de>
	<4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
	<20231116085629.40a0445b.olaf@aepfle.de>
	<A6D4B8C2-E781-4964-A757-C72F38169246@arm.com>
X-Mailer: Claws Mail 20230817T113819.a897c59c hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yz=gulrvVJb+Omug_624L6P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/yz=gulrvVJb+Omug_624L6P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thu, 16 Nov 2023 09:21:06 +0000 Luca Fancellu <Luca.Fancellu@arm.com>:

> I see your patch is handling this issue but maybe was not meant to be ups=
treamed,
> so I would like to ask if you are willing to make it upstream-able or if =
it=E2=80=99s not planned
> to do so.

Right now I do not have the time to work on this.

First there need to be an agreement about how the timeout needs to be confi=
gured.


Olaf

--Sig_/yz=gulrvVJb+Omug_624L6P
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmVV5pEACgkQ86SN7mm1
DoBb8w//XinCmXvCLujEkTR7VJ3BftycYI6brd1nz7xnqb80cVyNyQUc64mBwQHI
N/ydw/R35BQns5AUw2hIk3jpFt9G0ihOi/Gmap3cYMQ57FmmHjL1LMg9vQ7R8M+f
Snr+xiBmCWET7QkyJqyX0hbefQZyWGXLiHurlak8Y6hMtV2N+wWqJS+aBAzdaJJN
YevKmanRIxNpfKEHevtrzVIeJSJaPn47ImA3x/LYkwhtZA+sBjdgxlnxZf4oGwYv
+0BY6n1oVZTXRhdUuao4yeqNrOOjwVsCQuUXogX9RZ48Pyq11pNk6yQeBtqMrQmx
KPy0KfPSZAZ2j6+XzkL4WgJLORruZcnA0DfJI2o5tb48C9wnCOjJ635MytUY+xq+
8wZ0g1uVoMW7wI/iNBg6gMaJG1RV7fXGaw6vPG2BEpPUtCW7vUQFYa42XOASeZYy
bmTr7ogOqJb8wrvJjrN0yOirwjRsbw+2m6jeZjZgQj1cKPUk5YKgZhQ8hqi5euSi
hMqUtfTQ63L7SwL3W1YKEuAnIYqUwAIw4UIogqkXNtyTjmvKG7WPCwBcr7lk4zpr
QQG/Qrv8gj4CYrbyDonXvSrZbdhQpOXv7tJRIyBLo8WLBBzzT6ZdBGnpv2zhF8O1
7rUA9KTzOhkQtdzcB5mnan4aLa855pXw9925sAT6jf0Fj+hFCEI=
=SnGN
-----END PGP SIGNATURE-----

--Sig_/yz=gulrvVJb+Omug_624L6P--

