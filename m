Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGXNHWzh+WlPEwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:24:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C986A4CD630
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 14:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300635.1575170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEoZ-0006s9-LP; Tue, 05 May 2026 12:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300635.1575170; Tue, 05 May 2026 12:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEoZ-0006qi-IM; Tue, 05 May 2026 12:23:51 +0000
Received: by outflank-mailman (input) for mailman id 1300635;
 Tue, 05 May 2026 12:23:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKEoX-0006qb-Ve
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:23:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEoX-00COpH-2l
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:23:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f9e141-bab6-0a2a0a5309dd-0a2a450bbd9a-48
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:23:48 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f9e154-212f-0a2a450b0019-d155da33b999-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 14:23:48 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b936331786dso611742066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 05:23:48 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc21478931dsm211122666b.24.2026.05.05.05.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 05:23:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1777983828; x=1778588628; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T8U0g0U/wqcPjs1kFJfJR1/rD2eF6MlCooMT06H5ik0=;
        b=XQJ5fh15dXNa5VS8vi6ioWLQ5aeJmMm6Hv2LPjSn3WLCmtxSRO9sK74LdRF63XEn8Z
         4mnpixPPK1pRSOPZA0VJGxHXV1OTEm2hSrIH66dJsdwKv9Q3vol3M9KDJW+BgFB4vXn8
         f1VVcOm4mwuET458uVs2SW4jQQoYQgryO0MktuXEdNeSBPzu8zcMGzdnRHWRIS27e5+B
         T8Vb8YqFcH4xnoRedz2RVeJEKIK2ud2muiHAbO6BtxiLXalhse/vky41HcwOEc3OCTG4
         lEL4Huxh0chhanagS5770wsMUwuFdeq8h7NaBZGuJHGSehAxVKCphCt1A7UdybiS7Cc0
         W0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983828; x=1778588628;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8U0g0U/wqcPjs1kFJfJR1/rD2eF6MlCooMT06H5ik0=;
        b=kHmuT3l+a2r2YViYPkRY/FlFHMESiof3JG2eIG6ZPrSg/Xj4dV2RUUIdOfiRRWod+6
         5Z9+qy9zZfjSJ7hns7ve/KEHOPe7Pi3GgJHsMywMEXE7DQjRFGtSCk6GAI8NztT0slfG
         6nKp2Hog5FoN1nUtDuo5P1yLZsAGyxVf4hqIbniAqMtRR6Ltqa+3F2fZjeOp5y/Jkhyd
         lfAatu29IReG9Yx39D5y0znxCVq5y9tyCprdQL8WV4UoEUgdFXPIwLLMjhjkLFPl8Lfq
         ZEUkZEhIaG5CyMG3XnZ7sm/dVZ9KAyNaCvFQQ6zew8l+f/cQGBKTH8RiB8eFbcmfxQHC
         98AA==
X-Forwarded-Encrypted: i=1; AFNElJ8kHaLGnpoKI0ioAyQAO0fz3x5RHGgwS2CWDkxKLO85NUHUtDlTaXTARXVsz/M0SmexTxLnNiGELJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznCBjoqGUiHKZiBrY/1s0ZTuCuBxqwrRjQA6DI9QSbBmp3ebYn
	78W9KmabsThhprSSqRwVud1lMLCQrsx3ZDUku1QZqQiPxy5S7qUJPkGfENy4M3FwH4I=
X-Gm-Gg: AeBDiev9nifCWGGcl2bxXGDc8qv+9lsrHKTcRHiUTgkTIanScqR8Zxtto5Uk8fflcaP
	MZsXCeVkh2jqCIYqXaLa8mmEIh4iB4I9nJKyB2Vw4DctMtaoXFR9EOVrSkScj6d+DJ2mYm34h5/
	qDonv3iRNuXkEljOr2SzpHqdTnzS9hNJN5EGA7Jcb3AavMy9OQTVw/B+1Z8b7zONccSkUMPYOHU
	Vak+yRf3+S4u7jgKJ0fGix6jv3fnn6CNeYRudUPLWc99U28FqiOSIzhNtZU7Nht8nn3eSVeYKIq
	mElagONjec9PSxgompYoAbsMLagpPd2JGi/yOzP+oQ7cQYbnUeIuyAQkK+j0tgR0JtdMjuM96j+
	4NbYap/1CZGZTQYrthpr6mRNdefJQnvvvPhiJs0SBUM/KN+pcNRY6YGAV+qz0B2Ar2TEzaqvyz8
	YO+hpVkRBgd7XFtvgFW8BLedil4HRZm6dFT0FiO6y2V16GN1ipfCpNLJEfeUlXzq595uUh9/N5S
	YiJ9RbPEX1WpczMf0r0361plXXXwxLD/Vl0GnYQeTQaDmWdINerByxSqn1t0heUlghqh6pf5aM=
