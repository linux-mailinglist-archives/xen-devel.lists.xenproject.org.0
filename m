Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC4A5EFF7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911764.1318166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfFR-0001QL-9p; Thu, 13 Mar 2025 09:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911764.1318166; Thu, 13 Mar 2025 09:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfFR-0001Nt-72; Thu, 13 Mar 2025 09:53:05 +0000
Received: by outflank-mailman (input) for mailman id 911764;
 Thu, 13 Mar 2025 09:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsfFQ-0000UE-19
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:53:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f49baff8-fff0-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:53:03 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso165852466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:53:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a9daf1sm59530366b.166.2025.03.13.02.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:53:02 -0700 (PDT)
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
X-Inumbo-ID: f49baff8-fff0-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741859583; x=1742464383; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xYQMaG2I3HODOmxbZjpMb9F+TDmn9WMd6FU7eLXpg9s=;
        b=WHvBSLbioFNGTtFj4uIq6U4WFEInJvHvnK9yW09yfBBB6f6FRaXdlUOOJljlpz/QLp
         VOgo4/79fKxpPoQHvpCHQshCxuBzzn2UfOPPNUJZ+rxlHbpVNbzCeKZEB1DBH4ZQPPII
         CqL7lAbOTFzxeWgv1Z3BMlTbvIsTsf9xELeEEzJHy9IvT9hKss/h+dJV/Lt5oabAcdXf
         FV56PMLLS8daeo8MLc2TU+LCYBi8ajVz4bFjHJ2zSk+8Dsv4ZHG3iD9eLlDl6alJWyoU
         MM22JCZwpASDS/h9tM4isvqltXUbYv1ejX51e6X2a7Ktxw+RC0U7iNJKygY53To788C1
         AbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741859583; x=1742464383;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYQMaG2I3HODOmxbZjpMb9F+TDmn9WMd6FU7eLXpg9s=;
        b=WlNxSrnUFWJAp71InoZya33cgrybXt7GUe7Pocfmj2iL3ANuAqXk8tz2ohoZOKu76f
         ERh999C6RzbsTbx4XHAqauAUtLklbOTvnXrbSC5OEuikmk34GbrkWvq4GnHA8zpvHAkn
         l7KkPgTswte+yF5PxRt6/9G/BdNJ+r/U1j4otK+iXSX0HghSaG5apAXvmbnF6/4FCLZw
         74hC7HaUMY3q92B5swkIri2zo+tg+DYwP9gGZm72mP5MPM2Kg0m55jOTG45A2WznLoF6
         jI1VNIX4XB7kh57ASdhZoY8adF7R8I3fyE7IETnEN8hCjL5u95bpHlAGxVuExMQtegof
         QINA==
X-Forwarded-Encrypted: i=1; AJvYcCVfuSJ9FOmuUjoL7sgPLFAn9OBy4vrw284fgB/hfmQiVyR8XlLilkOcjGLQYsWG0EyP3clAikDfnh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyemNQ/lDypJ22m2XPrLC64b+PktWfBltvrHj3D/a6e4VUVEhf
	a1wUYhfP66rhGfawU1xoEvxqg+KEqH0A0DXnoZprdKOo5OcMOIW3KaVsQFw03mA=
X-Gm-Gg: ASbGncsFjNiYq6FU+GllM87fQExtBqQ1Y5lEWlYCvqVqqvZJXohx2155BoEwZD7N4mV
	sj2UHxpwyGt2fUAbxEZOikBkXnRXPt2Bg0YFP6bxsWC30dFZ7bIzv7Xr1UaPMGeFtqcGCsviGWu
	vjuY0GKK8GGz/s8lXpUQ7kcG7IQBgkpC1kFWIoF8jLyYQdzjYlS57l7iA9lBcQACKR/Roma46uX
	ltSgpLGwDoFusMJEPU+Id/+NESKnDHELoE2oGa/lxj6EUJmRT6hc8S9Popkx5HHHqQtv8Clswme
	Z9qUXy1JOjZZXF1gbtG8a0YlxMGfq0P5ay7hY3wnH7+dfIDZYjBIzm1A+AxJDk4x4aH5PslQ5uy
	fNf1jPEzec3gtHtMfV3THQUI07Rypn0uVZfojdZoFcvBP2BoGzdgpVSfBHmvBdo1P8cM=
X-Google-Smtp-Source: AGHT+IFLOEfGtcF0qa0VYiPnHUwatOV8Kmi8WYHxnzgFp9g0cXRDJObxO3JDOPajMlRRWrRodk/2VA==
X-Received: by 2002:a17:907:6ea1:b0:ac2:b414:ba2a with SMTP id a640c23a62f3a-ac2b9ea18eemr1630618466b.37.1741859582791;
        Thu, 13 Mar 2025 02:53:02 -0700 (PDT)
