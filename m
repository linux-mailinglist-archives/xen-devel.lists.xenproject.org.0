Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAaXMK3N2GngiQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:15:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386523D5837
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:15:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278668.1563431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8t0-0000sg-Vw; Fri, 10 Apr 2026 10:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278668.1563431; Fri, 10 Apr 2026 10:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8t0-0000qD-SV; Fri, 10 Apr 2026 10:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1278668;
 Fri, 10 Apr 2026 10:14:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wB8t0-0000q7-1H
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:14:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8sz-004D7m-A3
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:14:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69d8cd8c-bab6-0a2a0a5309dd-0a2a4501cfc8-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:14:49 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69d8cd99-6fc9-0a2a45010019-d155d030b5a6-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:14:49 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-66e8cc747d8so2653607a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:14:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6e7c7c81sm65293466b.43.2026.04.10.03.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 03:14:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1775816089; x=1776420889; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cc3rf4dQXyDFYKT0EBEC0clHUIavPB0sqGRO72yqsEI=;
        b=SpkQ6H8AP6lGDHdK1Kjmrr2Ck2+A6W02ScvH7q1fDxq2cZKrlM+LfgPMAqIh4ZJfEF
         mBJB8OITefB97syOre7Fdp8r6DLUBINL72qscxi4HAc059FyWCmdIkbQk9CHaEZuRCE3
         O0zESbm9OmQgDDZeEKW827dr8Q/douuK7vx2XQs8T8Ybnjnr3GkUe+Fkn7yIP/mn3oOq
         govTBmMtY0L6GWZKqQq5HsaWT4klDgBQZuHfSRTbC8Z4mo6A0eBXMEgEH7UPegRrPbII
         8bRTgr2/dGKM+BOIGs3X+HXAJzW6BX+uRvcwxj1jBEaTI3zodVmSH/x+saXPGjgUIQio
         53sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816089; x=1776420889;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cc3rf4dQXyDFYKT0EBEC0clHUIavPB0sqGRO72yqsEI=;
        b=FrJuvGhE1lyAxcWmUecXm1nmLQURqmkNgE6okjtfkzitWh7x7t8Rf3KXOrzOLc7Epz
         l/JgogktSwYel6/sKXAQyt4rx2IoQVJsEaPRrcywF61ty+KtCm21ByxI7e9DItpeve83
         LqxuKlMND0CI++X/ypQnA/GrvJ6yNfPdBiRsYLa5KcGPodt3XQkgsYruvDnefiHbH0H2
         EJU24MIzOt4w/XbRPFVMMoiruYKoVp7dCa3vBg2AwP9FOyUAl3FERolRGMbPonmJ2Bec
         wVBoy1jaDuywHf1bz5/ZFCC2GXIa+VOVHFwJW+BRKp1H4bkA2Tu1tkrE2/q4Zd93qQRk
         2GgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZZmy3fbofAHHmUWz1k+Z/dkfsNMfMmomTLiIqd2z6vC6ovzjVdRbbdHZ2YrRtQqAqTgr/f1ujgXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhDGt6fcNcxqnELpZflM/mQfrxDGcICThs863W6ZilyBBlTyRn
	NWBsDm0gSnC6GQnhv2z58jUXSLskXNkIP1zYTkhnnNH9MzpvhayztHNHVJGZ86kBlXWeuaDIzEf
	cLHGenlE=
X-Gm-Gg: AeBDieskbxWrEHaf4W9b004cpNQKCqiv5fcPdvwcGs4B/2ordpqQqI64fLcDdnHfrBn
	g8B7RZFr3Nqd93gAhz3yKWAgFoBgmbAskkKocvihxOVZ9+6TSENE35+Xu2pPf0X0bZaLv/8n7jC
	/7BP6nX430s0hLjVj7pI0y+R3jC24yg3PpbB4vVabEQ8lrSxhc4aAvyN4JuC5zMV4ZmpDUe+Es2
	X2YVsN6+W4AaFMLOJhbrgxAapTnZQpnoORIpJ+CnIbNmSfn9ZQ4+0dpwCXjCGsgAs0VtTtRpPC1
	vQh9fyavvrmQVsK9CW+AtZY5OWPWO0pitmQkDR4zaby2/zrmkJXXkhHHh+MXvS2hxKCpu3WTxth
	hQHVPVkgFz7CRVyTPTd2aSk8XY/NvKoXOE60ObkBPNpbRA+pDtMvYNZ6uAc7IiNMbJJ/d9sfzxX
	d3GSuHG6YpuQqhDV6a1h++eBN7edqauZK0a4y6UnmEFdi14ArkgUDQpTEaWm4bJ4WL3glp4bACw
	pk1so8NWnxuKsd+rpAXXbFwssjItYJu6GdZnymhrBohz9jGNHTCrA==
