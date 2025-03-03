Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04991A4BBDA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900121.1308037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2rP-0003Bj-5v; Mon, 03 Mar 2025 10:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900121.1308037; Mon, 03 Mar 2025 10:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp2rP-00039i-2m; Mon, 03 Mar 2025 10:17:19 +0000
Received: by outflank-mailman (input) for mailman id 900121;
 Mon, 03 Mar 2025 10:17:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DNf3=VW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tp2rN-0001Bj-LS
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:17:17 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae35c978-f818-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 11:17:15 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e4cbade42aso6211008a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 02:17:15 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ed7f1sm779447166b.120.2025.03.03.02.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 02:17:15 -0800 (PST)
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
X-Inumbo-ID: ae35c978-f818-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740997035; x=1741601835; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f0+RXG1QXdetp1zSU7vRei+8efksYZBck+Kmn79XYV4=;
        b=B5sVZ7AKb/ekwPftOJ45muap1EalSdIgrn9YJwgO+4pcqWUIyhLZBWliV82zvTQtuw
         9MvZi97T8xCrAFF/mMKTy0PiNErioAgVWAJ7JUX26KEV1DPd+GK4mvZkvbAGpz8FCjyM
         Wm7ma4PjZZ9+p7PjQlbDeRrLyd0zsmu/TXkSZRUCn50tfA4q9ou91NO3xeOnATpeu9NQ
         HPYv/qpqUmq/j8a48HiySBEWxtLfWIAT7MiV+p9A738q+PNLNUnvOweQTzmTxKIMEsgh
         0UQxLjbZHCbzTgLwKAGOcRLQYPIpvncwFiH9paVV51mhvd/FGJ4TO3lT98oRW+uDc+Xq
         qKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740997035; x=1741601835;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0+RXG1QXdetp1zSU7vRei+8efksYZBck+Kmn79XYV4=;
        b=Q839E6se7419Owyk9NTbhiYOek/AkFGXVZvHTT8LXC+LnCCi6unGk/YzdwOYUQ44MH
         7mFxhlBZsLD9qRlGfh6VK391ulKP0CxkVuITgozpyO/4b4bC02KuxXaLcOeiV0vcRDzA
         aJWKOdP2fMX3YetfqtpcxqBZX70gTyV5Eg8vN/5MmcQQd+qzLVgvb/5pFLSioHxtnaCU
         uu0yb3bVVMgYmg5eX+9hxHi4Vr0ObuZIUaPL5Q9+sIy11WhV6MwxEqewGau8vzf7CTzI
         rBNW8VoxFR/DiX2HDTcF7tyJZSVD5okdVYKXArQejjzpIbSpE132uX6i70NAW4ckNEPo
         aWLg==
X-Gm-Message-State: AOJu0YxMBgkd/6AtllDNu/QHMs4SmEB9BbhviO0WzcX5fGIgA/dqeP4f
	pgLPoOhJ0X0ZEUEViw+8Lb9IZsAsJv3pHYiIkHR/Cm46kshcG03NJ/PgfwnFq0A=
X-Gm-Gg: ASbGncvICG5O0xi+YEHyOvEuYLyECC1GLwwGZranFzkUItP9UA/Bn6p1spliTmpaezF
	tUFwxBwfMfGQNZ4QvdTMjofcGbw6pyvP7aUQuJPzrZGnWPRvHKVohrTZy2hhecqSdg4qekdmue2
	flqs1axKi2+/MxnjT2W3nMhFqLBFvJnHg0j2xWB14Gv7m1w4k7y88hZ7/FiGidXlbCETpfsV2nk
	k/vjzWq5wCRvcQnGKlVPUgS327oTe9wQ98s50i9IArh2shh0E8NE0Y6ynLuYE4o6W9LEARaNdm5
	sDewK6avHaC+3n1FGUJpnUFkKej35WxOyInIgbjRleJNGL9xKG3ZBC0A4CL2kZ36mpSApZlPDvj
	KTbjxi7ZNbuh0seEPpDw9MH7rZ0mAUZanYSvtVoUttu8lHvhq2AuDUQ9aTi/YuQTn0/o=
