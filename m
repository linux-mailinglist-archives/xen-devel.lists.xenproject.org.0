Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOmFMyHC2Gk4hwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:25:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58E3D4B5F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278549.1563341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB87V-0006IS-8e; Fri, 10 Apr 2026 09:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278549.1563341; Fri, 10 Apr 2026 09:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB87V-0006G8-5Q; Fri, 10 Apr 2026 09:25:45 +0000
Received: by outflank-mailman (input) for mailman id 1278549;
 Fri, 10 Apr 2026 09:25:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wB87S-0006Fw-UR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:25:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB87S-004RNF-AL
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:25:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69d8c20e-bab6-0a2a0a5309dd-0a2a450897e8-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:25:42 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69d8c216-fab6-0a2a45080019-d155da36c558-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:25:42 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b9d6c8871c7so177355866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:25:42 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6e7c8a4fsm61318866b.54.2026.04.10.02.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 02:25:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1775813142; x=1776417942; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUHK9ERWT2PABdE3T9P90L/Hy3+nYOVqiI1pT5huYr8=;
        b=D7LWLP2WACVJcRzgmqmfM8J6YYz8bpdRg+T/jXCwjmUQ0/idDLeGkKBM11fZS31AIx
         xOE/VW7oz2XQLeGTYhGpexGO13XCsV9Rh5Ut6vkW52a+RCA/jgoLqmgzxYvb4mN71fjt
         rN9/qhyIRboFdQbgieuo5TaxC1OoSvBgP+02YrBkho9TOC0basqXs6rt2zBwgh0Ch1f4
         DUhLOKO30lQlU7nSiK2btSUctl5aQ9fjv6GIWG0s9Pb+Nv2UU7Lqv4hKSLNu4uLGzYoB
         NftqHRhuBb4SRdc1NbQ2iPeVAWen5XcHjMW5HsNn99dbpEhdYylcf2cCNHNXRUtU3Anc
         5Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813142; x=1776417942;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EUHK9ERWT2PABdE3T9P90L/Hy3+nYOVqiI1pT5huYr8=;
        b=EJ68NN3gkdEeO3i4rGSzJLr/G5WQYtcpXbU33DCxxxrGKzrj9iORKiyhFDuRhguu0l
         Ugw6IBourIH5OPt+9runqyG3E/tR8+YlOrkaTRH/TaCc2rE65JZPpAtDw17qvytGaz1/
         2Rr70BA1pKGtWltFD99M7cbVs/K4v1fZ4X3AZvH/+behMzEMCzCuICuDN0gSzRBp88fJ
         vuPa3pFT1Sy+rBKHakei7/DmB3D5iP5HQmaHzwVHEwrcnpg8bkYU39peuWZDMm+paJkB
         O8I/1yHm5+8Wd8q60MZYBVpCbauByxIqPy6hLof1N3Yp2CTIXwooR1+k6NaoBjs5wJl3
         ezFA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNNTlc3Q3E/tM9nhkxRNJwtHs5KS7aasyJC1y7KTtK0wMeyPhZzZrV42420ZkgNunL8MtXmQYK5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCzH53/yaUAuPKttZquii0XcbB2ZSpAYWBWOPA7zJsZq46qy88
	jd2hy52k09elPRO/HfY/nmoK+n8vnVckOnw1iJFPNvlOMuV73+hy/h8EW3CvBn/ICOhXVxN2DFB
	hG9Vxxcc=
X-Gm-Gg: AeBDieuBKPw/hnpf2/jH3h8dXxbJ1ZDa6z0XBg6/aHi8ZZO/r3th73DSIeaej4mdaME
	OXkRoFsgtygU4azdYB1WHfPwqg6knmlWmuLv7PmN02yyK4dxcQl7IZm3Rttstxnv638b2Iid/wb
	VYpDFnB3CbS+WT5kGfxXYNzS9yujBLIVTtrdPOoreneKfSF+JXtKhC0TxUfSfv6gO/YE8LjxOza
	RKGL+4JMVj4h5+Xl3ZP8VCZ7JhyCSnZxeVvvzr/B6aRgTcizh4yRdnCLA0Y9t8EFMjCwxJuuqWA
	GMbzbhsnqGkjornum9C6pJqktyArefjuE4lziJUGLN7qYYvY1XJLA4+eh7xUPD2lyADGTOqIMq7
	YwQ7SQicL04jgi3MCmVYGqqswuaGWrvgPuWIDfBNFFXfsTUM4d5N4C3zbLOoWODqV4XWpBwy/Qn
	9NR6g8oM5PtLTr6hxOpoDqgaqSfbGDTjAYDKqJ3mfnIDQcm0DnyeahplBuwvwZnR6WrA3n1BjQv
	DAioFN7b3LwUxZgsQwgKioRt/NNh0kNmWNZmXhQ8erUhpa1gBMUCw==
