Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202AB13C2B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061582.1427192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOMR-0005PE-Je; Mon, 28 Jul 2025 13:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061582.1427192; Mon, 28 Jul 2025 13:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOMR-0005Nn-GZ; Mon, 28 Jul 2025 13:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1061582;
 Mon, 28 Jul 2025 13:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugOMP-0005Na-M2
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:57:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d84df1cc-6bba-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 15:57:48 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so732015466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:57:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635b42027sm429808266b.143.2025.07.28.06.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:57:47 -0700 (PDT)
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
X-Inumbo-ID: d84df1cc-6bba-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753711068; x=1754315868; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tXQm+oais1zGvgZYQ28Dx902/hZx2pWL6BafPa1dPDM=;
        b=Lelf9N3wWuqzTqBV5VZDTY3OdS90akUqoqy3Yc34cEwWNAXdLxz4GicbmOC1LCALPx
         oGn3bEKm+UHBoiuuLKqinE8euhAsFplFpoQp6Vhc7PQOKfq1a54zcizEEogKRUe8EFg0
         yklS7kZvdsZ+HwQuP3a8oeCOvrN86ICS0e5n/eqfpdiIOUV2CFIdEVlY6Phv33qPrFuf
         TLCE2H0A9CruLz2Gg+aDP35k0hxGmdEhRucIaTHIkxMim4OlWe90mkeOHKEVRGz6oeBB
         wrHDoG8/Zhk9JXZ1BMmmw4pe61y5cvQL8/WlQ7+1URsW4+UD9tq1NW5IMaL/u12uOC0f
         hxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711068; x=1754315868;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tXQm+oais1zGvgZYQ28Dx902/hZx2pWL6BafPa1dPDM=;
        b=jWRzOUZB23Dg5ATfnuLxjuhZlKepIMR6beIH5HK55c/Trb0qTbKw5uf0ewRgNIc2bW
         1KHM3DL3UccO5UZlHD4Bm1UPbs5x6yVgBPC2mOcLf/cKRidbCTSF+tPsHP0k59GwJinT
         lGWuP+s53APJcd8pj+K7H3ngg0lzOyRiGxrXsNnh2lCpx5CFhCF+83qUCYCjC3bSaF5Z
         NSNImtjMA2vWEbrTwpVKizGVOt37irPcOZs4TZ1HmrUdwXuAvNCV2f7+L4n6SkB+OY85
         lcCS/BRuBLQogP3UxAeD1i8BpjrnNgjfl9Jxx9Ac04VhQf9Lhb8rsu4h08YHws/FcuGF
         /OLA==
X-Forwarded-Encrypted: i=1; AJvYcCVX0ElaIM1E7k4KC63UoBcFPSENMwGiDIPGMuUkbB19ysp77O5cf05764GZt1BIXuW6XR9MdLQlhzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP0a93HmgQVLbODckhwMBNDnbVHP3rnpXGhNqAS7oSoCJC5vYP
	txIFFJ0G4SgpqiV5h4vYgfn0EXzi21rFY61cwD0/ebspRFRYB+5DVMPLqe1kMjM81sU=
X-Gm-Gg: ASbGncthIEtgKf7myYkBb+VK2vCDMvJ+VSkWfCohpTQepIoMWg3Fb1krErAPox27/t3
	Mqw+0PPOiRp9bx/pXbOrd/NW91Bw09EWnzN18+yONkGFWl/2m4E99hQqp0KXYE1LdJFY5VR58AK
	uoPmgpPOxiivCCfY70SoXmCCN99/gj7VlBple5Hi86nsvvlSm3b9F/Y1vyqdqoyWPXm/9BAGpC/
	t5uNyHszWTQz8Y1bOTEEwWM6bU7AzNFSck7kTwGWLBHk+56sTXEMlKZi5SwcV5t9U+/p4At8rUz
	nxZx8qhD6kYIlExMfOfQTxyoIx4h1xe9JRdyUYgjeEoxvobq6IyGUFOFnq1/xX7cbv+17bdOwix
	O2TJWq2RNtMB40CDYZGj0RefBshZpzWDE5GWpsU155twKhWPC3UUpCP9VvDH42f03Cqw+iuheZl
	ohiXdlREsxA+7CvuwPs7DsMMLcZrwGYRTP0ArEo0zogQ==
