Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGtVAG8g52ki4QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:59:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855444373DA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288345.1568621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF55G-0008NQ-Kt; Tue, 21 Apr 2026 06:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288345.1568621; Tue, 21 Apr 2026 06:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF55G-0008Kk-IG; Tue, 21 Apr 2026 06:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1288345;
 Tue, 21 Apr 2026 06:59:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF55F-0008Ka-UL
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 06:59:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF55D-00AY32-LU
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:59:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e7205f-e002-0a2a0a5209dd-0a2a450ad770-12
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:59:45 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e71f70-56b3-0a2a450a0019-d155dd31b03c-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:55:44 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so2575005f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:55:44 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4633bsm34744873f8f.26.2026.04.20.23.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 23:55:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776754544; x=1777359344; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlKZYDYtvqx7nzoOLPYWCUaxUkZfgBewmXsZIpPEOCI=;
        b=VUKmx4Tisz+VNaeCMlRcSHup5BveoZY2ZmmiAyBxItAr7QQ8Gab6ddFojvSqPuAHCF
         YQ35EgtSZ0GuVI2iiAfu/VkE56aj7OYjTw4qgsZRY961EQKMAu/LW7dgaccv2F/3m0AD
         /+06OXk4/J1oJhYaKx8Akn9UZYvNjXf6AvP31+bFKUAht86M83gnNPHWyoMqBWayMv/e
         WS6Wq0psk+ZcgdBt9zANbPvUnVmRi/+FRpk3YOPBq7SKvkHYNxRyx3iXSOoBWYf2ywh5
         n+9+IGx6cgvyJ2ri83mpDxpdljYqmiDukLbKMjt1XT90ddWVMdxolNz6nWrJ3px7k+5v
         wB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754544; x=1777359344;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlKZYDYtvqx7nzoOLPYWCUaxUkZfgBewmXsZIpPEOCI=;
        b=P/RLqUo3JE/Gmr/rWzCJKZZai+06iFeeDt22fojLryJThohsEaUJoKR69CxQcjt/J9
         LIeHMbW7G0UQmXN4cYhCQftDM+yeJ57NrlsZVO9PwopPUqExaOT0y/6hdFh42evkeydQ
         66BIuz4vWqo30W148wDfXsTVdeJIrs7Ye57kr2O/eZ2dmVaZrvpjRkLU30glPSOfj6xB
         GTePJgF7m+GBtyEr9rWT3mPkj0H7xUQVB7tqXY6dzy4BYfu9IGE/jXk33O5cBwLHnIDn
         OggygkmeD+eHN9hELTJf6OXh4T4Bei4CCm5L9mKvW941+hmMUWaMztYQq/TEtYBvXoLt
         CVew==
X-Forwarded-Encrypted: i=1; AFNElJ96jyPZR9UzqkYhHildPKZe9QyklclZKpNKupAEUi89mmf98I/RSEr3i0EYEv7YoivHORRT+K9dN9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzXD98zElUhwMBN5RotDN73LzzvvQRrCAILMZ2rRO6wcXQimcQ
	+J0IPtOUHDyQXeY29zmU0Mc7e/PeclFJFKfw2AtK66auj0uVKlcXUdLQZsc87nQZups=
X-Gm-Gg: AeBDiesduVbnz02JYC3aey+4icV7W8LIvp54g33i5W+sRUvAEU47mc5NhcOAS6bfjim
	tfBEuq0tOKf2GzHkb8W0zLsyowWMBQGVIpwoZw8sFbLerFwOqUGK/GCZEohR2c/ZCxveW8r/XOs
	J87DsU/XQi7tBr0BuInH2dqoD2WgQThLuS0+2Iemid3EWQzpBFY+wDs+d4BcGn7zOVGbjX6ESoU
	3Yd88EsuqGigCh+CyYxX9HZZTkqSyAAsHpANHcf5ebTI6kOtiv+6Qc09zgilh43t3/XSMRk67g/
	PRPc6ozZsqTXQZgGeaPuAUtp1G77zyJDcJuN1W+IcjjH1dxYNBFcWg/dxZbu0qf8omwExYDx+jB
	L/YEuRPw8yeH8aJKDFe/NaMtMdOUDEa7Xnjt0tQTMJTYqIKBKc2jPH0r+s9Ps2JvpbcAv9oAISj
	DP5tDwcQI2/uO3rkOAjZ+mh1w9AjfJxqkbuuoA2ec4oZJdEdHXGAFQclwP6Vlp+qFcdwqaX/hrH
	5l911KUEkIMcZQAK9KwP+5JtnSOc3pFdkUCXzO97/Ma7swakWIYW4f2nPp6DxjU
X-Received: by 2002:a05:6000:2389:b0:43d:7ea8:62e6 with SMTP id ffacd0b85a97d-43fe3e12691mr27514008f8f.46.1776754544166;
        Mon, 20 Apr 2026 23:55:44 -0700 (PDT)
