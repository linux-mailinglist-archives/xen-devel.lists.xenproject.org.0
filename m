Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BA3ACF2D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144805.266482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGVg-0003Yo-DS; Fri, 18 Jun 2021 15:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144805.266482; Fri, 18 Jun 2021 15:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGVg-0003Wx-9f; Fri, 18 Jun 2021 15:34:20 +0000
Received: by outflank-mailman (input) for mailman id 144805;
 Fri, 18 Jun 2021 15:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ygMg=LM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1luGVe-0003Wp-Jq
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:34:18 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e33be499-6021-454e-b867-f7db4f6a3100;
 Fri, 18 Jun 2021 15:34:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.3 AUTH)
 with ESMTPSA id x0a371x5IFY64tn
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Jun 2021 17:34:06 +0200 (CEST)
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
X-Inumbo-ID: e33be499-6021-454e-b867-f7db4f6a3100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624030447;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=myTPQL8emWIF/wznjYNNFDT7VqB+zmIy2OxGuMP3FCM=;
    b=qKLzhUMf0wM7kYF4wBEnTlNZYvn0Tf/+9BnOngg47gKsLpfcBSLu1dFdvEOrGXY5Ol
    Gf/hKLUaIzauHxiqnJAR5LhRYNDAkgN3Ny0OgPfoELs7NYfAn0tzd7zs1i+Il87r1dLs
    0JFmJ8Jm0kxZULSR7RupVw0Q5CiPJT9Q2oiAbC234I3p0OgH3rbr8T29evvhMVzfwAS4
    fIxLgNqgMZi0P2ln+oCb8knepUFJ82uNfrg3BtiPCrsZj5TAjaFixLh16HKttm0V3SUi
    BkR8j2PEWMCOWfXG4dYT4LulYTWP1DHLyaaXxmBI3qy9B++97Dai7ieUuUGZ577dHR1M
    SOzQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Fri, 18 Jun 2021 17:33:56 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUc=?=
 =?UTF-8?B?w7NyZWNraQ==?= <marmarek@invisiblethingslab.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: use integer division in convert-legacy-stream
Message-ID: <20210618173356.108f9935.olaf@aepfle.de>
In-Reply-To: <8a9be55a-ad6a-d06d-9ddd-0f2d656e4fac@citrix.com>
References: <20210618093114.1640-1-olaf@aepfle.de>
	<8a9be55a-ad6a-d06d-9ddd-0f2d656e4fac@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CnFjWk_OTXbOt567kf8w90h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CnFjWk_OTXbOt567kf8w90h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 18 Jun 2021 10:42:58 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> This is a Py2 vs Py3 difference.

This script is not ready for python 3.

At a first glance it is the usual type confusion.
It seems the type 'bytearray' exists in both variants.
Perhaps stream_read() should return such an object, instead of either 'str'=
 or 'bytes'.
I'm sure there are more pitfalls.

Olaf

--Sig_/CnFjWk_OTXbOt567kf8w90h
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDMvOQACgkQ86SN7mm1
DoD/lg//W1f7Ux2wrSZi5WEj0/uMUz+94JH+cdMB2csW8CwgJNKwmqYGTgwFHAp9
f14Sx/VjZe/FzI5CCT4NwF9ec1CrMn+Pa52QOVNc9guIProT6BMhjzuKgngTIG4p
0yysTglGeZ0hS6UsLkxQXbCCUZJHg9Z23eQZhOi0wuAwshm6wl6gOPRV6zzVRo2w
ujdi5v8Fgj5d/uRyAiW7CewhLEhMQJrTQj0WA3nlqETF3dUgTpXXis2IentUa6N6
quitZY+rk8nTUPLocIFEKiv1MBpP58PSvZ9ZxsUtOcfWDO6rIqBfuhp6lXyuK5E5
bPOahqDHyLrLkK3RZOUcBQ5u8yjuxI9rY5nk/GNYRKofBPsMWzelOjmXOBOG7VuA
i676sbX/0sGxyKwWxzw3xg0tzwnLM4UsiP3PdRnVk0DjnyxgZM7kJeh6vYDnxQJM
+SMwEozzVAG+1fwOkpo7jPRpzIzW6/BnL5hgR623hiqndQTnyX/tkE6u2k92CXYL
AKTx8hgeaZgOSyIhgVC720kd9rEKEG4ENduZl8HKtgtrQpM0dLggHoNCd6EGI9VQ
vySz3rtcJk2bs83ugd9UooSQk10TuQQXbABDJ50Kx0NGN2CWURYPj458XTxkDFV1
+kKQPO6o0ZQGcM9K8LA2yeBKcV03Mxy9sfyd90zDUcFT9AJu2JE=
=J7WG
-----END PGP SIGNATURE-----

--Sig_/CnFjWk_OTXbOt567kf8w90h--