X-Received: by 2002:a17:907:80e:b0:baa:1db1:ef9b with SMTP id a640c23a62f3a-bbff992c153mr765598366b.18.1777983828204;
        Tue, 05 May 2026 05:23:48 -0700 (PDT)
Message-ID: <23f5e833-b5af-40f2-8c1c-8ba56c715825@suse.com>
Date: Tue, 5 May 2026 14:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/platform-pci: Simplify initialization of
 pci_device_id array
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <20260505102909.2380470-2-u.kleine-koenig@baylibre.com>
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
In-Reply-To: <20260505102909.2380470-2-u.kleine-koenig@baylibre.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cU4QwkJWUVquCuDHH88AiecH"
X-purgate-ID: tlsNG-42698a/1777983828-7D969F3B-D2434FEF/0/0
X-purgate-type: clean
X-purgate-size: 6732
X-Rspamd-Queue-Id: C986A4CD630
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:msp@baylibre.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cU4QwkJWUVquCuDHH88AiecH
Content-Type: multipart/mixed; boundary="------------e3rh6cYQup5xsVq0HPerxhtd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Message-ID: <23f5e833-b5af-40f2-8c1c-8ba56c715825@suse.com>
Subject: Re: [PATCH] xen/platform-pci: Simplify initialization of
 pci_device_id array
References: <20260505102909.2380470-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260505102909.2380470-2-u.kleine-koenig@baylibre.com>

--------------e3rh6cYQup5xsVq0HPerxhtd
Content-Type: multipart/mixed; boundary="------------s1q5pXTF5M78e6LkpixJ1h0a"

--------------s1q5pXTF5M78e6LkpixJ1h0a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjYgMTI6MjksIFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIp
IHdyb3RlOg0KPiBJbnN0ZWFkIG9mIHVzaW5nIGEgbGlzdCBpbml0aWFsaXplci0tLXRoYXQg
aXMgaGFyZCB0byByZWFkIHVubGVzcyB5b3Uga25vdw0KPiB0aGUgc3RydWN0dXJlIG9mIHN0
cnVjdCBwY2lfZGV2aWNlX2lkIGJ5IGhlYXJ0LS0tdXNlIHRoZSBQQ0lfVkRFVklDRQ0KPiBt
YWNybyB0byBhc3NpZ24gdGhlIG5lZWRlZCB2YWx1ZXMgYW5kIGRyb3AgYWxsIGV4cGxpY2l0
IGJ1dCB1bm5lZWRlZA0KPiB6ZXJvcy4NCj4gDQo+IFRoaXMgZG9lc24ndCBpbnRyb2R1Y2Ug
YW55IGNoYW5nZXMgdG8gdGhlIGNvbXBpbGVkIHJlc3VsdCBvZiB0aGUgYXJyYXkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------s1q5pXTF5M78e6LkpixJ1h0a
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------s1q5pXTF5M78e6LkpixJ1h0a--

--------------e3rh6cYQup5xsVq0HPerxhtd--

--------------cU4QwkJWUVquCuDHH88AiecH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn54VMFAwAAAAAACgkQsN6d1ii/Ey+j
KQf9Hx8qep9M9x8ZNTWHWZOdTLQXpIMaEnnMXThi3aksviuYAquuDufwWnfVWp7hQSOWD6mwObjJ
iQSDZ7o5RQTyXK9AxsCRHPGwQ/Sngy+S/VVHYCZKyZbSdxcRFfH4/OnilE2zpqfEyHt2eC/S9HZC
dDHmf6C3jZBpqyjiXBbwKi32hfFI+32n09cHHGfrMJDGtq/YnVDo/mvMBYzc/hnzbsp3gRYpDdgR
/ofWH9O/wWtickhxFiJV8o+ixqePl75Shhy5Usm/98yo1N/NyOFlmw9lJyYODizRVrsxUShHOamy
9M2yhczuWFteMhVRghg9Tw+15qaBKiRpwddPsyacDw==
=BOTn
-----END PGP SIGNATURE-----

--------------cU4QwkJWUVquCuDHH88AiecH--

