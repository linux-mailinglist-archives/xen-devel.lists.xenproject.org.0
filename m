Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DGHBI/jsmnyQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:02:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E72751C3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252649.1549256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iUB-0005fN-42; Thu, 12 Mar 2026 16:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252649.1549256; Thu, 12 Mar 2026 16:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iUB-0005cq-0x; Thu, 12 Mar 2026 16:02:07 +0000
Received: by outflank-mailman (input) for mailman id 1252649;
 Thu, 12 Mar 2026 16:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iU9-0005cg-Ef
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:02:05 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc9c0f7-1e2c-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:02:04 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b941ec6a368so159401566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:02:04 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972e14ab46sm142466266b.33.2026.03.12.09.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:02:02 -0700 (PDT)
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
X-Inumbo-ID: cfc9c0f7-1e2c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773331323; x=1773936123; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvTUR/JWXm8OQp4ELD+2WbKZtx+yU8EvABnJ1WiOQmM=;
        b=Lnvzuw67Y7BGJ8Cbut5ijhO4KjA2PMPANSAADsKkO1N5oVs8Zhk84+W0HRzCoMzWQz
         lyYaEwdB7BUbQuW1dFdh6pcfmAVA1fN6TtK11G5sf9JtCZZy+bfGaH8irDcYpBqKKbPS
         qFXzpZ6MUUcbls77P2GZSGqljIfjQeJc7fWczcARw1tKuRRym6MbAJ7uCLwt6s9/+upO
         n0ggWAzvvoxSgoIh8p+zBa2MX24Xb7HrJeYNPhmhzthUB3odbVBTM3C6dZ6aW9u+M+pC
         wybeCuFclH5SAhTozzIdk8kvBzK2/HrpBGiLqZnFUExLeMDSBXBcSlqmg8GE6oSaEhAd
         /tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331323; x=1773936123;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvTUR/JWXm8OQp4ELD+2WbKZtx+yU8EvABnJ1WiOQmM=;
        b=YVb243VdwTGMFyvSLZv5BW6BuJRnkfqpaAigk263qvwlyHgAFT/98RqwbYpdaeiPP2
         Z6DY9nMKMRVtRQxCydyXMCBCj0Nd9GRta/Z+J8K3iOqT3YfF/4/6ZYPlXQWWPmL+CMdW
         m6Zh4TN4PTPHYEiz0kaVZKYMpJ3T4HLIvjsT44F5xbYzj5CvvVqdUnega1BEdGthcL9D
         gRoUzxSPWYzvYKqfBYMLfAhKKgIXuyzcr+z39hRl1FA6P7HfuyQJBkj5HUDiDDqCRc3x
         g2Myr+4Z77X5cUVwF9qNfE1YIfDo2ce/j5fZbU1OlerZu7Dw50q8lp+Tcz8m0HwTtzTE
         pJLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK0CdSHJTiWP4af7XQlF/T7Q1kFnQsw9tcRBVLupe2vfVlRr2tV+erU5FmCx7SkNh40Hwk5H5qlfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtx+At1drTeEfeappVfNHcSU7CTXXFzWzy54MK5eMc4kr07x/B
	zZV1lqyvbanvUGlpXas/I8XMsovzfkLMB01dUycg26YT49kiuYhFk11GfdqfYIi6H2sQQkrDoYH
	cn2yA
X-Gm-Gg: ATEYQzxhVGU0CpKLETEFhCieApSAGSKD90V2v3GhY6cmYL8sgNQ2uCS8XgunCXL5Xg6
	jVlPgm9uWxcnhrAwl1a6vxfQFdJQSw7zZix4leOBeBtMOyHdSgNmeoOkNpl95QvnfuHYOJ968ov
	Gtml4OmreCbvFhr2egSPssu4ugbWIEnnkeCJby07mLbieOsIB4bNMQ/6PHAdmqY0SN/+oTElIix
	0/K0u6waP5T0z+V3dh6m0VhgU8Hq3j0RlUelkGyb2sMsUkGcFqLo/0aDgosBYeLfrgmrkrpS4wN
	NJXMWNxMmI0RkJryYmYg/HSVetn8MiaNQ4xeAmTkoEy1eBfkwFf/lKg2C9mja3C39un5SY1Vxcm
	3oFEpkEBDXrc+nKhRhRHeAolTV5HwsPPm5NEtaaqiiL/txCLDq+gMPSXrGQhRxFT8XC+2ZOH6QM
	ZajmV9wZkmf/twAUZRWPIpsmvpJthEc3w1NRlxXY627RvpKy1yGjRMbio3P9sUhq94Kpx+AXc72
	yJKhoAjQSGFZ7AAQwybliJ7LitKrK41lfjjak+Q3OzAB6Q9sMPBHw==
X-Received: by 2002:a17:907:94c6:b0:b97:1d24:c015 with SMTP id a640c23a62f3a-b972e560f72mr422433966b.40.1773331322878;
        Thu, 12 Mar 2026 09:02:02 -0700 (PDT)
Message-ID: <f29443d0-911b-412f-91c8-fe668883bbc7@suse.com>
Date: Thu, 12 Mar 2026 17:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] docs: add man page for xenstore-rm
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-5-jgross@suse.com>
 <3aabdda1-7153-4be2-ba78-57b290fda509@citrix.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <3aabdda1-7153-4be2-ba78-57b290fda509@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jLwZa5pkIaqwBptMApjMraOh"
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3E1E72751C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jLwZa5pkIaqwBptMApjMraOh
Content-Type: multipart/mixed; boundary="------------343sBXnuGQB0XIqsQbjB9X7A";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <f29443d0-911b-412f-91c8-fe668883bbc7@suse.com>
Subject: Re: [PATCH v2 4/8] docs: add man page for xenstore-rm
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-5-jgross@suse.com>
 <3aabdda1-7153-4be2-ba78-57b290fda509@citrix.com>
