Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0F9B6305
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 13:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828184.1243031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67l2-0003NC-9y; Wed, 30 Oct 2024 12:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828184.1243031; Wed, 30 Oct 2024 12:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67l2-0003Li-70; Wed, 30 Oct 2024 12:25:04 +0000
Received: by outflank-mailman (input) for mailman id 828184;
 Wed, 30 Oct 2024 12:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MsG/=R2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t67l1-0003Lc-80
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 12:25:03 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0e29b4-96b9-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 13:24:59 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so4499516f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 05:24:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b92958sm15207973f8f.106.2024.10.30.05.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 05:24:57 -0700 (PDT)
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
X-Inumbo-ID: fb0e29b4-96b9-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0NDIiLCJoZWxvIjoibWFpbC13cjEteDQ0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZiMGUyOWI0LTk2YjktMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjkxMDk5LjkwMzc2MSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730291099; x=1730895899; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwzgsB44jt08JcIaw89mJ8hz8xcm2wrNYbFc6tX0aSI=;
        b=eym//jX+W7AjnvlmOhrwtiuNX2ekLzGGmb/kG/yaFogjFN1V8x0muTF3gKajki01vi
         ZVx1s0HTse1K+/NX8QJkmu6s0MegEDAb/EOraeSUmhbVOiTGXaLxfIPSI2DoD3SAORRb
         qkkcmLw0WNARN0czX3lxyUR5QWOXZyaLO2k3W/ug6djaLzzmLBrvBnq4PKjrJJDte++G
         9LOmmZDTfyBmGRXkaHHAg2odNjub7rv2izfmd67azJBd43iUWyw/HmzjN8O1Wo6KlrvE
         RCge1iAXHkdc/V8TYZvoSWH/Ey+IdQFnZimIJiS9vO6OpHNmgYx45Jg72dWNDiUhvNg6
         FFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291099; x=1730895899;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lwzgsB44jt08JcIaw89mJ8hz8xcm2wrNYbFc6tX0aSI=;
        b=IVEEaLkjcSJXkZ0rqf6+yl5Q2atEnedHxHVmAWT2UdqFbN36xiPe5llnOU6KlllhPU
         kHzd8Gni+ZG6BF/RpY/ymdzGQCdVBlyoQsYqcH4O2CMDM7/euaXmL7YVbxXqY5pUdjSc
         im0YtPIsO7i+89Ca5rm11Uc6X2LYpjqBtaJ1jKe2jsww3mOgeMUWc8t+ijPmmMqIPKZl
         ueW726xw/Dwn+PBcswv7fQ+C9Q8DdOweLwYcrv0HdIeBtPTtelLy1588yL2vYvAwj2NB
         kv0boBk1ccax4tGNu0ifeh/NNX8u6Qz1f/2EIqz1ePDQr6g2EwYowyNr3fr3e3I2fyDd
         QZtg==
X-Forwarded-Encrypted: i=1; AJvYcCXISnfXP8NlAC26jPkpFiNlcmthkak3UUMuphOoPZ4NNDQjGWZJ17YSqXWzRbf74bic+0o1QYxNLeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMvJ54SZqqK2kEsHKriC7RsQqPBR7HfCbWzsstBZTWZBexWM8C
	DHJTPktkAStj9Qx5Bj1AueKB8rewOGbp6Q5Q0pDl2zIqbfnalJ0vHWmbSHD1n3c=
X-Google-Smtp-Source: AGHT+IE//m+wXLhgspw7up1pVZCkv3SGTTwBsOlj/Wo8cTRWa+eTHRKdBX9zijI4ud3sTvCXgX1CGQ==
X-Received: by 2002:adf:cd83:0:b0:37e:d715:3f39 with SMTP id ffacd0b85a97d-380610f7bcemr10881704f8f.10.1730291097696;
        Wed, 30 Oct 2024 05:24:57 -0700 (PDT)
