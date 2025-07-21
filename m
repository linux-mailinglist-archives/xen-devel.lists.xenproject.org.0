Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD4FB0BE72
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051124.1419404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlZG-0000vC-8s; Mon, 21 Jul 2025 08:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051124.1419404; Mon, 21 Jul 2025 08:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlZG-0000sB-5h; Mon, 21 Jul 2025 08:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1051124;
 Mon, 21 Jul 2025 08:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1udlZF-0000s5-67
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:08:13 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8356598-6609-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 10:08:11 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2228379f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 01:08:11 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d77bsm9701547f8f.70.2025.07.21.01.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 01:08:10 -0700 (PDT)
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
X-Inumbo-ID: d8356598-6609-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753085291; x=1753690091; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FsBH5UkZysJKmJNnMFhoOFx9DRDX5nGCj31EjqzhEDY=;
        b=EFlS2g+SGVdMvzS9UEphcPHdWRQbY990m8EiVFxg9AIbH6HmU9oa+3fdmTsf+0WUiM
         6v0cvdg81luAFVkY5u9lksRni2jtLiehhU1ji4YPNqDkqyalel4nKKy5ynzqXE4LUXgF
         SjUsIF00Vcy8bGYezt9QURJjRpxJtPWOpqu4domIgZP5J2AQzgdoSqpn7Fl+XGNu5Qyg
         JzpswBLjL4zbxOSEtrYrJz2dSvLdNG0JsblyfR5zWUl1xDgr8yHU3rAMv4ZVoW6zvXwL
         Wwi9hxfCnT8mxq8E9+fj8D5nJXeho/1C96l6Yjfm4hXJdQH7bSNUmco1r4FgOwnRngmF
         G3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753085291; x=1753690091;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsBH5UkZysJKmJNnMFhoOFx9DRDX5nGCj31EjqzhEDY=;
        b=O1H/shhXZnhlz22IzDsvaEucVvSGPbMot9ghrJ7OYZFcaN2k2uOYoNK/q44jMeRklE
         kQ2x8Trr89edPDezlfe+pBXgxlIZrZgvZOausjzZisGH2mm5vQblJH2gsygDwmDHSUsl
         RaMgR2OmsCHcsxTaHed+1u1RTfouUHJIPsaGwbS9/8KCXOtQoc7Lu+6Fjp4Hea9WC+ni
         Kt+lP/7SY8PP44OqPvXjXcjo9+vjO3wxGsJSxyZ2L8Yz+oOZVz5nATDAaBFxrBeodQZ3
         iunr7QmErDuQc4fU9Y7L+wiUlPVl4DX+OrveeVWte22AMIF66jViPbXHqM52xjT7ccq7
         uU4w==
X-Forwarded-Encrypted: i=1; AJvYcCWxkbGiTg8Vs01r6Eq9TPrZA3jInfQXWCqfjXNzKW/aoTQLx5qUvKj0Dy4PcMbBWmOaAFJxGT4XH7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9QU9zsMYBr/vgVeGHqwp3IhrdSPM93mSyeShVyfbz7GG4poWN
	atsBytHUuU9wR43RecnD880nc2OwVIkxy1lqQb0us9qIK/5JHkclxQKH493FFN+TffQ=
X-Gm-Gg: ASbGncusKt6sPeidV4VUykC39CA8hRPyUXw2S7bRX6phAPSGkRlkXkugJarcAhO4xbH
	gfEv/QlZexuYFOcbxdXPfYzEm/p//I0gdGOJy2a1a7Y7FLGQmZNHtE7S5BLQtz4xOC6fHzTNzvH
	gndctLl58kfhn6TdIRnWh/gbbYm6oce+k8U3+HPGgMsTE14kOQCbu56fVKN+/vS0PMG+JBOB41N
	5V5hBnaje207kuBReTF43ya2Jbv/F5aaxQP9FjBT4NdzhVOFQjgLWS5uYgHXcbY6ZCkbI9TKpR3
	VxiC/Kymq5UV3wwGRWZ4cAKYjgZiH85my0j/P4tkBnv48806BPwU8koiRSpZZosOgDbhw05oUPd
	RxY3+zZT+71NoxRxzTqlXgetN0V2sYaefNkC3SFr+ptlLeJKOASiK0ippnKaNUAEtHVPI5q09YA
	lBBzm+Ah47nHng8LSfPMl4Spn6y6vjVCAiCPg5E+Ho8YT1
