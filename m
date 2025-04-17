Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D6A914CD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956951.1350172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JPr-0002VP-Mh; Thu, 17 Apr 2025 07:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956951.1350172; Thu, 17 Apr 2025 07:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JPr-0002TK-JB; Thu, 17 Apr 2025 07:12:07 +0000
Received: by outflank-mailman (input) for mailman id 956951;
 Thu, 17 Apr 2025 07:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VG4i=XD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u5JPp-0002TA-Pz
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:12:05 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43cc9379-1b5b-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 09:12:04 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac73723b2d5so78452466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 00:12:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36ee54d8fsm9692478a12.12.2025.04.17.00.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 00:12:03 -0700 (PDT)
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
X-Inumbo-ID: 43cc9379-1b5b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744873924; x=1745478724; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=50nDBr7HaO/nY8PAFZfWpFIIsI4FE6ZxFeiR9zseHMo=;
        b=XNXXecvHPzc9F8rZ6n3reCQmFxx2ONjGPSqmagCRCZZKzQp6JQESbugYBGcYITjOHu
         rIFWyO0gPcJqaTQ9duZrEevGl3mbowAYRpPckhpGnwCCMgj68C+aWzGO0nG+vFUYTh7h
         a3UPzcNSCfjjkbCAJVn+m1rwYtIjeGcLHGQMVmlIYujs34hTgoo8DlYPuc3x/I0qJ0hL
         xUvsZQgG6b4+QuqfabKRCTdJg12e4eBEjoWok2jDZD38IMuRqQsbiMbgo8e641mIq5zy
         JOUngpaE1IUHs3UYlYn9h/yMn2VUI8swHEuiAp0faVyAL9Nxg3n42x2NqWj5N+j0cROZ
         TiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873924; x=1745478724;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50nDBr7HaO/nY8PAFZfWpFIIsI4FE6ZxFeiR9zseHMo=;
        b=erzFoQAVt+c3qGb4hq/ZuUQbJhxz7PC8yeWFHxUKhlUDYyvT/+/NkTijUiZVzztFni
         /2iJIshJ/02MFm3RAFMIa/SM8UduD3UNQLbkcL8MSW9I7S4O00A4+hO72NQirCE1k+UN
         CJw00roqCSB/hI0mCG6cyE8fNE4QHLb6k94xOEd+ylrumk2+MMIU5nC+sr2uqrmfN1af
         3zmeEdXvo87PNztecDosLP9ACSA1sV3Psmv8jhz46doNhRDp6H3Yxn2wJ2RagBIuFB7I
         s3FytUznETB8QiPIpPgqBfD15bSF7PauxbfuqVAcFoWFwnBRgMVEgz4uPVnSgO+VpTkE
         wIbg==
X-Forwarded-Encrypted: i=1; AJvYcCVUijPfeuriIO1Z/lX5WAGIlBaWSBUpVu2vNDD5jPULxBvr5Iyxc2NFmu8BQDEtsy5kmQIxbr2B1dM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywafe9S5lj6KcjoDm/0TeEsXKZQLA5gs3qTnAXuhCGCmfAZtx1k
	OKxDuJU31nF9KslYh46btUC3cKTEeis8jyWqaAdE5U8xsAG1m6b3KHVS69GFoSQ=
X-Gm-Gg: ASbGncu6oH+zlrOXDu5jP6JwdocTLJ6WvsPI7cLFAuhzElyXga8sqMdSkG0IV4KGiKk
	7ueQSvY3d+hGK9FH3Ff77incR0YVGiA78mpzPL4WK5yaDQs/409M10uSGbrWKa9i3JLiLFTtDor
	v9Ri1v90urkPDSK0j8vdkICx/z9/ZlkAMZb+f/YcOgdrbgGZkhzAI6j5mLx05EEMwPKpoOVtSVr
	w3elCeZbktGsSXDhzlnINypw5gbIEtTu9d/vdO5xKKkGrLEQ/0SR7M8L6X4SRmA+Y4B6x4lL/qP
	KnvtfPS1lN6ez8SXQDa5JEn8cYGIp75gaxOtZDoRfZUmfSorxEnn1a7OMh8oPRjC9NraBrCRiWI
	/k5g9jreY8k2Hw/Gr0YpxtzjSeuZKQmKCOZofcWGAdDjlbz/j4wmiSO5z1+7hk4msw28bCADwHR
	9x
X-Google-Smtp-Source: AGHT+IGN17Jla2vA+Rc2I0KCBT5Gabe2J463zV01EJ+NRwJL4xDEPQ+kEyFWGVBbFKYG3sPp/od4mw==
X-Received: by 2002:a17:907:608f:b0:ac3:8516:9cf2 with SMTP id a640c23a62f3a-acb42c2fcacmr391294266b.55.1744873923529;
        Thu, 17 Apr 2025 00:12:03 -0700 (PDT)
