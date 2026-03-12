Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLDgLYu7smmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:11:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A14272521
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252357.1549067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fot-0007b3-GV; Thu, 12 Mar 2026 13:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252357.1549067; Thu, 12 Mar 2026 13:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0fot-0007Yh-Cy; Thu, 12 Mar 2026 13:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1252357;
 Thu, 12 Mar 2026 13:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0fos-0007Yb-36
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:11:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f30d6d02-1e14-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 14:11:15 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-662abedbeb7so1527296a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 06:11:15 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972de0be28sm124936866b.2.2026.03.12.06.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 06:11:14 -0700 (PDT)
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
X-Inumbo-ID: f30d6d02-1e14-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773321075; x=1773925875; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tIzH29nIfpfJjU5VABVztv25nHjzZ9uRbtu8g+T+bks=;
        b=GfI3RFZE1WLZeuekyYaAdl/+VmwWjD0pX4pl2CzS5pUkDVzQwi9GpoB69a8533g9tN
         Jftjbh7UIFj4E9OMw0zxDFjfRg5bDZ6NP4xGKVAn4nsq3M1DR7KE1vwMuQaC9DQpoAdV
         vv6oh1m3ZmgvNnuUBdkuzOap8aAtTmcDucc59NQ9BbsQQu/yDCRdg99R5jbMylyfY39j
         qPYrbP+VQXwKnn9KwXYlyFCkGhLGGWAEFsaTojK+EhryUACmYBqWSKGWNOl1TEkwCEjf
         GjxAUZu6zchXJWH39K1LOJ6egMqsKIXMdfiHr4ATsdVaq3c/QfIoxh9P6O4aKDa7CFl8
         AC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321075; x=1773925875;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIzH29nIfpfJjU5VABVztv25nHjzZ9uRbtu8g+T+bks=;
        b=n6V3O1ZFcjtNkuWduTbx4FOuOOsYCtX6uQiU2/sAM3q6SKZ8KRacW7C7Cq/EFsoxpR
         pHhN068oKgnCO2s9oI5x2G5p5s4m/LrVxBNlfdZmP3i/y5sH+bnOGk98mE/fs91zyOVr
         Ybk1JG27duJTXvhoBCJnCJxJ1xHWGX4rjpCGrH07CVvNZKiwpvnZR76T0xhXK3pAKdFl
         Jt5/7awt1c+0QXf2jRryFjPfJdjwMZCNJcn/1IWMADTUqsLLDx1qHCrV0zOWZnaxkudw
         7Q4XhurJs3sYAI6jj96Eh/hxzk+9yCdy1jYvTsvAmpnWztDGeIDKu6qlVg+mOyqkCBx2
         Gywg==
X-Forwarded-Encrypted: i=1; AJvYcCVEL4NYPF7/SjrlkotR/QN/s4zyFD7ntGrKqimfh0l/8aj7U5vQ40VCxvVLTsZ6ETLwH9wMcQurXQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVCKGxXOp405+Fl84/1SMKVUne9/TfwuBn6veVpyg72dbYy6A0
	co8uynsasXhdRfgW4zEJ44aW32+kIpTrSvlI7rm3ze+mouaVe8uMVUmIL670w1OUEUI=
X-Gm-Gg: ATEYQzy0gFgJIYzT/9XtP4VGxX3kAdgdKGyYHqiGzml0F4Y4StOVyyUpF8rXzmB+s05
	/pW7KkFJIXgFM5VMnE6bNpcOoCR2Hziw7Ak9HykLUBwsM1ozRNIKpxN9HC3ytgXf+9gHbiyvjUU
	lF8R3z8s8hanLDElN9k+Y949eVb9KI0FkulDc5QKTPh7IH5F5VPihv+PjU/xNQlajh+2ES8Qvf/
	uNkH7Wu/R0n8YTULksjOVhfdf8gZPZh/rUV96tZIEn7mTH4iIb+szgs8BGAJuiHkyzk6c2eWV6Q
	lQV4Ad1BdKQpZv0frf3R5389yNlJEcBZD8MYiaTcd5s8eLbO3tWILBWM5WmTrzBeqeHwLzs9qx1
	qt8J8fBZf5nyZp62S5aj+K0xJAfiLe7lQ+jYsrMAOeo0QVEdySMBBzmuY6QgQ14IPHio4vRVw9H
	a6LpZeStqZbhHKeILvLO6Vj7zM6eEY1kgamhchtFeD1Ld30p9m8k5/tLAI0wOcj5+hbgAKl3Oqy
	PSteWI6CpnNmErOGt3Pu3JNzBQcZyVbYkC5kVyGQPyv1Q+2TROs1A==
