Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224199930B3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812160.1224874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpLO-00055V-Ki; Mon, 07 Oct 2024 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812160.1224874; Mon, 07 Oct 2024 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpLO-00052w-H6; Mon, 07 Oct 2024 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 812160;
 Mon, 07 Oct 2024 15:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sxpLN-00052q-I4
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:08:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fad3690c-84bd-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 17:08:16 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99415adecaso306013066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:08:16 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993a4ff9f7sm338512166b.26.2024.10.07.08.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 08:08:15 -0700 (PDT)
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
X-Inumbo-ID: fad3690c-84bd-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728313696; x=1728918496; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dA0ITAZ4qY/U9ajegJDv0otdEJUQKgUELyNEPoloRWw=;
        b=KyLI+TXYxB+e5/pn/QeK0rQWbx5AbneM54o5ECwi7cDxCpUY2KNpykOz7gn4qJL12Y
         NO/qCPo3Av+7MF27pTuROIx5E0R/xbwYL73Jzc43mjsSVzQh6tEt3pt1SEMwWWONrNPO
         cYFBnUThUX5jVEPqaqbZZ34befhlAqoSvmw/hdyyuSMJ6HLDjohZhgKLBPM66bSMe8Sc
         7ezC5xRV6n7XCfbo5zmyomJTqB9KmNW2XkidMIcFqs9Ftxwte4KGHmmv8vNoeU1RdJxL
         osv6PhJltx4YZZvOP52fVQubW76dRC7IjlxBNSExmHOzH/bDMQJ0vQAoqpCKvL92sQUG
         PBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728313696; x=1728918496;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dA0ITAZ4qY/U9ajegJDv0otdEJUQKgUELyNEPoloRWw=;
        b=NBhQPrHoyHTjF4OAvGgbEju1MawGGrzG6IXOtQi5g6wY4kFxMXMcwY2w9RbBn9pUOV
         gUfkWsiW5Ejg/uBfah5vA8AMnMmZu/IN7IAygDXRlGGqGCiXP+hHPcjMaZDhdmLozOB+
         dUO1Oz7w+ljVMwFPutGZcAgGFUcq83cQGPRKVwTUkClc+q6K61OiB0RA+nT9DACgTXG5
         zqaR0I3jpJflOZ9XcTvUDaNhcYXNjzAygPNFeAWNE3yfbFEv4AvPyr3H/OUpHjvRjXyr
         YY8d/UAX9sJn8JvBi8iSaKGfZ09RPlN8UGCVFgg2uh1HqxX4+OzRxwyDhMdXFmD4RLHY
         wf4w==
X-Gm-Message-State: AOJu0YyetHIhORhKxW9iThQCeb7UCJCjH2VK2ELHWX7qXtdMzquvpUGh
	ljHRfFUcGbjS1DhYVlh3pp0Kldl2zM2um2b7tXB5P3NFkNA0esiaNZ/LdVVO+QU=
X-Google-Smtp-Source: AGHT+IG3/hOgUyzhVHACqsRMupClv5bYxcfkZDTwYwSG5uRunlXVSBfPK9Guv3UbwGmjf4Qs9MlZ3w==
X-Received: by 2002:a17:906:d54c:b0:a8d:2fdb:b449 with SMTP id a640c23a62f3a-a990a05ef2emr1614084766b.16.1728313695842;
        Mon, 07 Oct 2024 08:08:15 -0700 (PDT)
Message-ID: <d373269c-8d9e-4470-bd5c-d694309ed10b@suse.com>
Date: Mon, 7 Oct 2024 17:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] stubdom: add fine grained library config items to
 Mini-OS configs
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-5-jgross@suse.com> <ZwPs44n9WlyPHo9q@l14>
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
In-Reply-To: <ZwPs44n9WlyPHo9q@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QIHa6DGlaZlhcZqtWBYl04rZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QIHa6DGlaZlhcZqtWBYl04rZ
Content-Type: multipart/mixed; boundary="------------RoWIdNJ8TB5FlPqO6mvO25IY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <d373269c-8d9e-4470-bd5c-d694309ed10b@suse.com>
Subject: Re: [PATCH 4/4] stubdom: add fine grained library config items to
 Mini-OS configs
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-5-jgross@suse.com> <ZwPs44n9WlyPHo9q@l14>
In-Reply-To: <ZwPs44n9WlyPHo9q@l14>

--------------RoWIdNJ8TB5FlPqO6mvO25IY
Content-Type: multipart/mixed; boundary="------------bUbp8rNETigncjQJ0IRiFGGf"

