Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6EDAF69B4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 07:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031704.1405459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCPZ-0004mU-Ss; Thu, 03 Jul 2025 05:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031704.1405459; Thu, 03 Jul 2025 05:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXCPZ-0004kV-Mo; Thu, 03 Jul 2025 05:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1031704;
 Thu, 03 Jul 2025 05:23:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQ52=ZQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uXCPY-0004kP-7h
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 05:23:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c833c091-57cd-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 07:22:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae0bde4d5c9so1388749866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 22:22:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c0100fsm1187120266b.88.2025.07.02.22.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 22:22:57 -0700 (PDT)
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
X-Inumbo-ID: c833c091-57cd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751520178; x=1752124978; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8EwaE3FH0NNlHLfw0t2wZfAXLtm+ytaPVoazJuXuYP8=;
        b=Q0eKJYhejwi6BJxd7R/J5ePvjHxhJuaoiDGDj6EN+vy73N3tWKKNfW3D0PGC6YI1Jk
         3B+KXlL60UoR7pCDlwGIR4o01aTNYVuQP0XulcN1a5yQay5Pf8pg3x+6grBf0qrLiY8R
         5jJJKHgVs3kDwJRnxWd5+JnY3JSjJTDJkR4RnJRDNiGTlaGC0vvKAC+9gynpZqWp0GVA
         P6/XrOgeyYfjoWldRRaqFQDuxykJmCMn/X62elAGzeisc57iKzKw7TbFSlRBcC+0OGWu
         Z+2IK4d34bzt89zZ2kIiT89Y4WBgnZIuO5DKlEltTfaGvgZf8wNsyEiKscOoC/BlVBTd
         uM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751520178; x=1752124978;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EwaE3FH0NNlHLfw0t2wZfAXLtm+ytaPVoazJuXuYP8=;
        b=H/jD0U+ff0A5VmkMk856GJime+WvJW1Ib3cB9Ul+cpKCLYuF4suCbUbC9/8WQ8tSEd
         VDs/pKVZgHbcDdhs7H4w+gzmNsBMRHNRVRXPd2uH2YTFOUmPypPeNtQEbervQK35ch+h
         8UTM+cnXS5kv7n94XSWi4WyC48XeIUA3SidCICLMlwUL00fbQbS8ZPCm4h15lhNPh4Bs
         55SvRQTV6ZmcRYmLTWmygR+f6j6+CTIezSq1pmn/J+RKHconjrmVPHZxf362OahYe6pM
         LYWLX5OmaO4gn+iCnT7TQcxSTzUjvaa27mDQnra0kjGMrcgzwsR736dhX9Y0qrd1z0XQ
         h+3A==
X-Forwarded-Encrypted: i=1; AJvYcCUbgjqN5tQR8sAcuGuYLbwPDLYrnaBjtMaN30DK86n6yUySYGkkQL2uod09uu0XOOMutapilw65cyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZbXkXzcNFcIqXHspM8mJ87+DbVs4diX0IilOQh+C6DYv5Zu1k
	wbHBA414B+5KhcPeQgPI9tWKbg+0is3swK7hZ8aLy8foEVIMYUQ7KQv1hQW7F8wOdo0=
X-Gm-Gg: ASbGncu1HR7ptP27HkLzFtQgj5dH3Hy7N67iG7vzfs5/FP6v88dxQAk+PDA1sYUA2nK
	G6X1nKbj3iJVZnOnRmBtUIL46x8HN1syE+HYPCF39goUGxhbAeZfNQn5KhBJSvIZnJ0JN+Nf8B/
	Zli7oZCZ3iUliEu37e33heILXSxYviNkxkMDtXyGQ7LZIbkKSWrx3UrToTzrhKOWpLfmdKEdHOj
	Rf2vhpFfM8gGBH2QUhnLMCnoXIHVoOZCBmDxxMRq37GbxS9bYlRS/QvoN97WXCIffzIq8tlVl/1
	n3OYDzSpmTCMUuzFy1i/DoLejaVijJYX4+QmDfsVzjptVfPImqh4kzICnxG8QwJ5wDzLJPDy2I0
	wbSmQJqRF8s25urJpT1PTKAnVu+3b9VuaT64Mqv+zKerAHEatwKw1fU6L/dm0geJwiJrXwtFXnb
	1YffnnRU+/
