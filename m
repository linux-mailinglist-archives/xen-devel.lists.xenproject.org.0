Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE8A48285
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898224.1306802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfWw-0000kX-OA; Thu, 27 Feb 2025 15:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898224.1306802; Thu, 27 Feb 2025 15:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfWw-0000ir-KJ; Thu, 27 Feb 2025 15:10:30 +0000
Received: by outflank-mailman (input) for mailman id 898224;
 Thu, 27 Feb 2025 15:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=91Tp=VS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tnfWv-0007UI-IN
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:10:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa3eac9e-f51c-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 16:10:27 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abf17fa4a29so71630666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 07:10:27 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb4818sm1195578a12.64.2025.02.27.07.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 07:10:26 -0800 (PST)
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
X-Inumbo-ID: fa3eac9e-f51c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740669027; x=1741273827; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8iqFQ9SRmkcuJ9PB4JnAuMni1sCXcBh2JQTJpxGL73M=;
        b=U15o725XZPc1wczPz4y8LYER6M0BDCKablq5QVrRZ9oE85VWp5lbIT/iVisYqf3MIR
         CVOtRt9hufS/waeDpzwxuoh82q13gjwEaQuVs43ZwqGnGbnYBU8o7AcybXdorXHd0T7B
         U/nx4c8llhmRscThCvqLTNZ56VNX16ImnkoL6MyYWAEXE4l7l2x4RQIbNOdNBB0Rb3gQ
         cKfdikUiqrsIRRgZ1ZzYMnp8ze/jZNnZH2TwqRFNOqscpTbZNWQpBYuUPSGEcSvmN0Zy
         mY5eUWIjVG2dBqftLGW3wAUpOGpd/mzO2pzJfflvQ/kBqVdUBKnc5l3VgpfEegTsGgNa
         LVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740669027; x=1741273827;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iqFQ9SRmkcuJ9PB4JnAuMni1sCXcBh2JQTJpxGL73M=;
        b=QgC53kO2ouFtkqtDvy92MH+wlbQx7t+JOfunOxzrnE/ZRDrV94lRxUMjZ9v6J+PRD2
         IWlcNbme3am+QvsCxIwbJPxWXrdXvwQtfNUEWETuYjoh5PMRj1GKQiLSSs18cmAfPhaE
         y9ZWsZjv+MAuKnfABRJMA6qxiH3jrDy3XuQYRvuPmWAd+6DzoEIm1Vyy47sqDROOawLe
         k6ajiRHcxjAFC0az6rtlrP5N2590a782vlorHQO6wk348JbbiknWhrgqjVnE3BTJH5kZ
         6fnwV2xDFw0Q1gq7lMnFAZy+gCGmbbDwkBOZX+qrZ6hk7cN3RENoTaDlQzyQRZRb2M7J
         OLww==
X-Gm-Message-State: AOJu0Yzq/4NeVSv+yzIDA6/GN6MgwVvBzM2zfO2i8ihHjovpRcMbwExp
	yWV1b8GJZy1MWqKpnUnN8afpIlTffwTTbGfi4BCWjBj6iJeKOXy0Whw/I2uRbKRe8XVHieMHNT2
	+b7w=
X-Gm-Gg: ASbGncuw/M1zl2gQooMZHndR4CTE+P7VBF3V5IZj+/xm03yNS920wwNIAUM6VM8Aeo2
	x0ssuneOu+MdIXsmgfgkx5OLc7Q3og94zAXoWBTiWMuAh5yFgTZiTwheFoIxBLD+iwPJU5uwizV
	Eifwby7+csBElB9hr3xq/vu46DHJWrbZ26CGMKNW5ipVKtgYfq1j114EguuqKs1nBs1FXexbukF
	Kw53c8pmHubsY/aSYUSB7EEc2LJkAaT1oOcVs1dhfGz1PInmw+UjVpKKpfu7xOqx2eaBx5q7uyW
	G5Wzt1N9tYgQVrbEmvkNgf2/twVnhTnMRg0WDNd6qDu2VYXpEzIWh35goY2tjc7NZjWb0BH3caa
	65cQF6q9MqIi/glC0ucklfJBhDhs/71ISE+jJ2FYaHShuWBJ4
X-Google-Smtp-Source: AGHT+IHpniH5t5rBMmDc///P8D74iAn0fpkekPMuUU9zVqxPTQFK9Zbjo07No/Ojed0a41sC9kwUYg==
X-Received: by 2002:a05:6402:2787:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5e4469da925mr31401187a12.15.1740669027026;
        Thu, 27 Feb 2025 07:10:27 -0800 (PST)
Message-ID: <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com>
Date: Thu, 27 Feb 2025 16:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xl: fix channel configuration setting
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20250225073033.20972-1-jgross@suse.com> <Z785WyG39EGCRM1y@l14>
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
In-Reply-To: <Z785WyG39EGCRM1y@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xdKWW7yVSjBylms73Qhhmri8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xdKWW7yVSjBylms73Qhhmri8
Content-Type: multipart/mixed; boundary="------------5PO4HhlCVnkGZ8AVyHx0Ln5e";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com>
Subject: Re: [PATCH v2] tools/xl: fix channel configuration setting
References: <20250225073033.20972-1-jgross@suse.com> <Z785WyG39EGCRM1y@l14>
In-Reply-To: <Z785WyG39EGCRM1y@l14>

