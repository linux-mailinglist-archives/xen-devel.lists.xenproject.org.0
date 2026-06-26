Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSSKJIxoPmobFgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:54:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD856CCAA3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:54:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Kk0ATKft;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346065.1604613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd58p-0004BN-5s; Fri, 26 Jun 2026 11:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346065.1604613; Fri, 26 Jun 2026 11:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd58p-00049v-2a; Fri, 26 Jun 2026 11:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1346065;
 Fri, 26 Jun 2026 11:54:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wd58n-00049o-Sr
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 11:54:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd58m-008Axe-Sm
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 13:54:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e6868-5cb7-0a2a0a5109dd-0a2a4506934e-32
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:54:36 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e687c-08de-0a2a45060019-d155d033e11d-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:54:36 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-697763eeafcso1372125a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 04:54:36 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6980afa5051sm1467048a12.9.2026.06.26.04.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 04:54:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1782474876; x=1783079676; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x+TmX7w1PT7vRBJkNR5h2wtF+y+QM/D0BxBTQByurWE=;
        b=Kk0ATKftjKrNk0nHNNvYtQ2XFG6L2cwtcVQdXAMmtiEEv8bFv5yqU1nqs7WxzyWRxN
         ErlVJZ/1FL4KLOOzAHwsCeX3/fM4dTAADFtz1fENb6I4aA9VozWA1xoWaUeCsn/MUJae
         qssIVsUdhdFLltIhkK0S/q+SVte7Qc15aiTs4cuGFAToEHTlYaUtANBnlHx27ZLuX9tE
         ymYpk7XzNi1lXpkHm1hKMq2TYZ3GsYNt/9Q7x1FSlOOjRJNmZiGkDuc1qUIy8bUAzm+/
         yaTDZG0Hj6210shuOVRe4l6gYlRg0J0ZuEVtTN/pt379F3uDyPy/W64pd5Y9MPDR0b7+
         TY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474876; x=1783079676;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+TmX7w1PT7vRBJkNR5h2wtF+y+QM/D0BxBTQByurWE=;
        b=p28hG/ZRsMQvPCI4A56j0heHf67fV0j68tpZJQpzaIXmVcDHshLXddbRY/7E7kq5Ls
         9nnEk3sMOlC4dqsE0p4KMPDG65Ugpd0u2BSZMfRoMA8gfgHT1Jm/FDadChDVKU09RAXO
         owj+zZyHm2o20Up7uQN2UnlMcqOFQbJyCjRHmHnwQ5yYySHrHXGX8gdfovY70wGq5BDN
         HY40AI7vB78gIhY5AmHYrFwXVKLqJMXFC0D8V76HVOW5gPY7kEhvcZq0N8LI/u8GAXhF
         lcuNdzSeyx3ExH5Q7B7gJr4GACWFOASeGw6wQFQwWHfxF+btyDqHUivMRN+vuuPaJzgX
         3fzg==
X-Forwarded-Encrypted: i=1; AHgh+Rpj5vwIFmLFdKixgY9DSXxOp9N38mxDkAvZZmE9OeiNazr3Ni2TXkcEX9XNESlXpkFvDPLyUMgl7G0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNqBpYqsNekx6xP9YvvrIUOTAewmzOX93U5lN1ncJGcz0d8Tow
	7qwYheZ1CCsHSpUxJ4aiboHeA60c7hSl6ecechSpYT3KFIlkvhPtLE80MyMFCeSuE8M=
X-Gm-Gg: AfdE7cmOT6XaBfJdva7HlH2glr+593yti7ZGTVYIOJsmV6gM19i+VZdvRR2DUuIZGhG
	akst8MIXE3eL3YYysC1k9ztPSNyIzzg4RN9cfsgvNqg+3wH57r2uz87IkGmHlNuy1Jst1KTJidm
	IIgIsdbklfqusxA+GXb9prEoBZt12Qg/mF6UD3HoEZ7P6YgEdemSh2K93ZbJuvPTndWiF6VnWY3
	r++wmwQscQDxUqucLqg+bANpDFr9cKfRY763mG0iRezFar5k0P3HiC02kriF3SD1IFxK2eAPIYW
	SdCBxftTeDPKq8bgD4pw/jOPzML0ooZHBbkyagEagS9UNQygljpUY24mC+fdbcXGYwtjf0gqiRd
	ia/g3Jv2+6Yuad7I44VwpRF8kZOwk+UML4SjItG/sO/+Z9fadrkZjFFEB4eZeaXMtaPFvputUsY
	aDH5VaTUn98d+lMCn0g5ROHl8mgAbhXxiCDwlmAgXHOt0e+qz3McJieGAs07QBjCIfPk4qob9nD
	kodvYC7nU1IOCen6UcPTRnK8OjeEqL1YxGp4roffGc=
X-Received: by 2002:a05:6402:35cc:b0:697:8341:9e40 with SMTP id 4fb4d7f45d1cf-69810a5c974mr1962877a12.5.1782474876237;
        Fri, 26 Jun 2026 04:54:36 -0700 (PDT)
Message-ID: <7088227e-f9d7-4f7e-89d4-3f867e41e17e@suse.com>
Date: Fri, 26 Jun 2026 13:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/gntdev: fix error handling in ioctl
To: Wentao Liang <vulab@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260622112541.38194-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20260622112541.38194-1-vulab@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ikMPtP8pqTe7gsOWzBPSZl5g"
X-purgate-ID: tlsNG-16d1c6/1782474876-F81E568D-1913633D/0/0
X-purgate-type: clean
X-purgate-size: 7497
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AD856CCAA3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ikMPtP8pqTe7gsOWzBPSZl5g
Content-Type: multipart/mixed; boundary="------------AbOhyCuRAqPHWB6rPr7RMyXb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Wentao Liang <vulab@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <7088227e-f9d7-4f7e-89d4-3f867e41e17e@suse.com>
Subject: Re: [PATCH v2] xen/gntdev: fix error handling in ioctl
References: <20260622112541.38194-1-vulab@iscas.ac.cn>
In-Reply-To: <20260622112541.38194-1-vulab@iscas.ac.cn>

