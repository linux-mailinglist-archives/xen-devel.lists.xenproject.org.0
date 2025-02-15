Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B19A36E90
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 14:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889420.1298541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjIOg-00028X-Rx; Sat, 15 Feb 2025 13:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889420.1298541; Sat, 15 Feb 2025 13:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjIOg-00026s-PE; Sat, 15 Feb 2025 13:39:54 +0000
Received: by outflank-mailman (input) for mailman id 889420;
 Sat, 15 Feb 2025 13:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjIOe-00026m-RV
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 13:39:52 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530e46f6-eba2-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 14:39:48 +0100 (CET)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so635314466b.1
 for <xen-devel@lists.xenproject.org>; Sat, 15 Feb 2025 05:39:48 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376953sm540479066b.101.2025.02.15.05.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2025 05:39:47 -0800 (PST)
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
X-Inumbo-ID: 530e46f6-eba2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739626788; x=1740231588; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/HjO99d9d4FF6KBejzCVCOkgbzTy1GYB8TrGHHDS3HE=;
        b=EOGi3qOXaK96j8iQNgJgfxEiGq8k9ESDlu83DVfkiQEjNF+uLmApdgE94lYAVBCkd9
         fYRB3Bsof7svqrkkvLoYkIFNrLHsF/5ZRg3o+oETiJY9Z716/skbuhzBizPOXfbr13Q+
         /N7Y+4wj1Arj4U81t5BpzWtdYYrNz8PXjt2D3XqmWixgBC0fr1Rq70x9KUhRlqJBNQUj
         DfGjC9EuKSlts2HGsRX1pEjGaCGXZXJ/xxh9r7r+e7g4gTXNwTso3lXQYhBXzqYcraUP
         91ImEhCLwl3Hsm5AHQuDhVPLozSRdhpbM6VHfL0viKFO7EO/hpUCT4L02S1qDthIpgtL
         Z3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739626788; x=1740231588;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/HjO99d9d4FF6KBejzCVCOkgbzTy1GYB8TrGHHDS3HE=;
        b=RPGh9Vg6Omw2mrndUv9RHx3S6fskGfntDAM/cHjCmt22sfPOkuSE7moHQocOxpXQyI
         vRCxn16GMy6qs6KHzHCvff63i1+aOvs+39i24yaAO1mbRlBbSzu62P0mkCmBcKjNHstt
         nK7qSkPeviIlc2MsjgXq5eeehxftaU0fsxaiV6d6K66bSQtg/Sp5Si+E5V/A6AIdhep4
         Dqz/fpgw3U72F6CWLywrb0r2IU3A7Gqz4whbM8cBMojLXSYTvba6spwKlGCCh56tANbP
         L9JlbA8RIiGcFUYfCq6v11MJn/jc9FX/+JeStQKgCMvhqMGwk8jQ8++q1dJz59G2dgJh
         OkXw==
X-Forwarded-Encrypted: i=1; AJvYcCUSYRQU6cFo5DCxhH0J+7Hb9DzmpAIzeRqugxoOxse8TEoICr2/H1Lyhj1KDU7mKCbjwv+KyJJS340=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yylk9qhsGkUQFKFVs04VtGNK5lpeZ2/lF3cfkiCsAAJWLOcSUrk
	If+EKUyMLoUbaeYuCwxqCUmssAl8eQ3RXSPhwqKkq5hi1O9suvqYrhmXbEAt5LE=
X-Gm-Gg: ASbGnctvnrCtsupdjFtDQ+TgwuoG6jeuD/896Zltsjev7sU+LW4IhyCZcefCU46Yyew
	aqFzhqj8yNAd8yC7O2A1Ggp/yosr69mdA3/iGUqiovceIRCJ7VpzpFKFbEUvzd47NdX+QTy9D2F
	E+vkktOys4C2Z5NxOZwWoYHT3e0at0TVn1FYYaLTrkayADdtZB1aQ0J4gpYd2dyObU5H1cawJJy
	IQJ5s33AlL1Hhn0BG11S5DoKJoQutSoMKZgzumUlgAUzGaBQpbBT8XHD3LXQi0HeJz4/DpWjVeQ
	yAOubO5oWZpK/QgLe5dP/XJWAREH1gVdjudsMU6rA4JoqX2HUqHYqOx4Sz8/9bwX+zDxAoA96cQ
	z5/XBZSrhNMTQQpvaPxXRd4QCFNh2jMuY76ZA6w==
