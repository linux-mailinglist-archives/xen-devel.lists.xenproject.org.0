Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E66A7B84A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937848.1338721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bcw-0005Hd-3f; Fri, 04 Apr 2025 07:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937848.1338721; Fri, 04 Apr 2025 07:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bcw-0005G6-0k; Fri, 04 Apr 2025 07:38:10 +0000
Received: by outflank-mailman (input) for mailman id 937848;
 Fri, 04 Apr 2025 07:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u0bcv-0005G0-18
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:38:09 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c087a7b3-1127-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 09:38:08 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so286807566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:38:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfe99db7sm211081666b.61.2025.04.04.00.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:38:07 -0700 (PDT)
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
X-Inumbo-ID: c087a7b3-1127-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752287; x=1744357087; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g1tD2V1UcgkdjoyOj1IrFCiJj9530NYTmGmEw2q9pI4=;
        b=ATFo8q4VwHQHaEvgwkHU8PaWd5+TOZ87EVBGAQvwQwC4VFkDCtecCuQcExnoBH+Xj/
         B4YuPa4Rat4ajAiCSfkwa3XRC/G6Pyn3jvfE851kAJg8fONyLq5lF4FYQU7uVsKHxish
         x6bYdwhbczxn2y9+Cyf9yhYN6JssKoSvf8KDo6qKYyxkOA3HSDDwrhnY34IO1CwBVOow
         g98m9+QZshQxh59A+etsH6JGAtRqyX2esHQZCM0d1q1YRjLBKe+H8u601f3krAEz0uh0
         QGfow8K46LkIkTlb69fQaATxK/qR20lfxcJhDDzNFwtOTovyLPyyz+/Pg2Lx0KOW5oys
         lvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752287; x=1744357087;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1tD2V1UcgkdjoyOj1IrFCiJj9530NYTmGmEw2q9pI4=;
        b=bAe984ziwa29V4196zuLhENj/e8T0qF1MFu4MPaMzFD7NYeFfzL1KRKHPt73aQSWZd
         znodGIM0Y6PwODG2Q9s25L9N+ohXZLvl29yjxTLkuox9cimUPE1NGnhhfrRugIZMuN5Q
         b2bdmw81M8DKfcEN5NeyR8QLB6bMyAB0FMWe4ZRe9ZWpp3IG3O4gl7gwpHrc4GTgiLYv
         NUsov4/tw5LcWLBrl511Yhi5yOGknQ6BmSiZppyzdzmZEAapLFpKRTJphV2Hfrcx5YuW
         rjA7I9HSQHKIzg1enIwFe4j8YdeN6N73Vbo1Ep8gFbfwit/3DQ6eVSq5/qm9+wgVnyz+
         yBaw==
X-Forwarded-Encrypted: i=1; AJvYcCUo2998b2GIfSIW+U+rmDyxki85KO+ctJHvxxXkwcEvKwD1dXWB2+XSvmMoESzbuAt4r1SoAeN/C5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv86N/nB2DR2TneDQF5dAHVcy3XbTWJ1S9Q4vHA2MtrTlyJgir
	7h6xInH+hi73WhsuUlOniFPNtsofRMrBbEEGjGqS95WNM+KT1XvZ2XljX21S530YnChLmz3q1O3
	lo5r3vQ==
X-Gm-Gg: ASbGncvZ3x5jWaib6rHPcFR4IevLEsoVp5Cib34Gijz2MxPITxuEoePOHEK8bMwqR8O
	wibOqQsHTeGuqiEP7m1xHO6mIMfC+icRsDa79+YCsqypYylRhp5Rb3FkIsnNUtliegCUBwuwFvJ
	eDQyQbiFASfDGQ/vbfUbcG3w6kcgKUpVbj4jcV6xgHbTD12bsneUf6EOHAtzXBtXn+vFo4V0Rrl
	29ZdM4yuYCZ0DIZIqTEwNpDkGjGirLr2fxRrSBZG7WHQdOnGvWwH1Q1+/BAwG6gbo5xgboqzWst
	XXnR1ckTTEExVvLQspLo8NCkjT9vZXSjhAXSRNmlY5yCu4WcFh8IddZXRR4HYH3EqzEDFqLMTRd
	qd9r1EW3+E2jIr+zvT9Qu7SlgEso41Xi1V+YqGAJe+U1b6fYfh95VfhLzEO5+LGCGKrf6pQ==