X-Received: by 2002:a17:907:3f24:b0:b94:cfd:f37b with SMTP id a640c23a62f3a-b972e531cf1mr339412066b.45.1773321074479;
        Thu, 12 Mar 2026 06:11:14 -0700 (PDT)
Message-ID: <7040a30b-4a20-4542-9ae0-3a4a30e82455@suse.com>
Date: Thu, 12 Mar 2026 14:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] docs: add man page for xenstore-exists
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-2-jgross@suse.com>
 <9e209a46-0896-4ebe-a366-4638b562778f@citrix.com>
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
In-Reply-To: <9e209a46-0896-4ebe-a366-4638b562778f@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t0a8Oo01OuQks3gm0tUAxfMn"
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 27A14272521
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t0a8Oo01OuQks3gm0tUAxfMn
Content-Type: multipart/mixed; boundary="------------AvJDn0pdVPgFx9DWZfPZqXxH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <7040a30b-4a20-4542-9ae0-3a4a30e82455@suse.com>
Subject: Re: [PATCH 1/4] docs: add man page for xenstore-exists
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-2-jgross@suse.com>
 <9e209a46-0896-4ebe-a366-4638b562778f@citrix.com>
In-Reply-To: <9e209a46-0896-4ebe-a366-4638b562778f@citrix.com>

--------------AvJDn0pdVPgFx9DWZfPZqXxH
Content-Type: multipart/mixed; boundary="------------P2YbY9D1M1yuHqe0e1AlBbYh"

--------------P2YbY9D1M1yuHqe0e1AlBbYh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTM6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMTI6MjIgcG0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUaGVyZSBpcyBubyBtYW4g
cGFnZSBmb3IgeGVuc3RvcmUtZXhpc3RzLCBhZGQgaXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIGRvY3Mv
bWFuL3hlbnN0b3JlLWV4aXN0cy4xLnBvZCB8IDE3ICsrKysrKysrKysrKysrKysrDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkb2NzL21hbi94ZW5zdG9yZS1leGlzdHMuMS5wb2QNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZG9jcy9tYW4veGVuc3RvcmUtZXhpc3RzLjEucG9kIGIvZG9jcy9tYW4veGVuc3RvcmUt
ZXhpc3RzLjEucG9kDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAw
MDAwMC4uYzRkOWVlZWNhZg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9tYW4v
eGVuc3RvcmUtZXhpc3RzLjEucG9kDQo+PiBAQCAtMCwwICsxLDE3IEBADQo+PiArPWhlYWQx
IE5BTUUNCj4+ICsNCj4+ICt4ZW5zdG9yZS1leGlzdHMgLSB0ZXN0IFhlbnN0b3JlIGtleSB0
byBleGlzdA0KPiANCj4gVGhpcyBpcyBhd2t3YXJkIGdyYW1tYXIuDQo+IA0KPiBJIHN1Z2dl
c3QgInRlc3Qgd2hldGhlciBhIFhlbnN0b3JlIGtleSBleGlzdHMiDQoNCkZpbmUgd2l0aCBt
ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------P2YbY9D1M1yuHqe0e1AlBbYh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------P2YbY9D1M1yuHqe0e1AlBbYh--

--------------AvJDn0pdVPgFx9DWZfPZqXxH--

--------------t0a8Oo01OuQks3gm0tUAxfMn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmyu3EFAwAAAAAACgkQsN6d1ii/Ey9c
hQf/Y39Md8wPhBkWSc8rNRnHENIq6XZb9T1ZWO9DVuhSC8T+qOOo9XdeO/vjeBNJUXN/1At1YJMN
71iCzAKKoAGwuQJgiAZoiPiLu5IxG1RemYvg2qvIeD/1B4asB6kuiGH3R/0RJH9dArL6yeGzM4CW
GDfUWOFNOwDBtgSPYyZHPRDPWLFf0NQo8sf/t52bX1MmVGU4ZZjRLQ7UCoZR0e1ryvsHkwmyLmz+
Wya5jFaAPVsbnnOGUbY1URNGYHLQmnri2qHtuCjE7PBK+EpoGlzZNn5Tjgs7nbSEwBejITdnnjdI
N5zfLaUAz9jAY174oMoUp+Ey0DAeIKwvYLGDEFftDA==
=l8HJ
-----END PGP SIGNATURE-----

--------------t0a8Oo01OuQks3gm0tUAxfMn--

