Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W6bwAZZWKWryVAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:20:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F066934E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 14:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="Q2p/wjlF";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1334228.1597328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHuB-00058R-I8; Wed, 10 Jun 2026 12:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334228.1597328; Wed, 10 Jun 2026 12:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHuB-000564-Eq; Wed, 10 Jun 2026 12:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1334228;
 Wed, 10 Jun 2026 12:19:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wXHuA-00055y-6C
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 12:19:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHu9-00H4CO-D0
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 14:19:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a295651-2eae-0a2a0a5409dd-0a2a450890c2-12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:19:33 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a295655-63b5-0a2a45080019-d155d033d100-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 14:19:33 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f35so4763466a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 05:19:33 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e65c542c7sm10265556a12.31.2026.06.10.05.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 05:19:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1781093973; x=1781698773; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+X9v4AH4EPovn7PyfazOjunLmvToT2UVwfsQrO3ZJFc=;
        b=Q2p/wjlFwIgRFvTOchi+NtZsgu6wYbcc6W8K437tfA/LUGw0ieXCvOFi0zDW9wGBCg
         /mRbdEYHwD07EtiNgiJLxpGjGhhrU5sEUXePp73Q+wpBmb3BrJNt64PpL4pPic6aItS4
         wIMGiYrDc6Fg+6xdNWjPINR0b2Xw1blPIqnWbyG/eIjjUkkcflK/6I4iaS7vwfB7Dw1y
         kMAT1I/qXoI+43VhfSDhIxgZTeYbMoVcqIaRnBq630d8FSZVANP35BMcebdfpd9Alv2/
         YtyB/rbyX8ccXUI3rHbhYRxnNTMMt4C6S7T6TPOryufbci7Hx81Hqy64WRVIgRNc7Ruy
         oRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093973; x=1781698773;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+X9v4AH4EPovn7PyfazOjunLmvToT2UVwfsQrO3ZJFc=;
        b=F5/VZKyM9F2Nf9EmgjLwa651afaoyq7fd9CwSUH4rmirjo+b6Fkx5t8AqwiaXg0+9B
         3Li9A4ihnhec/yQjJF/UJeqFX5OIiauCWGSllIF1Ux1V4G97s6Ku7papI81+BL1oDTgs
         KIqR5I/m+Tn9K96KouWrB41M7Db6M7ESGMhaCPzU5KqUf7m9F+7WDPs/B63IP0S3o+qG
         w/Kc7kMjw6gioqOf3GC4q+ENBJzgcL31ToTL+TCq/d23Zuxsxq9fykBj/dBXF2Iq2yL4
         XoJv06E/Rh8b0+oygrMaciNEKxFO8NfQ+t1mVDakIX4VYmyQV6bKfEBE5yYa8ZnQqgUN
         yxuw==
X-Forwarded-Encrypted: i=1; AFNElJ+viPnCzokv1+zgzapx2xdsk0ap3aA4MTK8sdPVkLg0ANTxRk+0KAkCdlKMlO/KekOPQYJ68Nksy5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6JNEqiGbOX3+hN0vu9zs7CbkzgkrWqfXyhS8dfGoR6UXce6qC
	ln9B1xlkz/Gsag4DXgdobwF3ElfIv/bUGmYk5s2YrTps0ImBsa5pz9HskYXbffqJWaU=
X-Gm-Gg: Acq92OFCNyxM5vimPhtiIXQBF+8WlNqruOTS2YmtBqzJtfa6529Yab467dWlcpOfO1r
	TqlefTo+peYKLR3rLaquMmuXbegOMmv/URDYRCmsDkEp43NGchE3EpiXBotAXXs3Ony2NKxbPnk
	yzqRmFIEVfTtLrSMwZPYHNIAPKU+4qHQqVS4JMGimVY1s1wH6vNj0Omt2G7lZpjrGUd2Y153WPl
	DqG5KYkllXJMev1tane9KgOPrUw7nh7zS7dtVz/326G9awXJ5koxzwPFmI7WLCupQRE7uKHej2G
	BBSJqGvPn64z6s86sVfYu7n/4uMHcmIhc08Yrj/FQupUrX5hq4Y5ykQYDiKe3jWvNALQI3tLJwF
	lkIotcO26IDrrdbUE8EabTOfvk4pcurSCpoSxY9gp4h5oAxROWOQ2YySRd6cqQCTWOiKnG7rgPC
	Lcvmx6s2KIqq60EjC8EPBOVVPiLa8xKfGVPvpVmmi6F/rAJLzdjA8zr4Hzm+7eQKf2MwTC0ZGRi
	P5LqPa9/iUGTWA4JLjjxZ0gsKzqgUfxjafHrOS1f+okB8wqhU3hE0tR0C4Bc5tH
