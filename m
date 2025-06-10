Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515FAD2C93
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 06:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010482.1388577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOqVR-0006cO-3o; Tue, 10 Jun 2025 04:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010482.1388577; Tue, 10 Jun 2025 04:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOqVR-0006Zy-0L; Tue, 10 Jun 2025 04:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1010482;
 Tue, 10 Jun 2025 04:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ES3X=YZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uOqVP-0006Zs-P2
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 04:22:35 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85e0d0c4-45b2-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 06:22:30 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-60779962c00so4620784a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 21:22:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc39c3fsm653224566b.140.2025.06.09.21.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 21:22:29 -0700 (PDT)
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
X-Inumbo-ID: 85e0d0c4-45b2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749529350; x=1750134150; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vtE6FqbXKVpkJpTRc7uA49IoSQWoz/UlJhOgGFdmCX0=;
        b=FiG7Ac+IY3F8OVcgExrlMcP4Nx/8LUy/Wn60YgRYhwNUJiVPZWNrM9SDEN0VQ6eSpM
         bVkMvHGXmI3JAub3sQcSrA7vyXbM4bvswx5+OS00zxmazmPYbHGD9tRKOez4V5vZzQJS
         s5ubI8gtjnqv0m8gLR/PwKfgk6O/whayWoJoD1Ym9XjNDjMshuDLTZ0PkFNiZWd9Idsz
         aBq57LDgOKH5Cxn1BJfoAJISkLcQnCsqHQwMRYrD7KoporO9umUcbKio+WYaELpe37yu
         e62fOazdJxc+rp5EHfM8oDPC2ojTh/KSYgxprAlfHERzavAJGirjCO5EqkztSlVKdpqj
         qinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749529350; x=1750134150;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtE6FqbXKVpkJpTRc7uA49IoSQWoz/UlJhOgGFdmCX0=;
        b=K/69Cy957SBL6Hsz7HR+o6RzECQuKtU7Zm8qSbK0O9onZqO1neggpC5FNzgNrTrhtG
         2iJ25GAtvADEUS4XxU+SMlhShviBJmTzi4rnFpj943R7PYrKyQJv8P7R6NIgW/yG9Hlv
         m2QIyr4Im/1aatcBiPvyH7NgyNnCCym5vREw4Wu5lBKVQkMXLrGlEeR2yBtXUlF9G4jH
         bZOXm5k+nZncereBJ9w9KkZCpJPR/RMDLm58ttQ0Y8LYbWWI4W6GgszzxyA10nq4cSWQ
         TXe1rdbMCXFDFHMXcOcj9Kixi6PDymK3Tcy7XqHk3syIO9521fZ4iLa+X2gJZ9+maWF7
         ANCg==
X-Forwarded-Encrypted: i=1; AJvYcCUtEoyTNOfUgc9VA/PCJETxsEdQVpIfBcFvC+GHLrMxjppj5WomwOBSS+luDFCpCP3RfYwZ7VsY8eU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQkZMoRnIHSiInFXGdTnOZoUCNuHOb8DnlsCCuqlPw5Yywlvjr
	bl3OVdqeU4FIT1PU01aZ7mtczJmJJxXacyR3H4kpKV5VvDzIlyttmLa3WV4PaTX9QkA=
X-Gm-Gg: ASbGncsIU4c3qnZnH8ygW4DGVvttGi32IX2HjFbUq4F0N1K9eLG8DyXxmU+koHpaYFl
	dsNEnTB0AW1LTtdy7cfph2vnAwUVSOTQztx2gzZEVWaTGrvxnKjnpCMALQnu/kL8S5iesarCHMl
	CQNeeLspCsXpNWApGQSRGno0vvtVrvvn7uIzY7FTRbCfWeOIFYh+DMnmadeZ6VvYkToKIbFtCOw
	fLsqRHaNhtDc5ryxUPqHK6/QmZR/ABFUyf3m/wWhiysupOa1/P6Ltdng0C6CE9tOMjSlZOquGNW
	JyYXXa3uqkLOiycRsPuEG5m8lnakAVvYt2n82yKT6XBFyl8VgT5s8r7dKdKG0R8qhDPwsBf7nBQ
	c99ux4Z26eU+c2JGaIxrxSTrllfQqSati81BtlZEAXfYEok6iJndK1F4x5KogVeORsGKY85no5g
	bcNRks569K9jQ=
