Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMt5Kn3qw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:00:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B17B3264A2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262413.1554928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Olu-0000gp-Tw; Wed, 25 Mar 2026 13:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262413.1554928; Wed, 25 Mar 2026 13:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Olu-0000eZ-R8; Wed, 25 Mar 2026 13:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1262413;
 Wed, 25 Mar 2026 13:59:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w5Olt-0000eT-BG
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Ols-00EaHU-Mh
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:59:44 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c3ea40-bab6-0a2a0a5309dd-0a2a45088594-46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:59:44 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c3ea50-1950-0a2a45080019-d155d035e800-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:59:44 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-66132b22182so3296979a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:59:44 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm803120166b.6.2026.03.25.06.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:59:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1774447184; x=1775051984; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZIJTtohtFqy4Ks8G8HLz3X+RfQwxTvYhb7MxN+I0mZA=;
        b=drAzVGOOaJkSjakcHka3GJjmCRDnJQg0XM19S/aUl2E1lSPQ/Kl/gfygN+Xd9i5Vjp
         PdGQ18cwpL0aXSKrs2BTyLTDfxfyg1p80YbFmNOjZ2ajrMrierDO10x/wpn9z4P6niiX
         lJIxj+7ldQ+WnRatARpvKYN99zgo+0a78QL1vWfi/FvT3lTd7lNDU+4vCM10xa3r4pll
         FsSIdWntWmPCda+MGFMIL0KMZWNegJotgj5GfezsIhj7hm4tNhONYEo78KuLayINz1nU
         Zb2xBE1dQW9tqCKcVTSYRFVdUx30h/mw6m5A3SXuPlXXdTDZlhnbl1/c+foUs3fF79tx
         PZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774447184; x=1775051984;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIJTtohtFqy4Ks8G8HLz3X+RfQwxTvYhb7MxN+I0mZA=;
        b=DvqdXSO+4jdTAxI1itOAz8bo8tug7YP+NlrrPiff1Azf4Qnj9lEDElWv+vqxlclYi3
         cg8hblh1cd15uTxGN8pg4QNnIKmiHQVy5fWL4RE25YmUqNkdH+HMwF6bBLDfFaHJnxAY
         g0KqlOtQqzc14ES/N5ISj7XWW2ScI9ayjnKgVZHqRNfzcDiaKT4lCjLcOrT0Kvk6eHYH
         +5UmDGzFhRaCvnhvs1sbhRgfRD0ex1zhxja7+f0KhQef7KWRCKaKZ9z4f1hDSlLGK96/
         DCZxfQistXbfEtKv7BRyEpupukaMvGysR4KZ63OfXoly4KGsMbGUCW/+Y88Om/DT+qSM
         XebA==
X-Forwarded-Encrypted: i=1; AJvYcCUXptJ7LXP2nD/S9rTAD6XF9SF3d5hU2VPWNG8e2Lp+zap1m+DogtYHUA2CJroRyy3CKLnXyIoOngc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4kDs/dfCHvuq5h4EK2hxsDFlnyw43GsOdRdzttPdZIalLqzn9
	DjhoeSuU2Jpj9Q79+op2I79n6JFRmoPchgwnzz0l57xqx0zYElcSdWDv/tZrZOqoWN0=
X-Gm-Gg: ATEYQzytwmk9XgN/dQdh/1wlgZrTjzw7JpJyIcQWyrmngJ3Rie5ZNU1IURIv7kyx6u8
	UwZD/8NfhFSwdtkUlhBW2i41ZI2T6HdOT1uU6LRJMOJyZ9gC4uXw4bs4Vmz8kmnU9D0gAHVkIPh
	MfKB53+8Cnoa6ofjsQ/X13XxzV8aPayVH+8B93WI0QxoKqcIQVHLoaZk7Xbw3JecoXAvllPeyx6
	vbG8E2iIuIAjKcdsnHP8Z8bymMAvpTgCDJ2+Bghd0FY1ndWiNlKg1j+XhGk7vOkOeBYUj/uisAI
	EdvYsj31O65th8melNXoO/rPcEJdssCTBptm9O0KKIXixd0yoFu4jclzxpm9uSq3a5w16UEtZHk
	oqOEUa4eH9GJIWxhkug2JmDvVJ4gdjpACitytEI/zJF59qs6d9Ev99g88YIjS77ifynsa5TjUYO
	RSHH8Mp22ZQZkNnBKhVY2P2HJKrGwuTbvqJVWkPYWewKa9KPrOVHLXwD/yPa2Q0Z4KubIQby9OR
	0WeaMi/bHcUR7jMpqUIPKidR910MbcmTXSlz9p57b4HptJ/u/R9UA==
X-Received: by 2002:a17:907:9445:b0:b93:9407:ea5c with SMTP id a640c23a62f3a-b9b0ea80993mr241333466b.57.1774447183860;
        Wed, 25 Mar 2026 06:59:43 -0700 (PDT)
