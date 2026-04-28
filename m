Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGaWFLS48GlQXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:40:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BBC4860CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296246.1572657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHifK-0001Du-SZ; Tue, 28 Apr 2026 13:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296246.1572657; Tue, 28 Apr 2026 13:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHifK-0001C3-Px; Tue, 28 Apr 2026 13:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1296246;
 Tue, 28 Apr 2026 13:39:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wHifJ-0001Bv-CW
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:39:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHifI-0056pj-Og
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:39:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b891-bab6-0a2a0a5309dd-0a2a450ce652-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:39:52 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b8a8-62f1-0a2a450c0019-d155d036f0a3-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:39:52 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-67929ff6dbfso4145827a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 06:39:52 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb80c581f6esm105838466b.63.2026.04.28.06.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 06:39:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1777383592; x=1777988392; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gKBUi8AMoisd+yxLpzQyC2tC4IhTDTxwYL/rnEvu6cQ=;
        b=EBCYqwszL7LlwanhUvafyzNbQLR7Cn82q98BWUjxegJ4wECTcMnBJ+fotZq89LgDaJ
         fDu7PqfLyUuSgopMqc685y0UfQ7kin7RB8ewBDzEPo0iJkmfbk3NLMIhAgaZxzkU+QEk
         ROiCNv9rjXm9NNpNYLWwXo5W+Y2YzlbkO3MQOJ6KjhKsFph5hCAh2KSZ+jx/A5OGq0TQ
         guoGpCchT10+lV4tSsNe6gv66UoBVZzBOMMntSy4i2O8zUg8ry6XAz/p6edhnYuup86G
         Y0wSu8vGvOYJlPQ3wrE7YHD94sCZQtbhVf8MAXPfanZqsj9/ixuXfazTtVbgz9xSPxqL
         EglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383592; x=1777988392;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKBUi8AMoisd+yxLpzQyC2tC4IhTDTxwYL/rnEvu6cQ=;
        b=YgY0NBdVztDSHef53a/6oZ/Uya6WawxkSKhbryNT5bQiD2fURUIo7nqCBp4BfOOdFZ
         Xhdcbe/r0lzvRL5ofoaDYuwAi5gjJacgFpSq1hQeetkmY9dibwV/YG/PLp3fJ8rjWFXH
         rPcMjEMY4X/ziJPO9UTHAHXTGoZJdRtRJGBYDm2bVrmMZGUGh0PVLecrmXXy47nUsW1U
         DVrTJg0KsSp8zkKHnnCTcZDIDWddI7DpCjqWD7KM0Y5kJV8MbdUTg51ZYN+ec1Vr/mgw
         ADm7P1Q46HHt7No0MZKEYw6CBTkwBPDEF0ndmLBLl62R6wjXL50emy8zSc86JpptLbB5
         XGeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/z61NkJv3mdw+fDzV/HMokosSWGZiYzjIBXUaXIFOYBMMf0GEJy9Ksqs0gtm8dbuQvIOMYbRlbXfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm3Rq6pzvKqnfkLe67carThCnDRGNHVHLokpxn70Z+UGi0F0qV
	HELwgCl8+b7Dmp0bxNmyKzdRAYGmdr7XbV9ryNxdo2j6MI95LzzZJBMnCrY53WN3jaQ=
X-Gm-Gg: AeBDievCiK1HLe5wYCqU7FCoAyG9jsYUcOYQyZEXU9FDQGxPn5M8ghHbJSadm3RT53h
	1f31S1HB4YVl9p2PC8iJSV1qPYsR8u9/XD18m52efNd8lk9ZKya2VstSW+vsKr8LSk2GplkylGl
	Npi6k7e7gNnmBc7U1rMBDgJmL3QiVdydSMv5koLPc17BAiHVVlOeH/WW2B8FrJvakl0fdZzCKkj
	XLAdqbjTUK8Dw+BSC9weP/wcXVglNLWVeNfCKqd3Q7ZOw3MIViJ9odCa28gNEM6XNbVHB1Okua/
	eK0NPid9611vhZq0CFukswx8wGsk57tMp98NXjDRhicwfRRszkl1pyEzoKBKZHqUyUQgroZknYt
	V37PdcxcXGRGxpysjyyLGJZ4IAyyozjLWJZeIgQKInl6i3vBl8oXu4t0wKLCjTSQ8hMMCNkCRTM
	BA/VsGwdECf3L/jOwr6um/ABdQOch4yEHUslghKbhqjtYaNmaYEmDVwbQxvWcsU0dWAkMdpMf8x
	RDWGe6e1yYsl/oEnoP36dmu7H1i9wVL+AhX63Lqq2DPOqYB2SXBOuRNArsuZyLz
