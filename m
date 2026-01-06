Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D7CFA747
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 20:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196428.1514244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCLJ-00077Y-1S; Tue, 06 Jan 2026 19:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196428.1514244; Tue, 06 Jan 2026 19:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCLI-00074T-Ux; Tue, 06 Jan 2026 19:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1196428;
 Tue, 06 Jan 2026 19:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vdCLI-00074N-4V
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 19:03:44 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1adbe6-eb32-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 20:03:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so926535e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 11:03:41 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe83bsm6093014f8f.38.2026.01.06.11.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 11:03:40 -0800 (PST)
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
X-Inumbo-ID: 6a1adbe6-eb32-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767726220; x=1768331020; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+Xu68DwFwkgG0/Z5NJvQPYycTqVZCEroAP5k4c0kJI=;
        b=Gu3RjdcFEBDevzEY+KyBiw+IJf6FivLzpzSLbkAuUbcKvnppbJFfKIT29M8YPPasSM
         GbrFYo9oOEllss6hiC0NAISm/HiOqxDp0aT0g0sL+HgS8BV+MdKaS2pG9BqFoe5jXxlO
         HYDCLugoHQzKbn7/NgEUfv0k2KpUmupu+JD7Y6Pwk/mskazJ4uUFgimSBBpzb6csD0lz
         V5Z/iAw5BOCqc2+4OnsQ3aINDW3whc1mQQH60Z7YfCRcecLeTBWMcYGRKLwTYBN22VWL
         iSQkiYkCSNaYoWiYEU3DuvLDRZZR62dmnH4i8mVBL1EViHWNRdYS/xCtv+qJpXXj2x3t
         K63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726220; x=1768331020;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+Xu68DwFwkgG0/Z5NJvQPYycTqVZCEroAP5k4c0kJI=;
        b=gcV7EWpkPaT1fSnJYi4KF9H7hGs//HtPc41XDJWHwcn2xeHxNC/wL/d7mZbaTJVTb6
         Yco9cT3leH6w3qGP8zAMzSD/aPCAoPDXb8sZSM4+/G2TsIgHZuurozryuUooHN/VMHEF
         eetoh17z1xeQLK6ybevjPeu/vSjDlgEaFxgDIpg/KPWqRmHLF94bG0ampAJgbBpeP43N
         q4RhZnlY9IIhueLHUsS0X+nAWKKlZCiJES9a0yVSSvB8xPo3P7AAD+Hd5J7ds933x3Y1
         qjW4ZwM1W5uxXqaWFT4GWIYr4l5pDKzF29oOPqNrimtxKPdYMj7RTERLryRq9LX//I9K
         cTaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaQxianzqAjWrPfg00bzHuSxOUSys8N7Gv9C2TDHt+D95wm78eHM4kohKAbCwlOrutXQILs6v3obc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHDi+B85QNAs90+tYUGZ0bmQZpILPQHmyHhMDXzCV55jFRGkvL
	cjGkjAs71/xdtmx9QmejCVJLZHZ8GQPzFVcHYvlv/QVmDkn1Likj4BpWRbxWh1Ow/Hn+MYN7sGH
	NEBZU
X-Gm-Gg: AY/fxX6bKPVYxSJkUFCf2dBTtaTMEfaJ1vdTY3jGqj0kihD770P4D1kP2pJLcazeuZf
	x840uSaSdxwojC0uMd//pIcIGV97NwBRujL1rdb4GZGVAHefgeOr4xLi+l8BO8FDdPyAQLzdeXn
	2zjo21t/b6Fz4da3F/tY4qvz1bvZKleb9/J6WI1xqK3cgBn7uqNThljl+WYZLm3+yE3ovqL1nhQ
	7S7tQtJCUiCJVZoZvK8mhn/+M9ujVfYQsvwoo/LTxuW6ftAsLMwGfm5rLtxThk70NAW7K3Lc6en
	2EHxdiaZe0QuyDQVkCX/N5y8vf4pKBgeGOKCp5fot2JHbWHhR6URVBneeQlc6IomxNLSLLNOxxX
	lLmzwpCcsEDL07sQCTOJeEWNWIwmCkbpDuHtXSudeD733dqPG4FhxCeyjVsGCgeX+uvjQBSnpw0
	RA3FF3G8PICVIIe8Xzn3ECZu/aiA4mX5pRUARQTNg8aAuuX0i/MhYVV4X4RJ6Y8u7k1Z5XerCOO
	Ulz6I6w3BVFjejVmMHCEyTAND/ERV5UBqyN1sHclT7Ug2dXTw==
X-Google-Smtp-Source: AGHT+IG8bUdVuI3KS2XmPpuQ5KCfWx6gX6ioAPAQUlFi5yYAp+HLTgbxAT8hDsm+XpoIvgYcZw6s/w==
X-Received: by 2002:a05:600c:8215:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-47d8486cd41mr1743975e9.10.1767726220532;
        Tue, 06 Jan 2026 11:03:40 -0800 (PST)
Message-ID: <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
Date: Tue, 6 Jan 2026 20:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/virtio: Don't use grant-dma-ops when running as Dom0
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
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
In-Reply-To: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mPWVaRT2wREt8jkdOEqELTr7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mPWVaRT2wREt8jkdOEqELTr7
Content-Type: multipart/mixed; boundary="------------omsVVH3QFyb0fambBJ2fQ7w1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
Subject: Re: [PATCH] xen/virtio: Don't use grant-dma-ops when running as Dom0
References: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
In-Reply-To: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>

--------------omsVVH3QFyb0fambBJ2fQ7w1
Content-Type: multipart/mixed; boundary="------------RyHkulx8kllKBGfO0OZZGJIu"

