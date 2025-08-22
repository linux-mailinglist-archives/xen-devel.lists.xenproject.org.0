Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643DEB31E7D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 17:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090323.1447635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTfu-0000FZ-Cu; Fri, 22 Aug 2025 15:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090323.1447635; Fri, 22 Aug 2025 15:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upTfu-0000DV-AJ; Fri, 22 Aug 2025 15:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1090323;
 Fri, 22 Aug 2025 15:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1upTfs-0000DP-So
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 15:27:29 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7faf4753-7f6c-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 17:27:22 +0200 (CEST)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso789483a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 08:27:22 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3172ef02sm70612a12.39.2025.08.22.08.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 08:27:21 -0700 (PDT)
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
X-Inumbo-ID: 7faf4753-7f6c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755876442; x=1756481242; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hq11fDoaP+ZGkHm5tsQSVdohfEvuIXTVot9Y7gJQV98=;
        b=J8kZV68VAmB/6SqsxibUmdsKzLdtiKaxMwxlXXC1/OA4TxzSfDzgImKdjByd3sW3ME
         dpjLItf0hWkeW9NUag6kref/H0It7tFZxL99E2oHPeP5tOb8CfV2jyo4sHW4oo7fp36U
         5UrE8PuKt1ym9PpW6Pv1mIpVpjg78a3Ds1ViXX5dfywixY5EZIzB1jEgTmOWXsE5CD9k
         M5Zey/mZzx/dO2P4thH9TtpU1782qZUpp/y7Oze+h9w79oWXYHH1cKQjLKVTWdAw9VAk
         3RHgvHfVxtFdvSVLJdJBsn9tvnCUby1lDrhySUNCjfQUVGcQidQI81LImP6MfYblr52g
         O+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755876442; x=1756481242;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq11fDoaP+ZGkHm5tsQSVdohfEvuIXTVot9Y7gJQV98=;
        b=coGrQi4sKmyRkEi/FPAJ4cCOuxtGSH/fWotqVlCmHYSBGsysv2ghzCvNa++ZefJP1u
         /htbMdT4/HpKoWkvN7o2jbt7swBs3AdnvDt5jpZPgDn2EIcjxrp+bHTgqRbmO+/zmSst
         x2tVrqOKeIzVobpfervkvHIdIbAMdPuLM2nVp3pER/jF++dEcQImA3A0Vx3neOt7U5us
         3kdOOk2rj2smSN/mkLQmDTY3modOKYgmOK3WiTIumc1fM4KUF3uy56uJhNRJEWsmVAir
         +5Q/Be+0neL/Va3ih0mvo0qcLpWN+J7dhzCtYQYE9wxFk3ScPxdxo6PWl8Hnevniwvcu
         KuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoVruh59cRVB30Wa1Lw4LoD2XKLeORKMGsUXzla6STmvDxglj5/zpUX8noIFYV7mG2adCS6/jmxNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDVOA0k91QXcWKNuO947lw/nBvK+Ayc3d16W8ROn3Pcjx5cDo6
	YNPJQ24yn77TqolWPmK7DMFyV+0dCHz1LR0mPAGbw0ROAEY5qF+opI28IYW9QOFlP52Z77sUTMj
	iQkw4jgsd9A==
X-Gm-Gg: ASbGncuL2KyakQwcZ1ridbv5hGUFfG834pFx3Wl7c5lOXHXeI0Uz10uL4iUTtM+kOJV
	pzsGW/S2hEqCcvii5ovHphccH1YC4v1oYzSIvXtXN1619rSB2sWj3LnLck3iNR1v4YxAkN8fit+
	Oxs79thur5xYUQjr5UuHuJGhuBUUNMf3M3h960NTVcXmREFDQ682FjIHIjI2nnJzOEGMns+Z5nX
	hJYh5rArlfTwBshz7idWrE8JzwtuB0cSD0rG9NzyvG/fAptKjMDqyA0Oz85EcVexRRL+4AuGahB
	pP9v9yu7cinEDyh5rQ3+1MkR9Kv1hz+Us+Q5VHnTAE0P6B+6D1YK0VydTLDxh0Td/zeTWlISeQI
	nQmHFTHyAK2vhDQjcv7GClVxSdG7HZ07qBKY05THoxJyk+iug/r50VmUalPvEJoG5KhsE0MbL1J
	CGGapSeWeOqNLoAeydnpNglQTuvr+Hgx9GpChyqMjcD2kz74n3BXZknREvnw==
X-Google-Smtp-Source: AGHT+IFcNynsMq4JhxIQkMtvKfuxCcmUa7TIQYSFBqMFgZAGs3NMI5yDArivmzFXVTEfm+uv20rm/g==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id 4fb4d7f45d1cf-61c1b453182mr3058169a12.6.1755876441637;
        Fri, 22 Aug 2025 08:27:21 -0700 (PDT)
