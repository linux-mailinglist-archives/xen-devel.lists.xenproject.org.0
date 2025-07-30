Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02366B1662C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 20:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064387.1430051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBSM-0006ZM-Be; Wed, 30 Jul 2025 18:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064387.1430051; Wed, 30 Jul 2025 18:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBSM-0006Xv-8d; Wed, 30 Jul 2025 18:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1064387;
 Wed, 30 Jul 2025 18:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhBSK-0006Xp-7c
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 18:23:12 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f6d0d2a-6d72-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 20:23:10 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aef575ad59eso13378466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 11:23:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a66852sm768985066b.71.2025.07.30.11.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 11:23:09 -0700 (PDT)
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
X-Inumbo-ID: 3f6d0d2a-6d72-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753899790; x=1754504590; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uZDQcUBpzxJ/JJkmWvqtmeGRPNL+KltYg+vQ3GQAtBE=;
        b=Q7i7K29pOw8/qgJI4l36Gvx3/EiBCoEBQ/SSQdMETNcdped0ap70jfuVGhdUo3PqPr
         UAo1bWFYLlzUaUzAd3BFsdFvWyZpeXzcA75JU+O5htt3Rp7UVuQGFquHXY9KCI6hAxrb
         jAyMqBaPsL0QPyOYxUTuG3gDwfmD4R1Y/DtJS616DRRocR06QgQGtOZxT41Rj4HhETe0
         tzd096J6b6jTBYfk+oJn5IW+SrMnUYYBpL52YDvrd6RnSr8r4MiXBdLGcuMehzONDHqk
         yEtLJGq8MGqQ1A15MwATK70JvIwvd9aZV2uTAX/ttFx3rDsL7rJwvOQTdZEELM/s/pra
         2S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753899790; x=1754504590;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZDQcUBpzxJ/JJkmWvqtmeGRPNL+KltYg+vQ3GQAtBE=;
        b=qWUxq2x0tL1OLlUT49XAL1om/NwnModX62qji8dIs5D7KDJVCxCjY1upQStgoc2P6O
         TESRvgzG49QFYQFHAGdKlb4EVxTtbGrw3+PL0QASuPz2+YWC7vx6woSidxtHIjawIF0w
         rcz9obRRVyUDb0s9Jqynk8TNE5voE97bScPbzyCSQJEua3xJE9kUxn/B4zmkaB/tOEmi
         IploUuGadTRz91qAHkLrtFXys5Q+aUNu95hzn7YPDuiWO2OZvreJtLxMxYJH4DJefzY6
         cICnWE/AtfzZvMB7ajhY3UCuW+q9o0HG9Dtk/Jv2e/MnUnQ8+zpJ+A0z5cl2tCkyJRFG
         yoag==
X-Gm-Message-State: AOJu0YyobmSKS+ljCrx6TDOcwhB1kQ+o+kwf+5hEFygj88xAW8wtqftK
	1zlP89qWW0ciz1g/xCQ/z2PUVpBrymYQjEio9vWjzDZ2eDYs3sDo28ZmO0SMw3Nv0dU=
X-Gm-Gg: ASbGnct7Pdl9PE3F6Aewe934dL944dayIBuNyh2Pxk5wPzO1agshI4RXD3bNZMw+pZP
	6Q5M5Tk6q1TiAv1O9oBzYOKKFJT2chOO8Q8M4tvq+r7IIFxCF8TMeXhI9zsQGNKwYXCMIFZNIxQ
	E5RWlmdKE92ycZNr1hWEUQtocQB1pdGbJGgM0UfHFE+bH5oESNtU1wvY4Gh3we7uxwMq+OqJ44L
	9X0ACuuKJ10Gf7Dl0xrTfNFItDpiKs7+njpZx2IJgnJ/2Sqwyz/5WlYnbMi4yRDSMu+RnNf4R8/
	G+SaJY4A7cmj6LL3D+6XwUYdNa9JBBcVhRKW6FVn5A2NRtq/AQTqeaoqTW2yXQMVtsCr0Dvnkyw
	6I8jCpPp7HBbQfoV1dICEizErgaCSHOoejDfWYfghyDtkPPIs8XmdeLRlAhfbywvqdgqLDCGWTE
	XyTB50TYwN6rnv6SQPuZ7UWZfsQPU6LB00C38gABQThQ==
X-Google-Smtp-Source: AGHT+IHqSczKAdl7xzC6/tjY9ucRwnmJtvXdQQuJ3mivpePF6vxByADMDwzQwKpLGiypg9UDNPdn2A==
X-Received: by 2002:a17:907:1b1a:b0:ae3:5d36:aa6b with SMTP id a640c23a62f3a-af8fd963852mr555942466b.36.1753899790146;
        Wed, 30 Jul 2025 11:23:10 -0700 (PDT)
Message-ID: <74fcd99c-ef1b-4fc1-a948-92c4fd702dd6@suse.com>
Date: Wed, 30 Jul 2025 20:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] tools: allow to limit xenstore features via guest
 config
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250725131928.19286-1-jgross@suse.com>
 <20250725131928.19286-8-jgross@suse.com> <aIpGjxj2vyMwUTBi@l14>
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
In-Reply-To: <aIpGjxj2vyMwUTBi@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------03XQnVMoyKcis1vmVilUE3C0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------03XQnVMoyKcis1vmVilUE3C0
Content-Type: multipart/mixed; boundary="------------Vv7bgEdCgcTu0WbXOJJ0inDR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <74fcd99c-ef1b-4fc1-a948-92c4fd702dd6@suse.com>
Subject: Re: [PATCH v2 7/7] tools: allow to limit xenstore features via guest
 config
