Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21214A7372D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929805.1332551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqKd-0005Ot-0c; Thu, 27 Mar 2025 16:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929805.1332551; Thu, 27 Mar 2025 16:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqKc-0005NC-T9; Thu, 27 Mar 2025 16:43:50 +0000
Received: by outflank-mailman (input) for mailman id 929805;
 Thu, 27 Mar 2025 16:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zm5l=WO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txqKa-0005MK-Us
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:43:48 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7addb45-0b2a-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:43:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a823036so12886725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:43:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662c1csm35842f8f.28.2025.03.27.09.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:43:46 -0700 (PDT)
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
X-Inumbo-ID: a7addb45-0b2a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743093827; x=1743698627; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VSgzcBYwY2oX2th1qZYE/J0ND1I/Q4yGhZR5vEg4m40=;
        b=NbFX5WbZCEiyU4o1Uepidxc4dLRb/SfuahlKQUz94FbfMsj+GdJo2RuLO5ts+xerpD
         7JAJsrUTwYZEUiEywa3uVYMGwnItFR2NPliOnLm2bsg135DTTCs3SjAGZyOFO7+ZLPyL
         6GXYegVJ4KCYuqp3Eu5x/jMId3ULxnbJ3TnLqpqTYxT2PdLH607MRkkke1V2Ozbf0bTD
         idcGxxM2JgIw5gbUti2PlHoB3mssrX2O69XZJGEqlG89eYdVG97qV8xbK/8ad7Mm2YLD
         QVixh/5/yOP0Vk4m00HyPodeG9OFhxoOVB8lc02ZQWtTwqb7JWv3Nwi6Yry5vFHnVOi/
         yabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093827; x=1743698627;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSgzcBYwY2oX2th1qZYE/J0ND1I/Q4yGhZR5vEg4m40=;
        b=Oy1UguZWC/P8gwlsqr9zMhKPL/SiB0ffPg/IK7LXd5LUXC0fN7yc04WPxmIVb9Vi2K
         qf3F6KO5Ny/tHqvA9OIotdEy989xH8uazJbsmsoM1vbSt3sYSTavE9VnnOAeq1nkhmLZ
         pSwR15TuQ/ijYkCvkMa9dYWBttLYIPmXaltTLUUuYhZMc6di1ouYl0MYUhnUk7k5EJYA
         qrr3JoKy8yuhgTnDF88feJ1p02QydNsSnQOlHT493+ycLLzHExb4QoGHg6wyb0N7h0nl
         9UKCrgs9R2sRnjtEWzV9AycKe6Q2e2rKL5G9WpAjBGRUYAzM9TQbwWRBUGScEKf76Ww4
         Coww==
X-Forwarded-Encrypted: i=1; AJvYcCWk75smw17jOAj7ENJHJRxjTagTa0Dc5M18FueSdkCs9Ed8z1jHNHVvmjv/gCxVkrOTkj48hBqGHjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHBT/yr8uBCuRxWSkOD6C9Yc0+trR6StRnWkHk9vOIWhU9hP+6
	CA0YkOzWctBVbfdQb12w30WnelDTf88F5leEc4wVTCTQMTaCOf/BE+1zv6xxX3k=
X-Gm-Gg: ASbGncve5UTJ+NW/1Qtx+sN9C7X3dtXcE3mcNms3OuT6Y9N1vNu6ULFT5ANOmKAH2+1
	sWJPKgnIFKwOanjgFwfV1F4PhenRggVEW1Mkr99kckJXAGjsQkRiRcLlcz5Ky71RqO7o6wb9g6w
	7+j6OEKwr24TKsH3gPCD2pcmrdSeZpkZFa9O6cgbmUkM2UP34rWgWTjA+t8EGHPP7GMfq+DQ22c
	rcE2ju+NGPil7oblQHlfRJiSq2EpIAq8rT9HDBP10u11fQJ8s7M8FsfC4PGBHo5aOObmUEti5pf
	bquOgq8RFuEFvYCQ9OW49XTy05es8lYpSyWaGnUzStF8bMmN1YGhtGoi6TIXFPOdoIJl4h/DEb7
	1gbgXigYOivq1rqqw/5JvpQsk/tuA+j/vovrw0zaYo87K+bYFy/jnXfqhkZdBAVgYVB7SIA==
