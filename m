Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E69FF925
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 13:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863849.1275222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTJzc-0002sw-6E; Thu, 02 Jan 2025 12:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863849.1275222; Thu, 02 Jan 2025 12:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTJzc-0002rF-2a; Thu, 02 Jan 2025 12:08:00 +0000
Received: by outflank-mailman (input) for mailman id 863849;
 Thu, 02 Jan 2025 12:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTJzb-0002r4-9q
 for xen-devel@lists.xen.org; Thu, 02 Jan 2025 12:07:59 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34008577-c902-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 13:07:57 +0100 (CET)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso18542641a12.0
 for <xen-devel@lists.xen.org>; Thu, 02 Jan 2025 04:07:57 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fedc68sm18777651a12.66.2025.01.02.04.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 04:07:56 -0800 (PST)
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
X-Inumbo-ID: 34008577-c902-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735819677; x=1736424477; darn=lists.xen.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pTdwL/KCe5Pn5t5XFHub7/aoY3sfOr8iS3jCq36ZaYs=;
        b=RLRjSRaEqsmzMR8/V92+aNritVFne3F+tScVh/UCUnvo2oD93oZzsVOJ+kiBYFdWGq
         TxRvDTb16VwCnyIBXZ+nDLM4xXzARrChAjy7jKxrH3ji2zVsMS9xYgcNSfBRdJ2IdVWJ
         IoebQg7EukOOvsYpU+M1J5Wmva77Ppa25fFV3PL4GAQBCUUDfF10/xiEev9SINg3sEeg
         Ft6V+c237u5XBxRYcW40Sphb6Jr7/B/zSdPV2j2Xrv3EbOkhzNdZCjA4wXwA4X4lS40o
         DmxUX2BpAP9Q78+A34qcbdkbfWpYwmer37V/lNq7ByH0hbhjvuPL6LSQHnN5JL0mRwQj
         +ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735819677; x=1736424477;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTdwL/KCe5Pn5t5XFHub7/aoY3sfOr8iS3jCq36ZaYs=;
        b=ZExvME3+XSzBwxWl19wPMN5SdiBm53Bb6yoWsuxXhiubOLmNL7EkS0JpNFqnpk+ZgY
         2iNU/rmrtetXyihwhmvboDIoYKmt+L5pxzohdUgcKnomELJNStQ7hZ2B65vtk7NGEg17
         3d1XD2/u68ztJ7VtKP/2A4GPtDg7MKaebpDrNhGd/RCmLzuVrhq0+hwxx3y/48Xla1Z6
         MDFVUkPQ1FXI5xx/uerU32ry18h/2X8NQu0xVq2vvr7ND9FnJd+gHvatwe1n8EN0tyI6
         OVDiORg+h+UgMrurjUsxCURg9czqUwDJUK6z8lHrKGSxicJWYucLB/yrtGZ0es1PGqLX
         LEGw==
X-Forwarded-Encrypted: i=1; AJvYcCXv/Uag/9tDjcdjQjMrLbUTFdNU+S3IIoM692ZChaRJdR2C0ohMpQizKF8tYZpvrVtOWyz8hMqzjFg=@lists.xen.org
X-Gm-Message-State: AOJu0YymTQz2keg4Qmjt04C2Uf+5YctUAs5h8bGskZL1RkEFh1+7HWRB
	7P+TTjqmK/ucbZzNLqhC/RQX3LjTrxOo5aC9Hux08qzi2/H6q4ycgv6joHwftIc=
X-Gm-Gg: ASbGncvE6jS+ZFrU3sF0wttDoNSA9DLyIC5AM/zfa5UQD9xUDJbUm4Lfp65KQx545Xi
	NZBuG/PhzSDYwFGxd1cQQ/mpq3L9xrskceNEREPHMO3pYmS55k3qujeIhPS/7B1c9Yp9Id6AK1c
	A7n5JTc0+oYUqkv1B6KdGlrc1uzcVfDNXuVMHvCEiXjXkHxBQHg3GwUYN+lvE66NZVIgHHWJg6f
	YdRecj4MYhIHfns0wKIIpUCl2fiI9bTagpYsdoQi9UXfzS9trrdsxq8vNvDTNtGewLBLQtsrvDx
	jTa8y/2zMTDD0YWxUXzFPeuZI68BEKORHiyrrZfU1JJCY75cOql+bp31itxh4NNvuIa5iIimTBx
	7tqW/2Q==