Message-ID: <02e4f295-4433-44e7-9c5e-15b18e3ec66e@suse.com>
Date: Wed, 30 Oct 2024 13:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] tools/xenstored: Best way to proceed with the protocol
 modification
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
References: <CAAa3AOOUDB4ZKAYSyXGdFsDzqpVfJd+oeRKR3XbVOSDkiaP_Yw@mail.gmail.com>
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
In-Reply-To: <CAAa3AOOUDB4ZKAYSyXGdFsDzqpVfJd+oeRKR3XbVOSDkiaP_Yw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rJJ0XYrcS4QANkiksz33oP1x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rJJ0XYrcS4QANkiksz33oP1x
Content-Type: multipart/mixed; boundary="------------XQyLSQTMVbgPziZgu1jQx7HM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrii Sultanov <andrii.sultanov@cloud.com>,
 xen-devel@lists.xenproject.org
Message-ID: <02e4f295-4433-44e7-9c5e-15b18e3ec66e@suse.com>
Subject: Re: [QUESTION] tools/xenstored: Best way to proceed with the protocol
 modification
References: <CAAa3AOOUDB4ZKAYSyXGdFsDzqpVfJd+oeRKR3XbVOSDkiaP_Yw@mail.gmail.com>
In-Reply-To: <CAAa3AOOUDB4ZKAYSyXGdFsDzqpVfJd+oeRKR3XbVOSDkiaP_Yw@mail.gmail.com>

--------------XQyLSQTMVbgPziZgu1jQx7HM
Content-Type: multipart/mixed; boundary="------------zRdX3J5vLC0HqolOl1cXKJER"

