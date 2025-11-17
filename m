Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63FC63B7B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 12:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163596.1490679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKx4P-0006Zg-Sc; Mon, 17 Nov 2025 11:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163596.1490679; Mon, 17 Nov 2025 11:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKx4P-0006Wz-PN; Mon, 17 Nov 2025 11:06:53 +0000
Received: by outflank-mailman (input) for mailman id 1163596;
 Mon, 17 Nov 2025 11:06:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKx4O-0006Wt-I8
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 11:06:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838a580a-c3a5-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 12:06:49 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so5735335a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 03:06:49 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497080sm10299644a12.19.2025.11.17.03.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 03:06:48 -0800 (PST)
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
X-Inumbo-ID: 838a580a-c3a5-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763377609; x=1763982409; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KCudMinQGbaMdHfl/9Hc297yVEufZmLtEofEAjVGRKg=;
        b=H4GH7iWHafPdAuMG7Es7FXH39uNF+b/UmYxr1RhMzC6yj7J/ZNPyf4ModzOUfc8vll
         YGrRwCaXHZj2b0HmaYo5dFLp4T+HQfbtsf8LMU9RmiKH/PgaLekQrJ6LY/5KVlyaC1JN
         9HRKHq2NIUZ7hDjmxH7udnCHCAbyTrmm0toB5kwwFjvyrzAzD84tkUjai9Xxc7Yyuw8I
         akvcKobHBDXN6+2ZA8fpl3MgPsUNzZwZMVP5iK7WteXKgoNFiy0vgHzmUimBLVXseW1y
         SuZzxnqAFE6talEgMirmEwtP8ejDcY8fBN6MjDX001QnPLlWNV8p3vj9ZdJwz5O9jWfo
         5Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763377609; x=1763982409;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCudMinQGbaMdHfl/9Hc297yVEufZmLtEofEAjVGRKg=;
        b=e+/Ry3jTNmHeMXWoSkb800bRsisfmokNg/qumN9RIy0r5bu/E1KaCc1bftJQ+eEetC
         ccTLElVgxcmaiIz8PeDPbGsHzuitTcCKtU9mhKRdDbrjCW4iGdLUHUe2H1KhONM78hgW
         vmox/hYAVPj1FOxFLDPF5Ucic1PJ9SltjLzT98zEvmyjlFAU/4v3nasYjW1A49tyuXLc
         Ko7xsSPZsX9D44ZRQIQt2c3ZyS5nJTjpxcRWg5BuFJwXUq3k/thNsgl1wUFMii8XQR8f
         VuJrIi2aOd2B1Gr6xpaHmN3YJVDeCYf9omsN9uLa+dEAmY38M0N+SvIF/S+n9/TvjWpH
         wqqg==
X-Forwarded-Encrypted: i=1; AJvYcCUNkYP36ARYobpoA9wggjYv402zl7nZgPYuxerTrRetORfsi6VmkH/eDLlDJQIf8H59fX8DeR4rv0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEuQpcxjle9UwrjWEyFnZfCH2L3VRctxesZaAUCq1xrSrLMFxa
	oAfdTOv8fP7OnB7L/WYfbU2DSi7ZOHIPNswqBYRjzXc0zHGya8yb+DRMiq1c6XEmqx8=
X-Gm-Gg: ASbGnctCoG3U5wuo28ammzUOM+uUnkp7k93BixrSR9dUnB5q5e2xD9M6VWopavvElwM
	cubVQRxNyiAMkS6qzlzJ7OmXUJ3tAMn/UYJ/IjFc/DTsPkSNFUgKLZ4BIA80YUvdQ+e8c0ludeN
	Yh0EjvL4ZyzzzcCiJbDAotJ4oTQs2DW3ekq23+QKfcCMxj9Z/BB7Bk+lwBaAU0rkh36D49/oJpb
	JF4EhNuJ0twcWkWvqOo81Y2zLI8p2LlWikUbMrdiVMOfxPQnzy6t2JqEESQ1mw39NMxPt7hWgxa
	lkquZJuWKxJ9wNBWGc9i0RK3BFG5ChnX7gb5pr/u43VOBuD70++RiGHgssHrzT9dz4IELBwJt8L
	r4CO78nJppxqNxfYpDvPTCa8CwE8/VNWqtjBx0/j3a9jB4+ibsyeLXakUP0Wp+Ek+oaY+FfLCqs
	zKrclO0vFLhnX6i7I/6ARPQfi+COiTjsRY31JGDcTDbDWb7TCNQZjm/q3YRpHO3P3Brkp8cM07P
	wQ2RSSIVkMVlw3HrgW9SBDCGZsX5O+Vv9Y4l35u5hH+bq3ZDw==