--------------bUbp8rNETigncjQJ0IRiFGGf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTAuMjQgMTY6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBTYXQsIE9j
dCAwNSwgMjAyNCBhdCAwNToxNTo0OFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3N0dWJkb20vTWFrZWZpbGUgYi9zdHViZG9tL01ha2VmaWxlDQo+
PiBpbmRleCA4YzUwM2MyYmY4Li4zYjUwMWEwNzEwIDEwMDY0NA0KPj4gLS0tIGEvc3R1YmRv
bS9NYWtlZmlsZQ0KPj4gKysrIGIvc3R1YmRvbS9NYWtlZmlsZQ0KPj4gQEAgLTM0MCw2ICsz
NDAsMTQgQEAgZW5kZWYNCj4+ICAgDQo+PiAgICQoZm9yZWFjaCBsaWIsJChTVFVCX0xJQlMp
LCQoZXZhbCAkKGNhbGwgQlVJTERfbGliLCQobGliKSkpKQ0KPj4gICANCj4+ICtkZWZpbmUg
QlVJTERfY29uZmlnDQo+PiArIGNwICQ8ICRADQo+PiArIGZvciBpIGluICQoc29ydCAkKEFQ
UF9MSUJTKSAkKGNhbGwgeGVubGlicy1kZXBlbmRlbmNpZXMsJChBUFBfTElCUykpKTsgZG8g
XA0KPj4gKyAgIHU9YGVjaG8gJCRpIHwgdHIgYS16IEEtWmA7IFwNCj4+ICsgICBlY2hvICJD
T05GSUdfTElCWEVOJCR1PXkiOyBcDQo+PiArIGRvbmUgPj4gJEANCj4+ICtlbmRlZg0KPiAN
Cj4gSSBkb24ndCB0aGluayBJIGxpa2UgaGF2aW5nIGEgcmVjaXBlIGhpZGRlbiBsaWtlIHRo
YXQgaW4gYSB2YXJpYWJsZSwNCj4gbWF5YmUgaWYgaXQgd2FzIGEgZnVsbCBydWxlIGl0IHdv
dWxkIGJlIGEgYml0IGxlc3MgYW5ub3lpbmcgdG8gbWUuIEJ1dA0KPiBob3cgYWJvdXQgc29t
ZXRoaW5nIHNsaWdodGx5IGRpZmZlcmVudDoNCj4gDQo+IEZpcnN0LCB0aGUgbmFtZSwgIkdF
Tl9jb25maWciIHdvdWxkIGJlIGEgYml0IGJldHRlciwgdGhlbiB3ZSBjb3VsZCBoYXZlDQo+
IGl0IG9ubHkgZG8gdGhlIG91dHB1dCBhbmQgbm90IHdyaXRpbmcgYW55IGZpbGU6DQo+IA0K
PiBkZWZpbmUgR0VOX2NvbmZpZw0KPiAgIChjYXQgJyQ8JyAmJiBcDQo+ICAgZm9yIGkgaW4g
JChzb3J0ICQoQVBQX0xJQlMpICQoY2FsbCB4ZW5saWJzLWRlcGVuZGVuY2llcywkKEFQUF9M
SUJTKSkpOyBkbyBcDQo+ICAgICB1PWBlY2hvICQkaSB8IHRyIGEteiBBLVpgOyBcDQo+ICAg
ICBlY2hvICJDT05GSUdfTElCWEVOJCR1PXkiOyBcDQo+ICAgZG9uZSkNCj4gZW5kZWYNCj4g
DQo+IFRoZSB0aGlzIGNhbiBiZSB1c2VkIGluIHJ1bGVzIGFzOg0KPiAgICAgICQoR0VOX2Nv
bmZpZykgPiAkQA0KPiANCj4gV291bGQgdGhhdCBiZSBvaz8NCg0KQWJzb2x1dGVseSBmaW5l
IHdpdGggbWUuDQoNCj4gKEl0IG1pZ2h0IGJlIGJldHRlciB0byBoYXZlIHRoZSBtYWNybyBu
b3QgZGVwZW5kcyBvbiB0aGUgZW52aXJvbm1lbnQNCj4gaGF2ZSB0YWtlIHBhcmFtZXRlciBl
eHBsaWNpdGx5IHdoaWNoIGNvdWxkIGJlIHVzZWQgYXMgJChjYWxsDQo+IEdFTl9jb25maWcs
JDwsZXZ0Y2huIGdudHRhYikgPiAkQCBvciB0YWtlIGEgdmFyaWFibGUgaWYgaXQncyB1c2Vm
dWwNCj4gZWxzZXdoZXJlLCBidXQgSSdtIGFscmVhZHkgZmluZSBpZiAkQCBpcyB0YWtlbiBv
dXQgb2YgdGhlIG1hY3JvLikNCj4gDQo+PiArDQo+PiAgIHhlbnN0b3JlL3N0YW1wOiAkKFhF
Tl9ST09UKS90b29scy94ZW5zdG9yZWQvTWFrZWZpbGUuY29tbW9uDQo+PiAgIAkkKGRvX2xp
bmtzKQ0KPj4gICANCj4+IEBAIC0zNzMsOCArMzgxLDEyIEBAICQoVEFSR0VUU19NSU5JT1Mp
OiBtaW5pLW9zLSU6DQo+PiAgICMgaW9lbXUNCj4+ICAgIyMjIyMjIw0KPj4gICANCj4+IC1p
b2VtdS1taW5pb3MtY29uZmlnLm1rOiAkKENVUkRJUikvaW9lbXUtbWluaW9zLmNmZw0KPj4g
LQlNSU5JT1NfQ09ORklHPSIkPCIgQ09ORklHX0ZJTEU9IiQoQ1VSRElSKS8kQCIgJChNQUtF
KSBERVNURElSPSAtQyAkKE1JTklfT1MpIGNvbmZpZw0KPj4gK2lvZW11LW1pbmlvcy5vdXQu
Y2ZnOiBBUFBfTElCUyA9IGV2dGNobiBnbnR0YWIgY3RybCBndWVzdA0KPj4gK2lvZW11LW1p
bmlvcy5vdXQuY2ZnOiAkKENVUkRJUikvaW9lbXUtbWluaW9zLmNmZyBNYWtlZmlsZQ0KPiAN
Cj4gQ291bGQgeW91IGNoYW5nZSB0aGUgc3VmZml4IHRvICIuZ2VuLmNmZyI/ICIub3V0LmNm
ZyIgaXMgYSBiaXQgZ2VuZXJpYw0KPiB3aGlsZSAiZ2VuZXJhdGVkIiBpcyBtb3JlIGNvbW1v
biBmb3IgdGhlIGtpbmQgb2YgZmlsZSB0aGF0IGFyZQ0KPiBhdXRvbWF0aWNhbGx5IGdlbmVy
YXRlZCBieSB0aGUgYnVpbGQgc3lzdGVtIGZvciBpdCdzIG93biB1c2UuDQoNCk9rYXkuDQoN
Cj4gDQo+IEJUVywgaW4gdGhlIGZpcnN0IHByZXJlcXVpc2l0ZSwgJChDVVJESVIpIGlzbid0
IG5lY2Vzc2FyeSBhbnltb3JlLCBpdA0KPiB3YXMgb25seSB0byBiZSB1c2VkIGluICJNSU5J
T1NfQ09ORklHIiBqdXN0IGJlbG93Lg0KDQpBaCwgcmlnaHQuIFdpbGwgcmVtb3ZlIGl0Lg0K
DQoNCkp1ZXJnZW4NCg==
--------------bUbp8rNETigncjQJ0IRiFGGf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bUbp8rNETigncjQJ0IRiFGGf--

--------------RoWIdNJ8TB5FlPqO6mvO25IY--

--------------QIHa6DGlaZlhcZqtWBYl04rZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcD+V8FAwAAAAAACgkQsN6d1ii/Ey++
LwgAh4Hv9ExnVdgbzABDPjqdS9osTjDV+OkgECqa4eBfkZCDqesuRaYcyUt89q3hvjY3Rq91RCTh
uS+CQADN7VcssJ177Gu+GcVnTR514SBds1HuU2J/pLiqcvylvvWO986bPXz6r7sH4JYn/lhbxFLd
kaQAX6SLzorJjKQxMtkGZnnBUJyI0JaenuSQ3xVQ/BQ3RQGXrgwDME1S922wQmlQQSBUTBEPbVt3
zU8LQNVBN1hY9tMvb+BT8xzcIrSX1uHoScmlev7/XjlULRPw2qG6/g1w9jXMkhr2pI5dbe1Jn1WV
otJOLDPhY7NrIGCvAH/JhByKlgO7m+NAh4Y1iak2hQ==
=s64H
-----END PGP SIGNATURE-----

--------------QIHa6DGlaZlhcZqtWBYl04rZ--

