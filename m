Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C92973945
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795628.1205034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1RQ-0007H1-9Y; Tue, 10 Sep 2024 14:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795628.1205034; Tue, 10 Sep 2024 14:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1RQ-0007EC-5p; Tue, 10 Sep 2024 14:02:00 +0000
Received: by outflank-mailman (input) for mailman id 795628;
 Tue, 10 Sep 2024 14:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1so1RO-0007E6-Cu
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:01:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0e4a0c-6f7d-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:01:55 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3d87dd4c3so2692007a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:01:55 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46819sm4267027a12.31.2024.09.10.07.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:01:52 -0700 (PDT)
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
X-Inumbo-ID: 3d0e4a0c-6f7d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725976915; x=1726581715; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PGunApKAEIRVJPpaAO+tPT/E5yF1bP4lhTF7+4Wv/DI=;
        b=MtGHX/0JFh8IWfTXPpA+xX3U8qFN6sA6CnYH32RSrHvRSYwLdSRk6Fbhu1YSAI86QG
         VQhWKk3CKQlIPddiumrjbwr7Jci9U6RMWwCkBS5yl0I/6a1DvFgGRULZwuwT9+kINCrE
         UevKloltMPh3eZtAKMrKdI4H/p6nkqt5Gn2SSUD33kNggN+3JrljYIUjyDMOW6p37/ih
         zJmSNS5YjDouAjwqiNb+NbhXCe7f4fAjpM9XoyKpjs8IkmpzPlP3+Afjw+KHduHQLQBN
         yI6oiKIv43p/Na431sXOE8BMBPDtO+aZCuyLjWqvhMrfZZPGjWYZnq2FanIFOm/PAN2+
         Bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976915; x=1726581715;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGunApKAEIRVJPpaAO+tPT/E5yF1bP4lhTF7+4Wv/DI=;
        b=BYEIIqkBTpo+IQBbOFLoCUFgSGGCjxdTuoKXs13L2jKd/MKnrGpkyCsVo8bvqpVRtS
         Lg3x64210yWiUEn4Oz5WRklxxcA63UwIvMtR1KOckRvV6Py+F+Mlh799yZwY7zBE5rwo
         kPhx6/NVe1m4f8yyN2sOWFpdvgMVfk4L7AMZi64v+KJBGwXJEk+kiF5ouq4HZfAH+LeS
         lGK8CmtwG/5gwmsD1gt5A5oPJ/MQfKDCZe5mafPzX95bOZIBezUXHFBL7y8EWX/4C+4G
         ESx0pg0lbLboDQjDplhIzApsU3r4+OWijrLoVRSCpUC3RUImqeNjkQqt9Hbt80xPbaao
         H5ug==
X-Gm-Message-State: AOJu0YzZTQvi59ce6J4qO5q6ff3Y+WtFetMeOJ0+2uv2Dt+kQT1h9jdp
	slPok0vLL1WA95obO67CNLMBz3EIRR0wGBi1fg8ThqyWYZkkA/dDrIcz/YEzwrc=
X-Google-Smtp-Source: AGHT+IGiDtr6bFVtzG1jP01hGIJiomVthqyDDXxZzuB2cJ2FThVtMsBceKC8A6V0qu6VUdeJ+cgkbg==
X-Received: by 2002:a05:6402:210d:b0:5c2:5f24:98bd with SMTP id 4fb4d7f45d1cf-5c3dc78b665mr15319902a12.10.1725976914696;
        Tue, 10 Sep 2024 07:01:54 -0700 (PDT)
Message-ID: <22b48f13-8a5d-4005-aaec-32a76279bf2c@suse.com>
Date: Tue, 10 Sep 2024 16:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] blkif: reconcile protocol specification with in-use
 implementations
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240910114604.13194-1-roger.pau@citrix.com>
 <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>
 <ZuBQpkcutUgFxfnd@macbook.local>
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
In-Reply-To: <ZuBQpkcutUgFxfnd@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n7fOf8kYpLGC6ThH4F11nbI3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n7fOf8kYpLGC6ThH4F11nbI3
Content-Type: multipart/mixed; boundary="------------h2CCYUt1zhD0EuxFbeHqhekH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <22b48f13-8a5d-4005-aaec-32a76279bf2c@suse.com>
Subject: Re: [PATCH v2] blkif: reconcile protocol specification with in-use
 implementations
References: <20240910114604.13194-1-roger.pau@citrix.com>
 <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>
 <ZuBQpkcutUgFxfnd@macbook.local>
