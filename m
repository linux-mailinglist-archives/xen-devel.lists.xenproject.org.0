Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF728A5F524
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912107.1318436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiDX-00049S-5W; Thu, 13 Mar 2025 13:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912107.1318436; Thu, 13 Mar 2025 13:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiDX-00046T-2V; Thu, 13 Mar 2025 13:03:19 +0000
Received: by outflank-mailman (input) for mailman id 912107;
 Thu, 13 Mar 2025 13:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsiDW-000464-3G
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:03:18 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86205400-000b-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:03:14 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so796645f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:03:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c258bsm2022293f8f.24.2025.03.13.06.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:03:12 -0700 (PDT)
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
X-Inumbo-ID: 86205400-000b-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741870994; x=1742475794; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0AfZHDw+lwjSrrZnBZ4sB1TW5PACAnANPPCrSf3ABGE=;
        b=TBTLDCtKQTzwyo2nyNZnBW3CizQtakTpB3CZrxXeG7qXMMScOSiAx/DEL48E4ryfPm
         A7maOhSHjRAe/3bjhP/FXtm98PpGxRaKwdlS/qY3Pso7XMcPtZlxpqKLGxT/peBivMQx
         Sz5BHc0OS41d83HutRvK7opzalqGfK1JZlfX02LvvpnsTTF73s87jeCSmV2Str6AthP0
         tQPeeehuN3GHyQ+hbk20zDasyaMA+nRgvIncCwV127HjIKIYHl0zOhHxzsE9ooJYgJcW
         GIcpcgTOpki5jZXL/8jCNZXkq4rEeevhDbNMX3sPT8pXc4JG03Rf5BUoka1eR3xcJwnj
         Y7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870994; x=1742475794;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AfZHDw+lwjSrrZnBZ4sB1TW5PACAnANPPCrSf3ABGE=;
        b=Fz77/lGjOaqXpXxe0BdWyZaxIFfky4IY2Z8r6kyuhahjS+MYhvrP7ChdLySQqiNe+V
         knCctVU/UixO4iQSKRCyG9KrHZz3fgWpTFdWLf25U9VtTDvaTPDz22+c4r8GC8quS5xh
         xpM05CouQnY6Mf4r9TQghqXUa2jiY5eUHd7R9C96BtXk8nY+APcbdw+7OREWRlzTTRgZ
         +x8n+8EpwqhDixnsjxfkRHMSJ9NEYrFEyghgwfH+zgMkQzUanin1MPPsJCz2HSRsEpd+
         Azf0YEhZQKsMYVKiG7TIGiwbL1yeg6/9ama6Trm2HBDfWaikpQ6DVZPzYxCZhRQA4wtr
         /BfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQbrkdAB+XvfMhfTYiBKBg4uSR1VM8xnV3M3JHawUWy2bMzjiZZF4O7dTjvUhiG2gHvZl9IvNGQl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNTwbqq63DjUKTnNwRSwEQKEj5xiLwaMo99e4OLdJzZyB9HQJS
	JjbOP30jsuSLZsqh+r8F4o4WZIgO6bnMD1fyRQIK84ZkGkT0FZtUEnX452DlyNM=
X-Gm-Gg: ASbGncvw4EoWOlS6hyPCxddH0zGSoajDJq8N3gDd/hjX9VUZl0TKfClVh7+hUKh1YFl
	TWPyMIpvLhpj51nEXaQb6xcxfbH8/1zI+0LAvk1/RC9ytKYlv6yJeQEZf4pkiD58IJ5t2zqP2mo
	dZ42nD2MDyB03lh/OhcKQ4GgVmFUSdkI+wuDYj3qHxQgCh6FuZdC7veBuzQEzzsR5cTyxliNdbQ
	bAb2H4dAaW6EkhQHbc5vmh6xTI35EKG3nWbF40i4OVhHp8TO8yzJ7wwykT85dc3bOSNz5IIiX8b
	NF700HqpEbuAnwWtlAd44Y1QiHp5mHcZqy5xea2/bir6jDVpObxg7D1LrnSptV3v93ZPKyQImLb
	ck9mu3MrXJtsGyjVaCKXcxpIZnocoXKLBF7b8nby54nVbeewIKmSCxOPXDcpNG2oM+AeIjmHz+2
	F3WQ==