X-Google-Smtp-Source: AGHT+IHL12MxRnBiagIn4NAHb2yoVccPRle7YHvncCvPEC7pBBtxAGV2hQpGMNzf7ulAq1dVAYiKkQ==
X-Received: by 2002:a50:cc04:0:b0:5d8:a46f:110b with SMTP id 4fb4d7f45d1cf-5d8a46f1123mr17548310a12.17.1735819676532;
        Thu, 02 Jan 2025 04:07:56 -0800 (PST)
Message-ID: <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
Date: Thu, 2 Jan 2025 13:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
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
In-Reply-To: <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d5C5ixIhUlO7wPMZWJ3AvT0M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d5C5ixIhUlO7wPMZWJ3AvT0M
Content-Type: multipart/mixed; boundary="------------3DtLA5VgbWMlh1ZUA0LYmvrT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Message-ID: <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
In-Reply-To: <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
Autocrypt-Gossip: addr=security@xen.org; keydata=
 xsBNBE+hNqgBCADYua5OFR0/Jeu0rByk+Obk6+SewIeGej1FAcjo+Cvpcr1dfnLBAhmmhbfM
 b++qr6SG6Ek+cUQogYAFvZcEcusbRPy4MIzJkqoPSyOUhCxZoxWNWUfhDdt0TWA3Hs1vYmFO
 e+2jvlL3h7yAsGMYO8jo6ow8ceBEOmf8Q5BLq2OPkNpGcaHEhbSv0VZ3mdHM30ynY6GubIws
 c68LZ5hTORTSjKaj2WVCe4OorBMZte5Im+6MOEUbCjynqPJSU9KNFhIhUuyXp1vn0gZ2N5QS
 pkghpzBJLzeBNEI6ecV3Q0p+/pq8EvEAuUSNLUEbIZ/NSLqyTVMc9HZxnPu59im8wB9rABEB
 AAHNK1hlbi5vcmcgKGluY29taW5nIGVtYWlsKSA8c2VjdXJpdHlAeGVuLm9yZz7CwHgEEwEC
 ACIFAk+hNqgCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHQ6P8qC06lk1y0H/2Pj
 jQyPDZVS4zIVnR4xQOQ1KphPCdSTPlhj+VVrjZZNXWGCUKvJShL84XIONH62fIgQE/6CTWXJ
 tx6i4u1oAtFH4+8HayFjg609lxx9frJ4tJkJitw5TT6VEGAambchIG5QaP9hepgyrVXjQ0X2
 ot0jgpwL6G3sx0L1gewiMALXtGT6oTqLjXius/nv69yRe26wxU1GX80oWWH/5p585xt54C1X
 nhDEVzp0S9UW7VAAVDCWuSefSrihh3jZi4QE1fnGRwO0RfeLh1sXeuMn9uFIz0CmaCbAp5Pe
 UyNb6wgG60h4JLCDyhJntoHfq8pQLEJ8G9nvjDfw8BLvkBKYNvbOwE0ET6E2qAEIALqWNlGF
 d3uIj+DXZ40/i7fsoPb+HaYaG6Y+7+ZWxMxUeQDTLBnTYiAa+EGVutc4v52BXH8RZc9I/NH9
 lBT2/AwaEVSomxLicbixXUGoFC9kMp/VP1xwWJ+gm+ZEnQzY+2AFJGMvqEsGocQA7yLw121J
 UOrorny3CqpHykPUF3fqp4n/GL47VTaKxlsoV8o2JgZZ62NJlkBtnbA4ODzhWr6cA21smWFg
 sfFJ+EkXb1NEeYLs8CWtTn2EiQXlZTQ8OgBPahfvLZ+AJ4sM/Raoi2c3UIQrlCsg9BoojKMk
 Li8XUrywr8HEJYjhBYObCgbmaeIEfmrw5XJqOKlMg40XY+MAEQEAAcLAXwQYAQIACQUCT6E2
 qAIbDAAKCRB0Oj/KgtOpZDhJB/0XtxrlVuRttpjK1PEYK/A/9h47VH9p0UvVYCH+ZS2a+sTg
 sapx0zp4uni8wtytkvGw/EM06D4ZoaWAUcjXILNKGdi62q/z+WAfdEY/WrONxAbr2Dtv/LT0
 0/2nifYU9O1vGYS1Kx/B3D8fU0w+2Sjv+hYjbGDWn619etC8dNEIxczH6V/cVOZf0D2KhoBf
 MCHUoKeuAfaIKDMxOZjb7sajfUW70cxFFWYqH96Py01oxDroOKzy0x62iVdsYFGB3FvcD9tD
 WsxVWwGHA8DKEfKMuNPiuapzdxdrNm5AQilSUlfD65KK9d3kQdoOUPdPWoIQnz8GnHMPDe99
 7SuwxWGb