X-Google-Smtp-Source: AGHT+IG7tlXaO4AABs4BgP55fbaQAoRlS98ogEi5C2BJEJcxg2hT1vbYYkwKvp4A5t9rzDFCnbb8hQ==
X-Received: by 2002:a17:907:1b1e:b0:ad9:f54f:70a2 with SMTP id a640c23a62f3a-ae3d8446c70mr134228666b.22.1751520178139;
        Wed, 02 Jul 2025 22:22:58 -0700 (PDT)
Message-ID: <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Date: Thu, 3 Jul 2025 07:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
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
In-Reply-To: <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3Cll1DaVr7OfkJlxHy0kCHla"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3Cll1DaVr7OfkJlxHy0kCHla
Content-Type: multipart/mixed; boundary="------------ua5uUarjhplai0SCB0vAWChw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
Message-ID: <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
In-Reply-To: <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>

--------------ua5uUarjhplai0SCB0vAWChw
Content-Type: multipart/mixed; boundary="------------zAnwjxABmh2TIiab15TbxY6l"

--------------zAnwjxABmh2TIiab15TbxY6l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDcuMjUgMDA6NDIsIFR1IERpbmggd3JvdGU6DQo+IE9uIDAxLzA3LzIwMjUgMjM6
NTMsIEFiaW5hc2ggd3JvdGU6DQo+PiBIaSAsDQo+Pg0KPj4gVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGF0IG91dC4NCj4+DQo+PiBJIGhhdmVu4oCZdCBtZWFzdXJlZCB0aGUgcGVyZm9ybWFu
Y2UgaW1wYWN0IHlldCDigJQgbXkgbWFpbiBmb2N1cyB3YXMgb24NCj4+IGdldHRpbmcgcmlk
IG9mIHRoZSBzdGFjayB1c2FnZSB3YXJuaW5nIHRyaWdnZXJlZCBieSBMTFZNIGR1ZSB0bw0K
Pj4gaW5saW5pbmcuIEJ1dCB5b3UncmUgcmlnaHQsIGdudGRldl9pb2N0bF9ncmFudF9jb3B5
KCkgaXMgb24gYSBob3QNCj4+IHBhdGgsIGFuZCBjYWxsaW5nIGttYWxsb2MoKSB0aGVyZSBj
b3VsZCBkZWZpbml0ZWx5IHNsb3cgdGhpbmdzIGRvd24sDQo+PiBlc3BlY2lhbGx5IHVuZGVy
IG1lbW9yeSBwcmVzc3VyZS4NCj4+DQo+PiBJ4oCZbGwgcnVuIHNvbWUgYmVuY2htYXJrcyB0
byBjb21wYXJlIHRoZSBjdXJyZW50IGFwcHJvYWNoIHdpdGggdGhlDQo+PiBkeW5hbWljIGFs
bG9jYXRpb24sIGFuZCBhbHNvIGxvb2sgaW50byBhbHRlcm5hdGl2ZXMg4oCUIG1heWJlDQo+
PiBwcmUtYWxsb2NhdGluZyB0aGUgc3RydWN0IG9yIGxpbWl0aW5nIGlubGluaW5nIGluc3Rl
YWQuIElmIHlvdSBoYXZlDQo+PiBhbnkgaWRlYXMgb3Igc3VnZ2VzdGlvbnMgb24gaG93IGJl
c3QgdG8gYXBwcm9hY2ggdGhpcywgSeKAmWQgYmUgaGFwcHkgdG8NCj4+IGhlYXIgdGhlbS4N
Cj4+DQo+PiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIHRlc3QgdGhl
IHBlcmZvcm1hbmNlPw0KPj4NCj4+IEJlc3QsDQo+PiBBYmluYXNoDQo+Pg0KPj4NCj4gDQo+
IFByZWFsbG9jYXRpbmcgbWF5IHdvcmsgYnV0IEknZCBiZSB3YXJ5IG9mIHN5bmNocm9uaXph
dGlvbiBpZiB0aGUNCj4gcHJlYWxsb2NhdGVkIHN0cnVjdCBpcyBzaGFyZWQuDQo+IA0KPiBJ
J2QgbG9vayBhdCBvcHRpbWl6aW5nIHN0YXR1c1tdIHdoaWNoIHNob3VsZCBzYXZlIHF1aXRl
IGEgZmV3IGJ5dGVzLg0KPiANCj4gUmVkdWNpbmcgR05UREVWX0NPUFlfQkFUQ0ggY291bGQg
YmUgYSBsYXN0IHJlc29ydCwgYnV0IHRoYXQgbWF5IGFsc28NCj4gaW1wYWN0IHBlcmZvcm1h
bmNlLg0KDQpJTUhPIHRoZSBtb3N0IHByb21pc2luZyB3YXkgd291bGQgYmUgdG8gZHluYW1p
Y2FsbHkgYWxsb2NhdGUgdGhlIHN0cnVjdCwgYnV0DQpkb24ndCBmcmVlIGl0IGF0IHRoZSBl
bmQgb2YgdGhlIGlvY3RsLiBJbnN0ZWFkIGl0IGNvdWxkIGJlIHB1dCBpbnRvIGEgbGlzdA0K
YW5jaG9yZWQgaW4gc3RydWN0IGdudGRldl9wcml2LCBzbyBmcmVlaW5nIHdvdWxkIGJlIGRv
bmUgb25seSBhdCBjbG9zZSgpIHRpbWUuDQoNClN5bmNocm9uaXphdGlvbiB3b3VsZCBiZSBt
aW5pbWFsIChqdXN0IGZvciB0YWtpbmcgYSBmcmVlIHN0cnVjdCBmcm9tIHRoZSBsaXN0DQpv
ciBwdXR0aW5nIGl0IGJhY2sgYWdhaW4pLCB3aGlsZSBtZW1vcnkgdXNhZ2Ugd291bGQgYmUg
YmFzaWNhbGx5IGp1c3QgYXMgbmVlZGVkLA0KZGVwZW5kaW5nIG9uIHRoZSBudW1iZXIgb2Yg
Y29uY3VycmVudCB0aHJlYWRzIHVzaW5nIHRoZSBzYW1lIGZpbGUgZGVzY3JpcHRvcg0KZm9y
IHRoZSBpb2N0bC4NCg0KVGhpcyBhcHByb2FjaCB3b3VsZCBldmVuIGFsbG93IHRvIHJhaXNl
IEdOVERFVl9DT1BZX0JBVENILCBtYXliZSByZXN1bHRpbmcgZXZlbg0KaW4gYSBnYWluIG9m
IHBlcmZvcm1hbmNlLg0KDQpJJ2xsIHdyaXRlIGEgcGF0Y2ggaW1wbGVtZW50aW5nIHRoZSBh
bGxvY2F0aW9uIHNjaGVtZS4NCg0KDQpKdWVyZ2VuDQo=
--------------zAnwjxABmh2TIiab15TbxY6l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zAnwjxABmh2TIiab15TbxY6l--

--------------ua5uUarjhplai0SCB0vAWChw--

--------------3Cll1DaVr7OfkJlxHy0kCHla
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhmE7AFAwAAAAAACgkQsN6d1ii/Ey/H
Jgf9HsSGpvUS4KSg6Z0ARUwObBBdFUtEArcATha4dRjBAgj1vpq7coNQalpMoVUjpYfndcXn2X8L
3WzI+3ybxZpmKg+IuZNCT5XQJRM4kOpeSbPanRf5Czrdtpyv6yvOTIMJlkTreCjLaRu8De3GMm23
nJi1mf00bgLAutzddrW6F41qCZnTLo2jOMenZNeSyXdftxiXdrgeYHzE/EUcP1Vr26Hyn4Rl0wip
FzDD3VrzQKurcD7InTJ+R82wxbc5Ivkr710DGCwTbKhvcklimpikQXyx4UTo8udLkhopK2ystC+G
DFJh/Wb2269HUWQ5m6fwGxvvXhpZDP5QBW0nd/mdKw==
=guZt
-----END PGP SIGNATURE-----

--------------3Cll1DaVr7OfkJlxHy0kCHla--

