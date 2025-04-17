Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD0A9193C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 12:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957332.1350474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MPb-00005G-JK; Thu, 17 Apr 2025 10:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957332.1350474; Thu, 17 Apr 2025 10:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5MPb-0008Uh-FU; Thu, 17 Apr 2025 10:24:03 +0000
Received: by outflank-mailman (input) for mailman id 957332;
 Thu, 17 Apr 2025 10:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VG4i=XD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u5MPZ-0008Ua-FY
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 10:24:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1309a0e2-1b76-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 12:23:58 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so113267566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 03:23:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb63a14c5esm54541566b.19.2025.04.17.03.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 03:23:57 -0700 (PDT)
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
X-Inumbo-ID: 1309a0e2-1b76-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744885438; x=1745490238; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VOZVNhVxO35FaeFKJPov8ukkJ2SijtrRjbND3uyzMKU=;
        b=Cj1/M8UwP6ewks2Ubbh3nWjKTxGg/6PJed+CyJpTYkuL+1cx1f5+xGQ3hsZd0SF6yz
         Fd1gDpf5n5GJqp7qEr82O27A4TmmLgh74hgt9mxtEjm+tx2Kf8mdLUpYGyQXwxaCJcKQ
         v5bbgV9e6n6A9WgIGhbTP6GiVq9nHlrz42HFXhZFtYZ4KpUT31YweYA82ix1qwdvsEb9
         CTIAM9t4reWqG/B78irILEah2jdn+C8nvO5LdLzYLJQ8N2UVBt3mWzFE7fcuXH71w56b
         gRRihPJAO0vNmpvhVlIpe0ypeMgLbCquMTQe4nWD8tFQKTJSPNKS8Qj2WnlmCc7wrhen
         o9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885438; x=1745490238;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOZVNhVxO35FaeFKJPov8ukkJ2SijtrRjbND3uyzMKU=;
        b=ckzaQM8igNe/R7GNgUqdc88L1DPuIBm7IfLjTyYdbyz8dQhZP8uUD5Rxoj+LkpxheD
         k2a3DHmekxJFSKhQ/a30lNyi7MJ5oxGZjAIkCBdAA8qu957/zQu3WfSRjrPJKeu8xIeJ
         dPb4eGJHtjWDsbqANCoiTx3Z/PwO6xPl8lxEzh2v1WDKW64YnD3wA7DOKSRyb6AtJxLR
         +hFDppVg7re0/0t9oga+Z1iWGEZEu9XPiI5P0uG1eefFFfVouaiyMl1U7R/yx6utHmgD
         TyBZiZfnZOD6ID/Xllxxq6JpnRyM3xHg6oBmKX23792knR6JmOgW1Hctjf7TvXXfU6eW
         CbPw==
X-Forwarded-Encrypted: i=1; AJvYcCVFHn2F13wgraFXeXgGXhaWZD5yUit3qrbLMq6E4Sh52fQ4iFB0LMb193feiP3VUsNxpV3qj4Vi4jI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVHE2W+firDmFnMC4zWMcF65FRY8PbwhNcGMurEk1s6T3JYDz2
	aFZpryj1ru1GbXp9yNlWIxvyqpyCft5lJSWRSR/z1jipXzu1gEWo+SUUXogvlns=
X-Gm-Gg: ASbGncuSsIiOsYhKaRQHN7Pbdj+TWUOxYAdnseD1RTH4U9Y1HRzJCKq/G2wfSb2Y3st
	0qYaopo4bcNDoqiczhpDri+miDzF+bqCqjiweQlp+KRRa2JO0aPBTWgRzlq5glw2CbDD0bKDmsl
	wDsM8V65mhCBFQx+oeyfyIsSuHJrlPsGt2EZSq5Uwuroec/J7HUgri4zq6yQ7PvNsTrPXcXwkgV
	XEGXVnAm4Wy7kiKl7ubrkwL+cMk9BlT4ez3VZQJzDcVHBYMQl5+A0z6+UkJX5c+SJvnPafUbNdx
	Yldi625cEssiL4OPQtCZ+ClAvv9CKdIyaDvUbZM8CSjo7qkHj1Xboro9ArLwTYfQfRX9YxSGtVR
	OQphXSBjMY32a2P16JQ5j/BrVJ9BZ9v2koTR8IGRq/LGNzwoQN9EIbRkd3GeZkKcjgw==
