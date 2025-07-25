Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A4B11922
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057406.1425291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCnO-0006JH-H2; Fri, 25 Jul 2025 07:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057406.1425291; Fri, 25 Jul 2025 07:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCnO-0006Gp-EB; Fri, 25 Jul 2025 07:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1057406;
 Fri, 25 Jul 2025 07:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufCnN-0006Dm-Ak
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:24:45 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e840733-6928-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 09:24:42 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so2967938a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:24:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0d1297sm1795948a12.1.2025.07.25.00.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:24:41 -0700 (PDT)
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
X-Inumbo-ID: 6e840733-6928-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753428282; x=1754033082; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=acsqkOXiZBA1wWAhfCw7KbTEE7XqQosgbKSzM5xexK0=;
        b=AVwRWfix533c+FViDbdeApt/4Hkr98pv6NQblcoUnDSgEmdTm/egt6YcSXehfLVbCT
         FANLS1kqFme6ari9ypd7ypEc0mGPluHVIULKaNn7lU5xLnqUKKmTeg3yve/cUmpCFEFP
         WXeTJDkX3bQ1QTEoIqLdCPn+QRKkZRGTf1+8e4gCnO9aqcvm2JkK2EZfJ1zuPNW8F67G
         O5IjeNmsLr06dRaDT5kRg5/0TqSfsFdJrZ0svm6PHerMP07VUb1CvW1vHZmeLsAjlDL2
         lWJeyKeCu0FwAZSzkPYELnkTtjAkH/+hhco1Ih+Ep2d8xBqtmGpt0Dz7t14k1YVjnbLN
         JNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753428282; x=1754033082;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acsqkOXiZBA1wWAhfCw7KbTEE7XqQosgbKSzM5xexK0=;
        b=jLNLpR2t+ttPu6xuy3Fb7eFQh/qtyWh3Veld16GwYKZa5X4D4pHU3wd+sAdOorGnha
         O2yfqHvLekGqH3qFNSuUOqjSCEaHP7txnoDOY9earj8fhDFdjAobvH1lYM+Nw5rmZcJ0
         /JI5reDTRMd8awS+OyKJT9Zl5Q+ytsILiol9uOoGHfdOK/hao1D9CHe/eqoqHzfoDryI
         tubousLvvsR6pbaQO5fh2nrWICEPR6lchhkPRXkgYQjNbYBrv1aYGvvfUCikwMO5yky8
         DaZvzW5UuOSwxoxZjURKhNOuLssf1EzGD9uqvw1sdJ8O++hk+gkwv3yQcI+POKcYWDL7
         Ilbw==
X-Forwarded-Encrypted: i=1; AJvYcCWClyp7ZaIjj/dXTzKHsNg5QhzLs0tWGA55THw4+O2pwrEgt/msvjKYZXloXvf4R7zPkdwHxkDB9g0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3f03pAfPgfdpyaueoXfZcM/0o508kKH7zE3xKn5POU3wkkTK9
	qiWZDF4gCsHqZNIcx6r+urED9g5gLE2+xVZkf4ccmMpLHhGDNHWaOLFwrmv4LPoqhfU=
X-Gm-Gg: ASbGnct/hCoRp/uvfR0AhqwytFgcO2uSeMFJ3cKBLK9EOr13nu3how8EWFAMFfRUwus
	ST1r1PCXmVsiwpgNU+muzOIaVyaUlgqq7nSJy6twWR7BEsFfV6F6u4ieKbpCFqAMwFcFwMskccD
	SPpP/A50XXXRN661Z1xJ8n5Xdj9QRlYZuPXebbO3PJgue1NEQP7ABlMwbKwpJZaEm5cBru0j/sR
	s1FqlBKIeXbnty4QogKmWwNZwW2gijcRFPj1hDaNwiACEO1+mnAaP0no/VGn78fMbglc11gmPZd
	L+eq7nfH33P9P36PXJRpOc9fDQ86nm73AvopXEQqH//2Fq64Jg8skfAGpd8pib7kzfDdvWRWWuj
	cdJ+iibn4SCbArm/YqBVH6m3xS82RcAjG3xYp9KHYSbJMwrV35KfYrYQLj1M+y07Ee0nue5ARL8
	BWLQC/ALrjwuPx2SlzCAn2ODQQFUlRNpoTJWIeh40eBWBN
X-Google-Smtp-Source: AGHT+IEIuA1a0U+DSri815ZZ3pPACK0SZSprIlRF0tiB6pWK82jvIREpF1jokiYVAaYpjVu1xzff/g==
X-Received: by 2002:a05:6402:2685:b0:607:6619:1092 with SMTP id 4fb4d7f45d1cf-614f1bd9142mr858843a12.13.1753428281856;
        Fri, 25 Jul 2025 00:24:41 -0700 (PDT)
Message-ID: <5b63cc6a-f7d2-4b62-9ddf-c1d806ede829@suse.com>
Date: Fri, 25 Jul 2025 09:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] tools/xenstored: Use priv_domid for manual nodes
 and permission
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-10-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-10-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fLrCFouA4gaNeIswn7y2ERpF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fLrCFouA4gaNeIswn7y2ERpF
Content-Type: multipart/mixed; boundary="------------0J7zeR8LP3m0xAm0dxrBdbnD";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <5b63cc6a-f7d2-4b62-9ddf-c1d806ede829@suse.com>
Subject: Re: [PATCH v4 09/12] tools/xenstored: Use priv_domid for manual nodes
 and permission
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-10-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-10-jason.andryuk@amd.com>