X-Received: by 2002:a05:6402:2346:b0:68d:3b2:202d with SMTP id 4fb4d7f45d1cf-68fa50359f7mr11804276a12.15.1781093972734;
        Wed, 10 Jun 2026 05:19:32 -0700 (PDT)
Message-ID: <ecb43fc6-e821-4532-9f75-06c86a6ac76c@suse.com>
Date: Wed, 10 Jun 2026 14:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
 <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
 <CAJJ9bXyFatHYnqvwHyupzZWOVCd02Fu4dpOdZTvLE-At+Z5TRQ@mail.gmail.com>
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
In-Reply-To: <CAJJ9bXyFatHYnqvwHyupzZWOVCd02Fu4dpOdZTvLE-At+Z5TRQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ohSzSy6lEsDZo0O9lrS7WWJQ"
X-purgate-ID: tlsNG-c1860d/1781093973-B6F72DB1-3E83B59B/0/0
X-purgate-type: clean
X-purgate-size: 6832
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.87 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 539F066934E

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ohSzSy6lEsDZo0O9lrS7WWJQ
Content-Type: multipart/mixed; boundary="------------tNLccPUfg5OU0HT16Fv4rXuv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <ecb43fc6-e821-4532-9f75-06c86a6ac76c@suse.com>
Subject: Re: [PATCH] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
 <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
 <CAJJ9bXyFatHYnqvwHyupzZWOVCd02Fu4dpOdZTvLE-At+Z5TRQ@mail.gmail.com>
In-Reply-To: <CAJJ9bXyFatHYnqvwHyupzZWOVCd02Fu4dpOdZTvLE-At+Z5TRQ@mail.gmail.com>

--------------tNLccPUfg5OU0HT16Fv4rXuv
Content-Type: multipart/mixed; boundary="------------0Z56FMQZZWvA1v0Py9mrYZKr"

--------------0Z56FMQZZWvA1v0Py9mrYZKr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDYuMjYgMTM6NTAsIE1pY2hhZWwgQm9tbWFyaXRvIHdyb3RlOg0KPiBPbiBXZWQs
IEp1biAxMCwgMjAyNiBhdCA3OjQ44oCvQU0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToNCj4+IFBsZWFzZSBhZGQgYW4gZXJyb3IgbWVzc2FnZSBoZXJlLCB1c2lu
ZyBwcl9lcnJfb25jZSgpLg0KPj4NCj4+IEluc3RlYWQgb2YganVzdCBpZ25vcmluZyBzdWNo
IHJlc3BvbnNlcywgSSdkIGNvbnNpZGVyIHN0b3BwaW5nIGNvbW11bmljYXRpb24NCj4+IHdp
dGggdGhlIGJhY2tlbmQgZm9yIHRoaXMgZGV2aWNlLg0KPiANCj4gR29vZCBwb2ludHMuICBE
byB5b3Uga25vdyBpZiB0aGVyZSBpcyBhIGNhbm9uaWNhbCB3YXkgdG8gdHJhY2sNCj4gYmFk
L2J1Z2d5IGJhY2tlbmRzIEkgc2hvdWxkIHJlZmVyZW5jZSBvciByZXVzZT8NCg0KWW91IGNv
dWxkIGZvbGxvdyB0aGUgeGVuLW5ldGJhY2sgZXhhbXBsZSAoc2VlIHhlbnZpZl9mYXRhbF90
eF9lcnIoKSBhbmQgaXRzDQpjYWxsZXJzIGluIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25l
dGJhY2suYykuDQoNCg0KSnVlcmdlbg0K
--------------0Z56FMQZZWvA1v0Py9mrYZKr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0Z56FMQZZWvA1v0Py9mrYZKr--

--------------tNLccPUfg5OU0HT16Fv4rXuv--

--------------ohSzSy6lEsDZo0O9lrS7WWJQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmopVlQFAwAAAAAACgkQsN6d1ii/Ey9r
PAf/S/7JBfI1qJb6IBJgbGHlg0/umfYnGxINlYy88ti2oXV1ar2KTI+r6Unspnq7gdr+7Zps40st
PCmfHl+YtVV1oKhHLycRiw4g8mB1klHdfEblqa608ARbULq+z5gA5hd7rDXumT/ciU3vtugh3BLQ
6YYzY0LICTL6THaeKrQkuhAFrg1jDXHqTG+sxCODKm/KWTzcbj4nGkEZQ+bDlFXZ5A/z/t/pyl0b
tgfUjWB+lr6DbS+8t2pcKt4unnVsL//CcGjzGA294M6THNip1cHd3DzHhimMYsMtEE8RmnODOgka
v5vlunUveiZ1xAD7TqU1J4Jj49Ylb8ne5TXrCNz3vg==
=ktka
-----END PGP SIGNATURE-----

--------------ohSzSy6lEsDZo0O9lrS7WWJQ--

