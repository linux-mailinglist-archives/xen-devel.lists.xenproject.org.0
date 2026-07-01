Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BJyVCIDHRGpv0woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:53:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BEF6EAE0F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:53:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=flqrvB9e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349563.1607287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weplA-0004au-Db; Wed, 01 Jul 2026 07:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349563.1607287; Wed, 01 Jul 2026 07:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weplA-0004YV-AW; Wed, 01 Jul 2026 07:53:28 +0000
Received: by outflank-mailman (input) for mailman id 1349563;
 Wed, 01 Jul 2026 07:53:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wepl9-0004YJ-DM
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 07:53:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wepl8-002gAr-CF
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:53:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44c772-5cb7-0a2a0a5109dd-0a2a450c9014-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:53:26 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44c775-f399-0a2a450c0019-d155da2fe813-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:53:26 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c0e124d2a21so48228866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:53:25 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288dbd47asm226809266b.27.2026.07.01.00.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 00:53:25 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782892405; x=1783497205; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ynNEEoise1PwQ5IFgWasop74gCeOXQ28S+d1Y2f3vRs=;
        b=flqrvB9eW1UkOSHrLVMSgYUXjPlHHEPx1HOTRGhYDUtm8achcNL3PHHaCcvdQ0PUcG
         /ihu+R+mGxUXWqFtSnVhzjKt35v66B9oS9rRkPjetEQ9OK0VSw45NrIMbbqZ89shCBc6
         hrhnKoqoyl3kY72CcXV01XmWbXojBIUjfMeCn8LjdQkFYHwH/onYHGQE15MdOO/ahR8b
         MaTjQ9NHLmayihbNkFwk7qKp24dhx0EyCAtAx1bd6fuVVBFvJ5wSNH+6WxcC4+UZSCNK
         UVhdH+E1hqjS760wGCXeSrLPNGcDco2ORAmqhPH6gyt4NhV5D6U5LTxqOPilYbL/F4DZ
         0ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892405; x=1783497205;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynNEEoise1PwQ5IFgWasop74gCeOXQ28S+d1Y2f3vRs=;
        b=lFRaLdqv0DgFDiIPK8r5OnV6224YRFDbkdfG1uVotIS7INl64TO9jTyXn8ezuzms0/
         pclzMkwxVLZl8qTI+P41Ti6tGtCflb1Ocqsod+U6oMh+VgYJj7r2KBwOGoJ/mYxPfD+M
         m1MSFItOZa+fMDw5XzPB0xgsHdnUTCEC3dPDoiGvUj9Waeb8z73jm8Agu/AtYK34FSxW
         xZnlpVMnn3TXVXKNGsfIXoWnbZIGdvkO+KzZbleTHOJprSW0Heghc/dgS9dPNEUBS15B
         B5h4tZ5Jyo/yc86433Xi0y/zWp1LOC1YTxJ7VJtGW2XWldcNzesOAxrR2UmPr3vQ5tLS
         BTdA==
X-Gm-Message-State: AOJu0Yw4GWQYp6tJlukWO9WbM/zEfXT44PC2CeNTLp9fO2J49ku3B3xq
	J7o9hOk0+KRLLgB0QegpELFetX3+//HywQChN3IGFNf50XvD3uZiLXvEXeoNEwiDswg=
X-Gm-Gg: AfdE7cmLyuvoBpBRoRer3w4TYkcwImJQi/3gKsxM9uKcva4YxZ/37O3rwyEnJHCbI+M
	qAGDvhGhuxyicnySEmqupQEGY2H0RnKqER6lsJQrnFuMZo86ZQCPnT5xAj6rWi071igJaE/5Rec
	BTP9Zne2e3kvwg/ZKwDEEuic93KBBR5GKoXg6kx9VLk+qZ2V2T+N2KI0qOqsKoMafbf+IPCj9TI
	B0PDRD0CYurDL/E+J4BfD2W/iigNqfrrMY7+b8h+qe2f6Iv5UkHDJjVSYFzik7Aczq2vEifwL/y
	C6Hh+ALxrCi58C/l4B1nWxTo1XVUsFOgKzVMDr1ja6KcWLE5j3JG1RsIOMNOC2nEOMCrEqX692F
	g70V2NZ+04zxRQdOZbP5J28JYmR3j2YgwD6TgqQH8O7x63pUpkzqOfTmxf3G4dhJub1W8rFVncw
	tGQF8wySV+3pSIBwj19X7vp07S3Qt58HyMZ9rJt/JjWBdlMdNXFx1plvc9VlCCwTq5nHUlE1t1t
	W1WnCo3kLx0OPIFju9xDg/jmFbYLacU2ZmZIcjR5ZM=