--------------5PO4HhlCVnkGZ8AVyHx0Ln5e
Content-Type: multipart/mixed; boundary="------------tnQMoemdjT1LmpzZ70nKRZ0g"

--------------tnQMoemdjT1LmpzZ70nKRZ0g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDIuMjUgMTY6NTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEZl
YiAyNSwgMjAyNSBhdCAwODozMDozM0FNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQ2hhbm5lbHMgd29yayBkaWZmZXJlbnRseSB0aGFuIG90aGVyIGRldmljZSB0eXBlczog
dGhlaXIgZGV2aWQgc2hvdWxkDQo+PiBiZSAtMSBpbml0aWFsbHkgaW4gb3JkZXIgdG8gZGlz
dGluZ3Vpc2ggdGhlbSBmcm9tIHRoZSBwcmltYXJ5IGNvbnNvbGUNCj4+IHdoaWNoIGhhcyB0
aGUgZGV2aWQgb2YgMC4NCj4+DQo+PiBTbyB3aGVuIHBhcnNpbmcgdGhlIGNoYW5uZWwgY29u
ZmlndXJhdGlvbiwgdXNlDQo+PiBBUlJBWV9FWFRFTkRfSU5JVF9OT0RFVklEKCkgaW4gb3Jk
ZXIgdG8gYXZvaWQgb3ZlcndyaXRpbmcgdGhlIGRldmlkDQo+PiBzZXQgYnkgbGlieGxfZGV2
aWNlX2NoYW5uZWxfaW5pdCgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFRoaXMgbWlnaHQgd2FudCBhOg0KPiAgICAg
IEZpeGVzOiAzYTY2Nzk2MzQ3NjYgKCJsaWJ4bDogc2V0IGNoYW5uZWwgZGV2aWQgd2hlbiBu
b3QgcHJvdmlkZWQgYnkgYXBwbGljYXRpb24iKQ0KPiANCj4gQmVmb3JlIHRoYXQsIHRoZSBk
ZXZpZCBzZXQgYnkgYHhsYCB3YXMgcHJvYmFibHkgaWdub3JlZC4gSSB0aGluayBiZWZvcmUs
DQo+IHRoZSBjb25zb2xlIGRldmlkIHdvdWxkIGJlIHRha2VuIGZyb20gbGlieGxfX2luaXRf
Y29uc29sZV9mcm9tX2NoYW5uZWwoKQ0KPiBwYXJhbWV0dGVycywgc28gdGhlIGZpcnN0IGRl
dm51bSB3b3VsZCBiZSBgMCsxYCwgc28gbmV2ZXIgMC4NCj4gDQo+IERvIHlvdSBhZ3JlZT8N
Cg0KSSdtIG5vdCBzdXJlIEkgZG8uIFRoZSB1c2Ugb2YgQVJSQVlfRVhURU5EX0lOSVQoKSBp
biB4bF9wYXJzZS5jIHByZWRhdGVzDQpjb21taXQgM2E2Njc5NjM0NzY2LCBzbyB0aGVyZSBp
cyBjZXJ0YWlubHkgbW9yZSB0aGFuIG9uZSBwb3RlbnRpYWwgRml4ZXM6DQpjYW5kaWRhdGUu
DQoNClNvIGF0IGxlYXN0IGZvciB0aGUgeGwgY2FzZSBjb21taXQgM2E2Njc5NjM0NzY2IGlz
bid0IHJlbGV2YW50LCBhbmQgbXkgcGF0Y2gNCmlzIGZpeGluZyB0aGUgeGwgY2FzZSBvbmx5
Lg0KDQo+IA0KPiBJbiBhbnljYXNlOg0KPiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=

--------------tnQMoemdjT1LmpzZ70nKRZ0g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tnQMoemdjT1LmpzZ70nKRZ0g--

--------------5PO4HhlCVnkGZ8AVyHx0Ln5e--

--------------xdKWW7yVSjBylms73Qhhmri8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfAgGEFAwAAAAAACgkQsN6d1ii/Ey9t
cQf/bDDuJqKx0KdeelwG7/qd5cK6EvKk08XAZAn7ogN04E+x+xiW8Mw6+27EQXqCMpkfDbR7S/Wv
tO9wt58xGbkChCBMnwFkXefMgo7P+MltuC0Tyi9Gr5kq5TP2ytAKn8EPYpfuox85v4lJVW1TvcZd
k+voHkBMHbySwLlLGT5if/IGDqk0vC6WbqvWW9KuWumxMGt2IZkMS0JX3YGhm71gJlavzjP26mCV
Ce871ZAgIDWcEhRI4zYS4026IEVYBAt5rRqwMazpbla1RNDWGJ/tho9e2NnS6Rp7h5QTeNQD753k
6YtiRwFzIzfoksDnn+FxyPG3trMXT5C1vpfIEQQkQw==
=AT7A
-----END PGP SIGNATURE-----

--------------xdKWW7yVSjBylms73Qhhmri8--

