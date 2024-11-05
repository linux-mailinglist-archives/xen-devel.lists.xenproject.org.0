Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A219BD137
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 16:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830439.1245438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8LvA-0006pe-2P; Tue, 05 Nov 2024 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830439.1245438; Tue, 05 Nov 2024 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Lv9-0006oA-Vl; Tue, 05 Nov 2024 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 830439;
 Tue, 05 Nov 2024 15:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t8Lv8-0006gA-QO
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 15:56:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b2315c4-9b8e-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 16:56:39 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so66630085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 07:56:39 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb18140a6sm150564266b.195.2024.11.05.07.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 07:56:38 -0800 (PST)
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
X-Inumbo-ID: 8b2315c4-9b8e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhiMjMxNWM0LTliOGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODIyMTk5LjU5Mzk4Niwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730822199; x=1731426999; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bz3e7dP1KeYuebRZGkFKNHi29d8JijMB5urnbXUCkJg=;
        b=UcbaUJuOrtS3DkhBj65+AfpAxm39X2Ty46pGbyBJU4k21H3VPnVl3D7LVCUrMOOlwO
         s/EIT0yjQhkzbRylJg/Pvxf+9lRxW40vqwuga0WaJgofnjXy7wtCsTnbhAE5eYp0f3cy
         0rG8fBUQMhdUxL+GlElVM8Im+gJ3CCNAEluYs0EMjKPlMUtKyuFvsTwCSTJw2T2oQ+vj
         7yNFCMpKgb9tVawWl8q56UuH+R17wTIojnSmF6oSLcxa135Bmr7fuuBT20MpuwIHMz/o
         n1GNxs3sa7IN17bkMem76kryJ+NpU+RAyr9iogitsqi4BtbVS3cav/IiB20n+cZcJHd/
         sZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822199; x=1731426999;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz3e7dP1KeYuebRZGkFKNHi29d8JijMB5urnbXUCkJg=;
        b=EmoepkiiSIsmuePuzOuS3b0PLvJUNYsQSizReE6Zo5SXA2DI5Mj9M/9Q0RTln9RcD0
         MCe/j/sVAkYZnyKfeJ+PZj7UJsBJ9RL/erumEWDHfbzNSPFmNGEhAWkPWy+fk2PCifom
         4R+GO/2u4tB5B9VyaEG1GjE0cDWDfoDxhmE+c24SDN6GEjbNxailxX1JBP1gjgsCJecx
         BYGt/lk5vlgnFFXIy3ZIFvY5Wd73LB1L3U+C4/GfKo4IopNfmlYbOvtUiHEZ5uzHALQE
         9CaRNUHKY1XhwtLKMkLqQm9AxHUjwCJFSpIYs2pjcOvWptfmggaMY4njq8b99PnbtbYX
         O6gg==
X-Gm-Message-State: AOJu0Yziy28R13HFJusNQ5F9Ag7YgOXC6KtlkIcVSzMLSHkfxuwZCfD+
	sGovXNtllTfivmuz0WL3N2iak3bPmZGctwUVrzz6lcIsTiGqSr84JOLjTgAVozY=
X-Google-Smtp-Source: AGHT+IEScPUofJaERY2yiZU967o6GxVCJasBuDqbrT9wmPNg0fIR0y3JxAZ2piRjiLQoHXIs/cDqjQ==
X-Received: by 2002:adf:e199:0:b0:37d:4eeb:7370 with SMTP id ffacd0b85a97d-381c7ae14bdmr17673662f8f.56.1730822198751;
        Tue, 05 Nov 2024 07:56:38 -0800 (PST)
Message-ID: <79984ce2-98a2-42f4-85f8-fd53d71f10c7@suse.com>
Date: Tue, 5 Nov 2024 16:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix the issue of resource not being properly
 released in xenbus_dev_probe()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, gregkh@linuxfoundation.org,
 sumit.garg@linaro.org, xin.wang2@amd.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
References: <20241105130919.4621-1-chenqiuji666@gmail.com>
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
In-Reply-To: <20241105130919.4621-1-chenqiuji666@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eTdyGz0k450u4KZEC4Cbyb0S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eTdyGz0k450u4KZEC4Cbyb0S
Content-Type: multipart/mixed; boundary="------------FTEVxyFrAV4twIPuT6CjSaEj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, gregkh@linuxfoundation.org,
 sumit.garg@linaro.org, xin.wang2@amd.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
Message-ID: <79984ce2-98a2-42f4-85f8-fd53d71f10c7@suse.com>
Subject: Re: [PATCH] xen: Fix the issue of resource not being properly
 released in xenbus_dev_probe()
References: <20241105130919.4621-1-chenqiuji666@gmail.com>
In-Reply-To: <20241105130919.4621-1-chenqiuji666@gmail.com>

--------------FTEVxyFrAV4twIPuT6CjSaEj
Content-Type: multipart/mixed; boundary="------------PI0x0UKMcbQZcGfSxIk646iX"

