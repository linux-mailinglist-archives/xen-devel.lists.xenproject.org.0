Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9CDC2C09B
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 14:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155339.1484835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuTJ-0002KS-62; Mon, 03 Nov 2025 13:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155339.1484835; Mon, 03 Nov 2025 13:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuTJ-0002Ib-3D; Mon, 03 Nov 2025 13:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1155339;
 Mon, 03 Nov 2025 13:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vFuTI-0002IU-KM
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 13:19:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c00c5b95-b8b7-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 14:19:39 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429c7e0282dso1770309f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Nov 2025 05:19:39 -0800 (PST)
Received: from ?IPV6:2003:e5:870e:1500:7795:3e8a:56c1:ae53?
 (p200300e5870e150077953e8a56c1ae53.dip0.t-ipconnect.de.
 [2003:e5:870e:1500:7795:3e8a:56c1:ae53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f1d4csm19950490f8f.39.2025.11.03.05.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 05:19:37 -0800 (PST)
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
X-Inumbo-ID: c00c5b95-b8b7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762175978; x=1762780778; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bA8/Ajh6uh2bGBEg0MDAJdWIsZY3P3htNjZpMFVCD1c=;
        b=Gnsla4Kw5VtDoLeioyAXG0CcU0xVfuKrB6VGZ0lxYQBVQvHXAU0l8SdgDcvcLcjm9i
         LO/juTb2u786ocYAVbCE4QD8COw6WszYUuWc+HQcqf99Y2QlShWjOGMTAicS6aFFywOF
         VVozpAIw8PuHPL6imdwFUOy3jzOIz/ZkOiddpzizw8i2GtCVnahZfBrqqYMpeKTKr2H0
         wy9rbF4FK7RMXbxJkSEYqADUfce5KG1UZw5i9VBy4xu9llQuCVqH4S/B9GvmroabRVL3
         ZyB0/QVHrzLc+KBQuo+HFIhIzzUWlPZRvC/RsN233qQPUUcvPTnPLGliXd4hiEURADOR
         O2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762175978; x=1762780778;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bA8/Ajh6uh2bGBEg0MDAJdWIsZY3P3htNjZpMFVCD1c=;
        b=b6/E3osldrQFxWBUIMPGLwOoVxDpmmLhseS3/gLJkAxsUJWL5FeWpJ6hyeNrjjf9aG
         ExXbuK9oiTxzVrDGum/KP8Qgs/dorEnSwFPtLiyJ/aefRunODIHvCUwd9004kS6bVMyO
         Lmj0xclGqcq5h9ULOE1CLxHo6tAcLNmJVLTMFHWS+EU29Qm4Tg2MB8KtBHI3lpMTNHsO
         5pXtRCiMgJLn+R59/fq2xTSe0spVWT/gykk3E+izWDMtMyF0SwmgXrK8yznk68XDrOga
         cutVET7p2LNdLpg1X51qt4GepokqzTIcQYho+3BcvIyMW1x2LBvLEZ5m6kvYswkPCm+g
         kyFg==
X-Gm-Message-State: AOJu0YwIBIvk1We77FSgnzoOH6rk1AQM/BA0U0KQ/o+5+/o0S89BdS6K
	SHOktEeL0ma3rfu9RkJpuHP5er2QTib/VmijV1WUk7Z8Ksys5CY0xUxBwIS6rbM6EbE=
X-Gm-Gg: ASbGncuJEc+8xg+zXVbpS9UWc5ZnjgLtnlPTHkZjvUqCquz6uISOC3JzE6Rqyw7wd1V
	0VIfUm7JMD0/oy2VHeRzb3mlai+GdGkVWFTkqQDjos9Gm/SKp/LrwzLCNjWKUAMqdLjMPsRhEjR
	ArWnGVK/Nw9C+zyq6NDXUEwhSoXaJKYdtQGZjtlAB9ttFD0WAQs0TW5DLdHKkAWip7euC4CXUk1
	sdPOE+gkL0cthnDdVJqVRdbZe052gQRCoSuJBct8y5NFHUfhLcHOusGq6CdEcjHq1ig5R8xsVOD
	s+FRYq9TNTJcpR5iA/iiAiEQcqIC6TFzrKbVR6CBPypcWFYdRV8vMKJFSMn/d0h03KW2bCm+W8g
	IXR22/sNto97ssbdbf88TidTJU4SXJeoD9RUUf1adsSSmoK6bxJNZQG2rzXAJHN8aS6KCwQc+6I
	B0kiKy4GOouJUXS5+7ogqQwglZGbsGvqVggNSCjSfRb71tXehuJNeKskHbjEoNq/kFsqFdlAwLV
	9fbkw4HShb9UjFXo1lhQZZsyrxdEuKdKb5RPbFaMTsSpxeUJQ==
X-Google-Smtp-Source: AGHT+IGuau3eW5WC1R93VPLVN8+9E4SrZfXJSujtRWGSeFzlyOBkUt+8IC7TUpXakZNqQ8ep+AjxzA==
X-Received: by 2002:a05:6000:250e:b0:429:cba7:f773 with SMTP id ffacd0b85a97d-429cba7f9cdmr5274216f8f.19.1762175978291;
        Mon, 03 Nov 2025 05:19:38 -0800 (PST)
Message-ID: <209fa1c0-f6f2-4594-a2ae-7733ff651761@suse.com>
Date: Mon, 3 Nov 2025 14:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/netfront: Comment Correction: Fix Spelling Error and
 Description of Queue Quantity Rules
To: Chu Guangqing <chuguangqing@inspur.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251103032212.2462-1-chuguangqing@inspur.com>
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
In-Reply-To: <20251103032212.2462-1-chuguangqing@inspur.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------krGRhE0Upii4b9WMJ7Y2jJMT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------krGRhE0Upii4b9WMJ7Y2jJMT
Content-Type: multipart/mixed; boundary="------------naDhrqYeiAtCem5LDmy8CsV5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Chu Guangqing <chuguangqing@inspur.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <209fa1c0-f6f2-4594-a2ae-7733ff651761@suse.com>
Subject: Re: [PATCH] xen/netfront: Comment Correction: Fix Spelling Error and
 Description of Queue Quantity Rules
References: <20251103032212.2462-1-chuguangqing@inspur.com>
In-Reply-To: <20251103032212.2462-1-chuguangqing@inspur.com>

--------------naDhrqYeiAtCem5LDmy8CsV5
Content-Type: multipart/mixed; boundary="------------511r0QUbJCNKJQeyEXdlbmGB"

--------------511r0QUbJCNKJQeyEXdlbmGB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTEuMjUgMDQ6MjIsIENodSBHdWFuZ3Fpbmcgd3JvdGU6DQo+IFRoZSBvcmlnaW5h
bCBjb21tZW50cyBjb250YWluZWQgc3BlbGxpbmcgZXJyb3JzIGFuZCBpbmNvbXBsZXRlIGxv
Z2ljYWwNCj4gZGVzY3JpcHRpb25zLCB3aGljaCBjb3VsZCBlYXNpbHkgbGVhZCB0byBtaXN1
bmRlcnN0YW5kaW5ncyBvZiB0aGUgY29kZQ0KPiBsb2dpYy4gVGhlIHNwZWNpZmljIG1vZGlm
aWNhdGlvbnMgYXJlIGFzIGZvbGxvd3M6DQo+IA0KPiBDb3JyZWN0IHRoZSBzcGVsbGluZyBl
cnJvciBieSBjaGFuZ2luZyAiaW51dCBtYXgiIHRvICJidXQgbm90IGV4Y2VlZCB0aGUNCj4g
bWF4aW11bSBsaW1pdCI7DQo+IA0KPiBBZGQgdGhlIG5vdGUgIklmIHRoZSB1c2VyIGhhcyBu
b3Qgc3BlY2lmaWVkIGEgdmFsdWUsIHRoZSBkZWZhdWx0IG1heGltdW0NCj4gbGltaXQgaXMg
OCIgdG8gY2xhcmlmeSB0aGUgZGVmYXVsdCB2YWx1ZSBsb2dpYzsNCj4gDQo+IEltcHJvdmUg
dGhlIGNvaGVyZW5jZSBvZiB0aGUgc3RhdGVtZW50IHRvIG1ha2UgdGhlIHF1ZXVlIHF1YW50
aXR5IHJ1bGVzDQo+IGNsZWFyZXIuDQo+IA0KPiBBZnRlciB0aGUgbW9kaWZpY2F0aW9uLCB0
aGUgY29tbWVudHMgY2FuIGFjY3VyYXRlbHkgcmVmbGVjdCB0aGUgY29kZQ0KPiBiZWhhdmlv
ciBvZiAidGFraW5nIHRoZSBzbWFsbGVyIHZhbHVlIGJldHdlZW4gdGhlIG51bWJlciBvZiBD
UFVzIGFuZCB0aGUNCj4gZGVmYXVsdCBtYXhpbXVtIGxpbWl0IG9mIDggZm9yIHRoZSBudW1i
ZXIgb2YgcXVldWVzIiwgZW5oYW5jaW5nIGNvZGUNCj4gbWFpbnRhaW5hYmlsaXR5Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1IEd1YW5ncWluZyA8Y2h1Z3VhbmdxaW5nQGluc3B1ci5j
b20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoN
Cg0KSnVlcmdlbg0K
--------------511r0QUbJCNKJQeyEXdlbmGB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------511r0QUbJCNKJQeyEXdlbmGB--

--------------naDhrqYeiAtCem5LDmy8CsV5--

--------------krGRhE0Upii4b9WMJ7Y2jJMT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkIq+gFAwAAAAAACgkQsN6d1ii/Ey8s
eAgAkP4SIOJZjYUHdJZGVfcnpP2nPq9QC4Mmoc4h1n/QG7L4/XS5bNW2HMwSTg/aM3iK/vOxeala
l2Gup8+fOMHcnEOHtIuTYHioM66qLsm764hr5ro0LY077J/GED9SgUveUlCuCJDGpt5ZG2bYHVbL
Gh4GyoH30+yJTJGWi+YUUJb9EnRar7H24jUCC0xK9dRaHRaCnZJGYS+Kns3xgjbi8KQMrDCdyj+U
z38TYJ+VT0UoL/G6PzUCBrw92gJNlwqs18XwPRKLWdrmLQ8W7UPnXFr6Jwk96YwEf/3MDqonIvPh
R2DrVz9RXX7Imv2t1/+lFDb9fiMHvDgHnMnCntthyQ==
=gdmH
-----END PGP SIGNATURE-----

--------------krGRhE0Upii4b9WMJ7Y2jJMT--

