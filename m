Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D98622C2
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 06:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685037.1065390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdkmf-0006qv-00; Sat, 24 Feb 2024 05:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685037.1065390; Sat, 24 Feb 2024 05:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdkme-0006oJ-Sq; Sat, 24 Feb 2024 05:41:12 +0000
Received: by outflank-mailman (input) for mailman id 685037;
 Sat, 24 Feb 2024 05:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PObI=KB=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1rdkmd-0006oD-4Z
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2024 05:41:11 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1a3b0b-d2d7-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 06:41:06 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 50.0.4 AUTH)
 with ESMTPSA id Q60eb001O5f21mk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 24 Feb 2024 06:41:02 +0100 (CET)
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
X-Inumbo-ID: 4e1a3b0b-d2d7-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1708753262; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fWNRmebLBzL1O6xOB8jGE3f8EPuSROIx2RUB2J9V7zjmP/EUQeKumbBvLQCvogDoJL
    /LROM52IA2ZvFFZk0rTroie2VSGhgFifdABCPpwjpmobFB/0O+yRF491UDHRJcZB+KP4
    IYhwZjjm+NEuf0Cl3HqL9Da4frINas2qiCXe6/eQW3uwXMk2QBocCQBBnx4tFGy/z3xa
    fxbP8L72Avbfk/7bleB9y8HmwpYv9M6eR1Ua9/Y2TEyLGW9kfTSehYPsYi23/s2dvSxI
    7dFi9d+tHPghK+5pmCwwbL4lyfXgImBU2uWAQ0TljQS/KwbACUMQkJ11aqAnM1gd4IDn
    IG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1708753262;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tiVa+cmzDxUAxS2MsGAu2HlnRcl+rBEDZXnON/1r4tc=;
    b=fhR5U/PyT7DAEyG1nd15+S0YvNjnqh12fEqTiRXZC6snhYkhi4KCMy3AKc8ZD7jLP+
    bcGTcprjhB10pfTtnaP8rwWOfSc+fAMgLnzTU3y0iLHO9hRqWqozQfa7sgPu7x2aNE0C
    66nEHfcp4OqX/ChRS1dTlFgVZ6FPlBjJRanAlyhWGlBP2a4xyx7idsOAwbEvoMPoMPI9
    bqX811Az5TiS53ZxV9CWo2ifMicKYcKaXUxuYfvNubUTGal6FSaEL8S2kZRopBKU07Vv
    QsEDucHtUKZ35vnIrzganfXrXrmKxCCGSdA7/oXrxvt8GwhLvhPADd7Lg5q08ODjR11Y
    QXag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1708753262;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tiVa+cmzDxUAxS2MsGAu2HlnRcl+rBEDZXnON/1r4tc=;
    b=mbTG5YD81dF9xg9/dtcwBYh0ecK/FCSCh3bUWKGpV3zLAw344odjT3Bko3soNMSI7o
    lQOoAdSb+jj0EDUIbHWwt6z0g9PJYCTwkhs3nfXPPY0TgWZCWlpWhUwQa338POPrg/Rg
    XotgRAeTu01sgcJX1OFN6p1TJgJyxQvGDfTHRTn0HoEQKJRnt3gcGLd0Yr7A+HZH3CNE
    0dasbc5sZspM/QJPpEAo3zLOn7AX0YNeT4889MnAGJkIjmU8KqV7j1xFOn5U2h2M4DA8
    b9vTQUCl4R6JxqyjekCo+V2ANMkYqusi6NBq6AEhdR37EmlVEArDCvLioqaRsJEd+Oui
    l/Bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1708753262;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=tiVa+cmzDxUAxS2MsGAu2HlnRcl+rBEDZXnON/1r4tc=;
    b=v3a+swVB3hNMjInf8dVmbUyQXtb649avWbfRU6hW5V5vVc8yvjQCjAuP4eleCPvLbi
    IPJ/MTPn4ChA+/WPniDg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5B0GIOR3sVV7O9CNMudHTkv9gywkxX9QhB6i+AQ=="
Date: Sat, 24 Feb 2024 06:40:55 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: remove bin86/dev86 from tumbleweed image
Message-ID: <20240224064055.69dc7fb8.olaf@aepfle.de>
In-Reply-To: <alpine.DEB.2.22.394.2402231522020.754277@ubuntu-linux-20-04-desktop>
References: <20231213202515.30587-1-olaf@aepfle.de>
	<alpine.DEB.2.22.394.2402231522020.754277@ubuntu-linux-20-04-desktop>
X-Mailer: Claws Mail (olh) 20240213T072151.4501d00e hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mVkE72fFxpJwgeXMNm7lIXN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/mVkE72fFxpJwgeXMNm7lIXN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 23 Feb 2024 15:22:38 -0800 (PST) Stefano Stabellini <sstabellini@kerne=
l.org>:

> Do you have a successful gitlab pipeline with this patch applied that
> you can give me as proof of testing and success?

Yes, all of them since the patch went out.


Olaf

--Sig_/mVkE72fFxpJwgeXMNm7lIXN
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmXZgWcACgkQ86SN7mm1
DoAWoA/+PVWPpu93tN9CE2mgjW6ZHVbQFrubpY/WgLzFaXfDwjH9gqYOrjspQn/7
5k/TQo/E33NdJ8GGSb3VcVcUoQHMunsaDGofo/LwuMn0MeOyOW7Vy8ovarxrD8Bv
5P3YoWJbH4+RmhG6uRKTXyOAP8g5vDcl+hfDX3xh/4oN9jYUO0lhLJ03atV4h4XB
bREZMv8MSsZe+uuiWPrv0+zbmhDHvPdmXOxJCDVwiKqPe8kg+8/r7buG022YQMln
HCioxErIy018NyBZFkUpEbVQEGyEOJf4qKbCksKq/IMIfhTmAHIFmWxT4eqEu9RU
iNdnUX1w6OBd5swLt7z5CZJSEaAc3JA767A/rj1u2ac4eZutHAx9542a/e8w6YGv
ivRfw8kUMSjuoGF/p01JNW/1UXLCilt+bnhvXKJ+MA+hiIHXEDzPHjBJxvLJ9TVt
yQTsvLOwG+jAIuUDcFIgsZ9412vIZ3c8rtkeLJL83dtux0UeratsymXeBpBSP/vg
t1kEKDLNFBkBrf3KB6UofFBCwll5NzCOifW90K3lD6FV+Zh5YZ68SNbhb5fQ1+gU
p4dxQT8DeZLSgSwsw8u09j7IqEQrdaMBoSVmJ5+ybQZc1zhWOmg4gCjg2n6MrsVV
J489uePONN5cZTftYDe+Ys4obQS1QhOYag1qMKG0fgtwj13ccY8=
=uPaz
-----END PGP SIGNATURE-----

--Sig_/mVkE72fFxpJwgeXMNm7lIXN--