X-Google-Smtp-Source: AGHT+IGi3PRqyuYABsnP6lAed++WWnXZdOFn1qmCp8QMvkad/VYD8NVWu9cVXQTqlOrOCol4oqH6ZQ==
X-Received: by 2002:a17:906:4794:b0:ab7:e52a:1467 with SMTP id a640c23a62f3a-abb70dad218mr275447066b.30.1739626787747;
        Sat, 15 Feb 2025 05:39:47 -0800 (PST)
Message-ID: <74e74dde-0703-4709-96b8-e1615d40f19c@suse.com>
Date: Sat, 15 Feb 2025 14:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add alignment
 check for dma buffers") when booting with Xen and mpt3sas_cm0 _scsih_probe
 failures
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Salvatore Bonaccorso <carnil@debian.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sasha Levin
 <sashal@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 =?UTF-8?Q?Radoslav_Bod=C3=B3?= <radoslav.bodo@igalileo.cz>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
 <Z6ukbNnyQVdw4kh0@eldamar.lan>
 <716f186d-924a-4f2c-828a-2080729abfe9@oracle.com>
 <6d7ed6bf-f8ad-438a-a368-724055b4f04c@suse.com>
 <2025021548-amiss-duffel-9dcf@gregkh>
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
In-Reply-To: <2025021548-amiss-duffel-9dcf@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ls6AIDBcoZHL08gcNLOiJrfG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ls6AIDBcoZHL08gcNLOiJrfG
Content-Type: multipart/mixed; boundary="------------lTGN4b9A8HyzQDmrmj3ffGkP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Salvatore Bonaccorso <carnil@debian.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sasha Levin
 <sashal@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 =?UTF-8?Q?Radoslav_Bod=C3=B3?= <radoslav.bodo@igalileo.cz>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <74e74dde-0703-4709-96b8-e1615d40f19c@suse.com>
