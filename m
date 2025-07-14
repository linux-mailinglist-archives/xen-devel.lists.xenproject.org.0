Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3295B0384D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042645.1412732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDxd-00059u-4k; Mon, 14 Jul 2025 07:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042645.1412732; Mon, 14 Jul 2025 07:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDxd-00057u-19; Mon, 14 Jul 2025 07:50:53 +0000
Received: by outflank-mailman (input) for mailman id 1042645;
 Mon, 14 Jul 2025 07:50:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qtq2=Z3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubDxc-00057o-Gh
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:50:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4274d85d-6087-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:50:50 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3299454f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:50:50 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032fcbsm164848045e9.6.2025.07.14.00.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:50:49 -0700 (PDT)
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
X-Inumbo-ID: 4274d85d-6087-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752479449; x=1753084249; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xIldg95nRXPC6sI29lFSjNy87gD6mmspWkvCoiW8Huo=;
        b=JWKdtYCjJBFrJRKlqbtEKUAucDeztmeQzPgVuQ4Qy2LorhMGmL7tZ5tQeHzhSCEomL
         CYkPYGi8Cg1ZhxMmiNcCtHnZ+R5eHXLttoD+AE/V5d149QiUKcvZMVfLydMJiiWf97FW
         PZtP74FwEoUCqMI/PxGekG1VAmhHyAruiTKq79y8lQMy3b7qkV9FLNBLQnb2q1ECC7NQ
         2MEFm/HtEs9UrDK2nc9yhJO7I7qQOx3wKR8QVhdGpk+9zmcHGKScCmD6v8NhAyukvwAY
         /u+BH84IM/Qr8gsiojJX4lsJSJk5VfaIMySv52/kOtLGyXGM09S4A1zD8K4qNhxhQCCI
         yTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752479449; x=1753084249;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIldg95nRXPC6sI29lFSjNy87gD6mmspWkvCoiW8Huo=;
        b=gcZOWwEfImCbO1iBNd6jPmb4E0S/fSm2HTLf4m1KL4vEh/aceEl7ttXJq7zjVXsp8q
         RMMfs7N7F/9GyVaUmMaF5zR4ahwJMAKNjdzf016XVHhU5+n5jG/h4SY2uZu9WtEmfqb+
         QouRigclOdwHWvrEoJJ2bLHkf9v5fTmGXjU5yAggZ4YfZz6yKzCKrkbnlbAhcsBxb54S
         oa+cW/IM2Q047eMDVP8Rq+J+IOI8YvgL1KKhcOmZgQhCK1wiMAyzLPDBnMlCQOQGSyrL
         XLwyFdUa+bOSOUWlUT5cPqgHXLMFsQOspfXtxtx+K0AJ8ryhuiOwTAac2CGpaMeGxKpE
         ZcUQ==
X-Gm-Message-State: AOJu0Yw8jeRQus2VdiznIgPHl/iVScGLws0BchZy4e3UJSBz4e7tJQdv
	RV9gNjHq+DbYXAva/f+PsJ+X6LF4D1E9SNQpB8SSErUykO0WAXrtWsLF44CsLAG2zRc=
X-Gm-Gg: ASbGnct6ONfxE5sAUJ89zk/fRZs0aPDD/+VqPVHl7FTZphUj8UOhZ6Dm4DjFBq6x8Tg
	48fw8yGoZ0qROHxtbMffFErxaf4J/hUwbfS4dLbXbCDqGr8xRpqN4TwrMelWq78VXq8RC6forYr
	HKIcCxeAoywMFgqg2p1XdMi5d5m/g4infueQYCmj/i+cwRiM4aYcdjbrbMTFbLq2j4zmKQ2Sd05
	IB0vBHjwTlrwOhXY/KDwk4ahZQTVH1OO4IOhLx/ApxfiopL8AoXi18vYSDdwNkPalOEYOXXIYkn
	N+jgVNXNuYIiRqJ4RlwJh+5CghTe7HRNvcbuWtXpLBcSixsy7h0hdmWeuyIN3FyTLfN390IUbwK
	61jegjWt6zBMgCwscgrQTY5iXTQPglD08UCHjkOny6a52sZmkCxp0FLanOAivEewI4FHUM3qA7Y
	TfAZXhxXWJ+u7BR1oOFbBMYLxOjxgy8g2MVr1QVMKx23Rt
X-Google-Smtp-Source: AGHT+IGfstpqer0pnI0ZFNlrjA2M5XcNhZGtJxASA8rbVo6oCGZUGTo41nfDvVJEdgE7geJapCKDWg==
X-Received: by 2002:a05:6000:2dc3:b0:3a4:f6ed:767a with SMTP id ffacd0b85a97d-3b5f18d989fmr10479310f8f.38.1752479449509;
        Mon, 14 Jul 2025 00:50:49 -0700 (PDT)
