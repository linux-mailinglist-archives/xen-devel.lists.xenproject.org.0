Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86568C5D345
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 14:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162606.1490188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtPd-0003U9-MM; Fri, 14 Nov 2025 13:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162606.1490188; Fri, 14 Nov 2025 13:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtPd-0003Rr-HV; Fri, 14 Nov 2025 13:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1162606;
 Fri, 14 Nov 2025 13:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJtPb-0003Rl-O1
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 13:00:23 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1617eac-c159-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 14:00:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47728f914a4so12584905e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 05:00:22 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e442c2sm153392265e9.7.2025.11.14.05.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 05:00:21 -0800 (PST)
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
X-Inumbo-ID: e1617eac-c159-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763125222; x=1763730022; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hsdr8A63hSFiVP1VClfhpqSTpeJd7BNBTZOgYUIqDJc=;
        b=KFaAJxNJuXPr/+YyLX4aM4w95Nh3cObUktEgaAoG0jJR7WhtRMk/5zlktFwj1Adf3r
         1uridRr9ZJjQlQKaYVaBrvxFMGPO8hHTLs+cLyjKrVLqosjnC/IRlXEjSQrq4M6TyjWU
         C58NO2zz5ynxhGlOiNlKjZQdoXioQy2JShH4Xon/eSwWQiAizbKKREE1yRKraRq89VXc
         tlcpLbTD9AXa/MMHU1KEayq9vmQR38sIrgtEGQtC8m7X3eUb70Ge28VjIVUHLFTWPrfL
         /pbUUydIIbj7xJq+S5xNxdeLgd2Oq4trQRgVTOFY2t8S2ShvN+XsXGn6qEpq4AUsgUuU
         faNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125222; x=1763730022;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsdr8A63hSFiVP1VClfhpqSTpeJd7BNBTZOgYUIqDJc=;
        b=oQE4bwvW8hA4r0ye6DtwiAPQoW/NpY7xBQAsncPpR5fcPaUxOaRtiraex4AMjOVHOK
         9ByQLps4i6Gj9yKb5JfzK3bJ+RUd9hpoAfNraoR3u5Z9gU3DWEQLD0bzimes88IkrGsc
         ALk3fmk7faqA1OcJgjfzLkkVPRhgJwhide9nElsFUyMiTN5INtJPGDQ4ACnrknBgEgHe
         3ioIPXwBLmBhOL/AM3lK50vpy0quWclKitZ1ijr4zgEI9f3LJylCyXtFufpAtyrV5u7f
         zpYq8NyrkZX1soZtPVgsk41Xk+QlAtMr/8SZNIuX3PvLMrHWXmudXz730FJa4f7IKQAr
         96Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzdhKo0qArcIH4tt0vIZVVHXvYGstkNIOHpd02lKY5zS/NzD6AJHMle3Yp0YitIbae8r0B4CoJVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg0sGaHrq24lDAJYSI1IlUzSCjvVIQg2rQfoFfY673aV5Znalk
	1TTVz1EfGQ3BUI2b4HMShr3JUU7tfGh0b5QKVmw1az7GRLYpCLN6eAqu5Gf+zhhsx7c=
X-Gm-Gg: ASbGnctgJNrU4W4BJFgsQaDUflUL2S3NR+VZXHZI6ZNhrshWdQWp8r+r96reqepazDM
	bLXWxf+c346Azv8gkA4y0lsc6WqLUjOOPatP2vcsy9N/+cCkWkNnjDxnrUCIthkk7N6BGUX2U1Y
	IYaxznTshTA/NY3H3cy6DnI00H6vOPPedYlBaTK+1ZxF5MhOnwwPXAu08FMZri4Y1RnhjYGHFRd
	VQBWqUT3oyjH/hD9RU0XR/XTloPTU00b7pgvKLt/j5i/ngDaNpIPDS7FkiwcH5EtasOy4D8qBtl
	bSWz5/VQxuiCJ5GjirUt/pGxG+Yl2aj3QDSKDTdqauF23RQgv71vYyvJu4L0YZOqt9kyzYZZiik
	uSfusGsbCDJsskCCkMyV1j76CYKUnvj/KcMef18zYMungiqc2VxKZchpjCxizSJkwpc8aGHrbiR
	LOEfRJcrimUU+4vOh3kyJopuQ4XOXbIGb6udbTm5dODs/ZWxkIWFI2Osc3VhnpCvMytMYCo21KF
	NKu+j/dUeinDDNnm+B80PAH5pRTgXqDM2dw6MU=
X-Google-Smtp-Source: AGHT+IF1FCEtqCTCStv4bPYo5kBJWLhOvuw4icWZXsH3LZ9PyCb3q2+ktbKhqMfMtqsMZl5lxSWuPw==
X-Received: by 2002:a05:600c:354c:b0:475:daa7:ec60 with SMTP id 5b1f17b1804b1-4778fe95f49mr29142515e9.21.1763125222054;
        Fri, 14 Nov 2025 05:00:22 -0800 (PST)
Message-ID: <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
Date: Fri, 14 Nov 2025 14:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
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
In-Reply-To: <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HXrnP2V0k06AGGRPegkmwev0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HXrnP2V0k06AGGRPegkmwev0
Content-Type: multipart/mixed; boundary="------------OCcGYbBUnnNTDfoN5iwdFBk0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
In-Reply-To: <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>

--------------OCcGYbBUnnNTDfoN5iwdFBk0
Content-Type: multipart/mixed; boundary="------------hRaB2JpfKGZOAEOKGXmFBpxm"

