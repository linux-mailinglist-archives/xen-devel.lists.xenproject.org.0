Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKD5EPZQ5mkDuwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:14:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A618E42F309
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286349.1567447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wErGf-0000cK-Dw; Mon, 20 Apr 2026 16:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286349.1567447; Mon, 20 Apr 2026 16:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wErGf-0000ah-AK; Mon, 20 Apr 2026 16:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1286349;
 Mon, 20 Apr 2026 16:14:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wErGe-0000aO-Cs
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:14:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wErGd-00BZ3a-Ps
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 18:14:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e650d0-e002-0a2a0a5209dd-0a2a4508df38-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:14:35 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e650eb-63b5-0a2a45080019-d155da2acc72-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:14:35 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ba25fd27571so465799566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:14:35 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba4512113a3sm372544466b.4.2026.04.20.09.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 09:14:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1776701675; x=1777306475; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vsNYXrjZrh2+X9aexF7kXgvMYlIRsKLSo1SgkG2xAwY=;
        b=ZuA3GA+/KdB4P/Q08hl1u6q72JDc3iNhS9/6Atxnf/tpWg5SQvDYVo0eFgBg4u4/M9
         JePffTqp/XWEy+bVKGTzqvuhWAtmsqEGX/gMkdUxnVTncco6vsqnnRLWVxMPs5kENXA4
         dp98QKmNGnd9B+/73/48TD7ncPPY3dKyRGAV0V8LzzfakW3LT+IFyuOZVu5ECsa8F/Dy
         PXRBfr1aOoT06C8UwSo2Wa7QMMms2mm3YISqwXCnEObDpqeWXu0JJRHTAsL43X0uzk6M
         Z3Uml+ibe0Ea33Team6iIqbQIFV4Oqk3WlPYWqbN9GYPPpeXDxbvBpYomskHEIeF0g8M
         1PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776701675; x=1777306475;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vsNYXrjZrh2+X9aexF7kXgvMYlIRsKLSo1SgkG2xAwY=;
        b=sNXevNh/sukrhaOzQa1MbeLOcBGHf8I83NjpZyDQv6eGqt0Api10h+GGAQxPSt0RLT
         tOy3QmxthX3da97q6vl/wCAQa2bJ4tiVPOYSVmi9zFYa892gZygs9PjtAN7denYlCtoS
         T0hr7iHvItJsqJHvFxzORu5tpjpgcXegt/2IRSUYtHrBg+bLruN/J8qYhyBOlHkJxz1j
         ppU3xWSmbW4mj+d4T7SinK1yg8B61R9yUiVDY4ZIhOp+7PRU8tRTIaOQUJ5vDmmuJ2rB
         touEHRCp3kdPyMZtKu1c8U33KzzTOzVKWEL4DzUMRX9IRvBDO8bM7bBkU57dt3bG79YL
         po0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9GRCX8wexr4a3eePw+hA7Eoku2gtjB4FpmM/SrDPSuSsOswXyZ1FATcF/VkYMeg2XlrTh1JD0SR8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUGaLePQwowimrMcA3qJn8Fy4GkJSprYeisibHnDRLxBgMzFjY
	sSs9BjTlTAYtcUXO1Kg//OQGDTIPrfPj4Llbjg4145Q8ofK1lJHJC6dgW92KMYMJyGA=