X-Google-Smtp-Source: AGHT+IFk7M6IDma2MPCulDbnkk8LFeOC+6E1Dyu5EQPr2nOheHTVY8+dJNmbZvrG43lmBv7LN9Lm7w==
X-Received: by 2002:a5d:47cc:0:b0:390:f0ff:2c11 with SMTP id ffacd0b85a97d-39132d30b96mr17258240f8f.2.1741870992555;
        Thu, 13 Mar 2025 06:03:12 -0700 (PDT)
Message-ID: <aba6bc8f-8bd4-4d76-915c-79992ad26896@suse.com>
Date: Thu, 13 Mar 2025 14:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
 <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
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
In-Reply-To: <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FFOB0gtSG50YkS0AHs9w99iE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FFOB0gtSG50YkS0AHs9w99iE
Content-Type: multipart/mixed; boundary="------------EvsY8hm17rpUnJLoo8Rqul7t";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
Message-ID: <aba6bc8f-8bd4-4d76-915c-79992ad26896@suse.com>
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
 <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB214848C4FE9474A6C050A7C090D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>

--------------EvsY8hm17rpUnJLoo8Rqul7t
Content-Type: multipart/mixed; boundary="------------cbQvgCNC0WndAolQr5SS50rw"

--------------cbQvgCNC0WndAolQr5SS50rw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjUgMTA6MjcsIENob2ksIEFuZGVyc29uIHdyb3RlOg0KPiBKdWVyZ2VuLA0K
PiANCj4+IE9uIDEzLjAzLjI1IDA3OjUxLCBDaG9pLCBBbmRlcnNvbiB3cm90ZToNCj4+PiBX
ZSBhcmUgb2JzZXJ2aW5nIGFuIGluY29ycmVjdCBvciB1bmV4cGVjdGVkIGJlaGF2aW9yIHdp
dGggQVJJTkM2NTMNCj4+IHNjaGVkdWxlciB3aGVuIHdlIHNldCB1cCBtdWx0aXBsZSBBUklO
QzY1MyBDUFUgcG9vbHMgYW5kIGFzc2lnbiBhDQo+PiBkaWZmZXJlbnQgbnVtYmVyIG9mIGRv
bWFpbnMgdG8gZWFjaCBDUFUgcG9vbC4NCj4+DQo+PiAuLi4NCj4+DQo+Pj4gSXQgc2VlbXMg
dGhlcmUncyBhIGNvcm5lciBjb25kaXRpb24gaW4gdXNpbmcgdGhlIGdsb2JhbCB2YXJpYWJs
ZXMgInNjaGVkX2luZGV4Ig0KPj4gYW5kICJuZXh0X3N3aXRjaF90aW1lIiB3aGVuIG11bHRp
cGxlIEFSSU5DNjUzIGNwdXBvb2xzIGFyZSBydW5uaW5nIG9uDQo+PiBkaWZmZXJlbnQgcGh5
c2ljYWwgQ1BVcw0KPj4+DQo+Pj4gVGhlIHZhcmlhYmxlcyBzY2hlZF9pbmRleCBhbmQgbmV4
dF9zd2l0Y2hfdGltZSBhcmUgZGVmaW5lZCBhcyBzdGF0aWMNCj4+PiBhdCB4ZW4vY29tbW9u
L3NjaGVkL2FyaW5jNjUzLmMgYXMgc2hvd24gYmVsb3cuDQo+Pj4NCj4+PiBzdGF0aWMgdm9p
ZCBjZl9jaGVjaw0KPj4+IGE2NTNzY2hlZF9kb19zY2hlZHVsZSgNCj4+PiAgICAgICBjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICpwcmV2LCBzX3Rp
bWVfdA0KPj4+ICAgICAgIG5vdywgYm9vbCB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkKSB7IHN0
cnVjdCBzY2hlZF91bml0ICpuZXdfdGFzayA9DQo+Pj4gICAgICAgTlVMTDsgc3RhdGljIHVu
c2lnbmVkIGludCBzY2hlZF9pbmRleCA9IDA7ICAgIDw9PSBzdGF0aWMgc190aW1lX3QNCj4+
PiAgICAgICBuZXh0X3N3aXRjaF90aW1lOyAgICAgICA8PT0NCj4+DQo+PiBUaGFua3MgZm9y
IHRoZSByZXBvcnQhDQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSB2ZXJpZnkgdGhlIGF0dGFj
aGVkIHBhdGNoIGlzIGZpeGluZyB5b3VyIHByb2JsZW0/DQo+Pg0KPj4gQW5kIHBsZWFzZSB0
ZWxsIG1lIHdoZXRoZXIgYWRkaW5nIHlvdSBhcyAiUmVwb3J0ZWQtYnk6IiBpcyBmaW5lIHdp
dGggeW91IQ0KPj4NCj4+IEp1ZXJnZW4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHBh
dGNoLiBJIGhhdmUgdmVyaWZpZWQgdGhlIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBhbmQgSSBj
YW4gc2VlIGRvbWFpbnMgYXJlIHJ1bm5pbmcgYXQgdGhlIHByb2dyYW1tZWQgaW50ZXJ2YWwu
DQoNClRoYW5rcyBmb3IgdmVyaWZ5aW5nLg0KDQo+IA0KPiBBbmQgSSBhbSB0b3RhbGx5IGZp
bmUgd2l0aCAiUmVwb3J0ZWQtYnkiLg0KPiANCj4gTWF5IEkga25vdyB3aGVuIHlvdSB0aGlu
ayBpdCB3b3VsZCBiZSBtYWlubGluZWQ/IEFuZCB3aWxsIGl0IGJlIGFwcGxpZWQgdG8gYWxs
IGJyYW5jaGVzLCBsaWtlIDQuMTkgYW5kIDQuMjA/DQoNClNob3VsZG4ndCBiZSB0b28gbG9u
ZywgYnV0IHRoaXMgd2lsbCBkZXBlbmQgb24gbWFpbnRhaW5lcnMgZ2l2aW5nIHRoZWlyIG9r
YXkuDQoNCkFzIHRoZSBwYXRjaCBpcyBmaXhpbmcgYSByZWFsIHdvcmxkcyBidWcsIGl0IHNo
b3VsZCBiZSBpbmNsdWRlZCBpbiB0aGUgc3RhYmxlDQpicmFuY2hlcywgdG9vICg0LjE4IGFu
ZCBuZXdlciBzdGlsbCBnZXQgYmFja3BvcnRzKS4NCg0KDQpKdWVyZ2VuDQo=
--------------cbQvgCNC0WndAolQr5SS50rw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cbQvgCNC0WndAolQr5SS50rw--

--------------EvsY8hm17rpUnJLoo8Rqul7t--

--------------FFOB0gtSG50YkS0AHs9w99iE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfS144FAwAAAAAACgkQsN6d1ii/Ey+i
Iwf/VyIv1B8LZRTVnAQS+isj8SBXRNQMi05a07izPTRo3ydSBa6el5rSpfK61ReHWW3erUBe3D4W
tc/a/Q0zRCV4qvbZlxnk8yiLRESz9nBI0RDD2HzNhdze3ZSBB7opeVxtIPPE/dXnH3Zh6jX3kRcL
VabHxRDmrsmQHWXVbZpR1H5Kl80+Er0WPwEvAs0T42d2J2ns5UbBaIdDVxsckR84jLP21QKZAXkW
9LbZa4DHfxl8+f3TaMZOVKldZxCD4I5tUYuJtpFDyC3anv8ptkC9FJnRSfi3TpyQ3UZWYLvtRLaG
aRq2QqeLjCWL9Ts2Quen3wgsOsKTQKA0khoY/o0qmg==
=u/o9
-----END PGP SIGNATURE-----

--------------FFOB0gtSG50YkS0AHs9w99iE--

