Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13119A28655
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882013.1292181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbXd-00019e-Pi; Wed, 05 Feb 2025 09:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882013.1292181; Wed, 05 Feb 2025 09:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbXd-000172-Ms; Wed, 05 Feb 2025 09:17:53 +0000
Received: by outflank-mailman (input) for mailman id 882013;
 Wed, 05 Feb 2025 09:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j99B=U4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfbXb-00016t-Qn
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:17:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12086d52-e3a2-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:17:50 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38db52ccc0fso269082f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 01:17:50 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5780sm18355580f8f.67.2025.02.05.01.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:17:48 -0800 (PST)
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
X-Inumbo-ID: 12086d52-e3a2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738747069; x=1739351869; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gM8AyR3hvUSrR1btMzIS6OKVLgkalIZIKiIQkWxjzbE=;
        b=Jj6nXIG5KvfQq/2uDRjIj5oHmfBzfQx1r9eBtPNe+wnyJPhz7p7bQiWAV2pFcLs7dv
         gip9dwaLIvuA3S9qyGbZ8LFvdoeS/J0Qstt11OM2Huq3QtyCENcSMuOcD7F9gzG2epCh
         wDdLLjHQwN4Nq6xIJI5NSj5GDtiI1pfw4F2WqgHKkqOMf4r6Yh3b1JxMd00VxX54aKLk
         6oVPW7pbQYwT8cmHkE1NFunhqAdLlfSpotZfZh26zFwSQ9Wa9Ek/98Kis7vgU2UoHcVx
         vDpq6IhTkNBT7zly7jAon8sDp2w3jMm99jEsuWcEes1ZL99ZBHeyNoiWZq1hG5RKnj4q
         qCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738747069; x=1739351869;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gM8AyR3hvUSrR1btMzIS6OKVLgkalIZIKiIQkWxjzbE=;
        b=s7oXQmstw7od+0LvYDKQY+cMRFKu48TPW2urUvKMazXwsXFKuSoTP7MaSfdQ/+PeyB
         2upR1QLYICfZU2VcCDHeGt0NvhCbMpmw8CrH163+5XOQHxhiyJj1Kq+SLycp9Fd/FTem
         AHzVNrCF6yPghFeFGb5vkIB38IT3KqVVVyYhS1TuOrz1wxQBsg9KQSGAs+lzmnt9UE3m
         qTNOKYSdWWq9Hi9PNg2izOrkqYauxisQDD7dw4+PuqCVz+wdCRPad69M8aRYktNn8Jz1
         6mHzVwxaAayAUlzGfuJPJKaD7zpqRAkWp3dqzI2XCbz+BdC7I3asu53xD4xBMAGItQNw
         S4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjYx2jri8MfkJmp7lTeacpuyQ8PHasmZE+kmxHT9l6pC096f8tlGwSI9AZ/7lIZ1XnOnGFZHNf/04=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJIdpo5/B2v49isPyDlEGS88iuu5TimLEAShrlTkHjsXiXCXK5
	Ub/PILaa1XKBKe123ojW/yAuMURD/q/CgXBEURhNDHzYTLEig75zaMqDs8VH5RQ=
X-Gm-Gg: ASbGncvStASr05sWyAeujkV7wohtjuBwD7rBdOiRdFriKUvry5Bnos0DD7VRik/bilI
	Uh7J255ns0+REApu9cbHxfsxPWrOfQUXhIVgx+T6QuIDI4FL1/3NAU9FvFU8PxAi/u6Wd29XE61
	CuH8OwfuF4Jp8d0VoWipKznxnIT7A0/Uy+O+rCBVhVjMXBNO3sG+857sF13gyLTbQHGGngBSZt5
	oG1HuJaoH6pmt5vQbuZDyoFxN1WnXZaP4qgfWjQDVABLv7fHcn+u1QJxpKvLtrqmb0rASxq/1Kh
	hF6IojD9AIZbvSdgZNdj07IReh+cpt/S+OQLKBslOdyybvnekwnNbZjquW2DCMtxNaRRw8jVprV
	YYH8076sHl2s74kjqjat0VHxVTRRZjc96XN92ZQ==
X-Google-Smtp-Source: AGHT+IF/jU3h5poPUwNtAaIGoBlTmeKbAUkjrRC3yeRjvC0ywwiulpx4PNzRX55ctqltiNij82VN3A==
X-Received: by 2002:a5d:47af:0:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-38db4869274mr1393566f8f.13.1738747069315;
        Wed, 05 Feb 2025 01:17:49 -0800 (PST)