X-Google-Smtp-Source: AGHT+IHRxI3YsjmewYbvwZTKYgJQJ3DFRi63u2tcnelzPrN0N70ocpC+BGbbde5P2vqQ1EtjD9E/qw==
X-Received: by 2002:a17:907:6d0b:b0:ae3:674a:9af1 with SMTP id a640c23a62f3a-af619ffa24emr1508909266b.57.1753711067939;
        Mon, 28 Jul 2025 06:57:47 -0700 (PDT)
Message-ID: <9e351b4d-78fc-47e3-ad36-992837ee4eeb@suse.com>
Date: Mon, 28 Jul 2025 15:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] tools/xenstored: Remove stubdom special casing
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-11-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-11-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hWpBnb9Zc0mwSBXISFE7rVQd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hWpBnb9Zc0mwSBXISFE7rVQd
Content-Type: multipart/mixed; boundary="------------Y7XdPG76ibEyBn0e9cTX55ls";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <9e351b4d-78fc-47e3-ad36-992837ee4eeb@suse.com>
Subject: Re: [PATCH v5 10/11] tools/xenstored: Remove stubdom special casing
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-11-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-11-jason.andryuk@amd.com>

--------------Y7XdPG76ibEyBn0e9cTX55ls
Content-Type: multipart/mixed; boundary="------------lN5xIgbGeer4HjxXJjMQINOG"

--------------lN5xIgbGeer4HjxXJjMQINOG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IHBvc2l4LmMgYW5k
IG1pbmlvcy5jIGltcGxlbWVudCB0aGUgc2FtZSBuYW1lZCBmdW5jdGlvbnMgc2VydmluZyBz
bGlnaHRseQ0KPiBkaWZmZXJlbnQgcHVycG9zZXMuDQo+IA0KPiBGb3IgeGVuYnVzX21hcCgp
DQo+IHBvc2l4LmMgbWFwcyB0aGUgbG9jYWwgL2Rldi94ZW4veHNkX2t2YQ0KPiBtaW5pb3Mu
YyBtYXBzIGRvbTAgdmlhIGdyYW50IGFuZCB0aGVyZSBpcyBvcGVuIGNvZGluZyBmb3Igc3R1
Yl9kb21pZCBpbg0KPiBtYXBfaW50ZXJmYWNlLg0KPiANCj4gQ2hhbmdlIHhlbmJ1c19tYXAo
KSB0byBtYXAgdGhlIGxvY2FsIGRvbWFpbidzIGludGVyZmFjZS4gIFRoZSBkZWZhdWx0DQo+
IGdyYW50IHRhYmxlIG1hcHBpbmcgaXMgcGVyZm9ybWVkIG90aGVyd2lzZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVy
Z2VuDQo=
--------------lN5xIgbGeer4HjxXJjMQINOG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lN5xIgbGeer4HjxXJjMQINOG--

--------------Y7XdPG76ibEyBn0e9cTX55ls--

--------------hWpBnb9Zc0mwSBXISFE7rVQd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHgdsFAwAAAAAACgkQsN6d1ii/Ey+W
fAf/Tuvfoatk94GsiriZzeu3aX83NhS2IoVX9r+qQHWvJEUrOwCmuuUBRMwvZ+BChsIZ2KwVXfv7
i7BkQejo8Vs6t2noyZNV6vzUCRpsdk7bzPYUi4ti37AsWMpCCnTexG0nSXfetTLeDAJDuNP8saoy
vwQDe1r/38M5DI7rOEM2May79nWMLUHXNDWWIGyeaYXcyAlf4SBU9pCUTFPaPwSnU+zjzl00Vsa/
5gJuysJTMBVrgyHMBIDEAxGtX9n85cKo2M1isV0a87EMiDzmIZ3INEJBl1YzynhHIUITaFs0knvX
QyoHEZh96enIVs1RHWUgcpvZQ05lBUjFrWJ+d4tHSQ==
=PbG4
-----END PGP SIGNATURE-----

--------------hWpBnb9Zc0mwSBXISFE7rVQd--

