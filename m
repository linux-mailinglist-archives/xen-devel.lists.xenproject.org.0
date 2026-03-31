Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULc7NY+Ey2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:23:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A115C3660D5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268699.1557923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UNe-0000Al-Ru; Tue, 31 Mar 2026 08:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268699.1557923; Tue, 31 Mar 2026 08:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UNe-00008g-PA; Tue, 31 Mar 2026 08:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1268699;
 Tue, 31 Mar 2026 08:23:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w7UNd-00007z-Em
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:23:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UNc-00FeyA-Qv
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:23:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69cb8473-e002-0a2a0a5209dd-0a2a4502b2da-32
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:23:20 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69cb8478-63bb-0a2a45020019-d155d036c59f-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:23:20 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-66b66edf6cbso6207976a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:23:20 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66b72963f48sm3395469a12.7.2026.03.31.01.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:23:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1774945400; x=1775550200; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ebSg3fmPBD48uCzVPCNbe7KEgbyAK9Q2zOxXw6qptyM=;
        b=CG+LQC70xLeIif/tjMeUY+Pc5lQ/sxZ9iQPmgJ12xg+ljKwsj0zA7+8GAsXbEsqQSY
         XSPpaM3Ey2+rkBAgTQ2nhwdBp1iu6RRhwAwtmsCqVhzMKN7vXCJXn4md9/njx0UGdrRj
         Y+proKy2EyY89ztFrNwMiEm69hFthrKnPjlAJn1oKD7qc3IxQGIcr+7BYRRrske2XgvY
         Rypu+2vRKU5MXmJZAuppXVoNAfo5E97ndlpLTNnWIVFHbabrfdOTyDOXaikJUptDeMGH
         mlbo53Bxqzvd6SXUAQS11a34JjPH5+fjPQ/BR10k/14kjsj0H7VyGGUmcs1fyroupSvX
         +V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945400; x=1775550200;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebSg3fmPBD48uCzVPCNbe7KEgbyAK9Q2zOxXw6qptyM=;
        b=aQP23BObMBiWow/8bZRB8REkFhp2LllsFZrfvCA3F7suMku5smWLUHNi6Iu5KGvQxk
         cxaV2KU6/NBIuniNJZGdjOjIjo3n2iyrI1sc9RUmwWY8Bd4n4ZhmUKp4BhMoJXW118qP
         VtYI9QEVWE7ZKDIovye2jJT0+/NHdB3P9bZa8PBt5kJOxCEF+C2BV0fZ3MQ66j5tOZ4j
         QtqpKJo+TM5K3OwBTQBkmJMTgQM3hZ+LfYTcSpV0Nqrv8sdvWFMV2aGLYW4PvSEnizuL
         ZeSH3brtjcygrAH7O0TNq5F5/abjI0zlQb3F4jMWlZ7hQiEWviXULoFfcg5B8Qh01AWo
         8hoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa+S1/37wJ8prpT5avTE0BY9mRRSTcCKIxas+8cQ/4G0MHgVW4gl1JnqaVV+qKnmTM0/eD4KD8Hag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZQhZT/buAfv2wCGvAPKfa/7hxqM51HEft9++OB2YB8ybpYaDi
	QxHmLsx5xuiqVe9UKHZYHrsPrwe9AhuLTakoFMiu9pUmxMhNoEfDDQ53H+4fhoqVIa0=
X-Gm-Gg: ATEYQzxCfcFxrJ1sc3083WbKH/r5ZLmyk4yOAI6obyligHKetThhlp/CYQ1RnMzbEgH
	4py2I2cdEjXdkVUMVvKN7pDgLnqxaL2A780AjJZBEy/H3/xUk4pSELO6Sg2nPk1DNEwiSTiPBL0
	JALeH2+hbRpUMd5mQzxt5Wq/95EoRnyLKir/iLUKDsex4CZHIuP68W3eGBZq1V/10j8/i2plxbV
	U6Laj4Lc3E2PJNAMgScVmVpukIQFgB2tgAdYtT/zwIcZlpE3yiyc4E3JSQJ30aqO6Y1RwHlRdlj
	ryy6w0/TI5i8e3G3VL02CJru+KWkU2ziroCSW5a7iWi0N/KQIEPaUs2XNwJIC/GWpYrzy4FD4+N
	0CeWfpPLIdkdrYoJT3YvihBr4t9FmElhR9WdYMjnw2wH1RUUJPbkffecwbMAt70i5y5Fdgg0ZK5
	K+cu0NzOCiLWAbew/X17xtHnsluZ+Ebm014nskloKJEoAaPodA2EoeQ9gUphyZ0aQV32qGBB1bF
	CZLPxkiyljyqE1k5h1O9JFNVzdcBpF3WSD5v/tIbMeIRneF9/Xl9Q==