--------------RyHkulx8kllKBGfO0OZZGJIu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDEuMjYgMTg6MzYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBEb20wIGluaGVyaXQg
ZGV2aWNlcyBmcm9tIHRoZSBtYWNoaW5lIGFuZCBpcyB1c3VhbGx5IGluIFBWIG1vZGUuDQo+
IElmIHdlIGFyZSBydW5uaW5nIGluIGEgdmlydHVhbCB0aGF0IGhhcyB2aXJ0aW8gZGV2aWNl
cywgdGhlc2UgZGV2aWNlcw0KPiB3b3VsZCBiZSBjb25zaWRlcmVkIGFzIHVzaW5nIGdyYW50
cyB3aXRoIERvbTAgYXMgYmFja2VuZCwgd2hpbGUgYmVpbmcNCj4gdGhlIHNhaWQgRG9tMCBp
dHNlbGYsIHdoaWxlIHdlIHdhbnQgdG8gdXNlIHRoZXNlIGRldmljZXMgbGlrZSByZWd1bGFy
DQo+IFBDSSBkZXZpY2VzLg0KPiANCj4gRml4IHRoaXMgYnkgcHJldmVudGluZyBncmFudC1k
bWEtb3BzIGZyb20gYmVpbmcgdXNlZCB3aGVuIHJ1bm5pbmcgYXMgRG9tMA0KPiAoaW5pdGlh
bCBkb21haW4pLiBXZSBzdGlsbCBrZWVwIHRoZSBkZXZpY2UtdHJlZSBsb2dpYyBhcy1pcy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50
ZWNoPg0KPiBGaXhlczogNjEzNjc2ODhmMWZiMCAoInhlbi92aXJ0aW86IGVuYWJsZSBncmFu
dCBiYXNlZCB2aXJ0aW8gb24geDg2IikNCj4gLS0tDQo+IENDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+DQo+IENDOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5
c2hjaGVua29AZXBhbS5jb20+DQo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJv
dnNreUBvcmFjbGUuY29tPg0KPiANCj4gICBkcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMg
fCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMg
Yi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4gaW5kZXggMTQwNzdkMjNmMmExLi5j
MjYwM2U3MDAxNzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMu
Yw0KPiArKysgYi9kcml2ZXJzL3hlbi9ncmFudC1kbWEtb3BzLmMNCj4gQEAgLTM2Niw3ICsz
NjYsOCBAQCBzdGF0aWMgaW50IHhlbl9ncmFudF9pbml0X2JhY2tlbmRfZG9taWQoc3RydWN0
IGRldmljZSAqZGV2LA0KPiAgIAlpZiAobnApIHsNCj4gICAJCXJldCA9IHhlbl9kdF9ncmFu
dF9pbml0X2JhY2tlbmRfZG9taWQoZGV2LCBucCwgYmFja2VuZF9kb21pZCk7DQo+ICAgCQlv
Zl9ub2RlX3B1dChucCk7DQo+IC0JfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19YRU5f
VklSVElPX0ZPUkNFX0dSQU5UKSB8fCB4ZW5fcHZfZG9tYWluKCkpIHsNCj4gKwl9IGVsc2Ug
aWYgKCF4ZW5faW5pdGlhbF9kb21haW4oKSAmJg0KPiArCQkgICAoSVNfRU5BQkxFRChDT05G
SUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVCkgfHwgeGVuX3B2X2RvbWFpbigpKSkgew0KPiAg
IAkJZGV2X2luZm8oZGV2LCAiVXNpbmcgZG9tMCBhcyBiYWNrZW5kXG4iKTsNCj4gICAJCSpi
YWNrZW5kX2RvbWlkID0gMDsNCj4gICAJCXJldCA9IDA7DQoNClBsZWFzZSBtYWtlIHRoaXMg
Y29udHJvbGxhYmxlLCBlLmcuIHZpYSBhIGJvb3QgcGFyYW1ldGVyLg0KDQpJdCBpcyBjb21w
bGV0ZWx5IHZhbGlkIHRvIGhhdmUgYSB2aXJ0aW8gZGV2aWNlIGluIGRvbTAgd2l0aCB0aGUg
YmFja2VuZCBpbg0KYSBkb21VLiBZb3UnbGwgbmVlZCBncmFudHMgaW4gdGhpcyBjYXNlLg0K
DQoNCkp1ZXJnZW4NCg==
--------------RyHkulx8kllKBGfO0OZZGJIu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RyHkulx8kllKBGfO0OZZGJIu--

--------------omsVVH3QFyb0fambBJ2fQ7w1--

--------------mPWVaRT2wREt8jkdOEqELTr7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmldXIsFAwAAAAAACgkQsN6d1ii/Ey9f
ZQgAgmCrByeGPni0rvsTkjNLY7fpws/bJL1Eaej2na2F+fUBfpwS+DB9Irek8aCyh0FlF7uVP4do
5D1DOBU8c28SKCuQlDYs6rRzk3SySvEgW8+Lwn9d6HS7zbDtWwQqnIBh6oDlwP2w6HPYnXpgBOn0
2kS/nAvaVNvXnUAA81YSWYhf4rUBpFvdnD88y31QzZLi+6oh8tPmimIIAEZNNj2Np/v5SElRhrY0
Qsuu6oGS/AAnh103zdGiTGQjrvV5JeBRPou6V8JmgGhrrFAJdMshoYYXwzYc2jONpYTv9vDy+lxX
pWFodW9gBxL5mwICwC1AOClBAdaBMMNFnJtdRdrV/g==
=zU/j
-----END PGP SIGNATURE-----

--------------mPWVaRT2wREt8jkdOEqELTr7--