Message-ID: <d3844036-c1f0-427f-824e-d4e8d0d890e4@suse.com>
Date: Mon, 14 Jul 2025 09:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Remove some deadcode (x)
To: linux@treblig.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250713132625.164728-1-linux@treblig.org>
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
In-Reply-To: <20250713132625.164728-1-linux@treblig.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------njMfApSgwR0gpdCDJ80Slmx2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------njMfApSgwR0gpdCDJ80Slmx2
Content-Type: multipart/mixed; boundary="------------oznbd1bzWMDUnRIqUV7Nmirj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: linux@treblig.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <d3844036-c1f0-427f-824e-d4e8d0d890e4@suse.com>
Subject: Re: [PATCH] xen: Remove some deadcode (x)
References: <20250713132625.164728-1-linux@treblig.org>
In-Reply-To: <20250713132625.164728-1-linux@treblig.org>

--------------oznbd1bzWMDUnRIqUV7Nmirj
Content-Type: multipart/mixed; boundary="------------WBTmppGMVAVGGcQg7lQUzRqO"

--------------WBTmppGMVAVGGcQg7lQUzRqO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDcuMjUgMTU6MjYsIGxpbnV4QHRyZWJsaWcub3JnIHdyb3RlOg0KPiBGcm9tOiAi
RHIuIERhdmlkIEFsYW4gR2lsYmVydCIgPGxpbnV4QHRyZWJsaWcub3JnPg0KPiANCj4gUmVt
b3ZlIHRocmVlIHVuY2FsbGVkIGZ1bmN0aW9uczoNCj4gDQo+ICAgIHhlbmJ1c19ta2Rpcigp
IHdhcyBhZGRlZCBpbiAyMDA3IGJ5DQo+IGNvbW1pdCA0YmFjMDdjOTkzZDAgKCJ4ZW46IGFk
ZCB0aGUgWGVuYnVzIHN5c2ZzIGFuZCB2aXJ0dWFsIGRldmljZSBob3RwbHVnDQo+IGRyaXZl
ciIpDQo+IGJ1dCBoYXMgcmVtYWluZWQgdW51c2VkLg0KPiANCj4gICAgeGVuX2dldF9ydW5z
dGF0ZV9zbmFwc2hvdCgpIGxhc3QgdXNlIHdhcyByZW1vdmVkIGluIDIwMTYgYnkNCj4gY29t
bWl0IDZiYTI4NmFkODQ1NyAoInhlbjogc3VwcG9ydCBydW5xdWV1ZSBzdGVhbCB0aW1lIG9u
IHhlbiIpDQo+IHdoaWNoIHJlcGxhY2VzIHRoZSB1c2UgYnkgdGhlIF9jcHUgdmVyc2lvbi4N
Cj4gDQo+ICAgIHhlbl9yZXN1bWVfbm90aWZpZXJfdW5yZWdpc3RlcigpIGxhc3QgdXNlIHdh
cyByZW1vdmVkIGluIDIwMTcgYnkNCj4gY29tbWl0IDE5MTRmMGNkMjAzYyAoInhlbi9hY3Bp
OiB1cGxvYWQgUE0gc3RhdGUgZnJvbSBpbml0LWRvbWFpbiB0byBYZW4iKQ0KPiANCj4gUmVt
b3ZlIHRoZW0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IDxsaW51eEB0cmVibGlnLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------WBTmppGMVAVGGcQg7lQUzRqO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WBTmppGMVAVGGcQg7lQUzRqO--

--------------oznbd1bzWMDUnRIqUV7Nmirj--

--------------njMfApSgwR0gpdCDJ80Slmx2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh0ttgFAwAAAAAACgkQsN6d1ii/Ey+Y
ygf/WmMTqV3T8Yvag5xY8Pf42LvKU5So8M7IyHu1RbbkN8xc6BXig4V1jLvvWEaBrUR8WjxfYqQg
Vew9sbWztI7c7zzxwKTxFPVxGNGNONDAbqHTrDeUJ61mVz6AefEBE7YR2397lAj9//7oZuC27FK8
pdfK9tE6v7ma5YkstPTL71VQ35PzVd7NxFd3MEnhPyKAycT6MEFckr1xZ64CKWW/MXApmlM9TpAj
qXx+iRWYnd5fjdOLqePNmpmzBQvfmYeTGTqX59eECBQbkwMrUabHPTGvYLRpFBUZH1bd/h5/Mbh2
Ea6kS9NlgSTiQZL1gWAisHOZUKUylkroKdfTc3dhIA==
=aj7k
-----END PGP SIGNATURE-----

--------------njMfApSgwR0gpdCDJ80Slmx2--

