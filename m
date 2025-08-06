Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0CB1C062
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071201.1434701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXS6-0003GH-JI; Wed, 06 Aug 2025 06:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071201.1434701; Wed, 06 Aug 2025 06:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujXS6-0003DH-Fx; Wed, 06 Aug 2025 06:16:42 +0000
Received: by outflank-mailman (input) for mailman id 1071201;
 Wed, 06 Aug 2025 06:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qIJJ=2S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ujXS4-0002le-UC
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:16:41 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9bedae4-728c-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:16:39 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so29882295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:16:39 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5862fd9sm34867245e9.16.2025.08.05.23.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:16:38 -0700 (PDT)
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
X-Inumbo-ID: e9bedae4-728c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754460999; x=1755065799; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EfjgkGwfrIsHoLccWomWDrPNyQUZPefsLJ5d+rdWi0c=;
        b=T0fCfVT7mRvvnkwAnjXzlAZ5QE/onQLx8bxmXEK+MCLvNCDlgCT8P+hJkRnsjJTtk8
         tAd7zsVskphCDxHOtR4yRl7vgSyEeMZAcZvTQT3AvRW5JmOSJQ7HhAEz+BhI7hDxiwtT
         hw+puviHpJP0ujwnekFs2h5MCnx+mHUC1tGy1jYBRM77R+M96D+qrZyxdUqpvm5E1mX9
         mWhr37/5awUPc/Z2h1vnhLKxQ1XSgDInSvT/hLF1YJ5eH8fOqxrnkUYf4w3Tyq7pZJ2+
         7iFqHgmuZbm+R/8bNr4rhOgIJttFtLwniGHKU/LxR0yCZkaZc3vhvb1IQdvKKyhOcos9
         1G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754460999; x=1755065799;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EfjgkGwfrIsHoLccWomWDrPNyQUZPefsLJ5d+rdWi0c=;
        b=PSesYiTh1nnIlMp9VaYy5am/qMoA2nA5kf06SUj54T6ksvOIOO12+7cRb+b/EwrpIL
         +LIy7jsWeD8bh1PEPv9ZzGrJdLB7u0uVMPEviKtPumUMgPTlhl96jXp0Hd+Pi5wOTKfv
         /cPaixdNjXepuq+4jpjIrYjmwmHnxhJvJhKewXJki53TSFgBDwvrUJjbzUHlqkYUVGQ4
         PX6yHP9YL3n4MkJ127jW0KLzNR6BJVid3b97BNyLyaSEtn6ppVoScbM3UmMezzneLkOa
         DwpRaEEMU6YTI2/xJ2G65hn5C7iz8WZiP6CqoRemKOaEG0qHeuulspX8lCQWEKuSoZu5
         FUYg==
X-Forwarded-Encrypted: i=1; AJvYcCX9T6teYhGk8iZSc89SJDI/unz/siz7H5yyjI+v2A/6yWPQHyX0B/1bAanBtvMcxp2eKsP0kzwG9+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+e9XUzTA1mcI9baW7ud7T1Wa2pRl6tjEcyTQTd9PC0vbGWxZy
	WPafS6a0rG/ah0vWY4788MnwjKTau+yAqmtnlV8BC0QApd3Fh1jBR6cFiW1FGBXJrAc=
X-Gm-Gg: ASbGnctfs6uaYjIJPsEPcMob9VBiGENUqPZ3R83Qb+HY3KvxGmhCYF3pp5TNxvp898c
	J0ugMbZO+s4J7Luzo0ft4a8JFWcvycK8Bgx0KdGr8jflWH2vEhCmN8thAoJ6dXLJM0X5l/CTS53
	orQEsgFJwAiyoWoBaewt8V214PsKFlkr90833Xem3sqB1Fdy6YzfZ6iNN+yMM698oIpGb3ByUr0
	CUIcukRY7LVUdJTH9GtJGf/Bvg1Kr+OKIpKTHWj/HuSrRVnDo6O81liA+HiO0QqMfqh4DL2aCXv
	VZlAlxF/QNUOyU1Pjy1/r/5tTuYCuHy9z8IieHXZjUFueUAOipzNzT4aUaZeYkf0OcPOLSkYDM5
	akfhTmcsBCIWw5BdiAfmBBn+x6TFGiT2hxevrqzrauRiOt7rKu4JylxzjI8LHpCN4ARhN945OCQ
	/QqqOxhB4ZRDGXnQQ9d79k6g+UhZWP3wJ6Nlc0QQWvsg==
