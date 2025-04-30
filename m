Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412CAA50A3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973794.1361838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9bP-0006yt-Fb; Wed, 30 Apr 2025 15:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973794.1361838; Wed, 30 Apr 2025 15:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9bP-0006wH-CI; Wed, 30 Apr 2025 15:44:03 +0000
Received: by outflank-mailman (input) for mailman id 973794;
 Wed, 30 Apr 2025 15:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uA9bO-0006wB-Ba
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:44:02 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef486a19-25d9-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:44:00 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so1137340966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:44:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace86d7fc8fsm778997166b.97.2025.04.30.08.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:43:59 -0700 (PDT)
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
X-Inumbo-ID: ef486a19-25d9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027840; x=1746632640; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yJCu6C0nYovaowF+R62pGVhluC7KO4nD5YOw5qJLi/4=;
        b=AjeqjoSef1TRnvI4rMXnd8v72OICjVXwQP0OPEEPy8DB6ETf+1ppvNBzLXt8yLuOIK
         m/sTBlKnjcwZ9fGz8aIqOYeB30k6O3pVsiJabtjg/cb4kIsgpqzwXG95akMo8HbicnJM
         n10sJajwMT+BZbfqaHpUXaJZmk61bnRh96feKYMwmBDMJPhcy3QED0kFdzSUv25gq+A3
         4u1BKS6Fu1tAwWmsAZ6y6zdF5gvEylaLWkZnyAV7C7b+PATnkfz9xbeRFmlHCKD/kHCr
         IFmzBB/+UyxK7f3q81CPQRz1JZ9zq/yaUNDCDSWhoeIwZ+/y/z6kIY5ZM0TE/FDnyChT
         I4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027840; x=1746632640;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJCu6C0nYovaowF+R62pGVhluC7KO4nD5YOw5qJLi/4=;
        b=ZTsUjGJs2P7GmgfbVq5R3ShQsYXexVrJB0arfc7aUlm03nTkYhM2RK4MdZaBCIzxR4
         MiBzBI/rgdtIzZaeKb9cKZuQg8lLQB0glGo1xRHq4Lxm5VUWkK0O3OqZ7EJlEFIxsAlR
         2qDLtRVIK6Cu6y2cAT7gkzb9flP+1DpbjFa4Msiwu/+smUg4yRs348aHba1A48TPR75B
         LKAG4Uch8bDH356/vKJvAx3WP5ToKSv1L9z94Dcu2KIa6bJNy7iZNR32EWK0t2jQpObY
         5mrmDUhaleL3RgeoUhJS+gKkIRqQ/RgNED4aID81ne7HtOHNvNsr3SwLuYdTvWHAhIFq
         Xo4w==
X-Forwarded-Encrypted: i=1; AJvYcCWBgL9jyfvm+6Iks1YW8nG3jxORektT4S1/22/NLZf/REHtAOrnL2EpuQ22nmS+0IqjpvB2O17AH7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqHmEGuSU+Sh6sXTU7KlWoLaKQUW81dcBr09GJ7oT7umMFR36I
	ScqjwAWAHti1MoD7OKN63aZODz6iRlNcpBgsbdxV+OVP/FRXcebcZeUmFwF7AQE=
X-Gm-Gg: ASbGncuS911ekioy3ZFvxZkSempMzJnlkdDZHFh3MG4A2alQUaLUvSQBMt+NTnI6NE0
	3Xr1TaiNa1qir0Cth6KN6VJnVFyN5//6Vlqrb/bFXaaVqjrP3bCbFEiHG8cARr+N2vlZZB8ePf9
	zjcf2si7Lytmol8lg7vCWsjW4PqtyT1WmEKUgxTp6OD1lfxixx5y2m43gj7oyL+qev/yv1Zc4ME
	aPpinqYe0mPaxEVcejRg0y6Wq6QM+OfF1TJUNWdiLO/MO/xOUJtwldEmzuTJRBg0/wZLuOAh7ft
	Qwotw+sMDS9jwKvVxZuowdiBiClMj29gVpHG/Ugt+PPb2dph6wsKcsngpFRNtmevLnwafNWRE19
	Z5n2nrsrwiQFLmwbwc9krKaCbzuUfCM/41DiRSisqzwiBg8aF0WZiSIq+Is1Z/v1POQ==
