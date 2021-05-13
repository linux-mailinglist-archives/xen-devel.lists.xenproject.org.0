Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5337F7C7
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 14:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126911.238474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAMT-0000Ip-Me; Thu, 13 May 2021 12:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126911.238474; Thu, 13 May 2021 12:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhAMT-0000FW-Ja; Thu, 13 May 2021 12:22:41 +0000
Received: by outflank-mailman (input) for mailman id 126911;
 Thu, 13 May 2021 12:22:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lhAMR-0000FQ-7G
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 12:22:39 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e21b312b-a8d1-4d8d-a59f-d531191e5421;
 Thu, 13 May 2021 12:22:37 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4DCMa45M
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 14:22:36 +0200 (CEST)
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
X-Inumbo-ID: e21b312b-a8d1-4d8d-a59f-d531191e5421
ARC-Seal: i=1; a=rsa-sha256; t=1620908556; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=f+l7xPCu37TJeKYeNLWct8ynD/hapIVBZbfI5d3gKiP4Iu/7qMJhBBYz0fML0Qn23h
    CKkcu/C8/fvliPsEEPzS+FxeSjHsfQvfiiyA092ZndYvHu/a8RL4DHa5MDx9PBiEoF2W
    1bibq3SsopLdtQz/QJhWdRlIOBNUPWVtvkO496wvPUFVENGAMaGt3SCszv7hqAGBHubV
    FmLtsVKH3nLHWurzIcwyAlV1iRgBiu0Ozuzx0YMdX9HZ6NOdtFlvIe+3U59C4fQlnSlj
    hH0gZIJaJYwIcN0h15cHiVgiRoPkkhce/9zyafg+FK86Qwn6GRsD3VzbMfJn0wvc7e81
    3GgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620908556;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9qNuiqEYNLcfEWn6xseeoqOS2no7vS3ZOqeEnUlAs2c=;
    b=VxUVBxb4w9Zdp5TXreYbXMeiwzl0cfQzc1GDJxApRV/+U0vVmcQ+pWqrOtfVnKt+j1
    qEibf9gaa+f6xjON5SYdpFUmJHYTwbpP5RBxKWOcpA/MwI6kAA84N802c7eyIcxhhC96
    Pu880W1oTMxHBa+x709cBywmWcBxsV5oxym8xYdP4pnywnvAB3rOhuDCLzRIOTeiC3ZA
    7K6a84gR4IF6KYHYy84Q62Xq4K4YIAgVjfy5H55Fl1i1FOTmJqcjljrKCdrtSgQGYhJu
    2gQDIEltUoVApg+2ERFznwR6jXZfWMhtVlyDiWtVM8AY/PR+M/C7eV4848sfTsm0JkcG
    7kXA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620908556;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=9qNuiqEYNLcfEWn6xseeoqOS2no7vS3ZOqeEnUlAs2c=;
    b=eGCniW/nbt3hQsGMgZ5jwNPYrgS5XvPGsj4lOYJKX6/KEtnH026jq36Qqcjqjal9H3
    mk+i/q9mhMRGt0olAZysNYgk4vZ3Ntswp1//4Wr38gM+b7tmUDwrT0s077SeD0bO+ohJ
    3RcxBM4szJMfIUS/sHwzBMW9K4vIdh+6ZXZ/D8CCtAYjNRdIOev10Ei/TZYbf3W+ZUWO
    xNs8AxRbh9d5oysz7Ljl02Czpmr/yWW86xuLpkciWnp2LtzknRgt3Gf7cjlS4ck6vwxn
    20Byx9NQ6jju5h4kGaP7RjjBYJ18UrB8Vw7TMq5DomjbQD2TgVv7vydXitpoN1PqBDwK
    cAzw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 14:22:29 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210513142229.2d2aa0b4.olaf@aepfle.de>
In-Reply-To: <378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Aa2AgIoIJ.P1nye/=J4is5T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Aa2AgIoIJ.P1nye/=J4is5T
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 13:11:10 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> If I'm counting bits correctly, that is Xen rejecting the use of the NX
> bit, which is suspicious.=C2=A0 Do you have the full Xen boot log on this
> box?=C2=A0 I wonder if we've some problem clobbing the XD-disable bit.


Yes, it was attached.
Is there any other Xen cmdline knob to enable more debug?

Olaf

--Sig_/Aa2AgIoIJ.P1nye/=J4is5T
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCdGgUACgkQ86SN7mm1
DoAJYA//datBsFjpGt66gi/I/bsoC0m7vkSCnsn29+QCuNsF0c540tX0oQCKziqN
orzpBi5AFQI7hw3HhW0vWCzvqpUhN7yZUgZ9uSjJBy6Lw/iiYY5kZrmwDHCiM6HF
GtC4RrYaekKIz1V7OTzJJNUcdUHhqIhgHd3ZnLKYM9pFeK8jx4zd58srtxFv4o+v
45tpEDxLFt82uAYxgFrElNRWrX3uL90Wv0LIJnjBn71dL21P9ZnoWK5MeXe2p778
Y29zBRQUBtEcu7VfI29zjPdUh1F4CYCg8hCurCSBvRd4cPvT6tg4RZ/M6Nr4tRqv
txFYGut6Zv5gVb2mSbJNS1pT0XgJ8VnfGWjGx4rReC+i7S/jrQkMqAUZDc4cZam3
RjIZqcgZRikUn8+1aJKOjrW88aExl3Td0GWP8rCZvTL4xdneRUfXZvEeCADIwuEW
M+SaLwHbaeGqOSo+8Hr7qxxBbZhwAof1A5pUzbEjF8n9FuF3dFSp/G1Ctoie88my
6bnZo0l0r8yXaJZtz3hpyU7NA3lEgDuT6e55NL/uY9f0gS0zjonZfvXsYHpqBwf5
+kDPZCW9TWuIvqMMmY4715js5IjuZgNhxAxVBWCy0on9JbHUFlDjpa6d6xESQuFG
8pp0E8/7iDjluWP/gCOkORiWgVKmZI/VMRWfEC/KSHPezCR6wws=
=oCZP
-----END PGP SIGNATURE-----

--Sig_/Aa2AgIoIJ.P1nye/=J4is5T--

