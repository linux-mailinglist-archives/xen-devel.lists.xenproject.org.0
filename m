Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B3B27820
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 07:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082795.1442529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ummk4-0008GE-Td; Fri, 15 Aug 2025 05:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082795.1442529; Fri, 15 Aug 2025 05:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ummk4-0008EX-R2; Fri, 15 Aug 2025 05:12:40 +0000
Received: by outflank-mailman (input) for mailman id 1082795;
 Fri, 15 Aug 2025 05:12:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ummk3-0008EM-9W
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 05:12:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7602beb3-7996-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 07:12:38 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb78e70c5so264098166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 22:12:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53f2bsm50564066b.4.2025.08.14.22.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 22:12:37 -0700 (PDT)
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
X-Inumbo-ID: 7602beb3-7996-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755234757; x=1755839557; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=McLdgNQ0UHTP+K3nrEWRJGT+gcj5jy8rw3LhbVPqvsA=;
        b=QyuL0o3xgzp9dx43ttEHAVta+ZutkoTpwg5hf1OPOGb9OVilOKLtuh25CNr9ywQ1jv
         A23/Ae8OloDZ+JCt2z6AcBBH2vnkEN+mEbyDCZjFwmEL9L+KIOtQFH6cUkC5ne76/iuL
         SllEQ2m9B6Wqacg1UTELw+80Lv7WPEBcY0jRnzhYMPX/lXkkGCtZq1KSoVZhYLi327bV
         6sbgaPjQXbAYHlm+XRcs2MDurt+Qrh2rxNVVlAsueauGuko4g/aeO0ezCsDD/D2EWlKI
         CB/nsVjmB6GmoSuXcIRb8WWsdye65l0ULSLX029Y9LLpHkxL10Fmuri8D4rM24gtcbeV
         LxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755234757; x=1755839557;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=McLdgNQ0UHTP+K3nrEWRJGT+gcj5jy8rw3LhbVPqvsA=;
        b=IFcdVfGaDNN4trXRZnkrrE69TsE4WAi1ikR8yg610F+6R42frIeT48+wbHQrp2LIeV
         q4XdlK/tIQCIbpKI3rg8c1qQ8kSRf0oZlWA847wFYQQ7ZhjiXTw6a3FONHccOvgXSLmR
         8dIYGWRdT2ZcX88+/X9MMK9MbyVBIljbXnc+6oXTZwLrVvQan2AsxsGKAOJCypDKejkw
         eFkH9ShFOQzYGjNKtCWkYDR9Fmewav9MLbfsPb/jbNR/RgEo4xcOT09xWDkF1adn0/3Y
         w9EznQuePuAA0rzkvD1qDW9HVUbp70iN9mABuWjmf/+PojxUharHWh4qlvepay2/O9+C
         T2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnHwBGThL9eaVe4OSNeQ+3WtWL37g8jFaLBdM3ofZ6GG5X0VLTwSxqxmS1QvB/yIP2iinBcajLMW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeszmIkPl5HrQyvmVNXupkzAzoR1pW4FwiHKSJ9kGRf79UjhW8
	Ugi0g/xUX9HQgXPjiGYlFvXCCFUN4cYHsq+tvTxyhP2EyPsnZvuSAB+0jMYsYQJjd8NVvJPmyMZ
	EUcwJ7aE=
X-Gm-Gg: ASbGncvVAQa+ikQ3Xi99IW6wa/wXBlhe1VhO+At6a5YrtwXSFA2qFXv4wBSLN5PnH8q
	wGu4xpyZQ5RFwiNeBtv8paaXo1mBpXq4wcXDNca6mQi/UWfFDc8cCkCivYdAxVrGeYGi3YqzvgC
	Xo/HRmAXVhMKte8dc5HmZUBiUa0GyONBrw6EfH8kob5slrCXj0gOMbMYe3z1eVcgIHxXXrGzBxR
	uFS8BF8inPoIGdN06v5o148y31/MWMCmbWkCHH4vnKHpHAH4K/552N5iiWdSJZNeDv2WsIfG+/c
	snxWxwkbrn1Ms/92RqFswfXlLTRoOSi7lmnl4Cpn8XtpUfW2Bjty5UrqNShf+8h653ba5PgLBVx
	ihBp+xW6FAMGMUu+5Fv+EeZ5ixdcJ/SkctM5LvVatxBEZbtQsfXT5bhss3osUtdj4PAht6Nngjr
	bAXpKRSBO0hUd85m7zwF4jI7xq73lRcOz/UrG5tjar36vhHSTm6nI9sVLSDT7LGfDRhmNx