X-Received: by 2002:a17:906:518c:10b0:b98:155e:609 with SMTP id a640c23a62f3a-bb80443e96cmr155266166b.36.1777383591872;
        Tue, 28 Apr 2026 06:39:51 -0700 (PDT)
Message-ID: <0748c0d3-78cd-457e-9e88-fbe19e58c73f@suse.com>
Date: Tue, 28 Apr 2026 15:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] tools/xenstored: add support for "all domains" node
 permission
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-3-jgross@suse.com>
 <b752fdef-9950-45c9-bf0a-bea973c0c861@amd.com>
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
In-Reply-To: <b752fdef-9950-45c9-bf0a-bea973c0c861@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VZVPZuRWvvMMi3ADBV5BO30W"
X-purgate-ID: tlsNG-d25034/1777383592-6DD6BCF5-D11B3E9F/0/0
X-purgate-type: clean
X-purgate-size: 8031
X-Rspamd-Queue-Id: 95BBC4860CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VZVPZuRWvvMMi3ADBV5BO30W
Content-Type: multipart/mixed; boundary="------------qUcR0Z8SQzp2enVRLCA2AQA0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>
Message-ID: <0748c0d3-78cd-457e-9e88-fbe19e58c73f@suse.com>
Subject: Re: [PATCH 2/4] tools/xenstored: add support for "all domains" node
 permission
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-3-jgross@suse.com>
 <b752fdef-9950-45c9-bf0a-bea973c0c861@amd.com>
In-Reply-To: <b752fdef-9950-45c9-bf0a-bea973c0c861@amd.com>

--------------qUcR0Z8SQzp2enVRLCA2AQA0
Content-Type: multipart/mixed; boundary="------------5YUj0EbTPBHAtlQncae2B0OV"

