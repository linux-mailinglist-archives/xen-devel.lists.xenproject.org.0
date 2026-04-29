Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ca4AkjE8WkbkQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D65491484
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 10:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297112.1573248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI0TP-0006kh-Rr; Wed, 29 Apr 2026 08:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297112.1573248; Wed, 29 Apr 2026 08:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI0TP-0006iC-OP; Wed, 29 Apr 2026 08:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1297112;
 Wed, 29 Apr 2026 08:40:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wI0TN-0006i4-E3
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 08:40:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI0TL-001t9P-76
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:40:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f1c40b-5cb7-0a2a0a5109dd-0a2a450584fa-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:40:44 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f1c40c-aaa8-0a2a45050019-d155da2fb992-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 10:40:44 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b936331786dso1613067566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 01:40:44 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb98630e647sm60991266b.60.2026.04.29.01.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 01:40:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777452044; x=1778056844; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29dthCTPW2xreJ9mkRqkrCEgXbzH1gJvWirU2wdTC+I=;
        b=YoxjIKMJXguwNz9hbPCu57SRGlaje9RvAlJm+TCQWlHNpvFKK/G/M4qDoT514eg6u+
         uq63VwodoTG17Mbr/Tvfs2EXpTCjFasHvpBvDNLedAxP9/1gsmTqnd4iE0RZB3/TT/sJ
         NVBxjS2eTgDdgzZ1TF0hQuYiiipKDjlVIA5Q8ZZoXM3aqTyl1UXakAsSXY/iQ7EMXQAE
         JW5D7TUOPe3Za1y4k65GsSuISLGY2gGJQPJ6+Axf4dRjKOb42oXaRwguQ4aynhTtXaOX
         L3SzLqBYYIHOEdLmeW7q3Fl9DtJAu7U2dIfwBT92JSm2oJWLxrRHunebWgr6fX8mQUYg
         9+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452044; x=1778056844;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29dthCTPW2xreJ9mkRqkrCEgXbzH1gJvWirU2wdTC+I=;
        b=RXh+lITLSZ+G7DmAn0QWafq8zumGWTL6PKltAovKtkWSkWzJbl+WLr5DALJ7gaqkFS
         y++k+j1A5souwHoyuypOx9shqTnArzRF+3OSWktebuIdsn2iRwHF7MDpprRin0GISd2F
         o3vmx97893MuudIkqhMB1ApM0Hjjq3uCcok/cZZkVd6o88OeUSznnYd26MWtntR7uH9T
         Ccl7OZj9y0zYO8bYz65izZS73aEarX9oadF+yoH7RHODN182rF360VpHcM/vAx8S/qA5
         GpkSFxjtuyAwNkUDZ2gGfapmYBNbgtBb6xJ/PhpKnWUnK/Pmsk0/4+t28iHR2bqYixEA
         MwEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9udNFmXGEofGiX7fiPhiBpBwRPI6qYrOltVd2WOInsMzCbueHZWPhoUn12T2C3KPv96LXOq885vxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsV6JYB6Nt42iNQy85HaxVNol5EAll0Eha6wJcSmTHFcZkHh7+
	lj7SWrMYZa+ablJD1fruYFqA9Dt1fyTXh4jc1+xPrx+drPn0sjVdD5Pj8fJpO4enbPw=
X-Gm-Gg: AeBDietz/EfuQ6p6fSQ0ORacVb5Q4TTgkUqxcQfCUHcz5MyN4iT7tPKNbQygrF+gnNP
	d4CC7TzLMriVdNt3jkKE1QxorpyU5XvgZgiuc0C2a1d9zIX0/5TKGRXjPqS8zDGEREEV9j1fnYL
	W2Gy+QhWiNyQalbQwSJ/g+fKsOC8ec5qC9HnsuNJwMvDv9hgqLHAVeTMr7dbw+tEQsPoaHUH9PI
	Ln6SPqVxztmndT5erKPH+HWJ5MeiiSAPRxLac9DS1gEunUUYBAsS0wTNMY4TLEAcG5YieBeEig+
	2xARLuqZBpijD6oddYZlxtLpaHakH+kVbdl2cZTLq4k+/U/xAXHiLDDNO9NVOFan+B6BrxgCvPa
	0wzVLhRXeWWCwQOISlegYpktkyENnk9VFC/uRUbD7t9fR9Fv1d5frNxzUccFlCZODNnW8chHY3X
	PGuQWPcZIZBA9K6aBWuK8+GgON8qFhI3L2mQ3pmjU5sni1/OESOJN9DDSw4ru/9krjbnigN1mz3
	sCSaLj5OG8UW5pVzjdFSta+wUxzrQt21tyDnxPgvR6qpx+1hd0QWUh8ouAE17RH