Message-ID: <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
Date: Fri, 22 Aug 2025 17:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl>
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
In-Reply-To: <aKiBwEsogK420kwo@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CZ01TGMC3WuCaE2IVYmdW09F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CZ01TGMC3WuCaE2IVYmdW09F
Content-Type: multipart/mixed; boundary="------------6ECTXRhl4o2T2sNieLvXwlU0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl>
In-Reply-To: <aKiBwEsogK420kwo@mail-itl>

--------------6ECTXRhl4o2T2sNieLvXwlU0
Content-Type: multipart/mixed; boundary="------------CU0YtSF0cMOmiBmW2MJ0McbB"

--------------CU0YtSF0cMOmiBmW2MJ0McbB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDguMjUgMTY6NDIsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMDQ6Mzk6MzNQTSArMDIwMCwgTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gV2hlbiBzdXNwZW5k
aW5nIGRvbVUgSSBnZXQgdGhlIGZvbGxvd2luZyBpc3N1ZToNCj4+DQo+PiAgICAgIEZyZWV6
aW5nIHVzZXIgc3BhY2UgcHJvY2Vzc2VzDQo+PiAgICAgIEZyZWV6aW5nIHVzZXIgc3BhY2Ug
cHJvY2Vzc2VzIGZhaWxlZCBhZnRlciAyMC4wMDQgc2Vjb25kcyAoMSB0YXNrcyByZWZ1c2lu
ZyB0byBmcmVlemUsIHdxX2J1c3k9MCk6DQo+PiAgICAgIHRhc2s6eGwgICAgICAgICAgICAg
IHN0YXRlOkQgc3RhY2s6MCAgICAgcGlkOjQ2NiAgIHRnaWQ6NDY2ICAgcHBpZDoxICAgICAg
dGFza19mbGFnczoweDQwMDA0MCBmbGFnczoweDAwMDA0MDA2DQo+PiAgICAgIENhbGwgVHJh
Y2U6DQo+PiAgICAgICA8VEFTSz4NCj4+ICAgICAgIF9fc2NoZWR1bGUrMHgyZjMvMHg3ODAN
Cj4+ICAgICAgIHNjaGVkdWxlKzB4MjcvMHg4MA0KPj4gICAgICAgc2NoZWR1bGVfcHJlZW1w
dF9kaXNhYmxlZCsweDE1LzB4MzANCj4+ICAgICAgIF9fbXV0ZXhfbG9jay5jb25zdHByb3Au
MCsweDQ5Zi8weDg4MA0KPj4gICAgICAgdW5yZWdpc3Rlcl94ZW5idXNfd2F0Y2grMHgyMTYv
MHgyMzANCj4+ICAgICAgIHhlbmJ1c193cml0ZV93YXRjaCsweGI5LzB4MjIwDQo+PiAgICAg
ICB4ZW5idXNfZmlsZV93cml0ZSsweDEzMS8weDFiMA0KPj4gICAgICAgdmZzX3dyaXRldisw
eDI2Yy8weDNkMA0KPj4gICAgICAgPyBkb193cml0ZXYrMHhlYi8weDExMA0KPj4gICAgICAg
ZG9fd3JpdGV2KzB4ZWIvMHgxMTANCj4+ICAgICAgIGRvX3N5c2NhbGxfNjQrMHg4NC8weDJj
MA0KPj4gICAgICAgPyBkb19zeXNjYWxsXzY0KzB4MjAwLzB4MmMwDQo+PiAgICAgICA/IGdl
bmVyaWNfaGFuZGxlX2lycSsweDNmLzB4NjANCj4+ICAgICAgID8gc3lzY2FsbF9leGl0X3dv
cmsrMHgxMDgvMHgxNDANCj4+ICAgICAgID8gZG9fc3lzY2FsbF82NCsweDIwMC8weDJjMA0K
Pj4gICAgICAgPyBfX2lycV9leGl0X3JjdSsweDRjLzB4ZTANCj4+ICAgICAgIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UNCj4+ICAgICAgUklQOiAwMDMzOjB4
NzliNjE4MTM4NjQyDQo+PiAgICAgIFJTUDogMDAyYjowMDAwN2ZmZjlhMTkyZmM4IEVGTEFH
UzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMTQNCj4+ICAgICAgUkFYOiBm
ZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAwMjRmZDQ5MCBSQ1g6IDAwMDA3OWI2MTgx
Mzg2NDINCj4+ICAgICAgUkRYOiAwMDAwMDAwMDAwMDAwMDAzIFJTSTogMDAwMDdmZmY5YTE5
MzEyMCBSREk6IDAwMDAwMDAwMDAwMDAwMTQNCj4+ICAgICAgUkJQOiAwMDAwN2ZmZjlhMTkz
MDAwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAg
ICAgUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAw
MDAwMDAwMDAwMDAwMTQNCj4+ICAgICAgUjEzOiAwMDAwN2ZmZjlhMTkzMTIwIFIxNDogMDAw
MDAwMDAwMDAwMDAwMyBSMTU6IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgICAgIDwvVEFTSz4N
Cj4+ICAgICAgT09NIGtpbGxlciBlbmFibGVkLg0KPj4gICAgICBSZXN0YXJ0aW5nIHRhc2tz
OiBTdGFydGluZw0KPj4gICAgICBSZXN0YXJ0aW5nIHRhc2tzOiBEb25lDQo+PiAgICAgIHhl
bjptYW5hZ2U6IGRvX3N1c3BlbmQ6IGZyZWV6ZSBwcm9jZXNzZXMgZmFpbGVkIC0xNg0KPj4N
Cj4+IFRoZSBwcm9jZXNzIGluIHF1ZXN0aW9uIGlzIGB4bCBkZXZkYCBkYWVtb24uIEl0J3Mg
YSBkb21VIHNlcnZpbmcgYQ0KPj4geGVudmlmIGJhY2tlbmQuDQo+Pg0KPj4gSSBub3RpY2Vk
IGl0IG9uIDYuMTYuMSwgYnV0IGxvb2tpbmcgYXQgZWFybGllciB0ZXN0IGxvZ3MgSSBzZWUg
aXQgd2l0aA0KPj4gNi4xNi1yYzYgYWxyZWFkeSAoYnV0IGludGVyZXN0aW5nbHksIG5vdCA2
LjE2LXJjMiB5ZXQ/IGZlZWxzIHdlaXJkIGdpdmVuDQo+PiBzZWVtaW5nbHkgbm8gcmVsZXZh
bnQgY2hhbmdlcyBiZXR3ZWVuIHJjMiBhbmQgcmM2KS4NCj4gDQo+IEkgZm9yZ290IHRvIGlu
Y2x1ZGUgbGluayBmb3IgKGEgbGl0dGxlKSBtb3JlIGRldGFpbHM6DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9RdWJlc09TL3F1YmVzLWxpbnV4LWtlcm5lbC9wdWxsLzExNTcNCj4gDQo+IEVz
cGVjaWFsbHksIHRoZXJlIGlzIGFub3RoZXIgY2FsbCB0cmFjZSB3aXRoIHBhbmljX29uX3dh
cm4gZW5hYmxlZCAtDQo+IHNsaWdodGx5IGRpZmZlcmVudCwgYnV0IGxvb2tzIHJlbGF0ZWQu
DQo+IA0KDQpJJ20gcHJldHR5IHN1cmUgdGhlIFBWIHZhcmlhbnQgZm9yIHN1c3BlbmRpbmcg
aXMganVzdCB3cm9uZzogaXQgaXMgY2FsbGluZw0KZHBtX3N1c3BlbmRfc3RhcnQoKSBmcm9t
IGRvX3N1c3BlbmQoKSB3aXRob3V0IHRha2luZyB0aGUgcmVxdWlyZWQNCnN5c3RlbV90cmFu
c2l0aW9uX211dGV4LCByZXN1bHRpbmcgaW4gdGhlIFdBUk4oKSBpbiBwbV9yZXN0cmljdF9n
ZnBfbWFzaygpLg0KDQpJdCBtaWdodCBiZSBhcyBlYXN5IGFzIGp1c3QgYWRkaW5nIHRoZSBt
dXRleCgpIGNhbGwgdG8gZG9fc3VzcGVuZCgpLCBidXQgSSdtDQpyZWFsbHkgbm90IHN1cmUg
dGhhdCB3aWxsIGJlIGEgcHJvcGVyIGZpeC4NCg0KDQpKdWVyZ2VuDQo=
--------------CU0YtSF0cMOmiBmW2MJ0McbB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CU0YtSF0cMOmiBmW2MJ0McbB--

--------------6ECTXRhl4o2T2sNieLvXwlU0--

--------------CZ01TGMC3WuCaE2IVYmdW09F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiojFgFAwAAAAAACgkQsN6d1ii/Ey+g
UQf/ZF1mLCUtBfsj2zMidGd4qZIRW2hH4ZTHtTXw7r9rdYeUGpMuyDmdb6A2y/zJZWtCwTW8ZKsh
tk27ftZHcSYbhoy38x+uAPC2DUvu8UPfk9x7qWOaEU8rsVScYLJMU9o9p7ep82dNWTR9hV0CgIV3
4rPvy2Uffz5Y67k1aMfLY2nC1+xvDMay0wHRul29HBMyxIlNz/6hrToBDqtgXAXnfKO8J9tLxoHF
WwTts9nRl/sPnOOfK4G+Lhk3yuT5lQOilA5uvnlWOb1kwWe69uzLaipQsVmJjMTTOy3lBK9NDG2D
PZmofGe4eDzxL1R213/fDj6UgCWl6W1ZtRafq+ipSQ==
=a4tu
-----END PGP SIGNATURE-----

--------------CZ01TGMC3WuCaE2IVYmdW09F--

