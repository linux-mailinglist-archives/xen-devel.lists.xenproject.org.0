Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E149754E5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796669.1206418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNtk-0000WK-UF; Wed, 11 Sep 2024 14:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796669.1206418; Wed, 11 Sep 2024 14:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNtk-0000Uo-RS; Wed, 11 Sep 2024 14:00:44 +0000
Received: by outflank-mailman (input) for mailman id 796669;
 Wed, 11 Sep 2024 14:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fXQY=QJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1soNtj-0000Uf-4I
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:00:43 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3acebbd9-7046-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 16:00:42 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so5580892e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:00:40 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cdf7sm5431068a12.92.2024.09.11.07.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:00:38 -0700 (PDT)
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
X-Inumbo-ID: 3acebbd9-7046-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726063240; x=1726668040; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/JKYO7CdgAbC/iLvor2XP5kWiB70OZbXEOCwhBXick=;
        b=KA4zhs2v7Cykwaom/dOug2bySMeJKAmbTsFXRhIQ6eX9OKZNQgaVXWsfWVS+vsjjwH
         1HA5pcR6t/fhq5kPGZNDa0T0DDMrpD8WGf2eKr4bD6V09fpKOUdDY7eFc5QCZgvPbeHD
         at2g0p65SCdJtp/aEJPFVDZGp0WIkqU0gRnLfRnBxd5RRHioYwXK5mVepeIvMgtxZyHy
         dS5Cklcl3fB6p0AX9WxR6PqiBlruKp18MSZ4BfTVcirf7jJ+HZnIIBo3tODeXbfpEwXb
         3qTnbhHN3VOO8Zc2Stn8107u2gGGojcZ+v1auYuYxFKXEYs1KnP0ShJMNDH2lPSGQNJq
         f81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063240; x=1726668040;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/JKYO7CdgAbC/iLvor2XP5kWiB70OZbXEOCwhBXick=;
        b=pwnkUuq0MUDMGaqHSeApXepMBt4HSDjMeF9D/HaduCxwVTMjcRnVWzG6URpw+dQwJA
         /BDntWnEfoUXdTd+4T3hFk5e+docMvzqsVmZI/OWdALKUK1LnTZHLMnzmMqXXeprrnTT
         v9s97j/3vMyWjQekPNkYh0yr7pkUMqwRCbTb8P7Z9WpdISGVGlwJSszWrgKkdfiph1ZK
         7mAEaMy3Fzcdh/gnuBibxiL+WYnMSlBLb34vDvgiEkw4wAx5dB9UylTgILeO6lZE/MTX
         PYJpE3oiZv5mj8hdQqRMWvOdQ5EYWC7er9ezRkIezAi69Fk4srSh77lUEEnP1mLw3/tF
         XjZA==
X-Forwarded-Encrypted: i=1; AJvYcCUyC+5+QLHuFb2ymccaZdnD+ELDQymApJkaPerQ1OUlTKeyCvC7g1aKkJso3SWv5tnS9bI2gsEbUZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO2ZfPBGePseKCFcQTwQIhbxLufSwIy7bha6JGTBE+MzdtOsJi
	NJzVvz/R/rJzx61pe0HGL8QPFDOryxyTzAsjcN+I4VIUd5P3m7Hr7DIEd1jqkWM=
X-Google-Smtp-Source: AGHT+IH7hmJKFZ6j5pZhBxLqaiTLvtoNTyHXIl7LvQYP4FOzSAobwRL3jO0y6YKNaVPF0yCpFeirLw==
X-Received: by 2002:a05:6512:39cb:b0:52e:fd53:a251 with SMTP id 2adb3069b0e04-53658816d37mr9775485e87.59.1726063239221;
        Wed, 11 Sep 2024 07:00:39 -0700 (PDT)
Message-ID: <904b08c9-3213-4f3f-8b06-38d1a15afca2@suse.com>
Date: Wed, 11 Sep 2024 16:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
To: Andrei Stan <andreistan2003@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20240705145910.32736-3-andreistan2003@gmail.com>
 <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
 <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
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
In-Reply-To: <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7UucJdFav8AnGzIWYDdNuclL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7UucJdFav8AnGzIWYDdNuclL
Content-Type: multipart/mixed; boundary="------------zptcxCEMP8mA9QRNW6qIWokz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrei Stan <andreistan2003@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <904b08c9-3213-4f3f-8b06-38d1a15afca2@suse.com>
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
References: <20240705145910.32736-3-andreistan2003@gmail.com>
 <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
 <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
