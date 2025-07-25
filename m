Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91876B1193C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057430.1425322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCvv-00010T-QW; Fri, 25 Jul 2025 07:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057430.1425322; Fri, 25 Jul 2025 07:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCvv-0000y6-NV; Fri, 25 Jul 2025 07:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1057430;
 Fri, 25 Jul 2025 07:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufCvu-0000xu-AJ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:33:34 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab44d252-6929-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 09:33:33 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so3207536a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:33:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47ff42cc4sm221180866b.139.2025.07.25.00.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:33:32 -0700 (PDT)
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
X-Inumbo-ID: ab44d252-6929-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753428813; x=1754033613; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lyXy3dcvLjEeTeI7ng7T9e+um9u+455N8o497ABjXrA=;
        b=EZHTANqF/EUkkQBoDbo7OKEETyM8qr6NzYR+bK4o9KQtoJgeH8BcYsVLGKgLpWvuDW
         uFu6iaxkBawMtH+5E27zuRzmwJ8VlI+HLQI3+xzXx1EeckJ2A7iuSN/u9IpLVbUSNGKX
         YWjPKZnJ0/9SjvUpXaArRUdGJMmEkbKtaSxOUmCXhurl5T4eR7fDT4+tIImFksX3D60l
         JX3FSPDi7+Ty+mKK9ZG03+0cEfMqTbyGFrl/ns93danCvrbkQvFl5Xlo69tof9WcpBnd
         2ZzYusHKs16x+OsX4JzT2mzrKaX2BuKkxAK4gaekFA688t7fmTdS2I1GBcHNxtUHSoRF
         irSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753428813; x=1754033613;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyXy3dcvLjEeTeI7ng7T9e+um9u+455N8o497ABjXrA=;
        b=jPq4EUMUhmBUX9YejQGsSfuSyGn/NE3GGLeosGJ/eoTLmq49u52GxUnuvE0rt7QmNc
         IyfTnOZu/0JgU84IYAD8b1jAIIWSub5xIkI9fqlfxF8YlWSTDaVtoS44Yj7d9goA7fbN
         4F8EoWH6rQG/l9AdK2pChaJ2P6fFxN31rtr4tybZZSo6PSLjQxoxM4Swf1/aDeLch4V3
         sSJ4YUtpOFiwLG9D9cO7alRjqVtSOnwSslaOJfYbk0LFmxRPlSjwB9zdAAFKNQLdrbvl
         JXrDi9COz+DHQBNY2N8oyaRDMCZit930vBk4VoXLhcMbSLw4sPshxmczYXN0EH9xVrRA
         ZSPg==
X-Forwarded-Encrypted: i=1; AJvYcCVgVSBQqtkCELPAU6kPrVDctPld1XbNTLbXwDc7gv/A/SomufhCH6SdZ1v1x+JoPUFHNWC6JKTLtSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIqGJJYdmyyHz6ZJhArLfvZr5RT85qN9clNuywxVUXU+gvv/P7
	b3BhKfN72XMsj+p1ruDCzeZy43Ly/iZjEmyiDISCMFq6AWvuCD12dsyGcx2cgCfWSdU=
X-Gm-Gg: ASbGnctwdgQopYmflPBMicC9iGDJECN9o2mc+ufo6sGg1A6DCQorAnS0Lovmn7zd7Dx
	67dlf97M9tmQ5JFBlZeq2ojE4uweddxepBkujnqktKIOB8lvaplZ+xUXqD37nviClqLkv3JkXYj
	h/CgEJQpkIo7EkNgwDMDqwWMITwVV2GBLKSRUR4DW0ofNwcporohdlvyoMKE5z93jqmGCDgQJTK
	+UJllQxAO2DugqIvUjqMPijV4r+qLjEr3acpbKN3YROqbV1pqfxMcbQe0i4y75adDcDF1puoucy
	J+9bDdrb2uhluswX1KsJa7AnOkxZixJVMtxBQJot09M7d3EwMQgartiXRycEYZNcp/lQf5SXc+K
	3Bs9f9uOM7cQtzm8Tltm4nM+9e5l+/jrLtX6Uf21hAulKhcb2tBpKenCQg3g68v1Z/W7btO6Eaq
	VT+h9ycrPEIlJzvTOqJKaz85IejYqqa/rxXQC2vvsevUeR5WrVCubtzTo=
X-Google-Smtp-Source: AGHT+IGjBEBiuXLYf93jWC13SEqZ87k/EqsKjgT8Sq7duZgVC1Nj2Nnu9QV73HMYUUqGGfQa37D7WQ==
X-Received: by 2002:a17:906:99c4:b0:adb:2bee:53c9 with SMTP id a640c23a62f3a-af61b004222mr130232666b.3.1753428813219;
        Fri, 25 Jul 2025 00:33:33 -0700 (PDT)
Message-ID: <a151644f-bd37-44ce-adb6-eced5036617b@suse.com>
Date: Fri, 25 Jul 2025 09:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] tools/xenstored: Remove hardcoded implicit path
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-13-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-13-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NtNSoLWCfkSxo9TTgREssK8s"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NtNSoLWCfkSxo9TTgREssK8s
Content-Type: multipart/mixed; boundary="------------j7UuoSgIdUeDyVki76Q0WoZi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <a151644f-bd37-44ce-adb6-eced5036617b@suse.com>
Subject: Re: [PATCH v4 12/12] tools/xenstored: Remove hardcoded implicit path
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-13-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-13-jason.andryuk@amd.com>

--------------j7UuoSgIdUeDyVki76Q0WoZi
Content-Type: multipart/mixed; boundary="------------FPSvc9tmOo4aCzVCM4Cr3FJd"

--------------FPSvc9tmOo4aCzVCM4Cr3FJd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVwZGF0ZSBnZXRf
aW1wbGljaXRfcGF0aCB0byByZXR1cm4gdGhlIGNvcnJlY3QgdmFsdWUgZm9yIGEgbm9uLWRv
bTANCj4geGVuc3RvcmVkIGRvbWFpbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFu
ZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------FPSvc9tmOo4aCzVCM4Cr3FJd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------FPSvc9tmOo4aCzVCM4Cr3FJd--

--------------j7UuoSgIdUeDyVki76Q0WoZi--

--------------NtNSoLWCfkSxo9TTgREssK8s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDM0wFAwAAAAAACgkQsN6d1ii/Ey9S
9wf+NuMSx39ijQljXSe8Lx+fQ7Rl/Anrv/fVWibtdfDfH9qFYigc3tpOxnoQi4LQ8uIKoPHq0n6/
DxIRMtKzJSx2OxoNctpyc4anfBtRn4lW76DSD63Q9t6aBqxEmyRaKzDlnuQTIGH56oR66vFHQ+Oa
IWpR01WbaVQiwgBn1chXJJRK0N6tc+LEM9khLg5oEvq+mY3HtYzvnNG8NMyOSlO0tahDMjPmfIZP
ojVT5EvwyWqzXqrR0fbme6e4MBww6Or+SDBYEs3EqiPwr2br9yiw7JEAhoWvS51mw+DOoK2Eue4M
EAjcnGxkTUVWIK/GQcb7c4DZtHm/Zly6979EHMqp+g==
=Q+Sd
-----END PGP SIGNATURE-----

--------------NtNSoLWCfkSxo9TTgREssK8s--

