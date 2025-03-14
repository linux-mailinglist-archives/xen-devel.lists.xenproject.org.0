Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C48A61278
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914571.1320292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt4zL-0001i0-Pa; Fri, 14 Mar 2025 13:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914571.1320292; Fri, 14 Mar 2025 13:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt4zL-0001fL-Mk; Fri, 14 Mar 2025 13:22:11 +0000
Received: by outflank-mailman (input) for mailman id 914571;
 Fri, 14 Mar 2025 13:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tt4zK-0001fF-HH
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:22:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b8eb98-00d7-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:22:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so358239366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 06:22:07 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a46948sm223543166b.129.2025.03.14.06.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 06:22:06 -0700 (PDT)
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
X-Inumbo-ID: 53b8eb98-00d7-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741958526; x=1742563326; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LlXiK2cjvogS3pJ5JEWZYjx3dCxMh6HWKXRSQCcOkFA=;
        b=BCdA1itJMJdoKeBLl0RH4hGMcyDiy+d3jrJFGc1wBHqwGWvH1cHgdeQ4X/QEf3DX8Z
         cmE/12OUS8YC/ccY2OxVO5sT1PzKmYHni+nbE+L1aRfUYcOo7jfhEaHk9vFr3LlpAU+j
         S4+7PiV7IYgpTlEc3tFF6VpKvulYQFuSAG7Xkp7a5dmpjRyH059FEDGbeZ7YiOn+8icx
         wejzhYSsGhGa/K1+09AsUZDFyvnWn3l2wKkW3C4jhXqj7Gej3MxhSW3nzUi/krioB6pp
         HyqeWGZmWIytNdTJm+fcMRaIvRkZVT+aFCeos6KJ5xSpd/457SDShpFGxllkN1gLTJOO
         +3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958526; x=1742563326;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlXiK2cjvogS3pJ5JEWZYjx3dCxMh6HWKXRSQCcOkFA=;
        b=DJtDB/R71lBTK6hXSxtqvSplaM9fgw20ENzlmbtXGDKwCeCHeI3bJpZDtKvvVvF1wF
         7d22ens7ht9m+UwbqITvpQXuVPZMZ/+OVU+E8eg1eAb+B5g6BtvOksRBVGpBi9Zkmh6d
         PtzTkVWxIDLpPgeP2gCL7mnZm5Pj724NnjtYJu8RtisXCbaJX4FQEdKQ3/mqqep9FvqD
         gDk1oJ8DuC+0lH+AHsyN5v1ZzAUOtNij1OZQKOUz0LRMzjOPPlvq06gjfSuxKKTbWyuK
         pp6Wohlt2K/nF+u2rJMv+WXto4UACcFuUtMKSe7I6boerfYUpHQ5WjPFG1eRyAcMg54B
         TCPw==
X-Forwarded-Encrypted: i=1; AJvYcCXQS/ZtLK2fxq06QAfcHy53Te/w51yVHsGTFw/K7pZlgv4RcDQYNBbu643+rFAg3kNJnwOwNpeUF/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4UM/Ul7ZDw2mvcutDb8JGecLAd2xYBuowqHkgIuIG++tLbEgr
	9MgyXecrkarAJnigBc9ABYZulvQynooUp5mbBezcTrQFERcVCPC2JOe3Tpj/Y0L+cuCYbt8s+Bx
	B
X-Gm-Gg: ASbGnctztvd2236/EfaLo5T1C3qt5/ghD+IsO0fg51eFlYkT+GyVigrbourVjSo2W4x
	g4TGxan/h1cObiGvR2qUrAnRmdHvjpilsmWdTbUAI8LyDHAvUY3+x8mk6iA494CEuSGP8HzkUXD
	ienJIGS+qOBHHy3Vd1WGk55aNgJdRNudIUf+gmxP01SWJnyn8zaif1Rn/QPIEbIeHfN+uwAmx4G
	MaOKIzoC1grvwGUtClTAom0tExYVQ/trExok0fyx6cx6YiLG58PNHW6j4YUOeC/EQ4RLqhVV8hR
	0eXkTiFgnRzcPqKVIEpnDew9EK6TC/dcwYXfD2EevvR6vSzAlDThlCjRAyRl50A6dNUFAydjOxF
	Kh39oX0LG4HVsVbIjvCOrLXmRPKULSLzP5gnVn7I1NZZhBEZ2yKvuefXdAPKKuwyuBFs+ozsQot
	uQkw==
