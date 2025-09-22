Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F9B8F128
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 08:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127706.1468335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0Zh5-0004V6-IJ; Mon, 22 Sep 2025 06:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127706.1468335; Mon, 22 Sep 2025 06:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0Zh5-0004TW-CB; Mon, 22 Sep 2025 06:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1127706;
 Mon, 22 Sep 2025 06:06:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v0Zh4-0004TQ-Mg
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 06:06:34 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47786c33-977a-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 08:06:29 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso25367405e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 21 Sep 2025 23:06:29 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b?
 (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de.
 [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee074106f4sm18265990f8f.25.2025.09.21.23.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Sep 2025 23:06:27 -0700 (PDT)
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
X-Inumbo-ID: 47786c33-977a-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758521188; x=1759125988; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S33tBRFGEL/DOZHvKhG7BtJTvv1OFtfAiwgB5Qbf6Z0=;
        b=guDrchW+jtrPph/cqw2PG0fm0EkLtZUON/QElWOZ9VJ1P8tQttd3+HZqb0EP/mHo7d
         qlAY3MZdyHRrEom21XeztZXenn9ib067qiolFPHGwenQKFevenHr3fAVpfH/J2uFbAjx
         MstalBbVplvwhvyKwz27sW1/Dr4LnDi86ZcqFnL7W4nZ8bJnMmXavi0Kiszo5GtJBU8y
         wdWpx+gWOQD45s04txGwZGw+AZHOg+eh4GdXwfX1bYCO1j7cHQvfx9/9ORNI6OBqh18T
         6+JrYSJrLvdFBDpl4gAJZKV8xudl8XnVhQu4lvknwcldDhqK9NwrEWvyf41kw9FhE4Q5
         23KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758521188; x=1759125988;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S33tBRFGEL/DOZHvKhG7BtJTvv1OFtfAiwgB5Qbf6Z0=;
        b=VhYjLLyPpe60DipYIc9gsS0c63v30fSx9/4rws6hMwYVInUR2iIkGWeoaBIHA/sHAd
         jNgEFSHT8phxXdarkk6N3+pLNik+yGJ07TZz1V4/uOvH1Cmd0e4O2BicSAJwIFVAb2+3
         7W8+D6RcK4kvnI6QbXGB+y5evOdoDBidbp8X+EKbvNgugCcw54jA/ZForSXUXsJg2gXB
         pp25T0HAq82+iPKi3H6qCwPN0D8d/PxVaFG6DmskLNFu/6bR2N3TwK5NYO98kFtZRP3G
         z8eij7kYIMH8ZzhEAbbKKY1WyB7yrJC8XeQg4f9Ksth8VGjNrAUjvtHoK22zSP6KjB6j
         hBUw==
X-Forwarded-Encrypted: i=1; AJvYcCXtJ6Pd0qZqB6ftw/Y1aPbMAfV8OpEXIXLrQG2VdOuN1hWCqlfMAjAcLJA5yXI5F7kvhM2qD9Awr2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzfcsf/mHHWi7KpCoEdxtcP9NuKK5bT2rp0gygIyNih4ajD12Dl
	Dx9EDKitr5A1ebyFc3SeTkTLMQDez6OnXPSjm2Rp9o1RatG8jmRNgGeUQsprmVXtUNw=
X-Gm-Gg: ASbGncsqFri2gZYRCZ/UyK2/OHYWhm/9vkvIDTCr8jNlG5wJzYU4E1uSvaPJ5P8qNxR
	V1xi2K6JnyimHiDB12pGUsfYxmstejrz6YbpT1Y+qoL8AiK6EbmKK6JaeDj/SlEkFlkNuF1esru
	imRClD7ltFYRG0/H1vsULcdYDx7sQ8Vix9w3zENOzMBA3f/5KOq2KXHVVPCnBaGDwQJpX9DIVDL
	04PC9aMYWBdroMdYrrNuGv6pktB8HHOVU+8WbY/QrhlXLTb/PTWMxwmdUKZS3m2oEvtyixviJKG
	4Bjf/rdEQp8JRCDqGfv8i4RWP1wzPbbQ+Qm18aZ2n8R91Ly9Ue2HCVnBckR9/3ONjGJUQ+pMv8S
	U7Ct86KHtPtNuEULzeWTJ2MBFGBBN2jASSN6MkJhL1YwcrKMf0GAM+RF8JL8bVYe1zCaj53GieM
	PiNpv982t0d4dX2+vfoqXJI3+Y2EmZEcYfEilQ1Cdxurpp
X-Google-Smtp-Source: AGHT+IFD2CfjVpWeDi5iUTryBGhtdm4ngYLxtc/glzzILx3/6SMLU91M4jq7nuc4Yswkou5ELKp8EQ==
X-Received: by 2002:a05:600c:1f95:b0:461:8b9d:db1d with SMTP id 5b1f17b1804b1-467e75ea470mr106925685e9.7.1758521188377;
        Sun, 21 Sep 2025 23:06:28 -0700 (PDT)
Message-ID: <a8d1d076-81b0-424e-b281-dfbd49130d38@suse.com>
Date: Mon, 22 Sep 2025 08:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: take system_transition_mutex on suspend
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20250921162853.223116-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250921162853.223116-1-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------whziD4bI9vuk0vBNxNwWgLTF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------whziD4bI9vuk0vBNxNwWgLTF
Content-Type: multipart/mixed; boundary="------------MI4OlWCfs6VtvyAFMm5tUoqt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <a8d1d076-81b0-424e-b281-dfbd49130d38@suse.com>
Subject: Re: [PATCH] xen: take system_transition_mutex on suspend
References: <20250921162853.223116-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20250921162853.223116-1-marmarek@invisiblethingslab.com>

--------------MI4OlWCfs6VtvyAFMm5tUoqt
Content-Type: multipart/mixed; boundary="------------xxNp610sdXCe0SVU03qz4z0d"

--------------xxNp610sdXCe0SVU03qz4z0d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDkuMjUgMTg6MjgsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gWGVuJ3MgZG9fc3VzcGVuZCgpIGNhbGxzIGRwbV9zdXNwZW5kX3N0YXJ0KCkgd2l0aG91
dCB0YWtpbmcgcmVxdWlyZWQNCj4gc3lzdGVtX3RyYW5zaXRpb25fbXV0ZXguIFNpbmNlIDEy
ZmZjM2IxNTEzZWIgbW92ZWQgdGhlDQo+IHBtX3Jlc3RyaWN0X2dmcF9tYXNrKCkgY2FsbCwg
bm90IHRha2luZyB0aGF0IG11dGV4IHJlc3VsdHMgaW4gYSBXQVJOLg0KPiANCj4gVGFrZSB0
aGUgbXV0ZXggaW4gZG9fc3VzcGVuZCgpLCBhbmQgdXNlIG11dGV4X3RyeWxvY2soKSB0byBm
b2xsb3cNCj4gaG93IGVudGVyX3N0YXRlKCkgZG9lcyB0aGlzLg0KPiANCj4gU3VnZ2VzdGVk
LWJ5OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IEZpeGVzOiAxMmZmYzNi
MTUxM2ViICJQTTogUmVzdHJpY3Qgc3dhcCB1c2UgdG8gbGF0ZXIgaW4gdGhlIHN1c3BlbmQg
c2VxdWVuY2UiDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9h
S2lCSmVxc1l4XzRUb3A1QG1haWwtaXRsLw0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjYuMTYrDQoNClJldmlld2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------xxNp610sdXCe0SVU03qz4z0d
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xxNp610sdXCe0SVU03qz4z0d--

--------------MI4OlWCfs6VtvyAFMm5tUoqt--

--------------whziD4bI9vuk0vBNxNwWgLTF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjQ52MFAwAAAAAACgkQsN6d1ii/Ey9w
agf9EtF5ZEwY40ioARPpA3Uwj6TmMhq+8ONvmTy9b+fBkH3hLDun1yrAO5SQQ1tp8t9FeBvUOr4H
jWKH8/4iHaxFOzoN43TVAptMm5oNw7DnXEzKdC6yGx/nin0LkRt5zRfVhBMNhHH6DBBFpNm1lrjx
vOm8UKVYRL//GcM4cko+d5TnTKzuagPcyaNe45Jy3PK9mOKn0FKrM3q2NRd2J6Zi1u7xR5cMJjyy
PsIKZNFTbqjIPrsMb5HPRQGVY/nr4dLSj91tLO8D7kBHKH6OFOgDHyE0kIWwa+05p61f5u9moNBu
AuZmlWg1NNmmQkZobKf8bjg/9V2aTnvgwsSPSIcTPw==
=TmYL
-----END PGP SIGNATURE-----

--------------whziD4bI9vuk0vBNxNwWgLTF--

