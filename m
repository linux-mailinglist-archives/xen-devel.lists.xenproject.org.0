Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3ABC5D360
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 14:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162612.1490197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtQE-0003vD-1r; Fri, 14 Nov 2025 13:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162612.1490197; Fri, 14 Nov 2025 13:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtQD-0003tf-UX; Fri, 14 Nov 2025 13:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1162612;
 Fri, 14 Nov 2025 13:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJtQC-0003lZ-T5
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 13:01:00 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f72e0d64-c159-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 14:00:59 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3108f41fso1098009f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 05:00:59 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8d6sm10150616f8f.28.2025.11.14.05.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 05:00:58 -0800 (PST)
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
X-Inumbo-ID: f72e0d64-c159-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763125259; x=1763730059; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KrYekWE9QP4DwuqGrXoP6T25EPtwJa39aEh6se9fFYk=;
        b=CR5gL8EytBZrk4jJYqaIOLbZuke0C3X7m21cU3gjfZvIxkWGYm10YOkchuxz6IXHMn
         mVhuNwFhmZRFTcKqu+VTCw06Ck4IC11KkOqVGFhIQBIEibjdvYis6QL9JIYv9QqJ8TRj
         6xzIeIVr47tXMbf/S1uN4R/r49v/FqW5vAqFF3BGPIZMQ/c+k4MRd9QBVLN7VpT6nacT
         Gcb76+dRSHhovP3ajT2jWMd4mo8i2qA8w7O+D+Sb1QxA4ZpbFCW7BwVQuMT0IbgouEeB
         weNpTv+aQj8qxiar0pulnWt1NmbvXSkq6fjJo1v2AI3t63BrUTGjkpJvfMeOl9RNHADF
         x5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125259; x=1763730059;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KrYekWE9QP4DwuqGrXoP6T25EPtwJa39aEh6se9fFYk=;
        b=M/NHu4eFSCaUjpH4x7MC5eR5sxalwuJCrqOrYp96o+OL5biN1GQ2pvagByNlp9+SRJ
         c0Y73Yfec1wQBsGkawdo+dq7ivjFMniwhE3GLzIwRfIbCzJWOrb171JKTOsUb6I0S7R3
         8q3531zTajAicW7ABtxr2w4sywKHo0Xcw010Aj26Mn8O+9ymuA8TN/SScF+FqMlPDiff
         NT9H84ztFQ/yajYgj3f/ki88vvD/ZGatDS4lEr646G7nLq6E0s11bg44WeaIkoao8zX5
         Sd6WyOXj6ln49wTVQqq/r6kvwK+tuN6SIe258oiW3zdqFVg+tAN7hjSAKo/Tfs2k9KpD
         xACA==
X-Forwarded-Encrypted: i=1; AJvYcCVimhyOA6KbisvqRlKx/Qs36CxQxKO6TgIMwrxvDDeopKEIW0+QgW1VguIuIpbkZlEIMO0A+QRMnMQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn2TquZHpBr/vNGufL770JTZbkTj47sujQDF9Efxr0zIeoCaoq
	HnGuplmWwlEd2s4+NeiLket+y/l5wxVuqutTrn7vrMkFTUyjvjKIT/wh2QVVd3bZSkc=
X-Gm-Gg: ASbGncvUT+vXZgFRr1xTmWNyqmwOOrrw3b1fMRthvXalpUMzO5noWEBzqbq6O4E4v20
	5lgJfDUKiopdbgNMokBF5LvJmKDACVZRQ2uShakigYvTrtMK9fcyZFnLIq3hwX96IzMhGcleCKF
	uhtFmA3IPlDhlUwO3Cgra+yKz4RAR+CkQ7U8ZedZY7yGCMKOz/ViT1OKSvq/lHLM/n78Vf8YRfb
	nL4Hemnz+Yg17EzlGvddE3M3zaXavCtm4f5m7OsEvpcd+0oR7ElFi+4AMsHYkPP7PN2zlv71kAA
	jfeFi0Z5SIgzOmdmnPgH6wx2wjLCALt3K+55y21qkiy3aip+yRJ87hWE0qPyxTDSsoqLQhADibg
	4Dt5DU0i5aRzfRq7pV8fPSipHsiOLLMmPrG3vmtgWCI70FwbsufJ/dcILiImN/9iDxa06oqOZSJ
	g7yct/7aMzkKsOYG4yymAQKCBdfyuNYldlRmYNr12GNgtZCTWFiNzZdeK9UXCJt2ZQEnww6PiQN
	OoKdg3IaQcU2G9Vq26Qy3uo+0B6VTEvS5hiCRk=
X-Google-Smtp-Source: AGHT+IHJqHamiLrMiGOkQdxJEZ1m7aA2YtJtzlJRW5rbwmPMGJi5b7GWJVTlG9xZoCEL5WmkDdoKSQ==
X-Received: by 2002:a05:6000:2912:b0:42b:31a5:f065 with SMTP id ffacd0b85a97d-42b5934e90bmr2984813f8f.28.1763125258539;
        Fri, 14 Nov 2025 05:00:58 -0800 (PST)