X-Google-Smtp-Source: AGHT+IEfL0Y1wxx3pYXIS75qmlQgk93tZw5TvmO7sbPlaNmn7FO61xLSuDM9nCQvtTXGakwhl60K6Q==
X-Received: by 2002:a17:907:94c7:b0:ac2:9b34:89f4 with SMTP id a640c23a62f3a-ac330272cf7mr218103766b.23.1741958526522;
        Fri, 14 Mar 2025 06:22:06 -0700 (PDT)
Message-ID: <c206ab6b-5e7e-4665-8480-d349831e427c@suse.com>
Date: Fri, 14 Mar 2025 14:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] tools/xenstored: use unique_id to identify new
 domain with same domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-3-jgross@suse.com>
 <ad4dc21c-c674-4e17-adac-b44aafff6149@amd.com>
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
In-Reply-To: <ad4dc21c-c674-4e17-adac-b44aafff6149@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OAQ5KC3gXOr1Vgy1toN9Gz1B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OAQ5KC3gXOr1Vgy1toN9Gz1B
Content-Type: multipart/mixed; boundary="------------MMrlfcAseRwHCIf7KUfp3uap";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <c206ab6b-5e7e-4665-8480-d349831e427c@suse.com>
Subject: Re: [PATCH v9 2/3] tools/xenstored: use unique_id to identify new
 domain with same domid
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-3-jgross@suse.com>
 <ad4dc21c-c674-4e17-adac-b44aafff6149@amd.com>
In-Reply-To: <ad4dc21c-c674-4e17-adac-b44aafff6149@amd.com>

--------------MMrlfcAseRwHCIf7KUfp3uap
Content-Type: multipart/mixed; boundary="------------20V0ALebovX9HwvZokuduai0"