In-Reply-To: <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>

--------------zptcxCEMP8mA9QRNW6qIWokz
Content-Type: multipart/mixed; boundary="------------CCMEPsJjj70yXq3bOqz0mKIX"

--------------CCMEPsJjj70yXq3bOqz0mKIX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDcuMjQgMTg6MDUsIEFuZHJlaSBTdGFuIHdyb3RlOg0KPiBPbiBGcmksIEp1bCA1
LCAyMDI0IGF0IDY6MjLigK9QTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOg0KPj4NCj4+IE9uIDA1LjA3LjI0IDE2OjU5LCBBbmRyZWkgU3RhbiB3cm90ZToNCj4+
PiBDdXJyZW50bHkgb25seSBzaGFyZWQgbGlicmFyaWVzIGJ1aWxkIHdpdGggVVNFX1BUSFJF
QUQgZW5hYmxlZC4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWFjcm8gYWxzbyB0
byB4cy5vLg0KPj4+DQo+Pj4gQmFja3BvcnQ6IDQuMTgrICMgbWF5YmUgb2xkZXINCj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZWkgU3RhbiA8YW5kcmVpc3RhbjIwMDNAZ21haWwuY29tPg0K
Pj4NCj4+IENvbW1pdCBkZGUzZTAyYjcwNjggZGlkIHRoYXQgZXhwbGljaXRseSwgc3RhdGlu
ZyB0aGF0IHBodHJlYWRzIGFyZQ0KPj4gbm90IGNvbXBhdGlibGUgd2l0aCBzdGF0aWMgbGlu
a2luZy4NCj4+DQo+PiBXYXMgdGhhdCByZWFzb25pbmcgd3Jvbmc/DQo+Pg0KPj4gSnVlcmdl
bg0KPj4gLS0tDQo+Pj4gLS0tDQo+Pj4gICAgdG9vbHMvbGlicy9zdG9yZS9NYWtlZmlsZSB8
IDEgKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4+DQo+Pj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvc3RvcmUvTWFrZWZpbGUgYi90b29scy9saWJzL3N0
b3JlL01ha2VmaWxlDQo+Pj4gaW5kZXggMDY0OWNmODMwNy4uYzZmMTQ3YzcyZiAxMDA2NDQN
Cj4+PiAtLS0gYS90b29scy9saWJzL3N0b3JlL01ha2VmaWxlDQo+Pj4gKysrIGIvdG9vbHMv
bGlicy9zdG9yZS9NYWtlZmlsZQ0KPj4+IEBAIC0yMCw2ICsyMCw3IEBAIENGTEFHUyArPSAt
aW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9jb25maWcuaA0KPj4+ICAgIENGTEFHUyArPSAk
KENGTEFHU19saWJ4ZW50b29sY29yZSkNCj4+Pg0KPj4+ICAgIHhzLm9waWM6IENGTEFHUyAr
PSAtRFVTRV9QVEhSRUFEDQo+Pj4gK3hzLm86IENGTEFHUyArPSAtRFVTRV9QVEhSRUFEDQo+
Pj4gICAgaWZlcSAoJChDT05GSUdfTGludXgpLHkpDQo+Pj4gICAgeHMub3BpYzogQ0ZMQUdT
ICs9IC1EVVNFX0RMU1lNDQo+Pj4gICAgZW5kaWYNCj4gDQo+IEl0IHdhcyBhIHByZXR0eSBu
YXN0eSBzaXR1YXRpb24sIGdpdmluZyBzb21lIGNvbnRleHQsIHRoaXMgaXMgZm9yIGEgR28g
YmFzZWQgQ0xJDQo+IHRvb2wgYW5kIHNvbWUgdGhpbmdzIGluIHRoZXJlIGFyZSBtdWx0aXRo
cmVhZGVkLCBidXQgaSBkb24ndCB0aGluaw0KPiBjYWxsaW5nIGluIHRoZQ0KPiBiaW5kaW5n
cyBoYXBwZW5zIGFueXdoZXJlIGluIHBhcmFsbGVsLiBXaXRob3V0IHRoaXMgcGF0Y2ggdGhl
cmUgd291bGQgYmUNCj4gc29tZSBzb3J0IG9mIHJhY2UgY29uZGl0aW9ucyAob3Igc28gSSBh
c3N1bWUgZnJvbSB0aGUgZGVidWdnaW5nIGkndmUgZG9uZSkNCj4gaGFwcGVuaW5nIHdpdGhp
bmcgdGhlIHhlbi90b29scyBjb2RlLCBtYWtpbmcgaXQgaW1wb3NzaWJsZSB0byBzdGFydCBh
IGRvbWFpbi4NCj4gDQo+IEluIHRoaXMgY2FzZSB0aGVyZSB3ZXJlIG5vIGlzc3VlcyBpbiBs
aW5raW5nIHB0aHJlYWRzIHN0YXRpY2FsbHkuIEkgd2FzIG5vdCBldmVuDQo+IGF3YXJlIG9m
IHRoYXQgYmVpbmcgYSBwb3NzaWJsZSBpc3N1ZS4gSXMgaXQgcmVhbGx5Pw0KDQpJIGRvbid0
IGtub3cuIFNhaWQgY29tbWl0IHN1Z2dlc3RzIGl0IGF0IGxlYXN0IHdhcyBhbiBpc3N1ZSBp
biB0aGUNCnBhc3QuIE5vIGlkZWEgd2hhdCB3YXMgd3Jvbmcgd2l0aCBpdCBhbmQgd2hldGhl
ciB0aGUgc2l0dWF0aW9uIGhhcw0KY2hhbmdlZCBzaW5jZSB0aGVuLg0KDQpBbm90aGVyIHF1
ZXN0aW9uOiB3aHkgYXJlIHlvdSBsaW5raW5nIHN0YXRpY2FsbHk/IER5bmFtaWMgbGlua2lu
ZyBzZWVtcw0KdG8gYmUgdGhlIHN0YW5kYXJkIGZvciBHby4NCg0KPiBBbHNvIEkgYW0gbm90
IHRvbyBzdXJlIGhvdyBtdWNoIHRoYXQgY29kZSBwYXRoIGlzIGFjdHVhbGx5IHRlc3RlZCwg
cHJvYmFibHkgdGhlDQo+IG1ham9yaXR5IG9mIHRoZSB0ZXN0aW5nIGlzIGRvbmUgd2l0aCBk
eW5hbWljIGJ1aWxkcy4NCg0KSSB0aGluayBzbywgeWVzLiBJJ20gbm90IGF3YXJlIG9mIGFu
eSB0ZXN0cyB1c2luZyBzdGF0aWMgbGlicmFyaWVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------CCMEPsJjj70yXq3bOqz0mKIX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CCMEPsJjj70yXq3bOqz0mKIX--

--------------zptcxCEMP8mA9QRNW6qIWokz--

--------------7UucJdFav8AnGzIWYDdNuclL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbhooYFAwAAAAAACgkQsN6d1ii/Ey8l
Bwf+MhRCnzDZrueKPIk3HmfzA7Ro1cDw/4MdMCaIU1/hF1LIBpAe3mnhs6mdiGWr57fBhwZviwrR
eJ02Fi8KAncD8kDgAw3oTiep/4zauyzAV4ZxVTb54wD81I3QMzZozPrzGkY0f1/wHNP8LnijTXok
/w+SvodtRKg10RVlX1F4tK+rJtKpeTL9bqxppXijKNcatvIUBa/zRiKXY8L+0SB2F8vPMcZlHYM2
8LHL4gPKb1SETjzXc0LWQ8zP3MQxKNbGNZkQPg7qGQ72+GObelRrSqxK5POS/ilosKc/OqJwga1/
HZlrsBQlxXwFiDLqCZz4N+fGBYhEPDOp6ofqXtxlRg==
=eY0U
-----END PGP SIGNATURE-----

--------------7UucJdFav8AnGzIWYDdNuclL--