X-Google-Smtp-Source: AGHT+IGDDYAVEuEcz5HcqD8TrcKxJLGr6peVfb4k1NfRJDuuSCJYGc+m2OsVM8UyRfYFXMraiP9R8w==
X-Received: by 2002:a17:907:7283:b0:abf:6bda:e799 with SMTP id a640c23a62f3a-abf6bdae919mr496785766b.13.1740997035287;
        Mon, 03 Mar 2025 02:17:15 -0800 (PST)
Message-ID: <d807d308-4802-469c-b2e1-a16951b355fc@suse.com>
Date: Mon, 3 Mar 2025 11:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xl: fix channel configuration setting
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20250225073033.20972-1-jgross@suse.com> <Z785WyG39EGCRM1y@l14>
 <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com> <Z8HzmC4evOxa6yPs@l14>
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
In-Reply-To: <Z8HzmC4evOxa6yPs@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------anriLwMwn29hV4TmwJ1odSCa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------anriLwMwn29hV4TmwJ1odSCa
Content-Type: multipart/mixed; boundary="------------xSM10P8wpbDuHRe7rKpWMuE2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <d807d308-4802-469c-b2e1-a16951b355fc@suse.com>
Subject: Re: [PATCH v2] tools/xl: fix channel configuration setting
References: <20250225073033.20972-1-jgross@suse.com> <Z785WyG39EGCRM1y@l14>
 <e49861d8-2f8f-4747-8d26-59b6defce7c1@suse.com> <Z8HzmC4evOxa6yPs@l14>
In-Reply-To: <Z8HzmC4evOxa6yPs@l14>

--------------xSM10P8wpbDuHRe7rKpWMuE2
Content-Type: multipart/mixed; boundary="------------f1YkY7gcfxM0MWTKM8CFbgFG"