X-Google-Smtp-Source: AGHT+IH6RL+UYk9eXXiqf/2WHHs101Br/d9JtfFbTA1uN2J85tzv604BGxlwSoNOiF9FL27kkFNuHA==
X-Received: by 2002:a17:906:6a0f:b0:af9:67ef:96d5 with SMTP id a640c23a62f3a-afcdc32cc31mr62306866b.52.1755234757442;
        Thu, 14 Aug 2025 22:12:37 -0700 (PDT)
Message-ID: <3823aae9-34cd-430f-8cf5-873d354c52ac@suse.com>
Date: Fri, 15 Aug 2025 07:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
 <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
 <238b2fd0-33ab-4279-9205-de58332fa944@amd.com>
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
In-Reply-To: <238b2fd0-33ab-4279-9205-de58332fa944@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qv29XdA3S4CPXDXpJem8TU1B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qv29XdA3S4CPXDXpJem8TU1B
Content-Type: multipart/mixed; boundary="------------NWazRfyTV0cxBaTWpf0ZP2x3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <3823aae9-34cd-430f-8cf5-873d354c52ac@suse.com>
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
 <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
 <238b2fd0-33ab-4279-9205-de58332fa944@amd.com>
In-Reply-To: <238b2fd0-33ab-4279-9205-de58332fa944@amd.com>

--------------NWazRfyTV0cxBaTWpf0ZP2x3
Content-Type: multipart/mixed; boundary="------------HJPRokk2UZjLy6HwgH9d4q8C"