X-Google-Smtp-Source: AGHT+IE8pKu91gZjLRrj9BjUUmyuNdG9NhwBYbgTaBNG4dApwP96ZXhAHfjYU1Qji0ekd/skN85QcQ==
X-Received: by 2002:a05:600c:1ca6:b0:458:bfb1:1fc7 with SMTP id 5b1f17b1804b1-459e707ffd9mr10846625e9.6.1754460998537;
        Tue, 05 Aug 2025 23:16:38 -0700 (PDT)
Message-ID: <8b18a14c-6436-4266-9a50-20a9b85c12ae@suse.com>
Date: Wed, 6 Aug 2025 08:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.21 Development Update [June-July]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, "Penny Zheng,"
 <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
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
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bha8zBvQP4eh14IxMIwCC8YT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bha8zBvQP4eh14IxMIwCC8YT
Content-Type: multipart/mixed; boundary="------------y4XDt7UpE0rgiID9Ta9FSqkU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, "Jason Andryuk,"
 <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, "Penny Zheng,"
 <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki=2C?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
Message-ID: <8b18a14c-6436-4266-9a50-20a9b85c12ae@suse.com>
Subject: Re: Xen 4.21 Development Update [June-July]
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>

--------------y4XDt7UpE0rgiID9Ta9FSqkU
Content-Type: multipart/mixed; boundary="------------SppeSxdwE2m0ImLmFQPGKzTi"

