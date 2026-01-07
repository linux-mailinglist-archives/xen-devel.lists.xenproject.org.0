Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C5CFC64B
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 08:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196525.1514323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdO6H-000289-QB; Wed, 07 Jan 2026 07:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196525.1514323; Wed, 07 Jan 2026 07:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdO6H-00026g-N0; Wed, 07 Jan 2026 07:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1196525;
 Wed, 07 Jan 2026 07:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QRzq=7M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vdO6G-00026H-JT
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 07:37:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5cbe471-eb9b-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 08:36:58 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64b608ffca7so2514076a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 23:36:58 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5absm3867891a12.33.2026.01.06.23.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 23:36:57 -0800 (PST)
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
X-Inumbo-ID: a5cbe471-eb9b-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767771418; x=1768376218; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9EQ7Aa8EhGJ4mL3xJ/5yrfrQwVGovVjKHiRrRlymYzg=;
        b=CCd/LkAzqdyltfsKDgeWPPMhnx8Y3SfIyhdUisiQXrJjyxxZlr9HQw9Rhl9wYqeObz
         zM/DN6UxiCVeOf7XoBVEVRPqHhi9u6a9WbTUoC0X7WdB7ffb6wRxs1YHfhFB+pLowdUx
         DXDnMW45Y1EyrOqRapjtAgTpIfFamRB0gLi+w/n3h/Z9AFe/qogvjc8vCTuIOB49/Z59
         XWsOw4ymOrhYE47eBoSy3xwAfNhfJNqpiZWQhbiWsGoyfEBHg9XPH6cIPVMAn1ye1CIX
         4n3GyjUsrByaSoz44f7+UMng15mWD53tq44iOtFigmvP/jCkLvgbU6+oM3aErDQiqbrX
         N87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767771418; x=1768376218;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EQ7Aa8EhGJ4mL3xJ/5yrfrQwVGovVjKHiRrRlymYzg=;
        b=iZZgefvjQBeaVfTqfObz/1+/jTtizN5fqG8P9E/1v+7TSc49szZec+YTMMS44Vo3Fm
         9r58CNxxCX0W6/giYqTNcv8/jGKvPvSlrfOU/PYw0S0PpGPaY/Jto0xdeDo8awo/5G8u
         B64NymqWp1fnEhXvcxwovcWm44KkWK73Veqf99VMtH3iq3IMvrGpv34vp4MHsDJ1d+V+
         XZiNGvPD7U3IQ3dwFhS2r38xhibTNa5qvhrbx1kR7Fy02tOJUVL6mZN8jQe7Kj77p0wC
         YFHbVNDw5VtspYw15+v9MLjNYrChfnYeQrQ1Ms4BC+WZbVgkowNwuF0y4Wl8ITgUKzDD
         h+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ohJdGJNcHJ01cYNIC3UJGKAODjJvYI7GYUVZyqevERnOZoW1Kc3fGW6ObVQSnLEur5OzoJAxYNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzKimqrYdSmhuOvymHKJj+YCoS2K11Hrs5bPS5mN4DdCg43T5J
	Mwf6NBVKOIj3Z3LL2+Gt8SwbBWudu1IEzd0yXvCtufqB44FMoXYhOEN4Jvm4cwGDX8ooNAw3H9a
	cNSO/
X-Gm-Gg: AY/fxX4wHmNq8w4m62mlg/3p3W1/vuT9uNMaQ9IRq4kP4mHkfzm4mkwYB4ZH0YXW2SP
	pCTKR9RO4wq56VHxut2jvfsf5jUheydKQV6UrHlqwNNs41/pszwrlmyGbyMH/AQACdDSqGkyGrs
	AjF2eLXewiLXcNSZjph1r8/rbMnQVU2BYORnr0WLT5SmAFMifAu4vh8Z0z7pv1dx8fk6hgK5o4z
	iFO8HSPNYlB+xqnpFRsJofe3fS3lnsyWnmthNEKygh98mwCjJPzi32G5rtEmjyVTR0JE0LWowqX
	IE0v334E9O63cnRiRceKioez7B9IF+R4DYx2MCOS9/qlHFs72o0NNR1IkdbjQGd4Iw2Y9Eyuqkh
	2J818+zLcRwwNklmotBcGLMstiBskzhG8gMjcgwkPGq9KjCkmH2G3aBXQb2KiJlRpIp2EPl1Ok2
	4SAxqrmvaVdkkgeW4jwsdvJPH6ozoZamblMqIpTGCqA762PkXYuTFxzcepXXEBYGUDDaUGE7G3v
	LUyX8oHDbeu9wLz118sMLe3sEaP8M2ntB2QTgo=
X-Google-Smtp-Source: AGHT+IE0IbBPQigm0vcFpZwThPhBgC/5Klo8VeUMGYOyWs2/My6c4Vy+qNVVZZqOWrWE0YDCYLyOpg==
X-Received: by 2002:a05:6402:27ca:b0:64c:9e19:9831 with SMTP id 4fb4d7f45d1cf-65097de5b1fmr1498742a12.12.1767771417607;
        Tue, 06 Jan 2026 23:36:57 -0800 (PST)