X-Google-Smtp-Source: AGHT+IHqnaJ5qYnYML+c76zzPz/gKXfAiZjPZVRMGT4XNLBTH5UPAyF6BdARcJMAvlbyt7LowwHaBA==
X-Received: by 2002:a17:907:97d1:b0:aca:cac7:28e2 with SMTP id a640c23a62f3a-acedc7001a6mr389729966b.40.1746027839689;
        Wed, 30 Apr 2025 08:43:59 -0700 (PDT)
Message-ID: <ea422f7c-64fb-4b19-b953-cb3d0404222a@suse.com>
Date: Wed, 30 Apr 2025 17:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference in xenbus_thread->...
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl>
 <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
 <aBIBy5eQPypM_UbJ@mail-itl> <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com>
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
In-Reply-To: <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DS8JEtToRP9QUbxnK0CLOZFE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DS8JEtToRP9QUbxnK0CLOZFE
Content-Type: multipart/mixed; boundary="------------r8ICPxbM70FqkNfSSufVF6Lv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <ea422f7c-64fb-4b19-b953-cb3d0404222a@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl>
 <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
 <aBIBy5eQPypM_UbJ@mail-itl> <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com>
In-Reply-To: <641aef98-5dde-4618-9fa4-7ccfa2e1989d@amd.com>

--------------r8ICPxbM70FqkNfSSufVF6Lv
Content-Type: multipart/mixed; boundary="------------00N4XbMn9GqOUPeaKko46K0D"

