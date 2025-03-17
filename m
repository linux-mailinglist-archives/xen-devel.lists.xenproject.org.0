Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9132FA6447C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 08:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916224.1321352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5MR-0001JJ-Nz; Mon, 17 Mar 2025 07:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916224.1321352; Mon, 17 Mar 2025 07:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5MR-0001GN-Km; Mon, 17 Mar 2025 07:58:11 +0000
Received: by outflank-mailman (input) for mailman id 916224;
 Mon, 17 Mar 2025 07:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tu5MQ-0001GF-1v
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 07:58:10 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90dffd16-0305-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 08:58:09 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so7274639a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 00:58:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a3e0a1sm628823666b.140.2025.03.17.00.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 00:58:08 -0700 (PDT)
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
X-Inumbo-ID: 90dffd16-0305-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742198288; x=1742803088; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jMjRARSCG8UyU2zAgd2aCIxivx4uG7AOe36kiChgXfw=;
        b=cJ/2KfmGHWD/dB8xInETcmJNJ2dIihq74bjf7TNFtZTDQplAgbCiTS6Yfd4wl0Goco
         v6nOXpmFJQk915Eb+G2HwBSQFAf/vxYFIVcuwwuq3EefKQGD8GXFsdENMuWdnexHnNoG
         31YFupT6nreQo5RIqtEpZzG5FU4naydJ4XNUfKI9weiN378LGE/Pg7q9mS6wcGmDjJDR
         gvDqB1O1ADAsAMpdCCfnplXwOTt5ZmRKN/TXTW0zO6VIAD9m75KeBwel+Qt5za62xSQT
         3Xz6CKPV9FaeM6dvIbOIEhaaupt3xxL9iCrd5aUss+rbUYqeL06yc7JWdBqUP7KalVyi
         Hhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742198288; x=1742803088;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMjRARSCG8UyU2zAgd2aCIxivx4uG7AOe36kiChgXfw=;
        b=UBdE6KTXzvQzquRSlcukYaoUqthKm9rqW/sBqj2e9diHsgdYiYBB2/zPBOQnpvWr1k
         Xr54wj6r4K3493/1xgoUF6ZkwVVbAyZN+VGbUL2KbqKwWV+xMw7rFNf6ogpwWxRArmu2
         w/+Oc9JgHmrwpkY/DnphqJ9CAEDSMidGIuVd3U6G93TmYWkzyLXgpaTKXlAHtUoXENI6
         ZZ3biyq+b000Bqea75RRaxl46hEhMM/g7l+gHaWtj1ZYI/TqY1HQTvKyf5tRy397ByzR
         DEzNvNo+CV/yv78vtdYPBSENlfzr6kWol6vEaBCZXSfmSeLoCMVq24WbeSslSa+EjY60
         v+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUSxOsijE45QvfIWgkjad/hA85PdNS/bFdZzjopzisYqLdsE7+LlmDclCFGiuLClisare9GOuaySus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEVrTMCBDCCHS13Bq1pSe82F0vBd+o6U/gMyTAmd2aLOUctpJ4
	Ti5R5zhjtZ5utIYZaofO3OHjQWoCLDr4pS8SmWz1zvouqabrfcaL56fLrmmyVEc=
X-Gm-Gg: ASbGnctsSiWP3c6T2TwcC+wFuP06S/SjyyjWVE26ThSgPv80X+Yyie90XA3dLcy3KWz
	FEQOzJXPUerWIAsdviZg3A8td7J8xSXlvlVgEGlec7IBIoR7Wz0tQ2pjTAN/95iwGNbCi/P7w0W
	Y6RCt1i/IISXL6bGcEtOcOW8tLB2w6mNB6MU3XJ/lta9WSVTD+DAJsRaA8aSuAHledrIVgN8hk6
	JC2Oj5Fj9Pw/b+V0wwwyCaJV5z1/9w8/Dip/6GrZWXErjbeWUXCkRYP9Q8CepO2U+jz7Ih438oK
	q5PJeQErHPzkk2LPaSGFosqC48pD9G1XCNzB6mHnz9Q4ZZwxb5aSzCa39Fl4p8q9OrVG4KfnCSb
	8lBfopOnsYPn8odLThnZjgmk/zlFtn8soUsgePvlszsk7iZCThL36ikitLrtiGDM4TlT7Zw==