--------------0J7zeR8LP3m0xAm0dxrBdbnD
Content-Type: multipart/mixed; boundary="------------quaS0iV1TLi48fhX0rqVBfa7"

--------------quaS0iV1TLi48fhX0rqVBfa7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVzdWFsbHksIHBy
aXZfZG9taWQgPT0gZG9tMF9kb21pZCA9PSAwLCBhbmQgdGhhdCBpcyB3aGF0IGlzIGV4cGVj
dGVkLg0KPiBJZiB3ZSByZW5hbWUgcy9kb20wX2RvbWlkL3N0b3JlX2RvbWlkLywgaXQgc2Vl
bXMgbW9yZSBsaWtlbHkgd2Ugd2FudCB0bw0KPiBhY3R1YWxseSBoYXZlIHRoZSBwcml2X2Rv
bWlkIGFzIHRoZSBvd25lci4NCg0KWWVzLCBJIGFncmVlLg0KDQo+IA0KPiBUaGF0IGxlYWRz
IHRvIGZvbGxvdyBvbiBjaGFuZ2VzIHRvIGVuc3VyZSB0aGF0IHRoZSBwcml2X2RvbWlkIGlz
IGNyZWF0ZWQNCj4gZmlyc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVr
IDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IC0tLQ0KPiBXaWxsIHRoaXMgYmxvdyB1cCBp
ZiBwcml2X2RvbWlkIGRvZXNuJ3QgZXhpc3Q/DQoNClRoYXQgd29uJ3QgYmUgYSBwcm9ibGVt
LiBUaGUgcHJvYmxlbWF0aWMgY2FzZSB3aWxsIGJlIHdoZW4gcHJpdl9kb21pZCBpcw0KbmV2
ZXIgY2hhbmdlZCBkdWUgdG8gbm8gZG9hbWluIGhhdmluZyB0aGUgQ09OVFJPTCBjYXAsIGFu
ZCBzb21lIHJhbmRvbQ0Kb3RoZXIgZG9tVSBoYXBwZW5zIHRvIGhhdmUgZG9taWQgMC4NCg0K
U28gbWF5YmUgcHJpdl9kb21pZCBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgc3RhdGljYWxseSB0
byBlLmcuIERPTUlEX0lETEUsDQphcyB3aXRoIHlvdXIgaW5pdF9kb21haW5zKCkgbG9vcCBh
ICJub3JtYWwiIGRvbTAgd2lsbCBhbHdheXMgaGF2ZSB0aGUNCkNPTlRST0wgY2FwIGFuZCB0
aHVzIHdpbGwgcmVzdWx0IGluIHByaXZfZG9taWQgYmVpbmcgc2V0Lg0KDQpTYW1lIGFwcGxp
ZXMgcHJvYmFibHkgdG8gc3RvcmVfZG9taWQsIGJ1dCB0aGF0IHNob3VsZCBiZSBzZXQgdG8g
cHJpdl9kb21pZA0KYWZ0ZXIgaW5pdF9kb21haW5zKCkgaW4gY2FzZSBubyBkb21haW4gaGFk
IHRoZSBYRU5TVE9SRSBjYXAuDQoNCklmIGJvdGggYXJlbid0IGRldGVjdGVkIGl0IHNob3Vs
ZCBiZSBmaW5lIHRvIGJhaWwgb3V0IGVhcmx5Lg0KDQo+IA0KPiBNYXliZSBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8ganVzdCBjcmVhdGUgdGhlc2UgYXMgc3RvcmVfZG9taWQuDQoNCk5vLCBy
ZWFzb25pbmcgc2VlIGFib3ZlLiBBbmQgeGVuc3RvcmUtc3R1YmRvbSBhY2Nlc3NlcyB0byBY
ZW5zdG9yZSBub2Rlcw0KdmlhIHRoZSAibm9ybWFsIiBpbnRlcmZhY2VzIHNob3VsZG4ndCBu
ZWVkIGFueSBzcGVjaWFsIHByaXZpbGVnZXMuDQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------quaS0iV1TLi48fhX0rqVBfa7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------quaS0iV1TLi48fhX0rqVBfa7--

--------------0J7zeR8LP3m0xAm0dxrBdbnD--

--------------fLrCFouA4gaNeIswn7y2ERpF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDMTgFAwAAAAAACgkQsN6d1ii/Ey9B
/wf+LH2MSVoHfW/ydugRBuZiDRMzivWlJEQhdqHWkyXPD4oK5yL1nhbs6ie3ZG7rttyRRzZ2IQSi
7IIpg7yuKTkiCAciJS9zXLvpN1PBovhwLUDb8DyLxBZpo1SKMrKO5UBLky2C9SBUdullx7+04Fi2
hGLmQ+zrVEtcKr+sGVJ8v7ZwB9k/ZLt6OA+bN6yOEMD9eF3mYoogDCB1oaMTmctROlkaUbQjvbOA
bn7GeCBEaq4c4whVXCB5jwsn/eTjgXsy0zPgYq1jwjlTae9WOR/fNh5MLbIw+5EmBklKYvcOGUWs
ah9uxukcjMoxB2a5ETwRFXOWXK0M1HQCOYuVSY9jhQ==
=ZBuk
-----END PGP SIGNATURE-----

--------------fLrCFouA4gaNeIswn7y2ERpF--

