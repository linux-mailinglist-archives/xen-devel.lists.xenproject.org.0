Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA09E355C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 09:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848402.1263312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIklp-0007CJ-Dy; Wed, 04 Dec 2024 08:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848402.1263312; Wed, 04 Dec 2024 08:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIklp-00079C-9q; Wed, 04 Dec 2024 08:30:05 +0000
Received: by outflank-mailman (input) for mailman id 848402;
 Wed, 04 Dec 2024 08:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h4Vv=S5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tIkln-0006es-1k
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 08:30:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3cee395-b219-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 09:30:00 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a9f2da82so57122535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 00:30:00 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52a46e6sm16336835e9.30.2024.12.04.00.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 00:29:59 -0800 (PST)
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
X-Inumbo-ID: f3cee395-b219-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733301000; x=1733905800; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pOfJD/zrOUKVJSR2MgqIv5aVoUGydLMJW6+9jh64hAQ=;
        b=SOHvhCLDTe4lIf9tHWE/5GGXpW7+mtPcu3r1XaXBqmBblM4aqNh0/bT/fuGAotSJ7G
         4WMI9lliwzaBAS8rBlvuubwAietFfotEDjieVD+QKJPp1OzFocQ9GT2lAuH1XwUWqJ8W
         FrucWLVKGteqr3TgZHZKjQ/LQLKNsrcvbU0Apz8Bpbqdkvc1TA2EHFT/+w7FjxZmHvFa
         mCBVR97Zj6o4kcYALnz6siF4Eu0cQzwQlYqSetKARBLshEmpln1Z+7ojqcD8gE2nQb8o
         ILrYbMvIuPi2pfY0F3ccDEOhIG4H0atWphOhbER5n+WmwMoUTVEFByEgFMeSI1FKjBja
         4fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733301000; x=1733905800;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOfJD/zrOUKVJSR2MgqIv5aVoUGydLMJW6+9jh64hAQ=;
        b=sCluij1+lZ6c8ML9V4ah4F8NtBN0+napP2LClK+RNltsjQXQhdXspF78l94fpWe7Ci
         LSaQQwh4NFN46hR1jv+OAFViYPjmeuKnvuhCA6a87068IlXNw9sqd2pvwQqOcPz/GC1F
         ulUanaB8sFNoQxYO/mJRYWml1Ydrr4aBh3HxAZdsXArRN2Lc1a2UlYWUMgnLJZEncuU+
         wsTWgNdnrjyQ/gpSFhFM5mfhuMJ2bEVo6gJkoNjdQSaquY6v/YNqzWREmkdOwN8v18sO
         fzHRtbEwQH0eu9oCj22m4iSJZ8mTPwOsttzZ6BgzAdtQTzl9QqwwuKYhtFItjjFQNu9Q
         lmYA==
X-Forwarded-Encrypted: i=1; AJvYcCU0WvQNLPcfTniK+C2zPZTCY7KN2JSgGPvJL76Si5Gqy+yTeREXUEVtxYs3LMPNjl8gPXnG8sISwNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw0mdmc1JbOmO55/4hzdyjn27KeBvlwlgijX8/cbbi8pmsfqPJ
	d/I9dCdDHvKkK/UCYniSwqIxlCNnvC+4VAwB6SZ0ZSUxr6gz+y3CKfXoQKuOp5I=
X-Gm-Gg: ASbGncuD9qpjz5/dtSpagPBTAaFPOAJQvWfcQ2PlsZxbpqPyQQjVXrJr4Ktp/clfZVB
	W/gLUSXD/tn5qZ3Pa5UnciKeUz58AajVONEwiHOg4uPpMgZ6XIimtsnMYZLnKuGz1tdL5cfZEit
	8HYmG5AEWyShRVuaijJBY1R53gsNj/8qSNblQFB73X5klbE2fN+jqV56ePz22wHaSZBoFPUwaOo
	jn7v/tqAhHN9ITVjm4U4knP3ZP4qerXCvCY9028rLmYKp0ad7X9546VxFitCnUYePqhI4G36f+B
	aKQcyXSy+CuxBc+JRPqBO7/sTmldRk/y40UGtaj5zDfUiHVsNOGtbTV2xG6wBArvAJmzbQu8ugY
	=