--------------5YUj0EbTPBHAtlQncae2B0OV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjYgMDA6MDAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDQt
MjMgMDQ6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3IgdXNp
bmcgRE9NSURfQU5ZIGluIG5vZGUgcGVybWlzc2lvbnMgdG8gaW5kaWNhdGUgdGhhdA0KPj4g
YWxsIGRvbWFpbnMgYXJlIGFsbG93ZWQgdG8gYWNjZXNzIHRoZSBub2RlLg0KPj4NCj4+IEFk
ZCBhIG5ldyBmZWF0dXJlIGJpdCBmb3IgaW5kaWNhdGluZyB0aGUgc3VwcG9ydCBvZiBET01J
RF9BTlkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPiANCj4gDQo+PiBAQCAtMTc1NCw4ICsxNzU1LDEyIEBAIHN0YXRpYyBib29s
IGNoa19kb21haW5fZ2VuZXJhdGlvbih1bnNpZ25lZCBpbnQgZG9taWQsIA0KPj4gdWludDY0
X3QgZ2VuKQ0KPj4gwqDCoCAqIEFsbG9jYXRlIGFsbCBtaXNzaW5nIHN0cnVjdCBkb21haW4g
cmVmZXJlbmNlZCBieSBhIHBlcm1pc3Npb24gc2V0Lg0KPj4gwqDCoCAqIEFueSBwZXJtaXNz
aW9uIGVudHJpZXMgZm9yIG5vdCBleGlzdGluZyBkb21haW5zIHdpbGwgYmUgbWFya2VkIHRv
IGJlDQo+PiDCoMKgICogaWdub3JlZC4NCj4+ICsgKiBBbiBET01JRF9BTlkgZW50cnkgd2ls
bCBiZSBtYXJrZWQgdG8gYmUgaWdub3JlZCwgaWYgdGhlIHdyaXRpbmcNCj4gDQo+IGEvQW4v
QS8NCg0KWWVzLg0KDQo+IA0KPj4gKyAqIGRvbWFpbiBkb2Vzbid0IGhhdmUgdGhlIFhFTlNU
T1JFX1NFUlZFUl9GRUFUVVJFX0RPTUlEX0FOWSBlbmFibGVkLiBOb3RlDQo+PiArICogdGhh
dCBYZW4gdG9vbHMgd2lsbCBuZXZlciBzZXQgRE9NSURfQU5ZIGZvciBhIGd1ZXN0IG93bmVk
IG5vZGUuDQo+IA0KPiBJJ20gbm90IHN1cmUgYWJvdXQgc3RhdGluZyAiWGVuIHRvb2xzIHdp
bGwgbmV2ZXIiIGhlcmUgc2luY2UgaXQgbWF5IGNoYW5nZSBpbiANCj4gdGhlIGZ1dHVyZSwg
YW5kIHdpbGwgbm90IGJlIHVwZGF0ZWQuwqAgTWF5YmUgIk5vdGUgdGhhdCBYZW4gdG9vbHMg
ZG9uJ3QgY3VycmVudGx5IA0KPiBzZXQgRE9NSURfQU5ZIGZvciBhIGd1ZXN0IG93bmVkIG5v
ZGUsIGFuZCB0aGV5IGFyZW4ndCBleHBlY3RlZCBpbiB0aGUgZnV0dXJlLiI/ICANCj4gQnV0
IG1heWJlIGp1c3QgZHJvcCBpdCBzaW5jZSBJJ20gbm90IHNlZWluZyBtdWNoIHZhbHVlLg0K
DQpUaGUgbWFpbiBpZGVhIGlzIHRoYXQgYSBndWVzdCBub3Qga25vd2luZyBhYm91dCB0aGUg
RE9NSURfQU5ZIGZlYXR1cmUgc2hvdWxkDQpuZXZlciBzZWUgaXQgaW4gdGhlIHBlcm1pc3Np
b25zIG9mIGEgWGVuc3RvcmUgbm9kZSBpdCBpcyBvd25pbmcuDQoNClNvIElNTyBpdCBpcyBh
IG1hbmRhdG9yeSByZXN0cmljdGlvbiBmb3IgWGVuIHRvb2xzIG5vdCB0byBzZXQgaXQgZm9y
IG5vZGVzDQp0aGUgZ3Vlc3QgaXMgb3duaW5nLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTogSmFz
b24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KDQpUaGFua3MsDQoNCg0KSnVl
cmdlbg0K
--------------5YUj0EbTPBHAtlQncae2B0OV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5YUj0EbTPBHAtlQncae2B0OV--

--------------qUcR0Z8SQzp2enVRLCA2AQA0--

--------------VZVPZuRWvvMMi3ADBV5BO30W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnwuKcFAwAAAAAACgkQsN6d1ii/Ey9h
8Af/aiTLS2Y7QTazYSFFe4mns+KVWf24wl4mi2eoO59pnep9ezd449/3FqKtWO9BXn4pq/Tu1W2n
cs+ORkKy+e5Bhz+7u7rwMTBOfcAsRg7XjWtthYyDw/iPB5FUz21Waxqo3sSf2tR5G35Ar68Bze9a
lg+76pveBBxZRTgpIqnr62gS85w3V4q/IPvMcEXgMIgOrpzw5iPzgUUSuxJmG8XGo6Pxmmy5LpUV
KRMiDElGEpbXCzcG+e0tqRz+MXNNlSOyuZ79BFrQ3zAGBEdx5PHrgRDlJqaHN9w44UZxXMapUxKa
xTVQatCcIxxTlmlRcVQZ6S1tdeJ7UpdvG0PCDVGIAA==
=lF/7
-----END PGP SIGNATURE-----

--------------VZVPZuRWvvMMi3ADBV5BO30W--