Message-ID: <09723aa8-bcb7-4f3f-9b9e-5bb626c1fb98@suse.com>
Date: Fri, 14 Nov 2025 14:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] config: remove unused paths from
 config/Paths.mk.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-4-jgross@suse.com>
 <ed64037e-99a6-4059-9ebf-92402e78ded7@citrix.com>
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
In-Reply-To: <ed64037e-99a6-4059-9ebf-92402e78ded7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TOhxe0MRoMkgr4kokDrYPu31"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TOhxe0MRoMkgr4kokDrYPu31
Content-Type: multipart/mixed; boundary="------------tr0hGHChJyJwY6p9ihQ242xI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <09723aa8-bcb7-4f3f-9b9e-5bb626c1fb98@suse.com>
Subject: Re: [PATCH v2 3/4] config: remove unused paths from
 config/Paths.mk.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-4-jgross@suse.com>
 <ed64037e-99a6-4059-9ebf-92402e78ded7@citrix.com>
In-Reply-To: <ed64037e-99a6-4059-9ebf-92402e78ded7@citrix.com>

--------------tr0hGHChJyJwY6p9ihQ242xI
Content-Type: multipart/mixed; boundary="------------626GTB6ywReT6q0uvuePqYzE"

--------------626GTB6ywReT6q0uvuePqYzE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjUgMTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE0LzExLzIw
MjUgMTE6MzIgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBTb21lIHBhdGhzIGluIGNv
bmZpZy9QYXRocy5tay5pbiBhcmUgdXNlZCBub3doZXJlLCBzbyByZW1vdmUgdGhlbS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
PiAtLS0NCj4+ICAgY29uZmlnL1BhdGhzLm1rLmluIHwgNSAtLS0tLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvY29uZmlnL1Bh
dGhzLm1rLmluIGIvY29uZmlnL1BhdGhzLm1rLmluDQo+PiBpbmRleCBiYzQyNzQ4YjdhLi42
Njg1NDViZTJmIDEwMDY0NA0KPj4gLS0tIGEvY29uZmlnL1BhdGhzLm1rLmluDQo+PiArKysg
Yi9jb25maWcvUGF0aHMubWsuaW4NCj4+IEBAIC0yMCwxMCArMjAsNyBAQCBsaWJleGVjZGly
ICAgICAgICAgICAgICAgOj0gQGxpYmV4ZWNkaXJADQo+PiAgIGRhdGFyb290ZGlyICAgICAg
ICAgICAgICA6PSBAZGF0YXJvb3RkaXJADQo+PiAgIG1hbmRpciAgICAgICAgICAgICAgICAg
ICA6PSBAbWFuZGlyQA0KPj4gICBkb2NkaXIgICAgICAgICAgICAgICAgICAgOj0gQGRvY2Rp
ckANCj4+IC1kdmlkaXIgICAgICAgICAgICAgICAgICAgOj0gQGR2aWRpckANCj4+ICAgaHRt
bGRpciAgICAgICAgICAgICAgICAgIDo9IEBodG1sZGlyQA0KPj4gLXBkZmRpciAgICAgICAg
ICAgICAgICAgICA6PSBAcGRmZGlyQA0KPj4gLXBzZGlyICAgICAgICAgICAgICAgICAgICA6
PSBAcHNkaXJADQo+IA0KPiBUaGUgcG9pbnQgSSBhcHBhcmVudGx5IGRpZG4ndCBtYWtlIHZl
cnkgd2VsbCB3YXMgdGhpczoNCj4gDQo+IFdlIGdlbmVyYXRlIGJvdGggSFRNTCBhbmQgUERG
cywgeWV0IHVzZSBuZWl0aGVyIG9mIGh0bWxkaXIgbm9yIHBkZmRpci4NCj4gV2hhdGV2ZXIg
aXMgZG9uZSB0byBvbmUgc2hvdWxkIGJlIGRvbmUgdG8gdGhlIG90aGVyLg0KPiANCj4gTGVh
dmUganVzdCBkb2NkaXIsIGFuZCBsZXQgd2hvbWV2ZXIgdGlkaWVzIHVwIHRoZSBtZXNzIGlu
IGRvY3MvIGFkanVzdA0KPiB0aGUgcGF0aHMgYXMgbmVjZXNzYXJ5Lg0KDQpBaCwgb2theS4N
Cg0KTm8gcHJvYmxlbS4NCg0KDQpKdWVyZ2VuDQo=
--------------626GTB6ywReT6q0uvuePqYzE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------626GTB6ywReT6q0uvuePqYzE--

--------------tr0hGHChJyJwY6p9ihQ242xI--

--------------TOhxe0MRoMkgr4kokDrYPu31
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXKAkFAwAAAAAACgkQsN6d1ii/Ey8y
6wf/UaV2POuuk/23qHGraTWXaG3JHv+dOCLJnYgPCVtEdnHuDS32uqf+qVMUZ8z34qrfycnIPZ7k
m1akiysnaVlJcq8uxBhksaZ1fXHUfE0duI+jPTlr+mcupScr7XOiFXvuazmwbi11YUKDjrCyvyaE
ERng3M6WdPQK4NIT2A1vN3vZiXSlR2gv6VM+8H8cAbBS138eYacIMIb3/DomUEXiIRFXXZcbtH2L
zqpLMgzEcU2qx8MwX66NcfMwXy20GDawgIN8SJIyISlUh0qNIzKKnCt6QsLHoMefxcmYWW9Yhevv
IlSarHh4m/D09lqz6YO/x9ItQ1rtLObL5EpjFtF95w==
=L7nh
-----END PGP SIGNATURE-----

--------------TOhxe0MRoMkgr4kokDrYPu31--