X-Google-Smtp-Source: AGHT+IEACGfO3lWB5Uq2l4l1xaA4Spg3axZYZCp9WlqbptvHBWTDyU1yueiLDhMFJEqm7m041Q4EyA==
X-Received: by 2002:a05:600c:5121:b0:434:a169:6ff8 with SMTP id 5b1f17b1804b1-434d09b149bmr52787435e9.3.1733301000159;
        Wed, 04 Dec 2024 00:30:00 -0800 (PST)
Message-ID: <fc2ef8da-62e8-431a-8a1b-508b3f9d5ef4@suse.com>
Date: Wed, 4 Dec 2024 09:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/acpi: upload power and performance related
 data from a PVH dom0
To: Penny Zheng <Penny.Zheng@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
 <Xenia.Ragiadakou@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241204082430.469092-1-Penny.Zheng@amd.com>
 <20241204082430.469092-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20241204082430.469092-2-Penny.Zheng@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HaIIC0Wr9wOSGmDsSo9I1LnX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HaIIC0Wr9wOSGmDsSo9I1LnX
Content-Type: multipart/mixed; boundary="------------X00g6DcFXgG6ZdTV7CoGbLcc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Penny Zheng <Penny.Zheng@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
 <Xenia.Ragiadakou@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <fc2ef8da-62e8-431a-8a1b-508b3f9d5ef4@suse.com>
Subject: Re: [PATCH v1 1/4] xen/acpi: upload power and performance related
 data from a PVH dom0
References: <20241204082430.469092-1-Penny.Zheng@amd.com>
 <20241204082430.469092-2-Penny.Zheng@amd.com>
In-Reply-To: <20241204082430.469092-2-Penny.Zheng@amd.com>

--------------X00g6DcFXgG6ZdTV7CoGbLcc
Content-Type: multipart/mixed; boundary="------------2lMiSsNkJHtIfDZ5BcwEIWDT"

