Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32693AFE91E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 14:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038102.1410615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZU4l-0000Ko-Ik; Wed, 09 Jul 2025 12:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038102.1410615; Wed, 09 Jul 2025 12:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZU4l-0000Io-Fv; Wed, 09 Jul 2025 12:39:03 +0000
Received: by outflank-mailman (input) for mailman id 1038102;
 Wed, 09 Jul 2025 12:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cq+0=ZW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZU4k-0000IQ-FR
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 12:39:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afd4f81d-5cc1-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 14:38:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae0b2ead33cso168205466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 05:38:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66d91cdsm1080206266b.22.2025.07.09.05.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 05:38:58 -0700 (PDT)
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
X-Inumbo-ID: afd4f81d-5cc1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752064739; x=1752669539; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TGxMYjPXVLd9yWj4ywG7G2GfeS9ZZHzY4MnW/FCc7rI=;
        b=MmctkQIi9ZVHv/lcsGK0R4Ej2YnpkkSgpFjcYdeLUsI13JE2BB5OaTxD8XdQiiX0vd
         YDF7CyH/p33IglwobhBcbWXu6Nn+TDeGpOl/ljQ+7oWOCWBBE6XtidZ6Gf3PcvhR0gpn
         nFSnn/nzUQsK/xnHrmq8/0gTHLxLxZBjGpr8pMolSGNCoTxuPisD7YP28i0kITEfdSR2
         9mW3fFtZslhGsBhqdWQ+naFMUn5RD3cnJQcE/69vq68qwW2qNxq435zHHFuhve8BjVOn
         W6o+sZjuNMBifeQIfUwCXmOlgZA5G+RbMz9ZVsZy+n6sElKkbK3jKMorOBGyygxMX++c
         /iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064739; x=1752669539;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGxMYjPXVLd9yWj4ywG7G2GfeS9ZZHzY4MnW/FCc7rI=;
        b=Fv13OsunXqqu6iAIB8n4oQcajqdDyGEm4vW+Do4x/Qwnuwtvb2M0yPfnfahXVsIPhA
         0/SQDSX2S9gPlLuO+oPA4hel855JB6Mb8iUEDt2PvetwfdB13xuqbDw6XJYqkjfA35qS
         TcGR62LHRoFqAKeabX4fZyzsshZsIxTEfB6isF+0lc7E6VZRY1Vf7WHaqnJSGy05L5j2
         jPe8tDuvI9mbDd8QyhezWkY+emN+o8B5AKlUHmZnULKVOJWnNqdpMMDDFywaimeQTMpK
         1NTwc7x8BuI4q3N+4MWG10memI5crha4rGtecO4e4GjgHRO2vGi3cTF/Xpz9ANkT9xli
         +umA==
X-Forwarded-Encrypted: i=1; AJvYcCVaO2/+jdvqa7QwW6w2FcLgADnU1yGCa6s1Vz4309FiGcJv6LhkHpp1VBdzx3HiSQBOPD1uRqGYg/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2jx7nizN0EgzK87QXLf4V6ylyrG6Xq+a3vHsCSHyDnk6kHzKl
	SwRpizpxT4iuXEM1jFzUTGN14GuuoNRWwE711uS8kijy1YUa+t/fAuae6B/CGHa/wb0=
X-Gm-Gg: ASbGncveS0r7NPKgsg4t6Q3kUlODCKayYLyTwN9Z52w09h6uo7ymnOJ0CHWSXe7Mtaf
	Qv49m0kKJpJIsyrjv8a5NsMWVGqmNlI4rOYdriTSDsX/o6utLt4FoVDWXuZ8kSVNp+tfQkTyJ3E
	OYHrHJFOq+uTWagutXuo960xxKIUOlUWxDT/jz4L2ImoaATAdnh7HgcRMK4z22xf1mpOhcqVwZq
	e12DMOvM8LQZlFcHarDjRyFaYDvlu8uPquJEnNf5sLI7aCvezNVwjkumUlDnnu3RTZu7iFKmCTR
	+wVYP5kndwHDX+ThAXOP+6ziP9lNNJWtNsKVmshvDBxZb6wik4SHmd7E6RV2JDHYTrN6npF4rfg
	pYKTbOSKkD3adCETfTxFNakDV5+5u+GvgjfO2u3YhyZTJ78v7tt2kF5KsL1OlHbVjK96dfDulXD
	GhYIPYa0Jx