Message-ID: <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
Date: Thu, 17 Apr 2025 09:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
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
In-Reply-To: <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d0C2m0JpY0HKG0p0HCAJyozK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d0C2m0JpY0HKG0p0HCAJyozK
Content-Type: multipart/mixed; boundary="------------RSZrBREXB0vBHBFnA0obN3v4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Message-ID: <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
In-Reply-To: <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>

--------------RSZrBREXB0vBHBFnA0obN3v4
Content-Type: multipart/mixed; boundary="------------WPzaECcOaD250uqrDoIyhJN6"

--------------WPzaECcOaD250uqrDoIyhJN6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDQuMjUgMDk6MDAsIEFsZXhleSB3cm90ZToNCj4gDQo+IE9uIDE3LjA0LjIwMjUg
MDM6NTgsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPj4gT24gTW9uLCAxNCBBcHIgMjAyNSAx
ODozNDowMSArMDAwMCBBbGV4ZXkgTmVwb21ueWFzaGloIHdyb3RlOg0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBnZXRfcGFnZShwZGF0YSk7DQo+PiBQbGVhc2Ugbm90aWNlIHRoaXMgZ2V0
X3BhZ2UoKSBoZXJlLg0KPj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeGRwZiA9IHhkcF9j
b252ZXJ0X2J1ZmZfdG9fZnJhbWUoeGRwKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHVu
bGlrZWx5KCF4ZHBmKSkgew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNlX3hk
cF9leGNlcHRpb24ocXVldWUtPmluZm8tPm5ldGRldiwgcHJvZywgYWN0KTsNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPiBE
byB5b3UgbWVhbiB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciB0byBtb3ZlIHRoZSBnZXRfcGFn
ZShwZGF0YSkgY2FsbCBsb3dlciwNCj4gYWZ0ZXIgY2hlY2tpbmcgZm9yIE5VTEwgaW4geGRw
Ziwgc28gdGhhdCB0aGUgcmVmZXJlbmNlIGNvdW50IGlzIG9ubHkgaW5jcmVhc2VkDQo+IGFm
dGVyIGEgc3VjY2Vzc2Z1bCBjb252ZXJzaW9uPw0KDQpJIHRoaW5rIHRoZSBlcnJvciBoYW5k
bGluZyBoZXJlIGlzIGdlbmVyYWxseSBicm9rZW4gKG9yIGF0IGxlYXN0IHZlcnkNCnF1ZXN0
aW9uYWJsZSkuDQoNCkkgc3VzcGVjdCB0aGF0IGluIGNhc2Ugb2YgYXQgbGVhc3Qgc29tZSBl
cnJvcnMgdGhlIGdldF9wYWdlKCkgaXMgbGVha2luZw0KZXZlbiB3aXRob3V0IHRoaXMgbmV3
IHBhdGNoLg0KDQpJbiBjYXNlIEknbSB3cm9uZyBhIGNvbW1lbnQgcmVhc29uaW5nIHdoeSB0
aGVyZSBpcyBubyBsZWFrIHNob3VsZCBiZQ0KYWRkZWQuDQoNCg0KSnVlcmdlbg0K
--------------WPzaECcOaD250uqrDoIyhJN6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WPzaECcOaD250uqrDoIyhJN6--

--------------RSZrBREXB0vBHBFnA0obN3v4--

--------------d0C2m0JpY0HKG0p0HCAJyozK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgAqcIFAwAAAAAACgkQsN6d1ii/Ey9s
zgf+LywK5tRw1pt3A75AZkpDPjXyAy+HTSV/CVvkluaNPsqNM5Yg2+iYZZZKp+C2omR4jCFUNDUn
EU5EnIclpZzA3Ox0JZrqjlrjknY4cD8QKits78CTlfr5aHrB7qPj3yRgvh/XxXS3Vz5v97yc/2YW
e4p+YULttX7frz3a9ygzgz6TbtLLLw19HxCgTGvA2upI43v+abbnowNz/NOagJQ6WD4WmPpUBCRS
4Yu1Z/NjKO+IbvAuX01hVdNedc+pN2lztOrK6GkjDE6HUAgyNqdQTEZrhOl9N/tysDDOEdkUxexg
XsVZt0ZcfKPyAIhgRW3SVID/G2LiUiH7KO5QEmr2/w==
=uCI0
-----END PGP SIGNATURE-----

--------------d0C2m0JpY0HKG0p0HCAJyozK--