--------------2lMiSsNkJHtIfDZ5BcwEIWDT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjQgMDk6MjQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiBGcm9tOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gDQo+IFdoZW4gcnVubmluZyBh
cyBhIFBWSCBkb20wIHRoZSBBQ1BJIE1BRFQgaXMgY3JhZnRlZCBieSBYZW4gaW4gb3JkZXIg
dG8NCj4gcmVwb3J0IHRoZSBjb3JyZWN0IG51bWJlcnMgb2YgdkNQVXMgdGhhdCBkb20wIGhh
cywgc28gdGhlIGhvc3QgTUFEVCBpcw0KPiBub3QgcHJvdmlkZWQgdG8gZG9tMC4gIFRoaXMg
Y3JlYXRlcyBpc3N1ZXMgd2hlbiBwYXJzaW5nIHRoZSBwb3dlciBhbmQNCj4gcGVyZm9ybWFu
Y2UgcmVsYXRlZCBkYXRhIGZyb20gQUNQSSBkeW5hbWljIHRhYmxlcywgYXMgdGhlIEFDUEkN
Cj4gUHJvY2Vzc29yIFVJRHMgZm91bmQgb24gdGhlIGR5bmFtaWMgY29kZSBhcmUgbGlrZWx5
IHRvIG5vdCBtYXRjaCB0aGUNCj4gb25lcyBjcmFmdGVkIGJ5IFhlbiBpbiB0aGUgZG9tMCBN
QURULg0KPiANCj4gWGVuIHdvdWxkIHJlbHkgb24gTGludXggaGF2aW5nIGZpbGxlZCBhdCBs
ZWFzdCB0aGUgcG93ZXIgYW5kDQo+IHBlcmZvcm1hbmNlIHJlbGF0ZWQgZGF0YSBvZiB0aGUg
dkNQVXMgb24gdGhlIHN5c3RlbSwgYW5kIHdvdWxkIGNsb25lDQo+IHRoYXQgaW5mb3JtYXRp
b24gaW4gb3JkZXIgdG8gc2V0dXAgdGhlIHJlbWFpbmluZyBwQ1BVcyBvbiB0aGUgc3lzdGVt
DQo+IGlmIGRvbTAgdkNQVXMgPCBwQ1BVcy4gIEhvd2V2ZXIgd2hlbiBydW5uaW5nIGFzIFBW
SCBkb20wIGl0J3MgbGlrZWx5DQo+IHRoYXQgbm9uZSBvZiBkb20wIENQVXMgd2lsbCBoYXZl
IHRoZSBwb3dlciBhbmQgcGVyZm9ybWFuY2UgZGF0YQ0KPiBmaWxsZWQsIGFuZCBoZW5jZSB0
aGUgWGVuIEFDUEkgUHJvY2Vzc29yIGRyaXZlciBuZWVkcyB0byBmZXRjaCB0aGF0DQo+IGlu
Zm9ybWF0aW9uIGJ5IGl0c2VsZi4NCj4gDQo+IEluIG9yZGVyIHRvIGRvIHNvIGNvcnJlY3Rs
eSwgaW50cm9kdWNlIGEgbmV3IGhlbHBlciB0byBmZXRjaCB0aGUgX0NTVA0KPiBkYXRhIHdp
dGhvdXQgdGFraW5nIGludG8gYWNjb3VudCB0aGUgc3lzdGVtIGNhcGFiaWxpdGllcyBmcm9t
IHRoZQ0KPiBDUFVJRCBvdXRwdXQsIGFzIHRoZSBjYXBhYmlsaXRpZXMgcmVwb3J0ZWQgdG8g
ZG9tMCBpbiBDUFVJRCBtaWdodCBiZQ0KPiBkaWZmZXJlbnQgZnJvbSB0aGUgb25lcyBvbiB0
aGUgaG9zdC4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgbmV3bHkgaW50cm9kdWNlZCBjb2RlIHdp
bGwgb25seSBmZXRjaCB0aGUgX0NTVCwgX1BTUywNCj4gX1BQQyBhbmQgX1BDVCBmcm9tIGEg
c2luZ2xlIENQVSwgYW5kIGNsb25lIHRoYXQgaW5mb3JtYXRpb24gZm9yIGFsbCB0aGUNCj4g
b3RoZXIgUHJvY2Vzc29ycy4gIFRoaXMgd29uJ3Qgd29yayBvbiBhbiBoZXRlcm9nZW5lb3Vz
IHN5c3RlbSB3aXRoDQo+IFByb2Nlc3NvcnMgaGF2aW5nIGRpZmZlcmVudCBwb3dlciBhbmQg
cGVyZm9ybWFuY2UgcmVsYXRlZCBkYXRhIGJldHdlZW4NCj4gdGhlbS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoN
CkkgdGhpbmsgdGhpcyBpcyB0aGUgVjIgdmVyc2lvbiBvZiBKYXNvbidzIHBhdGNoLCBvZiB3
aGljaCBoZSBzZW50IFYzIGp1c3QNCnllc3RlcmRheT8NCg0KUGxlYXNlIHN5bmMgd2l0aCBo
aW0gaG93IHRvIHByb2NlZWQ6IGlzIGhpcyBwYXRjaCBtZWFudCB0byBiZSBhIHByZXJlcXVp
c2l0ZQ0KZm9yIHlvdXIgc2VyaWVzIG9yIGEgcGFydCBvZiBpdD8NCg0KDQpKdWVyZ2VuDQo=

--------------2lMiSsNkJHtIfDZ5BcwEIWDT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2lMiSsNkJHtIfDZ5BcwEIWDT--

--------------X00g6DcFXgG6ZdTV7CoGbLcc--

--------------HaIIC0Wr9wOSGmDsSo9I1LnX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdQEwYFAwAAAAAACgkQsN6d1ii/Ey8a
zwgAjA1lwxjNPoYBwoyZ5WCkpvCgsevWly/QBako5bZkWyeVLO/xLjIxAzckIY/hDXoMyQ7O1jgY
Qr9BipOEhf/jUPUgKNonNIxVQRCcYiV0tkUbh6s7Ptqs3XVUVH99B3lobNyDSHjcRrmbNWm5JP4E
mHst1xtXeHfDah4atBMay8kcxtxJF+4Fe5JHaVeGL877z/9x+B9WSj+pFLmimPbo9WAI3T1oL3CI
zuVteV5fDN3q5kEH84bstfiJTjEgOg721ezxkUK9Tz8/QPY9AFYpJKw09JmEawRHkr7RU2r3Ev52
JVLAzurAM1rP94wNU9vvNVuVq6G1HVS14rcBMULuEQ==
=TEQ8
-----END PGP SIGNATURE-----

--------------HaIIC0Wr9wOSGmDsSo9I1LnX--

