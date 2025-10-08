Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB4BC5635
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139780.1475022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UqY-0000Lp-ES; Wed, 08 Oct 2025 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139780.1475022; Wed, 08 Oct 2025 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UqY-0000KO-BY; Wed, 08 Oct 2025 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1139780;
 Wed, 08 Oct 2025 14:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGyo=4R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v6UqW-0000KI-LN
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:08:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e23fbc4-a450-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:08:46 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso12334605a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:08:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f30e7da1sm78950a12.16.2025.10.08.07.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:08:45 -0700 (PDT)
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
X-Inumbo-ID: 4e23fbc4-a450-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759932526; x=1760537326; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWvWQrKKpot6iE/eadltXDcyyds7YjMhlewuO3No6G0=;
        b=gSadUq7tIHKl6nvtcPPVIRMzc99k5KKcQirXR3o5As/NfKU+RmPQBtcsgDpfL6AXrX
         plTJMbtt0tFXQPEpLXR3GbAewb02FmlymRjC3wCOXwBNiBX4ClzESBPVJsN5btUqas9a
         Nk6/auSbJLzC9g5Ny6Fmen3xFhKcC1JVxAtFfvG5Wp4a2xP8EA8ITfyl/0Ik0sfCbHIm
         Ooq9uGfn3LQGa9/lEGJbPvyte6GGuvQJZEFnw1JC3LsWZ9wnHrg00x4FtGjjSxjSgSZF
         SBDXrNRtkft7QbW18VAjFhIwNYXQxpeIwa8ZI6MYXZYtisWe65jc5jIHdD1LqjMfP6ei
         Qfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932526; x=1760537326;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWvWQrKKpot6iE/eadltXDcyyds7YjMhlewuO3No6G0=;
        b=Iv1jGYhon5Tw/yd8+fO/n3QWI5v1+nlcLh9txkEap2JEdJk68Cv0CkFSdN1Z/IruZZ
         Pzf1VMG69JEU2Wb83a30h1KwDmmf0y+EKEV2WRNCskuU8cl/iiGe5bJXcewO0wVLD/nJ
         o+iUwchetsNKW6+97XyiiqGdFpRAwjYjx6K1CGiHf9clgjLm8fVQ3Q5+n0LGrCQl5Nt0
         TJYSlZ84S70bpz0EkRFJ0e1usEjij2QeCnpssobn6pHIvyQvaiw7bmqVFtdtt793zvXT
         Y+T6YZSlf6rU4lqLS/vbzD8VnDKPkR2jJHd9VhKBIMuJHsJxWhWQl6IikLBVqf8xy3o9
         M7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeMbJT5abw/+sn0cx8WtQOr4WItXSfhGcuVtuVmuXtELc846XINSwpAuC/Ih8RrnyFC25wlVQ2SUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzzw4WnJE38vnyhYqEIbG8IKwZivYKPVcZ7S0lr2RCVKeRc7w7V
	p984ixDX3cIoqNwjZ3kNba1pk8tea8FTUggOkQrGbH6/Eoed7Vk0aK3lMgg5kASOWxQ=
X-Gm-Gg: ASbGnctoZbVmQ90gEBBJxRZ4pMBg3rJTPir531s/Bz94n4UcSYhgEC3KT433rFNcva3
	T2xI8nXTo9RYQoISLaXyOxxZvs6HA5l9o102JSVwIjKtaiZikahPUG2qwu28Hzp6WWUUBSHiXvF
	kxPFJSj5jBEav8+LhU3LToRk7j1Nd5hMfnCJyO4VBzX4bu4pMQZNQilaiamOCSwWbQdGfqEAUGg
	+0xSDNgg3ffbVEozgBXK0Zwc9TNtGNlvQUw+uqWOhbkd/81GF7QfK8OId/KH2LDbDTZuZn8lLFZ
	N/2fQTuNDKREAyCEBr7c/dHX1+f9HC3pEWNhiJfnib8I73frg2q4TKG2TmH95CqgQzyFRKHIzvy
	hC4FLXl6tX4SjX3yPBFiXE0npLoGyUTNZVnXzLLWdFoDf98jCdKJCElozhezY4cmaLHJnl35S2N
	QA5Y8jHz2IJJyxayWpz0JSHC51djHio4079GwJoh9I2eXgHhOjYHnxAW0Dqp0pphn8Pt5NRMB7n
	70ZgqUg5O7TfWeJEw==