Message-ID: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Date: Wed, 5 Feb 2025 10:17:47 +0100
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
In-Reply-To: <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4EKPz64cvrbYV0BSPDDtmlvb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4EKPz64cvrbYV0BSPDDtmlvb
Content-Type: multipart/mixed; boundary="------------B6dAU0TEgOBRRyBs4DW0h0Z9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
In-Reply-To: <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>

--------------B6dAU0TEgOBRRyBs4DW0h0Z9
Content-Type: multipart/mixed; boundary="------------dldE34BvM6erl3e7sY0S5VAc"

--------------dldE34BvM6erl3e7sY0S5VAc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDIuMjUgMTA6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA1LzAyLzIw
MjUgOToxMCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IHhlbl9oeXBlcmNhbGxfaHZt
KCksIHdoaWNoIGlzIHVzZWQgd2hlbiBydW5uaW5nIGFzIGEgWGVuIFBWSCBndWVzdCBhdA0K
Pj4gbW9zdCBvbmx5IG9uY2UgZHVyaW5nIGVhcmx5IGJvb3QsIGlzIGNsb2JiZXJpbmcgJXJi
eC4gRGVwZW5kaW5nIG9uDQo+PiB3aGV0aGVyIHRoZSBjYWxsZXIgcmVsaWVzIG9uICVyYngg
dG8gYmUgcHJlc2VydmVkIGFjcm9zcyB0aGUgY2FsbCBvcg0KPj4gbm90LCB0aGlzIGNsb2Ji
ZXJpbmcgbWlnaHQgcmVzdWx0IGluIGFuIGVhcmx5IGNyYXNoIG9mIHRoZSBzeXN0ZW0uDQo+
Pg0KPj4gVGhpcyBjYW4gYmUgYXZvaWRlZCBieSBub3QgbW9kaWZ5aW5nICVyYnggaW4geGVu
X2h5cGVyY2FsbF9odm0oKS4NCj4+DQo+PiBGaXhlczogYjQ4NDViYjYzODM4ICgieDg2L3hl
bjogYWRkIGNlbnRyYWwgaHlwZXJjYWxsIGZ1bmN0aW9ucyIpDQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgYXJjaC94
ODYveGVuL3hlbi1oZWFkLlMgfCAzICstLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L3hlbi94ZW4taGVhZC5TIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMNCj4+IGluZGV4IDky
NTI2NTJhZmU1OS4uNDM3OGI4MTdlZDMyIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYveGVu
L3hlbi1oZWFkLlMNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TDQo+PiBAQCAt
MTE3LDggKzExNyw3IEBAIFNZTV9GVU5DX1NUQVJUKHhlbl9oeXBlcmNhbGxfaHZtKQ0KPiAN
Cj4gVGhlIDMyYml0IGNhc2UsIG91dCBvZiBjb250ZXh0IHVwIGhlcmUsIGFsc28gY2xvYmJl
cnMgJWVieC4NCj4gDQo+IH5BbmRyZXcNCj4gDQo+PiAgIAlwb3AgJWVieA0KDQpJdCBkb2Vz
IG5vdCwgYXMgdGhpcyBwYXJ0IG9mIHRoZSBjb250ZXh0IGlzIHNob3dpbmcuDQoNCg0KSnVl
cmdlbg0K
--------------dldE34BvM6erl3e7sY0S5VAc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dldE34BvM6erl3e7sY0S5VAc--

--------------B6dAU0TEgOBRRyBs4DW0h0Z9--

--------------4EKPz64cvrbYV0BSPDDtmlvb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmejLLsFAwAAAAAACgkQsN6d1ii/Ey+y
Tgf8CXoNynVDZ3ixOTRF0go7j+MsXIzkIOgyJ4G6wEYjJviUQWoxmW+SbNVDEeyct4qmINTPUxvj
w714m3klNQArl6APJz9JNFYoyFpCa9a5DAM/30LyBAKWwPcoBgqAzkWF3abBp2wGcroY6CGVYwNU
XcHIBMwDd1WaEpLE0Q+5nQx6wiDJRrOdYi/+PTGwqr6+GJQVvXQHk1LYQqgsWVxQ7umAMWcKFe2l
xB5AxaP7RLzH0jFdyr1rWjtow17DfdGL8LHoQ0F2Syd9VgSMk++1VJetzfukSRrWOFhOtX1IRZHJ
MqZNTHcx5vHj4RkoQpWW0B/24IcE1eYIlHVgWDQmnA==
=2ebU
-----END PGP SIGNATURE-----

--------------4EKPz64cvrbYV0BSPDDtmlvb--

