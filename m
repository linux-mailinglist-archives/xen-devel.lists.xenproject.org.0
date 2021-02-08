Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C93136FA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 16:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82910.153366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98J6-0005D7-As; Mon, 08 Feb 2021 15:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82910.153366; Mon, 08 Feb 2021 15:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98J6-0005Ci-7d; Mon, 08 Feb 2021 15:18:32 +0000
Received: by outflank-mailman (input) for mailman id 82910;
 Mon, 08 Feb 2021 15:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pnXs=HK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1l98J4-0005Cd-Kb
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:18:30 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4397047e-5e32-4f62-be5e-d1424a7d7b1e;
 Mon, 08 Feb 2021 15:18:29 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.17.1 DYNA|AUTH)
 with ESMTPSA id 005e38x18FIH4nV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Feb 2021 16:18:17 +0100 (CET)
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
X-Inumbo-ID: 4397047e-5e32-4f62-be5e-d1424a7d7b1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612797508;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
	From:Subject:Sender;
	bh=XLsYjmi+CC1V1KCbL3bzzXD1bKOuGUMTSG1LNokrvdI=;
	b=LTwN52FpZwb3tke/Zo2fi8ErxKxnwNYBqZuWu5opP6aJMTnQeyFPFT6AB85YfeBbbJ
	zPLEw73Bh9aS3Xfg1A0bJMGV1JWBWOemkqlF13sF3PtLcvbxNBUL1m6aJN3dwaqMQG9+
	9wp2t56bYS1OJQUZ916pObFaMrnvrRibnB9ww4yCO79R/bHt391OEs8rrcM5+xd+H8as
	Lcjl6+rpBf4MW0Tu+ElimYgYalgp4J8cA3phhWqeAq7OUz4NfTg4WDHALOEO7Z1HL/Nt
	qziNQ/d6GhcgoPG6t5MhqsgDIlDrNacT0biM2/UryQsITKQZp27H1o4ciWEQJfaTWNqy
	drBQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+v4/A=="
X-RZG-CLASS-ID: mo00
Date: Mon, 8 Feb 2021 16:18:11 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] tools: create libxensaverestore
Message-ID: <20210208161720.144d1cbe.olaf@aepfle.de>
In-Reply-To: <24609.21811.725828.923726@mariner.uk.xensource.com>
References: <20210111164646.13543-1-olaf@aepfle.de>
	<24609.21811.725828.923726@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+ud3k=T7MfNH3fho=C1z9R9"; protocol="application/pgp-signature"

--Sig_/+ud3k=T7MfNH3fho=C1z9R9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 8 Feb 2021 15:13:55 +0000
schrieb Ian Jackson <iwj@xenproject.org>:

> I assume this is not targeted for 4.15.

It is, was sent before the deadline I think.


Olaf

--Sig_/+ud3k=T7MfNH3fho=C1z9R9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmAhVjMACgkQ86SN7mm1
DoBjiBAAjz6JaYR+zMEk8eMBtcm5mvZ8g7UWfnyxo9KoZJhqChvemBSkTPZJhDda
O1bHXmN1tr98ttUlt1iPcorOvB1TlymKGt0sZj6bkbZsReQd9+xeFNZ4wijYSgYm
qJrmchPbMff62FLsPrO7/GG4BBInx3LbGIVyWyP0FAtSjnVCg54GXRGOINHh5FTU
Me56SyYHZ3Rt+vCxDyvNtHpKYmds6L2rdqRGaK4u0CbhUS2WrMHvma7UKJgWvQMA
TLzF9l290Dd/R3w5TqdJ7ZeBI+S+DjaVNNUpVvqubdqO5rlcXFpxdYqgvdTUml1z
KJjWSlae4NKZdFnz5GZWfHBv9v8w3lwKfeSr7cn0PWe6+rNO7udNgtFVAD+/Sn5H
KOscWHJeseM+Anx/dUnxIiSpNMZt384n4WlAEJAAoxHgHIhr8AnV9XBGM12RKQBz
cB/2DFXPacjGONUVe9LKy+3xeMMWAyLvrIsM0eZEiGzm5+jmhg+NZ9zRyHtllTfp
4fESaEucqqC8i3AR7sWwA87mQhMH7d3X3Mbqvo4IhaxR4sG3YhL17FaiaePPc36g
4UZVKLgD3EIUXh1GgWqvCV+Pqi9kUJHnt7nMXSinOdnVd4oV2DLUoWO9BqMJOVRg
wucl6y2twCdaJQnmAWxIDZbefWQO/pl4uPmHAG5zFRd03Z47RWE=
=H78H
-----END PGP SIGNATURE-----

--Sig_/+ud3k=T7MfNH3fho=C1z9R9--

