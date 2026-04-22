Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKRNCOpj6GmpJwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:00:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D6442376
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 08:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289868.1569556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFQcB-00035Y-Sp; Wed, 22 Apr 2026 05:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289868.1569556; Wed, 22 Apr 2026 05:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFQcB-00033R-PQ; Wed, 22 Apr 2026 05:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1289868;
 Wed, 22 Apr 2026 05:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFQcA-00033L-Rx
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 05:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFQc9-005idb-Mk
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 07:59:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e863a9-e002-0a2a0a5209dd-0a2a450a9eee-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:59:09 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e863ad-56b3-0a2a450a0019-d155d031ed7c-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:59:09 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-676a89de629so2452053a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 22:59:09 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c47fe951sm3132510a12.2.2026.04.21.22.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 22:59:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776837549; x=1777442349; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=byadPzDiTVwNwk0JL15svsodJIrHmC5dTiHH9bIA6LY=;
        b=ETkqtBvYTiS3oeCoIzV+OyVvydbaGFj49GoEy8a03dluAtyZzpjPz5GMbf93vJO655
         Nc+OJjhRiXqqQfHdhsXC0KIliH7OywVM1gvVTStpgxnkLUnQMkkDk/ik6O+36hihaaF2
         yVohZpJEkvG3SHNfZ2/OxPuPu0YgEenFUSqXcUbnAEkPr5oE+iW/rgs4xmCmcisvTieC
         M1XTDAJRergBgRlyL/A6GVsNWHA5wIQIzog0KVAP4gpMNDAjQZREQnFtc474rZWivyZE
         5bYpWH8y+l0NwYtdPynKq8q733W69BHkIBQnRR2frZh3v1YELeEI45ZFzje0DIIE9tEn
         3ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837549; x=1777442349;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byadPzDiTVwNwk0JL15svsodJIrHmC5dTiHH9bIA6LY=;
        b=QgCLlfJcF3LemfTYfcd4K2/GEWspbFsdF/LZdpryVt8b+FHlQBpotuP3GGnigd7Q3h
         Ka5828l4dCCXPaLwrTiK4YNhwlqu6VqiKHXGXDadK6fTD+CNMOAscgqLHCJTNELt12ci
         cLHjFGodExskOp6xKTHBK6SzT8m5Qv6ImE7kr0LAjj9H80rogWM3DwGTY4TOUD7y43vn
         8GvqC5HCQ4HV1JehTX5FeuBbkzAHszZ2mLSjfJ4SPMI5bbUAp4TDSP6EQq/RkPxJBSvk
         5GdvpvYZwk5rU8t+wy3Kf965Ncr67FLjYM4ArSG95jhvaQoeujCSskddt8n34w1fwatu
         3zPw==
X-Forwarded-Encrypted: i=1; AFNElJ+vPVXAmP+FnfumxWa3WpuuuKD0mnXPVk4KspbnOVxht5I5p+3hox5BuGCJfRev+MsCjT0OXayajhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzduyB8RdIv5/GzXZ1GVJvv15g72H28Nj/K+sXaYlHE4MxMPbtz
	oFAUu5cQ8RKDCzjifaDT9oycJUs4F/ZpVwM75bwclgv+k0KczRIJEDILok4V47jxh9s=
X-Gm-Gg: AeBDiesFV00tB5KUyRlbj6VZ9adWgG9LWYtu6u21aoxVP0v6J7HICNB2dsFoJM5WVON
	EjlOPka+n3vtiobRWMTiBDMHuSPKwjPl8FuPsmApB+lLyP0urJ4rQrB5SdqszSXy2P54BOWHEDy
	Y9UrxBv7sVHUcM5M0OlPPxaM8azZH/8Biqed0ogbTLfK+49XUpQZ+JMzivV/DGHAA/tjub24+IC
	wNmc/Gb5ZlavM12m2Q8eSLAUAt6f1DqCEJLcv69Q+QeVay7PGp0QNXtx7G6LmOEzv4ehV3UriZu
	KKH5M7wML1rRTOgMuSUXN8O8lEOad8jShvh8jc/pPgOuxw7nONmUP4y/MNVI3+cj9APFw8OmoOB
	rRs1XGf9Gx6EAA6LISV78yui9/CD+H3YzuXOEZjxsEhC5KwDg9jtt62CcHE+1pR1zBkcRN6iX6f
	EABUBm0Ea7083ZV83CetM1XUnTa+LePdhg+i2L313bduF+067ZJLW+elzSN9yPRd01to9HIC/K7
	liWkf64wOKDc3WxjLFMnjY7StE1ZY4+rhQ8I+F/qYkYEiemY1uvVlh+VUxCIiVPIJdQL+KOuDA=