--------------3DtLA5VgbWMlh1ZUA0LYmvrT
Content-Type: multipart/mixed; boundary="------------0eWtS0PUDjsTPP5cJ7jLipMV"

--------------0eWtS0PUDjsTPP5cJ7jLipMV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTIuMjQgMTU6MjQsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVHVlLCAy
MDI0LTEyLTE3IGF0IDEyOjE4ICswMDAwLCBYZW4ub3JnIHNlY3VyaXR5IHRlYW0gd3JvdGU6
DQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhlbiBTZWN1cml0eSBBZHZpc29yeSBD
VkUtMjAyNC01MzI0MSAvIFhTQS00NjYNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uIDMNCj4+DQo+
PiAgwqDCoMKgwqDCoMKgwqDCoCBYZW4gaHlwZXJjYWxsIHBhZ2UgdW5zYWZlIGFnYWluc3Qg
c3BlY3VsYXRpdmUgYXR0YWNrcw0KPj4NCj4+IFVQREFURVMgSU4gVkVSU0lPTiAzDQo+PiA9
PT09PT09PT09PT09PT09PT09PQ0KPj4NCj4+IFVwZGF0ZSBvZiBwYXRjaCA1LCBwdWJsaWMg
cmVsZWFzZS4NCj4gDQo+IENhbid0IHdlIGV2ZW4gdXNlIHRoZSBoeXBlcmNhbGwgcGFnZSBl
YXJseSBpbiBib290PyBTdXJlbHkgd2UgaGF2ZSB0bw0KPiBrbm93IHdoZXRoZXIgd2UncmUg
cnVubmluZyBvbiBhbiBJbnRlbCBvciBBTUQgQ1BVIGJlZm9yZSB3ZSBnZXQgdG8gdGhlDQo+
IHBvaW50IHdoZXJlIHdlIGNhbiBlbmFibGUgYW55IG9mIHRoZSBuZXcgY29udHJvbC1mbG93
IGludGVncml0eQ0KPiBzdXBwb3J0PyBEbyB3ZSBuZWVkIHRvIGp1bXAgdGhyb3VnaCB0aG9z
ZSBob29wcyBkbyBkbyB0aGF0IGVhcmx5DQo+IGRldGVjdGlvbiBhbmQgc2V0dXA/DQoNClRo
ZSBkb3duc2lkZSBvZiB0aGlzIGFwcHJvYWNoIHdvdWxkIGJlIHRvIGhhdmUgYW5vdGhlciB2
YXJpYW50IHRvIGRvDQpoeXBlcmNhbGxzLiBTbyB5b3UnZCBoYXZlIHRvIHJlcGxhY2UgdGhl
IHZhcmlhbnQgYmVpbmcgYWJsZSB0byB1c2UgQU1EDQpvciBJTlRFTCBzcGVjaWZpYyBpbnN0
cnVjdGlvbnMgd2l0aCBhIGZ1bmN0aW9uIGRvaW5nIHRoZSBoeXBlcmNhbGwgdmlhDQp0aGUg
aHlwZXJjYWxsIHBhZ2UuDQoNCkknbSBwbGFubmluZyB0byBzZW5kIHBhdGNoZXMgZm9yIFhl
biBhbmQgdGhlIGtlcm5lbCB0byBhZGQgQ1BVSUQgZmVhdHVyZQ0KYml0cyBpbmRpY2F0aW5n
IHdoaWNoIGluc3RydWN0aW9uIHRvIHVzZS4gVGhpcyB3aWxsIG1ha2UgbGlmZSBtdWNoIGVh
c2llci4NCg0KPiBFbmFibGluZyB0aGUgaHlwZXJjYWxsIHBhZ2UgaXMgYWxzbyBvbmUgb2Yg
dGhlIHR3byBwb2ludHMgd2hlcmUgWGVuDQo+IHdpbGwgJ2xhdGNoJyB0aGF0IHRoZSBndWVz
dCBpcyA2NC1iaXQsIHdoaWNoIGFmZmVjdHMgdGhlIGxheW91dCBvZiB0aGUNCj4gc2hhcmVk
X2luZm8sIHZjcHVfaW5mbyBhbmQgcnVuc3RhdGUgc3RydWN0dXJlcy4NCj4gDQo+IFRoZSBv
dGhlciBzdWNoIGxhdGNoaW5nIHBvaW50IGlzIHdoZW4gdGhlIGd1ZXN0IHNldHMNCj4gSFZN
X1BBUkFNX0NBTExCQUNLX0lSUSwgYW5kIEkgKnRoaW5rKiB0aGF0IHNob3VsZCB3b3JrIGlu
IGFsbA0KPiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIFhlbiBBQkkgKGluY2x1ZGluZyBRRU1V
L0tWTSBhbmQgRUMyKS4gQnV0IHdvdWxkDQo+IHdhbnQgdG8gdGVzdC4NCj4gDQo+IEJ1dCBw
ZXJoYXBzIGl0IHdvdWxkbid0IGh1cnQgZm9yIG1heGltYWwgY29tcGF0aWJpbGl0eSBmb3Ig
TGludXggdG8gc2V0DQo+IHRoZSBoeXBlcmNhbGwgcGFnZSAqYW55d2F5KiwgZXZlbiBpZiBM
aW51eCBkb2Vzbid0IHRoZW4gdXNlIGl0IOKAlCBvcg0KPiBvbmx5IHVzZXMgaXQgZHVyaW5n
IGVhcmx5IGJvb3Q/DQoNCkknbSBzZWVpbmcgcG90ZW50aWFsIHByb2JsZW1zIHdpdGggdGhh
dCBhcHByb2FjaCB3aGVuIHNvbWVvbmUgaXMgdXNpbmcNCmFuIG91dC1vZi10cmVlIG1vZHVs
ZSBkb2luZyBoeXBlcmNhbGxzLg0KDQpXaXRoIGhhdmluZyB0aGUgaHlwZXJjYWxsIHBhZ2Ug
cHJlc2VudCBzdWNoIGEgbW9kdWxlIHdvdWxkIGFkZCBhIHdheSB0byBkbw0Kc3BlY3VsYXRp
dmUgYXR0YWNrcywgd2hpbGUgZGVsZXRpbmcgdGhlIGh5cGVyY2FsbCBwYWdlIHdvdWxkIHJl
c3VsdCBpbiBhDQpmYWlsdXJlIHRyeWluZyB0byBsb2FkIHN1Y2ggYSBtb2R1bGUuDQoNCg0K
SnVlcmdlbg0K
--------------0eWtS0PUDjsTPP5cJ7jLipMV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0eWtS0PUDjsTPP5cJ7jLipMV--

--------------3DtLA5VgbWMlh1ZUA0LYmvrT--

--------------d5C5ixIhUlO7wPMZWJ3AvT0M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2gZsFAwAAAAAACgkQsN6d1ii/Ey9B
3Af/fsSbEMj2KVLFyk4HNbmstc4UiK+Ynscvf/qTeZbNJCG2tJWv26stp7HDD/Croie6W4Uxts+K
Cs84SZd3pJZmjZOuar8/BIcV1ZigCSPVYIORTXNLwjQ/oFIEWbbbArYDiwKAGGX32Z6o5965NP/9
JvSyMj1ATMEFvkxv6vgT6PtV0VKQBPOU6Ponk/RBtTaWgiP5PeKrRMtb7IArVXfZ84s9UtOkPfk9
e4JFjJT+Vk2GRVUp1pnP9LzLik88z7ZWoYgGnmhK8kXLbOuEZcmkseRnmdNWpHW59T2Z61/LqQJU
UzafsAbbu1Jk+eHVmIC1nmT7Rq1Wt0+T+xz6d8TpvA==
=M+/n
-----END PGP SIGNATURE-----

--------------d5C5ixIhUlO7wPMZWJ3AvT0M--

