Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bnPvHjFsV2r5NgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 13:17:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9CD75D794
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 13:17:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JIYp3ouH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1362958.1614801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxbU-0002Vz-Fh; Wed, 15 Jul 2026 11:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362958.1614801; Wed, 15 Jul 2026 11:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxbU-0002Ts-CM; Wed, 15 Jul 2026 11:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1362958;
 Wed, 15 Jul 2026 11:16:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wjxbT-0002Tk-1f
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 11:16:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjxbS-00Eacf-7a
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:16:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a576c0b-e002-0a2a0a5209dd-0a2a4504e162-18
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:16:38 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a576c15-b57f-0a2a45040019-d155d02fb886-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:16:38 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-698ae09e356so7531259a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 04:16:38 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c16871711b9sm8345666b.18.2026.07.15.04.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 04:16:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1784114197; x=1784718997; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wE4oaZ2FZnhnXtcUIMMYG3E08s6pqg5r9FH8iZCG6c4=;
        b=JIYp3ouHI1znUaOc307N6b0Lb1KP0ym4A6QDznra5B5eFx5XRhc5vPjL8+4qmsqfBG
         rvHfSqGWO6Aik+ZFuBmx/nJfnAQ/6K2HfZSViozdkePlsBkxTkb/4coZahxOStMB4c1O
         wayCcZWJG3LB7nmHrTFvaTQ7AxilrxPAxkyfG5Wm4SasQSc42KqNq4K5iZJ1G7vGXYVf
         QXJlZfa5rel972LVIanPTNrLzD4H/dPtfZAM2mCjZXk1TXo1Yf09ZK3XVpFBaTveS3JP
         UhreXTfzSeTVt9nfc7vSIM75ufqg3FL0UShzLpWgL9SjC3K8L4Bef1sVg9MKUeWdj4lB
         jKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784114197; x=1784718997;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wE4oaZ2FZnhnXtcUIMMYG3E08s6pqg5r9FH8iZCG6c4=;
        b=AzigpHCJm2czQWiKMnPq9Sn+CO/TJUNnBxIc3MpuDxT3zSqq05WbHLlBsDiJS1kd8C
         MfRM4KAknD8P9lM4ebof32vcHd2FB1nBAZ7McKPgu8LU3xPX7bLyZftNHgs0xvF/TquP
         XFLrLUp+SEVUl6TjGqFvBVNxOYaj2BRFT08WnZ4kGmmQMyQbU5Aozd30h5zSeXY/MQEA
         vaAdQOydaaoOVtJpitlOlFWEp0Y7SXb9+8zlDncnsBN16LzAnd+75/C23Lwb/HBKRdlh
         KbuAXY6ZOAvGMnPVhWO22sRe53z4wk0poy9pNe8073x++yD0/JHW1sfZ1q6KesQEY3rw
         lMdw==
X-Gm-Message-State: AOJu0YwxWFOSgYC0EV4F1ga0en2uWQ053C8N/4N1YYftYtZJvHhcoufA
	yQAJvCfPmAaGf1sKPvLqfB/+G1Q5BrNpyWSDdbe48km//am4/VvQNAZ0CJ4XO6KKABk=
X-Gm-Gg: AfdE7cmR68QKpBHCvNjjBSzEqJyUcYCv6da5z2UfBcFEkrmmeiiu1i0t2cdRUSKZ52r
	m99MdYbDY3XngqyjjV1KkDxyjiit4sQ1d5vHEgjonGBQ4MA+OTIqX4Wb4dPXz447svfNLP94RLj
	jSfqdSg60LhqmkCO18Lh97kpaG2+IyWsT4JOsdfL7qzFFVc00OdjfZnAW1apaJ6o2UDE8B3pPp6
	o0SHTjEC4e/dvO4rqgBLiq7VXyQeBjf5nY+tlfj6EPa4Lg1fLxEl+tdSyu3c8aX/T0Uw3S8rAfj
	8nfT8f8at6SYg0rO58a8cPdmLMQKXA5q9oymOWaid0chGwa5URRQ56X79rawSE18EfMW64DwhqB
	q2iQVO6zi69rMe9Q8EuwwqskgzXARlWQtbnXOnUmhKoEQJUqnutlZI4pwODEEGrevWtgETDsTPw
	BQBM/Dx71seAC/HgUBlobdfpy2gRQxbNNa0lX1GUfqqFP9QiMKTG+VN82bNZe7v2eORWIcRoQgm
	JWA7s1O71gYYARrXnWgTzgFz8y2hs/6IIBVzG80JR/0BIpBRWWiLA==