Message-ID: <97872b47-c7e6-4ee4-89e3-a544900a1310@suse.com>
Date: Tue, 21 Apr 2026 08:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] tools/xenstored: expand special watch handling with
 depth feature
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-8-jgross@suse.com>
 <262d66a0-972d-46e1-80cb-13d29866b874@amd.com>
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
In-Reply-To: <262d66a0-972d-46e1-80cb-13d29866b874@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XBw0IpDbaIgGclcQBWW7oeuZ"
X-purgate-ID: tlsNG-4011c0/1776754544-CEF718B7-FEFC6871/13/0
X-purgate-type: clean
X-purgate-size: 7686
X-Spamd-Result: default: False [-2.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 855444373DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XBw0IpDbaIgGclcQBWW7oeuZ
Content-Type: multipart/mixed; boundary="------------GkrmPigrT1zQ40meD9WIu9Qm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <97872b47-c7e6-4ee4-89e3-a544900a1310@suse.com>
Subject: Re: [PATCH 7/8] tools/xenstored: expand special watch handling with
 depth feature
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-8-jgross@suse.com>
 <262d66a0-972d-46e1-80cb-13d29866b874@amd.com>
In-Reply-To: <262d66a0-972d-46e1-80cb-13d29866b874@amd.com>

--------------GkrmPigrT1zQ40meD9WIu9Qm
Content-Type: multipart/mixed; boundary="------------p8y6aMsHekD9jLgSToO3OH9Y"

--------------p8y6aMsHekD9jLgSToO3OH9Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDQuMjYgMDA6NTUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDMt
MTMgMDM6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaXRoIFhFTlNUT1JFX1NFUlZF
Ul9GRUFUVVJFX1dBVENIREVQVEggYXZhaWxhYmxlLCBzcGVjaWFsIHdhdGNoDQo+PiBoYW5k
bGluZyBuZWVkcyB0byBiZSBleHRlbmRlZDoNCj4+DQo+PiAtIHdoZW4gYSBzcGVjaWFsIHdh
dGNoIGlzIHNldCB3aXRoIGRlcHRoID0gMSwgdGhlIGRvbWlkIGlzIGFkZGVkIHRvDQo+PiDC
oMKgIHRoZSB3YXRjaCBldmVudA0KPj4NCj4+IC0gaXQgaXMgcG9zc2libGUgdG8gd2F0Y2gg
Zm9yIEByZWxlYXNlRG9tYWluLzxkb21pZD4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPj4gQEAgLTY3OCwxMCArNjkzLDEz
IEBAIHN0YXRpYyBpbnQgZG9fY2hlY2tfZG9tYWluKHN0cnVjdCBkb21haW4gKmRvbWFpbiwg
Ym9vbCANCj4+ICpub3RpZnksDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKChzdGF0ZSAm
IFhFTk1BTkFHRV9HRVRET01TVEFURV9TVEFURV9TSFVURE9XTikNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICYmICFkb21haW4tPnNodXRkb3duKSB7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkb21haW4tPnNodXRkb3duID0gdHJ1ZTsNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZpcmVfc3BlY2lhbF93YXRjaGVzKCJAcmVsZWFzZURvbWFpbiIs
IGRvbWFpbi0+ZG9taWQsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFdBVENIX0RPTSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqbm90aWZ5ID0gdHJ1ZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKCEoc3RhdGUgJiBYRU5NQU5BR0VfR0VURE9NU1RBVEVfU1RBVEVf
REVBRCkpDQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCEoc3RhdGUgJiBYRU5NQU5BR0VfR0VU
RE9NU1RBVEVfU1RBVEVfREVBRCkpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAwOw0KPj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gDQo+IFN0cmF5wqAge30gYWRk
aXRpb24/DQoNClllcy4gQW5vdGhlciBhcnRpZmFjdCBmcm9tIHRoZSBldm9sdmluZyBzZXJp
ZXMuDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVr
QGFtZC5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------p8y6aMsHekD9jLgSToO3OH9Y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------p8y6aMsHekD9jLgSToO3OH9Y--

--------------GkrmPigrT1zQ40meD9WIu9Qm--

--------------XBw0IpDbaIgGclcQBWW7oeuZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnnH28FAwAAAAAACgkQsN6d1ii/Ey/m
MQgAlPG0tTWQCgzpf8qVBuDEitgklBzrtwm8a6yjTdno/EDZoH0YyqghRtcGsZ4Inio9WV2K3fcv
496V0tzogbk+H1gvh1MQ+bfwLm1asDR6GbFVnTZg7y7LZalKLbmrBykV9iBECzLYdTUGkejp160X
nV7wGY0U9J1kqMs4KnnIKRHk1MASjMwv7L+V1xbiGvWt00+Lp3YJ9GuEmcc3nrJ4ouLbQyHtFBJw
Vhwr6JiNUtFPRL1EuRaPyRT5ueg1nkw0zu0et3Z6Ss7841zwRoPrlfnGkG7RYBNMahGiljOuhv0t
d1KXoqhQYFS98HjJVcK0xj8dFI2t4sQYmieQpgItTA==
=8odh
-----END PGP SIGNATURE-----

--------------XBw0IpDbaIgGclcQBWW7oeuZ--