X-Gm-Gg: AeBDiesifm4fBQCnUZ+BZ6LUhUph21+rT0Y/PbmCepA59mGLiRIcm7bskM2nObEAjoo
	l3O7Zl5O3gnIPEJZ6sF/PdcRPf3HWChnHojJG5DyCs/WfYFycnSWJHYdi9RUo9YjBF5sww/+jXh
	yJWPfkKaCg3x2/1x5c5E4LuA1aTHwEyspq4UZuR+hzNJCFdfRKAuK9FMzmSRjqENEWaWa3cSwQD
	YVnvNzuqt/96GCpHRlCjgA8rtRYcZPK0LbmcJadvFdo8jro358IyU0MCXvUZOhkB0gx8F5pMpjM
	DsbvI54x1U4szyeKQF0DG61icwdd4NVouiW3Y0Yg9Ltzlqnf+jN85xxpZiuPhf8Z6vPCf8jRrhN
	eUsvmWsh2ysovXZaP1eebbNEg6TS7z+gUbtO0uMAgYGL66enbfeyDhAnHEaRb4o+VXvy5ATLvuD
	B3wHN/9yJC6nwqlmtSTpCUl+Tdt/GrDG8bVxIrfqrgCMqEKvso69awFzApLYSxZrfFKkucf7Pjw
	hzeonj42vMhKri0/Y6zuizj5AH2IhCRazAz8iUJ5AY/e8t6P1xds2kmU5t6PylcUVYhx5Xqa7k=
X-Received: by 2002:a17:907:72c6:b0:ba6:1412:9339 with SMTP id a640c23a62f3a-ba6141295bfmr369019366b.20.1776701674801;
        Mon, 20 Apr 2026 09:14:34 -0700 (PDT)