In-Reply-To: <3aabdda1-7153-4be2-ba78-57b290fda509@citrix.com>

--------------343sBXnuGQB0XIqsQbjB9X7A
Content-Type: multipart/mixed; boundary="------------e1BOCqwZ0KUgNPdB9dwbMKRJ"

--------------e1BOCqwZ0KUgNPdB9dwbMKRJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTY6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMzo1MCBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS9kb2Nz
L21hbi94ZW5zdG9yZS1ybS4xLnBvZCBiL2RvY3MvbWFuL3hlbnN0b3JlLXJtLjEucG9kDQo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uNDBlM2U1ODFl
Yg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9tYW4veGVuc3RvcmUtcm0uMS5w
b2QNCj4+IEBAIC0wLDAgKzEsMjggQEANCj4+ICs9aGVhZDEgTkFNRQ0KPj4gKw0KPj4gK3hl
bnN0b3JlLXJtIC0gcmVtb3ZlIFhlbnN0b3JlIGtleXMNCj4+ICsNCj4+ICs9aGVhZDEgU1lO
T1BTSVMNCj4+ICsNCj4+ICtCPHhlbnN0b3JlLXJtPiBbSTxPUFRJT04+XS4uLiBbSTxQQVRI
Pl0uLi4NCj4+ICsNCj4+ICs9aGVhZDEgREVTQ1JJUFRJT04NCj4+ICsNCj4+ICtSZW1vdmUg
b25lIG9yIG1vcmUgWGVuc3RvcmUgQjxQQVRIPnMuDQo+PiArDQo+PiArPW92ZXINCj4+ICsN
Cj4+ICs9aXRlbSBCPC1oPg0KPj4gKw0KPj4gK1Nob3cgdGhlIHVzYWdlIGluZm9ybWF0aW9u
IGZvciB4ZW5zdG9yZS1ybSBhbmQgZXhpdCB0aGUgcHJvZ3JhbS4NCj4+ICsNCj4+ICs9aXRl
bSBCPC10Pg0KPj4gKw0KPj4gK1RpZHkgdXAgWGVuc3RvcmUga2V5cyB3aGljaCBnb3QgYWxs
IGNoaWxkcmVuIHJlbW92ZWQuDQo+IA0KPiBTb3JyeSBmb3Igbm90IHNwb3R0aW5nIHRoaXMg
YmVmb3JlLsKgICJ3aGljaCBoYWQgYWxsIi4NCj4gDQo+IEFsc28gaXQgb2NjdXJzIHRvIG1l
IHRoYXQgIlRpZHkgdXAiIGlzIG5vdCBzdWZmaWNpZW50bHkgY2xvc2UgdG8NCj4gZGVsZXRl
L3JlbW92ZSBmb3IgdGhlIGJlaGF2aW91ciB0byBiZSBhcHBhcmVudCB0byBldmVyeW9uZS7C
oCBQZXJoYXBzDQo+ICJUaWR5IHVwIChpLmUuIHJlbW92ZSkgWGVuc3RvcmUgLi4uIsKgID8N
Cj4gDQo+IFRoZSBwaHJhc2UgIlRpZHkgdXAiIGRvZXMgbmVlZCB0byBzdGF5IGF0IHRoZSBz
dGFydCBvZiB0aGUgc2VudGVuY2UNCj4gYmVjYXVzZSBvdGhlcndpc2UgdGhlcmUncyBubyBo
b3BlIG9mIGtub3dpbmcgd2hhdCAtdCBzdGFuZHMgZm9yLg0KDQpJJ20gZmluZSB3aXRoIGFs
bCBvZiB5b3VyIGVuaGFuY2VtZW50cy4NCg0KDQpKdWVyZ2VuDQo=
--------------e1BOCqwZ0KUgNPdB9dwbMKRJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------e1BOCqwZ0KUgNPdB9dwbMKRJ--

--------------343sBXnuGQB0XIqsQbjB9X7A--

--------------jLwZa5pkIaqwBptMApjMraOh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmy43oFAwAAAAAACgkQsN6d1ii/Ey/+
hQf/WrsROBfkoDnZ+GWrgKQYPKbAnVcOQiGXgGeLe93V8qlTMSuiWgC95JhEKpN1Fj4hFEwxtOwt
/ei/t1xQ/d38/sKkgcx/D+vw4kYk6yCdmv0R8yYrygXv7Wn+W88VZ53s9cuAAi11GH0V8+u03L2E
4gY6NzEIJ9q59sb8mlkDtu9r/aBpl2LT7rFcyIg6rrPt6yHPChsS8QBgt8twH3KHyEY9Ob4Qlysb
fhfQ4w43z8B0Vx0jXfrq7wDlBO8DD9WKASARjq/bWsQ2uc1Y9zRGozWjUnLy5c3ogeuriRcSCwcU
R54ZkkdO+mcQg9TfAFc7+FCbVXy2hke0I2zoP1QcUA==
=MMXO
-----END PGP SIGNATURE-----

--------------jLwZa5pkIaqwBptMApjMraOh--

