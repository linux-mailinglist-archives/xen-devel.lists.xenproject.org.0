Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98A3B28208
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 16:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083543.1443137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvaP-00085B-OL; Fri, 15 Aug 2025 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083543.1443137; Fri, 15 Aug 2025 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvaP-00082b-Kk; Fri, 15 Aug 2025 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1083543;
 Fri, 15 Aug 2025 14:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1umvaN-00082V-82
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 14:39:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c741e48-79e5-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 16:39:13 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b00f23eso11109185e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 07:39:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c790689sm64530545e9.28.2025.08.15.07.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 07:39:12 -0700 (PDT)
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
X-Inumbo-ID: 9c741e48-79e5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755268752; x=1755873552; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P4KUKr66TVIGF5KsKxX0kgWIBTJcWZogsPA3kDvYRhM=;
        b=HFPP0YOpxbpY55/cbJs8qxbAX7h5RXhNSyfM81vs1EjBTPjUUV1xK1irfsqhLNbKAR
         2GmsC8z4wxuwCyIMpJkxuWjsZS0A/mZ7JjsLaFYHaU4YNXVA1wFLPxS3oSJJrNHWV3h9
         44MkzzSpei/dgbbjnbSOTH9FGsh2EdpDJvN2mpW8wq320Y/E+B9z/YS8oui3FbG2sm6S
         npP4fLZjtSpYSBHnUGO2ObLVbriYiSTfWK4d/6GB/MSDk0ToTs1gw/hPSOxmxBt39vai
         CMt6RfY/6gg8OIqSUA0yxcgwbnVMnE9TpePX4ui/sXebGrpBA6F8BXx6VDQZQulOE++W
         TW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268752; x=1755873552;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4KUKr66TVIGF5KsKxX0kgWIBTJcWZogsPA3kDvYRhM=;
        b=J50kojGnuXIm51gLm3LGqAlfeN0R5VlFSLCB1edX2aYB5oIFUdumpu2rBi9JpVzuHi
         9NLXC7ofgPVkA899Dg3VrgcpamzgwjJey1Ok1JKP5Qtt+97k32t6jSJboMEWq3aUNACK
         dYw6ooGP4ey3itAREzlxhAsdSZKMMUT4zJjOVtfX1/bXORv6jgIoeyoiEhMnv3qSlPb6
         mum1JyBb1cShaenCcMNfORNkeQhZBchen6FE28w4WTofO/A2lUQBPEfG6/qXIInqFB+j
         a5aVf2QgNC+IVYl/R6r4/GiJokPopkSZkPW1sJMDtmSmkvvoIGdQXN93cq0EyjZ6dbr1
         50DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgh8JGFKhpe+3u6fPlI7X7nYD0fBx1gaLYhU+cSTp7mwuO5HrpO139osCvGXc78RYqRukDl+oD34=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1XqBPXetnOpQtw5XlypkhvLdqodYZSQAuK+pYUYxAlgw65dLz
	U98aNqCkNdZ93/tlatHXhwxftdCJ75I514uX40I7w0pK/5W6WnfYn9cqR3TVJXTISTzbsEcFrl6
	XA51swA0=
X-Gm-Gg: ASbGncs2zlzSLJU75JPbZeK00mi+3Uau4n57dsKD05h41qe4p/j1NPPKtWB9oSnNHgK
	Tc1+ASpzNXDatJGROIqPGCYyD+F3133VCJKhaYr+9TmiCmTNwlHKlv434zRmItQ3mUP6R3XeW0b
	2iGSn2FhtLk8JvU90C8Au8po9J9bkNS5NWqqwPRqUwpXCULIz/K9nRVdXw6XhTOjc1CocBFwkn6
	qJh51vNON2u/z9TIt2+r8CvWz+DhgFRl73XAw7LGr17lUknIj5vvjzIo6J57eJllB+j2yb7ZdwK
	teykoLpxdwVHPINmJ0M4IDrBSDohU3J5vJHNrh0Y81JZWdflMoB88sJcdQx9ZsadG5FzfvUi4L3
	1uxJKyBMRLLH1/f1krMDUFpWlhSns/Ljaa5sMX1IUiCUiZdSNLNTKHD7/QXsofIy3lREUXtCqFY
	mRkbDovALXhXZkowGM5fliQi7up8xTcREJZFhh8E5E6rXEazZUT8559Rqwpw==