X-Received: by 2002:a17:906:ad7:b0:c0b:81d7:51be with SMTP id a640c23a62f3a-c12aa1412cfmr14752266b.43.1782892405413;
        Wed, 01 Jul 2026 00:53:25 -0700 (PDT)
Message-ID: <ea52ef38-8ad2-4b1f-af34-203f167242e5@suse.com>
Date: Wed, 1 Jul 2026 09:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/gntalloc: validate grant count before
 allocation
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-3-alhouseenyousef@gmail.com>
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
In-Reply-To: <20260626223805.43781-3-alhouseenyousef@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c2N6S0bmSZEJJAjkd5fv7yQI"
X-purgate-ID: tlsNG-d25034/1782892406-9273FD51-B383B1D8/0/0
X-purgate-type: clean
X-purgate-size: 6927
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26BEF6EAE0F

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c2N6S0bmSZEJJAjkd5fv7yQI
Content-Type: multipart/mixed; boundary="------------6b8KZc9ZXC5nIjEmhLEUSxPd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <ea52ef38-8ad2-4b1f-af34-203f167242e5@suse.com>
Subject: Re: [PATCH v2 2/2] xen/gntalloc: validate grant count before
 allocation
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-3-alhouseenyousef@gmail.com>
In-Reply-To: <20260626223805.43781-3-alhouseenyousef@gmail.com>

--------------6b8KZc9ZXC5nIjEmhLEUSxPd
Content-Type: multipart/mixed; boundary="------------1W1gAI0xWQkegOsYmTYkJh5t"

--------------1W1gAI0xWQkegOsYmTYkJh5t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjYgMDA6MzgsIFlvdXNlZiBBbGhvdXNlZW4gd3JvdGU6DQo+IGdudGFsbG9j
X2lvY3RsX2FsbG9jKCkgYWxsb2NhdGVzIHRoZSBncmFudC1pZCBhcnJheSBiZWZvcmUgY2hl
Y2tpbmcNCj4gd2hldGhlciB0aGUgcmVxdWVzdGVkIGNvdW50IGZpdHMgd2l0aGluIHRoZSBn
bG9iYWwgZ3JhbnQgbGltaXQuIENvdW50cw0KPiBhYm92ZSB0aGF0IGxpbWl0IGNhbm5vdCBz
dWNjZWVkLCBzbyByZWplY3QgdGhlbSBiZWZvcmUgdGhlDQo+IHVzZXItY29udHJvbGxlZCBh
bGxvY2F0aW9uIHJlYWNoZXMga2NhbGxvYygpLg0KPiANCj4gVXNlIGEgc3VidHJhY3Rpb24t
YmFzZWQgY2hlY2sgd2hpbGUgaG9sZGluZyBncmVmX211dGV4IHNvIGFkZGluZyB0aGUNCj4g
cmVxdWVzdGVkIGNvdW50IGNhbm5vdCB3cmFwLiBBbHNvIGNhc3QgdGhlIGNvdW50IGJlZm9y
ZSBhZHZhbmNpbmcgdGhlDQo+IHBlci1maWxlIGluZGV4IHNvIHRoZSBwYWdlLXNpemUgbXVs
dGlwbGljYXRpb24gaXMgcGVyZm9ybWVkIGluIDY0LWJpdA0KPiBhcml0aG1ldGljLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWW91c2VmIEFsaG91c2VlbiA8YWxob3VzZWVueW91c2VmQGdt
YWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------1W1gAI0xWQkegOsYmTYkJh5t
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1W1gAI0xWQkegOsYmTYkJh5t--

--------------6b8KZc9ZXC5nIjEmhLEUSxPd--

--------------c2N6S0bmSZEJJAjkd5fv7yQI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpEx3QFAwAAAAAACgkQsN6d1ii/Ey+G
Bgf+N4NL9+mLMo+V7/vLXxzGE/VZYlm6ov6LM73ofNLN5hI6EJhhje18t6HqhgSnWiquH9j2VW4W
fOwHM9Ajb/xGhelS6C8c7T56hLO0VkTLcX77cY/ylgJ2r0tvtdEo9NF4hDJBO/0wkcyCi7OTwkTB
olEZGLd48XSYhvy5dmUqOWCZCSTDLfr6LnfntFGqc+sW68ivyWMFnOccGds4lxiLcNDXTgX7XWvb
7jS11d1FJ9C1vgjZjgdCvIvYpueiqaI6pQuIbB93Iah22aJ5pKvi5BAXNeB+qbVOD1QdjAqco5fm
O/VW7di0VtZaQ8Lt24OjNYvKUm2OiN4L0aoP/e9R/Q==
=PlyJ
-----END PGP SIGNATURE-----

--------------c2N6S0bmSZEJJAjkd5fv7yQI--