--------------HJPRokk2UZjLy6HwgH9d4q8C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDguMjUgMjM6MDQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDgt
MTQgMDM6MDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxMy4wOC4yNSAxNzowMywg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBPbiAyMDI1LTA4LTEyIDE1OjAwLCBKYXNvbiBB
bmRyeXVrIHdyb3RlOg0KPj4+PiBWSVJRcyBjb21lIGluIDMgZmxhdm9ycywgcGVyLVZQVSwg
cGVyLWRvbWFpbiwgYW5kIGdsb2JhbC7CoCBUaGUgZXhpc3RpbmcNCj4+Pj4gdHJhY2tpbmcg
b2YgVklSUXMgaXMgaGFuZGxlZCBieSBwZXItY3B1IHZhcmlhYmxlcyB2aXJxX3RvX2lycS4N
Cj4+Pj4NCj4+Pj4gVGhlIGlzc3VlIGlzIHRoYXQgYmluZF92aXJxX3RvX2lycSgpIHNldHMg
dGhlIHBlcl9jcHUgdmlycV90b19pcnEgYXQNCj4+Pj4gcmVnaXN0cmF0aW9uIHRpbWUgLSB0
eXBpY2FsbHkgQ1BVIDAuwqAgTGF0ZXIsIHRoZSBpbnRlcnJ1cHQgY2FuIG1pZ3JhdGUsDQo+
Pj4+IGFuZCBpbmZvLT5jcHUgaXMgdXBkYXRlZC7CoCBXaGVuIGNhbGxpbmcgdW5iaW5kX2Zy
b21faXJxKCksIHRoZSBwZXItY3B1DQo+Pj4+IHZpcnFfdG9faXJxIGlzIGNsZWFyZWQgZm9y
IGEgZGlmZmVyZW50IGNwdS7CoCBJZiBiaW5kX3ZpcnFfdG9faXJxKCkgaXMNCj4+DQo+PiBU
aGlzIGlzIHdoYXQgbmVlZHMgdG8gYmUgZml4ZWQuIEF0IG1pZ3JhdGlvbiB0aGUgcGVyX2Nw
dSB2aXJxX3RvX2lycSBvZiB0aGUNCj4+IHNvdXJjZSBhbmQgdGhlIHRhcmdldCBjcHUgbmVl
ZCB0byBiZSB1cGRhdGVkIHRvIHJlZmxlY3QgdGhhdCBtaWdyYXRpb24uDQo+IA0KPiBJIGNv
bnNpZGVyZWQgdGhpcywgYW5kIGV2ZW4gaW1wbGVtZW50ZWQgaXQsIGJlZm9yZSBjaGFuZ2lu
ZyBteSBhcHByb2FjaC4gwqBNeSANCj4gY29uY2VybiB3YXMgdGhhdCB0aGUgc2luZ2xlIFZJ
UlEgaXMgbm93IGluIG9uZSBvZiB0aGUgTiBwZXJfY3B1IHZpcnFfdG9faXJxIA0KPiBhcnJh
eXMuwqAgQSBzZWNvbmQgYXR0ZW1wdCB0byByZWdpc3RlciBvbiBDUFUgMCB3aWxsIHByb2Jh
Ymx5IGZpbmQgLTEgYW5kIA0KPiBjb250aW51ZSBhbmQgaXNzdWUgdGhlIGh5cGVyY2FsbC4N
Cg0KVGhlIGh5cGVydmlzb3Igd291bGQgcmVqZWN0IHRoZSBhdHRlbXB0LCByaWdodD8gU28g
aW4gdGhlIGVuZCBubyBwcm9ibGVtLg0KDQo+IEl0IGxvb2tzIGxpa2UgWGVuIHRyYWNrcyB2
aXJxIG9uIHRoZSBiaW5kX3ZpcnEgdmNwdSwgc28gcGVyLWRvbWFpbi9nbG9iYWwgc3RheXMg
DQo+IG9uIHZjcHUwLsKgIEJpbmRpbmcgYWdhaW4gd291bGQgcmV0dXJuIC1FRVhJU1RTLiBm
aW5kX3ZpcnEoKSB3b3VsZCBub3QgbWF0Y2ggdGhlIA0KPiB2aXJxIGlmIGl0IHdhcyByZS1i
b3VuZCB0byBhIGRpZmZlcmVudCB2Y3B1Lg0KDQpXZSBwcm9iYWJseSB3b3VsZCB3YW50IHRv
IG1vZGlmeSBmaW5kX3ZpcnEoKSBhbmQgYmluZF92aXJxX3RvX2lycSgpIHRvIG5vdA0KcmVz
dWx0IGluIGEgQlVHKCkgaWYgYSBub24tcGVyY3B1IHZpcnEgaXMgYm91bmQgdG8gYW5vdGhl
ciBjcHUuIFRoaXMgY291bGQNCmJlIGRvbmUgYnkgcGFzc2luZyB0aGUgcGVyY3B1IGZsYWcg
dG8gZmluZF92aXJxKCkgYW5kIGxldCBmaW5kX3ZpcnEoKSByZXR1cm4NCmUuZy4gLUVFWElT
VCBpZiBhIG5vbi1wZXJjcHUgdmlycSBpcyBmb3VuZCB0byBiZSBib3VuZCB0byBhbm90aGVy
IGNwdS4NCg0KDQpKdWVyZ2VuDQo=
--------------HJPRokk2UZjLy6HwgH9d4q8C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HJPRokk2UZjLy6HwgH9d4q8C--

--------------NWazRfyTV0cxBaTWpf0ZP2x3--

--------------qv29XdA3S4CPXDXpJem8TU1B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiewcQFAwAAAAAACgkQsN6d1ii/Ey9U
dwf+JQ8ngZHuOyMPboD3OIdWJ5UeTzUd+CWSxX/m1aJo/f3gK1XCtKjF1ibbb0UILsS0EBkW33DP
WE0oZ6j/o6JgNy0VCaRO6Q46+5J4wPHlQ1GcPwWNTO/rQRznf3DQYbzTbnD1mnoGbP7as6nJFDVZ
bvVKSA9X/tk7cE0G0o1ksdEak3ZXXK3SkDkjUbuXl8P8emnwAqpLlekIxqocNGsJTTKx3NRkZ3g0
8GRPdGsxlxb4G3kD/rqlE35pK9owUtyzFkUAYFD6cypTEAGgEQLB97g0ENPTWh5GaBeYlS3lpAQG
yNhrN7dYqAAjX1MWmK1ShMI+AI522nM7eofBE78c1g==
=WKZ2
-----END PGP SIGNATURE-----

--------------qv29XdA3S4CPXDXpJem8TU1B--