X-Google-Smtp-Source: AGHT+IGBQyno0uqjlBEU0nR8buZeUT1zuNnkqytPYtT5FFlyTn5OvCgtMaaD5MTf1PxBAtTT6qE+ig==
X-Received: by 2002:a05:6000:23c3:b0:3a4:ebfc:8c7 with SMTP id ffacd0b85a97d-3b613ab2829mr8377328f8f.8.1753085291049;
        Mon, 21 Jul 2025 01:08:11 -0700 (PDT)
Message-ID: <9669f64d-06a0-4c56-b7d3-8b0abe7a1d4b@suse.com>
Date: Mon, 21 Jul 2025 10:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Julien Grall <julien@xen.org>, Mykola Kvach <xakep.amatop@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
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
In-Reply-To: <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j2WlyCDdZjrIVbABe1dcipli"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j2WlyCDdZjrIVbABe1dcipli
Content-Type: multipart/mixed; boundary="------------hX9rUnfvUiGgwvRI0EYANN1V";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Mykola Kvach <xakep.amatop@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Message-ID: <9669f64d-06a0-4c56-b7d3-8b0abe7a1d4b@suse.com>
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
In-Reply-To: <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>

--------------hX9rUnfvUiGgwvRI0EYANN1V
Content-Type: multipart/mixed; boundary="------------6nMq5dzF7d4aMD0Lwm2R8PkM"