--------------SppeSxdwE2m0ImLmFQPGKzTi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjUgMjA6MTksIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IEhlbGxvIGV2
ZXJ5b25lLA0KPiANCj4gVGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhl
bi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciBpdGVtcyB5b3UNCj4gd291bGQgbGlrZSB0
byBzZWUgaW4gNC4yMSBzbyB0aGF0IHBlb3BsZSBoYXZlIGFuIGlkZWEgd2hhdCBpcyBnb2lu
ZyBvbiBhbmQNCj4gcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4NCj4gDQo+IFlvdSdyZSB3ZWxj
b21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNlcyBvZiB0aGUgZmVhdHVy
ZSB5b3UncmUNCj4gd29ya2luZyBvbi4NCj4gDQo+ID0gVGltZWxpbmUgPQ0KPiANCj4gVGhl
IGN1cnJlbnQgcmVsZWFzZSBzY2hlZHVsZSBjb3VsZCBiZSBmb3VuZCBoZXJlOg0KPiAgwqAg
aHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX1Byb2plY3RfWC5ZWV9SZWxl
YXNlX05vdGVzDQo+IA0KPiBBbmQgYXMgYSByZW1pbmRlciBJIHdvdWxkIGxpa2UgdG8gcmVt
aW5kIGF0IHRoZSBvZiB0aGlzIHdlZWsgd2Ugd2lsbCBoYXZlDQo+IExhc3QgcG9zdGluZyBk
YXRlIChGcmkgQXVnIDA4LCAyMDI1KS4NCj4gDQo+ID0gVXBkYXRlcyA9DQo+IA0KPiBUaGUg
Zm9sbG93aW5nIGl0ZW1zICggdGhlIGxpbmtzIGZvciB0aGVtIGNvdWxkIGJlIGZvdW5kIGlu
dCB0aGUgbGlzdCBiZWxvdyApDQo+IHdlcmUgbW92ZWQgdG8gY29tcGxldGVkOg0KPiAgwqAg
W3NpbmNlIEp1bjIgLSBBdWc1XToNCj4gIMKgwqAgQWRkZWQgc29tZSB0YWdzOiBbNC4yMV0s
IFtuZXh0LXJlbChzKV0gdG8gdGhlIGxpc3QgIkZ1bGwgbGlzdCBvZiBpdGVtcyINCj4gIMKg
wqAgYmVsb3cuDQo+ICDCoMKgICogeDg2Og0KPiAgwqDCoMKgIC0ga2V4ZWM6IGFkZCBrZXhl
YyBzdXBwb3J0IHRvIE1pbmktT1MuDQoNCkFuZCB3aXRoIHRoYXQ6DQoNCi0gUFZIIHhlbnN0
b3JlLXN0dWJkb20gbGl2ZSB1cGRhdGUNCg0KPiAgwqDCoMKgIC0geDg2OiBtZW1jcHkoKSAv
IG1lbXNldCgpIChub24tKUVSTVMgZmxhdm9ycyBwbHVzIGZhbGxvdXQNCj4gIMKgwqAgKiBB
cm06DQo+ICDCoMKgwqAgLSBTTU1VIGhhbmRsaW5nIGZvciBQQ0llIFBhc3N0aHJvdWdoIG9u
IEFSTS4NCj4gIMKgwqDCoCAtIEFkZCBzdXBwb3J0IGZvciBSLUNhciBHZW40IFBDSSBob3N0
IGNvbnRyb2xsZXIuDQo+ICDCoMKgwqAgLSBGaXJzdCBjaHVuayBmb3IgQXJtIFI4MiBhbmQg
TVBVIHN1cHBvcnQuDQo+ICDCoMKgwqAgLSBFbmFibGUgUjUyIHN1cHBvcnQgZm9yIHRoZSBm
aXJzdCBjaHVuayBvZiBNUFUgc3VwcG9ydA0KPiAgwqDCoMKgIC0gQVJNIHNwbGl0IGhhcmR3
YXJlIGFuZCBjb250cm9sIGRvbWFpbnMuDQo+ICDCoMKgICogUklTQy1WOg0KPiAgwqDCoMKg
IC0gSW50cm9kdWNlIGJhc2ljIFVBUlQgc3VwcG9ydCBhbmQgaW50ZXJydXB0cyBmb3IgaHlw
ZXJ2aXNvciBtb2RlLg0KDQoqIEh5cGVydmlzb3I6DQogICAtIHRvb2xzOiBzdXBwb3J0IGZv
ciBwZXItZG9tYWluIFhlbnN0b3JlIGZlYXR1cmVzDQoNCg0KSnVlcmdlbg0K
--------------SppeSxdwE2m0ImLmFQPGKzTi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SppeSxdwE2m0ImLmFQPGKzTi--

--------------y4XDt7UpE0rgiID9Ta9FSqkU--

--------------Bha8zBvQP4eh14IxMIwCC8YT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiS80QFAwAAAAAACgkQsN6d1ii/Ey+4
iggAm7vuT0ExEDfNVmXxNT6ufz9JkVKvlevFUUI8sk8LaPJQewZ+ggErkgVZSbqje5tsIo8gR9k5
q0xLHNVgUrNh5CSULrX1XataS6m4Blw4ayCTGaQsMVy+EK9RrqIctpnczaCE2zdny3WEJkGfsoDS
Glh5VZ2WngLs1Yrl3jzk+Ec9cNwNPY9Xdvr3EV0u0RsYrtNPAYD0E8YIWv0xwpalhxQqdUYAwAvd
lzWVe/Ql+nJBLwubFKsGiGdaO5yuy6O5F5I8SKrl6QYcW87opRyWfKeMkrhHu4pICnA2CxY+fBBn
TZwSp7pGGFBqZ7GLdXYDjnMRVvZ3yQAKJQF/mzHnug==
=b3X8
-----END PGP SIGNATURE-----

--------------Bha8zBvQP4eh14IxMIwCC8YT--