X-Google-Smtp-Source: AGHT+IGEvZvz7HzZL1/y9Sm1Jh6bgNZQjbSq4wZcu7OBRvEIVv3kTaAlFjt59yVPmmh3Vs++ZOzwLg==
X-Received: by 2002:a05:6402:34c1:b0:640:93b2:fd07 with SMTP id 4fb4d7f45d1cf-64350ebfd13mr9489526a12.33.1763377608688;
        Mon, 17 Nov 2025 03:06:48 -0800 (PST)
Message-ID: <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
Date: Mon, 17 Nov 2025 12:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a9NHo0ITaicj2WXnetC3Eo4g"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------a9NHo0ITaicj2WXnetC3Eo4g
Content-Type: multipart/mixed; boundary="------------XI8Zm6ZVB9cpbXnKJZWkKopk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20251102032105.772670-1-marmarek@invisiblethingslab.com>

--------------XI8Zm6ZVB9cpbXnKJZWkKopk
Content-Type: multipart/mixed; boundary="------------MNXBPN2VO8rwB0bMA05xZwCM"

--------------MNXBPN2VO8rwB0bMA05xZwCM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjUgMDQ6MjAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gV2hlbiB0aGUgYmFja2VuZCBkb21haW4gY3Jhc2hlcywgY29vcmRpbmF0ZWQgZGV2aWNl
IGNsZWFudXAgaXMgbm90DQo+IHBvc3NpYmxlIChhcyBpdCBpbnZvbHZlcyB3YWl0aW5nIGZv
ciB0aGUgYmFja2VuZCBzdGF0ZSBjaGFuZ2UpLiBJbiB0aGF0DQo+IGNhc2UsIHRvb2xzdGFj
ayBmb3JjZWZ1bGx5IHJlbW92ZXMgZnJvbnRlbmQgeGVuc3RvcmUgZW50cmllcy4NCj4geGVu
YnVzX2Rldl9jaGFuZ2VkKCkgaGFuZGxlcyB0aGlzIGNhc2UsIGFuZCB0cmlnZ2VycyBkZXZp
Y2UgY2xlYW51cC4NCj4gSXQncyBwb3NzaWJsZSB0aGF0IHRvb2xzdGFjayBtYW5hZ2VzIHRv
IGNvbm5lY3QgbmV3IGRldmljZSBpbiB0aGF0DQo+IHBsYWNlLCBiZWZvcmUgeGVuYnVzX2Rl
dl9jaGFuZ2VkKCkgbm90aWNlcyB0aGUgb2xkIG9uZSBpcyBtaXNzaW5nLiBJZg0KPiB0aGF0
IGhhcHBlbnMsIG5ldyBvbmUgd29uJ3QgYmUgcHJvYmVkIGFuZCB3aWxsIGZvcmV2ZXIgcmVt
YWluIGluDQo+IFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nLg0KPiANCj4gRml4IHRoaXMgYnkg
Y2hlY2tpbmcgYmFja2VuZC1pZCBhbmQgaWYgaXQgY2hhbmdlcywgY29uc2lkZXIgaXQNCj4g
dW5wbHVnK3BsdWcgb3BlcmF0aW9uLiBJdCdzIGltcG9ydGFudCB0aGF0IGNsZWFudXAgb24g
c3VjaCB1bnBsdWcNCj4gZG9lc24ndCBtb2RpZnkgeGVuc3RvcmUgZW50cmllcyAoZXNwZWNp
YWxseSB0aGUgInN0YXRlIiBrZXkpIGFzIGl0DQo+IGJlbG9uZyB0byB0aGUgbmV3IGRldmlj
ZSB0byBiZSBwcm9iZWQgLSBjaGFuZ2luZyBpdCB3b3VsZCBkZXJhaWwNCj4gZXN0YWJsaXNo
aW5nIGNvbm5lY3Rpb24gdG8gdGhlIG5ldyBiYWNrZW5kIChtb3N0IGxpa2VseSwgY2xvc2lu
ZyB0aGUNCj4gZGV2aWNlIGJlZm9yZSBpdCB3YXMgZXZlbiBjb25uZWN0ZWQpLiBIYW5kbGUg
dGhpcyBjYXNlIGJ5IHNldHRpbmcgbmV3DQo+IHhlbmJ1c19kZXZpY2UtPnZhbmlzaGVkIGZs
YWcgdG8gdHJ1ZSwgYW5kIGNoZWNrIGl0IGJlZm9yZSBjaGFuZ2luZyBzdGF0ZQ0KPiBlbnRy
eS4NCj4gDQo+IEFuZCBldmVuIGlmIHhlbmJ1c19kZXZfY2hhbmdlZCgpIGNvcnJlY3RseSBk
ZXRlY3RzIHRoZSBkZXZpY2Ugd2FzDQo+IGZvcmNlZnVsbHkgcmVtb3ZlZCwgdGhlIGNsZWFu
dXAgaGFuZGxpbmcgaXMgc3RpbGwgcmFjeS4gU2luY2UgdGhpcyB3aG9sZQ0KPiBoYW5kbGlu
ZyBkb2Vzbid0IGhhcHBlbmQgaW4gYSBzaW5nbGUgeGVuc3RvcmUgdHJhbnNhY3Rpb24sIGl0
J3MgcG9zc2libGUNCj4gdGhhdCB0b29sc3RhY2sgbWlnaHQgcHV0IGEgbmV3IGRldmljZSB0
aGVyZSBhbHJlYWR5LiBBdm9pZCByZS1jcmVhdGluZw0KPiB0aGUgc3RhdGUga2V5ICh3aGlj
aCBpbiB0aGUgY2FzZSBvZiBsb29zaW5nIHRoZSByYWNlIHdvdWxkIGFjdHVhbGx5DQo+IGNs
b3NlIG5ld2x5IGF0dGFjaGVkIGRldmljZSkuDQo+IA0KPiBUaGUgcHJvYmxlbSBkb2VzIG5v
dCBhcHBseSB0byBmcm9udGVuZCBkb21haW4gY3Jhc2gsIGFzIHRoaXMgY2FzZQ0KPiBpbnZv
bHZlcyBjb29yZGluYXRlZCBjbGVhbnVwLg0KPiANCj4gUHJvYmxlbSBvcmlnaW5hbGx5IHJl
cG9ydGVkIGF0DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9hT1p2aXZ5
WjlZaFZXRExOQG1haWwtaXRsL1QvI3QsDQo+IGluY2x1ZGluZyByZXByb2R1Y3Rpb24gc3Rl
cHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQoNClNvcnJ5IEkgZGlkbid0IGdl
dCBlYXJsaWVyIHRvIHRoaXMuDQoNCk15IG1haW4gcHJvYmxlbSB3aXRoIHRoaXMgcGF0Y2gg
aXMgdGhhdCBpdCBpcyBiYXNpY2FsbHkganVzdCBwYXBlcmluZyBvdmVyDQphIG1vcmUgZ2Vu
ZXJhbCBwcm9ibGVtLg0KDQpZb3UgYXJlIGp1c3QgbWFraW5nIHRoZSBwcm9ibGVtIG11Y2gg
bW9yZSBpbXByb2JhYmxlLCBidXQgbm90IGltcG9zc2libGUgdG8NCm9jY3VyIGFnYWluLiBJ
biBjYXNlIHRoZSBuZXcgZHJpdmVyIGRvbWFpbiBoYXMgdGhlIHNhbWUgZG9taWQgYXMgdGhl
IG9sZCBvbmUNCnlvdSBjYW4gc3RpbGwgaGF2ZSB0aGUgc2FtZSByYWNlLg0KDQpUaGUgY2xl
YW4gd2F5IHRvIGhhbmRsZSB0aGF0IHdvdWxkIGJlIHRvIGFkZCBhIHVuaXF1ZSBJZCBpbiBY
ZW5zdG9yZSB0byBlYWNoDQpkZXZpY2Ugb24gdGhlIGJhY2tlbmQgc2lkZSwgd2hpY2ggY2Fu
IGJlIHRlc3RlZCBvbiB0aGUgZnJvbnRlbmQgc2lkZSB0bw0KbWF0Y2guIEluIGNhc2UgaXQg
ZG9lc24ndCBtYXRjaCwgYW4gb2xkIGRldmljZSB3aXRoIHRoZSBzYW1lIGtpbmQgYW5kIGRl
dmlkDQpjYW4gYmUgY2xlYW5lZCB1cC4NCg0KVGhlIHVuaXF1ZSBJZCB3b3VsZCBvYnZpb3Vz
bHkgbmVlZCB0byBiZSBzZXQgYnkgdGhlIFhlbiB0b29scyBpbnNpZGUgdGhlDQp0cmFuc2Fj
dGlvbiB3cml0aW5nIHRoZSBpbml0aWFsIGJhY2tlbmQgWGVuc3RvcmUgbm9kZXMsIGFzIGRv
aW5nIHRoYXQgZnJvbQ0KdGhlIGJhY2tlbmQgd291bGQgYWRkIGFub3RoZXIgcG90ZW50aWFs
IGFtYmlndWl0eSBieSB0aGUgZHJpdmVyIGRvbWFpbg0KY2hvb3NpbmcgdGhlIHNhbWUgdW5p
cXVlIGlkIGFzIHRoZSBwcmV2aW91cyBvbmUgZGlkLg0KDQpUaGUgcXVlc3Rpb24gaXMgd2hl
dGhlciBzb21ldGhpbmcgbGlrZSB5b3VyIHBhdGNoIHNob3VsZCBiZSB1c2VkIGFzIGENCmZh
bGxiYWNrIGluIGNhc2UgdGhlcmUgaXMgbm8gdW5pcXVlIElkIG9uIHRoZSBiYWNrZW5kIHNp
ZGUgb2YgdGhlIGRldmljZQ0KZHVlIHRvIGEgdG9vIG9sZCBYZW4gdmVyc2lvbi4NCg0KDQpK
dWVyZ2VuDQo=
--------------MNXBPN2VO8rwB0bMA05xZwCM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MNXBPN2VO8rwB0bMA05xZwCM--

--------------XI8Zm6ZVB9cpbXnKJZWkKopk--

--------------a9NHo0ITaicj2WXnetC3Eo4g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbAccFAwAAAAAACgkQsN6d1ii/Ey8Z
Nwf8DxTSACvgaIlaVAtBclW18mjDU/U66VpJ0p1irP56QxxhnxaBiPQUSI7pzh8WIFWAuYL++8fT
Qv5Yh3gFbErjw0ucDxpGC2XU2K6wTQD5/+TaIp3WvUw8jDrlz202dR6YZBDjwBKRXLEhXycyd0Gv
MmtEX+DRyyOaQpMPu7GSmt25wPqlIQ+j3yhJXKtuahsZBPhIsWgsOvhwuskXGZx0i46j3f8jazPg
ZxmmjZZ1jzewsZhA7zqSjx2cnhwPdq9T09OluXZGjFwY0oD7VeYIh0cLXIf+7mH4oik/UKrVyiL1
kMMUA/lUxdFO4642z+ZtTEg70T/fUteDy93ENp6VRQ==
=J1il
-----END PGP SIGNATURE-----

--------------a9NHo0ITaicj2WXnetC3Eo4g--