X-Received: by 2002:aa7:cd4d:0:b0:672:a242:5887 with SMTP id 4fb4d7f45d1cf-672bfd9db45mr6152778a12.12.1776837548811;
        Tue, 21 Apr 2026 22:59:08 -0700 (PDT)
Message-ID: <2055c961-4481-4ace-8d3a-c6efe85a5287@suse.com>
Date: Wed, 22 Apr 2026 07:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 interface.h
To: Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260421142701.548978-1-thuth@redhat.com>
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
In-Reply-To: <20260421142701.548978-1-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OkkA89dOG0lxrXJlvxm95Z7S"
X-purgate-ID: tlsNG-4011c0/1776837549-451628B7-4EB696B0/0/0
X-purgate-type: clean
X-purgate-size: 6783
X-Spamd-Result: default: False [-1.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:thuth@redhat.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 789D6442376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OkkA89dOG0lxrXJlvxm95Z7S
Content-Type: multipart/mixed; boundary="------------1qrFfpBNqRcR0U7Me0mi1dEE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <2055c961-4481-4ace-8d3a-c6efe85a5287@suse.com>
Subject: Re: [PATCH] xen/arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 interface.h
References: <20260421142701.548978-1-thuth@redhat.com>
In-Reply-To: <20260421142701.548978-1-thuth@redhat.com>

--------------1qrFfpBNqRcR0U7Me0mi1dEE
Content-Type: multipart/mixed; boundary="------------9jkNseDjvAyRJ0FmLRKYDD0H"

--------------9jkNseDjvAyRJ0FmLRKYDD0H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDQuMjYgMTY6MjcsIFRob21hcyBIdXRoIHdyb3RlOg0KPiBGcm9tOiBUaG9tYXMg
SHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4gDQo+IFdoaWxlIHRoZSBHQ0MgYW5kIENsYW5n
IGNvbXBpbGVycyBhbHJlYWR5IGRlZmluZSBfX0FTU0VNQkxFUl9fDQo+IGF1dG9tYXRpY2Fs
bHkgd2hlbiBjb21waWxpbmcgYXNzZW1ibHkgY29kZSwgX19BU1NFTUJMWV9fIGlzIGENCj4g
bWFjcm8gdGhhdCBvbmx5IGdldHMgZGVmaW5lZCBieSB0aGUgTWFrZWZpbGVzIGluIHRoZSBr
ZXJuZWwuDQo+IFRoaXMgY2FuIGJlIHZlcnkgY29uZnVzaW5nIHdoZW4gc3dpdGNoaW5nIGJl
dHdlZW4gdXNlcnNwYWNlDQo+IGFuZCBrZXJuZWxzcGFjZSBjb2RpbmcsIG9yIHdoZW4gZGVh
bGluZyB3aXRoIHVhcGkgaGVhZGVycyB0aGF0DQo+IHJhdGhlciBzaG91bGQgdXNlIF9fQVNT
RU1CTEVSX18gaW5zdGVhZC4gU28gbGV0J3Mgc3RhbmRhcmRpemUgbm93DQo+IG9uIHRoZSBf
X0FTU0VNQkxFUl9fIG1hY3JvIHRoYXQgaXMgcHJvdmlkZWQgYnkgdGhlIGNvbXBpbGVycy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0K
DQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1
ZXJnZW4NCg==
--------------9jkNseDjvAyRJ0FmLRKYDD0H
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9jkNseDjvAyRJ0FmLRKYDD0H--

--------------1qrFfpBNqRcR0U7Me0mi1dEE--

--------------OkkA89dOG0lxrXJlvxm95Z7S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnoY6wFAwAAAAAACgkQsN6d1ii/Ey8n
qQf+MitV2rWNdbvNQSQ4wPKjcNbdGwXNsoAfHJectv8luvFwmPXanoIvDxFxuKmofGN7AtBhatHk
5kkUZ1wdqPLfUP7NbvQpyxc8VcJNNmSkyzjtQnZtWzTCdl0IVTyoeaVbKDJ0PgA1WrbcCgkz1IAv
gXCF05u/RuFTsWsEHWK2/iueap5UoXrQFFDNUmEbboXQ237X9mTvpSmKfVh9HmuFAf3Wg0oQK1l5
ACba2rbJ4mXhPIwHf3Pyzr1RN6PI/6+/y+M2hNiLbDUBkHWCETmWdnR8exdKnmInhs7LQ7s5IFA+
vhz2TNeWtWeT5U0RLagblX5qicIjNFKnxLDce6DZOA==
=LnQY
-----END PGP SIGNATURE-----

--------------OkkA89dOG0lxrXJlvxm95Z7S--

