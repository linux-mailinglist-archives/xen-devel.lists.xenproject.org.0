Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E18BD2B33
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142215.1476396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GL2-0007L4-Ol; Mon, 13 Oct 2025 11:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142215.1476396; Mon, 13 Oct 2025 11:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GL2-0007Ir-Lf; Mon, 13 Oct 2025 11:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1142215;
 Mon, 13 Oct 2025 11:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v8GL2-0007Il-39
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:03:36 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4317fe0a-a824-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:03:34 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-63963066fb0so8471496a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:03:34 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c1132fsm906868966b.54.2025.10.13.04.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:03:33 -0700 (PDT)
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
X-Inumbo-ID: 4317fe0a-a824-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760353414; x=1760958214; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8NQDWsfxASEiz0+qp9medjse/PS9XXknz8m7PUusrtw=;
        b=LKEWM2e52/DFYFlqmZ4SRiLMlWIOsUenxgYAualbPRi387rlTZ61zdOocSIYjXPAqU
         Ejlt3aErhJIORJk1BgrcXMdpm7ot6awfpDOD9WqRUpHzW3Uv0ck4IHjYXVcSG7yXdIEL
         nPQnbvcZ0+mAys2yDen6Dl62Tj7xVF3Nq0MzFFl2uqYFmMjo0mel/WrvWSYP70uzv0dZ
         XbEwXFk2KP20VjJcOs9dCYV4Gj40G+qRpis8a19gUezZh7SW96bv9oneY8Ja/vx1UQ+v
         F6enrzDenjlJ55D8lbobT//OuvqGIgMQjjWTxGQqU9nVlk174K+ef3GPaJAOHFGCuY2Y
         XvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353414; x=1760958214;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NQDWsfxASEiz0+qp9medjse/PS9XXknz8m7PUusrtw=;
        b=kQYrWp8AwtwAWY8bZIOxT+GF9jGQUUoL2iukhrU3frUS69TVupTjmUvTAZVNjO4fX3
         Autq+ecc5sXTK78Neujk8bHvrFDtLDY2oPMZhydK7FiQ9LkqNQVnpMD4AyZG8ngMDXin
         z08h3+Of6BDI3o1I+KRHmZUxCl7To78w28dyNBA/yur7hpQlN0HyMJ2heKjLaf68Likd
         8qR5j6P/LaxkyF/N9AOmVMLRUvgD882fHNN6S0TH4+01D47EMlRFNj/XAKCcEjm4xp7s
         9U2dUAcRwtmHcY6aE6BVC97FvYPpg2P1rpq10dalYBi8ZVnJHtaneja7ikH0hbG5MFMX
         bU5g==
X-Forwarded-Encrypted: i=1; AJvYcCXXkTTEwU0c25eXWtKZztmQYyfYXDwHtd87ZwvYmyW+KgAWJnPCNMy6UIFQ+/RjAEQgrOJEOBSIibU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx92z2kToFobA9JgcsE0VyQISHlFUux7oi63la8/cJjr5yL1+X+
	4qS8x+4spl0UdBYUeIh4IXqgGdcHYlhgPui5O/FWiccKbInXTVpXoOsDy4G4kYyRaMo=
X-Gm-Gg: ASbGnctGbn36Dvv0LhFnU4S0Z6wAx+4FUr7/+tm8ltWiPMkKT1H61XMaGLWfijT3Rpn
	AoG8uJWZknJabfnoA75wvwq75oCNru5noW2S/QUHKMFvMWY/j8wZ+l+AazrWnvqBs2N5dL4TnZg
	ilPC8l+84iUyXc+ncWt8+V9KflFOaai0JhV0IJWzebCy/q5ZyB+08Wu6Xzv9+5CRsyuQlJfYbxR
	0pMLFYmfuALF5ZYrMoiavcHXlF8rrWIVhpDu6LrqIeKZaM7Oc3mE8qyg+ykm8pawUd1nkywN8Ye
	AD2mXvLTAJBxnF03e1qZYPRiBrEXjTyrAQTsUYyjClmlra9QGN1d+TwM57nGfPLJmxFNdyR9aIW
	swdo5c93K1Sct1aCLq1R0GaoVTzX7o+/g/zt7TiwS/DAlyrm79l1xYRs3vfx4HTcbUrsjQeHyfv
	+E2eh1SRvV8D8QNEYJM5GGNQv8HbVSotdop0r6/kBkxaMEBl+y95F8srsqZJnTKBTtQbU4Y7M/G
	g==
X-Google-Smtp-Source: AGHT+IGpMkRN0f6pDuv2FYAYyiGvICESFBfJ9uXiNODmhxg1kg47U+hW2EVKAIcon85a5CXJlwp0Ew==
X-Received: by 2002:a17:907:3f8a:b0:b3e:5f40:9894 with SMTP id a640c23a62f3a-b50acb0e681mr2396447866b.62.1760353414170;
        Mon, 13 Oct 2025 04:03:34 -0700 (PDT)
