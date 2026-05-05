Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMueD+i0+WnUAwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:14:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1C4C95D1
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 11:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300395.1574929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBqS-00026z-Ho; Tue, 05 May 2026 09:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300395.1574929; Tue, 05 May 2026 09:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBqS-00024d-F9; Tue, 05 May 2026 09:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1300395;
 Tue, 05 May 2026 09:13:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKBqR-00024X-L6
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:13:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBqR-004Jiv-0q
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:13:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f9b4bd-e002-0a2a0a5209dd-0a2a45088f46-2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:13:34 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f9b4be-63b5-0a2a45080019-d155da33e9bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 11:13:34 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bc177ebda91so395005066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 02:13:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67cd91ea07dsm218439a12.31.2026.05.05.02.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 02:13:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1777972414; x=1778577214; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Y/xQS/8peQaeFzRGmtIZFAj4XQpcEVQElamu0wDVcY=;
        b=Ws+IoQzxS5eBpI2JigdgQWgSRMMgtfPcAe4ww8J6BB6OhWJUMurp2WvXWP+qhj9eu2
         dTZ8qvNR9KVBSstVMc1XIfTPuv5pr3GlM8rPQmoxnsXwzehN3TmzJhpXkHUryHeXGKV6
         ZlZU6ratsRXRBR+WCq7m8XoTb5rH2NbT9fqgFv1+eVqpNhm+exS526j5awTIGp4aaQ5H
         DUmZbgTEjFcrNr7XMY2omwPOZNzzjAvxUcPwqu7CUcFkZj2N6st03W+jWq5gnzXK1frc
         MTQMSmTMSN53+OrT5mcmZLBLvrYIF+xBSpBR8OYBakCZlxfxgxqWCa39RpJdFbZL8xPK
         GxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972414; x=1778577214;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y/xQS/8peQaeFzRGmtIZFAj4XQpcEVQElamu0wDVcY=;
        b=Jk6LlFVKcgoW6MIw9cgG0gsZLk1aTuH1l6zJORlIzUP9ldtsoHHB17mYbmvBI5ZSoh
         +lem3JleVb2oAA1zHwwJ7Hm6IsVvlOtGbjt7bW2sm89qyaDd/KSR+EW1qNGkcM/k67K3
         3iN6Wb6h9+68iFiTaqIHS6xZgo77R7sUEgPFFq3d5Q5uy2YF75Dp1rKCkJNGuDV7N+uI
         UIiw6QpBuMIYzK0eujN4S1+XvyhHw03rKUWKz1FbTZRXsdcv2Y1zPDYWRXeCj+YBAJQ9
         36XoC76Z1q4PyG2x3O8aQYMpSApBcJjJpohDfU2MOfMpd2bWww1QFHm0911k6pzpXGeA
         Q0nA==
X-Forwarded-Encrypted: i=1; AFNElJ/aoyWd0i6m3a+ccnC3Bt/koD1UB+/LF8bw0Cdch4xPhQD9zRyownx8QAyoRmrLXKhPoNm96r/Stls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNS1oq7fykDDQgByX/XW7o4hVJqHvBUCq4G+6eaLx8lIHn4Wwq
	8rm1dfwnQFQj9DngFaFBwP8zt9lg1VaFGFZ60toF8+0t61zwcZ0F3x1jg2qJYt+JKIc=
X-Gm-Gg: AeBDiesQvCFtTWdLeFC1kxPjPlDsCkzNrY8thD6EwW3IYDSgyiow6WirPdriVw5HKSv
	EXtNdvN5A+1sSTB6rdAfzd/hq4mWXax94dITE4Tq6gkyIM5SpLYtP0C5kItft3EqvSZ34TNq9AA
	rGx5fxmeos+wQ4q1KwmUHS3jkU8IQ5t/30JGo6Muy2xxOpaD04cTPIvSluy1z2r6ZVwpcTEg3Gt
	B8Ozu4oS3KEf5WUGFzEy22E1dFFj1g5kPaz+XeK37tkm//Lc63ZdAlrLuTkyi8fFJlcvdi1a2Yi
	+UKbCjEVnHzzFwGCyfM4bU3Vo9uP6zt9PNd5BQEclqDIxhCnPYWjNk+2/wqVZ25vXuFfV4B17YX
	8WFkt9GMREC6fYXzGMy56yF/x8O8Vm+7G1wPDAkQz40HOONydZPWsJpYNXCYoKML0b4JOw+7dOG
	CeJHvmeodpzSKfCwCN0OBbn8CMK57V2YAdCXcT7L2EvN07RZXD6Xtlc6aXHjCRJmyuRjZH6mgPt
	TrBGcMW/oO8asEk2qdKPhHBsv+wiLEiOpuC/gpl7jtTHGJWfPOF147aPxozZm8d
