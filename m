Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ug2LJfXIRGq20woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:59:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDF6EAE9C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 09:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Sd+JiGdq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349575.1607296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wepqz-0005ON-1Z; Wed, 01 Jul 2026 07:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349575.1607296; Wed, 01 Jul 2026 07:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wepqy-0005M3-Up; Wed, 01 Jul 2026 07:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1349575;
 Wed, 01 Jul 2026 07:59:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wepqx-0005Lx-Aw
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 07:59:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wepqw-002i7t-KI
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:59:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44c8d1-5cb7-0a2a0a5109dd-0a2a4508adec-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:59:26 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44c8de-edec-0a2a45080019-d155da36e89a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 09:59:26 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c0e124d2a21so48916966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:59:26 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a3d9bsm2239236a12.4.2026.07.01.00.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 00:59:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1782892766; x=1783497566; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4nbNkASKhTIlBPmQlRNUkJ6qH3MiYyvXeGCcasQsAI0=;
        b=Sd+JiGdqyeQSXYSphNozl1iUkWmxZE/77Xan+D3ksaZL8UIvVrieAL+Qy1iAoUcoin
         3LbWQexfGH6xNAunn4NDPRPvcRi/s4u3lIj97FHh8YGgvTzu8rZ+G8WN1CM48LsPr1qF
         z5HXUFSE3OkYUyMahMZzacgMfpyCzuRfSAMaiEZZ09FqeK3rTbqgIxSnVEE7yuSN1uy6
         uU7omgGtX/S3EsFGxNW/1yMq+kb8GzL/dpyl8BLgbVEjIGcJdkjKuBhnu33vJ+UxH3ps
         SmxhqBZH2ogVCHRlqATNRtZKA6Z8CI2tPfFbtzw4PYTp2GrBf649WDaoWmAfne2vFsen
         U58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892766; x=1783497566;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nbNkASKhTIlBPmQlRNUkJ6qH3MiYyvXeGCcasQsAI0=;
        b=J0pQx84QMN1Fi7WL+vfjmkk1p0EW3WaCGXBgwLJeOU4H00lXi5Ldd7/4PWgBKBE8iF
         2AA4+OOqM4eW+mT9Zr/3ec/cp9oENkb6gbX5MVUjZqFQespljQBwtz6U3rdJvxWj8pJh
         TckvNaqgvPuJI3jpajK/1xU32NQpgBdr3/i812ShHqsHCmzJ8hLHCn+XXlLVDSZj9TsH
         SqwPoNMW1lo4pjZKNiQg/sUtnyubOSI+zcuO7P63y+Tv/Wgm3lHnAHEszIkeJEy17Ujp
         /+CfosxptBIeef6SsW8itEHYhpv9DEjVBw5QfSqkpfB5NhQ0Q9NBabcnijyAGPvolMUT
         Wn/g==
X-Gm-Message-State: AOJu0YyELtXuxmlExw/xFiFlA41DDcoXyaIAQpYUDAwfKCZ+wrPy8acs
	l96LUFwip6C27Kn/z6IodmziJcxELLC1xqirTIHnk5kgiAY8YQtBAImC82wN/sNfIO0=
X-Gm-Gg: AfdE7ckz+vMt4j8sFfryjKanWNv6XmIs4j9q3RhT7sIjYykzbym8mm4do3MxGoF2YPd
	L32kUiMJaU+8tZ+sl1XDqEeiAIPO8CPussYHAyxW0m2tAVlJwvzgsLMacIwxpieQeQpng4pkcte
	a4w2wlPnygFTZdigdfphHw7QzyVQGAJsI51g8eB1esdoSKEuTW5R7tOWJ78KO4HRu0m7DKwn2Wq
	asAn2ZomcHJ4QfdAr1/2xN7tQCdl0b/QchYNWRpR/hR9a4zKic+C5jfNmYSCT857Zg5UwE490KW
	siay9XI6Go4syOHdgFEPh6dDm2Bke5QHlkZusBXps4vRSWa4fNW98mJER1L/uwkyswAHmzde7jy
	PvxNuPybK/hEonM/3iqme9cHlfF5tscm1DyiUb34Mszb3kYsALhcpFZwfHYb+n0/C4rzU5SDgaB
	Z+xSSrMRX7skzNmyz4RPb+Fv17xODLf6wkPyPVa8f6IMgax7p8m/TBIgIF9F3jfSCUlxD+Uc/1+
	vaBGIxxDP4Wxd9Hzi2Cd6qqPRERF/kufT2Dc7U1sQaDp/s4IQzQEA==
