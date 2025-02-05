Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F55A2874B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882061.1292236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcGu-0002WD-4L; Wed, 05 Feb 2025 10:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882061.1292236; Wed, 05 Feb 2025 10:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcGu-0002Ts-1c; Wed, 05 Feb 2025 10:04:40 +0000
Received: by outflank-mailman (input) for mailman id 882061;
 Wed, 05 Feb 2025 10:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j99B=U4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfcGs-0002Tm-U1
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:04:39 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b327c7a-e3a8-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 11:04:37 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38daa53a296so770727f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 02:04:37 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1016easm18276934f8f.24.2025.02.05.02.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:04:35 -0800 (PST)
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
X-Inumbo-ID: 9b327c7a-e3a8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738749876; x=1739354676; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zw61F9gNWRDsJgHmwiwLIXpCKfGINWqLRx7Xz0waxKE=;
        b=bDWDpgntsYc4ADDZ3SEmkgCbU0Kds14ZoVCnzotyIm1bYYIF93drb3ZrTMuXxSDXiZ
         TjfQVziRhRSrSiachpizCrUWKCttp28d+CdI2G8trSsv4p4wDxhMWaFGcQwHf0dsEMYj
         EeZX8o06LZoDgcegIiPuei8bM5SgJ2odugTaNRtP8/0cZfgd/q0YC54b9cRIj66sZC4i
         3ENvu/LFzHOVfWPUxVkgxkdktsegvy3eQodUzpV1YbcrbKIVkfJcjxxs/Pks/+GV9kKG
         FLUPAXh66RMCl2duvNg+cBi3ygjlX08x0uNHN/tgnWfgxjLiseg1hqP1aQc+tsMqpmXZ
         MAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749876; x=1739354676;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zw61F9gNWRDsJgHmwiwLIXpCKfGINWqLRx7Xz0waxKE=;
        b=uTn++oN/94stkiNQIpiMGoqyO8XdJzK49PWV0Jyb7HlqEE4GnC10OsXKS6jUOOm8oS
         eytCHVb10CCmyu43X+Zn9lgcEGnO9O3XjjicczAfGu+QvIgV4hbrs5ppUeQCVKYpyju/
         kX/eKrxOq8JIweE6QSENaxuZ+TSWwzpiJ/QqlK+1pMPQASrmWH3VrgJ4S3BpwIbwZdfF
         nSUpuk+bTDa3/L9WqoI825YOMItC5rtsRjMVhid8BFjYVE1T2DG/D3ntkXYVA/URclGP
         wj0Ag8SoI6x3Bucsb05OJEqSj/xpQVRpwH80AePJ3oHd85dLPGvTjH/LMi6A4FiQ688n
         ddew==
X-Forwarded-Encrypted: i=1; AJvYcCUSLpzs6VvPAUypPuVOFofn/2hhX09CCdKIkWR+3eyHJ8I8Sx/xyT5+wtk9KHYqpzH+jBYAQbjeJdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGR9jiL42mg1irVZ51QLcCtSWjJnL8fufQwbonW9iCVopul6b0
	Ur5J3f5XFcY2spujsZPJ+wQz0CzP1060tO3UDsPhgt9s07MjDWXcirTR5d9XT7w=
X-Gm-Gg: ASbGncu9SZizugV1O3H2mz/EyrB8CxqMQA9MTBfU2clMt+z9YL+G/GEN5atVU9AfzIQ
	R3zBhNAkaVf1WvEIjbcUEJSgHruBbmo0EB357OOkgILI5gxJXaM26+opaXJod++y6a+Ogu5tqXl
	yvOJqR9zAoDFCKdh0so4FrxLirjyI0rASI4ZV77MPOXABNzRlEt10wAw9D+8ZDKS7pK5rHTBD5n
	wHFKLmqSe9C8Kkb1sXcD4K+SWJt/mKJxRxU7VkX3hWwDUt6nO3UcBPt5TJ+ccLWv2Rd/Jsc9Tz0
	vlWNu0daJKnLZUuDnkncID6Ub5nWbcnkwKCOkfKCSIPIM20DYF2qpg/eIg4VkNzEZqB/cQx2Xun
	4gNUO+LBto4+/qeLUG86ZyzU6m3CidKFa+iSVIA==
X-Google-Smtp-Source: AGHT+IGwBiFvM0zx5e2BnKoS0Gh/BiImC7t5tJC4F5GEYLIZr9jW2ZYGFNghwc6ar4dzbwT2fO+DJw==
X-Received: by 2002:a5d:6d0e:0:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-38db490e466mr1721929f8f.38.1738749876111;
        Wed, 05 Feb 2025 02:04:36 -0800 (PST)
Message-ID: <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
Date: Wed, 5 Feb 2025 11:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
 <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
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
In-Reply-To: <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YVhbn2eiTwP8MwZW1x80b2Pm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YVhbn2eiTwP8MwZW1x80b2Pm
Content-Type: multipart/mixed; boundary="------------fN1U4fRxqP8wFGPQ4LS3sYDE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
 <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
In-Reply-To: <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>

--------------fN1U4fRxqP8wFGPQ4LS3sYDE
Content-Type: multipart/mixed; boundary="------------TWv0UmArgKymMd90uPhiPDC6"

