Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34806B386AC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096404.1451120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urI4d-0007ef-SN; Wed, 27 Aug 2025 15:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096404.1451120; Wed, 27 Aug 2025 15:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urI4d-0007d8-Ou; Wed, 27 Aug 2025 15:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1096404;
 Wed, 27 Aug 2025 15:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1urI4b-0007d2-Ew
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:28:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad020dc-835a-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:28:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b55ed86b9so27863985e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 08:28:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70e4ba41bsm22171534f8f.10.2025.08.27.08.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 08:28:27 -0700 (PDT)
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
X-Inumbo-ID: 7ad020dc-835a-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756308507; x=1756913307; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZHO/YQ+haGNkt9khqU2T0JCsW992oiJXts5vyXlK3HM=;
        b=L/ROvGYz4x27jD9N1uaFHk4RLQ8ACx4asyvs0KgqLBsfR6CrLtUOJDPAyjIefwIq/5
         jlwcW4BlW2Q77WDBaZGVHW8YfcssEMwpOzhZg4lVNI6eZM89tGoVV0+oGMxSMnaiRkhe
         1JfJnfABUzDQRmCA3TH1o9hZU1l5ukudGMvJBnhVr8s3IeDEFi4atCEXzamnohDvKozZ
         IyYSJjvSxkfN2txxErbmKUo1BqawrbaWM2dHhvqSui150Y3yN+qT8ZoJVjYBT6wlNrGb
         QIPTyOAWVoOkHWabHbpTUoJfFrWMkRQ3BkEnoSksNDe4HKcS3Argcn4fnvjOuAgGqA5M
         aGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308507; x=1756913307;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZHO/YQ+haGNkt9khqU2T0JCsW992oiJXts5vyXlK3HM=;
        b=aimONLbLsLDfrKc6CjrsdPInZqx12UeAKMUopCyLMt7CoWPn2gF8BGR0BS+53QYuvD
         u0VtGo56ujAiiL6+4te92oZ4C94kDakAzVVIMdA21eAeOHBd8S1h0NFzUU4Dzz391FZL
         9+1TfdWuozjzEiMc6okY6LAY/cX5UdObEuLIwn9X8BI9NELWrZBIuzV6SXOhxA3/stTo
         l0df7qU7rkqjghGUQNUvNvPqelKB8HvU0P2HM2ybdfDAtSI0EMK/UUpCSC3sK9ONLfy3
         z2J05Q63sX5RQpvALMryzxeRd/ieTgMz2fDybe9snm+HL6fCOBC9iPAjnz46I0SuZUZI
         BiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7gAhSohf1odjUNRXWCdZJLoemSme85+c8dMYl7dsk/7JwCKpChv4xBnAwF0g05EMzwD/eZifqEsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwjYKCZK3H++w8YmuSB8vUeluOMS/aghiTQaCFPp0M7GFOMNDs
	MPDcleBKnddfWa1Xw0lVwgvhpeexnCZm1btgVCxbcM1OS3x+AV5RSc1TB0Pj9q3IJyg=
X-Gm-Gg: ASbGncvOEfXB5eBdOybAKsvlFBLVpu1K+ZSfNYvYL0U72PMX5hLsGVCYYxpjvY5MKfU
	p7+W8WpRJzr4Co3VEdeUa9NUf+NtuVmDLuTOfGWhB28bzGClNPrD20Wmv3HGlXW5Isx+syGPRtO
	83hGDmeTtq9xxdZmVgJOP4qw427opBuwhVHxDoc/vW84NxsFsskVI7xgTQzL09EuDQaYkKO/zGQ
	RJ3xgeqOJKWTqmTpPhWw4hDfBBSqe2NkxRiH3bDC74C5HMCdxWH6AGC+9skQSz8oyLj5NQ2kSbe
	m0nTkTSnxe7z5tK0wirP5elfb/CGuoRf0NzWIqF1y+eOOaSS8pf6fnMcmtcYVDTqHyo0UNwGZlA
	h0kwLgYY6ixhz9xIDzBefS5Xr+z8H+4D54orgxTy63+Y+vjiZCpmT1F1QcYbtQj0/3z3nv/B0rn
	5FqALf4lfvywj3lwFKk5CnKrebJS2wEyrpQ+Cac1z9LIslErqT+Bgbw9MSAOTra8yjQvLX
X-Google-Smtp-Source: AGHT+IEeLGCNsJOtrMU+ti5GRWsMjoLHu9rO9GZ9XlrO0SXAsnmfPKsyHxMW9X1kcm5TzyA+FvqzBQ==
X-Received: by 2002:a05:600c:1ca0:b0:456:2698:d4d9 with SMTP id 5b1f17b1804b1-45b656a81femr61146055e9.3.1756308507273;
        Wed, 27 Aug 2025 08:28:27 -0700 (PDT)