X-Received: by 2002:a17:906:e10d:20b0:c12:7512:18cb with SMTP id a640c23a62f3a-c12aa184c6cmr15283466b.58.1782892765663;
        Wed, 01 Jul 2026 00:59:25 -0700 (PDT)
Message-ID: <cfc2303f-aff7-45bd-a1b9-60888ba1e5a8@suse.com>
Date: Wed, 1 Jul 2026 09:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xenbus: reject unterminated directory replies
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260624124242.9160-1-alhouseenyousef@gmail.com>
 <20260626223738.43742-1-alhouseenyousef@gmail.com>
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
In-Reply-To: <20260626223738.43742-1-alhouseenyousef@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Rx8KxrJ07uxXf9wNvhXWzk7Z"
X-purgate-ID: tlsNG-c1860d/1782892766-A253F3FC-33819FE0/0/0
X-purgate-type: clean
X-purgate-size: 6712
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,lists.xenproject.org:server fail];
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
X-Rspamd-Queue-Id: EEFDF6EAE9C

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Rx8KxrJ07uxXf9wNvhXWzk7Z
Content-Type: multipart/mixed; boundary="------------4vUdhZNEHihnn0uY9xxS0MzH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <cfc2303f-aff7-45bd-a1b9-60888ba1e5a8@suse.com>
Subject: Re: [PATCH v2] xenbus: reject unterminated directory replies
References: <20260624124242.9160-1-alhouseenyousef@gmail.com>
 <20260626223738.43742-1-alhouseenyousef@gmail.com>
In-Reply-To: <20260626223738.43742-1-alhouseenyousef@gmail.com>

--------------4vUdhZNEHihnn0uY9xxS0MzH
Content-Type: multipart/mixed; boundary="------------hdg6x8htzENYRNr5sEtTzpry"

--------------hdg6x8htzENYRNr5sEtTzpry
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjYgMDA6MzcsIFlvdXNlZiBBbGhvdXNlZW4gd3JvdGU6DQo+IHNwbGl0X3N0
cmluZ3MoKSB3YWxrcyBlYWNoIGRpcmVjdG9yeSBlbnRyeSB3aXRoIHN0cmxlbigpLiBBbHRo
b3VnaCB0aGUNCj4gdHJhbnNwb3J0IGFkZHMgYSB0ZXJtaW5hdG9yIGFmdGVyIHRoZSByZXBs
eSBidWZmZXIsIGEgbWFsZm9ybWVkIHJlcGx5DQo+IHdpdGhvdXQgYSBmaW5hbCBOVUwgaW5z
aWRlIGl0cyBhZHZlcnRpc2VkIGxlbmd0aCB3b3VsZCBsZXQgdGhhdCB3YWxrDQo+IGNyb3Nz
IHRoZSBwcm90b2NvbCBwYXlsb2FkIGJvdW5kYXJ5Lg0KPiANCj4gUmVqZWN0IHN1Y2ggcmVw
bGllcyBiZWZvcmUgY291bnRpbmcgdGhlIHN0cmluZ3MuIFJlcG9ydCB0aGUgcHJvdG9jb2wN
Cj4gdmlvbGF0aW9uIG9uY2UgYW5kIHJldHVybiAtRUlPIHRvIHRoZSBjYWxsZXIuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBZb3VzZWYgQWxob3VzZWVuIDxhbGhvdXNlZW55b3VzZWZAZ21h
aWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KDQoNCkp1ZXJnZW4NCg==
--------------hdg6x8htzENYRNr5sEtTzpry
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hdg6x8htzENYRNr5sEtTzpry--

--------------4vUdhZNEHihnn0uY9xxS0MzH--

--------------Rx8KxrJ07uxXf9wNvhXWzk7Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpEyN0FAwAAAAAACgkQsN6d1ii/Ey/L
yQf9EUlGzOa4UNI7dN7EtJJoZFRzGCnjBW9ROiKQaeVCrktn9vewn7E9al8uCIhPpU5YXylF4LY5
Cdw3UqewfAW7+2j8J0ga8l5krmnL73YfuHnyYgTR9X4AxyLN+eM3eP1CrZN/iKeJrSZGb7w6VXAG
QOIXZR1zxClUpaxNZP/qydKwWK4lz76LPGTY+c3H979nXBAsjatdMgnraThuACURBiLipspT3/qU
TqgYnFGO5HrmKCvsyWZvQo08qQiACgoc8vYLDf/FTTezxl/nAhZDRWHObpI8LFzkj/d/ifM2h10Q
e8u3FPAU7SuK0AzYmc5zRa9u9dZ3RPTdncNCH1Bkrw==
=3KWH
-----END PGP SIGNATURE-----

--------------Rx8KxrJ07uxXf9wNvhXWzk7Z--