X-Received: by 2002:a17:906:5189:20b0:b8f:b32e:e196 with SMTP id a640c23a62f3a-b9d7279ad8amr98332266b.30.1775816088506;
        Fri, 10 Apr 2026 03:14:48 -0700 (PDT)
Message-ID: <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
Date: Fri, 10 Apr 2026 12:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RrhnLUpSH1N9zvQM1H9fBG0T"
X-purgate-ID: tlsNG-d62444/1775816089-14EE3185-22168AB3/0/0
X-purgate-type: clean
X-purgate-size: 6770
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
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
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 386523D5837
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RrhnLUpSH1N9zvQM1H9fBG0T
Content-Type: multipart/mixed; boundary="------------QKx1hifjZ1Zc54zu9gycsAwb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
In-Reply-To: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>

--------------QKx1hifjZ1Zc54zu9gycsAwb
Content-Type: multipart/mixed; boundary="------------Vdy0cAsM9xS79eMChS80bSy7"

--------------Vdy0cAsM9xS79eMChS80bSy7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDQuMjYgMTE6MjksIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBJbiBSVERT
LCByZW1vdmluZyB0aGUgbGFzdCBlbGlnaWJsZSBwQ1BVIGNhbiBraWxsIHJlcGxfdGltZXIu
DQo+IFdoZW4gYSBwQ1BVIGlzIGxhdGVyIHJlLWFkZGVkLCBydF9zd2l0Y2hfc2NoZWQoKSBy
ZWluaXRpYWxpemVzIHRoZQ0KPiB0aW1lciBvYmplY3QsIGJ1dCBwZW5kaW5nIGVudHJpZXMg
bWF5IGFscmVhZHkgZXhpc3QgaW4gcmVwbHEuDQoNCkRpZCB5b3UgZXhwZXJpZW5jZSB0aGlz
IGJlaGF2aW9yPw0KDQpJJ20gYXNraW5nIGJlY2F1c2UgSSBkb24ndCBzZWUgaG93IHRoaXMg
Y291bGQgaGFwcGVuLiBBIENQVSBjYW4ndCBiZQ0KcmVtb3ZlZCBmcm9tIGEgY3B1cG9vbCBh
cyBsb25nIGFzIHRoZXJlIGFyZSBkb21haW5zIGluIHRoYXQgY3B1cG9vbC4NClNvIGhvdyB3
b3VsZCByZXBscSBjb250YWluIGVudHJpZXMgYWZ0ZXIgdGhlIGxhc3QgQ1BVIG9mIHRoZSBj
cHVwb29sDQpoYXMgYmVlbiByZW1vdmVkPw0KDQpCdXQgbWF5YmUgSSdtIG1pc3Npbmcgc29t
ZXRoaW5nLg0KDQoNCkp1ZXJnZW4NCg==
--------------Vdy0cAsM9xS79eMChS80bSy7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Vdy0cAsM9xS79eMChS80bSy7--

--------------QKx1hifjZ1Zc54zu9gycsAwb--

--------------RrhnLUpSH1N9zvQM1H9fBG0T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnYzZcFAwAAAAAACgkQsN6d1ii/Ey/Y
Lgf8Dp3mcnIsvG9/pHE73rb8mePmmG7dj7iKEjaRc7Eg8RQmV5zw1GF0MfZmKhbI2tmFB9KPOlBn
SF3qbXsh/b/ioMGDNuOWyZRwn28Kri5dUg2QcKtPQri4mf03jt7aWkWmeSmJX0h967EuHGLOkxio
lLd9XETiyNVWUssvJv/zfoLt9bIi5c6cfK/JCun/EVleMJ7mvnXcVadId93I+4VWCg/HnEnqd3eV
z8d5ijTgfwxCyW8CIvXMNPJNeL3U0d3i2Fr+/9VKaAZjOuAF/T86OUH4SGP7Zic7noOGjsp5JnQu
xEwriJ4GpRHPZnzJIIu5DBWz84SqqZD/HxHCHheJXA==
=dAZM
-----END PGP SIGNATURE-----

--------------RrhnLUpSH1N9zvQM1H9fBG0T--