X-Received: by 2002:a05:6402:3210:b0:668:50eb:bc87 with SMTP id 4fb4d7f45d1cf-66b282621cdmr9044588a12.3.1774945399952;
        Tue, 31 Mar 2026 01:23:19 -0700 (PDT)
Message-ID: <eeeabd5c-083f-4275-bf3c-846e01b4a5ea@suse.com>
Date: Tue, 31 Mar 2026 10:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PFxJJxpN9OMnVU73vtulkPtZ"
X-purgate-ID: tlsNG-720697/1774945400-40895DB8-DEC02416/0/0
X-purgate-type: clean
X-purgate-size: 9139
X-Spamd-Result: default: False [-1.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A115C3660D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PFxJJxpN9OMnVU73vtulkPtZ
Content-Type: multipart/mixed; boundary="------------p51EcEL0bMFSgGsmyUVXCGXT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <eeeabd5c-083f-4275-bf3c-846e01b4a5ea@suse.com>
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
In-Reply-To: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>

--------------p51EcEL0bMFSgGsmyUVXCGXT
Content-Type: multipart/mixed; boundary="------------pINyL8MiytX7l0sgSerbfKGN"

--------------pINyL8MiytX7l0sgSerbfKGN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDMuMjYgMDk6NTQsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBJbiBSVERT
LCBidXJuX2J1ZGdldCgpIGluY3JlbWVudHMgcHJpb3JpdHlfbGV2ZWwgZm9yIGV4dHJhdGlt
ZSB1bml0cw0KPiB3aGVuZXZlciBjdXJfYnVkZ2V0IGlzIGV4aGF1c3RlZC4gQXMgcHJpb3Jp
dHlfbGV2ZWwgaXMgdW5zaWduZWQgYW5kIHdhcw0KPiB1bmJvdW5kZWQsIGl0IGNvdWxkIGV2
ZW50dWFsbHkgb3ZlcmZsb3cgdG8gMC4NCj4gDQo+IEEgd3JhcHBlZCB2YWx1ZSBvZiAwIGlz
IHRoZSBoaWdoZXN0IFJURFMgcHJpb3JpdHksIHNvIGFuIGV4dHJhdGltZSB1bml0DQo+IGNv
dWxkIHVuZXhwZWN0ZWRseSByZWdhaW4gdG9wIHByaW9yaXR5IGFuZCBwcmVlbXB0IHVuaXRz
IHdpdGggYWN0aXZlDQo+IHJlYWwtdGltZSByZXNlcnZhdGlvbnMsIHZpb2xhdGluZyBFREYg
aW50ZW50Lg0KPiANCj4gRml4IHRoaXMgYnkgc2F0dXJhdGluZyBwcmlvcml0eV9sZXZlbCBh
dCBSVERTX01BWF9QUklPUklUWV9MRVZFTCBpbnN0ZWFkDQo+IG9mIGluY3JlbWVudGluZyB1
bmNvbmRpdGlvbmFsbHkuIEJ1ZGdldCByZWZpbGwgc2VtYW50aWNzIGFyZSB1bmNoYW5nZWQu
DQo+IA0KPiBOb3JtYWwgYmVoYXZpb3IgaXMgdW5jaGFuZ2VkLiBPbmNlIHNhdHVyYXRlZCwg
cHJpb3JpdHlfbGV2ZWwgcmVtYWlucyBhdA0KPiB0aGUgbG93ZXN0IHByaW9yaXR5IHVudGls
IHRoZSBuZXh0IHBlcmlvZCB1cGRhdGUgcmVzZXRzIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogT2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KDQpS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQp3aXRoIG9u
ZSBub3RlOiBvdmVyZmxvd2luZyBwcmlvcml0eV9sZXZlbCB3b3VsZCByZXF1aXJlIGV4dHJl
bWVseSBsb25nDQpzY2hlZHVsaW5nIHBlcmlvZHMgKHByb2JhYmx5IGF0IGxlYXN0IHNldmVy
YWwgZGF5cyksIHNvIHRoaXMgYnVnIGlzDQptb3JlIGEgdGhlb3JldGljYWwgb25lLiBBbnlv
bmUgY29uZmlndXJpbmcgdGhlIHJ0ZHMgc2NoZWR1bGVyIGluIHN1Y2gNCmEgd2F5IHdvdWxk
IHByb2JhYmx5IGRlc2VydmUgdG8gZXhwZXJpZW5jZSB0aGUgZmFsbG91dCBmcm9tIHRoaXMg
YnVnLiA6LSkNCg0KDQpKdWVyZ2VuDQoNCj4gLS0tDQo+IA0KPiAgIHhlbi9jb21tb24vc2No
ZWQvcnQuYyB8IDEwICsrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZC9ydC5jIGIveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+IGluZGV4IDdiMWY2NGE3Nzku
LjljMTAyN2MzODggMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvcnQuYw0KPiAr
KysgYi94ZW4vY29tbW9uL3NjaGVkL3J0LmMNCj4gQEAgLTExMCw2ICsxMTAsMTIgQEANCj4g
ICAgKi8NCj4gICAjZGVmaW5lIFJURFNfTUlOX0JVREdFVCAgICAgKE1JQ1JPU0VDUygxMCkp
DQo+ICAgDQo+ICsvKg0KPiArICogTWF4aW11bSBleHRyYXRpbWUgZGVtb3Rpb24gbGV2ZWwu
IFNhdHVyYXRpbmcgYXQgdGhpcyB2YWx1ZSBhdm9pZHMNCj4gKyAqIHVuc2lnbmVkIHdyYXBh
cm91bmQgYmFjayB0byAwIChoaWdoZXN0IHNjaGVkdWxpbmcgcHJpb3JpdHkpLg0KPiArICov
DQo+ICsjZGVmaW5lIFJURFNfTUFYX1BSSU9SSVRZX0xFVkVMICh+MFUpDQo+ICsNCj4gICAv
Kg0KPiAgICAqIFVQREFURV9MSU1JVF9TSElGVDogYSBjb25zdGFudCB1c2VkIGluIHJ0X3Vw
ZGF0ZV9kZWFkbGluZSgpLiBXaGVuIGZpbmRpbmcNCj4gICAgKiB0aGUgbmV4dCBkZWFkbGlu
ZSwgcGVyZm9ybWluZyBhZGRpdGlvbiBjb3VsZCBiZSBmYXN0ZXIgaWYgdGhlIGRpZmZlcmVu
Y2UNCj4gQEAgLTk3Niw3ICs5ODIsOSBAQCBidXJuX2J1ZGdldChjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCBydF91bml0ICpzdmMsIHNfdGltZV90IG5vdykNCj4gICAg
ICAgew0KPiAgICAgICAgICAgaWYgKCBoYXNfZXh0cmF0aW1lKHN2YykgKQ0KPiAgICAgICAg
ICAgew0KPiAtICAgICAgICAgICAgc3ZjLT5wcmlvcml0eV9sZXZlbCsrOw0KPiArICAgICAg
ICAgICAgaWYgKCBzdmMtPnByaW9yaXR5X2xldmVsIDwgUlREU19NQVhfUFJJT1JJVFlfTEVW
RUwgKQ0KPiArICAgICAgICAgICAgICAgIHN2Yy0+cHJpb3JpdHlfbGV2ZWwrKzsNCj4gKw0K
PiAgICAgICAgICAgICAgIHN2Yy0+Y3VyX2J1ZGdldCA9IHN2Yy0+YnVkZ2V0Ow0KPiAgICAg
ICAgICAgfQ0KPiAgICAgICAgICAgZWxzZQ0KDQo=
--------------pINyL8MiytX7l0sgSerbfKGN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pINyL8MiytX7l0sgSerbfKGN--

--------------p51EcEL0bMFSgGsmyUVXCGXT--

--------------PFxJJxpN9OMnVU73vtulkPtZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnLhHcFAwAAAAAACgkQsN6d1ii/Ey/r
/wf+LTwA0Q0fBj1Wu0d/c0rUZazjubS448e6vNFlNbRzqVEqwETFwacqDHPv8hVuR4AZ4IJqu8Tl
TWKf9Tet5uZQWATctbYCT0+Xvk1eH4qL8672YUXJQU0cFh2xlVxl5JNRG+EhynI5or9X7f8GszS+
aYILU05IlM7wI7Ji3Do9f7F92nNxdnr8eqlnPL5bgU9RJpyOhdyvDDJqjwLswf/oFitwSVqFuI83
pTj9aFYt51X/8PKMTlcevWkNdTzg4JZ8Q9jnNSiEfDrXPlCCzEBa9xq9bGV5/cQqvKbV0n+nU56V
96jaja6UR5e1PzkGl7NqzKimnjuueBTLjB9B68/bQQ==
=h+iK
-----END PGP SIGNATURE-----

--------------PFxJJxpN9OMnVU73vtulkPtZ--