X-Received: by 2002:a17:907:7292:b0:c16:29eb:e84a with SMTP id a640c23a62f3a-c1667b8bfdemr394641766b.53.1784114197464;
        Wed, 15 Jul 2026 04:16:37 -0700 (PDT)
Message-ID: <4921562b-7499-48ea-b156-8b698696096e@suse.com>
Date: Wed, 15 Jul 2026 13:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Intermittent kernel WARN in mm.h get_page() when forcefully
 removing a xen_netfront interface from xenstore
To: Pedro Falcato <pfalcato@suse.de>, Aaron Rainbolt <arraybolt3@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, marmarek@invisiblethingslab.com, adrelanos@whonix.org,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>
References: <20260714234912.7a75536b@gmail.com>
 <aldj4Jwd5T9q1-sK@pedro-suse.lan>
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
In-Reply-To: <aldj4Jwd5T9q1-sK@pedro-suse.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9PzraffvGSbQX5hcKKOy1gCj"
X-purgate-ID: tlsNG-ebf023/1784114198-512DCB50-F71E97F4/0/0
X-purgate-type: clean
X-purgate-size: 15761
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.53 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,pages.debian.net:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_TO(0.00)[suse.de,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pfalcato@suse.de,m:arraybolt3@gmail.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:marmarek@invisiblethingslab.com,m:adrelanos@whonix.org,m:willy@infradead.org,m:vbabka@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD9CD75D794

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9PzraffvGSbQX5hcKKOy1gCj
Content-Type: multipart/mixed; boundary="------------5A5IDla0CQpeQJxHowbs9P6T";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Pedro Falcato <pfalcato@suse.de>, Aaron Rainbolt <arraybolt3@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, marmarek@invisiblethingslab.com, adrelanos@whonix.org,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>
Message-ID: <4921562b-7499-48ea-b156-8b698696096e@suse.com>
Subject: Re: Intermittent kernel WARN in mm.h get_page() when forcefully
 removing a xen_netfront interface from xenstore
References: <20260714234912.7a75536b@gmail.com>
 <aldj4Jwd5T9q1-sK@pedro-suse.lan>
In-Reply-To: <aldj4Jwd5T9q1-sK@pedro-suse.lan>

--------------5A5IDla0CQpeQJxHowbs9P6T
Content-Type: multipart/mixed; boundary="------------xqU75XnK0jVGADtSi0vvwhbS"

--------------xqU75XnK0jVGADtSi0vvwhbS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDcuMjYgMTM6MDIsIFBlZHJvIEZhbGNhdG8gd3JvdGU6DQo+ICtDYyBXaWxseSwg
Vmxhc3RpbWlsDQo+IA0KPiBPbiBUdWUsIEp1bCAxNCwgMjAyNiBhdCAxMTo0OToxMlBNIC0w
NDAwLCBBYXJvbiBSYWluYm9sdCB3cm90ZToNCj4+IEEgdXNlciBpbiB0aGUgUXViZXMgT1Mg
aXNzdWUgdHJhY2tlciByZXBvcnRlZCB0aGF0IHRoZXkgY291bGQgY2F1c2UNCj4+IGtlcm5l
bCBXQVJOcyBpbiBzb21lIG9mIHRoZWlyIEFwcFZNcyB3aGVuIGZvcmNpYmx5IHRlcm1pbmF0
aW5nIGEgTmV0Vk0NCj4+IHRoYXQgdGhvc2UgQXBwVk1zIHdlcmUgY29ubmVjdGVkIHRvLiBb
MV0gVHlwaWNhbGx5LCBhIG1lc3NhZ2Ugc3VjaCBhcw0KPj4gYHZpZiB2aWYtMDogeGVuYnVz
OiBkZXZpY2UgZm9yY2VmdWxseSByZW1vdmVkIGZyb20geGVuc3RvcmVgIGFwcGVhcnMsDQo+
PiB0aGVuIGEgIldBUk5JTkciIGFwcGVhcnMgaW1tZWRpYXRlbHkgdGhlcmVhZnRlciBpbmRp
Y2F0aW5nIGFuIGlzc3VlIGluDQo+PiBgeGVubmV0X2Rpc2Nvbm5lY3RfYmFja2VuZGAsIHdp
dGggdGhlIGxpbmUgb2YgY29kZSB0aHJvd2luZyB0aGUgd2FybmluZw0KPj4gYmVpbmcgc29t
ZXdoZXJlIGluIGBpbmNsdWRlL2xpbnV4L21tLmhgLiBPcmlnaW5hbGx5IGl0IHdhcyB0aG91
Z2h0IHRoYXQNCj4+IHRoZSB3YXJuaW5nIHdhcyBzaW1wbHkgbm9ybWFsIGJlaGF2aW9yIHdo
ZW4gYSBkZXZpY2UgaXMgZm9yY2VmdWxseQ0KPj4gcmVtb3ZlZCwgYnV0IGl0IHNlZW1lZCB2
ZXJ5IHdlaXJkIHRoYXQgbWVtb3J5IG1hbmFnZW1lbnQgY29kZSB3b3VsZCBiZQ0KPj4gaW4g
Y2hhcmdlIG9mIHRyaWdnZXJpbmcgdGhhdCB3YXJuaW5nLiBGdXJ0aGVybW9yZSwgSSBjYW5u
b3QgcmVwcm9kdWNlDQo+PiB0aGUgaXNzdWUgcmVsaWFibHk7IGZvciBzb21lIHVzZXJzLCBp
dCBoYXBwZW5zIGltbWVkaWF0ZWx5IGFmdGVyDQo+PiBzaHV0dGluZyBkb3duIHRoZSBOZXRW
TSwgd2hlcmVhcyBmb3IgbWUsIEkgaGFkIHRvIHVzZSBtdWx0aXBsZSB0cmlja3MNCj4+IGlu
Y2x1ZGluZyBwYXVzaW5nIGFuZCB1bnBhdXNpbmcgYSBWTSB0byB0cmlnZ2VyIGl0LiBBZnRl
ciBzb21lDQo+PiBmaWRkbGluZywgSSB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3Vl
IHVzaW5nIHRoZSBsYXRlc3Qgc3RhYmxlDQo+PiA3LjEuMyBrZXJuZWw6DQo+Pg0KPj4gMS4g
T24gYSBXaG9uaXgtV29ya3N0YXRpb24gMTggQXBwVk0gKHN1Y2ggYXMgYW5vbi13aG9uaXgp
LCBidWlsZCBrZXJuZWwNCj4+ICAgICA3LjEuMyB1c2luZyB0aGUgc3RlcHMgZnJvbQ0KPj4g
ICAgIGh0dHBzOi8va2VybmVsLXRlYW0ucGFnZXMuZGViaWFuLm5ldC9rZXJuZWwtaGFuZGJv
b2svY2gtY29tbW9uLXRhc2tzLmh0bWwjcy1jb21tb24tc2l6ZSwNCj4+ICAgICBlbnN1cmlu
ZyB0aGF0IGRlYnVnIGluZm8gaXMgZW5hYmxlZC4gVXNlIERlYmlhbidzIGtlcm5lbCBjb25m
aWcgZnJvbQ0KPj4gICAgIHRoZSBsaW51eC1iYXNlLTcuMS4zK2RlYjE0LWFtZDY0XzcuMS4z
LTFfYW1kNjQuZGViIHBhY2thZ2UgYXMgdGhlDQo+PiAgICAgc3RhcnRpbmcga2VybmVsIGNv
bmZpZy4NCj4+IDIuIEluc3RhbGwgdGhlIG5ldyBrZXJuZWwgaW50byBhIGNsb25lZCBXaG9u
aXgtV29ya3N0YXRpb24gMTggdGVtcGxhdGUuDQo+PiAzLiBJbnN0YWxsIHB2Z3J1YiBpbiBk
b20wOiBgc3VkbyBxdWJlcy1kb20wLXVwZGF0ZSAtLWFjdGlvbj1pbnN0YWxsDQo+PiAgICAg
Z3J1YjIteGVuLXB2aGANCj4+IDQuIENyZWF0ZSBhIG5ldyBBcHBWTSBuYW1lZCBgYW5vbi13
aG9uaXgta2VybnRlc3RgIGJhc2VkIG9uIHRoaXMNCj4+ICAgICB0ZW1wbGF0ZS4NCj4+IDUu
IFNldCB0aGUga2VybmVsIGZvciBgYW5vbi13aG9uaXgta2VybnRlc3RgIHRvIGBwdmdydWIy
LXB2aGAuDQo+PiA2LiBTdGFydCBgYW5vbi13aG9uaXgta2VybnRlc3RgLg0KPj4gNy4gUnVu
IGB1bmFtZSAtcmAgaW4gYGFub24td2hvbml4LWtlcm50ZXN0YCwgZW5zdXJlIHRoYXQgdGhl
IGtlcm5lbA0KPj4gICAgIHZlcnNpb24gZGlzcGxheWVkIGlzIDcuMS4zLg0KPj4gOC4gT3Bl
biBhIHJvb3QgUVRlcm1pbmFsIHdpbmRvdyBpbiBgYW5vbi13aG9uaXgta2VybnRlc3RgIGJ5
IHJ1bm5pbmcNCj4+ICAgICB0aGUgZm9sbG93aW5nIGluIGRvbTA6IGBxdm0tcnVuIC11IHJv
b3QgYW5vbi13aG9uaXgta2VybnRlc3QNCj4+ICAgICBxdGVybWluYWxgLg0KPj4gOS4gSW4g
dGhlIHJvb3QgUVRlcm1pbmFsIHdpbmRvdywgcnVuIGBzeXNjdGwga2VybmVsLndhcm5fbGlt
aXQ9NWAgdG8NCj4+ICAgICBwcmV2ZW50IGFuIGltbWVkaWF0ZSBrZXJuZWwgcGFuaWMgd2hl
biB0aGUga2VybmVsIHdhcm4gb2NjdXJzLg0KPj4gMTAuIE9wZW4gVG9yIEJyb3dzZXIgaW4g
YGFub24td2hvbml4LWtlcm50ZXN0YCwgYW5kIGF0dGVtcHQgdG8gbmF2aWdhdGUNCj4+ICAg
ICAgdG8gYSBmYWlybHkgcmVzb3VyY2UtaW50ZW5zaXZlIHdlYiBwYWdlIGxpa2UgUmVkZGl0
J3MgZnJvbnQgcGFnZS4NCj4+IDExLiBXaGlsZSB0aGUgcGFnZSBpcyBzdGlsbCBsb2FkaW5n
LCBydW4gYHF2bS1wYXVzZQ0KPj4gICAgICBhbm9uLXdob25peC1rZXJudGVzdGAgaW4gZG9t
MCB0byBmcmVlemUgdGhlIEFwcFZNLg0KPj4gMTIuIEluIGRvbTAsIHJ1biBgcXZtLWtpbGwg
c3lzLXdob25peGAuDQo+PiAxMy4gV2FpdCBhIGZldyBzZWNvbmRzLCB0aGVuIHJ1biBgcXZt
LXVucGF1c2UgYW5vbi13aG9uaXgta2VybnRlc3RgIHRvDQo+PiAgICAgIHVuZnJlZXplIHRo
ZSBBcHBWTS4NCj4+IDE0LiBJbiB0aGUgcm9vdCBRVGVybWluYWwgd2luZG93IG9mIGBhbm9u
LXdob25peC1rZXJudGVzdGAsIHJ1biBgZG1lc2cNCj4+ICAgICAgLXdgIHRvIHdhdGNoIGZv
ciBrZXJuZWwgbWVzc2FnZXMuDQo+PiAxNS4gV2FpdCBhIGZldyBzZWNvbmRzLCB0aGVuIHN0
YXJ0IGBzeXMtd2hvbml4YC4gUXViZXMgT1Mgd2lsbCByZWF0dGFjaA0KPj4gICAgICB0aGUg
bmV0d29yayB3aGVuIHRoaXMgaXMgZG9uZSAodGhlcmUgaXMgdGhlIGVxdWl2YWxlbnQgb2Yg
YHhsDQo+PiAgICAgIG5ldHdvcmstYXR0YWNoYCBkb25lIGJ5IHRoZSBRdWJlcyBjb2RlIGF1
dG9tYXRpY2FsbHkpLiBUaGUgZm9sbG93aW5nDQo+PiAgICAgIG1lc3NhZ2VzIHNob3VsZCBh
cHBlYXIgaW4gZG1lc2c6DQo+Pg0KPj4gICAgICBbICA0MjYuNjA5MDA0XSB2aWYgdmlmLTA6
IHhlbmJ1czogZGV2aWNlIGZvcmNlZnVsbHkgcmVtb3ZlZCBmcm9tIHhlbnN0b3JlDQo+PiAg
ICAgIFsgIDQyNi42MDkyNDJdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQ0KPj4gICAgICBbICA0MjYuNjA5MjU0XSBXQVJOSU5HOiAuL2luY2x1ZGUvbGludXgvbW0u
aDoyMDk3IGF0IHhlbm5ldF9kaXNjb25uZWN0X2JhY2tlbmQrMHgxYzcvMHg1MjAgW3hlbl9u
ZXRmcm9udF0sIENQVSMwOiB4ZW53YXRjaC82NA0KPj4gICAgICBbICA0MjYuNjA5MjY5XSBN
b2R1bGVzIGxpbmtlZCBpbjogc25kX3NlcV9kdW1teShFKSBzbmRfaHJ0aW1lcihFKSBzbmRf
c2VxKEUpIHNuZF9zZXFfZGV2aWNlKEUpIHNuZF90aW1lcihFKSBzbmQoRSkgc291bmRjb3Jl
KEUpIGNmZzgwMjExKEUpIG5sc19hc2NpaShFKSBubHNfY3A0MzcoRSkgdmZhdChFKSBmYXQo
RSkgcmZraWxsKEUpIHhlbmZzKEUpIG5mdF9yZWplY3RfaW5ldChFKSBuZl9yZWplY3RfaXB2
NChFKSBuZl9yZWplY3RfaXB2NihFKSBuZnRfcmVqZWN0KEUpIG5mdF9jdChFKSBuZl9jb25u
dHJhY2soRSkgbmZfZGVmcmFnX2lwdjYoRSkgbmZfZGVmcmFnX2lwdjQoRSkgbmZfdGFibGVz
KEUpIGJpbmZtdF9taXNjKEUpIGludGVsX3JhcGxfbXNyKEUpIGludGVsX3JhcGxfY29tbW9u
KEUpIGludGVsX3VuY29yZV9mcmVxdWVuY3lfY29tbW9uKEUpIGludGVsX3BtY19zc3JhbV90
ZWxlbWV0cnkoRSkgaW50ZWxfdnNlYyhFKSBhZXNuaV9pbnRlbChFKSBnZjEyOG11bChFKSB4
ZW5fbmV0ZnJvbnQoRSkgeGVuX3ByaXZjbWQoRSkgeGVuX2dudGRldihFKSB4ZW5fZ250YWxs
b2MoRSkgeGVuX2Jsa2JhY2soRSkgZHJtKEUpIHhlbl9ldnRjaG4oRSkgaml0dGVyZW50cm9w
eV9ybmcoRSkgbGlic2hhMyhFKSBsb29wKEUpIGNvbmZpZ2ZzKEUpIGVmaV9wc3RvcmUoRSkg
bmZuZXRsaW5rKEUpIGlwX3RhYmxlcyhFKSB4X3RhYmxlcyhFKSBhdXRvZnM0KEUpIGV4dDQo
RSkgY3JjMTYoRSkgbWJjYWNoZShFKSBqYmQyKEUpIGRtX3NuYXBzaG90KEUpIGRtX2J1Zmlv
KEUpIGRtX21vZChFKSB4ZW5fYmxrZnJvbnQoRSkNCj4+ICAgICAgWyAgNDI2LjYwOTMzNF0g
Q1BVOiAwIFVJRDogMCBQSUQ6IDY0IENvbW06IHhlbndhdGNoIFRhaW50ZWQ6IEcgICAgICAg
ICAgICBFICAgICAgIDcuMS4zICM1IFBSRUVNUFQobGF6eSkNCj4+ICAgICAgWyAgNDI2LjYw
OTM0MF0gVGFpbnRlZDogW0VdPVVOU0lHTkVEX01PRFVMRQ0KPj4gICAgICBbICA0MjYuNjA5
MzQzXSBSSVA6IDAwMTA6eGVubmV0X2Rpc2Nvbm5lY3RfYmFja2VuZCsweDFjNy8weDUyMCBb
eGVuX25ldGZyb250XQ0KPj4gICAgICBbICA0MjYuNjA5MzQ5XSBDb2RlOiA5NCBkZCBhMCAx
MCAwMCAwMCA0OCA4YiA0YSAwOCA0OCA4OSBjZSA4MyBlNiAwMSA0OCA4MyBlZSAwMSA0OCAw
OSBmMSA0OCAyMSBjYSAwZiBiNiA0YSAzMyA4MSBmOSBmNSAwMCAwMCAwMCAwZiA4NSBlYSBm
ZSBmZiBmZiA8MGY+IDBiIDQ5IDgxIGZmIDAwIDAxIDAwIDAwIDBmIDgyIGY4IGZlIGZmIGZm
IDRjIDg5IGZlIDQ4IGM3IGM3IGUwDQo+PiAgICAgIFsgIDQyNi42MDkzNTJdIFJTUDogMDAx
ODpmZmZmY2UzZDgxMGMzYzk4IEVGTEFHUzogMDAwMTAyNDYNCj4+ICAgICAgWyAgNDI2LjYw
OTM1Nl0gUkFYOiAwMDAwMDAwMDAwMDAwMDEwIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6
IDAwMDAwMDAwMDAwMDAwZjUNCj4+ICAgICAgWyAgNDI2LjYwOTM1OF0gUkRYOiBmZmZmZmIw
ZDgwY2E5ODAwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IGZmZmZmZmZmODhjOGE4YTAN
Cj4+ICAgICAgWyAgNDI2LjYwOTM2MF0gUkJQOiBmZmZmOGRlYzUxZGYwMDAwIFIwODogZmZm
ZjhkZWJmNGRkNWE4MCBSMDk6IGZmZmY4ZGViZjRkZDVhODANCj4+ICAgICAgWyAgNDI2LjYw
OTM2Ml0gUjEwOiAwMDAwMDAwMDAwMDAwMDIwIFIxMTogMDAwMDAwMDAwMDAwMDBiZiBSMTI6
IDAwMDAwMDAwMDAwMDAwMDANCj4+ICAgICAgWyAgNDI2LjYwOTM2NF0gUjEzOiBmZmZmOGRl
YzhlZjMwYjgwIFIxNDogZmZmZjhkZWMxOTdmY2FjMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4+ICAgICAgWyAgNDI2LjYwOTM2Nl0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdT
OmZmZmY4ZGVkMmQxMjkwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4gICAg
ICBbICA0MjYuNjA5MzY5XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAw
MDAwMDgwMDUwMDMzDQo+PiAgICAgIFsgIDQyNi42MDkzNzBdIENSMjogMDAwMDVmYWExYTdk
MzczNyBDUjM6IDAwMDAwMDAwYjQyMGEwMDMgQ1I0OiAwMDAwMDAwMDAwNzcwZWYwDQo+PiAg
ICAgIFsgIDQyNi42MDkzNzddIFBLUlU6IDU1NTU1NTU0DQo+PiAgICAgIFsgIDQyNi42MDkz
NzldIENhbGwgVHJhY2U6DQo+IA0KPiBUaGlzIGlzIGR1ZSAob3IgbG9va3MgbGlrZSBpdC4u
LikgdG8NCj4gc3RhdGljIG5ldGRldl90eF90IHhlbm5ldF9zdGFydF94bWl0KHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpDQo+IFsuLi5dDQo+IHBhZ2Ug
PSB2aXJ0X3RvX3BhZ2Uoc2tiLT5kYXRhKTsgLyogc2tiLT5kYXRhIGlzIGEgc2xhYiBrbWFs
bG9jYXRpb24gKi8NCj4gLyogLi4uICovDQo+IAlpbmZvLnBhZ2UgPSBwYWdlOw0KPiAJZmly
c3RfdHggPSB4ZW5uZXRfbWFrZV9maXJzdF90eHJlcSgmaW5mbywgb2Zmc2V0LCBsZW4pOw0K
PiAvKiAuLi4gKi8NCj4gcXVldWUtPmdyYW50X3R4X3BhZ2VbaV0gPSBwYWdlOw0KPiANCj4g
YW5kIHRoZW4gbGF0ZXINCj4gDQo+IHN0YXRpYyB2b2lkIHhlbm5ldF9kaXNjb25uZWN0X2Jh
Y2tlbmQoc3RydWN0IG5ldGZyb250X2luZm8gKmluZm8pDQo+IC8qIC4uLiAqLw0KPiB4ZW5u
ZXRfcmVsZWFzZV90eF9idWZzDQo+IGdldF9wYWdlKHF1ZXVlLT5ncmFudF90eF9wYWdlW2ld
KTsNCj4gZ250dGFiX2VuZF9mb3JlaWduX2FjY2VzcyhxdWV1ZS0+Z3JhbnRfdHhfcmVmW2ld
LA0KPiAJCQkgIHF1ZXVlLT5ncmFudF90eF9wYWdlW2ldKTsNCj4gDQo+IHdoaWNoIG1heSB0
cmlnZ2VyIGdldF9wYWdlKCkgb24gYSBzbGFiIHBhZ2U6DQo+IHN0YXRpYyBpbmxpbmUgdm9p
ZCBnZXRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkNCj4gew0KPiAJc3RydWN0IGZvbGlvICpm
b2xpbyA9IHBhZ2VfZm9saW8ocGFnZSk7DQo+IAlpZiAoV0FSTl9PTl9PTkNFKGZvbGlvX3Rl
c3Rfc2xhYihmb2xpbykpKQ0KPiAJCXJldHVybjsNCj4gCWlmIChXQVJOX09OX09OQ0UoZm9s
aW9fdGVzdF9sYXJnZV9rbWFsbG9jKGZvbGlvKSkpDQo+IAkJcmV0dXJuOw0KPiAJZm9saW9f
Z2V0KGZvbGlvKTsNCj4gfQ0KPiANCj4gYW5kIHRoZXJlJ3MgeW91ciBXQVJOLiBUaGUgY29k
ZSBhcy1pcyBpcyB3cm9uZy4gZ2V0X3BhZ2UoKSBkb2VzIG5vdCBzdGFiaWxpemUNCj4gc2xh
YiBhbGxvY2F0aW9ucywgYW5kIHRoZSBza2IgaXMgZnJlZWQgcmlnaHQgYWZ0ZXIsIHdoaWNo
IG1heSB2ZXJ5IHdlbGwgZnJlZQ0KPiB0aGUgZGF0YS4gVGhpcyBfY2FuXyBtYWtlIHNlbnNl
IGZvciBvdGhlciBwYWdlIGZyYWdzLCBidXQgSSB3b3VsZCBzaW1wbHkgZGVmZXINCj4gZnJl
ZWluZyB0aGUgc2tiIHVudGlsIGVpdGhlciB0aGUgZnVsbCBza2IgaXMgeG1pdHRlZCwgb3Ig
eW91IHN1Y2Nlc3NmdWxseQ0KPiBjYW5jZWwgdGhlIHdob2xlIHRyYW5zZmVyICh3aGF0IEkg
dW5kZXJzdGFuZCBpcyB0aGUgImZvcmVpZ24gYWNjZXNzIiBpbiB0aGlzDQo+IGNvZGUpLiBU
aGUgc2tiIGl0c2VsZiBzaG91bGQgcGluIHRoZSBwYWdlcy4NCj4gDQoNClRoYW5rcyBmb3Ig
dGhlIGFuYWx5c2lzIGFuZCBoaW50IGhvdyB0byByZXNvbHZlIHRoaXMuDQoNClRoaXMgd2ls
bCByZXF1aXJlIHF1aXRlIHNvbWUgcmV3b3JrcywgYnV0IHNob3VsZCBiZSBwb3NzaWJsZS4N
Cg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg==
--------------xqU75XnK0jVGADtSi0vvwhbS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xqU75XnK0jVGADtSi0vvwhbS--

--------------5A5IDla0CQpeQJxHowbs9P6T--

--------------9PzraffvGSbQX5hcKKOy1gCj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpXbBQFAwAAAAAACgkQsN6d1ii/Ey/W
Lwf+NlnfD+8EOm9AMcXy/8gpBnz3UAqyRT1EzJd+sn8Gq9dFoAnYVM4zpvGtsbkwfE7x4dBdysVD
TqZzud85+2LC7IaLAPp+ahCsIkyGGL0MsJ77blCrJgeuaDpEp+nyQ2jL82jxY7n+Sy7vsEQhsu/k
vhxoX3nreL/+GixLZ+xgtgo+Ky8iDQwOGNoq3eovZXgXBbO06OK2YwN8RSmS21U1qB1IF8NVzfu/
EYS/tir8XOhPfsbqSoM52S+GOpMEI1fe4UKkPMQSjNtZlG3DRkcJXmka2ApZJCzU498ri5hAzn0/
PPfXcFidLcxWMuxlWFC6+3sesmeo+dd0yYqpV4MRRg==
=86uj
-----END PGP SIGNATURE-----

--------------9PzraffvGSbQX5hcKKOy1gCj--