Message-ID: <6d909f11-528a-4d30-9e29-c7e29bc8f730@suse.com>
Date: Wed, 25 Mar 2026 14:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/privcmd: unregister xenstore notifier on module exit
To: GuoHan Zhao <zhaoguohan@kylinos.cn>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260325120246.252899-1-zhaoguohan@kylinos.cn>
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
In-Reply-To: <20260325120246.252899-1-zhaoguohan@kylinos.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zIcy4MJOaE34JslqqeCe60BD"
X-purgate-ID: tlsNG-c1860d/1774447184-EA490726-CC91C6A3/0/0
X-purgate-type: clean
X-purgate-size: 6899
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
	FORGED_RECIPIENTS(0.00)[m:zhaoguohan@kylinos.cn,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 1B17B3264A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zIcy4MJOaE34JslqqeCe60BD
Content-Type: multipart/mixed; boundary="------------CtEQO9rbEi0ak0QEtbpwwnby";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: GuoHan Zhao <zhaoguohan@kylinos.cn>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <6d909f11-528a-4d30-9e29-c7e29bc8f730@suse.com>
Subject: Re: [PATCH] xen/privcmd: unregister xenstore notifier on module exit
References: <20260325120246.252899-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260325120246.252899-1-zhaoguohan@kylinos.cn>

--------------CtEQO9rbEi0ak0QEtbpwwnby
Content-Type: multipart/mixed; boundary="------------7xG8BAGCSJ6jtPnm1Az7vPq6"

--------------7xG8BAGCSJ6jtPnm1Az7vPq6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjYgMTM6MDIsIEd1b0hhbiBaaGFvIHdyb3RlOg0KPiBDb21taXQgNDUzYjhm
YjY4ZjM2ICgieGVuL3ByaXZjbWQ6IHJlc3RyaWN0IHVzYWdlIGluDQo+IHVucHJpdmlsZWdl
ZCBkb21VIikgYWRkZWQgYSB4ZW5zdG9yZSBub3RpZmllciB0byBkZWZlciBzZXR0aW5nIHRo
ZQ0KPiByZXN0cmljdGlvbiB0YXJnZXQgdW50aWwgWGVuc3RvcmUgaXMgcmVhZHkuDQo+IA0K
PiBYRU5fUFJJVkNNRCBjYW4gYmUgYnVpbHQgYXMgYSBtb2R1bGUsIGJ1dCBwcml2Y21kX2V4
aXQoKSBsZWF2ZXMgdGhhdA0KPiBub3RpZmllciBiZWhpbmQuIEJhbGFuY2UgdGhlIG5vdGlm
aWVyIGxpZmVjeWNsZSBieSB1bnJlZ2lzdGVyaW5nIGl0IG9uDQo+IG1vZHVsZSBleGl0Lg0K
PiANCj4gVGhpcyBpcyBoYXJtbGVzcyBldmVuIGlmIHhlbnN0b3JlIHdhcyBhbHJlYWR5IHJl
YWR5IGF0IHJlZ2lzdHJhdGlvbg0KPiB0aW1lIGFuZCB0aGUgbm90aWZpZXIgd2FzIG5ldmVy
IHF1ZXVlZCBvbiB0aGUgY2hhaW4uDQo+IA0KPiBGaXhlczogNDUzYjhmYjY4ZjM2NDFmZSAo
Inhlbi9wcml2Y21kOiByZXN0cmljdCB1c2FnZSBpbiB1bnByaXZpbGVnZWQgZG9tVSIpDQo+
IFNpZ25lZC1vZmYtYnk6IEd1b0hhbiBaaGFvIDx6aGFvZ3VvaGFuQGt5bGlub3MuY24+DQoN
ClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyENCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------7xG8BAGCSJ6jtPnm1Az7vPq6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------7xG8BAGCSJ6jtPnm1Az7vPq6--

--------------CtEQO9rbEi0ak0QEtbpwwnby--

--------------zIcy4MJOaE34JslqqeCe60BD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnD6k8FAwAAAAAACgkQsN6d1ii/Ey9m
Ggf6Ax7p4KWJm7PCLUEA6HDYWk4hhozq5ovrfYHZ7paTXoP/F+86os1UzbRctez7Rh0u08a61i5V
MKKIXrhr0ehZBdSaqdb2TO6ModzTEXwyMktVFuHy39XTMjdSwhrTGjTnCulEAEUI3U1qlviMOggr
qfdMG5QckzT/ZDI4AIPp4G47+ywgzncWKW8uwOIwCswjcj0A43N2sznkjXlIAZ6pd3s1p0Z1ICbL
mdnr0gM23qhoP3Hn8SmY96cIeShEaVQ6aGSiwzyLWFl/Z6S2s1r/0o83Ed/ChHhombv5tok+o+S3
g2+qj5/My/Whkb8sLDzAUHO1dsCtrkc5o2VgDWDhhQ==
=QXCQ
-----END PGP SIGNATURE-----

--------------zIcy4MJOaE34JslqqeCe60BD--