Message-ID: <68390678-c278-492c-9a2b-7248a91deddc@suse.com>
Date: Thu, 13 Mar 2025 10:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] tools/xenstored: use
 xenmanage_poll_changed_domain()
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-10-jgross@suse.com>
 <11885cfa-42be-42d2-821c-ebb8db304340@amd.com>
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
In-Reply-To: <11885cfa-42be-42d2-821c-ebb8db304340@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------clceAguKuyv3Arr8DFgLHKQP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------clceAguKuyv3Arr8DFgLHKQP
Content-Type: multipart/mixed; boundary="------------f6epvUDNBh75qMypssURlDtR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <68390678-c278-492c-9a2b-7248a91deddc@suse.com>
Subject: Re: [PATCH v8 9/9] tools/xenstored: use
 xenmanage_poll_changed_domain()
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-10-jgross@suse.com>
 <11885cfa-42be-42d2-821c-ebb8db304340@amd.com>
In-Reply-To: <11885cfa-42be-42d2-821c-ebb8db304340@amd.com>

--------------f6epvUDNBh75qMypssURlDtR
Content-Type: multipart/mixed; boundary="------------Ywm5Thtv6fPnMwzm3AHTqeBM"

--------------Ywm5Thtv6fPnMwzm3AHTqeBM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjUgMTg6NDUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDIt
MDQgMDY6MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJbnN0ZWFkIG9mIGNoZWNraW5n
IGVhY2gga25vd24gZG9tYWluIGFmdGVyIGhhdmluZyByZWNlaXZlZCBhDQo+PiBWSVJRX0RP
TV9FWEMgZXZlbnQsIHVzZSB0aGUgbmV3IHhlbm1hbmFnZV9wb2xsX2NoYW5nZWRfZG9tYWlu
KCkNCj4+IGZ1bmN0aW9uIGZvciBkaXJlY3RseSBnZXR0aW5nIHRoZSBkb21pZCBvZiBhIGRv
bWFpbiBoYXZpbmcgY2hhbmdlZA0KPj4gaXRzIHN0YXRlLg0KPj4NCj4+IEEgdGVzdCBkb2lu
ZyAieGwgc2h1dGRvd24iIG9mIDEwMDAgZ3Vlc3RzIGhhcyBzaG93biB0byByZWR1Y2UgdGhl
DQo+PiBjb25zdW1lZCBjcHUgdGltZSBvZiB4ZW5zdG9yZWQgYnkgNiUgd2l0aCB0aGlzIGNo
YW5nZSBhcHBsaWVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNv
bi5hbmRyeXVrQGFtZC5jb20+DQo+IA0KPiBJIHNlZSBhdCBsZWFzdCBzb21lIGRvbV9pbnZh
bGlkIHVzZXMgZ29lcyBhd2F5LCBzbyBtYXliZSBkb24ndCBib3RoZXIgY2hhbmdpbmcgaXQu
DQoNCkknbGwgZG8gdGhlIGNoYW5nZS4NCg0KDQpKdWVyZ2VuDQo=
--------------Ywm5Thtv6fPnMwzm3AHTqeBM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Ywm5Thtv6fPnMwzm3AHTqeBM--

--------------f6epvUDNBh75qMypssURlDtR--

--------------clceAguKuyv3Arr8DFgLHKQP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfSqv4FAwAAAAAACgkQsN6d1ii/Ey9o
TwgAmFkw7dmNEKxNPakYl9ZbuULKhRDahJkIYixsyJISRMohMbAxD4K2uwoZ/BrIgYZSulZTmg7f
QMXwv09rTxiSX4tSlBJqghglg9Z+UPRWQbiWoYb6FiRLNPXS8+k10FJSqx6T6XsDh0kyDL1nj6dX
GRBKhxeZYFbvYNb7Fo6NDuwdqxo+gQZ4bAbyXUftPS+o9UvB+RsEcihae+ItXq6A55IJeS+qI+7q
69s2p9L5P/Fr3vEBeiQqo1rEPxMD21t3uBuTy4+wXD7Nf/u3nSrdxujDFeHrknbAPPAwqKyGoDSc
OhdleZFZ/ebNQhAdr1PM0qMMiGgiDKDXejA87UGCvA==
=FLKk
-----END PGP SIGNATURE-----

--------------clceAguKuyv3Arr8DFgLHKQP--