Message-ID: <ba84a3af-0048-49ba-be4b-e806fe3705a2@suse.com>
Date: Wed, 7 Jan 2026 08:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/virtio: Don't use grant-dma-ops when running as Dom0
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
 <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
 <0b168d85-443c-4f38-92f8-8c008b2f8b82@vates.tech>
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
In-Reply-To: <0b168d85-443c-4f38-92f8-8c008b2f8b82@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DLuJiwko2Kg2MIwuzsl8lMGO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DLuJiwko2Kg2MIwuzsl8lMGO
Content-Type: multipart/mixed; boundary="------------rmmZ4eqSM2lOw0qLVTm0Qj7X";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <ba84a3af-0048-49ba-be4b-e806fe3705a2@suse.com>
Subject: Re: [PATCH] xen/virtio: Don't use grant-dma-ops when running as Dom0
References: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
 <995f7ac8-0a8b-43d9-9cc7-63622ec52ca1@suse.com>
 <0b168d85-443c-4f38-92f8-8c008b2f8b82@vates.tech>
In-Reply-To: <0b168d85-443c-4f38-92f8-8c008b2f8b82@vates.tech>

--------------rmmZ4eqSM2lOw0qLVTm0Qj7X
Content-Type: multipart/mixed; boundary="------------P0m4PEXFzTqOfClLS2QPVtlu"