X-Google-Smtp-Source: AGHT+IE60OnlrCRyimbXylqOwKiounBKwIeg4tgjUs6H/nSDRczhqhg9ueQM5LFTe1d9webo9zaugw==
X-Received: by 2002:a17:907:1c93:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-ae6d1400ab3mr257259666b.16.1752064739033;
        Wed, 09 Jul 2025 05:38:59 -0700 (PDT)
Message-ID: <d7aac7a8-5fe4-4384-9356-3acce2e2959a@suse.com>
Date: Wed, 9 Jul 2025 14:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 06/19] mm: don't add module pages to free memory
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-7-jgross@suse.com>
 <fe9ea209-6a41-4448-b171-bfa7e639989d@amd.com>
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
In-Reply-To: <fe9ea209-6a41-4448-b171-bfa7e639989d@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qKIgX27ZuyYmM0rFYb1chl0U"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qKIgX27ZuyYmM0rFYb1chl0U
Content-Type: multipart/mixed; boundary="------------ATUUifIYBnFkglr50i1XVHcg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
Message-ID: <d7aac7a8-5fe4-4384-9356-3acce2e2959a@suse.com>
Subject: Re: [MINI-OS PATCH 06/19] mm: don't add module pages to free memory
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-7-jgross@suse.com>
 <fe9ea209-6a41-4448-b171-bfa7e639989d@amd.com>
In-Reply-To: <fe9ea209-6a41-4448-b171-bfa7e639989d@amd.com>

--------------ATUUifIYBnFkglr50i1XVHcg
Content-Type: multipart/mixed; boundary="------------fxNu4lbztAUFEZDamof2nVuJ"