--------------f1YkY7gcfxM0MWTKM8CFbgFG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDIuMjUgMTg6MzQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIEZl
YiAyNywgMjAyNSBhdCAwNDoxMDoyNVBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
Pj4gT24gMjYuMDIuMjUgMTY6NTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFR1
ZSwgRmViIDI1LCAyMDI1IGF0IDA4OjMwOjMzQU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IENoYW5uZWxzIHdvcmsgZGlmZmVyZW50bHkgdGhhbiBvdGhlciBkZXZpY2Ug
dHlwZXM6IHRoZWlyIGRldmlkIHNob3VsZA0KPj4+PiBiZSAtMSBpbml0aWFsbHkgaW4gb3Jk
ZXIgdG8gZGlzdGluZ3Vpc2ggdGhlbSBmcm9tIHRoZSBwcmltYXJ5IGNvbnNvbGUNCj4+Pj4g
d2hpY2ggaGFzIHRoZSBkZXZpZCBvZiAwLg0KPj4+Pg0KPj4+PiBTbyB3aGVuIHBhcnNpbmcg
dGhlIGNoYW5uZWwgY29uZmlndXJhdGlvbiwgdXNlDQo+Pj4+IEFSUkFZX0VYVEVORF9JTklU
X05PREVWSUQoKSBpbiBvcmRlciB0byBhdm9pZCBvdmVyd3JpdGluZyB0aGUgZGV2aWQNCj4+
Pj4gc2V0IGJ5IGxpYnhsX2RldmljZV9jaGFubmVsX2luaXQoKS4NCj4+Pj4NCj4+Pj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+DQo+Pj4g
VGhpcyBtaWdodCB3YW50IGE6DQo+Pj4gICAgICAgRml4ZXM6IDNhNjY3OTYzNDc2NiAoImxp
YnhsOiBzZXQgY2hhbm5lbCBkZXZpZCB3aGVuIG5vdCBwcm92aWRlZCBieSBhcHBsaWNhdGlv
biIpDQo+Pj4NCj4+PiBCZWZvcmUgdGhhdCwgdGhlIGRldmlkIHNldCBieSBgeGxgIHdhcyBw
cm9iYWJseSBpZ25vcmVkLiBJIHRoaW5rIGJlZm9yZSwNCj4+PiB0aGUgY29uc29sZSBkZXZp
ZCB3b3VsZCBiZSB0YWtlbiBmcm9tIGxpYnhsX19pbml0X2NvbnNvbGVfZnJvbV9jaGFubmVs
KCkNCj4+PiBwYXJhbWV0dGVycywgc28gdGhlIGZpcnN0IGRldm51bSB3b3VsZCBiZSBgMCsx
YCwgc28gbmV2ZXIgMC4NCj4+Pg0KPj4+IERvIHlvdSBhZ3JlZT8NCj4+DQo+PiBJJ20gbm90
IHN1cmUgSSBkby4gVGhlIHVzZSBvZiBBUlJBWV9FWFRFTkRfSU5JVCgpIGluIHhsX3BhcnNl
LmMgcHJlZGF0ZXMNCj4+IGNvbW1pdCAzYTY2Nzk2MzQ3NjYsIHNvIHRoZXJlIGlzIGNlcnRh
aW5seSBtb3JlIHRoYW4gb25lIHBvdGVudGlhbCBGaXhlczoNCj4+IGNhbmRpZGF0ZS4NCj4g
DQo+IE9mIGNvdXJzZSwgdGhpcyB3YXMgbXkgZmlyc3QgY2FuZGlkYXRlIGFzIHdlbGwsIGJ1
dCB0aGF0J3MgcGFydCBvZiB0aGUNCj4gb3JpZ2luYWwgaW50cm9kdWN0aW9uIG9mIGNoYW5u
ZWwgdG8gdGhlIHNvdXJjZSBjb2RlLCBzbyBpdCBkaWRuJ3QgcmVhbGx5DQo+IG1ha2Ugc2Vu
c2UgdG8gdGhhdCB0aGUgZmVhdHVyZSB3YXMgY29tbWl0ZWQgd2l0aCBkZXZpZD0wLCBzdXJl
bHkgaXQNCj4gd291bGQgYWxyZWFkeSBiZWVuIGFuIGlzc3VlIGF0IHRoZSB0aW1lLiBUaGlz
IGlzIHdoeSBJIHN0YXJ0IGxvb2tpbmcNCj4gaW4gbGlieGwgb24gaG93IGRldmlkIHdhcyB1
c2VkLg0KPiANCj4+IFNvIGF0IGxlYXN0IGZvciB0aGUgeGwgY2FzZSBjb21taXQgM2E2Njc5
NjM0NzY2IGlzbid0IHJlbGV2YW50LCBhbmQgbXkgcGF0Y2gNCj4+IGlzIGZpeGluZyB0aGUg
eGwgY2FzZSBvbmx5Lg0KPiANCj4gTGFzdCB0aW1lIEkgY2hlY2ssIGB4bGAgaXMgdXNpbmcg
bGlieGwsIHNvIGFueSBjaGFuZ2UgdG8gbGlieGwgY2FuDQo+IGltcGFjdCB4bC4NCg0KT2Yg
Y291cnNlLCBidXQgd2l0aCB4bCBkZXZpZCB3YXMgbmV2ZXIgLTEsIHNvIDNhNjY3OTYzNDc2
NiBzaG91bGRuJ3QgbWFrZQ0KYSBkaWZmZXJlbmNlLg0KDQo+IEJlZm9yZSAzYTY2Nzk2MzQ3
NjYsIGNoYW5uZWwjMCB3b3VsZCBiZSBjb25uZWN0ZWQgdG8gY29uc29sZSMxIGJlY2F1c2UN
Cj4gbGlieGxfX2luaXRfY29uc29sZV9mcm9tX2NoYW5uZWwoKSB3YXMgY2FsbGVkIHdpdGgg
ZGV2X251bT1gY2hhbm5lbCMrMWAsDQo+IGFuZCAkZGV2X251bSB3YXMgdXNlZCB0byBzZXQg
Y29uc29sZS5kZXZpZC4NCj4gDQo+IEFmdGVyIDNhNjY3OTYzNDc2Niwgd2UgaGF2ZSBjb25z
b2xlLmRldmlkPWNoYW5uZWwuZGV2aWQ9ZGV2X251bSBpZg0KPiBjaGFubmVsLmRldmlkIGlz
IC0xLCBvciBjb25zb2xlLmRldmlkPWNoYW5uZWwuZGV2aWQuDQo+IA0KPiBXaXRob3V0IDNh
NjY3OTYzNDc2NiwgaGF2aW5nIG1vcmUgdGhhbiBvbmUgY2hhbm5lbCB3aXRoIGRldmlkPS0x
IHdvdWxkDQo+IHJlc3VsdCBpbiBmYWlsaW5nIHRvIHN0YXJ0IGR1ZSB0byBoYXZpbmcgbW9y
ZSB0aGFuIG9uZSBjaGFubmVsIHdpdGggdGhlDQo+IHNhbWUgZGV2aWQuDQoNCkRvIHlvdSBo
YXZlIGFueSBwcm92ZSB0aGF0IG1vcmUgdGhhbiBvbmUgY2hhbm5lbCBldmVyIHdvcmtlZD8N
Cg0KPiANCj4gU28gdGhlIG9ubHkgZ29vZCBjYW5kaWRhdGUgaXM6DQo+IEZpeGVzOiAzYTY2
Nzk2MzQ3NjYgKCJsaWJ4bDogc2V0IGNoYW5uZWwgZGV2aWQgd2hlbiBub3QgcHJvdmlkZWQg
YnkgYXBwbGljYXRpb24iKQ0KDQpJbiB0aGUgZW5kIEkgZG9uJ3QgZmVlbCBzdHJvbmcgd2l0
aCB0aGlzLiBJZiB5b3UgcmVhbGx5IHdhbnQsIEkgY2FuIGFkZA0KdGhpcyBGaXhlcyB0YWcu
DQoNCj4gQWxzbywgSSdtIG5vdCBzdXJlIGNoYW5uZWxzIGFyZSBnb2luZyB0byB3b3JrIHBy
b3Blcmx5IGlmIHRoZXJlJ3MgbW9yZQ0KPiB0aGFuIG9uZSBjb25zb2xlLCBsb3RzIG9mIGNv
ZGUgc2VlbXMgdG8gYXNzdW1lDQo+IGNvbnNvbGUuZGV2aWQ9Y2hhbm5lbC5kZXZpZCsxLCBh
bmQgdGhlcmUncyBwcm9iYWJseSBvdGhlciBpc3N1ZXMuDQoNCkkgYmVsaWV2ZSBjaGFubmVs
cyBhcmUgbm90IHRlc3RlZCBhIGxvdC4NCg0KDQpKdWVyZ2VuDQo=
--------------f1YkY7gcfxM0MWTKM8CFbgFG
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------f1YkY7gcfxM0MWTKM8CFbgFG--

--------------xSM10P8wpbDuHRe7rKpWMuE2--

--------------anriLwMwn29hV4TmwJ1odSCa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfFgaoFAwAAAAAACgkQsN6d1ii/Ey90
+Qf9Fu5rSlg/ewSAUAQoL9CZbr/vcZD44w4yIA1M0zsj12PCEjypN3Fss4wnJTpWucSIKAjuU4FI
5jwiqT9c46id2tIpmQDmN/a0bkojsBwzrlJnZtgBHRSzeQ+7SRa5GKDHuXb2W/tWTjUPMtyB5JBP
Zv32xOTYXYup9T4pJCXP2bUXgOBRGqDuuQRDp+0XKQPvalCBoX1MAfm7nWwvZQlswuRk+Rotu3Tr
+328WkIrXA0KejJ/kSXF3setbRSFfO2HYl9wGjC1iSe5BhKfdhb1FmZDZxXYtmwcE2SZX8jfSJ5n
DmeHcc3waZDY+X2eXD3wWMEMqAT1W4b1Wxt4NHymyQ==
=2x4I
-----END PGP SIGNATURE-----

--------------anriLwMwn29hV4TmwJ1odSCa--