In-Reply-To: <ZuBQpkcutUgFxfnd@macbook.local>

--------------h2CCYUt1zhD0EuxFbeHqhekH
Content-Type: multipart/mixed; boundary="------------F7pAS9yFp2KpK7pPgeYAMEWd"

--------------F7pAS9yFp2KpK7pPgeYAMEWd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDkuMjQgMTU6NTksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
U2VwIDEwLCAyMDI0IGF0IDAzOjQ2OjAwUE0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+PiBPbiAxMC4wOS4yNCAxMzo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IEN1
cnJlbnQgYmxraWYgaW1wbGVtZW50YXRpb25zIChib3RoIGJhY2tlbmRzIGFuZCBmcm9udGVu
ZHMpIGhhdmUgYWxsIHNsaWdodA0KPj4+IGRpZmZlcmVuY2VzIGFib3V0IGhvdyB0aGV5IGhh
bmRsZSB0aGUgJ3NlY3Rvci1zaXplJyB4ZW5zdG9yZSBub2RlLCBhbmQgaG93DQo+Pj4gb3Ro
ZXIgZmllbGRzIGFyZSBkZXJpdmVkIGZyb20gdGhpcyB2YWx1ZSBvciBoYXJkY29kZWQgdG8g
YmUgZXhwcmVzc2VkIGluIHVuaXRzDQo+Pj4gb2YgNTEyIGJ5dGVzLg0KPj4+DQo+Pj4gVG8g
Z2l2ZSBzb21lIGNvbnRleHQsIHRoaXMgaXMgYW4gZXhjZXJwdCBvZiBob3cgZGlmZmVyZW50
IGltcGxlbWVudGF0aW9ucyB1c2UNCj4+PiB0aGUgdmFsdWUgaW4gJ3NlY3Rvci1zaXplJyBh
cyB0aGUgYmFzZSB1bml0IGZvciB0byBvdGhlciBmaWVsZHMgcmF0aGVyIHRoYW4NCj4+PiBq
dXN0IHRvIHNldCB0aGUgbG9naWNhbCBzZWN0b3Igc2l6ZSBvZiB0aGUgYmxvY2sgZGV2aWNl
Og0KPj4+DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICDilIIgc2VjdG9ycyB4ZW5i
dXMgbm9kZSDilIIgcmVxdWVzdHMgc2VjdG9yX251bWJlciDilIIgcmVxdWVzdHMge2ZpcnN0
LGxhc3R9X3NlY3QNCj4+PiDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilLzilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIANCj4+PiBGcmVl
QlNEIGJsa3tmcm9udCxiYWNrfSDilIIgICAgIHNlY3Rvci1zaXplICAgICDilIIgICAgICBz
ZWN0b3Itc2l6ZSAgICAgICDilIIgICAgICAgICAgIDUxMg0KPj4+IOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgA0KPj4+IExpbnV4IGJsa3tmcm9udCxiYWNrfSAgIOKUgiAgICAgICAg
IDUxMiAgICAgICAgIOKUgiAgICAgICAgICA1MTIgICAgICAgICAgIOKUgiAgICAgICAgICAg
NTEyDQo+Pj4g4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSADQo+Pj4gUUVNVSBibGtiYWNr
ICAgICAgICAgICAg4pSCICAgICBzZWN0b3Itc2l6ZSAgICAg4pSCICAgICAgc2VjdG9yLXNp
emUgICAgICAg4pSCICAgICAgIHNlY3Rvci1zaXplDQo+Pj4g4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSADQo+Pj4gV2luZG93cyBibGtmcm9udCAgICAgICAg4pSCICAgICBzZWN0b3It
c2l6ZSAgICAg4pSCICAgICAgc2VjdG9yLXNpemUgICAgICAg4pSCICAgICAgIHNlY3Rvci1z
aXplDQo+Pj4g4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSADQo+Pj4gTWluaU9TICAgICAg
ICAgICAgICAgICAg4pSCICAgICBzZWN0b3Itc2l6ZSAgICAg4pSCICAgICAgICAgIDUxMiAg
ICAgICAgICAg4pSCICAgICAgICAgICA1MTINCj4+Pg0KPj4+IEFuIGF0dGVtcHQgd2FzIG1h
ZGUgYnkgNjdlMWMwNTBlMzZiIGluIG9yZGVyIHRvIGNoYW5nZSB0aGUgYmFzZSB1bml0cyBv
ZiB0aGUNCj4+PiByZXF1ZXN0IGZpZWxkcyBhbmQgdGhlIHhlbnN0b3JlICdzZWN0b3JzJyBu
b2RlLiAgVGhhdCBob3dldmVyIG9ubHkgbGVhZCB0byBtb3JlDQo+Pj4gY29uZnVzaW9uLCBh
cyB0aGUgc3BlY2lmaWNhdGlvbiBub3cgY2xlYXJseSBkaXZlcmdlZCBmcm9tIHRoZSByZWZl
cmVuY2UNCj4+PiBpbXBsZW1lbnRhdGlvbiBpbiBMaW51eC4gIFN1Y2ggY2hhbmdlIHdhcyBv
bmx5IGltcGxlbWVudGVkIGZvciBRRU1VIFFkaXNrDQo+Pj4gYW5kIFdpbmRvd3MgUFYgYmxr
ZnJvbnQuDQo+Pj4NCj4+PiBQYXJ0aWFsbHkgcmV2ZXJ0IHRvIHRoZSBzdGF0ZSBiZWZvcmUg
NjdlMWMwNTBlMzZiIHdoaWxlIGFkanVzdGluZyB0aGUNCj4+PiBkb2N1bWVudGF0aW9uIGZv
ciAnc2VjdG9ycycgdG8gbWF0Y2ggd2hhdCBpdCB1c2VkIHRvIGJlIHByZXZpb3VzIHRvDQo+
Pj4gMmZhNzAxZTUzNDZkOg0KPj4+DQo+Pj4gICAgKiBEZWNsYXJlICdmZWF0dXJlLWxhcmdl
LXNlY3Rvci1zaXplJyBkZXByZWNhdGVkLiAgRnJvbnRlbmRzIHNob3VsZCBub3QgZXhwb3Nl
DQo+Pj4gICAgICB0aGUgbm9kZSwgYmFja2VuZHMgc2hvdWxkIG5vdCBtYWtlIGRlY2lzaW9u
cyBiYXNlZCBvbiBpdHMgcHJlc2VuY2UuDQo+Pj4NCj4+PiAgICAqIENsYXJpZnkgdGhhdCAn
c2VjdG9ycycgeGVuc3RvcmUgbm9kZSBhbmQgdGhlIHJlcXVlc3RzIGZpZWxkcyBhcmUgYWx3
YXlzIGluDQo+Pj4gICAgICA1MTItYnl0ZSB1bml0cywgbGlrZSBpdCB3YXMgcHJldmlvdXMg
dG8gMmZhNzAxZTUzNDZkIGFuZCA2N2UxYzA1MGUzNmIuDQo+Pj4NCj4+PiBBbGwgYmFzZSB1
bml0cyBmb3IgdGhlIGZpZWxkcyB1c2VkIGluIHRoZSBwcm90b2NvbCBhcmUgNTEyLWJ5dGUg
YmFzZWQsIHRoZQ0KPj4+IHhlbmJ1cyAnc2VjdG9yLXNpemUnIGZpZWxkIGlzIG9ubHkgdXNl
ZCB0byBzaWduYWwgdGhlIGxvZ2ljIGJsb2NrIHNpemUuICBXaGVuDQo+Pj4gJ3NlY3Rvci1z
aXplJyBpcyBncmVhdGVyIHRoYW4gNTEyLCBibGtmcm9udCBpbXBsZW1lbnRhdGlvbnMgbXVz
dCBtYWtlIHN1cmUgdGhhdA0KPj4+IHRoZSBvZmZzZXRzIGFuZCBzaXplcyAoZGVzcGl0ZSBi
ZWluZyBleHByZXNzZWQgaW4gNTEyLWJ5dGUgdW5pdHMpIGFyZSBhbGlnbmVkDQo+Pj4gdG8g
dGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBzcGVjaWZpZWQgaW4gJ3NlY3Rvci1zaXplJywgb3Ro
ZXJ3aXNlIHRoZSBiYWNrZW5kDQo+Pj4gd2lsbCBmYWlsIHRvIHByb2Nlc3MgdGhlIHJlcXVl
c3RzLg0KPj4+DQo+Pj4gVGhpcyB3aWxsIHJlcXVpcmUgY2hhbmdlcyB0byBzb21lIG9mIHRo
ZSBmcm9udGVuZHMgYW5kIGJhY2tlbmRzIGluIG9yZGVyIHRvDQo+Pj4gcHJvcGVybHkgc3Vw
cG9ydCAnc2VjdG9yLXNpemUnIG5vZGVzIGdyZWF0ZXIgdGhhbiA1MTIuDQo+Pj4NCj4+PiBG
aXhlczogMmZhNzAxZTUzNDZkICgnYmxraWYuaDogUHJvdmlkZSBtb3JlIGNvbXBsZXRlIGRv
Y3VtZW50YXRpb24gb2YgdGhlIGJsa2lmIGludGVyZmFjZScpDQo+Pj4gRml4ZXM6IDY3ZTFj
MDUwZTM2YiAoJ3B1YmxpYy9pby9ibGtpZi5oOiB0cnkgdG8gZml4IHRoZSBzZW1hbnRpY3Mg
b2Ygc2VjdG9yIGJhc2VkIHF1YW50aXRpZXMnKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5n
ZXMgc2luY2UgdjE6DQo+Pj4gICAgLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2UuDQo+Pj4gICAg
LSBFeHBhbmQgY29tbWVudHMuDQo+Pj4gLS0tDQo+Pj4gICAgeGVuL2luY2x1ZGUvcHVibGlj
L2lvL2Jsa2lmLmggfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0K
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vYmxraWYu
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9ibGtpZi5oDQo+Pj4gaW5kZXggMjJmMWVlZjBj
MGNhLi5kYTg5M2ViMzc5ZGIgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGlj
L2lvL2Jsa2lmLmgNCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vYmxraWYuaA0K
Pj4+IEBAIC0yMzcsMTIgKzIzNywxNiBAQA0KPj4+ICAgICAqIHNlY3Rvci1zaXplDQo+Pj4g
ICAgICogICAgICBWYWx1ZXM6ICAgICAgICAgPHVpbnQzMl90Pg0KPj4+ICAgICAqDQo+Pj4g
LSAqICAgICAgVGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSwgaW4gYnl0ZXMsIG9mIHRoZSB1bmRl
cmx5aW5nIHN0b3JhZ2UuIFRoaXMNCj4+PiAtICogICAgICBtdXN0IGJlIGEgcG93ZXIgb2Yg
dHdvIHdpdGggYSBtaW5pbXVtIHZhbHVlIG9mIDUxMi4NCj4+PiArICogICAgICBUaGUgbG9n
aWNhbCBibG9jayBzaXplLCBpbiBieXRlcywgb2YgdGhlIHVuZGVybHlpbmcgc3RvcmFnZS4g
VGhpcyBtdXN0DQo+Pj4gKyAqICAgICAgYmUgYSBwb3dlciBvZiB0d28gd2l0aCBhIG1pbmlt
dW0gdmFsdWUgb2YgNTEyLiAgVGhlIHNlY3RvciBzaXplIHNob3VsZA0KPj4+ICsgKiAgICAg
IG9ubHkgYmUgdXNlZCBmb3IgcmVxdWVzdCBzZWdtZW50IGxlbmd0aCBhbmQgYWxpZ25tZW50
Lg0KPj4+ICAgICAqDQo+Pj4gLSAqICAgICAgTk9URTogQmVjYXVzZSBvZiBpbXBsZW1lbnRh
dGlvbiBidWdzIGluIHNvbWUgZnJvbnRlbmRzIHRoaXMgbXVzdCBiZQ0KPj4+IC0gKiAgICAg
ICAgICAgIHNldCB0byA1MTIsIHVubGVzcyB0aGUgZnJvbnRlbmQgYWR2ZXJ0aXplcyBhIG5v
bi16ZXJvIHZhbHVlDQo+Pj4gLSAqICAgICAgICAgICAgaW4gaXRzICJmZWF0dXJlLWxhcmdl
LXNlY3Rvci1zaXplIiB4ZW5idXMgbm9kZS4gKFNlZSBiZWxvdykuDQo+Pj4gKyAqICAgICAg
V2hlbiBleHBvc2luZyBhIGRldmljZSB0aGF0IHVzZXMgNDA5NiBsb2dpY2FsIHNlY3RvciBz
aXplcywgdGhlIG9ubHkNCj4+DQo+PiBzL3VzZXMgNDA5NiBsb2dpY2FsIHNlY3RvciBzaXpl
cy91c2VzIGEgbG9naWNhbCBzZWN0b3Igc2l6ZSBvZiA0MDk2Lw0KPiANCj4gWWVzLCB0aGF0
J3MgYmV0dGVyLg0KPiANCj4+PiArICogICAgICBkaWZmZXJlbmNlIHhlbnN0b3JlIHdpc2Ug
d2lsbCBiZSB0aGF0ICdzZWN0b3Itc2l6ZScgKGFuZCBwb3NzaWJseQ0KPj4+ICsgKiAgICAg
ICdwaHlzaWNhbC1zZWN0b3Itc2l6ZScgaWYgc3VwcG9ydGVkIGJ5IHRoZSBiYWNrZW5kKSB3
aWxsIGJlIDQwOTYsIGJ1dA0KPj4+ICsgKiAgICAgIHRoZSAnc2VjdG9ycycgbm9kZSB3aWxs
IHN0aWxsIGJlIGNhbGN1bGF0ZWQgdXNpbmcgNTEyIGJ5dGUgdW5pdHMuICBUaGUNCj4+PiAr
ICogICAgICBzZWN0b3IgYmFzZSB1bml0cyBpbiB0aGUgcmluZyByZXF1ZXN0cyBmaWVsZHMg
d2lsbCBhbGwgYmUgNTEyIGJ5dGUNCj4+PiArICogICAgICBiYXNlZCBkZXNwaXRlIHRoZSBs
b2dpY2FsIHNlY3RvciBzaXplIGV4cG9zZWQgaW4gJ3NlY3Rvci1zaXplJy4NCj4+PiAgICAg
Kg0KPj4+ICAgICAqIHBoeXNpY2FsLXNlY3Rvci1zaXplDQo+Pj4gICAgICogICAgICBWYWx1
ZXM6ICAgICAgICAgPHVpbnQzMl90Pg0KPj4+IEBAIC0yNTQsOCArMjU4LDggQEANCj4+PiAg
ICAgKiBzZWN0b3JzDQo+Pj4gICAgICogICAgICBWYWx1ZXM6ICAgICAgICAgPHVpbnQ2NF90
Pg0KPj4+ICAgICAqDQo+Pj4gLSAqICAgICAgVGhlIHNpemUgb2YgdGhlIGJhY2tlbmQgZGV2
aWNlLCBleHByZXNzZWQgaW4gdW5pdHMgb2YgInNlY3Rvci1zaXplIi4NCj4+PiAtICogICAg
ICBUaGUgcHJvZHVjdCBvZiAic2VjdG9yLXNpemUiIGFuZCAic2VjdG9ycyIgbXVzdCBhbHNv
IGJlIGFuIGludGVnZXINCj4+PiArICogICAgICBUaGUgc2l6ZSBvZiB0aGUgYmFja2VuZCBk
ZXZpY2UsIGV4cHJlc3NlZCBpbiB1bml0cyBvZiA1MTJiLg0KPj4+ICsgKiAgICAgIFRoZSBw
cm9kdWN0IG9mICJzZWN0b3Itc2l6ZSIgKiA1MTIgbXVzdCBhbHNvIGJlIGFuIGludGVnZXIN
Cj4+DQo+PiBEWU06IFRoZSBwcm9kdWN0IG9mICJzZWN0b3JzIiAqIDUxMiBtdXN0IGFsc28g
YmUgYW4gaW50ZWdlciAuLi4gPw0KPiANCj4gSW5kZWVkLg0KDQpXaXRoIHRob3NlIDIgY2hh
bmdlcyBhcHBsaWVkIHlvdSBjYW4gYWRkIG15Og0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------F7pAS9yFp2KpK7pPgeYAMEWd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------F7pAS9yFp2KpK7pPgeYAMEWd--

--------------h2CCYUt1zhD0EuxFbeHqhekH--

--------------n7fOf8kYpLGC6ThH4F11nbI3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbgUU8FAwAAAAAACgkQsN6d1ii/Ey9d
Dwf/abzlJpVCPbjcOsBqKVy530mlHNSHFIzpOmzJmg6M/vt9IwAIt5iTHEq7IOmEYt7sB7IvVUtZ
WYLSHiSzKTRcOohsaG/Hn+xtmMPxWXAnJkDNJeSdAASvWRPLcA4v+D2CihGOqrkdqu5wPdoggrBc
gAPErsV9FZNrY5dN4C7qoM6f7usaX+qz5BZrYb9zJ1IQmKGyGzspwWAEsaD5JztzyVgTJSZK6hhx
5+XvBzTVJHv6mw9TKIIAlMiebiTeNvKy7w81KOKfpRms70pi61NwjPUMas02D16QKoh35OAgKgl/
A1RogfFFcjx6g5xYOT9Z1ady66DtEPXyr3Er5ERFww==
=bauk
-----END PGP SIGNATURE-----

--------------n7fOf8kYpLGC6ThH4F11nbI3--