References: <20250725131928.19286-1-jgross@suse.com>
 <20250725131928.19286-8-jgross@suse.com> <aIpGjxj2vyMwUTBi@l14>
In-Reply-To: <aIpGjxj2vyMwUTBi@l14>

--------------Vv7bgEdCgcTu0WbXOJJ0inDR
Content-Type: multipart/mixed; boundary="------------LwmW6o3oouKsU1epKEWzxcS2"

--------------LwmW6o3oouKsU1epKEWzxcS2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjUgMTg6MjEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBGcmksIEp1
bCAyNSwgMjAyNSBhdCAwMzoxOToyOFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tLmMgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX2RvbS5jDQo+PiBpbmRleCBhNjEwODVjYTNiLi4yYTc5MjM1MzNm
IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb20uYw0KPj4gKysr
IGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb20uYw0KPj4gQEAgLTQ5NCw2ICs0OTQsMTgg
QEAgcmV0cnlfdHJhbnNhY3Rpb246DQo+PiAgICAgICBpZiAoIXhzX3RyYW5zYWN0aW9uX2Vu
ZChjdHgtPnhzaCwgdCwgMCkpDQo+PiAgICAgICAgICAgaWYgKGVycm5vID09IEVBR0FJTikN
Cj4+ICAgICAgICAgICAgICAgZ290byByZXRyeV90cmFuc2FjdGlvbjsNCj4+ICsNCj4+ICsg
ICAgaWYgKGluZm8tPnhlbnN0b3JlX2ZlYXR1cmVfbWFzayAhPSB+MFUpIHsNCj4+ICsgICAg
ICAgIHVuc2lnbmVkIGludCBmZWF0dXJlczsNCj4+ICsNCj4+ICsgICAgICAgIGlmICh4c19n
ZXRfZmVhdHVyZXNfc3VwcG9ydGVkKGN0eC0+eHNoLCAmZmVhdHVyZXMpICYmDQo+PiArICAg
ICAgICAgICAgIXhzX3NldF9mZWF0dXJlc19kb21haW4oY3R4LT54c2gsIGRvbWlkLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZlYXR1cmVzICYgaW5mby0+
eGVuc3RvcmVfZmVhdHVyZV9tYXNrKSkgew0KPj4gKyAgICAgICAgICAgIExPRyhFUlJPUiwg
IkZhaWxlZCB0byBzZXQgWGVuc3RvcmUgZmVhdHVyZXMiKTsNCj4gDQo+IFN1cmx5IHhzX3tn
ZXQsc2V0fSogc2V0IGVycm5vIG9uIGZhaWx1cmUsIGFuZCB3ZSBrbm93IHRoZSBkb21pZCwg
Y2FuIHlvdQ0KPiB1c2UgTE9HRUQgZm9yIHRoZSBlcnJvciBtZXNzYWdlPw0KDQpPa2F5Lg0K
DQo+IA0KPj4gKyAgICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOw0KPiANCj4gVW5mb3J0
dW5hdGVseSwgdGhpcyBmdW5jdGlvbiBkb2VzIGFuIGFsbG9jYXRpb24gdGhhdCBpc24ndCBj
b2xsZWN0ZWQgaW4NCj4gR0MsIGB2bV9wYXRoYCBpcyBsZWFrZWQuIENvdWxkIHlvdSByZXBs
YWNlIHRoYXQgYnkgYHJjPUVSUk9SX0ZBSUw7IGdvdG8NCj4gb3V0O2AsIHRoZW4gcGxhY2Ug
b3V0OiBhdCB0aGUgcmlnaHQgcGxhY2UgYW5kIHJldHVybiBgcmNgIGF0IHRoZSBlbmQgb2YN
Cj4gdGhlIGZ1bmN0aW9uPw0KDQpZZXMsIG9mIGNvdXJzZS4NCg0KDQpUaGFua3MsDQoNCkp1
ZXJnZW4NCg==
--------------LwmW6o3oouKsU1epKEWzxcS2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------LwmW6o3oouKsU1epKEWzxcS2--

--------------Vv7bgEdCgcTu0WbXOJJ0inDR--

--------------03XQnVMoyKcis1vmVilUE3C0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiKYw0FAwAAAAAACgkQsN6d1ii/Ey+M
mgf/YuAThGmlvTmeX7yi6ELEJ1BGpHx+DNrpdhZOrbNiLWR/S26jDqJCBsEHdi4HuRMdRCkztDCe
HQ2rsBCd6pDutOavswvl8ot57HhZWQEEIvbdCsQBBzevD6xFw1dcotujFSkA15PyG7x8m9RnbReT
7DiFiKoXk3RHKj8/OZwGoQxAgqyWDppAtZbgiJA51KyEqSi/ksySceWp+/WbnNuRnWkjMz/BpeTw
2V799Lo56bXlmm8MJNdWYXztXlJHV6IdSTca8Q/85PrJQogAgjFkt2QwmwHebmIvKgSZOU1g7/7h
VIG3gVFp7eqN5JLn/uAXBnC0vrSywFZr2HIvsiRniw==
=4NY/
-----END PGP SIGNATURE-----

--------------03XQnVMoyKcis1vmVilUE3C0--