X-Google-Smtp-Source: AGHT+IEWCebQ2XimYzy+I8VvIYOjz0xMZTBHp3Lj8BEv5gPVoXnMnc69oeCEBeVl7rEE6+nNHgKQdg==
X-Received: by 2002:a17:907:3f24:b0:ad8:a41a:3cc5 with SMTP id a640c23a62f3a-ade1a9170e1mr1401238066b.6.1749529349503;
        Mon, 09 Jun 2025 21:22:29 -0700 (PDT)
Message-ID: <8ad4304d-43bc-4584-bc69-822eb0661e7b@suse.com>
Date: Tue, 10 Jun 2025 06:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Linux 6.15.1 xen/dom0 domain_crash_sync called from
 entry.S
To: Chuck Zmudzinski <brchuckz@netscape.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40.ref@netscape.net>
 <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
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
In-Reply-To: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0EbFx1IS9ivErK0O9PjmY4R5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0EbFx1IS9ivErK0O9PjmY4R5
Content-Type: multipart/mixed; boundary="------------OQLtB7JT21dg2AQFGuQitRgX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <8ad4304d-43bc-4584-bc69-822eb0661e7b@suse.com>
Subject: Re: [REGRESSION] Linux 6.15.1 xen/dom0 domain_crash_sync called from
 entry.S
References: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40.ref@netscape.net>
 <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>
In-Reply-To: <8ed96ec9-7c84-4bb4-90ec-5b753be9fd40@netscape.net>

--------------OQLtB7JT21dg2AQFGuQitRgX
Content-Type: multipart/mixed; boundary="------------EOhNGRxKFthsm1FP655sH8HF"