Message-ID: <b57adcd5-59ca-4f0c-b584-e32bb6bf76ca@suse.com>
Date: Wed, 27 Aug 2025 17:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/events: Update virq_to_irq on migration
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-4-jason.andryuk@amd.com>
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
In-Reply-To: <20250826005517.41547-4-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FielMo0vxUF6NqHBXh3OYeI1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FielMo0vxUF6NqHBXh3OYeI1
Content-Type: multipart/mixed; boundary="------------fbbiWdt0Ibqsr7Bm5TKakccR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <b57adcd5-59ca-4f0c-b584-e32bb6bf76ca@suse.com>
Subject: Re: [PATCH v2 3/3] xen/events: Update virq_to_irq on migration
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-4-jason.andryuk@amd.com>
In-Reply-To: <20250826005517.41547-4-jason.andryuk@amd.com>

--------------fbbiWdt0Ibqsr7Bm5TKakccR
Content-Type: multipart/mixed; boundary="------------t4JMt5F7jtJ5f9n0h2Ibtk09"

--------------t4JMt5F7jtJ5f9n0h2Ibtk09
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjUgMDI6NTUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFZJUlFzIGNvbWUg
aW4gMyBmbGF2b3JzLCBwZXItVlBVLCBwZXItZG9tYWluLCBhbmQgZ2xvYmFsLCBhbmQgdGhl
IFZJUlFzDQo+IGFyZSB0cmFja2VkIGluIHBlci1jcHUgdmlycV90b19pcnEgYXJyYXlzLg0K
PiANCj4gUGVyLWRvbWFpbiBhbmQgZ2xvYmFsIFZJUlFzIG11c3QgYmUgYm91bmQgb24gQ1BV
IDAsIGFuZA0KPiBiaW5kX3ZpcnFfdG9faXJxKCkgc2V0cyB0aGUgcGVyX2NwdSB2aXJxX3Rv
X2lycSBhdCByZWdpc3RyYXRpb24gdGltZQ0KPiBMYXRlciwgdGhlIGludGVycnVwdCBjYW4g
bWlncmF0ZSwgYW5kIGluZm8tPmNwdSBpcyB1cGRhdGVkLiAgV2hlbg0KPiBjYWxsaW5nIF9f
dW5iaW5kX2Zyb21faXJxKCksIHRoZSBwZXItY3B1IHZpcnFfdG9faXJxIGlzIGNsZWFyZWQg
Zm9yIGENCj4gZGlmZmVyZW50IGNwdS4gIElmIGJpbmRfdmlycV90b19pcnEoKSBpcyBjYWxs
ZWQgYWdhaW4gd2l0aCBDUFUgMCwgdGhlDQo+IHN0YWxlIGlycSBpcyByZXR1cm5lZC4gIFRo
ZXJlIHdvbid0IGJlIGFueSBpcnFfaW5mbyBmb3IgdGhlIGlycSwgc28NCj4gdGhpbmdzIGJy
ZWFrLg0KPiANCj4gTWFrZSB4ZW5fcmViaW5kX2V2dGNobl90b19jcHUoKSB1cGRhdGUgdGhl
IHBlcl9jcHUgdmlycV90b19pcnEgbWFwcGluZ3MNCj4gdG8ga2VlcCB0aGVtIHVwZGF0ZSB0
byBkYXRlIHdpdGggdGhlIGN1cnJlbnQgY3B1LiAgVGhpcyBlbnN1cmVzIHRoZQ0KPiBjb3Jy
ZWN0IHZpcnFfdG9faXJxIGlzIGNsZWFyZWQgaW4gX191bmJpbmRfZnJvbV9pcnEoKS4NCj4g
DQo+IEZpeGVzOiBlNDZjZGI2NmM4ZmMgKCJ4ZW46IGV2ZW50IGNoYW5uZWxzIikNCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1
ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPiAtLS0NCj4gVjI6DQo+IERpZmZlcmVudCBh
cHByb2FjaCBjaGFuZ2luZyB2aXJxX3RvX2lycQ0KPiAtLS0NCj4gICBkcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYyB8IDExICsrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5j
DQo+IGluZGV4IGE4NWJjNDNmNDM0NC4uNGU5ZGI3YjkyZGRlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPiArKysgYi9kcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYw0KPiBAQCAtMTc3Miw2ICsxNzcyLDcgQEAgc3RhdGljIGlu
dCB4ZW5fcmViaW5kX2V2dGNobl90b19jcHUoc3RydWN0IGlycV9pbmZvICppbmZvLCB1bnNp
Z25lZCBpbnQgdGNwdSkNCj4gICB7DQo+ICAgCXN0cnVjdCBldnRjaG5fYmluZF92Y3B1IGJp
bmRfdmNwdTsNCj4gICAJZXZ0Y2huX3BvcnRfdCBldnRjaG4gPSBpbmZvID8gaW5mby0+ZXZ0
Y2huIDogMDsNCj4gKwlpbnQgb2xkX2NwdSA9IGluZm8gPyBpbmZvLT5jcHUgOiB0Y3B1Ow0K
DQpJJ2QgcHJlZmVyIG5vdCB0byBpbml0aWFsaXplIG9sZF9jcHUganVzdCBoZXJlIC4uLg0K
DQo+ICAgDQo+ICAgCWlmICghVkFMSURfRVZUQ0hOKGV2dGNobikpDQo+ICAgCQlyZXR1cm4g
LTE7DQoNCi4uLiBhcyBoZXJlIGluZm8gaXMgYWx3YXlzIHZhbGlkLCBzbyB5b3UgY2FuIGp1
c3QgdXNlICJvbGRfY3B1ID0gaW5mby0+Y3B1OyINCihwcm9iYWJseSBqdXN0IGFmdGVyIHRo
ZSBoeXBlcmNhbGwpLg0KDQo+IEBAIC0xNzk1LDggKzE3OTYsMTggQEAgc3RhdGljIGludCB4
ZW5fcmViaW5kX2V2dGNobl90b19jcHUoc3RydWN0IGlycV9pbmZvICppbmZvLCB1bnNpZ25l
ZCBpbnQgdGNwdSkNCj4gICAJICogaXQsIGJ1dCBkb24ndCBkbyB0aGUgeGVubGludXgtbGV2
ZWwgcmViaW5kIGluIHRoYXQgY2FzZS4NCj4gICAJICovDQo+ICAgCWlmIChIWVBFUlZJU09S
X2V2ZW50X2NoYW5uZWxfb3AoRVZUQ0hOT1BfYmluZF92Y3B1LCAmYmluZF92Y3B1KSA+PSAw
KQ0KPiArCXsNCg0KS2VybmVsIHN0eWxlLCBwbGVhc2UuDQoNCj4gICAJCWJpbmRfZXZ0Y2hu
X3RvX2NwdShpbmZvLCB0Y3B1LCBmYWxzZSk7DQo+ICAgDQo+ICsJCWlmIChpbmZvLT50eXBl
ID09IElSUVRfVklSUSkgew0KPiArCQkJaW50IHZpcnEgPSBpbmZvLT51LnZpcnE7DQo+ICsJ
CQlpbnQgaXJxID0gcGVyX2NwdSh2aXJxX3RvX2lycSwgb2xkX2NwdSlbdmlycV07DQo+ICsN
Cj4gKwkJCXBlcl9jcHUodmlycV90b19pcnEsIG9sZF9jcHUpW3ZpcnFdID0gLTE7DQo+ICsJ
CQlwZXJfY3B1KHZpcnFfdG9faXJxLCB0Y3B1KVt2aXJxXSA9IGlycTsNCj4gKwkJfQ0KPiAr
CX0NCj4gKw0KPiAgIAlkb191bm1hc2soaW5mbywgRVZUX01BU0tfUkVBU09OX1RFTVBPUkFS
WSk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KDQoNCkp1ZXJnZW4NCg==
--------------t4JMt5F7jtJ5f9n0h2Ibtk09
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------t4JMt5F7jtJ5f9n0h2Ibtk09--

--------------fbbiWdt0Ibqsr7Bm5TKakccR--

--------------FielMo0vxUF6NqHBXh3OYeI1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmivJBoFAwAAAAAACgkQsN6d1ii/Ey9m
hwf6AjJNBsatfMWQviiZt722Ay9fHeeBnJBgJ+YWpzzjmzyvSYgp1PGdJHJfIE7fiZWAkdxls34E
qDjcA+87AMk7V95ekhVBKpnuUwRb+yRTME6SdOoC0YPgBVOzUiVN9wlwqh7v4wArQPx4SuZrRhV9
UBTceKRorxF9wcrIoOmcEGly7hKcY5qoTKZjMTNeAqmKEGE161Mf/j+WssPGJS29GJv0vnmSmjfs
2Na+zy4as7habpJQu/IPBbhqbmW2Gd4iwzyKkhaCTt6iA/tBOGk3AhRa9bX+iETxiNVIgktunUBD
L9luzcfw/C/Fl77UQNPRo4c39tAxT83z1Ppb8xw8Vg==
=fwd3
-----END PGP SIGNATURE-----

--------------FielMo0vxUF6NqHBXh3OYeI1--