X-Received: by 2002:a17:907:3d4a:b0:ba9:aeaa:fd01 with SMTP id a640c23a62f3a-bbffd4cbca3mr766766966b.43.1777972413875;
        Tue, 05 May 2026 02:13:33 -0700 (PDT)
Message-ID: <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
Date: Tue, 5 May 2026 11:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260505080653.197775-1-jgross@suse.com>
 <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
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
In-Reply-To: <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dAewGUNv0qm8HdmceafrUiMz"
X-purgate-ID: tlsNG-c1860d/1777972414-C2368DB1-54DE0D6E/0/0
X-purgate-type: clean
X-purgate-size: 12396
X-Rspamd-Queue-Id: 79C1C4C95D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.763];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dAewGUNv0qm8HdmceafrUiMz
Content-Type: multipart/mixed; boundary="------------JiQauVkPK1gsx2X8jgppe5kb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
References: <20260505080653.197775-1-jgross@suse.com>
 <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
In-Reply-To: <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------JiQauVkPK1gsx2X8jgppe5kb
Content-Type: multipart/mixed; boundary="------------sHBvnREvYxzRavgDWAi07Ppt"

--------------sHBvnREvYxzRavgDWAi07Ppt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjYgMTA6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wNS4yMDI2
IDEwOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBmaXhpbmcgYSBjb25mbGlj
dCBpbiB4ZW5fZTgyMF9yZXNvbHZlX2NvbmZsaWN0cygpLCB0aGUgbG9vcCBvdmVyDQo+PiB0
aGUgRTgyMCBtYXAgZW50cmllcyBuZWVkcyB0byBiZSByZXN0YXJ0ZWQsIGFzIHRoZSBFODIw
IG1hcCB3aWxsIGhhdmUNCj4+IGJlZW4gbW9kaWZpZWQgYnkgdGhlIGZpeC4gT3RoZXJ3aXNl
IGVudHJpZXMgbWlnaHQgYmUgc2tpcHBlZCBieQ0KPj4gYWNjaWRlbnQuDQo+Pg0KPj4gRml4
ZXM6IGJlMzVkOTFjODg4MCAoInhlbjogdG9sZXJhdGUgQUNQSSBOVlMgbWVtb3J5IG92ZXJs
YXBwaW5nIHdpdGggWGVuIGFsbG9jYXRlZCBtZW1vcnkiKQ0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gRmlyc3QsIHdoaWxlIHRy
eWluZyB0byByZXZpZXcgdGhpcywgaXNuJ3QgdGhlcmUgYW5vdGhlciBpc3N1ZSBpbg0KPiB4
ZW5fZTgyMF9zd2FwX2VudHJ5X3dpdGhfcmFtKCksIGluIHRoYXQNCj4gDQo+IAkJCWVudHJ5
LT5hZGRyID0gZW50cnlfZW5kIC0gc3dhcF9zaXplICsNCj4gCQkJCSAgICAgIHN3YXBfYWRk
ciAtIHN3YXBfZW50cnktPmFkZHI7DQo+IA0KPiANCj4gcmVhbGx5IG1lYW5zIHRvIGJlDQo+
IA0KPiAJCQllbnRyeS0+YWRkciA9IGVudHJ5X2VuZCAtIHN3YXBfc2l6ZSArDQo+IAkJCQkg
ICAgICBzd2FwX2VudHJ5LT5hZGRyIC0gc3dhcF9hZGRyOw0KPiANCj4gKGFmZmVjdGluZyBu
b24tcGFnZS1hbGlnbmVkIEU4MjAgZW50cmllcyk/DQoNClllcywgeW91IGFyZSByaWdodC4N
Cg0KPiANCj4gRnVydGhlciwgdGhhdCBmdW5jdGlvbiBjb252ZXJ0cyBzd2FwX2VudHJ5IHRv
IHRoZSBwYWdlLWFsaWduZWQgc3VwZXJzZXQNCj4gb2YgdGhlIHBhc3NlZCBpbiByYW5nZS4g
SG93IGlzIGl0IGd1YXJhbnRlZWQgdGhhdCB0aGlzIG5ldyByYW5nZSB3b24ndA0KPiBvdmVy
bGFwIHdpdGggdGhlIHByZWRlY2Vzc29yIGFuZC9vciBzdWNjZXNzb3Igb25lPyBXb3VsZG4n
dCB0aGF0IG5lZWQNCj4gdG8gYmUgY29udmVyc2lvbiB0byB0aGUgcGFnZS1hbGlnbmVkIHN1
YnNldCBpbnN0ZWFkPw0KDQpUaGlzIGlzIHN1YnRsZS4gOi0pDQoNCldlIGFyZSBjb252ZXJ0
aW5nIHRvIFJBTSAodXNhYmxlKSwgc28gdGhlIHR5cGUgdmFsdWUgaXMgMS4gZTgyMF9fdXBk
YXRlX3RhYmxlKCkNCndpbGwgaGFuZGxlIG92ZXJsYXBzIGp1c3QgZmluZSwgd2l0aCBoaWdo
ZXIgdHlwZSB2YWx1ZXMgIndpbm5pbmciIGFnYWluc3QgbG93ZXINCm9uZXMuIFNvIGFueSBv
dGhlciByZWdpb24gb3ZlcmxhcHBpbmcgd2l0aCB0aGUgbmV3IFJBTSByZWdpb24gd2lsbCBy
ZXN1bHQgaW4NCmFub3RoZXIgY29uZmxpY3QgaW4gdGhlIG5leHQgbG9vcCBpdGVyYXRpb24u
DQoNClVzaW5nIHRoZSBwYWdlLWFsaWduZWQgc3Vic2V0IHdvdWxkIHJlc3VsdCBpbiBwb3Nz
aWJsZSBtZW1vcnkgaG9sZXMsIHdoaWNoIHdvdWxkDQpiZSBwcm9ibGVtYXRpYyAodGhlIGtl
cm5lbCBvciBwYWdlIHRhYmxlcyBzaG91bGRuJ3QgaGF2ZSBob2xlcywgYWZ0ZXIgYWxsKS4N
Cg0KPiANCj4gQW5kIHRoZW4sIGlzIHBhc3NpbmcgdGhlIHBhZ2UtYWxpZ25lZCBzdXBlcnNl
dCB0byB4ZW5fYWRkX3JlbWFwX25vbnJhbSgpDQo+IHJlYWxseSBhcHByb3ByaWF0ZT8gV2h5
IHdvdWxkIGFueSBsZWFkaW5nIG9yIHRyYWlsaW5nIHNwYWNlIHRoZXJlIGJlDQo+IHN1Ympl
Y3QgdG8gcmVtYXBwaW5nPw0KDQpIb3cgd291bGQgeW91IHdhbnQgdG8gcmVtYXAgYSBzdWIt
cGFnZSBwaHlzaWNhbCBtZW1vcnkgYXJlYSB0byBhbm90aGVyIGxvY2F0aW9uDQp3aXRob3V0
IGFmZmVjdGluZyB0aGUgcmVzdCBvZiB0aGUgcGFnZT8gV2UgYXJlIHJld29ya2luZyB0aGUg
ZmluYWwgcDJtIG1hcCBoZXJlLg0KDQo+IA0KPj4gLS0tIGEvYXJjaC94ODYveGVuL3NldHVw
LmMNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9zZXR1cC5jDQo+PiBAQCAtNjk1LDE3ICs2OTUs
MjIgQEAgc3RhdGljIHZvaWQgX19pbml0IHhlbl9lODIwX3Jlc29sdmVfY29uZmxpY3RzKHBo
eXNfYWRkcl90IHN0YXJ0LA0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+PiAgIAllbmQgPSBz
dGFydCArIHNpemU7DQo+PiAtCWVudHJ5ID0geGVuX2U4MjBfdGFibGUuZW50cmllczsNCj4+
ICsJbWFwY250ID0gMDsNCj4+ICAgDQo+PiAtCWZvciAobWFwY250ID0gMDsgbWFwY250IDwg
eGVuX2U4MjBfdGFibGUubnJfZW50cmllczsgbWFwY250KyspIHsNCj4+ICsJd2hpbGUgKG1h
cGNudCA8IHhlbl9lODIwX3RhYmxlLm5yX2VudHJpZXMpIHsNCj4+ICsJCWVudHJ5ID0geGVu
X2U4MjBfdGFibGUuZW50cmllcyArIG1hcGNudDsNCj4+ICAgCQlpZiAoZW50cnktPmFkZHIg
Pj0gZW5kKQ0KPj4gICAJCQlyZXR1cm47DQo+PiAgIA0KPj4gICAJCWlmIChlbnRyeS0+YWRk
ciArIGVudHJ5LT5zaXplID4gc3RhcnQgJiYNCj4+IC0JCSAgICBlbnRyeS0+dHlwZSA9PSBF
ODIwX1RZUEVfTlZTKQ0KPj4gKwkJICAgIGVudHJ5LT50eXBlID09IEU4MjBfVFlQRV9OVlMp
IHsNCj4+ICAgCQkJeGVuX2U4MjBfc3dhcF9lbnRyeV93aXRoX3JhbShlbnRyeSk7DQo+PiAr
CQkJLyogRTgyMCBtYXAgaGFzIGJlZW4gY2hhbmdlZCwgcmVzdGFydCBsb29wISAqLw0KPj4g
KwkJCW1hcGNudCA9IDA7DQo+PiArCQkJY29udGludWU7DQo+PiArCQl9DQo+PiAgIA0KPj4g
LQkJZW50cnkrKzsNCj4+ICsJCW1hcGNudCsrOw0KPj4gICAJfQ0KPj4gICB9DQo+IA0KPiBH
aXZlbiB3aGF0IGV4YWN0bHkgeGVuX2U4MjBfc3dhcF9lbnRyeV93aXRoX3JhbSgpIGRvZXMs
IHJlc3RhcnRpbmcgZnJvbQ0KPiBlbnRyeSAwIGxvb2tzIHRvIGJlIG5lZWRlZCBvbmx5IGlm
IHRoZSBub24tUkFNIGVudHJ5IGVuZGVkIHVwIG1vdmluZyBkb3duDQo+IChzdHJpY3RseSBz
cGVha2luZyBldmVuIHRoZXJlIGl0IHdvdWxkbid0IG5lZWQgdG8gYmUgZW50cnkgMCkuIElm
IGl0DQo+IG1vdmVkIHVwLCBzaW1wbHkgbm90IGluY3JlbWVudGluZyBtYXBjbnQgd291bGQg
bG9vayB0byBzdWZmaWNlLiBTaW5jZSB0aGUNCj4gZXh0cmEgb3ZlcmhlYWQgaXMgbGlrZWx5
IHRvbGVyYWJsZSBoZXJlICh3aXRoIHNpbXBsaWNpdHkgb2YgdGhlIGNvZGUNCj4gYmVpbmcg
bW9yZSBpbXBvcnRhbnQpLCB0aGlzIG1heSB3YW50IG1lbnRpb25pbmcgaW4gYSBjb2RlIGNv
bW1lbnQgKG9yIGF0DQo+IGxlYXN0IHRoZSBkZXNjcmlwdGlvbikuIFByZWZlcmFibHkgd2l0
aCB0aGF0Og0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpUaGFua3MsDQoNCg0KSnVlcmdlbg0K
--------------sHBvnREvYxzRavgDWAi07Ppt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------sHBvnREvYxzRavgDWAi07Ppt--

--------------JiQauVkPK1gsx2X8jgppe5kb--

--------------dAewGUNv0qm8HdmceafrUiMz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn5tL0FAwAAAAAACgkQsN6d1ii/Ey+M
2wf/ZdhzFiiteUpSVRo4BGyVpMhKkPv+7/ZtOcLSumpAkSxzB9o0lDMjYKiyjx5AMDcBwlcv3Age
f5P+Tia+jdtE59+BQA0AWHqJ1Xy6APU2iFuMeUI3E45ovcdGOAHMWG3eF7McO3iid9Kc9rmO3o4e
17ElN8RZVrS7WjMiIyDlXSQ8KCN5GVJgNAFnu/Mn8l6ktQ4NuOlGtdJJdVB6mSSWNotx+f/xxQX4
hzKf7MPRAhlTvuOvjbf49wd/HSSE+n+6dXmJyv9zvkfMkjqf6UKN/mRB2DlzhqP0RPu9jQNL1Mps
9slfyg/v0cKI8Gs+xp/xX06PA7uY/61YU+5SF/qoIw==
=XkA8
-----END PGP SIGNATURE-----

--------------dAewGUNv0qm8HdmceafrUiMz--