--------------fxNu4lbztAUFEZDamof2nVuJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDcuMjUgMjM6MTQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDct
MDIgMDQ6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaGVuIGluaXRpYWxpemluZyB0
aGUgbWVtb3J5IGFsbG9jYXRvciwgZG9uJ3QgYWRkIG1lbW9yeSBwYWdlcyBvZg0KPj4gbW9k
dWxlcyBhbmQgdGhlIGluaXRpYWwgYm9vdCBpbmZvIHN0cnVjdHVyZSB0byB0aGUgZnJlZSBt
ZW1vcnkuDQo+Pg0KPj4gVGhpcyBpcyByZWxldmFudCBvbmx5IHdoZW4gcnVubmluZyBpbiBQ
VkggbW9kZSwgYXMgaW4gUFYgbW9kZSBvbmx5DQo+PiBtZW1vcnkgYWJvdmUgdGhlIGluaXRp
YWwgcGFnZSB0YWJsZXMgaXMgYWRkZWQgdG8gZnJlZSBtZW1vcnksIGFuZCB0aGUNCj4+IG1v
ZHVsZSBhbmQgc3RhcnRfaW5mbyBwYWdlcyBhcmUgYmVsb3cgdGhlIHBhZ2UgdGFibGVzLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4+DQo+PiArLyogUmVzZXJ2ZWQgbWVtb3J5IHJhbmdlcyBub3QgYWRkZWQgdG8gZnJlZSBt
ZW1vcnkuICovDQo+PiArI2RlZmluZSBNQVhfUlNWX1JBTkdFU8KgIDENCj4+ICtzdGF0aWMg
c3RydWN0IHsNCj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBzdGFydDsNCj4+ICvCoMKgwqAg
dW5zaWduZWQgbG9uZyBzaXplOw0KPj4gK30gcmVzZXJ2ZWRfcmFuZ2VbTUFYX1JTVl9SQU5H
RVNdOw0KPj4gKw0KPj4gK3ZvaWQgY2hlY2tfbWVtb3J5X3JhbmdlKHVuc2lnbmVkIGxvbmcg
KmZyb20sIHVuc2lnbmVkIGxvbmcgKnRvKQ0KPj4gK3sNCj4+ICvCoMKgwqAgdW5zaWduZWQg
aW50IG07DQo+PiArwqDCoMKgIHN0cnVjdCBodm1fbW9kbGlzdF9lbnRyeSAqbW9kOw0KPj4g
Kw0KPj4gK8KgwqDCoCBmb3IgKCBtID0gMDsgbSA8IE1BWF9SU1ZfUkFOR0VTICYmIHJlc2Vy
dmVkX3JhbmdlW21dLnNpemU7IG0rKyApDQo+PiArwqDCoMKgwqDCoMKgwqAgY2hlY2tfbWVt
b3J5X3JhbmdlX2NvbmZsaWN0KGZyb20sIHRvLCByZXNlcnZlZF9yYW5nZVttXS5zdGFydCwN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2VydmVkX3JhbmdlW21dLnNpemUpOw0KPiANCj4g
cmVzZXJ2ZWRfcmFuZ2VbXSBpc24ndCB1cGRhdGVkLCBzbyB0aGlzIGlzIGRlYWQgY29kZS7C
oCBJIGd1ZXNzIHRoYXQgaXMgZmluZSBmb3IgDQo+IG5vdy4NCg0KSSB0aG91Z2h0IHNvLCB5
ZXMuIEl0IGZlbHQgbW9yZSBuYXR1cmFsIHRvIGFkZCBpdCBpbiB0aGlzIHBhdGNoLg0KDQo+
PiArDQo+PiArwqDCoMKgIG1vZCA9IChzdHJ1Y3QgaHZtX21vZGxpc3RfZW50cnkgKikodW5z
aWduZWQgbG9uZykNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaHZtX3N0YXJ0X2luZm9fcHRy
LT5tb2RsaXN0X3BhZGRyOw0KPj4gK8KgwqDCoCBmb3IgKCBtID0gMDsgbSA8IGh2bV9zdGFy
dF9pbmZvX3B0ci0+bnJfbW9kdWxlczsgbSsrICkNCj4+ICvCoMKgwqDCoMKgwqDCoCBjaGVj
a19tZW1vcnlfcmFuZ2VfY29uZmxpY3QoZnJvbSwgdG8sIG1vZFttXS5wYWRkciwgbW9kW21d
LnNpemUpOw0KPj4gK30NCj4+ICsNCj4gDQo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IHsN
Cj4+IEBAIC04ODgsNiArOTY0LDEwIEBAIHZvaWQgYXJjaF9pbml0X21tKHVuc2lnbmVkIGxv
bmcqIHN0YXJ0X3Bmbl9wLCB1bnNpZ25lZCANCj4+IGxvbmcqIG1heF9wZm5fcCkNCj4+IMKg
wqDCoMKgwqAgaWYgKCBtYXhfcGZuID49IE1BWF9NRU1fU0laRSAvIFBBR0VfU0laRSApDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4X3BmbiA9IE1BWF9NRU1fU0laRSAvIFBBR0VfU0la
RSAtIDE7DQo+PiArI2lmbmRlZiBDT05GSUdfUEFSQVZJUlQNCj4+ICvCoMKgwqAgcHZoX3Jl
c2VydmVfc3RhcnRfaW5mbygmc3RhcnRfcGZuKTsNCj4+ICsjZW5kaWYNCj4gDQo+IE1heWJl
IHRoaXMgaWZkZWYgY2FuIGJlIHJlbW92ZWQgYW5kIGFyY2hfbW1fcHJlaW5pdCgpIGNhbiBj
YWxsIA0KPiBwdmhfcmVzZXJ2ZV9zdGFydF9pbmZvKCkgYW5kIHVwZGF0ZSBmaXJzdF9mcmVl
X3BmbiAod2hpY2ggaXMgYXNzaWduZWQgdG8gDQo+IHN0YXJ0X3Bmbik/DQoNClllcywgdGhh
dCBzaG91bGQgYmUgcG9zc2libGUuDQoNClRoYW5rcyBmb3IgdGhlIGlkZWEsIEknbGwgbW9k
aWZ5IHRoZSBwYXRjaC4NCg0KDQpKdWVyZ2VuDQo=
--------------fxNu4lbztAUFEZDamof2nVuJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------fxNu4lbztAUFEZDamof2nVuJ--

--------------ATUUifIYBnFkglr50i1XVHcg--

--------------qKIgX27ZuyYmM0rFYb1chl0U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhuYuEFAwAAAAAACgkQsN6d1ii/Ey9e
hQgAi96vwkgRrHDwYrHU6SdxKaBwE2i3WQH6hwMDGTDio1tSzfLoOkxcJ8P9RnP0S52/kVM5cVKZ
HBLtofuXsM8cfeP7D86EA96ZdHNkM3XAHW05qAAhsIbp2o6gleabSWR1So9XGzBBdxmSHgxl9OVn
zSedhBACw8GeQuzgT0HYzQN1ibjZyyGunwLnUlRUKddkSb5DeLl5S5xhHORsIOkKNCWFHiqLJG51
7fTPZQ7Nn9ahh3zWZlTaFhPtY+rouVa2MjG52i8YjvXD+Y6E9FII3wPXgdRLyEGvXLE7OD56Z+9x
sfqylUEKXbZHAsfDAVtinIFOloKvA40Gb3fenXHR6g==
=/4rt
-----END PGP SIGNATURE-----

--------------qKIgX27ZuyYmM0rFYb1chl0U--