--------------EOhNGRxKFthsm1FP655sH8HF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDYuMjUgMDA6NDMsIENodWNrIFptdWR6aW5za2kgd3JvdGU6DQo+IEhpLA0KPiAN
Cj4gSSBhbSBzZWVpbmcgdGhlIGZvbGxvd2luZyByZWdyZXNzaW9uIGJldHdlZW4gTGludXgg
Ni4xNC44IGFuZCA2LjE1LjEuDQo+IA0KPiBLZXJuZWwgdmVyc2lvbiA2LjE0LjggYm9vdHMg
ZmluZSBidXQgdmVyc2lvbiA2LjE1LjEgY3Jhc2hlcyBhbmQNCj4gcmVib290cyBvbiBYZW4u
IEkgZG9uJ3Qga25vdyBpZiA2LjE0Ljkgb3IgNi4xNC4xMCBpcyBhZmZlY3RlZCwgb3INCj4g
aWYgNi4xNSBvciB0aGUgNi4xNSByZWxlYXNlIGNhbmRpZGF0ZXMgYXJlIGFmZmVjdGVkIGJl
Y2F1c2UgSSBkaWQNCj4gbm90IHRlc3QgdGhlbS4NCj4gDQo+IEFsc28sIExpbnV4IDYuMTUu
MSBib290cyBmaW5lIG9uIGJhcmUgbWV0YWwgd2l0aG91dCBYZW4uDQo+IA0KPiBIYXJkd2Fy
ZTogSW50ZWwgaTUtMTQ1MDAgUmFwdG9yIExha2UgQ1BVLCBhbmQgQVNSb2NrIEI3NjBNIFBH
IG1vdGhlcmJvYXJkIGFuZCAzMiBHQiBSQU0uDQo+IA0KPiBYZW4gdmVyc2lvbjogNC4xOS4y
IChtb2NrYnVpbGRAZHluYXZpcnQuY29tKSAoZ2NjIChHQ0MpIDEzLjMuMSAyMDI0MDYxMSAo
UmVkIEhhdCAxMy4zLjEtMikpIGRlYnVnPW4gU3VuIEFwciAxMyAxNToyNDoyOSBQRFQgMjAy
NQ0KPiANCj4gWGVuIENvbW1hbmQgbGluZTogcGxhY2Vob2xkZXIgZG9tMF9tZW09MkcsbWF4
OjJHIGNvbnJpbmdfc2l6ZT0zMmsgY29tMT05NjAwLDhuMSwweDQwYzAsMTYsMTowLjAgY29u
c29sZT1jb20xDQo+IA0KPiBMaW51eCB2ZXJzaW9uIDYuMTUuMS0xLmVsOS5lbHJlcG8ueDg2
XzY0IChtb2NrYnVpbGRANWI3YTVkYWIzYjcxNDI5ODk4YjRmODQ3NGZhYjhmYTApIChnY2Mg
KEdDQykgMTEuNS4wIDIwMjQwNzE5IChSZWQgSGF0IDExLjUuMC01KSwgR05VIGxkIHZlcnNp
b24gMi4zNS4yLTYzLmVsOSkgIzEgU01QIFBSRUVNUFRfRFlOQU1JQyBXZWQgSnVuICA0IDE2
OjQyOjU4IEVEVCAyMDI1DQo+IA0KPiBMaW51eCBLZXJuZWwgQ29tbWFuZCBsaW5lOiBwbGFj
ZWhvbGRlciByb290PS9kZXYvbWFwcGVyL3N5c3RlbXMtcm9vdGFsbWEgcm8gY3Jhc2hrZXJu
ZWw9MUctNEc6MTkyTSw0Ry02NEc6MjU2TSw2NEctOjUxMk0gcmVzdW1lPVVVSUQ9MmRkYzJl
M2ItOGY3Yi00OThiLWE0ZTgtYmI0ZDMzYTFlNWE3IGNvbnNvbGU9aHZjMA0KPiANCj4gVGhl
IExpbnV4IDYuMTUuMSBkb20wIGtlcm5lbCBjYXVzZXMgWGVuIHRvIGNyYXNoIGFuZCByZWJv
b3QsIGhlcmUgYXJlDQo+IHRoZSBsYXN0IG1lc3NhZ2VzIG9uIHRoZSBzZXJpYWwgY29uc29s
ZSAoaW5jbHVkZXMgbWVzc2FnZXMgZnJvbSBib3RoDQo+IGRvbTAgYW5kIFhlbikgYmVmb3Jl
IGNyYXNoOg0KPiANCj4gWyAgICAwLjMwMTU3M10gU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNz
OiBNaXRpZ2F0aW9uOiBTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgZGlzYWJsZWQgdmlhIHBy
Y3RsDQo+IA0KPiBbICAgIDAuMzAxNTc3XSBSZWdpc3RlciBGaWxlIERhdGEgU2FtcGxpbmc6
IFZ1bG5lcmFibGU6IE5vIG1pY3JvY29kZQ0KPiANCj4gWyAgICAwLjMwMTU4MV0gSVRTOiBN
aXRpZ2F0aW9uOiBBbGlnbmVkIGJyYW5jaC9yZXR1cm4gdGh1bmtzDQo+IA0KPiBbICAgIDAu
MzAxNTk0XSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDE6ICd4ODcg
ZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzJw0KPiANCj4gWyAgICAwLjMwMTU5OF0geDg2L2Zw
dTogU3VwcG9ydGluZyBYU0FWRSBmZWF0dXJlIDB4MDAyOiAnU1NFIHJlZ2lzdGVycycNCj4g
DQo+IFsgICAgMC4zMDE2MDJdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAw
eDAwNDogJ0FWWCByZWdpc3RlcnMnDQo+IA0KPiBbICAgIDAuMzAxNjA1XSB4ODYvZnB1OiB4
c3RhdGVfb2Zmc2V0WzJdOiAgNTc2LCB4c3RhdGVfc2l6ZXNbMl06ICAyNTYNCj4gDQo+IFsg
ICAgMC4zMDE2MDldIHg4Ni9mcHU6IEVuYWJsZWQgeHN0YXRlIGZlYXR1cmVzIDB4NywgY29u
dGV4dCBzaXplIGlzIDgzMiBieXRlcywgdXNpbmcgJ2NvbXBhY3RlZCcgZm9ybWF0Lg0KPiAN
Cj4gKFhFTikgUGFnZXRhYmxlIHdhbGsgZnJvbSBmZmZmYzkwMDNmZmZmZmY4Og0KPiAoWEVO
KSAgTDRbMHgxOTJdID0gMDAwMDAwMDg1NWJlZTA2NyAwMDAwMDAwMDAwMDYwZTU2DQo+IChY
RU4pICBMM1sweDAwMF0gPSAwMDAwMDAwODU1YmVkMDY3IDAwMDAwMDAwMDAwNjBlNTUNCj4g
KFhFTikgIEwyWzB4MWZmXSA9IDAwMDAwMDA4NTViZjAwNjcgMDAwMDAwMDAwMDA2MGU1OA0K
PiAoWEVOKSAgTDFbMHgxZmZdID0gODAxMDAwMDg1NWJmMjAyNSAwMDAwMDAwMDAwMDYwZTVh
DQo+IChYRU4pIGRvbWFpbl9jcmFzaF9zeW5jIGNhbGxlZCBmcm9tIGVudHJ5LlM6IGZhdWx0
IGF0IGZmZmY4MmQwNDAzNmU1YjAgeDg2XzY0L2VudHJ5LlMjZG9tYWluX2NyYXNoX3BhZ2Vf
ZmF1bHRfNng4KzAvMHg0DQo+IChYRU4pIERvbWFpbiAwICh2Y3B1IzApIGNyYXNoZWQgb24g
Y3B1IzExOg0KPiAoWEVOKSAtLS0tWyBYZW4tNC4xOS4yICB4ODZfNjQgIGRlYnVnPW4gIE5v
dCB0YWludGVkIF0tLS0tDQo+IChYRU4pIENQVTogICAgMTENCj4gKFhFTikgUklQOiAgICBl
MDMzOls8ZmZmZmZmZmY4MTAwMTRmZT5dDQo+IChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAx
MDIwNiAgIEVNOiAxICAgQ09OVEVYVDogcHYgZ3Vlc3QgKGQwdjApDQo+IChYRU4pIHJheDog
ZmZmZmZmZmY4MWZiMTJkMCAgIHJieDogMDAwMDAwMDAwMDAwMDI5YSAgIHJjeDogMDAwMDAw
MDAwMDAwMDAwYw0KPiAoWEVOKSByZHg6IDAwMDAwMDAwMDAwMDAyOWEgICByc2k6IGZmZmZm
ZmZmODEwMDBiOTkgICByZGk6IGZmZmZjOTAwNDAwMDAwZjANCj4gKFhFTikgcmJwOiAwMDAw
MDAwMDAwMDAwMTRkICAgcnNwOiBmZmZmYzkwMDQwMDAwMDAwICAgcjg6ICAwMDAwMDAwMDAw
MDAwZjljDQo+IChYRU4pIHI5OiAgMDAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwMDAw
MDAwMDAwMCAgIHIxMTogMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKSByMTI6IDAwMDAwMDAw
MDAwMDAwMGMgICByMTM6IGZmZmZmZmZmODI3NzE1MzAgICByMTQ6IGZmZmZmZmZmODI3NzI0
Y2MNCj4gKFhFTikgcjE1OiBmZmZmYzkwMDQwMDAwMGYwICAgY3IwOiAwMDAwMDAwMDgwMDUw
MDMzICAgY3I0OiAwMDAwMDAwMDAwYjUyNmUwDQo+IChYRU4pIGNyMzogMDAwMDAwMDg2YWUy
NDAwMCAgIGNyMjogZmZmZmM5MDAzZmZmZmZmOA0KPiAoWEVOKSBmc2I6IDAwMDAwMDAwMDAw
MDAwMDAgICBnc2I6IGZmZmY4ODgxOWFjNTUwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gKFhFTikgZHM6IDAwMDAgICBlczogMDAwMCAgIGZzOiAwMDAwICAgZ3M6IDAwMDAgICBz
czogZTAyYiAgIGNzOiBlMDMzDQo+IChYRU4pIEd1ZXN0IHN0YWNrIHRyYWNlIGZyb20gcnNw
PWZmZmZjOTAwNDAwMDAwMDA6DQo+IChYRU4pICAgU3RhY2sgZW1wdHkuDQo+IChYRU4pIEhh
cmR3YXJlIERvbTAgY3Jhc2hlZDogcmVib290aW5nIG1hY2hpbmUgaW4gNSBzZWNvbmRzLg0K
PiAoWEVOKSBSZXNldHRpbmcgd2l0aCBBQ1BJIE1FTU9SWSBvciBJL08gUkVTRVRfUkVHLg0K
PiANCj4gSSBzZWFyY2hlZCBtYWlsaW5nIGxpc3RzIGJ1dCBjb3VsZCBub3QgZmluZCBhIHJl
cG9ydCBzaW1pbGFyIHRvIHdoYXQgSSBhbQ0KPiBzZWVpbmcgaGVyZS4NCj4gDQo+IEkgZG9u
J3Qga25vdyB3aGF0IHRvIHRyeSBleGNlcHQgdG8gZ2l0IGJpc2VjdCwgYnV0IEkgaGF2ZSBu
b3QgZG9uZSB0aGF0IHlldC4NCg0KVGhpcyBpcyBhIGtub3duIGlzc3VlLg0KDQpBIHBhdGNo
IHNlcmllcyB0byBmaXggdGhhdCBoYXMgYmVlbiBwb3N0ZWQ6DQoNCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNTA2MDMxMTE0NDYuMjYwOTM4MS0xLXJwcHRAa2VybmVsLm9y
Zy8NCg0KDQpKdWVyZ2VuDQo=
--------------EOhNGRxKFthsm1FP655sH8HF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------EOhNGRxKFthsm1FP655sH8HF--

--------------OQLtB7JT21dg2AQFGuQitRgX--

--------------0EbFx1IS9ivErK0O9PjmY4R5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhHswQFAwAAAAAACgkQsN6d1ii/Ey9l
Zgf9FX20+U9R5uBooiAQ+iucn8O0Z/vkwLGCbGuN6gH1x+GA3c4zVtjUe0ZVj6TpS25HUQdeoV9t
hR48V3ZTLGSrYE7+Dagad3LKcmF9usB60iq+Sn3fUbM5AHWGvDNdrB/SjeyxxArXg+APAQjDc+KY
xlQduAQX5fTlakRYcULYttoWzeVYafabDNPsNdsFLzqEcISA6xfvOyIQ+8UHCTNmdOIXhYxrzB44
Yvm6TN42tTQo+FmKsIT2u340Yl8w5rtJL5CYV5cno6NnBMDS1OVa5k5wmwA++DB1jkuDo/BLV1kp
RoAbCL5PpTqbSlImCEdyAp28kAGJ5n8dBOBlHevUzw==
=5Yjt
-----END PGP SIGNATURE-----

--------------0EbFx1IS9ivErK0O9PjmY4R5--

