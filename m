Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C429E71B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14076.35032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY45h-0006ZR-CZ; Thu, 29 Oct 2020 09:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14076.35032; Thu, 29 Oct 2020 09:19:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY45h-0006Z2-9X; Thu, 29 Oct 2020 09:19:29 +0000
Received: by outflank-mailman (input) for mailman id 14076;
 Thu, 29 Oct 2020 09:19:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kY45f-0006Yx-Hh
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:19:27 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2777765c-b1d5-4e40-8202-e07cf5be8a41;
 Thu, 29 Oct 2020 09:19:25 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9T9JN15e
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 10:19:23 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kY45f-0006Yx-Hh
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:19:27 +0000
X-Inumbo-ID: 2777765c-b1d5-4e40-8202-e07cf5be8a41
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2777765c-b1d5-4e40-8202-e07cf5be8a41;
	Thu, 29 Oct 2020 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603963164;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=SC8SmVv0c/5jonRmYiSBZn1dYb/iyICnBaU1DZlYyvk=;
	b=RIOqKxtZiHGnYkqHEtrcD5Ghd+PifK4dLTJ6a8YiA80/7hOvP27VW/SrYYMHr2zbHr
	47n2vBlXhOLP5tHl6z/D8+jKDvBg38mjlxVToCvRnWwZxPB95hvz10uwGruwp3Zo4FjA
	bcrxs4ScKEmdDpZCjr/e1r1yKhtMB3uFxqIpXXodtywtBH7Eaa9X+32oxhivn5dhpXFW
	IU19nLQ+5dA0XY3aCXHEnuzVrCrHB/896cpMQk2fXE+eBR5U5E12IGEFuVg3XAYcFHrv
	8BPEbzbHuP8t0byUZT0YsBAuL3uJOT9roc5IrZRW7FHvJdfHkngTzPCZGAHNSKfBl6os
	D0BA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9T9JN15e
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 10:19:23 +0100 (CET)
Date: Thu, 29 Oct 2020 10:19:16 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: call traces in xl dmesg during boot
Message-ID: <20201029101916.46854068.olaf@aepfle.de>
In-Reply-To: <0831520a-609f-de69-7a07-1b86fe137699@citrix.com>
References: <20201029092237.50b8a6f6.olaf@aepfle.de>
	<0831520a-609f-de69-7a07-1b86fe137699@citrix.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dp6PCMwbvN+8upAg5.v.Afa"; protocol="application/pgp-signature"

--Sig_/Dp6PCMwbvN+8upAg5.v.Afa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 29 Oct 2020 09:13:08 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> You'll need NR_CPUS configured to 512 to boot properly on this system.

Ah, thanks. My builds use the built-in defaults. I will adjust my future bu=
ilds.

Olaf

--Sig_/Dp6PCMwbvN+8upAg5.v.Afa
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+aiRQACgkQ86SN7mm1
DoDusw//WtGwHiY1nnQQZcw2IRrd9VI8SOHnCnYlwMwKyVmxSTn2smxctU0zNNRb
x12mLuHicVyjgGZizsj1YbzPBBLLY/LCM4LPHrdM4NEXMrkjlML4VFnbehAmoVcI
Uy4T8d8nbmXlY1eKw1gdCEzmHdYSavmxhdtp5k128v8YOqBfuYm8VPwGysTRo/gO
PnqPi4FmgOs5mMB1+kN2+SRUG6X5gQFbIgaWe4SUKk0MSnH5BUjpjzy2pginE0wd
qU7sXDPIjJxeBoynrd5slnS+Ivlc72YoyDlTY0eBubuafSXAeSHMWULrsltZFNXz
OHOtpR+2flbm3kiuMYxEK9Cb6vULxveNH0mRMn8M+BREphBwetzGZrKcKUJYE8nt
yD0onmG32JWzNmEMOfw6QiYz034B3rTFTcWJbF8mE+pJhJDXIla2bFBrU+EtpctT
YgtJoZ8VOo/Om4NEI2Fh1frkHIX559CMHSiZo5/CAjV8P8R+HZyXQqvhc846Bwxs
C/xhyNfrRfSvLl2UNVn4ggHZzK8w8eWTJ+TpDSROr4DizRjpIiWbSLaCbtlyR95M
d8fAEDmB2dXLtwSxdRbTSbRbiIUotpdCXTHflT0Pbo8U4yIJZxBHQjLnkm6OiCxm
Ilp16ESIMuMBFbj4OE3wBxfrRt+SdEgicNarezkYh2sNoHnfjJw=
=v+Dx
-----END PGP SIGNATURE-----

--Sig_/Dp6PCMwbvN+8upAg5.v.Afa--

