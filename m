Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D62jIxhqPmqZFgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:01:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCAF6CCBB1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JkhBkUUN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346081.1604622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5F3-0006Bw-3H; Fri, 26 Jun 2026 12:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346081.1604622; Fri, 26 Jun 2026 12:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5F3-000699-01; Fri, 26 Jun 2026 12:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1346081;
 Fri, 26 Jun 2026 12:01:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wd5F1-000693-9O
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:01:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5F0-00A3J4-MC
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:01:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e69eb-2eae-0a2a0a5409dd-0a2a450bb006-44
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:01:02 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e69fe-ac48-0a2a450b0019-d155da2bb5c0-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:01:02 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c121e83b89fso91191966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:01:02 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbbe8118sm323487866b.24.2026.06.26.05.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 05:01:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1782475262; x=1783080062; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hBlbZptann3URLyeGmzzu7euzy1/N3mZ5izL9qMpFKc=;
        b=JkhBkUUNJYlOqN4IJYVxNVv9inteA97YdAwxU+37SVsgXiR6pHa0hPu3WUO17RAJ/+
         JB8AAHDm1/zfCPUJLOlOB5C/xIQymBmtLvWfnmxuSv/xeFvIgilnI5Z5ANvk8/NdBrzP
         3mLyiUeYXWp23jEpz6mtjBQiKs3zbRMya9l7QOlTohHHdo6HfcAl2UBG/oUBYY9ubIfY
         QIY8aASNj5NS6+lRMCz6ecCipP/8lvOPRh+EaigeKM47m/VzxrWwI+ATTIQS4SZFDjbj
         /aX0FJwDe+S5pI+FsV1KWJE2bVooO6sRm27zMvJ9I8AK9QruaKgEMPg076WoqlXP2hAs
         vQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782475262; x=1783080062;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBlbZptann3URLyeGmzzu7euzy1/N3mZ5izL9qMpFKc=;
        b=EQNhRFcNWJqWbV1XyoBEm+f3mvO4btAzGpL/xd+O3S6CKm4AAqofWVIRq74ICZfcV5
         4PlmeMPXv7YCye/0f3bxYyJoJSra0PYpF1lkJozUwSLZOr7XjrujV3RHdIaBXF38ft6p
         CtNNnkwhUBnJweHmiWWPi1W21/G/CtCqOrQvoB0S7GTApLdwHsnKX3EQMn9kkv3VoXe+
         vXfS5rydWbmjxRDor8bkkYaWeuFhTAUDlqnPbUb1u6GUWaITdK2VCHJHiCCQHFO187Lr
         K+iceZPW31Gi0mwemK98PP4mifJJFDWZGS3Nx0mZz3N2oAFtmFFKPhcgodbpU9yjVHp8
         YINQ==
X-Gm-Message-State: AOJu0YxCO5rVu0pEIDa7hdQ77ghFP4KchP7wajuM9RFXVd5F4jAtuL0h
	l6fh12GdxJIgmd52AYm9lnVz4DCtCVMd6BwaDXAMJ2tVSNGcIiJX1hsnzhpfq7fFe1c=
X-Gm-Gg: AfdE7cnoqY7yxgWk+gTTQ4EbAfCNSErm5mbAMTIvseXrppgSSFqZ5oa14NQJCmwUjln
	d2yQupnciXcNR2JfNe0uaa+TFqh5KlOUIQsi9pcj5/E3rCcmfiEUJDqVH7sVOc23DtSbdaRWeV1
	2j22T1vG9CdNtCVCfUJEDAUr+c1SQTE/2+i3TIlBEGU23nYtYCr6283xDa/NPAsxgKHurkDYKqh
	DbpO/KEd74S3wdr0ZnfOmNBMS9YO8TYxQhv9aAOKOGL64hjL+dj1TRtmi/A5lMf2oDsEv64j3mG
	cRRB5eq4nF9UaoYoAr9fblEyHOl41snBlGJqNr2ZEaqtHoZuYLGE9dPfmq6RqLuM1qcrUck0sQN
	miZwGNmvGV3Xe6Z4iyNReR+6a0nqSvuVBZ7k7RQFmkwaljjj5iBGRdWMpNruwmUqX7wXcJcvDCB
	nTSuwCj5PnQQYITHP8JXKXLFmCO77KiVCGNrAOiLrteAZirmSrHXJel9CxHqCkmBiG6iRYI4Sq7
	6tJbQ8i9FmLIYBYd/L6VAbmZbNLhiwpoKQ4YhoDI90=
X-Received: by 2002:a17:906:f5a8:b0:bee:bbaa:f19d with SMTP id a640c23a62f3a-c1205de1794mr431026766b.14.1782475261675;
        Fri, 26 Jun 2026 05:01:01 -0700 (PDT)