X-Google-Smtp-Source: AGHT+IGETcCS+lcvQ/bSXVfV+j4aKq6osQvey1TCkg1OOeguFpcPDmpGzo2tnIRTmUzy/vERexcqMA==
X-Received: by 2002:a05:6000:4203:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39ad173eea2mr3280210f8f.4.1743093827292;
        Thu, 27 Mar 2025 09:43:47 -0700 (PDT)
Message-ID: <385a8a49-262e-45d5-a642-50b778014e7d@suse.com>
Date: Thu, 27 Mar 2025 17:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] xenbus: add module description
To: Arnd Bergmann <arnd@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-5-arnd@kernel.org>
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
In-Reply-To: <20250324173242.1501003-5-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w8keZHt3rHXk8cRy2eo8QCgL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w8keZHt3rHXk8cRy2eo8QCgL
Content-Type: multipart/mixed; boundary="------------F1AG3EiYN9pow4cgn9Y0uDto";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <385a8a49-262e-45d5-a642-50b778014e7d@suse.com>
Subject: Re: [PATCH 05/10] xenbus: add module description
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-5-arnd@kernel.org>
In-Reply-To: <20250324173242.1501003-5-arnd@kernel.org>

--------------F1AG3EiYN9pow4cgn9Y0uDto
Content-Type: multipart/mixed; boundary="------------0xl5rnPzp8wogKixk8qdxDys"

--------------0xl5rnPzp8wogKixk8qdxDys
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjUgMTg6MzIsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IA0KPiBNb2R1bGVzIHdpdGhvdXQgYSBkZXNj
cmlwdGlvbiBub3cgY2F1c2UgYSB3YXJuaW5nOg0KPiANCj4gV0FSTklORzogbW9kcG9zdDog
bWlzc2luZyBNT0RVTEVfREVTQ1JJUFRJT04oKSBpbiBkcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlX2Zyb250ZW5kLm8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmVfZnJvbnRlbmQuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmVfZnJvbnRlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJv
bnRlbmQuYw0KPiBpbmRleCBmY2IzMzViYjdiMTguLjhiNzVmODIzNGJhZiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9mcm9udGVuZC5jDQo+ICsr
KyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJvbnRlbmQuYw0KPiBAQCAt
NTEzLDQgKzUxMyw1IEBAIHN0YXRpYyBpbnQgX19pbml0IGJvb3Rfd2FpdF9mb3JfZGV2aWNl
cyh2b2lkKQ0KPiAgIGxhdGVfaW5pdGNhbGwoYm9vdF93YWl0X2Zvcl9kZXZpY2VzKTsNCj4g
ICAjZW5kaWYNCj4gICANCj4gK01PRFVMRV9ERVNDUklQVElPTigiRnJvbnRlbmQgZm9yIFhl
biBidXMgcHJvYmUiKTsNCg0KTWF5IEkgc3VnZ2VzdCAiWGVuIFBWLWRldmljZSBmcm9udGVu
ZCBzdXBwb3J0IiBpbnN0ZWFkPw0KDQoNCkp1ZXJnZW4NCg0K
--------------0xl5rnPzp8wogKixk8qdxDys
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0xl5rnPzp8wogKixk8qdxDys--

--------------F1AG3EiYN9pow4cgn9Y0uDto--

--------------w8keZHt3rHXk8cRy2eo8QCgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmflgEIFAwAAAAAACgkQsN6d1ii/Ey8l
Cgf/QdTgh0S8GyuOrXH4CS4NQcobLgn90Kiaq0zOu9lWQsP+ZmmErrpyL35QGksWt++2Im+FMNO2
FuJdlBfbDHZKy+I031s09fzIaMt/8xXpQF6e8HdDQHWWUzxzZ7tsHsaXOhGmi4wDh98P9MVL9nuG
6iJ7mRSSRW7VVoHl7A3DVUQxw4oxuiSkEl82OnBYre2bbyfl4j6PrsoFieGW+7a3LvJVqmH/sD6r
t14w6TWb3aT6AUnQCnabc0peyZA/QHbWSZnLVDmFnGvc0sa5FlpvfTNeVjyrj9QrAodBXewg8W2A
A/iQOgMOkxjoA3+jxig/eTaweP6QlcCcF2L06Jzi+g==
=jn45
-----END PGP SIGNATURE-----

--------------w8keZHt3rHXk8cRy2eo8QCgL--