X-Received: by 2002:a17:907:a4b:b0:b99:7462:3c57 with SMTP id a640c23a62f3a-b9d7248408cmr154529666b.14.1775813141415;
        Fri, 10 Apr 2026 02:25:41 -0700 (PDT)
Message-ID: <e4560dce-a95b-405b-b637-b75ec15497d7@suse.com>
Date: Fri, 10 Apr 2026 11:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U4sdEceuh3JojFJ0MTcwOkSx"
X-purgate-ID: tlsNG-c1860d/1775813142-F674E497-C5A0D6C6/0/0
X-purgate-type: clean
X-purgate-size: 6740
X-Spamd-Result: default: False [-1.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2A58E3D4B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U4sdEceuh3JojFJ0MTcwOkSx
Content-Type: multipart/mixed; boundary="------------xlY21cHbPB44Bz9083xxDk0N";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e4560dce-a95b-405b-b637-b75ec15497d7@suse.com>
Subject: Re: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
References: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>

--------------xlY21cHbPB44Bz9083xxDk0N
Content-Type: multipart/mixed; boundary="------------g1D5yj02SAeTsyFXJAmO900y"

--------------g1D5yj02SAeTsyFXJAmO900y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDQuMjYgMTc6NTUsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gVGhlIHN0
YXRlbWVudCAncmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7JyBvbiB0aGUgZmluYWwgbGluZSBv
ZiB0aGUgZnVuY3Rpb24NCj4gJ2h5cGZzX2dldF9lbnRyeV9yZWwoKScgaXMgdW5yZWFjaGFi
bGUgYmVjYXVzZSB0aGUgbG9naWMgd2l0aGluIHRoZSBpbmZpbml0ZQ0KPiBsb29wICdmb3Ig
KDs7KScgcHJvdmlkZXMgYWxsIHBvc3NpYmxlIGV4aXQgcGF0aHMgZm9yIHRoZSBmdW5jdGlv
bi4gU28gdGhlcmUNCj4gaXMgbm8gZXhlY3V0aW9uIHBhdGggdG8gZXhpdCB0aGUgbG9vcCBh
bmQgcmVhY2ggdGhlIGZpbmFsIHRoYXQgc3RhdGVtZW50Lg0KPiANCj4gUmVtb3ZlIHRoYXQg
c3RhdGVtZW50LiBUaGlzIGFsc28gZml4ZXMgTUlTUkEgQyBSdWxlIDIuMSB3aGljaCBzdGF0
ZXM6DQo+ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRhaW4gdW5yZWFjaGFibGUgY29kZSIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tv
cGNodWsxQGVwYW0uY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------g1D5yj02SAeTsyFXJAmO900y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------g1D5yj02SAeTsyFXJAmO900y--

--------------xlY21cHbPB44Bz9083xxDk0N--

--------------U4sdEceuh3JojFJ0MTcwOkSx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnYwhQFAwAAAAAACgkQsN6d1ii/Ey8z
HAf+NhzYRx94dG9zbgM1XpN1rDftOKb58I7HKBIiOdU6DjkWRYqqAKo3wDOR8mY2bh1KuEEnqrSj
kRuofJlSXq/y6qaa/Hy3EC67OBZNS8YpZSYvLN/c4gwex0hKOj3PQ358MZAHYrYnjdVQwj1e/vVZ
9drk8L79r1Y5Ju3hOsaaxnmuQrZ7Ke2ldfiRMhczdlwuiG0w468ZolJCemU2JVde8fUBMp+qbTDp
uvxIbtxZHQ2WUBKKKp5TBle93PibGPID9Mb3kzvTDDdDDFQjedJ5nx0D8rfjzxJVflZTWEUrgBEj
KbsGpIlM01JVSGhlhHVcH25enJE3Eq2lyUymf7FXeQ==
=9KXw
-----END PGP SIGNATURE-----

--------------U4sdEceuh3JojFJ0MTcwOkSx--