X-Google-Smtp-Source: AGHT+IHGFj/v2AHSUMHoX1jjl4Iv4qGOlcF/g0ZjYHai5w1aps1/1W1MuA4xzrC50dfslrT8/ocQqQ==
X-Received: by 2002:a05:6000:420f:b0:3b5:def6:4f7 with SMTP id ffacd0b85a97d-3bb68a17722mr1784443f8f.30.1755268752307;
        Fri, 15 Aug 2025 07:39:12 -0700 (PDT)
Message-ID: <1704c30a-49fc-49fd-bb2f-a90f7f834761@suse.com>
Date: Fri, 15 Aug 2025 16:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250815143236.27641-1-jgross@suse.com>
 <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
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
In-Reply-To: <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9DbFNITkh0xoVOwuyguxC25E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9DbFNITkh0xoVOwuyguxC25E
Content-Type: multipart/mixed; boundary="------------Gd7ubZkjyHvDXGUcS3WFyIs0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <1704c30a-49fc-49fd-bb2f-a90f7f834761@suse.com>
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
References: <20250815143236.27641-1-jgross@suse.com>
 <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
In-Reply-To: <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>

--------------Gd7ubZkjyHvDXGUcS3WFyIs0
Content-Type: multipart/mixed; boundary="------------79m3haPTCrmQfwbb7oSPwABD"

--------------79m3haPTCrmQfwbb7oSPwABD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDguMjUgMTY6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE1LzA4LzIw
MjUgMzozMiBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEluIG9yZGVyIHRvIGJlIGFi
bGUgdG8gdXNlICJ4bCBpbmZvIiBiZWZvcmUgWGVuc3RvcmUgaGFzIGJlZW4gc3RhcnRlZA0K
Pj4gb3IgYWZ0ZXIgaXQgaGFzIGNyYXNoZWQsIGhpZGUgb2J0YWluaW5nIHRoZSBhdmFpbGFi
bGUgWGVuc3RvcmUgZmVhdHVyZXMNCj4+IGJlaGluZCB0aGUgbmV3IG9wdGlvbiAiLXgiLg0K
Pj4NCj4+IEZpeGVzOiBlY2NlNzk3MGNmZTcgKCJ0b29scy94bDogYWRkIGF2YWlsYWJsZSBY
ZW5zdG9yZSBmZWF0dXJlcyB0byB4bCBpbmZvIG91dHB1dCIpDQo+PiBSZXBvcnRlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFByb2JhYmx5
IG91Z2h0IHRvIGJlIFJlcG9ydGVkLWJ5IFJvc3MgTGFnZXJ3YWxsLsKgIEhlIGRpZCBhbGwg
dGhlIGhhcmQNCj4gd29yayBkZWJ1Z2dpbmcgdGhpczsgSSBqdXN0IGluc2lzdGVkIHRoYXQg
dGhlIGNvbnZlcnNhdGlvbiBtb3ZlIG9udG8gTWF0cml4Lg0KPiANCj4gRm9yIHRoZSBjaGFu
Z2UgaXRzZWxmLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzLg0KDQpTaG91bGQgSSBzZW5kIFYyIHdpdGggdGhl
ICJSZXBvcnRlZC1ieSIgY29ycmVjdGVkLCBvciBjYW4gdGhpcyBiZSBkb25lDQp3aGVuIGNv
bW1pdHRpbmc/DQoNCg0KSnVlcmdlbg0K
--------------79m3haPTCrmQfwbb7oSPwABD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------79m3haPTCrmQfwbb7oSPwABD--

--------------Gd7ubZkjyHvDXGUcS3WFyIs0--

--------------9DbFNITkh0xoVOwuyguxC25E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmifRo8FAwAAAAAACgkQsN6d1ii/Ey8y
2gf/aaRqZQebJjsWL2SdshOuCmgj2PNgXokNZsOXC8e2IFhoL2zfAl5vI3vZ8Hx3aM9ZkBDj9IKJ
gKnBn1/+ElBi6xbCmkdkXUiKJwQdLHi/emNpZelKpObJ34l3BSKMSAhzstPDmKk2d2IgyWresb1N
HPFYc2UsonUgmA2aQfI41g/lWHDe/m0f5mKcETkpZhJaCjthA4j48iiEwd0jW9X8tukcrgVOkKfe
OPG17XwHAJcV0prrYrBpSrbDtrGjIX2Ri3HBpp7HBusR1RlaZSZeGWjnqkNwSkKuznfqojqnAOGd
ldXjbVl4YMbtDgIupdyV4A4MzJXzK56+MLiaHFo8hQ==
=GW7x
-----END PGP SIGNATURE-----

--------------9DbFNITkh0xoVOwuyguxC25E--