Message-ID: <a827f748-86c9-4866-977e-b90dd413091f@suse.com>
Date: Mon, 20 Apr 2026 18:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Feature freeze date for Xen 4.22 is Fri May 08, 2026
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
 <d4e65920-aa03-4fed-9277-fbb7d295fcb1@suse.com>
 <0ef43bb8-8f0f-4cc8-ba03-c09ae4d88be1@gmail.com>
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
In-Reply-To: <0ef43bb8-8f0f-4cc8-ba03-c09ae4d88be1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aqGf4ELZISJyc8q7cPAa0xho"
X-purgate-ID: tlsNG-c1860d/1776701675-3976EDB1-9D89B033/0/0
X-purgate-type: clean
X-purgate-size: 7750
X-Spamd-Result: default: False [-2.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
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
X-Rspamd-Queue-Id: A618E42F309
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aqGf4ELZISJyc8q7cPAa0xho
Content-Type: multipart/mixed; boundary="------------ykO0WSpR3IHon807UIH3U4dT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <a827f748-86c9-4866-977e-b90dd413091f@suse.com>
Subject: Re: Feature freeze date for Xen 4.22 is Fri May 08, 2026
References: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
 <d4e65920-aa03-4fed-9277-fbb7d295fcb1@suse.com>
 <0ef43bb8-8f0f-4cc8-ba03-c09ae4d88be1@gmail.com>
In-Reply-To: <0ef43bb8-8f0f-4cc8-ba03-c09ae4d88be1@gmail.com>

--------------ykO0WSpR3IHon807UIH3U4dT
Content-Type: multipart/mixed; boundary="------------lXpMgxcYzFOuoyOWvXZL66xr"

--------------lXpMgxcYzFOuoyOWvXZL66xr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjYgMTg6MDAsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IA0KPiANCj4g
T24gNC8yMC8yNiA1OjUwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDIwLjA0LjIw
MjYgMTc6NDMsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4gVGhlIGZlYXR1cmUgZnJl
ZXplIGRhdGUgZm9yIFhlbiA0LjIyIGlzIEZyaSBNYXkgMDgsIDIwMjYNCj4+Pg0KPj4+IFBh
dGNoZXMgYWRkaW5nIG5ldyBmZWF0dXJlcyBtdXN0IGJlIGNvbW1pdHRlZCBieSB0aGlzIGRh
dGUuDQo+Pj4NCj4+PiBTdHJhaWdodGZvcndhcmQgYnVnIGZpeGVzIG1heSBjb250aW51ZSB0
byBiZSBhY2NlcHRlZCBieSBtYWludGFpbmVycw0KPj4+IGJleW9uZCB0aGlzIHBvaW50LiBU
aGV5IGNvdWxkIGdvIHdpdGhvdXQgUi1BY2tlZC4NCj4+Pg0KPj4+IElmIHlvdSB3b3VsZCBs
aWtlIHlvdXIgZmVhdHVyZXMgaW5jbHVkZWQgaW4gdGhpcyByZWxlYXNlLCBwbGVhc2UgZW5z
dXJlDQo+Pj4gdGhleSBhcmUgY29tbWl0dGVkIGJ5IHRoZSBkZWFkbGluZS4NCj4+DQo+PiBB
bW9uZyB0aGUgbGFyZ2UgYW1vdW50IG9mIHN0dWZmIHdoaWNoIGlzIGluIGZsaWdodCwgaGF2
ZSB3ZSBzZXR0bGVkIG9uIGENCj4+IHN1YnNldCB3aGljaCB3ZSB3YW50IHRvIHNlZSBtYWtl
IHRoZSByZWxlYXNlPw0KPiANCj4gTm90IHlldC4NCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxk
IGVpdGhlciBhZGRyZXNzIHRoaXMgZHVyaW5nIHRoZSBjb21taXR0ZXJz4oCZIGFuZCBtYWlu
dGFpbmVyc+KAmSANCj4gY2FsbCwgb3Igd2UgY2FuIGxpc3QgdGhlIGl0ZW1zIGhlcmUgYW5k
IGRpc2N1c3MgdGhlbS4NCj4gDQo+IElmIGFueW9uZSBoYXMgaXRlbXMgaW4gbWluZCB0aGF0
IHRoZXkgd291bGQgbGlrZSBpbmNsdWRlZCBpbiB0aGUgcmVsZWFzZSwgcGxlYXNlIA0KPiBh
ZGQgdGhlbSBoZXJlLg0KDQpJJ2QgbGlrZSB0byBzZWUgbXkgc2VyaWVzICJ0b29scy94ZW5z
dG9yZWQ6IGFkZCBzdXBwb3J0IGZvciB3YXRjaCBkZXB0aCBmZWF0dXJlIg0KaW4gNC4yMiAo
bWluaW11bTogZmlyc3QgMyBwYXRjaGVzKS4NCg0KVGhpcyBzZXJpZXMgaXMgdGhlIGJhc2Ug
Zm9yIGZ1cnRoZXIgaW1wbGVtZW50YXRpb25zIGluIHRoZSBMaW51eCBrZXJuZWwsIHRyeWlu
Zw0KdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YgWGVuc3RvcmUgd2F0Y2ggZXZlbnRzIGZvciBr
ZXJuZWwgc2lkZSBiYWNrZW5kcyBhbmQNCmZyb250ZW5kcyBvZiBQVi1kZXZpY2VzIGR1cmlu
ZyBkb21haW4gY3JlYXRpb24gYW5kIGRlbGV0aW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------lXpMgxcYzFOuoyOWvXZL66xr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lXpMgxcYzFOuoyOWvXZL66xr--

--------------ykO0WSpR3IHon807UIH3U4dT--

--------------aqGf4ELZISJyc8q7cPAa0xho
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnmUOoFAwAAAAAACgkQsN6d1ii/Ey+a
8AgAmGVweEo5CX2qrgzz3d0brhOY7+O7I6TRGD8UAp+FFsXiTssBQpq1E62Us2T6zztX9vVLQmeA
gS11fGFaQsT1XJ7mO1ZJje1VQRSAfH6nCOz6Cy4liWoxa6XMIxYLGq+mqqKBCluC+r2CKHamcW2r
9/7aBB6YIlCrVZ5xKJ4jSlH+lhx7vt/W0eq0rQahslfo938TYTwuKLrq6o0YAEEIw+Pe7s7uX3H7
1sE8gt72V2nmPyXiJoEEqNs1Pjg98HkXJ4cTmIpUWtAAmG+0dyGRJNX6RhoSzeUjEfRVcndWGmT1
KtHCQpLSLu9p5ZtQwZ4xIz1Ba4cX15usNM71/sLL3A==
=u4ia
-----END PGP SIGNATURE-----

--------------aqGf4ELZISJyc8q7cPAa0xho--