--------------6nMq5dzF7d4aMD0Lwm2R8PkM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDYuMjUgMjA6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTXlrb2xhLA0K
PiANCj4gT24gMjcvMDYvMjAyNSAxMTo1MSwgTXlrb2xhIEt2YWNoIHdyb3RlOg0KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZXJmY19kZWZuLmggYi94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vIA0KPj4gcGVyZmNfZGVmbi5oDQo+PiBpbmRleCBlZmZk
MjViNjllLi44ZGZjYWM3ZTNiIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL3BlcmZjX2RlZm4uaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3BlcmZjX2RlZm4uaA0KPj4gQEAgLTMzLDYgKzMzLDcgQEAgUEVSRkNPVU5URVIodnBzY2lf
c3lzdGVtX3Jlc2V0LMKgwqDCoMKgwqDCoMKgICJ2cHNjaTogc3lzdGVtX3Jlc2V0IikNCj4+
IMKgIFBFUkZDT1VOVEVSKHZwc2NpX2NwdV9zdXNwZW5kLMKgwqDCoMKgwqDCoMKgwqAgInZw
c2NpOiBjcHVfc3VzcGVuZCIpDQo+PiDCoCBQRVJGQ09VTlRFUih2cHNjaV9jcHVfYWZmaW5p
dHlfaW5mbyzCoMKgICJ2cHNjaTogY3B1X2FmZmluaXR5X2luZm8iKQ0KPj4gwqAgUEVSRkNP
VU5URVIodnBzY2lfZmVhdHVyZXMswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidnBzY2k6IGZl
YXR1cmVzIikNCj4+ICtQRVJGQ09VTlRFUih2cHNjaV9zeXN0ZW1fc3VzcGVuZCzCoMKgwqDC
oMKgICJ2cHNjaTogc3lzdGVtX3N1c3BlbmQiKQ0KPj4gwqAgUEVSRkNPVU5URVIodmNwdV9r
aWNrLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ2Y3B1OiBub3RpZnkgb3Ro
ZXIgdmNwdSIpDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Bz
Y2kuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wc2NpLmgNCj4+IGluZGV4IDQ3ODA5
NzI2MjEuLjQ4YTkzZTZiNzkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vcHNjaS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcHNjaS5o
DQo+PiBAQCAtNDcsMTAgKzQ3LDEyIEBAIHZvaWQgY2FsbF9wc2NpX3N5c3RlbV9yZXNldCh2
b2lkKTsNCj4+IMKgICNkZWZpbmUgUFNDSV8wXzJfRk4zMl9TWVNURU1fT0ZGwqDCoMKgwqDC
oMKgwqDCoMKgIFBTQ0lfMF8yX0ZOMzIoOCkNCj4+IMKgICNkZWZpbmUgUFNDSV8wXzJfRk4z
Ml9TWVNURU1fUkVTRVTCoMKgwqDCoMKgwqDCoCBQU0NJXzBfMl9GTjMyKDkpDQo+PiDCoCAj
ZGVmaW5lIFBTQ0lfMV8wX0ZOMzJfUFNDSV9GRUFUVVJFU8KgwqDCoMKgwqDCoCBQU0NJXzBf
Ml9GTjMyKDEwKQ0KPj4gKyNkZWZpbmUgUFNDSV8xXzBfRk4zMl9TWVNURU1fU1VTUEVORMKg
wqDCoMKgwqAgUFNDSV8wXzJfRk4zMigxNCkNCj4+IMKgICNkZWZpbmUgUFNDSV8wXzJfRk42
NF9DUFVfU1VTUEVORMKgwqDCoMKgwqDCoMKgwqAgUFNDSV8wXzJfRk42NCgxKQ0KPj4gwqAg
I2RlZmluZSBQU0NJXzBfMl9GTjY0X0NQVV9PTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFBTQ0lfMF8yX0ZONjQoMykNCj4+IMKgICNkZWZpbmUgUFNDSV8wXzJfRk42NF9BRkZJTklU
WV9JTkZPwqDCoMKgwqDCoMKgIFBTQ0lfMF8yX0ZONjQoNCkNCj4+ICsjZGVmaW5lIFBTQ0lf
MV8wX0ZONjRfU1lTVEVNX1NVU1BFTkTCoMKgwqDCoMKgIFBTQ0lfMF8yX0ZONjQoMTQpDQo+
PiDCoCAvKiBQU0NJIHYwLjIgYWZmaW5pdHkgbGV2ZWwgc3RhdGUgcmV0dXJuZWQgYnkgQUZG
SU5JVFlfSU5GTyAqLw0KPj4gwqAgI2RlZmluZSBQU0NJXzBfMl9BRkZJTklUWV9MRVZFTF9P
TsKgwqDCoMKgwqAgMA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS92cHNjaS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zwc2NpLmgNCj4+IGluZGV4
IDBjY2E1ZTY4MzAuLjY5ZDQwZjlkN2YgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vdnBzY2kuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3Zwc2NpLmgNCj4+IEBAIC0yMyw3ICsyMyw3IEBADQo+PiDCoCAjaW5jbHVkZSA8YXNtL3Bz
Y2kuaD4NCj4+IMKgIC8qIE51bWJlciBvZiBmdW5jdGlvbiBpbXBsZW1lbnRlZCBieSB2aXJ0
dWFsIFBTQ0kgKG9ubHkgMC4yIG9yIGxhdGVyKSAqLw0KPj4gLSNkZWZpbmUgVlBTQ0lfTlJf
RlVOQ1PCoCAxMg0KPj4gKyNkZWZpbmUgVlBTQ0lfTlJfRlVOQ1PCoCAxNA0KPj4gwqAgLyog
RnVuY3Rpb25zIGhhbmRsZSBQU0NJIGNhbGxzIGZyb20gdGhlIGd1ZXN0cyAqLw0KPj4gwqAg
Ym9vbCBkb192cHNjaV8wXzFfY2FsbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWlu
dDMyX3QgZmlkKTsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW11L3AybS5jIGIv
eGVuL2FyY2gvYXJtL21tdS9wMm0uYw0KPj4gaW5kZXggNjcyOTZkYWJiNS4uZjljMDlhNDll
MiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9tbXUvcDJtLmMNCj4+IEBAIC02LDYgKzYsOCBAQA0KPj4gwqAgI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPg0KPj4gwqAgI2luY2x1ZGUgPHhlbi9zb2Z0aXJxLmg+DQo+PiAr
I2luY2x1ZGUgPHB1YmxpYy9zY2hlZC5oPg0KPj4gKw0KPj4gwqAgI2luY2x1ZGUgPGFzbS9h
bHRlcm5hdGl2ZS5oPg0KPj4gwqAgI2luY2x1ZGUgPGFzbS9ldmVudC5oPg0KPj4gwqAgI2lu
Y2x1ZGUgPGFzbS9mbHVzaHRsYi5oPg0KPj4gQEAgLTE5OCw3ICsyMDAsOSBAQCB2b2lkIGR1
bXBfcDJtX2xvb2t1cChzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGFkZHIpDQo+PiDCoMKg
ICovDQo+PiDCoCB2b2lkIHAybV9zYXZlX3N0YXRlKHN0cnVjdCB2Y3B1ICpwKQ0KPj4gwqAg
ew0KPj4gLcKgwqDCoCBwLT5hcmNoLnNjdGxyID0gUkVBRF9TWVNSRUcoU0NUTFJfRUwxKTsN
Cj4+ICvCoMKgwqAgaWYgKCAhKHAtPmRvbWFpbi0+aXNfc2h1dHRpbmdfZG93biAmJg0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgIHAtPmRvbWFpbi0+c2h1dGRvd25fY29kZSA9PSBTSFVU
RE9XTl9zdXNwZW5kKSApDQo+IA0KPiBUaGlzIGlzIGRlZmluaXRlbHkgbm90IG9idmlvdXMg
d2h5IHlvdSBuZWVkIHRvIGNoYW5nZSBwMm1fc2F2ZV9zdGF0ZSgpLiBBRkFJVSwgDQo+IHlv
dSBhcmUgZG9pbmcgdGhpcyBiZWNhdXNlIHdoZW4gc3VzcGVuZGluZyB0aGUgc3lzdGVtLCB5
b3Ugd2lsbCBvdmVyd3JpdGUgcC0gDQo+ICA+YXJjaC5zY3Rsci4gSG93ZXZlciwgdGhpcyBp
cyBzdXBlciBmcmFnaWxlLiBGb3IgaW5zdGFuY2UsIHlvdSBzdGlsbCBzZWVtIHRvIA0KPiBv
dmVyd3JpdGUgVFRCUnswLDF9IGFuZCBUVEJDUi4NCj4gDQo+IFRUQlJ7MCwxfSBhcmUgdGVj
aG5pY2FsbHkgdW5rbm93biBhdCBib290LiBTbyBpdCBpcyBmaW5lIHRvIGlnbm9yZSB0aGVt
LiDCoEJ1dCANCj4gZm9yIFRUQkNSLCBJIGFtIG5vdCAxMDAlIHdoZXRoZXIgdGhpcyBpcyBz
dXBwb3NlZCB0byBiZSB1bmtub3duLg0KPiANCj4gQW55d2F5LCBhZGRpbmcgbW9yZSAiaWYg
KC4uLikiIGlzIG5vdCB0aGUgcmlnaHQgc29sdXRpb24gYmVjYXVzZSBpbiB0aGUgZnV0dXJl
IA0KPiB3ZSBtYXkgZGVjaWRlIHRvIHJlc2V0IG1vcmUgcmVnaXN0ZXJzLg0KPiANCj4gSXQg
d291bGQgYmUgYmV0dGVyIGlmIHdlIHN0YXNoIHRoZSB2YWx1ZSBzYW5kIHRoZW4gdXBkYXRl
IHRoZSByZWdpc3RlcnMuIEFub3RoZXIgDQo+IHBvc3NpYmlsaXR5IHdvdWxkIGJlIHRvIGVu
dGlyZWx5IHNraXAgdGhlIHNhdmUgcGF0aCBmb3IgQ1BVcyB0aGF0IGFyZSB0dXJuZWQgb2Zm
IA0KPiAoYWZ0ZXIgYWxsIHRoaXMgaXMgYSBiaXQgdXNlbGVzcyB3b3JrLi4uKS4NCj4gDQo+
PiArc3RhdGljIGludCBkb19jb21tb25fY3B1X29uKHJlZ2lzdGVyX3QgdGFyZ2V0X2NwdSwg
cmVnaXN0ZXJfdCBlbnRyeV9wb2ludCwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnaXN0ZXJfdCBjb250ZXh0X2lkKQ0K
Pj4gK3sNCj4+ICvCoMKgwqAgaW50IHJjOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgdmNwdSAqdjsN
Cj4+ICvCoMKgwqAgc3RydWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4+ICvC
oMKgwqAgcmVnaXN0ZXJfdCB2Y3B1aWQ7DQo+PiArDQo+PiArwqDCoMKgIHZjcHVpZCA9IHZh
ZmZpbml0eV90b192Y3B1aWQodGFyZ2V0X2NwdSk7DQo+PiArDQo+PiArwqDCoMKgIGlmICgg
KHYgPSBkb21haW5fdmNwdShkLCB2Y3B1aWQpKSA9PSBOVUxMICkNCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFNDSV9JTlZBTElEX1BBUkFNRVRFUlM7DQo+PiArDQo+PiArwqDCoMKg
IGlmICggIXRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSApDQo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIFBTQ0lfQUxSRUFEWV9PTjsNCj4+ICsNCj4+ICvCoMKgwqAg
cmMgPSBkb19zZXR1cF92Y3B1X2N0eCh2LCBlbnRyeV9wb2ludCwgY29udGV4dF9pZCk7DQo+
PiArwqDCoMKgIGlmICggcmMgPT0gUFNDSV9TVUNDRVNTICkNCj4+ICvCoMKgwqDCoMKgwqDC
oCB2Y3B1X3dha2Uodik7DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiByYzsNCj4+ICt9DQo+
PiArDQo+PiDCoCBzdGF0aWMgaW50MzJfdCBkb19wc2NpX2NwdV9vbih1aW50MzJfdCB2Y3B1
aWQsIHJlZ2lzdGVyX3QgZW50cnlfcG9pbnQpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGlu
dDMyX3QgcmV0Ow0KPj4gQEAgLTE5Nyw2ICsyMDgsNTIgQEAgc3RhdGljIHZvaWQgZG9fcHNj
aV8wXzJfc3lzdGVtX3Jlc2V0KHZvaWQpDQo+PiDCoMKgwqDCoMKgIGRvbWFpbl9zaHV0ZG93
bihkLFNIVVRET1dOX3JlYm9vdCk7DQo+PiDCoCB9DQo+PiArc3RhdGljIHZvaWQgZG9fcmVz
dW1lX29uX2Vycm9yKHN0cnVjdCBkb21haW4gKmQpDQo+IA0KPiBUaGlzIGxvb2tzIGxpa2Ug
YW4gb3Blbi1jb2RpbmcgdmVyc2lvbiBvZiBkb21haW5fcmVzdW1lKCkgd2l0aG91dCB0aGUg
DQo+IGRvbWFpbl97LHVufXBhdXNlKCkuIFdoYXQgd29ycmllcyBtZSBpcyB0aGVyZSBpcyBh
IGNvbW1lbnQgb24gdG9wIG9mDQo+IGRvbWFpbl9wYXVzZSgpIGV4cGxhaW5pbmcgd2h5IGl0
IGlzIGNhbGxlZC4gSSB1bmRlcnN0YW5kLCB3ZSBjYW4ndCBjYWxsIA0KPiBkb21haW5fcGF1
c2UoKSBoZXJlIChpdCBkb2Vzbid0IHdvcmsgb24gdGhlIGN1cnJlbnQgZG9tYWluKS4gSG93
ZXZlciwgaXQgZmVlbHMgDQo+IHRvIG1lIHRoZXJlIGlzIGFuIGV4cGxhbmF0aW9uIG5lY2Vz
c2FyeSB3aHkgdGhpcyBpcyBmaW5lIHRvIGRpdmVyZ2UuDQo+IA0KPiBJIGFtIG5vdCBhIHNj
aGVkdWxlciBleHBlcnQsIHNvIEkgYW0gQ0NpbmcgSnVlcmdlbiBpbiB0aGUgaG9wZSBoZSBj
b3VsZCBwcm92aWRlIA0KPiBzb21lIGlucHV0cy4NCg0KSSBkb24ndCB0aGluayB0aGUgcmVh
c29uIGZvciBkb21haW5fW3VuXXBhdXNlKCkgaXMgZGlyZWN0bHkgc2NoZWR1bGluZw0KcmVs
YXRlZC4NCg0KSXQgc2VlbXMgdG8gYmUgeDg2IHNwZWNpZmljIGZvciBzaGFkb3cgcGFnZSB0
YWJsZSBoYW5kbGluZy4NCg0KSW4gYW55IGNhc2UgSSdkIHN1Z2dlc3QgdG8gc3BsaXQgZG9t
YWluX3Jlc3VtZSgpIGludG8gMiBmdW5jdGlvbnMsIG9uZQ0Kb2YgdGhlbSAoZS5nLiBkb21h
aW5fcmVzdW1lX25vcGF1c2UoKSkgcmVwbGFjaW5nIGRvX3Jlc3VtZV9vbl9lcnJvcigpDQph
bmQgZG9tYWluX3Jlc3VtZSgpIGp1c3QgcGF1c2luZyB0aGUgZG9tYWluLCBjYWxsaW5nIHRo
ZSBuZXcgZnVuY3Rpb24sDQphbmQgdGhlbiB1bnBhdXNpbmcgdGhlIGRvbWFpbiBhZ2Fpbi4N
Cg0KQW5vdGhlciBvcHRpb24gbWlnaHQgYmUgdG8gbW92ZSB0aGUgc3VzcGVuZCBhY3Rpb24g
aW50byBhIHRhc2tsZXQsIGVuYWJsaW5nDQp0byBjYWxsIGRvbWFpbl9yZXN1bWUoKSBkaXJl
Y3RseSBpZiBuZWVkZWQuIEkgZGlkbid0IGNoZWNrIHdoZXRoZXIgb3RoZXINCmNvbnN0cmFp
bnRzIGV2ZW4gYWxsb3cgdGhpcyBpZGVhLCB0aG91Z2guDQoNCg0KSnVlcmdlbg0K
--------------6nMq5dzF7d4aMD0Lwm2R8PkM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6nMq5dzF7d4aMD0Lwm2R8PkM--

--------------hX9rUnfvUiGgwvRI0EYANN1V--

--------------j2WlyCDdZjrIVbABe1dcipli
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh99WoFAwAAAAAACgkQsN6d1ii/Ey8E
Pgf+N3ySSkTFFenzt4IoCKQS7GFAqZcdxujPL1owGECwqwapJHGAcbJo3mOHqNfk/Wo05RycK2do
vNeCO6ubKPw+3JiNeiDTSdP/t3RApg5hZpKrMs2E1NN/d2PK12bJxN1vrcDpHeXxbu/dzfEtMEx7
AXNn8ToTtLHih9GZk9c7wlLkXbCX46xwkDh8+sXMdNGFtZSM0X8Zg5WQY9LS1gj3H5nKjzgLTEXm
X3Erq6s5AbE7CofrInYtzTG/P0Gg9lhFcWFZ6x4eo7pf1Nbot79NGBvl0vRHQSu9w8xTmWbpJBX9
MoFDEZeoOR4/KfRIjDEsmyOKDmdFSfKeoATh1BTHKw==
=W1+c
-----END PGP SIGNATURE-----

--------------j2WlyCDdZjrIVbABe1dcipli--