--------------hRaB2JpfKGZOAEOKGXmFBpxm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjUgMTI6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE0LzExLzIw
MjUgMTE6MzIgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvZG9j
cy9NYWtlZmlsZSBiL2RvY3MvTWFrZWZpbGUNCj4+IGluZGV4IDM3Nzc2ZDMwM2MuLmU1ZjRh
OGNhODYgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL01ha2VmaWxlDQo+PiArKysgYi9kb2NzL01h
a2VmaWxlDQo+PiBAQCAtOCw4ICs4LDExIEBAIERBVEUJCTo9ICQoY2FsbCBkYXRlLCIrJVkt
JW0tJWQiKQ0KPj4gICBET0NfQVJDSEVTICAgICAgOj0gYXJtIHBwYyByaXNjdiB4ODZfMzIg
eDg2XzY0DQo+PiAgIE1BTl9TRUNUSU9OUyAgICA6PSAxIDUgNyA4DQo+PiAgIA0KPj4gK0lO
X0ZJTEVTIDo9IG1hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QgbWFuL3hsLW5ldHdv
cmstY29uZmlndXJhdGlvbi41LnBvZA0KPj4gK0lOX0ZJTEVTICs9IG1hbi94bC4xLnBvZCBt
YW4veGwuY2ZnLjUucG9kIG1hbi94bC5jb25mLjUucG9kDQo+IA0KPiBTb3JyeSwgSSBtZWFu
dCB0byBzYXkgdGhpcyBvbiB0aGUgcHJldmlvdXMgcmV2aXNpb24uwqAgQ2FuIHdlIHBsZWFz
ZSBsaXN0DQo+IHRoZXNlIG9uZSBwZXIgbGluZSwgZm9yIHRoZSBmdXR1cmUgZWFzZSBvZiBp
bnNlcnRpbmcvcmVtb3ZpbmcuDQoNCk9rYXkuDQoNCj4gSXMgSU5fRklMRVMgcmVhbGx5IGNv
cnJlY3Q/wqAgVGhlc2UgYXJlIHRoZSBnZW5lcmF0ZWQgKG5vbi0uaW4pIGZpbGVzLA0KPiBy
YXRoZXIgdGhhbiB0aGUgLmluIGZpbGVzIHRoZW1zZWx2ZXMuwqAgR0VOX0ZJTEVTIGZyb20g
djEgd291bGQgc2VlbSB0bw0KPiBiZSBhIGJldHRlciBmaXQuDQoNCkkgd2FudGVkIHRvIG1h
a2UgY2xlYXIgdGhpcyBpcyByZWxhdGVkIHRvICouaW4gZmlsZXMuIEFuZCBJTUhPIEdFTl9G
SUxFUw0Kd2FzIHRvbyBnZW5lcmljIG9uIGEgc2Vjb25kIHRob3VnaHQuDQoNCkdFTkVSQVRF
RF9GUk9NX0lOX1NVRkZJWEVEX0ZJTEVTIHNlZW1zIGEgbGl0dGxlIGJpdCBjbHVtc3kuIDst
KQ0KU2VyaW91c2x5LCBpZiB5b3UgaGF2ZSBhbnkgYmV0dGVyIG5hbWUsIEknZCBiZSBoYXBw
eSB0byB1c2UgaXQuDQoNCj4gQnV0LCBvdmVyYWxsIEkgdGhpbmsgdGhpcyBpcyBhIG5pY2Vy
IGNoYW5nZS4NCj4gDQo+PiArDQo+PiAgICMgRG9jdW1lbnRhdGlvbiBzb3VyY2VzIHRvIGJ1
aWxkDQo+PiAtTUFOLVNSQy15IDo9ICQoc29ydCAkKGJhc2VuYW1lICQod2lsZGNhcmQgbWFu
LyoucG9kIG1hbi8qLnBhbmRvYykpKQ0KPj4gK01BTi1TUkMteSA6PSAkKHNvcnQgJChiYXNl
bmFtZSAkKHdpbGRjYXJkIG1hbi8qLnBvZCBtYW4vKi5wYW5kb2MpICQoSU5fRklMRVMpKSkN
Cj4gDQo+IERvZXNuJ3QgdGhlIG1hbi8qLnBvZCB3aWxkY2FyZCBkbyB0aGlzIGFscmVhZHkg
Pw0KDQpOb3QgaWYgb25seSB0aGUgbWFuLyoucG9kLmluIGZpbGUgaXMgdGhlcmUsIHNvIHRo
ZSBtYW4vKi5wb2QgZmlsZSBuZWVkcyB0byBiZQ0KbWFkZSBmaXJzdC4NCg0KDQpKdWVyZ2Vu
DQo=
--------------hRaB2JpfKGZOAEOKGXmFBpxm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hRaB2JpfKGZOAEOKGXmFBpxm--

--------------OCcGYbBUnnNTDfoN5iwdFBk0--

--------------HXrnP2V0k06AGGRPegkmwev0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXJ+UFAwAAAAAACgkQsN6d1ii/Ey/s
dQf/R7cFQ7TuGwfG/ayi2HnEx94pJDRQ0SFhtSBPCO55b3ZDVJ4rjnVjdzinVd8x4vS4vUgMMorJ
Rmex8Dd/yTeTcQLficNR44T5wKvxacKaT5STO9IDkOrEhoRpsQmQ2rdbKYNMyDkI3SrucvKto+Sb
qyeeNCA2oe6a/maFMXrh7hNCMSuKC+DO8GxgTSr7q0F7td+JCkTX54u6V6IU6I8p6c4yLK8dhr1t
ucpRb9n2SWJbx3CMZDE0uLNVaTrUDcl9pnzc5Rw43EaGcP1b/mHZGkwrR9ege0IxKRj1v8giM38n
x0ErhoNEUoF+823RT34rJ8FglgUgoSmIVxRlGD/QpA==
=fbd9
-----END PGP SIGNATURE-----

--------------HXrnP2V0k06AGGRPegkmwev0--