X-Google-Smtp-Source: AGHT+IFKog8nipetC1GsWGIhYWOnNvJm+COO5pokpV3/+8w04/m1O2pfpH3LKvMbD09YIMl51U3mrQ==
X-Received: by 2002:aa7:c9d4:0:b0:637:e94a:fb56 with SMTP id 4fb4d7f45d1cf-639d5c71065mr2593188a12.35.1759932525291;
        Wed, 08 Oct 2025 07:08:45 -0700 (PDT)
Message-ID: <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
Date: Wed, 8 Oct 2025 16:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux xenfs vs privcmd
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
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
In-Reply-To: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cCIFxDNkTn0ZfvhK7G2s1wP2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cCIFxDNkTn0ZfvhK7G2s1wP2
Content-Type: multipart/mixed; boundary="------------8L07pcQX91xV3PB039xycZ3W";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <af7a1b15-ddfb-4dd9-8a5a-31e5dd2d2952@suse.com>
Subject: Re: Linux xenfs vs privcmd
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
In-Reply-To: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>

--------------8L07pcQX91xV3PB039xycZ3W
Content-Type: multipart/mixed; boundary="------------SfMm9xmWOwlj07uTyIot8eAJ"

--------------SfMm9xmWOwlj07uTyIot8eAJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTAuMjUgMTU6MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IEhlbGxvLA0KPiAN
Cj4gSSdtIGRvaW5nIGEgZGVwbG95bWVudCBvZiBYZW4gb24gYSByZW1vdGUgc3lzdGVtIHBy
b3Zpc2lvbmVkIHdpdGggVWJ1bnR1DQo+IDI0LjA0LCBhbmQgSSd2ZSBmb3VuZCB3aGF0IEkn
bSBwcmV0dHkgc3VyZSBpcyBhIGJ1Zy4NCj4gDQo+IEluIGRvbTAsIHRvIHN0YXJ0IHdpdGg6
DQo+IA0KPiB1c2VyQGhvc3Q6fiQgbHMgLWxhIC9kZXYveGVuLw0KPiB0b3RhbCAwDQo+IGRy
d3hyLXhyLXjCoCAyIHJvb3Qgcm9vdMKgwqDCoMKgIDE0MCBPY3TCoCA4IDIwOjA0IC4NCj4g
ZHJ3eHIteHIteCAxOCByb290IHJvb3TCoMKgwqAgNDYyMCBPY3TCoCA4IDIwOjA0IC4uDQo+
IGNydy0tLS0tLS3CoCAxIHJvb3Qgcm9vdCAxMCwgMTIwIE9jdMKgIDggMjA6MDQgZXZ0Y2hu
DQo+IGNydy0tLS0tLS3CoCAxIHJvb3Qgcm9vdCAxMCwgMTE4IE9jdMKgIDggMjA6MDQgZ250
YWxsb2MNCj4gY3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMTkgT2N0wqAgOCAyMDow
NCBnbnRkZXYNCj4gY3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMjQgT2N0wqAgOCAy
MDowNCB4ZW5idXMNCj4gY3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMjMgT2N0wqAg
OCAyMDowNCB4ZW5idXNfYmFja2VuZA0KPiB1c2VyQGhvc3Q6fiQgbHMgLWxhIC9wcm9jL3hl
bi8NCj4gdG90YWwgMA0KPiBkci14ci14ci14wqDCoCAyIHJvb3Qgcm9vdCAwIE9jdMKgIDgg
MjA6MDQgLg0KPiBkci14ci14ci14IDMyNiByb290IHJvb3QgMCBPY3TCoCA4IDIwOjA0IC4u
DQo+IA0KPiBpLmUuIG5vIC9kZXYveGVuL3ByaXZjbWQuDQo+IA0KPiBJdCB0dXJucyBvdXQg
dGhhdCBtb3VudGluZyB4ZW5mcyBjYXVzZXMgaXQgdG8gYXBwZWFyOg0KPiANCj4gdXNlckBo
b3N0On4kIHN1ZG8gc3lzdGVtY3RsIHN0YXJ0IHByb2MteGVuLm1vdW50DQo+IHVzZXJAaG9z
dDp+JCBscyAtbGEgL2Rldi94ZW4vDQo+IHRvdGFsIDANCj4gZHJ3eHIteHIteMKgIDIgcm9v
dCByb290wqDCoMKgwqAgMTgwIE9jdMKgIDggMjA6MDUgLg0KPiBkcnd4ci14ci14IDE4IHJv
b3Qgcm9vdMKgwqDCoCA0NjIwIE9jdMKgIDggMjA6MDQgLi4NCj4gY3J3LS0tLS0tLcKgIDEg
cm9vdCByb290IDEwLCAxMjAgT2N0wqAgOCAyMDowNCBldnRjaG4NCj4gY3J3LS0tLS0tLcKg
IDEgcm9vdCByb290IDEwLCAxMTggT2N0wqAgOCAyMDowNCBnbnRhbGxvYw0KPiBjcnctLS0t
LS0twqAgMSByb290IHJvb3QgMTAsIDExOSBPY3TCoCA4IDIwOjA0IGdudGRldg0KPiBjcnct
LS0tLS0twqAgMSByb290IHJvb3QgMTAsIDExNSBPY3TCoCA4IDIwOjA1IGh5cGVyY2FsbA0K
PiBjcnctLS0tLS0twqAgMSByb290IHJvb3QgMTAsIDExNiBPY3TCoCA4IDIwOjA1IHByaXZj
bWQNCj4gY3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMjQgT2N0wqAgOCAyMDowNCB4
ZW5idXMNCj4gY3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMjMgT2N0wqAgOCAyMDow
NCB4ZW5idXNfYmFja2VuZA0KPiB1c2VyQGhvc3Q6fiQgbHMgLWxhIC9wcm9jL3hlbi8NCj4g
dG90YWwgMA0KPiBkcnd4ci14ci14wqDCoCAyIHJvb3Qgcm9vdCAwIE9jdMKgIDggMjA6MDUg
Lg0KPiBkci14ci14ci14IDMxNSByb290IHJvb3QgMCBPY3TCoCA4IDIwOjA0IC4uDQo+IC1y
LS1yLS1yLS3CoMKgIDEgcm9vdCByb290IDAgT2N0wqAgOCAyMDowNSBjYXBhYmlsaXRpZXMN
Cj4gLXJ3LS0tLS0tLcKgwqAgMSByb290IHJvb3QgMCBPY3TCoCA4IDIwOjA1IHByaXZjbWQN
Cj4gLXJ3LS0tLS0tLcKgwqAgMSByb290IHJvb3QgMCBPY3TCoCA4IDIwOjA1IHhlbmJ1cw0K
PiAtci0tLS0tLS0twqDCoCAxIHJvb3Qgcm9vdCAwIE9jdMKgIDggMjA6MDUgeGVuc3ltcw0K
PiAtcnctLS0tLS0twqDCoCAxIHJvb3Qgcm9vdCAwIE9jdMKgIDggMjA6MDUgeHNkX2t2YQ0K
PiAtcnctLS0tLS0twqDCoCAxIHJvb3Qgcm9vdCAwIE9jdMKgIDggMjA6MDUgeHNkX3BvcnQN
Cj4gDQo+IEZvciBnb29kIG1lYXN1cmUsIEkgY2hlY2tlZCB1bm1vdW50aW5nIHhlbmZzOg0K
PiANCj4gdXNlckBob3N0On4kIHN1ZG8gdW1vdW50IC9wcm9jL3hlbg0KPiB1c2VyQGhvc3Q6
fiQgbHMgLWxhIC9kZXYveGVuLw0KPiB0b3RhbCAwDQo+IGRyd3hyLXhyLXjCoCAyIHJvb3Qg
cm9vdMKgwqDCoMKgIDE4MCBPY3TCoCA4IDIwOjA1IC4NCj4gZHJ3eHIteHIteCAxOCByb290
IHJvb3TCoMKgwqAgNDYyMCBPY3TCoCA4IDIwOjA0IC4uDQo+IGNydy0tLS0tLS3CoCAxIHJv
b3Qgcm9vdCAxMCwgMTIwIE9jdMKgIDggMjA6MDQgZXZ0Y2huDQo+IGNydy0tLS0tLS3CoCAx
IHJvb3Qgcm9vdCAxMCwgMTE4IE9jdMKgIDggMjA6MDQgZ250YWxsb2MNCj4gY3J3LS0tLS0t
LcKgIDEgcm9vdCByb290IDEwLCAxMTkgT2N0wqAgOCAyMDowNCBnbnRkZXYNCj4gY3J3LS0t
LS0tLcKgIDEgcm9vdCByb290IDEwLCAxMTUgT2N0wqAgOCAyMDowNSBoeXBlcmNhbGwNCj4g
Y3J3LS0tLS0tLcKgIDEgcm9vdCByb290IDEwLCAxMTYgT2N0wqAgOCAyMDowNSBwcml2Y21k
DQo+IGNydy0tLS0tLS3CoCAxIHJvb3Qgcm9vdCAxMCwgMTI0IE9jdMKgIDggMjA6MDQgeGVu
YnVzDQo+IGNydy0tLS0tLS3CoCAxIHJvb3Qgcm9vdCAxMCwgMTIzIE9jdMKgIDggMjA6MDQg
eGVuYnVzX2JhY2tlbmQNCj4gdXNlckBob3N0On4kIGxzIC1sYSAvcHJvYy94ZW4vDQo+IHRv
dGFsIDANCj4gZHIteHIteHIteMKgwqAgMiByb290IHJvb3QgMCBPY3TCoCA4IDIwOjA0IC4N
Cj4gZHIteHIteHIteCAyOTEgcm9vdCByb290IDAgT2N0wqAgOCAyMDowNCAuLg0KPiANCj4g
YW5kIC9kZXYveGVuL3ByaXZjbWQgc3RheWVkLg0KPiANCj4gDQo+IEFueXdheSAtIC9kZXYv
eGVuL3ByaXZjbWQgKGFuZCAvaHlwZXJjYWxsKSBzaG91bGRuJ3QgYmUgdGllZCB0byB4ZW5m
cy4NCj4gVGhleSBzaG91bGQgYmUgU0lGX1BSSVZJTEVHRUQgYWxvbmUsIHNob3VsZCB0aGV5
IG5vdD8NCg0KSSBkb24ndCB0aGluayB0aGV5IHNob3VsZCBiZSB0aWVkIHRvIFNJRl9QUklW
SUxFR0VELCBhcyBkZXZpY2UgbW9kZWwgb3BzDQphcmUgaGFuZGxlZCB2aWEgdGhlIHByaXZj
bWQgZHJpdmVyLCB0b28uDQoNClRCSCBJIGhhdmUgbm8gaWRlYSB3aHkgdGhlcmUgaXMgYSBk
aXJlY3QgY29ubmVjdGlvbiB0byB4ZW5mcy4NCg0KRGlkIHlvdSB0cnkgdG8gbW9kcHJvYmUg
cHJpdmNtZCB3aXRob3V0IG1vdW50aW5nIHhlbmZzPyBJIGd1ZXNzIHRoZQ0KY29ubmVjdGlv
biBpcyB0aGF0IHRoZSBjYXBhYmlsaXRpZXMgaW4gL3Byb2MveGVuL2NhcGFiaWxpdGllcyBh
cmUgdGVzdGVkIHRvDQpjb250YWluICJjb250cm9sX2QiLCByZXN1bHRpbmcgaW4gdGhlIHBy
aXZjbWQgZHJpdmVyIHRvIGJlIGxvYWRlZC4NCg0KDQpKdWVyZ2VuDQo=
--------------SfMm9xmWOwlj07uTyIot8eAJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SfMm9xmWOwlj07uTyIot8eAJ--

--------------8L07pcQX91xV3PB039xycZ3W--

--------------cCIFxDNkTn0ZfvhK7G2s1wP2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjmcGwFAwAAAAAACgkQsN6d1ii/Ey80
RQf+O5AHiKH98K1+FFB6rxGQxbB8S18dSMdHBK/i6S95TfPgmgvipbWenOKzF0WQfyoIs3AAw+j+
H4c7NnCZf60IuZBK42kvWWZNu6Svle5JIzX2ORX6QNzOe2wPB6lyYDsjfbmGcw9QjUvs9KUZs4gQ
UUVkHLswFPRkhJy+SF/QqO0A2Tt8mKQNbHUSErxEYyCKB/01axWNWVvvhHPr4ZwNYEcGG1yC8lO/
LQe89YCXf3cHKdsqPYaXeozGoGuyu0I3N2XcG0oKzn2EJ5w/qtLQFVrctWVri3usfdbMmovllSTa
wUkFH1iZfgILWAZYrG139ywoAnjRNUdDSQ+54atZ6g==
=qSGw
-----END PGP SIGNATURE-----

--------------cCIFxDNkTn0ZfvhK7G2s1wP2--