Subject: Re: [6.1.y] Regression from b1e6e80a1b42 ("xen/swiotlb: add alignment
 check for dma buffers") when booting with Xen and mpt3sas_cm0 _scsih_probe
 failures
References: <Z6d-l2nCO1mB4_wx@eldamar.lan>
 <fd650c88-9888-46bc-a448-9c1ddcf2b066@oracle.com>
 <Z6ukbNnyQVdw4kh0@eldamar.lan>
 <716f186d-924a-4f2c-828a-2080729abfe9@oracle.com>
 <6d7ed6bf-f8ad-438a-a368-724055b4f04c@suse.com>
 <2025021548-amiss-duffel-9dcf@gregkh>
In-Reply-To: <2025021548-amiss-duffel-9dcf@gregkh>

--------------lTGN4b9A8HyzQDmrmj3ffGkP
Content-Type: multipart/mixed; boundary="------------ODYaakMO0X8VgXtiljW8Is0u"

--------------ODYaakMO0X8VgXtiljW8Is0u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjUgMTM6MzQsIEdyZWcgS0ggd3JvdGU6DQo+IE9uIFNhdCwgRmViIDE1LCAy
MDI1IGF0IDEyOjQ3OjU3UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAx
Mi4wMi4yNSAxNjoxMiwgSGFyc2hpdCBNb2dhbGFwYWxsaSB3cm90ZToNCj4+PiBIaSBTYWx2
YXRvcmUsDQo+Pj4NCj4+PiBPbiAxMi8wMi8yNSAwMDo1NiwgU2FsdmF0b3JlIEJvbmFjY29y
c28gd3JvdGU6DQo+Pj4+IEhpIEhhcnNoaXQsDQo+Pj4+DQo+Pj4+IE9uIFN1biwgRmViIDA5
LCAyMDI1IGF0IDAxOjQ1OjM4QU0gKzA1MzAsIEhhcnNoaXQgTW9nYWxhcGFsbGkgd3JvdGU6
DQo+Pj4+PiBIaSBTYWx2YXRvcmUsDQo+Pj4+Pg0KPj4+Pj4gT24gMDgvMDIvMjUgMjE6MjYs
IFNhbHZhdG9yZSBCb25hY2NvcnNvIHdyb3RlOg0KPj4+Pj4+IEhpIEp1ZXJnZW4sIGhpIGFs
bCwNCj4+Pj4+Pg0KPj4+Pj4+IFJhZG9zbGF2IEJvZMOzIHJlcG9ydGVkIGluIERlYmlhbiBh
biBpc3N1ZSBhZnRlciB1cGRhdGluZyBvdXIga2VybmVsDQo+Pj4+Pj4gZnJvbSA2LjEuMTEy
IHRvIDYuMS4xMTUuIEhpcyByZXBvcnQgaW4gZnVsbCBpcyBhdDoNCj4+Pj4+Pg0KPj4+Pj4+
IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnLzEwODgxNTkNCj4+Pj4+Pg0KPj4+Pj4NCj4+Pj4+
IE5vdGU6DQo+Pj4+PiBXZSBoYXZlIHNlZW4gdGhpcyBvbiA1LjQueSBrZXJuZWw6IE1vcmUg
ZGV0YWlscyBoZXJlOg0KPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzlkZDkx
ZjZlLTFjNjYtNDk2MS05OTRlLWRiZGE4N2Q2OWRhZEBvcmFjbGUuY29tLw0KPj4+Pg0KPj4+
PiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBzbyBsb29raW5nIGF0IHRoYXQgdGhyZWFkIEkg
c3VzcGVjdCB0aGUgdGhyZWUNCj4+Pj4gcmVmZXJlbmNlZCBidWdzIGluIERlYmlhbiBhcmUg
aW4gdGhlIGVuZCBhbGwgcmVsZWF0ZWQuIFdlIGhhdmUgb25lIGFzDQo+Pj4+IHdlbGwgcmVs
YXRpbmcgdG8gdGhlIG1lZ2FzYXNfc2FzIGRyaXZlciwgdGhpcyBvbmUgZm9yIHRoZSBtcHQz
c2FzDQo+Pj4+IGRyaXZlciBhbmQgb25lIGZvciB0aGUgaTQwZSBkcml2ZXIpLg0KPj4+Pg0K
Pj4+PiBBRkFJQ1MsIHRoZXJlIGlzIG5vdCB5ZXQgYSBwYXRjaCB3aGljaCBoYXMgbGFuZGVk
IHVwc3RyZWFtIHdoaWNoIEkgY2FuDQo+Pj4+IHJlZGlyZWN0IHRvIGEgYWZmZWN0ZWQgdXNl
ciB0byB0ZXN0Pw0KPj4+Pg0KPj4+DQo+Pj4gS29ucmFkIHBvaW50ZWQgbWUgYXQgdGhpcyB0
aHJlYWQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLw0KPj4+IGFsbC8yMDI1MDIxMTEyMDQz
Mi4yOTQ5My0xLWpncm9zc0BzdXNlLmNvbS8NCj4+Pg0KPj4+IFRoaXMgaGFzIHNvbWUgZml4
ZXMsIGJ1dCBub3QgbGFuZGVkIHVwc3RyZWFtIHlldC4NCj4+DQo+PiBQYXRjaGVzIGFyZSB1
cHN0cmVhbSBub3cuIEluIGNhc2UgeW91IHN0aWxsIGV4cGVyaWVuY2UgYW55IHByb2JsZW1z
LCBwbGVhc2UNCj4+IHNwZWFrIHVwLg0KPiANCj4gV2hhdCBzcGVjaWZpYyBjb21taXRzIHNo
b3VsZCBiZSBiYWNrcG9ydGVkIGhlcmU/DQoNClRob3NlIGFyZToNCg0KZTkzZWM4NzI4NmJk
MWZkMzBiNzM4OWU3YTM4N2NmYjI1OWYyOTdlMw0KODVmY2I1N2M5ODNmNDIzMTgwYmE2ZWM1
ZDAwMzQyNDJkYTA1Y2M1NA0KDQoNCkp1ZXJnZW4NCg0KPiANCj4gdGhhbmtzLA0KPiANCj4g
Z3JlZyBrLWgNCg0K
--------------ODYaakMO0X8VgXtiljW8Is0u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ODYaakMO0X8VgXtiljW8Is0u--

--------------lTGN4b9A8HyzQDmrmj3ffGkP--

--------------ls6AIDBcoZHL08gcNLOiJrfG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmewmSIFAwAAAAAACgkQsN6d1ii/Ey+q
aQf/aYXytelSPX7A3LqOoN7OhhcZkbHXfctM13VICeRX4cL/JV+AZ2EWC0zYWz6asyRuSZ7H54tN
ZiTjryZxT3bdDu/vq3MClqGh3/Vgr6jG8hh/DZqRloRuM0Viq908Hfnh+QOYrN+V9J3cfwmN5DHi
Sl08HmN7QW5WsfiMJigiMJVnX3WTF/URF2aKNSf8fC/m5AkMN5SQ654tZQlxV6vVq0lrWgQc0zQm
XiEoEr1oDJc1B3SP2GcIe6DkpDlq6myM+2zArhIXLz7eyKeOTtDcYHmj6jXQumCnw/DCeQi9PgtK
zzfDVCxvyFkrXcTmxDn2zcM2vBI0AjAeffpLHBiNCQ==
=RyC/
-----END PGP SIGNATURE-----

--------------ls6AIDBcoZHL08gcNLOiJrfG--