Message-ID: <9521892b-0465-4d25-9e3c-62f869315d2b@suse.com>
Date: Fri, 26 Jun 2026 14:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenbus: preserve terminator when splitting directory
 strings
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260624124242.9160-1-alhouseenyousef@gmail.com>
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
In-Reply-To: <20260624124242.9160-1-alhouseenyousef@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2o6Ivpt0Lth10FADGtAsACwZ"
X-purgate-ID: tlsNG-42698a/1782475262-39722220-72A3A904/0/0
X-purgate-type: clean
X-purgate-size: 7265
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out,suse.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
	RSPAMD_EMAILBL_FAIL(0.00)[xen-devel-bounces@lists.xenproject.org:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DCAF6CCBB1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2o6Ivpt0Lth10FADGtAsACwZ
Content-Type: multipart/mixed; boundary="------------BK7MA9d22R83Ay9Wm4AG0zNl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <9521892b-0465-4d25-9e3c-62f869315d2b@suse.com>
Subject: Re: [PATCH] xenbus: preserve terminator when splitting directory
 strings
References: <20260624124242.9160-1-alhouseenyousef@gmail.com>
In-Reply-To: <20260624124242.9160-1-alhouseenyousef@gmail.com>

--------------BK7MA9d22R83Ay9Wm4AG0zNl
Content-Type: multipart/mixed; boundary="------------XCzG06Dmdxfsl9KDekBtwURm"

--------------XCzG06Dmdxfsl9KDekBtwURm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjYgMTQ6NDIsIFlvdXNlZiBBbGhvdXNlZW4gd3JvdGU6DQo+IHhlbmJ1c19k
aXJlY3RvcnkoKSBnZXRzIGEgcmVwbHkgYnVmZmVyIHRoYXQgeGVuYnVzX2NvbW1zLmMNCj4g
bnVsbC10ZXJtaW5hdGVzIGF0IGJvZHlbbGVuXS4gc3BsaXRfc3RyaW5ncygpIGNvdW50cyBz
dHJpbmdzIHVzaW5nDQo+IHRoYXQgdGVybWluYXRvciwgYnV0IHRoZW4gY29waWVzIG9ubHkg
bGVuIGJ5dGVzIGludG8gaXRzIGNvbWJpbmVkDQo+IHBvaW50ZXIvc3RyaW5nIGFsbG9jYXRp
b24uDQo+IA0KPiBJZiBhIG1hbGZvcm1lZCBvciB1bmV4cGVjdGVkIGRpcmVjdG9yeSByZXBs
eSBkb2VzIG5vdCBjYXJyeSBhIGZpbmFsIE5VTA0KPiB3aXRoaW4gdGhlIGFkdmVydGlzZWQg
bGVuZ3RoLCB0aGUgcmVsb2NhdGVkIGxhc3Qgc3RyaW5nIGlzIGxlZnQNCj4gdW50ZXJtaW5h
dGVkLiBDYWxsZXJzIHRoZW4gdHJlYXQgdGhlIGVudHJpZXMgYXMgQyBzdHJpbmdzIGFuZCBj
YW4gcmVhZA0KPiBwYXN0IHRoZSBhbGxvY2F0aW9uLg0KDQpUaGlzIHdvdWxkIGJlIGEgbWFq
b3IgYnVnIGluIGEgdHJ1c3RlZCBjb21wb25lbnQgKFhlbnN0b3JlKS4NCg0KPiBBbGxvY2F0
ZSBhbmQgY29weSB0aGUgdHJhbnNwb3J0LWFkZGVkIHRlcm1pbmF0b3IgYXMgcGFydCBvZiB0
aGUNCj4gcmVsb2NhdGVkIHN0cmluZyBibG9jay4gVGhpcyBwcmVzZXJ2ZXMgY3VycmVudCBw
YXJzaW5nIGJlaGF2aW9yIHdoaWxlDQo+IGtlZXBpbmcgZXZlcnkgcmV0dXJuZWQgZW50cnkg
TlVMLXRlcm1pbmF0ZWQuDQoNCkknZCByYXRoZXIgc2VlIGEgY2hlY2sgdGhhdCB0aGUgbGFz
dCBieXRlIG9mIHRoZSByZXBseSBpcyBpbmRlZWQgYSBOVUwgYnl0ZS4NCkluIGNhc2UgaXQg
aXMgbm90IE5VTCwgdGhlbiB0aGUgcmVwbHkgaXMgbW9zdCBjZXJ0YWlubHkgbm9uc2Vuc2Ug
YW55d2F5IGFuZA0KYSBmYXQgcHJfZXJyX29uY2UoKSBpcyB3YW50ZWQgcGx1cyAicmV0dXJu
IEVSUl9QVFIoLUVJTyk7Ig0KDQoNCkp1ZXJnZW4NCg==
--------------XCzG06Dmdxfsl9KDekBtwURm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------XCzG06Dmdxfsl9KDekBtwURm--

--------------BK7MA9d22R83Ay9Wm4AG0zNl--

--------------2o6Ivpt0Lth10FADGtAsACwZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmo+afwFAwAAAAAACgkQsN6d1ii/Ey+8
Wwf/VEQRQKZK3bF7qiRVeunrrv1mszCG8t0eCxAOxh6GE2yuI6/KpwyXhCBd0kN6OtbgxcCh71AM
xaM64n4SvEKCe+RQIBXIYf/dW3imP6hpGgbedPap/Gfm5jC4MFhTchz7gjEZVZc0ALRNzV3mlPcG
R7YDNKA6IIR2WpMLjngL+082gCoT9EUZYply6d/KXVzlHmuvY0fw1q1nSJkTl09JRmW/KfgQUE09
fgVX+U1phvIoyqX/HrYzaBZ9yQWdDLqClgUoVATqRpVDKSxpAgNdtWtlYX9CODgRS8QEhM63rMRw
VVhuLXJXlup4l7O7i1JRK6jc7k+oeDjB/P7uas/HKA==
=QVZZ
-----END PGP SIGNATURE-----

--------------2o6Ivpt0Lth10FADGtAsACwZ--