X-Google-Smtp-Source: AGHT+IEI0+LJPnnOr2HYRlquEUi8p4idSmbxMHpOQ5tuuNr+LtTMx8L78pkQ4Bmg3xhrZW0GzPn//g==
X-Received: by 2002:a17:907:7296:b0:abf:749f:f719 with SMTP id a640c23a62f3a-ac33012838dmr1329069766b.7.1742198288357;
        Mon, 17 Mar 2025 00:58:08 -0700 (PDT)
Message-ID: <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
Date: Mon, 17 Mar 2025 08:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic when shutting down ARINC653 cpupool
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
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
In-Reply-To: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------El9mNQEGA2z1kYpmj0HMNg2q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------El9mNQEGA2z1kYpmj0HMNg2q
Content-Type: multipart/mixed; boundary="------------L6oPTpIYNQNPNidB2TH6N2x8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
Message-ID: <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
Subject: Re: Xen panic when shutting down ARINC653 cpupool
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>

--------------L6oPTpIYNQNPNidB2TH6N2x8
Content-Type: multipart/mixed; boundary="------------0L4d40CXcKjgw5m7kA5xHBSv"

--------------0L4d40CXcKjgw5m7kA5xHBSv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjUgMDY6MDcsIENob2ksIEFuZGVyc29uIHdyb3RlOg0KPiBJJ2QgbGlrZSB0
byByZXBvcnQgeGVuIHBhbmljIHdoZW4gc2h1dHRpbmcgZG93biBhbiBBUklOQzY1MyBkb21h
aW4gd2l0aCB0aGUgZm9sbG93aW5nIHNldHVwLg0KPiBOb3RlIHRoYXQgdGhpcyBpcyBvbmx5
IG9ic2VydmVkIHdoZW4gQ09ORklHX0RFQlVHIGlzIGVuYWJsZWQuDQo+IA0KPiBbVGVzdCBl
bnZpcm9ubWVudF0NCj4gWW9jdG8gcmVsZWFzZSA6IDUuMDUNCj4gWGVuIHJlbGVhc2UgOiA0
LjE5IChoYXNoID0gMDI2YzlmYTI5NzE2YjBmZjBmOGI3YzY4NzkwOGU3MWJhMjljZjIzOSkN
Cj4gVGFyZ2V0IG1hY2hpbmUgOiBRRU1VIEFSTTY0DQo+IE51bWJlciBvZiBwaHlzaWNhbCBD
UFVzIDogNA0KPiANCj4gW1hlbiBjb25maWddDQo+IENPTkZJR19ERUJVRyA9IHkNCj4gDQo+
IFtDUFUgcG9vbCBjb25maWd1cmF0aW9uIGZpbGVzXQ0KPiBjcHVwb29sX2FyaW5jMC5jZmcN
Cj4gLSBuYW1lPSAiUG9vbC1hcmluYzAiDQo+IC0gc2NoZWQ9ImFyaW5jNjUzIg0KPiAtIGNw
dXM9WyIyIl0NCj4gDQo+IFtEb21haW4gY29uZmlndXJhdGlvbiBmaWxlXQ0KPiBkb20xLmNm
Zw0KPiAtIHZjcHVzID0gMQ0KPiAtIHBvb2wgPSAiUG9vbC1hcmluYzAiDQo+IA0KPiAkIHhs
IGNwdXBvb2wtY3B1LXJlbW92ZSBQb29sLTAgMg0KPiAkIHhsIGNwdXBvb2wtY3JlYXRlIC1m
IGNwdXBvb2xfYXJpbmMwLmNmZw0KPiAkIHhsIGNyZWF0ZSBkb20xLmNmZw0KPiAkIGE2NTNf
c2NoZWQgLVAgUG9vbC1hcmluYzAgZG9tMToxMDANCj4gDQo+ICoqIFdhaXQgZm9yIERPTTEg
dG8gY29tcGxldGUgYm9vdC4qKg0KPiANCj4gJCB4bCBzaHV0ZG93biBkb20xDQo+IA0KPiBb
eGVuIGxvZ10NCj4gcm9vdEBib2VpbmctbGludXgtcmVmOn4jIHhsIHNodXRkb3duIGRvbTEN
Cj4gU2h1dHRpbmcgZG93biBkb21haW4gMQ0KPiByb290QGJvZWluZy1saW51eC1yZWY6fiMg
KFhFTikgQXNzZXJ0aW9uICchaW5faXJxKCkgJiYgKGxvY2FsX2lycV9pc19lbmFibGVkKCkg
fHwgbnVtX29ubGluZV9jcHVzKCkgPD0gMSknIGZhaWxlZCBhdCBjb21tb24veG1hbGxvY190
bHNmLmM6NzE0DQo+IChYRU4pIC0tLS1bIFhlbi00LjE5LjEtcHJlICBhcm02NCAgZGVidWc9
eSAgVGFpbnRlZDogSSAgICAgIF0tLS0tDQo+IChYRU4pIENQVTogICAgMg0KPiAoWEVOKSBQ
QzogICAgIDAwMDAwYTAwMDAyMmQyYjAgeGZyZWUrMHgxMzAvMHgxYTQNCj4gKFhFTikgTFI6
ICAgICAwMDAwMGEwMDAwMjJkMmE0DQo+IChYRU4pIFNQOiAgICAgMDAwMDgwMDBmZmY3N2I1
MA0KPiAoWEVOKSBDUFNSOiAgIDAwMDAwMDAwMjAwMDAyYzkgTU9ERTo2NC1iaXQgRUwyaCAo
SHlwZXJ2aXNvciwgaGFuZGxlcikNCj4gLi4uDQo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0K
PiAoWEVOKSAgICBbPDAwMDAwYTAwMDAyMmQyYjA+XSB4ZnJlZSsweDEzMC8weDFhNCAoUEMp
DQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDIyZDJhND5dIHhmcmVlKzB4MTI0LzB4MWE0IChM
UikNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMjMyMWYwPl0gYXJpbmM2NTMuYyNhNjUzc2No
ZWRfZnJlZV91ZGF0YSsweDUwLzB4YzQNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMjQxYmMw
Pl0gY29yZS5jI3NjaGVkX21vdmVfZG9tYWluX2NsZWFudXArMHg1Yy8weDgwDQo+IChYRU4p
ICAgIFs8MDAwMDBhMDAwMDI0NTMyOD5dIHNjaGVkX21vdmVfZG9tYWluKzB4NjljLzB4NzBj
DQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDIyZjg0MD5dIGNwdXBvb2wuYyNjcHVwb29sX21v
dmVfZG9tYWluX2xvY2tlZCsweDM4LzB4NzANCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMjMw
ZjIwPl0gY3B1cG9vbF9tb3ZlX2RvbWFpbisweDM0LzB4NTQNCj4gKFhFTikgICAgWzwwMDAw
MGEwMDAwMjA2YzQwPl0gZG9tYWluX2tpbGwrMHhjMC8weDE1Yw0KPiAoWEVOKSAgICBbPDAw
MDAwYTAwMDAyMmUwZDQ+XSBkb19kb21jdGwrMHg5MDQvMHgxMmVjDQo+IChYRU4pICAgIFs8
MDAwMDBhMDAwMDI3N2ExYz5dIHRyYXBzLmMjZG9fdHJhcF9oeXBlcmNhbGwrMHgxZjQvMHgy
ODgNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMjc5MDE4Pl0gZG9fdHJhcF9ndWVzdF9zeW5j
KzB4NDQ4LzB4NjNjDQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDI2MmM4MD5dIGVudHJ5Lm8j
Z3Vlc3Rfc3luY19zbG93cGF0aCsweGE4LzB4ZDgNCj4gKFhFTikNCj4gKFhFTikNCj4gKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiAoWEVOKSBQ
YW5pYyBvbiBDUFUgMjoNCj4gKFhFTikgQXNzZXJ0aW9uICchaW5faXJxKCkgJiYgKGxvY2Fs
X2lycV9pc19lbmFibGVkKCkgfHwgbnVtX29ubGluZV9jcHVzKCkgPD0gMSknIGZhaWxlZCBh
dCBjb21tb24veG1hbGxvY190bHNmLmM6NzE0DQo+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4gDQo+IEluIGNvbW1pdCAxOTA0OWY4ZCAoc2No
ZWQ6IGZpeCBsb2NraW5nIGluIGE2NTNzY2hlZF9mcmVlX3ZkYXRhKCkpLCBsb2NraW5nIHdh
cyBpbnRyb2R1Y2VkIHRvIHByZXZlbnQgYSByYWNlIGFnYWluc3QgdGhlIGxpc3QgbWFuaXB1
bGF0aW9uIGJ1dCBsZWFkcyB0byBhc3NlcnRpb24gZmFpbHVyZSB3aGVuIHRoZSBBUklOQyA2
NTMgZG9tYWluIGlzIHNodXRkb3duLg0KPiANCj4gSSB0aGluayB0aGlzIGNhbiBiZSBmaXhl
ZCBieSBjYWxsaW5nIHhmcmVlKCkgYWZ0ZXIgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpIGFz
IHNob3duIGJlbG93Lg0KPiANCj4geGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIHwgMyAr
Ky0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIGIveGVu
L2NvbW1vbi9zY2hlZC9hcmluYzY1My5jDQo+IGluZGV4IDdiZjI4ODI2NGMuLjE2MTVmMWJj
NDYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYw0KPiArKysg
Yi94ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4gQEAgLTQ2MywxMCArNDYzLDExIEBA
IGE2NTNzY2hlZF9mcmVlX3VkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9p
ZCAqcHJpdikNCj4gICAgICAgaWYgKCAhaXNfaWRsZV91bml0KGF2LT51bml0KSApDQo+ICAg
ICAgICAgICBsaXN0X2RlbCgmYXYtPmxpc3QpOw0KPiANCj4gLSAgICB4ZnJlZShhdik7DQo+
ICAgICAgIHVwZGF0ZV9zY2hlZHVsZV91bml0cyhvcHMpOw0KPiANCj4gICAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWRfcHJpdi0+bG9jaywgZmxhZ3MpOw0KPiArDQo+ICsg
ICAgeGZyZWUoYXYpOw0KPiAgIH0NCj4gDQo+IENhbiBJIGhlYXIgeW91ciBvcGluaW9uIG9u
IHRoaXM/DQoNClllcywgdGhpcyBzZWVtcyB0aGUgcmlnaHQgd2F5IHRvIGZpeCB0aGUgaXNz
dWUuDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBhIHByb3BlciBwYXRjaCAocGxlYXNlIGhh
dmUgYSBsb29rIGF0IFsxXSBpbiBjYXNlDQp5b3UgYXJlIHVuc3VyZSBob3cgYSBwcm9wZXIg
cGF0Y2ggc2hvdWxkIGxvb2sgbGlrZSk/DQoNCg0KSnVlcmdlbg0KDQpbMV0gDQpodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPWRvY3MvcHJvY2Vz
cy9zZW5kaW5nLXBhdGNoZXMucGFuZG9jDQo=
--------------0L4d40CXcKjgw5m7kA5xHBSv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0L4d40CXcKjgw5m7kA5xHBSv--

--------------L6oPTpIYNQNPNidB2TH6N2x8--

--------------El9mNQEGA2z1kYpmj0HMNg2q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfX1g8FAwAAAAAACgkQsN6d1ii/Ey+R
lAgAlC13chVxF0+XN8fULHoJwrKBtLnzsK5d60IoPH//RORb/Lq5kI/RMR5i8oduUlSQ+oEjzkZE
pI8jO+ZNwiFhc/I0gvWh80ivdlGQkE7y/XjRfHgQzGDaPeVh9J2sQDHTPNv28SpvgHYBBtIu5onI
HizazNRkcMp8C+GcuzCrwRR0QD5JPK3cRbi0F6E2JNWmgwRfn2pvLocSU3HjqFPoMTp6EGq+Wwl2
Cft1wqWYxAC+0peiscAHJqubNddzKIe7RvOiS6QbWaCI1ZPACudKX84B+bI4tx/a+yx88qGGW4G5
qJEe/LQp8CaRrc2XKBb5Y4mwZ89955LWMW6spNa6qw==
=e8ZH
-----END PGP SIGNATURE-----

--------------El9mNQEGA2z1kYpmj0HMNg2q--