--------------TWv0UmArgKymMd90uPhiPDC6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDIuMjUgMTA6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzAyLzIw
MjUgOToxNyBhbSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDA1LjAyLjI1IDEwOjE2
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDA1LzAyLzIwMjUgOToxMCBhbSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4geGVuX2h5cGVyY2FsbF9odm0oKSwgd2hpY2ggaXMg
dXNlZCB3aGVuIHJ1bm5pbmcgYXMgYSBYZW4gUFZIIGd1ZXN0IGF0DQo+Pj4+IG1vc3Qgb25s
eSBvbmNlIGR1cmluZyBlYXJseSBib290LCBpcyBjbG9iYmVyaW5nICVyYnguIERlcGVuZGlu
ZyBvbg0KPj4+PiB3aGV0aGVyIHRoZSBjYWxsZXIgcmVsaWVzIG9uICVyYnggdG8gYmUgcHJl
c2VydmVkIGFjcm9zcyB0aGUgY2FsbCBvcg0KPj4+PiBub3QsIHRoaXMgY2xvYmJlcmluZyBt
aWdodCByZXN1bHQgaW4gYW4gZWFybHkgY3Jhc2ggb2YgdGhlIHN5c3RlbS4NCj4+Pj4NCj4+
Pj4gVGhpcyBjYW4gYmUgYXZvaWRlZCBieSBub3QgbW9kaWZ5aW5nICVyYnggaW4geGVuX2h5
cGVyY2FsbF9odm0oKS4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGI0ODQ1YmI2MzgzOCAoIng4Ni94
ZW46IGFkZCBjZW50cmFsIGh5cGVyY2FsbCBmdW5jdGlvbnMiKQ0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAg
wqAgYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCAzICstLQ0KPj4+PiAgwqAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhl
YWQuUw0KPj4+PiBpbmRleCA5MjUyNjUyYWZlNTkuLjQzNzhiODE3ZWQzMiAxMDA2NDQNCj4+
Pj4gLS0tIGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMNCj4+Pj4gKysrIGIvYXJjaC94ODYv
eGVuL3hlbi1oZWFkLlMNCj4+Pj4gQEAgLTExNyw4ICsxMTcsNyBAQCBTWU1fRlVOQ19TVEFS
VCh4ZW5faHlwZXJjYWxsX2h2bSkNCj4+Pg0KPj4+IFRoZSAzMmJpdCBjYXNlLCBvdXQgb2Yg
Y29udGV4dCB1cCBoZXJlLCBhbHNvIGNsb2JiZXJzICVlYnguDQo+Pj4NCj4+PiB+QW5kcmV3
DQo+Pj4NCj4+Pj4gIMKgwqDCoMKgwqAgcG9wICVlYngNCj4+DQo+PiBJdCBkb2VzIG5vdCwg
YXMgdGhpcyBwYXJ0IG9mIHRoZSBjb250ZXh0IGlzIHNob3dpbmcuDQo+IA0KPiBIbW0sIHNv
IGl0IGlzLCBhbmQgd29yc2UsIGl0IGNhbid0IGJlIGNoYW5nZWQgdG8gbWF0Y2ggdGhlIDY0
Yml0IHNpZGUuDQo+IFRoYXQncyBuYXN0eS4NCj4gDQo+IEJ1dCB3aGlsZSBJJ20gaGVyZSBs
b29raW5nIGF0IHRoZSBjb2RlLCB3aGF0J3MgdXAgd2l0aA0KPiANCj4gI2lmZGVmIENPTkZJ
R19GUkFNRV9QT0lOVEVSDQo+ICDCoMKgwqDCoMKgwqDCoCBwdXNocSAkMMKgwqDCoMKgwqDC
oMKgIC8qIER1bW15IHB1c2ggZm9yIHN0YWNrIGFsaWdubWVudC4gKi8NCj4gI2VuZGlmDQo+
IA0KPiA/DQo+IA0KPiBUaGF0J3MgY292ZXJlZCBieSBGUkFNRV97U1RBUlQsRU5EfSBub3Jt
YWxseSwgYW5kIExpbnV4J3MgcHJlZmVycmVkDQo+IHN0YWNrIGFsaWdubWVudCBpcyA4IG5v
dCAxNi4NCg0KSSd2ZSBhZGRlZCB0aGlzIGR1ZSB0byBhIHJldmlldyBjb21tZW50IGJ5IEph
bi4gQXMgaGUgaXMgbW9yZSBpbnRvIEFCSQ0KbWF0dGVycywgSSBiZWxpZXZlZCBoaW0uDQoN
Ckdvb2dsZSBpcyB0ZWxsaW5nIG1lIHlvdSBhcmUgcmlnaHQsIHNvIEknbGwgcmVtb3ZlIHRo
b3NlIGV4dHJhIGh1bmtzIGluDQpWMiBvZiB0aGUgcGF0Y2ggYWRkaW5nIEZSQU1FX0VORC4N
Cg0KDQpKdWVyZ2VuDQo=
--------------TWv0UmArgKymMd90uPhiPDC6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TWv0UmArgKymMd90uPhiPDC6--

--------------fN1U4fRxqP8wFGPQ4LS3sYDE--

--------------YVhbn2eiTwP8MwZW1x80b2Pm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmejN7IFAwAAAAAACgkQsN6d1ii/Ey/b
IAf7BhwOZ8KY8OSd49htfzY9MVWffA7IumpbqDRLgHag1B6nBLXNzSqOW3N1ZPfBiPJc67WeZt0z
gzqUANh6mMy6ua0pl6nbgZf0c/Mk8BVMdS76EBGdu0GTdBrzbZsRBJcOjlSydM3d8zNGYZqD7SNp
tJL70aKJuce5uvFQTExj6ETzqQW5BG+fcXfqSH7/jJCooh5Dny0k/K4krvJWhZKOR1dsi3IqxE/N
gBTsboKbM04JUC7rz6qwtZRBNyyxcYCpTN11F9phXjO8DFlR8YCNmLUG1GEriYZYDrt2I8ZcbsyY
ndwIY5Ahuld+WBWn5FzZ5AXdozwg1RY1p3amIocJxA==
=yWB2
-----END PGP SIGNATURE-----

--------------YVhbn2eiTwP8MwZW1x80b2Pm--