X-Google-Smtp-Source: AGHT+IHDrJBjqNzW7VtwUP9YzLXLrQlOBiInCLaKw8WycCQs6BYkHJtdLj1AvTYDg9nF69SHomHayg==
X-Received: by 2002:a17:907:3cc6:b0:ac7:ec90:2ae5 with SMTP id a640c23a62f3a-acb42997607mr533236066b.25.1744885438055;
        Thu, 17 Apr 2025 03:23:58 -0700 (PDT)
Message-ID: <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
Date: Thu, 17 Apr 2025 12:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
 <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
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
In-Reply-To: <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------80XappD84HqnFoIoZ4BtBZ6n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------80XappD84HqnFoIoZ4BtBZ6n
Content-Type: multipart/mixed; boundary="------------nhTMLOtnttMTIlWDi7qUzJUH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Message-ID: <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
 <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
In-Reply-To: <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>

--------------nhTMLOtnttMTIlWDi7qUzJUH
Content-Type: multipart/mixed; boundary="------------0Ea0kxqx80BDEhzLETg0vGo6"

--------------0Ea0kxqx80BDEhzLETg0vGo6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDQuMjUgMTI6MDYsIEFsZXhleSB3cm90ZToNCj4gDQo+IE9uIDE3LjA0LjIwMjUg
MTE6NTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAxNy4wNC4yNSAxMDo0NSwgQWxl
eGV5IHdyb3RlOg0KPj4+DQo+Pj4gT24gMTcuMDQuMjAyNSAxMDoxMiwgSsO8cmdlbiBHcm/D
nyB3cm90ZToNCj4+Pj4gT24gMTcuMDQuMjUgMDk6MDAsIEFsZXhleSB3cm90ZToNCj4+Pj4+
DQo+Pj4+PiBPbiAxNy4wNC4yMDI1IDAzOjU4LCBKYWt1YiBLaWNpbnNraSB3cm90ZToNCj4+
Pj4+PiBPbiBNb24sIDE0IEFwciAyMDI1IDE4OjM0OjAxICswMDAwIEFsZXhleSBOZXBvbW55
YXNoaWggd3JvdGU6DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnZXRfcGFnZShwZGF0
YSk7DQo+Pj4+Pj4gUGxlYXNlIG5vdGljZSB0aGlzIGdldF9wYWdlKCkgaGVyZS4NCj4+Pj4+
Pg0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZf
dG9fZnJhbWUoeGRwKTsNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseSgh
eGRwZikpIHsNCj4+Pj4+Pj4gKyB0cmFjZV94ZHBfZXhjZXB0aW9uKHF1ZXVlLT5pbmZvLT5u
ZXRkZXYsIHByb2csIGFjdCk7DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOw0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4gRG8geW91IG1lYW4gdGhh
dCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gbW92ZSB0aGUgZ2V0X3BhZ2UocGRhdGEpIGNhbGwg
bG93ZXIsDQo+Pj4+PiBhZnRlciBjaGVja2luZyBmb3IgTlVMTCBpbiB4ZHBmLCBzbyB0aGF0
IHRoZSByZWZlcmVuY2UgY291bnQgaXMgb25seSBpbmNyZWFzZWQNCj4+Pj4+IGFmdGVyIGEg
c3VjY2Vzc2Z1bCBjb252ZXJzaW9uPw0KPj4+Pg0KPj4+PiBJIHRoaW5rIHRoZSBlcnJvciBo
YW5kbGluZyBoZXJlIGlzIGdlbmVyYWxseSBicm9rZW4gKG9yIGF0IGxlYXN0IHZlcnkNCj4+
Pj4gcXVlc3Rpb25hYmxlKS4NCj4+Pj4NCj4+Pj4gSSBzdXNwZWN0IHRoYXQgaW4gY2FzZSBv
ZiBhdCBsZWFzdCBzb21lIGVycm9ycyB0aGUgZ2V0X3BhZ2UoKSBpcyBsZWFraW5nDQo+Pj4+
IGV2ZW4gd2l0aG91dCB0aGlzIG5ldyBwYXRjaC4NCj4+Pj4NCj4+Pj4gSW4gY2FzZSBJJ20g
d3JvbmcgYSBjb21tZW50IHJlYXNvbmluZyB3aHkgdGhlcmUgaXMgbm8gbGVhayBzaG91bGQg
YmUNCj4+Pj4gYWRkZWQuDQo+Pj4+DQo+Pj4+DQo+Pj4+IEp1ZXJnZW4NCj4+Pg0KPj4+IEkg
dGhpbmsgcGRhdGEgaXMgZnJlZWQgaW4geGRwX3JldHVybl9mcmFtZV9yeF9uYXBpKCkgLT4g
X194ZHBfcmV0dXJuKCkNCj4+DQo+PiBBZ3JlZWQuIEJ1dCB3aGF0IGlmIHhlbm5ldF94ZHBf
eG1pdCgpIHJldHVybnMgYW4gZXJyb3IgPCAwPw0KPj4NCj4+IEluIHRoaXMgY2FzZSB4ZHBf
cmV0dXJuX2ZyYW1lX3J4X25hcGkoKSB3b24ndCBiZSBjYWxsZWQuDQo+Pg0KPj4NCj4+IEp1
ZXJnZW4NCj4gDQo+IEFncmVlZC4gVGhlcmUgaXMgbm8gZXhwbGljaXQgZnJlZWQgcGRhdGEg
aW4gdGhlIGNhbGxpbmcgZnVuY3Rpb24NCj4geGVubmV0X2dldF9yZXNwb25zZXMoKS4gV2l0
aG91dCB0aGlzLCB0aGUgcGFnZSByZWZlcmVuY2VkIGJ5IHBkYXRhDQo+IGNvdWxkIGJlIGxl
YWtlZC4NCj4gDQo+IEkgc3VnZ2VzdDoNCiA+DQogPiAgCWNhc2UgWERQX1RYOg0KID4gLQkJ
Z2V0X3BhZ2UocGRhdGEpOw0KID4gIAkJeGRwZiA9IHhkcF9jb252ZXJ0X2J1ZmZfdG9fZnJh
bWUoeGRwKTsNCiA+ICsJCWlmICh1bmxpa2VseSgheGRwZikpIHsNCiA+ICsJCQl0cmFjZV94
ZHBfZXhjZXB0aW9uKHF1ZXVlLT5pbmZvLT5uZXRkZXYsIHByb2csIGFjdCk7DQogPiArCQkJ
YnJlYWs7DQogPiArCQl9DQogPiArCQlnZXRfcGFnZShwZGF0YSk7DQogPiAgCQllcnIgPSB4
ZW5uZXRfeGRwX3htaXQocXVldWUtPmluZm8tPm5ldGRldiwgMSwgJnhkcGYsIDApOw0KID4g
IAkJaWYgKHVubGlrZWx5KCFlcnIpKQ0KID4gIAkJCXhkcF9yZXR1cm5fZnJhbWVfcnhfbmFw
aSh4ZHBmKTsNCiA+IC0JCWVsc2UgaWYgKHVubGlrZWx5KGVyciA8IDApKQ0KID4gKwkJZWxz
ZSBpZiAodW5saWtlbHkoZXJyIDwgMCkpIHsNCiA+ICAJCQl0cmFjZV94ZHBfZXhjZXB0aW9u
KHF1ZXVlLT5pbmZvLT5uZXRkZXYsIHByb2csIGFjdCk7DQogPiArCQkJeGRwX3JldHVybl9m
cmFtZV9yeF9uYXBpKHhkcGYpOw0KID4gKwkJfQ0KDQpDb3VsZCB5b3UgcGxlYXNlIG1lcmdl
IHRoZSB0d28gaWYgKCkgYmxvY2tzLCBhcyB0aGV5IHNoYXJlIHRoZQ0KY2FsbCBvZiB4ZHBf
cmV0dXJuX2ZyYW1lX3J4X25hcGkoKSBub3c/IFNvbWV0aGluZyBsaWtlOg0KDQppZiAodW5s
aWtlbHkoZXJyIDw9IDApKSB7DQoJaWYgKGVyciA8IDApDQoJCXRyYWNlX3hkcF9leGNlcHRp
b24ocXVldWUtPmluZm8tPm5ldGRldiwgcHJvZywgYWN0KTsNCgl4ZHBfcmV0dXJuX2ZyYW1l
X3J4X25hcGkoeGRwZik7DQp9DQoNCiA+ICAJCWJyZWFrOw0KID4gIAljYXNlIFhEUF9SRURJ
UkVDVDoNCiA+ICAJCWdldF9wYWdlKHBkYXRhKTsNCiA+ICAJCWVyciA9IHhkcF9kb19yZWRp
cmVjdChxdWV1ZS0+aW5mby0+bmV0ZGV2LCB4ZHAsIHByb2cpOw0KID4gIAkJKm5lZWRfeGRw
X2ZsdXNoID0gdHJ1ZTsNCiA+IC0JCWlmICh1bmxpa2VseShlcnIpKQ0KID4gKwkJaWYgKHVu
bGlrZWx5KGVycikpIHsNCiA+ICAJCQl0cmFjZV94ZHBfZXhjZXB0aW9uKHF1ZXVlLT5pbmZv
LT5uZXRkZXYsIHByb2csIGFjdCk7DQogPiArCQkJX194ZHBfcmV0dXJuKHBhZ2VfYWRkcmVz
cyhwZGF0YSksICZ4ZHAtPm1lbSwgdHJ1ZSwgeGRwKTsNCiA+ICsJCX0NCiA+ICAJCWJyZWFr
Ow0KDQoNCkp1ZXJnZW4NCg0KUC5TLjogcGxlYXNlIGRvbid0IHVzZSBIVE1MIGluIGVtYWls
cw0K
--------------0Ea0kxqx80BDEhzLETg0vGo6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0Ea0kxqx80BDEhzLETg0vGo6--

--------------nhTMLOtnttMTIlWDi7qUzJUH--

--------------80XappD84HqnFoIoZ4BtBZ6n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgA1r0FAwAAAAAACgkQsN6d1ii/Ey/B
Vwf+MIfL/B2+Fhj0Xj7nAVp/jeMZJYVCEW5yyzCeQPzfYoKDh5FlfWL03hHnsekhx3lz6R83h8P3
sIKR8juToker8YgsFZvQQaXpKCNBOzThTBCcQuDxVr2chNTS7ojljGFMDu6ENLkhOb8NqiZWO6KE
mS1PXQ3UQwYl+5mYwMaowZwAXEXBvbwvAccQC30XZ8PbKWk0AoRc1YlI/U7tFpQwxVtW0is5ewJ/
UFoHnwgbFhWQ+4S+LcvURFjBTnNdQEpq/ahhvQNhgyJ9Drzddej0yTpROQWiv4tgkxoRTA3/fkVR
E+OuYFP0aMLsSSJfzixGbBvvDO+8EvYvmTtZc0DdWA==
=5kvB
-----END PGP SIGNATURE-----

--------------80XappD84HqnFoIoZ4BtBZ6n--