--------------zRdX3J5vLC0HqolOl1cXKJER
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMTAuMjQgMTI6NTgsIEFuZHJpaSBTdWx0YW5vdiB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiAoQ0MtaW5nIErDvHJnZW4gYXMgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGUgeGVu
c3RvcmVkIHBhcnRpYWwgZGlyZWN0b3J5IA0KPiBwYXRjaGVzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvMjAxNjEyMDUwNzQ4NTMuMTMyNjgtMS0gDQo+IGpncm9zc0Bz
dXNlLmNvbS8gPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE2MTIwNTA3
NDg1My4xMzI2OC0xLSANCj4gamdyb3NzQHN1c2UuY29tLz4pDQo+IA0KPiBJJ20gaW52ZXN0
aWdhdGluZyBpbXBsZW1lbnRpbmcgWFNfRElSRUNUT1JZX1BBUlQgc3VwcG9ydCBpbiBPeGVu
c3RvcmVkLCBhbmQgaGF2ZSANCj4gY29tZSBieSBhIHBvc3NpYmxlIGlzc3VlIC0gdGhlIHBy
b3RvY29sIHNwZWNpZmllcyB0aGF0IHRoZSAnb2Zmc2V0JyBwYXJhbWV0ZXIgDQo+IGZvciBl
YWNoIGNhbGwgaXMgYSAiYnl0ZSBvZmZzZXQgaW50byB0aGUgbGlzdCBvZiBjaGlsZHJlbiIs
IGFuZCBzbyBzaG91bGQgYmUgDQo+IGNhbGN1bGF0ZWQgb24gdGhlIHVzZXIgc2lkZS4gVGhp
cyBtYWtlcyBzZW5zZSBmb3IgdGhlIEMgc2lkZSBhcyBjaGlsZHJlbiBhcmUgDQo+IHN0b3Jl
ZCBpbiBhIHNpbmdsZSBjaGFyIGFycmF5IHNlcGFyYXRlZCBieSBudWxsIGNoYXJhY3RlcnMs
IGJ1dCBPQ2FtbCBzdG9yZXMgDQo+IGNoaWxkcmVuIGluIGEgZGlmZmVyZW50IHN0cnVjdHVy
ZSwgd2hpY2ggY2FuJ3QgYmUgaW5kZXhlZCBpbnRvIHRoaXMgd2F5IChidXQgaXMgDQo+IHNl
YXJjaGVkIG1vcmUgZWZmaWNpZW50bHksIGV0Yy4pDQo+IA0KPiBXaGF0J3MgdGhlIGJlc3Qg
d2F5IHRvIHByb2NlZWQgaGVyZT8NCj4gDQo+IENvdWxkIHRoZSBwcm90b2NvbCBiZSByZWRl
ZmluZWQgdG86DQo+IDEpIHR1cm4gdGhlICdvZmZzZXQnIGludG8gYW4gb3BhcXVlIGlkIHRo
YXQgbmVlZHMgdG8gYmUgcmUtc2VudCBhcy1pcyBvbiB0aGUgDQo+IG5leHQgaXRlcmF0aW9u
PyAoaXQgd291bGQga2VlcCBiZWluZyBpbnRlcnByZXRlZCBhcyBhbiBpbmRleCBpbnRvIGFu
IGFycmF5IG9uIA0KPiB0aGUgQyBzaWRlLCBhbmQgYXMgc29tZXRoaW5nIGVsc2Ugb24gdGhl
IE9DYW1sIHNpZGUpDQo+IDIpIHJldHVybiB0aGUgb3BhcXVlICdvZmZzZXQnIG9uIGVhY2gg
Y2FsbCBhbG9uZ3NpZGUgdGhlIHN0cmluZyBhbmQgZ2VuZXJhdGlvbiANCj4gaWQgc28gdGhh
dCBpdCB3b3VsZG4ndCBiZSBjYWxjdWxhdGVkIGZyb20gc3RybGVuKCkgb24gdGhlIHVzZXIg
c2lkZSBhbnltb3JlPw0KDQpBcyBsaWJ4ZW5zdG9yZSBpcyBjYWxjdWxhdGluZyB0aGUgb2Zm
c2V0IGJhc2VkIG9uIHRoZSBsZW5ndGggb2YgdGhlDQpyZXR1cm5lZCByZXN1bHQgb2YgdGhl
IHByZXZpb3VzIGNhbGwgYW5kIHRoZW4gdXNpbmcgdGhpcyB2YWx1ZSBmb3IgdGhlDQpuZXh0
IGl0ZXJhdGlvbiwgdGhlcmUgaXMgbm8gd2F5ICJvZmZzZXQiIGNvdWxkIGJlIHJlZGVmaW5l
ZCB0byBiZSBhbg0Kb3BhcXVlIGhhbmRsZSB3aXRoIGEgZGlmZmVyZW50IHZhbHVlIHRoYW4g
dG9kYXkuDQoNCk1vZGlmeWluZyB0aGUgb3V0cHV0IGZvcm1hdCBpc24ndCBwb3NzaWJsZSBl
aXRoZXIsIGFzIHdlIGhhdmUgbm8gY29udHJvbA0Kb3ZlciBhbGwgY2xpZW50cyB1c2luZyB0
aGUgY3VycmVudCBmb3JtYXQuDQoNClNvIHlvdSBuZWVkIHRvIGNvbXBseSB3aXRoIHRoZSBj
dXJyZW50IGludGVyZmFjZS4NCg0KDQpKdWVyZ2VuDQo=
--------------zRdX3J5vLC0HqolOl1cXKJER
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zRdX3J5vLC0HqolOl1cXKJER--

--------------XQyLSQTMVbgPziZgu1jQx7HM--

--------------rJJ0XYrcS4QANkiksz33oP1x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmciJZgFAwAAAAAACgkQsN6d1ii/Ey+o
jgf/bwaxSr5NvOidkSSdTYykjk3suqrnmzKp21P2bT5q+bz/KowQMD/AwRIbxtMzKIReGXWDThXR
C1NBMOEAcMx4pG+DISmiWvCFPykD3taw6Re/EZkctwBDIugMebelL0knYBTIBMEwPuqTeve93Qqj
mXKSYvAja1KM5oj5oBvze5MKiCPNfwH66WNw+d85U8UIsk6ILXlThqeZMMxiRMSGiVCOQMT3cBtG
fTgvC6sbuZs/A6IrQ0dPVmqFdlc1A0GcltsbjmT8zGuqTM+oXpJi5P1l89ZN1Qb1+kj0Rn8u6D/3
bWaz40u5zsu8/iQFjWP2pBSjVT4Vdcpdvgu9WDdsjA==
=F6nX
-----END PGP SIGNATURE-----

--------------rJJ0XYrcS4QANkiksz33oP1x--