--------------00N4XbMn9GqOUPeaKko46K0D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDQuMjUgMTY6MjksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDQt
MzAgMDY6NTYsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+IE9uIFR1
ZSwgQXByIDI5LCAyMDI1IGF0IDA4OjU5OjQ1UE0gLTA0MDAsIEphc29uIEFuZHJ5dWsgd3Jv
dGU6DQo+Pj4gSGkgTWFyZWssDQo+Pj4NCj4+PiBPbiBXZWQsIEFwciAyMywgMjAyNSBhdCA4
OjQy4oCvQU0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+Pj4gPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOg0KPiANCj4+Pj4gSSd2ZSBnb3Qgc29tZSBt
b3JlIHJlcG9ydCBjb25maXJtaW5nIGl0J3Mgc3RpbGwgaGFwcGVuaW5nIG9uIExpbnV4DQo+
Pj4+IDYuMTIuMTguIElzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGhlbHAgZml4aW5n
IHRoaXM/IE1heWJlIGFzayB1c2Vycw0KPj4+PiB0byBlbmFibGUgc29tZSBleHRyYSBsb2dn
aW5nPw0KPj4+DQo+Pj4gSGF2ZSB5b3UgYmVlbiBhYmxlIHRvIGNhcHR1cmUgYSBjcmFzaCB3
aXRoIGRlYnVnIHN5bWJvbHMgYW5kIHJ1biBpdA0KPj4+IHRocm91Z2ggc2NyaXB0cy9kZWNv
ZGVfc3RhY2t0cmFjZS5zaD8NCj4+DQo+PiBOb3QgcmVhbGx5LCBhcyBJIGRvbid0IGhhdmUg
ZGVidWcgc3ltYm9scyBmb3IgdGhpcyBrZXJuZWwuIEFuZCBJIGNhbid0DQo+PiByZWxpYWJs
eSByZXByb2R1Y2UgaXQgbXlzZWxmIChmb3IgbWUgaXQgaGFwcGVucyBhYm91dCBvbmNlIGlu
IGENCj4+IG1vbnRoLi4uKS4gSSBjYW4gdHJ5IHJlcHJvZHVjaW5nIGRlYnVnIHN5bWJvbHMs
IHRoZW9yZXRpY2FsbHkgSSBzaG91bGQNCj4+IGhhdmUgYWxsIGluZ3JlZGllbnRzIGZvciBp
dC4NCj4+DQo+Pj4gSSdtIGN1cmlvdXMgd2hhdCBwcm9jZXNzX21zZysweDE4ZS8weDJmMCBp
cy7CoCBwcm9jZXNzX3dyaXRlcygpIGhhcyBhDQo+Pj4gZGlyZWN0IGNhbGwgdG8gd2FrZV91
cCgpLCBidXQgcHJvY2Vzc19tc2coKSBjYWxsaW5nIHJlcS0+Y2IocmVxKSBtYXkNCj4+PiBi
ZSB4c193YWtlX3VwKCkgd2hpY2ggaXMgYSB0aGluIHdyYXBwZXIgb3ZlciB3YWtlX3VwKCku
DQo+Pg0KPj4gVGhlcmUgaXMgYSBjb2RlIGR1bXAgaW4gdGhlIGNyYXNoIG1lc3NhZ2UsIGRv
ZXMgaXQgaGVscD8NCj4gDQo+IFRoYXQncyBhIGxpdHRsZSBkZWVwZXIgaW4gdGhlIGNhbGwg
Y2hhaW4uwqAgSWYgeW91IGhhdmUgYSB2bWxpbnV4IG9yIGJ6SW1hZ2Ugd2l0aCANCj4gYSBt
YXRjaGluZyBzdGFja3RyYWNlLCB0aGF0IHdvdWxkIHdvcmsgdG8gbG9vayB1cCB0aGUgYWRk
cmVzcyBpbiB0aGUgDQo+IGRpc2Fzc2VtYmx5LsKgIFNvIGlmIHlvdSBkb24ndCBoYXZlIGEg
bWF0Y2hpbmcgcGFpciwgbWF5YmUgdHJ5IHRvIGNhdGNoIGl0IHRoZSANCj4gbmV4dCB0aW1l
Lg0KPiANCj4+PiBUaGV5IG1ha2UgbWUgd29uZGVyIGlmIHJlcSBoYXMgYmVlbiBmcmVlKCll
ZCBhbmQgYXQgbGVhc3QgcGFydGlhbGx5DQo+Pj4gemVyby1lZCwgYnV0IGl0IHN0aWxsIGhh
cyB3YWtlX3VwKCkgY2FsbGVkLsKgIFRoZSBjYWxsIHN0YWNrIGhlcmUgaXMNCj4+PiByZW1p
bmlzY2VudCBvZiB0aGUgb25lIGhlcmUNCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94
ZW4tZGV2ZWwvWl9sSlR5VmlwSkpFcFdnMkBtYWlsLWl0bC8gYW5kIHRoZQ0KPj4+IHVuZXhw
ZWN0ZWQgdmFsdWUgdGhlcmUgaXMgMC4NCj4+DQo+PiBUaGF0J3MgaW50ZXJlc3RpbmcgaWRl
YSwgdGhlIG9uZSBhYm92ZSBJJ3ZlIHNlZW4gb25seSBvbiA2LjE1LXJjMSAoYW5kDQo+PiBu
byBsYXR0ZXIgcmMpLiBCdXQgbWF5YmU/DQo+IA0KPiBJIGFtIGd1ZXNzaW5nLCBzbyBJIGNv
dWxkIGJlIHdyb25nLsKgIE5VTEwgcG9pbnRlciBhbmQgdW5leHBlY3RlZCB6ZXJvIHZhbHVl
IGFyZSANCj4gYm90aCAwIGF0IGxlYXN0LsKgIEFsc28gV2hvbml4IGxvb2tzIGxpa2UgaXQg
bWF5IHVzZSBpbml0X29uX2ZyZWU9MSB0byB6ZXJvIA0KPiBtZW1vcnkgYXQgZnJlZSB0aW1l
Lg0KDQpJIGhhdmUgbG9va2VkIGF0IHRoaXMgaXNzdWUgbXVsdGlwbGUgdGltZXMgbm93Lg0K
DQpKdXN0IHNvbWUgcmVtYXJrcyB3aGF0IElNTyBjb3VsZCBnbyB3cm9uZyAoSSBkaWRuJ3Qg
ZmluZCBhbnkgcHJvb2YgdGhhdA0KdGhpcyByZWFsbHkgaGFwcGVuZWQsIHRob3VnaCksIGlu
IGNhc2Ugc29tZW9uZSB3YW50cyB0byBkb3VibGUgY2hlY2s6DQoNClRoZSBtb3N0IHByb2Jh
Ymx5IGNhbmRpZGF0ZSBmb3Igc29tZXRoaW5nIGdvaW5nIHdyb25nIGlzIGEgdXNlLWFmdGVy
LWZyZWUNCm9mIGEgc3RydWN0IHhiX3JlcV9kYXRhIGVsZW1lbnQgKG5vcm1hbGx5IG5hbWVk
ICJyZXEiIGluIHRoZSByZWxhdGVkIGNvZGUpLg0KDQpTb21lIHdvcmRzIGFib3V0IHRoZSBu
b3QgcmVhbGx5IG9idmlvdXMgbG9ja2luZyBzY2hlbWUgdXNlZCBmb3IgdGhvc2UNCmVsZW1l
bnRzOiBBICJyZXEiIGlzIG93bmVkIGJ5IGEgdGhyZWFkIGFzIGxvbmcgYXMgaXQgaXNuJ3Qg
aW4gYW55IG9mIHRoZQ0KbGlzdHMgaXQgY2FuIGxpdmUgaW4gKHhzX3JlcGx5X2xpc3Qgb3Ig
eGJfd3JpdGVfbGlzdCkuIFB1dHRpbmcgaXQgaW50byBvbmUNCm9mIHRoZSBsaXN0cyBvciBy
ZW1vdmluZyBpdCBhZ2FpbiByZXF1aXJlcyB0byBob2xkIHRoZSB4Yl93cml0ZV9tdXRleC4N
Cg0KQSAicmVxIiBuZWVkcyB0byBiZSBpbiBhIGNlcnRhaW4gc3RhdGUgd2hlbiBlaXRoZXIg
aW4gb25lIG9mIHRoZSBsaXN0cyBvcg0Kd2hlbiBiZWluZyBvd25lZCBieSBhIHdvcmtlciB0
aHJlYWQuDQoNCkknbSB3b25kZXJpbmcgd2hldGhlciBpdCBjb3VsZCBoYXBwZW4gdGhhdCBh
IHRocmVhZCB3YWl0aW5nIGZvciBhICJyZXEiDQpjb3VsZCBiZSB3b2tlbiB1cCBhbmQgdGhl
ICJyZXEiIGlzIGJlaW5nIGZyZWVkIGJlZm9yZSB0aGUgd2FpdGluZyB0aHJlYWQNCmNhbiBy
ZWFjdC4gTm9ybWFsbHkgdGhpcyBzaG91bGRuJ3QgYmUgcG9zc2libGUsIGJ1dCAibmV2ZXIg
c2F5IG5ldmVyIi4NCldoYXQgY2F0Y2hlZCBteSBleWUgdG9kYXkgaXMgdGhlIHRlc3Qgb2Yg
cmVxLT5zdGF0ZSA9PSB4Yl9yZXFfc3RhdGVfd2FpdF9yZXBseQ0KaW4gcHJvY2Vzc19tc2co
KSBqdXN0IGFmdGVyIGRyb3BwaW5nIHRoZSB4Yl93cml0ZV9tdXRleC4gVGhpcyBsb29rcyBh
IGxpdHRsZQ0KYml0IGZpc2h5LCBidXQgT1RPSCB0aGUgcmVxdWVzdCBoYXMgYmVlbiBqdXN0
IHJlbW92ZWQgZnJvbSB0aGUgeHNfcmVwbHlfbGlzdCwNCnNvIG5vIG11dGV4IHNob3VsZCBi
ZSBuZWVkZWQgZm9yIHRoYXQgdGVzdC4NCg0KUG9zc2libGUgY2FuZGlkYXRlcyBmb3Igc3Vj
aCBhbiAiaW1wb3NzaWJsZSIgc2NlbmFyaW8gaW5jbHVkZSBhIHdyYXAgb2YNCnhzX3JlcXVl
c3RfaWQgKG5vdCB2ZXJ5IHByb2JhYmxlLCB0aG91Z2gsIGFzIGhhdmluZyA0IGJpbGxpb24g
WGVuc3RvcmUNCnJlcXVlc3RzICJpbiBmbGlnaHQiIGlzIHJhdGhlciB1bmxpa2VseSBJTUhP
KS4NCg0KDQpKdWVyZ2VuDQo=
--------------00N4XbMn9GqOUPeaKko46K0D
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------00N4XbMn9GqOUPeaKko46K0D--

--------------r8ICPxbM70FqkNfSSufVF6Lv--

--------------DS8JEtToRP9QUbxnK0CLOZFE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgSRT4FAwAAAAAACgkQsN6d1ii/Ey81
uQf+LHPbdWZUY7CEgDoYRYQ6cSUMu38j9YHdSZSroNplyaLJgNU05ZgH5sTa5KHfvXmeO6kOE+iV
or3SkwTa9M7n4koOn75xAfFeuzHQu6IyZasaLObaupTDp+VPy7CtZUp4bD12OzqDi/UOtV+PoEHG
Urgyrb9JUvyDK6in1glu5h+QoDeOIWAFDPpSmQRlm28dKN3nAPkGdJcXfQM/Kuu7DGoB3+lQ7Ad0
CChpBczhdnuyk+72UvXb9tHqlcSjhQEELXEHGhkM6bXVzhErZDpSM3kittu8ZRac+nrc8F/ztnqV
aX8Zho0yxvPUpfgaKXYLqjxK3Rf3wP1mL3Nw7BTdEg==
=7PlM
-----END PGP SIGNATURE-----

--------------DS8JEtToRP9QUbxnK0CLOZFE--