--------------PI0x0UKMcbQZcGfSxIk646iX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjQgMTQ6MDksIFFpdS1qaSBDaGVuIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGZp
eGVzIGFuIGlzc3VlIGluIHRoZSBmdW5jdGlvbiB4ZW5idXNfZGV2X3Byb2JlKCkuIEluIHRo
ZQ0KPiB4ZW5idXNfZGV2X3Byb2JlKCkgZnVuY3Rpb24sIHdpdGhpbiB0aGUgaWYgKGVycikg
YnJhbmNoIGF0IGxpbmUgMzEzLCB0aGUNCj4gcHJvZ3JhbSBpbmNvcnJlY3RseSByZXR1cm5z
IGVyciBkaXJlY3RseSB3aXRob3V0IHJlbGVhc2luZyB0aGUgcmVzb3VyY2VzDQo+IGFsbG9j
YXRlZCBieSBlcnIgPSBkcnYtPnByb2JlKGRldiwgaWQpLiBBcyB0aGUgcmV0dXJuIHZhbHVl
IGlzIG5vbi16ZXJvLA0KPiB0aGUgdXBwZXIgbGF5ZXJzIGFzc3VtZSB0aGUgcHJvY2Vzc2lu
ZyBsb2dpYyBoYXMgZmFpbGVkLiBIb3dldmVyLCB0aGUgcHJvYmUNCj4gb3BlcmF0aW9uIHdh
cyBwZXJmb3JtZWQgZWFybGllciB3aXRob3V0IGEgY29ycmVzcG9uZGluZyByZW1vdmUgb3Bl
cmF0aW9uLg0KPiBTaW5jZSB0aGUgcHJvYmUgYWN0dWFsbHkgYWxsb2NhdGVzIHJlc291cmNl
cywgZmFpbGluZyB0byBwZXJmb3JtIHRoZSByZW1vdmUNCj4gb3BlcmF0aW9uIGNvdWxkIGxl
YWQgdG8gcHJvYmxlbXMuDQo+IA0KPiBUbyBmaXggdGhpcyBpc3N1ZSwgd2UgZm9sbG93ZWQg
dGhlIHJlc291cmNlIHJlbGVhc2UgbG9naWMgb2YgdGhlDQo+IHhlbmJ1c19kZXZfcmVtb3Zl
KCkgZnVuY3Rpb24gYnkgYWRkaW5nIGEgbmV3IGJsb2NrIGZhaWxfcmVtb3ZlIGJlZm9yZSB0
aGUNCj4gZmFpbF9wdXQgYmxvY2suIEFmdGVyIGVudGVyaW5nIHRoZSBicmFuY2ggaWYgKGVy
cikgYXQgbGluZSAzMTMsIHRoZQ0KPiBmdW5jdGlvbiB3aWxsIHVzZSBhIGdvdG8gc3RhdGVt
ZW50IHRvIGp1bXAgdG8gdGhlIGZhaWxfcmVtb3ZlIGJsb2NrLA0KPiBlbnN1cmluZyB0aGF0
IHRoZSBwcmV2aW91c2x5IGFjcXVpcmVkIHJlc291cmNlcyBhcmUgY29ycmVjdGx5IHJlbGVh
c2VkLA0KPiB0aHVzIHByZXZlbnRpbmcgdGhlIHJlZmVyZW5jZSBjb3VudCBsZWFrLg0KPiAN
Cj4gVGhpcyBidWcgd2FzIGlkZW50aWZpZWQgYnkgYW4gZXhwZXJpbWVudGFsIHN0YXRpYyBh
bmFseXNpcyB0b29sIGRldmVsb3BlZA0KPiBieSBvdXIgdGVhbS4gVGhlIHRvb2wgc3BlY2lh
bGl6ZXMgaW4gYW5hbHl6aW5nIHJlZmVyZW5jZSBjb3VudCBvcGVyYXRpb25zDQo+IGFuZCBk
ZXRlY3RpbmcgcG90ZW50aWFsIGlzc3VlcyB3aGVyZSByZXNvdXJjZXMgYXJlIG5vdCBwcm9w
ZXJseSBtYW5hZ2VkLg0KPiBJbiB0aGlzIGNhc2UsIHRoZSB0b29sIGZsYWdnZWQgdGhlIG1p
c3NpbmcgcmVsZWFzZSBvcGVyYXRpb24gYXMgYQ0KPiBwb3RlbnRpYWwgcHJvYmxlbSwgd2hp
Y2ggbGVkIHRvIHRoZSBkZXZlbG9wbWVudCBvZiB0aGlzIHBhdGNoLg0KPiANCj4gRml4ZXM6
IDRiYWMwN2M5OTNkMCAoInhlbjogYWRkIHRoZSBYZW5idXMgc3lzZnMgYW5kIHZpcnR1YWwg
ZGV2aWNlIGhvdHBsdWcgZHJpdmVyIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU2lnbmVkLW9mZi1ieTogUWl1LWppIENoZW4gPGNoZW5xaXVqaTY2NkBnbWFpbC5jb20+
DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0K
SnVlcmdlbg0K
--------------PI0x0UKMcbQZcGfSxIk646iX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PI0x0UKMcbQZcGfSxIk646iX--

--------------FTEVxyFrAV4twIPuT6CjSaEj--

--------------eTdyGz0k450u4KZEC4Cbyb0S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcqQDUFAwAAAAAACgkQsN6d1ii/Ey98
oQf9G78mT3vg32/jkgPBfk3e87JtKYp0xwTMxC3WIEreRnKl5wfUPW4pOQqRyKj3NcoRy4hncQ5w
Ez3viiQAAEOUokVzlsqR8pyBjw2QN3SN+/A32jc4VoCADjfGaPaV/OvkfXiSCF51yP4EO8Pso+1y
h7p7EI+wG6Dh9iAEAf6AA6wj9rsuXvFIsdmJZEz8e3ObcUjAzyB96m7+JTm1lfuajvrrWu/HQJiU
2G3TBJtluqKgbXcVp82pXPmMMBP2BUJgYYMtLBdIsSM4WLn35AJH/HSPJ5GbxmoVRu4uRZutSsJD
JNGTUno81aAL1118XaOPfUW/EUC0bLqWOFAzkXZ9hA==
=PTAO
-----END PGP SIGNATURE-----

--------------eTdyGz0k450u4KZEC4Cbyb0S--