--------------AbOhyCuRAqPHWB6rPr7RMyXb
Content-Type: multipart/mixed; boundary="------------LYTs8NATEmO7mUClhECJ0Njj"

--------------LYTs8NATEmO7mUClhECJ0Njj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDYuMjYgMTM6MjUsIFdlbnRhbyBMaWFuZyB3cm90ZToNCj4gV2hlbiBnbnRkZXZf
aW9jdGxfbWFwX2dyYW50X3JlZigpIGZhaWxzIHRvIGNvcHkgdGhlIG9wZXJhdGlvbiByZXN1
bHQNCj4gYmFjayB0byB1c2Vyc3BhY2UgYWZ0ZXIgc3VjY2Vzc2Z1bGx5IGFkZGluZyB0aGUg
bWFwcGluZyB0byB0aGUgbGlzdCwNCj4gdGhlIGVycm9yIHBhdGggcmV0dXJucyAtRUZBVUxU
IHdpdGhvdXQgcmVsZWFzaW5nIHRoZSByZWZlcmVuY2UNCj4gYWNxdWlyZWQgYnkgZ250ZGV2
X2FsbG9jX21hcCgpLiBUaGUgbWFwcGluZyByZW1haW5zIGluIHByaXYtPm1hcHMNCj4gd2l0
aCBhIHJlZmNvdW50IG9mIDEsIGNhdXNpbmcgYSBtZW1vcnkgbGVhayBhbmQgYSBkYW5nbGlu
ZyBsaXN0DQo+IGVudHJ5Lg0KPiANCj4gQWRkaXRpb25hbGx5LCBnbnRkZXZfYWRkX21hcCgp
IG1heSBtb2RpZnkgbWFwLT5pbmRleCB0byBhdm9pZCBvdmVybGFwDQo+IHdpdGggZXhpc3Rp
bmcgbWFwcGluZ3MuIFRoZXJlZm9yZSwgdGhlIGluZGV4IHJldHVybmVkIHRvIHVzZXJzcGFj
ZQ0KPiBtdXN0IGJlIG9idGFpbmVkIGFmdGVyIGdudGRldl9hZGRfbWFwKCkgY29tcGxldGVz
Lg0KPiANCj4gRml4IHRoaXMgYnkgaG9sZGluZyB0aGUgbXV0ZXggYWNyb3NzIGdudGRldl9h
ZGRfbWFwKCksIHJldHJpZXZpbmcNCj4gdGhlIGNvcnJlY3QgaW5kZXgsIGFuZCBjb3B5X3Rv
X3VzZXIoKS4gSWYgY29weV90b191c2VyKCkgZmFpbHMsDQo+IHJlbW92ZSB0aGUgbWFwcGlu
ZyBmcm9tIHRoZSBsaXN0IGFuZCByZWxlYXNlIHRoZSByZWZlcmVuY2Ugd2hpbGUNCj4gc3Rp
bGwgaG9sZGluZyB0aGUgbG9jay4NCj4gDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
DQo+IA0KPiBGaXggdGhlc2UgaXNzdWVzIGJ5IHByb3Blcmx5IGhhbmRsaW5nIGFsbCBlcnJv
ciBjYXNlcy4NCj4gDQo+IEZpeGVzOiAxNDAxYzAwZTU5ZWEgKCJ4ZW4vZ250ZGV2OiBjb252
ZXJ0IHByaXYtPmxvY2sgdG8gYSBtdXRleCIpDQo+IEZpeGVzOiA2OGIwMjVjODEzYzIgKCJ4
ZW4tZ250ZGV2OiBBZGQgcmVmZXJlbmNlIGNvdW50aW5nIHRvIG1hcHMiKQ0KPiANCj4gU2ln
bmVkLW9mZi1ieTogV2VudGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4NCg0KUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------LYTs8NATEmO7mUClhECJ0Njj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------LYTs8NATEmO7mUClhECJ0Njj--

--------------AbOhyCuRAqPHWB6rPr7RMyXb--

--------------ikMPtP8pqTe7gsOWzBPSZl5g
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmo+aHoFAwAAAAAACgkQsN6d1ii/Ey/o
4wf/ZQZ7RIw0FtWPZ37MjXZ2h92+r+v1EGz3o/z1P8cYfQpS6d5uDR77zw3DO2dSVWlLfakoB/8m
Me/mhHJrk51E2ooZWuuxCYU5l8GjnGh6IUIhvPBrE0k6WilEZJadLWn8ZBs73vZRb8PMG9qO3qXk
3jugNgK0kZIiYd+XQLRFbCYmcLjA8DmgOqELPdeAfFOeJRmMJWoSOoG0oRjWNh+xTd5FEWPcqIIv
W4UYQtM3XwqEjDh1Y6gLBno8XylRkZMsgK8xJUzRxoybbmRdkGEHcKUsrcXxSW6SQ0dOPbXszoAo
x5LsflKqGCvbBRC9QMKwTsOMqozPDpoe1x0gGYMhzQ==
=kSOp
-----END PGP SIGNATURE-----

--------------ikMPtP8pqTe7gsOWzBPSZl5g--