--------------20V0ALebovX9HwvZokuduai0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDMuMjUgMTM6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDMt
MTQgMDg6MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBVc2UgdGhlIG5ldyB1bmlxdWVf
aWQgb2YgYSBkb21haW4gaW4gb3JkZXIgdG8gZGV0ZWN0IHRoYXQgYSBkb21haW4NCj4+IGhh
cyBiZWVuIHJlcGxhY2VkIHdpdGggYW5vdGhlciBvbmUgcmV1c2luZyB0aGUgZG9hbWluLWlk
IG9mIHRoZSBvbGQNCj4+IGRvbWFpbi4NCj4+DQo+PiBXaGlsZSBjaGFuZ2luZyB0aGUgcmVs
YXRlZCBjb2RlLCBzd2l0Y2ggZnJvbSAiZG9tX2ludmFsaWQiIHRvDQo+PiAiZG9tX3ZhbGlk
IiBpbiBvcmRlciB0byBhdm9pZCBkb3VibGUgbmVnYXRpb24gYW5kIHVzZSAiYm9vbCIgYXMg
dHlwZQ0KPj4gZm9yIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjg6DQo+PiAtIG5ldyBwYXRjaA0KPj4g
Vjk6DQo+PiAtIGFkYXB0IHRvIGRpZmZlcmVudCBMVS1yZWNvcmQgbGF5b3V0DQo+PiAtICJk
b21faW52YWxpZCIgLT4gImRvbV92YWxpZCIgKEphc29uIEFuZHJ5dWspDQo+IA0KPiBUaGFu
a3MuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0Bh
bWQuY29tPg0KPiANCj4gT25lIHRob3VnaHQgYmVsb3cuDQo+IA0KPj4gLS0tDQo+PiDCoCB0
b29scy94ZW5zdG9yZWQvZG9tYWluLmPCoMKgwqDCoMKgwqDCoMKgIHwgNjUgKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC94ZW5zdG9y
ZV9zdGF0ZS5oIHzCoCAzICstDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5z
dG9yZWQvZG9tYWluLmMgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+IGluZGV4IGE2
NTA2YTViYjIuLmZjMDk5MmQzYTUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQv
ZG9tYWluLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPiANCj4+IEBA
IC0xNzc4LDYgKzE4MTEsMTQgQEAgdm9pZCByZWFkX3N0YXRlX2Nvbm5lY3Rpb24oY29uc3Qg
dm9pZCAqY3R4LCBjb25zdCB2b2lkIA0KPj4gKnN0YXRlKQ0KPj4gwqDCoMKgwqDCoCBjb25u
LT5jb25uX2lkID0gc2MtPmNvbm5faWQ7DQo+PiDCoMKgwqDCoMKgIHJlYWRfc3RhdGVfYnVm
ZmVyZWRfZGF0YShjdHgsIGNvbm4sIHNjKTsNCj4+ICsNCj4+ICvCoMKgwqAgLyogVmFsaWRp
dHkgb2YgdW5pcXVlX2lkIHdpbGwgYmUgdGVzdGVkIGJ5IGNoZWNrX2RvbWFpbnMoKSBsYXRl
ci4gKi8NCj4+ICvCoMKgwqAgaWYgKChzYy0+ZmllbGRzICYgWFNfU1RBVEVfQ09OTl9GSUVM
RFNfVU5JUV9JRCkgJiYgZG9tYWluKSB7DQo+IA0KPiBJcyBpdCB3b3J0aCBhZGRpbmcgYSBz
YW5pdHkgY2hlY2sgZm9yIHRoZSBvdGhlciBiaXRzIGluIHNjLT5maWVsZHMgPT0gMD8NCg0K
RGVmaW5pdGVseSBub3QuIFVua25vd24gZmxhZ3MgY2FuIGJlIGlnbm9yZWQsIHRoZXkgc2hv
dWxkIG5ldmVyIHJlc3VsdA0KaW4gYW4gZXJyb3IuIE90aGVyd2lzZSBMVSB0byBhbiBvbGRl
ciBYZW5zdG9yZSBtaWdodCBub3QgYmUgcG9zc2libGUNCmFueSBsb25nZXIuDQoNCj4gQW5k
IGEgY2hlY2sgZG9tYWluICE9IE5VTEwgd2hlbsKgIFhTX1NUQVRFX0NPTk5fRklFTERTX1VO
SVFfSUQgaXMgc2V0Pw0KDQpObywgSSBkb24ndCB0aGluayBzby4gRmFpbGluZyBhIExVIGR1
ZSB0byBzdWNoIGEgY2FzZSB3b3VsZCBpbmhpYml0IHRoZQ0KcG9zc2liaWxpdHkgdG8gZml4
IHN1Y2ggYSBidWcgdXNpbmcgTFUuDQoNCg0KSnVlcmdlbg0K
--------------20V0ALebovX9HwvZokuduai0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------20V0ALebovX9HwvZokuduai0--

--------------MMrlfcAseRwHCIf7KUfp3uap--

--------------OAQ5KC3gXOr1Vgy1toN9Gz1B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfULX0FAwAAAAAACgkQsN6d1ii/Ey8y
VQgAitMdhlBGTNLVZM4G4+YU8a+tw82BE6Dhd6ID89pOqt/ckE0GsxN9hv30a0Vmbdrh5/CFwFUp
M58lzuW9cpy7bMkFQBa/GoN81vlMnKDhcIq2c5oordQql2Ss4PPl7tomvwcvTAPV2M5J11gSKcqY
ypEb+leAuho6IplBatZMW5IEQ4v/HU/uh36Ij7IZ6HEU8DcNOy+svSPv4WLvgE/RJL8oQ5iEjTwJ
2mG6IRMjbhzsn0YngnKhoZBZlKsUED/UCshSx/4xMKAqokgV2rPb6va4QrD5f1QKXQSv2hO7nb38
3LZCdyZr+MN7nr8+mxKtSVBYoIboqZ1UUWreLO1jlQ==
=zlRA
-----END PGP SIGNATURE-----

--------------OAQ5KC3gXOr1Vgy1toN9Gz1B--