X-Received: by 2002:a17:907:c405:b0:ba9:559:10c8 with SMTP id a640c23a62f3a-bb804538dbcmr417241166b.41.1777452043918;
        Wed, 29 Apr 2026 01:40:43 -0700 (PDT)
Message-ID: <d547efe9-390c-476b-8b07-708bc871e29d@suse.com>
Date: Wed, 29 Apr 2026 10:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iM0GorC37dwJVTjsBlL1aZTN"
X-purgate-ID: tlsNG-c201ff/1777452044-2A76A443-511561CC/0/0
X-purgate-type: clean
X-purgate-size: 6959
X-Rspamd-Queue-Id: 68D65491484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
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
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iM0GorC37dwJVTjsBlL1aZTN
Content-Type: multipart/mixed; boundary="------------S92fFCUTK84VdaznDevhSF07";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <d547efe9-390c-476b-8b07-708bc871e29d@suse.com>
Subject: Re: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
References: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>

--------------S92fFCUTK84VdaznDevhSF07
Content-Type: multipart/mixed; boundary="------------lex6e05wcKSpgNlU70xRNhtN"

--------------lex6e05wcKSpgNlU70xRNhtN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjYgMjA6MTksIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gVGhlIHN0
YXRlbWVudCAncmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7JyBvbiB0aGUgZmluYWwgbGluZSBv
ZiB0aGUNCj4gZnVuY3Rpb24gJ2h5cGZzX2dldF9lbnRyeV9yZWwoKScgaXMgdW5yZWFjaGFi
bGUgYmVjYXVzZSB0aGUgbG9naWMgd2l0aGluDQo+IHRoZSBpbmZpbml0ZSBsb29wICdmb3Ig
KDs7KScgcHJvdmlkZXMgYWxsIHBvc3NpYmxlIGV4aXQgcGF0aHMgZm9yIHRoZQ0KPiBmdW5j
dGlvbi4gU28gdGhlcmUgaXMgbm8gZXhlY3V0aW9uIHBhdGggdG8gZXhpdCB0aGUgbG9vcCBh
bmQgcmVhY2ggdGhlDQo+IGZpbmFsIHRoYXQgc3RhdGVtZW50Lg0KPiANCj4gVGhpcyB1bnJl
YWNoYWJsZSBjb2RlIHZpb2xhdGVzIE1JU1JBIEMgUnVsZSAyLjEgd2hpY2ggc3RhdGVzOiAi
QSBwcm9qZWN0DQo+IHNoYWxsIG5vdCBjb250YWluIHVucmVhY2hhYmxlIGNvZGUiLg0KPiAN
Cj4gVG8gZml4IHRoYXQgYW5kIHBvdGVudGlhbCBjb21waWxlcnMgImNvbnRyb2wgcmVhY2hl
cyBlbmQgb2Ygbm9uLXZvaWQNCj4gZnVuY3Rpb24iIHdhcm5pbmcsIG1hcmsgdGhlIGNvZGUg
cGF0aCBhcyB1bnJlYWNoYWJsZSB1c2luZyBtYWNybw0KPiAnQVNTRVJUX1VOUkVBQ0hBQkxF
KCknLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19w
cm9rb3BjaHVrMUBlcGFtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------lex6e05wcKSpgNlU70xRNhtN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lex6e05wcKSpgNlU70xRNhtN--

--------------S92fFCUTK84VdaznDevhSF07--

--------------iM0GorC37dwJVTjsBlL1aZTN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnxxAsFAwAAAAAACgkQsN6d1ii/Ey8d
PAf+M7ekPeE3nDwhIUq9f5ydO3R+4IAIS9yx2cqNqX54IujFR6kaM4KffEyaWMD/3ihlf/VGdkoo
PCODj5YZp6Yl0F3ddSxeOXK2/9wvuBE7h7MJs54n6gwhzwgzpDWr/wFj5WUF5GGP/lOXReoDJhsF
Y0mOSAIgO/C1kpz1yz6B4GIZpjp7BeJ5IUPiXYfPGRGXECc3WQdDFQBlIJH92KVVwglmJ3Esuj3Q
UXvybfqgNcKsmBBfm55KQf7Rgu9njOMoxFdEbUtxk+dg0iGtxT2GX2b92e/PaIHCIqsZ67hzu6Rd
uwPtptXiFmfF8fiBtZnglL5q911Awg98Q08PvTYaPg==
=4SLN
-----END PGP SIGNATURE-----

--------------iM0GorC37dwJVTjsBlL1aZTN--