Message-ID: <b2910a80-5dc0-475b-b49e-7d95560a2550@suse.com>
Date: Mon, 13 Oct 2025 13:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] xen/domctl: wrap sched_adjust() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>, Meng Xu <mengxu@cis.upenn.edu>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-19-Penny.Zheng@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eokBaFYjWhCNZpalNqJd3b6V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eokBaFYjWhCNZpalNqJd3b6V
Content-Type: multipart/mixed; boundary="------------FZ4vrsU00rUIaMZdoMaYgNf2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>, Meng Xu <mengxu@cis.upenn.edu>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <b2910a80-5dc0-475b-b49e-7d95560a2550@suse.com>
Subject: Re: [PATCH v3 18/28] xen/domctl: wrap sched_adjust() with
 CONFIG_MGMT_HYPERCALLS
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-19-Penny.Zheng@amd.com>
In-Reply-To: <20251013101540.3502842-19-Penny.Zheng@amd.com>

--------------FZ4vrsU00rUIaMZdoMaYgNf2
Content-Type: multipart/mixed; boundary="------------eVoVl10cuxP0R0N37UjokC6x"

--------------eVoVl10cuxP0R0N37UjokC6x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTAuMjUgMTI6MTUsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiBGdW5jdGlvbiBzY2hl
ZF9hZGp1c3QoKSBpcyByZXNwb25zaWJsZSBmb3IgWEVOX0RPTUNUTF9zY2hlZHVsZXJfb3Ag
ZG9tY3RsLW9wLA0KPiBzbyBpdCBjb3VsZCBiZSB3cmFwcGVkIHdpdGggQ09ORklHX01HTVRf
SFlQRVJDQUxMUy4NCj4gVHJhY2luZyBpdHMgY2FsbGluZyBjaGFpbiwgdGhlIGZvbGxvd2lu
ZyBmdW5jdGlvbnMgc2hhbGwgYmUgd3JhcHBlZCB3aXRoDQo+IENPTkZJR19NR01UX0hZUEVS
Q0FMTFMgdG9vOg0KPiAtIHNjaGVkX2FkanVzdF9kb20oKQ0KPiAtIHNjaGVkdWxlci1zcGVj
aWZpYyAuYWRqdXN0KCkgY2FsbGJhY2sNCj4gLSB4c21fc3lzY3RsX3NjaGVkdWxlcl9vcCgp
DQo+IE90aGVyd2lzZSBhbGwgdGhlc2UgZnVuY3Rpb25zIHdpbGwgYmVjb21lIHVucmVhY2hh
YmxlIHdoZW4gTUdNVF9IWVBFUkNBTExTPW4sDQo+IGFuZCBoZW5jZSB2aW9sYXRpbmcgTWlz
cmEgcnVsZSAyLjEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnku
WmhlbmdAYW1kLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCg0KSnVzdCBvbmUgZnVydGhlciByZW1hcmsgYmVsb3cgKG5vdCBm
b3IgdGhpcyBwYXRjaCkuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS94c20u
aCBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KPiBpbmRleCA0YzZlMGRjMGY5Li45ZGQ0ODU2
NDZhIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94c20veHNtLmgNCj4gKysrIGIveGVu
L2luY2x1ZGUveHNtL3hzbS5oDQo+IEBAIC01Niw4ICs1Niw4IEBAIHN0cnVjdCB4c21fb3Bz
IHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9t
Y3RsX2dldGRvbWFpbmluZm8gKmluZm8pOw0KPiAgICAgICBpbnQgKCpkb21haW5fY3JlYXRl
KShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBzc2lkcmVmKTsNCj4gICAgICAgaW50ICgq
Z2V0ZG9tYWluaW5mbykoc3RydWN0IGRvbWFpbiAqZCk7DQoNCkFzIHZpc2libGUgaW4gdGhp
cyBjb250ZXh0IC5nZXRkb21haW5pbmZvKCkgaXMgbm90IGhpZGRlbiB5ZXQsIHdoaWNoDQpJ
IHRoaW5rIGlzIHN0aWxsIHRydWUgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLCB3aGlsZSBJ
IGJlbGlldmUgaXQNCnNob3VsZCBiZSB1c2VkIGJ5IHN5c3RsL2RvbWN0bCBjb2RlIG9ubHku
DQoNCk9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nPw0KDQoNCkp1ZXJnZW4NCg==
--------------eVoVl10cuxP0R0N37UjokC6x
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------eVoVl10cuxP0R0N37UjokC6x--

--------------FZ4vrsU00rUIaMZdoMaYgNf2--

--------------eokBaFYjWhCNZpalNqJd3b6V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjs3IUFAwAAAAAACgkQsN6d1ii/Ey+A
sAgAhp4oqI9RNbHSxak2SkujcQ9rd8RllkYNegzjIm7q0q5Sqjj5bJcdSn0e80+WAOX5B/G+zbkb
iXHfYm7zCFE5Cw9s2XyfinYy+5pXa2hMkUSD3U0bPFbJYbaLTXaZjBe6jkTrvwGFgSm16ZMZMQFR
uGCM/4B3e77trrQRMvcFhYdJKup2+Yqq6PSbdiKHL0cCji5te/K+dSb1i3EkkJNmYZd53xN5Fqui
BWs0Ha14Pgt0Se4iuPbxPMQLpVyMjxXX7PCtfGmyBWzAgReq9GjVZNWFMSGCSQ+whBGu6o2EbLjS
0bGc6CeWWXojeddKtkrdk2MSe+oiCg1lNCAvqk5Qag==
=e76d
-----END PGP SIGNATURE-----

--------------eokBaFYjWhCNZpalNqJd3b6V--