--------------P0m4PEXFzTqOfClLS2QPVtlu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDEuMjYgMjM6NDcsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBMZSAwNi8wMS8yMDI2
IMOgIDIwOjA2LCBKw7xyZ2VuIEdyb8OfIGEgw6ljcml0wqA6DQo+PiBPbiAwNi4wMS4yNiAx
ODozNiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+Pj4gRG9tMCBpbmhlcml0IGRldmljZXMgZnJv
bSB0aGUgbWFjaGluZSBhbmQgaXMgdXN1YWxseSBpbiBQViBtb2RlLg0KPj4+IElmIHdlIGFy
ZSBydW5uaW5nIGluIGEgdmlydHVhbCB0aGF0IGhhcyB2aXJ0aW8gZGV2aWNlcywgdGhlc2Ug
ZGV2aWNlcw0KPj4+IHdvdWxkIGJlIGNvbnNpZGVyZWQgYXMgdXNpbmcgZ3JhbnRzIHdpdGgg
RG9tMCBhcyBiYWNrZW5kLCB3aGlsZSBiZWluZw0KPj4+IHRoZSBzYWlkIERvbTAgaXRzZWxm
LCB3aGlsZSB3ZSB3YW50IHRvIHVzZSB0aGVzZSBkZXZpY2VzIGxpa2UgcmVndWxhcg0KPj4+
IFBDSSBkZXZpY2VzLg0KPj4+DQo+Pj4gRml4IHRoaXMgYnkgcHJldmVudGluZyBncmFudC1k
bWEtb3BzIGZyb20gYmVpbmcgdXNlZCB3aGVuIHJ1bm5pbmcgYXMgRG9tMA0KPj4+IChpbml0
aWFsIGRvbWFpbikuIFdlIHN0aWxsIGtlZXAgdGhlIGRldmljZS10cmVlIGxvZ2ljIGFzLWlz
Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZh
dGVzLnRlY2g+DQo+Pj4gRml4ZXM6IDYxMzY3Njg4ZjFmYjAgKCJ4ZW4vdmlydGlvOiBlbmFi
bGUgZ3JhbnQgYmFzZWQgdmlydGlvIG9uIHg4NiIpDQo+Pj4gLS0tDQo+Pj4gQ0M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4+IENDOiBPbGVrc2FuZHIgVHlzaGNoZW5r
byA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4gQ0M6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+DQo+Pj4NCj4+PiAgwqAgZHJpdmVy
cy94ZW4vZ3JhbnQtZG1hLW9wcy5jIHwgMyArKy0NCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYyBiL2RyaXZlcnMveGVuL2dyYW50LWRtYS1v
cHMuYw0KPj4+IGluZGV4IDE0MDc3ZDIzZjJhMS4uYzI2MDNlNzAwMTc4IDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+ICsrKyBiL2RyaXZlcnMv
eGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+IEBAIC0zNjYsNyArMzY2LDggQEAgc3RhdGljIGlu
dCB4ZW5fZ3JhbnRfaW5pdF9iYWNrZW5kX2RvbWlkKHN0cnVjdA0KPj4+IGRldmljZSAqZGV2
LA0KPj4+ICDCoMKgwqDCoMKgIGlmIChucCkgew0KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0ID0geGVuX2R0X2dyYW50X2luaXRfYmFja2VuZF9kb21pZChkZXYsIG5wLCBiYWNrZW5k
X2RvbWlkKTsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIG9mX25vZGVfcHV0KG5wKTsNCj4+
PiAtwqDCoMKgIH0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfWEVOX1ZJUlRJT19GT1JD
RV9HUkFOVCkgfHwNCj4+PiB4ZW5fcHZfZG9tYWluKCkpIHsNCj4+PiArwqDCoMKgIH0gZWxz
ZSBpZiAoIXhlbl9pbml0aWFsX2RvbWFpbigpICYmDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgIChJU19FTkFCTEVEKENPTkZJR19YRU5fVklSVElPX0ZPUkNFX0dSQU5UKSB8fA0KPj4+
IHhlbl9wdl9kb21haW4oKSkpIHsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZv
KGRldiwgIlVzaW5nIGRvbTAgYXMgYmFja2VuZFxuIik7DQo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCAqYmFja2VuZF9kb21pZCA9IDA7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXQg
PSAwOw0KPj4NCj4+IFBsZWFzZSBtYWtlIHRoaXMgY29udHJvbGxhYmxlLCBlLmcuIHZpYSBh
IGJvb3QgcGFyYW1ldGVyLg0KPj4NCj4+IEl0IGlzIGNvbXBsZXRlbHkgdmFsaWQgdG8gaGF2
ZSBhIHZpcnRpbyBkZXZpY2UgaW4gZG9tMCB3aXRoIHRoZSBiYWNrZW5kIGluDQo+PiBhIGRv
bVUuIFlvdSdsbCBuZWVkIGdyYW50cyBpbiB0aGlzIGNhc2UuDQo+Pg0KPiBEdWUgdG8NCj4g
ICA+ICpiYWNrZW5kX2RvbWlkID0gMA0KPiANCj4gRG9tMCB3b3VsZCBhbHdheXMgYmUgdGhl
IGJhY2tlbmQsIHVubGVzcyB3ZSBpbnRyb2R1Y2UgYSBuZXcgYm9vdA0KPiBwYXJhbWV0ZXIg
dG8gc2VsZWN0IHdoaWNoIGRvbWFpbiB3aWxsIGJlIHRoZSBiYWNrZW5kLg0KDQpBaCwgcmln
aHQuIE9rYXksIGZvciBub3cgdGhpcyBpcyBjb3JyZWN0LCBzbyB5b3UgY2FuIGhhdmUgbXkN
Cg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KSW4g
ZnV0dXJlIHRoaW5ncyBtaWdodCBjaGFuZ2UsIHRob3VnaC4NCg0KPiBUaGVyZSBpcyBhbHNv
IGFub3RoZXIgaXNzdWUsIGFzIGluIHRoZSB4ZW5faW5pdGlhbF9kb21haW4oKSBjYXNlLCBh
bGwNCj4gUENJIGRldmljZXMgY29tZSBmcm9tIGhhcmR3YXJlLiBTbyBubyB2aXJ0aW8tcGNp
IGRldmljZSBjYW4ndCBjb21lIGZyb20NCj4gYW5vdGhlciBkb21haW4gYXMgTGludXggd291
bGQgcGljayB1cCBwY2lmcm9udCBkZXZpY2VzIG9ubHkgaWYgd2UgYXJlDQo+IG5vdCBhIERv
bTAgKCF4ZW5faW5pdGlhbF9kb21haW4oKSkuDQoNCkkgdGhpbmsgdmlydGlvIGRldmljZXMg
c2hvdWxkIG9ubHkgYmUgaGFuZGxlZCB2aWEgcGNpZnJvbnQgaW4gY2FzZSB0aGV5DQphcmUg
Tk9UIGltcGxlbWVudGVkIGJ5IGEgWGVuIGJhY2tlbmQgZG9tYWluLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------P0m4PEXFzTqOfClLS2QPVtlu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------P0m4PEXFzTqOfClLS2QPVtlu--

--------------rmmZ4eqSM2lOw0qLVTm0Qj7X--

--------------DLuJiwko2Kg2MIwuzsl8lMGO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmleDRcFAwAAAAAACgkQsN6d1ii/Ey8O
Bgf9G8+sfFm7x4hcIZlE8Zwdesn1tOhjOQ5MZGWLK9j5UDiigUzmTEpcvvoBqlW72uJjMfnv7iza
wa8Hfx7RLxM2wB5NVucOIVya3FPb5MTwRgJAsLSVtsZFlXEK70wxsKtE1OetkD0vjQvawc1HNG/2
iKVWTCd3VUeaf9MaORuobhbPAtEcEtza2YFxzF0m4syNTvpavxFN60OmZw1z1jT9TI1A3ZnXJAM7
86qDx1k/q+Xt87Ap/1Rz7c/Q2rfjr03VdIGBjLt32FIdLQgYEOD28sPHQsMMwtDwLDC8UNT0L6C3
IMpWvM+MmAFrhmmSTZeaf5NaYxA2lo9lX9YL1hQTOg==
=dL7J
-----END PGP SIGNATURE-----

--------------DLuJiwko2Kg2MIwuzsl8lMGO--