X-Google-Smtp-Source: AGHT+IEeONGr/ZZj73AAgTnOoAqNFu0EStlFIgN/itLYt1u5wlTxG0C4UpShKsFULL4sK5EqPT2dWQ==
X-Received: by 2002:a17:907:970b:b0:ac4:3cd:2cb2 with SMTP id a640c23a62f3a-ac7d166a59dmr194699566b.1.1743752287547;
        Fri, 04 Apr 2025 00:38:07 -0700 (PDT)
Message-ID: <9cf8294b-ac0f-4201-bb3d-9ccdaae47a54@suse.com>
Date: Fri, 4 Apr 2025 09:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250403214829.128294-1-stewart.hildebrand@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2tSMUciHeEgoHptR2OCUFIDz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2tSMUciHeEgoHptR2OCUFIDz
Content-Type: multipart/mixed; boundary="------------VSAuHIn21xAJ7TYUbGcooM03";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <9cf8294b-ac0f-4201-bb3d-9ccdaae47a54@suse.com>
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250403214829.128294-1-stewart.hildebrand@amd.com>

--------------VSAuHIn21xAJ7TYUbGcooM03
Content-Type: multipart/mixed; boundary="------------8fZAWV7He5vSJ0wyx9rwhhJC"

--------------8fZAWV7He5vSJ0wyx9rwhhJC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDQuMjUgMjM6NDgsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gVGhlIGZv
bGxvd2luZyBzZXF1ZW5jZSBvZiBldmVudHMgbWF5IGxlYWQgYSBkZWJ1ZyBidWlsZCBvZiBY
ZW4gdG8gY3Jhc2gNCj4gd2hlbiB1c2luZyB0aGUgbnVsbCBzY2hlZHVsZXI6DQo+IA0KPiAx
LiBkb21haW4gY3JlYXRpb24gKGUuZy4gZDEpIGZhaWxlZCBkdWUgdG8gYmFkIGNvbmZpZ3Vy
YXRpb24NCj4gMi4gY29tcGxldGVfZG9tYWluX2Rlc3Ryb3koKSB3YXMgZGVmZXJyZWQNCj4g
My4gZG9tYWluIGNyZWF0aW9uIChlLmcuIGQyKSBzdWNjZWVkcw0KPiANCj4gQXQgdGhpcyBw
b2ludCwgZDIgaXMgcnVubmluZywgd2hpbGUgdGhlIHpvbWJpZSBkMSBpcyBub3QgZnVsbHkg
Y2xlYW5lZA0KPiB1cDoNCj4gDQo+IChYRU4pIE9ubGluZSBDcHVzOiAwLTMNCj4gKFhFTikg
Q3B1cG9vbCAwOg0KPiAoWEVOKSBDcHVzOiAwLTMNCj4gKFhFTikgU2NoZWR1bGluZyBncmFu
dWxhcml0eTogY3B1LCAxIENQVSBwZXIgc2NoZWQtcmVzb3VyY2UNCj4gKFhFTikgU2NoZWR1
bGVyOiBudWxsIFNjaGVkdWxlciAobnVsbCkNCj4gKFhFTikgICBjcHVzX2ZyZWUgPSAzDQo+
IChYRU4pIERvbWFpbiBpbmZvOg0KPiAoWEVOKSAgIERvbWFpbjogMA0KPiAoWEVOKSAgICAg
MTogWzAuMF0gcGNwdT0wDQo+IChYRU4pICAgICAyOiBbMC4xXSBwY3B1PTENCj4gKFhFTikg
ICBEb21haW46IDENCj4gKFhFTikgICAgIDM6IFsxLjBdIHBjcHU9Mg0KPiAoWEVOKSAgIERv
bWFpbjogMg0KPiAoWEVOKSAgICAgNDogWzIuMF0gcGNwdT0yDQo+IA0KPiA0LiBjb21wbGV0
ZV9kb21haW5fZGVzdHJveSgpIGdldHMgY2FsbGVkIGZvciBkMSBhbmQgdHJpZ2dlcnMgdGhl
DQo+IGZvbGxvd2luZzoNCj4gDQo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPiAoWEVOKSAg
ICBbPDAwMDAwYTAwMDAzMjJlZDQ+XSBudWxsLmMjdW5pdF9kZWFzc2lnbisweDJkOC8weGI3
MCAoUEMpDQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDMyNDU3Yz5dIG51bGwuYyNudWxsX3Vu
aXRfcmVtb3ZlKzB4NjcwLzB4YmE4IChMUikNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMzI0
NTdjPl0gbnVsbC5jI251bGxfdW5pdF9yZW1vdmUrMHg2NzAvMHhiYTgNCj4gKFhFTikgICAg
WzwwMDAwMGEwMDAwMzM2NDA0Pl0gc2NoZWRfZGVzdHJveV92Y3B1KzB4MzU0LzB4OGZjDQo+
IChYRU4pICAgIFs8MDAwMDBhMDAwMDIyNzMyND5dIGRvbWFpbi5jI2NvbXBsZXRlX2RvbWFp
bl9kZXN0cm95KzB4MTFjLzB4NDljDQo+IChYRU4pICAgIFs8MDAwMDBhMDAwMDI5ZmJkMD5d
IHJjdXBkYXRlLmMjcmN1X2RvX2JhdGNoKzB4OTQvMHgzZDANCj4gKFhFTikgICAgWzwwMDAw
MGEwMDAwMmExMGMwPl0gcmN1cGRhdGUuYyNfX3JjdV9wcm9jZXNzX2NhbGxiYWNrcysweDE2
MC8weDVmNA0KPiAoWEVOKSAgICBbPDAwMDAwYTAwMDAyYTFlNjA+XSByY3VwZGF0ZS5jI3Jj
dV9wcm9jZXNzX2NhbGxiYWNrcysweGNjLzB4MWIwDQo+IChYRU4pICAgIFs8MDAwMDBhMDAw
MDJhMzQ2MD5dIHNvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHgxZjQvMHgzZDgNCj4gKFhFTikg
ICAgWzwwMDAwMGEwMDAwMmEzN2M0Pl0gZG9fc29mdGlycSsweDE0LzB4MWMNCj4gKFhFTikg
ICAgWzwwMDAwMGEwMDAwNDY1MjYwPl0gdHJhcHMuYyNjaGVja19mb3JfcGNwdV93b3JrKzB4
MzAvMHhiOA0KPiAoWEVOKSAgICBbPDAwMDAwYTAwMDA0NmJiMDg+XSBsZWF2ZV9oeXBlcnZp
c29yX3RvX2d1ZXN0KzB4MjgvMHgxOTgNCj4gKFhFTikgICAgWzwwMDAwMGEwMDAwNDA5Yzg0
Pl0gZW50cnkubyNndWVzdF9zeW5jX3Nsb3dwYXRoKzB4YWMvMHhkOA0KPiAoWEVOKQ0KPiAo
WEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IChYRU4p
IFBhbmljIG9uIENQVSAwOg0KPiAoWEVOKSBBc3NlcnRpb24gJ25wYy0+dW5pdCA9PSB1bml0
JyBmYWlsZWQgYXQgY29tbW9uL3NjaGVkL251bGwuYzozODMNCj4gKFhFTikgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiANCj4gRml4IGJ5IHNraXBwaW5n
IHVuaXRfZGVhc3NpZ24oKSB3aGVuIHRoZSB1bml0IHRvIGJlIHJlbW92ZWQgZG9lcyBub3QN
Cj4gbWF0Y2ggdGhlIHBjcHUncyBjdXJyZW50bHkgYXNzaWduZWQgdW5pdC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGFt
ZC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQoNCg0KSnVlcmdlbg0K
--------------8fZAWV7He5vSJ0wyx9rwhhJC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8fZAWV7He5vSJ0wyx9rwhhJC--

--------------VSAuHIn21xAJ7TYUbGcooM03--

--------------2tSMUciHeEgoHptR2OCUFIDz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfvjF4FAwAAAAAACgkQsN6d1ii/Ey/D
/Qf/Uq2Bfi773mlRcesX+yukLIkNwdWJzTcc+t/lk1HNDPcdaoTraybD5dSbFXd55b1qjOxRNzW4
qRo1V2qjdgu9+vld1RiuecwYWaOr75MqGaZNkQ0Abg/U75DRZI2RsqtXJf7W/wb3xclsDi03xFby
TgEeBNTpzBr0v7RlNhKdDNr524FZo19SOCzJLDPUZozztE7ifnqU96Ekrz54MucMx3Qom/PDYJH/
ZCKccKA8YSheky8ort91XoOQt1pFGtvxOOlMfB4gZtaXBLGg94Og/Lpv7lUmVxnWdHD9p5mY+e+j
MoWLgoUvagWXffZn7GUmX7VySzXqoEsIcY2qOUWkQg==
=VzEw
-----END PGP SIGNATURE-----

--------------2tSMUciHeEgoHptR2OCUFIDz--

