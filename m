Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O1hIRNL5mnSuQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:49:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DD42E9DF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286312.1567408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqsF-0002mR-1f; Mon, 20 Apr 2026 15:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286312.1567408; Mon, 20 Apr 2026 15:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqsE-0002kL-V7; Mon, 20 Apr 2026 15:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1286312;
 Mon, 20 Apr 2026 15:49:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wEqsE-0002kF-0Z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqsD-000hJL-9p
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:49:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e64aee-2eae-0a2a0a5409dd-0a2a4506e6a6-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:49:21 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e64b01-7371-0a2a45060019-d155da2aecfc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:49:21 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ba36357195bso364461266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:49:21 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba4520c93c7sm351216266b.27.2026.04.20.08.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:49:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1776700161; x=1777304961; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=soswTpUtlOs4Dq6pQv7tpnsqR85T4CN1dI5wudXZ8Ek=;
        b=CL2O9ycuuHb+nzB+yDRU+MHrtQLuj+Ww5j0tVlxtG/kyCfhcytv8AqqCUFnjuGVuTB
         ht5M8QChjJDfmjHtfEh4X3p7q0iMb9E4fyzmaEFtLdQ5XaaIBSxB42ujWY0EpbzBmjfd
         9ZR6uofAJlUaDb352u1eENk8t/Ydb4G5U1S63bqVigNOXZmbjIs8oO/HtLQD89g9a8y8
         rClp7I0z4F9wcSOHB/J0nu977IpQP+5Cn2O1UAQi+uj3kq5mo8ew4CgkNERhZPD6N4xo
         wC4GzkwGnWyh/q2GPqJh0jV0P4aGSOMCUlmWerfVxJOfxHAysUUJjuKfPSuqeYzXndnX
         VIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700161; x=1777304961;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soswTpUtlOs4Dq6pQv7tpnsqR85T4CN1dI5wudXZ8Ek=;
        b=rVWSkD77yFuKMPuN9eOn7onKBVGHTWI6dOTk5YnBdOyo2dnJDCPA7pbk7Y/hdA2TJr
         AzpviKzgM/d2TZC0e679rVePCNu71DoAGv3gRlRwrdpeE2AkEiS6pPyDB3DJrIy/Xvx8
         k5qucdS/0t1pMMDwWqeZDmDP/rcF1lRfo3kcnZDn2sAI7tmm0cOfJ5tPlONGbXBPar9Q
         n6BjYbI1sx48yjVhqJuTd3yQ7X7m9ZosCkXgKNTM+EI9pUHrxdCDdwHrRp+Iu+6+xI0w
         fRNQyqyaU6JPUP+k6Vrv+OfX+BSRGJXS/alSi2rc9Dhbv5v4KDkEhHTosNjqjgCRuP3o
         +12g==
X-Gm-Message-State: AOJu0YxIHitLkUzts7UnF+c5/ZGI74OlP9JHH+dJy6Uy00jkAgJ3mUgu
	C239I6fVtnu0FBl4KUNoENZKGKaQFl1eA5idsF5aEODKBuZa92Gqs8rom59XmYJ1qXvFXD5Kd7P
	UuIgmzyg=
X-Gm-Gg: AeBDievGb2fdItkr6GeaiEOm99THIqCgafZRLJZzZnqm1VQ7wbiAuEMTXriETAwKrmT
	XKI9v0VAng6zTG/KXDbEqSPeDz59v9Rxt+GagqUinDBsB9ssbHFZNtYupkp7FoIgkY7OjwjfDBD
	qb/n62xV4EqaGBLa9e/J/+RT32QOBlw5D41qxO280ogVUC8JqKCgrHMo0+XqQCcRPzpVkCZvHkm
	qNVjhfO8SZKRxu6Q0XXvBTZzdoPXxgknQsIjTBpKPmc48K9MXN98Dexu+y7LWftrCGDAlmylRpV
	VpZCBHEq03ZivfFNPo+WdLOtcC/xcpIwVbMXwZZe9B5CNPNTNgriqov48KYgHAccK3gb0mZ2fkX
	XFAB/jgMv8ZoYVveo9PBu+ywyG/4NlA6jQQLVWFF8V4wdRFxw93GhVPjfYmjZhDPE8w80RLMZzL
	c3T83900QlvQE5fFTb39rF46oowcWuO9kwynWg9R8oIE9/l5LpCAUZ13IfhgQrPU6mFSwy1nJmA
	cOmPofcqXMLvt+ZD6FfRCDWaKeeIo2JRr80K0bKKw0XBArI+JKXFX8CLMvmoFtN
X-Received: by 2002:a17:907:3fa2:b0:ba7:5c47:7b1c with SMTP id a640c23a62f3a-ba75c478746mr282870966b.8.1776700160388;
        Mon, 20 Apr 2026 08:49:20 -0700 (PDT)
Message-ID: <5752e2b2-9d5d-4bd0-b645-0f4d06035be0@suse.com>
Date: Mon, 20 Apr 2026 17:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] tools/xenstored: add support for watch depth feature
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260313074751.2904215-1-jgross@suse.com>
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
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K0et2j3EZuDg5QB8H8WWtxpi"
X-purgate-ID: tlsNG-16d1c6/1776700161-51F6BD75-EBFAFC66/0/0
X-purgate-type: clean
X-purgate-size: 11508
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D21DD42E9DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K0et2j3EZuDg5QB8H8WWtxpi
Content-Type: multipart/mixed; boundary="------------kOYSd3m3MjnfZUdUIOIM0Pjp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <5752e2b2-9d5d-4bd0-b645-0f4d06035be0@suse.com>
Subject: Re: [PATCH 0/8] tools/xenstored: add support for watch depth feature
References: <20260313074751.2904215-1-jgross@suse.com>
In-Reply-To: <20260313074751.2904215-1-jgross@suse.com>
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

--------------kOYSd3m3MjnfZUdUIOIM0Pjp
Content-Type: multipart/mixed; boundary="------------FLIlGHUv4fAcZ2aEAzsJuxec"

--------------FLIlGHUv4fAcZ2aEAzsJuxec
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmVnYXJkaW5nIHRoZSB1cGNvbWluZyBmZWF0dXJlIGZyZWV6ZSwgd291bGQgaXQgYmUgcG9z
c2libGUgdG8gZ2V0IHNvbWUNCmZlZWRiYWNrIG9uIHRoaXMgc2VyaWVzPw0KDQpJIHdvdWxk
IHJlYWxseSBhcHByZWNpYXRlIGlmIGF0IGxlYXN0IHRoZSBmaXJzdCAzIHBhdGNoZXMgY291
bGQgbWFrZSBpdA0KaW50byA0LjIyLCBhcyB0aGlzIHdpbGwgYXZvaWQgdGhlIG5lZWQgdG8g
YnVtcCB0aGUgbGlieGVuc3RvcmUgbWlub3INCnZlcnNpb24gaW4gNC4yMyBhZ2Fpbi4NCg0K
DQpKdWVyZ2VuDQoNCk9uIDEzLjAzLjI2IDA4OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiBJbiBvcmRlciB0byByZWR1Y2UgZXhjZXNzaXZlIG51bWJlciBvZiB3YXRjaCBldmVudHMg
dGhlIHdhdGNoIGRlcHRoDQo+IGZlYXR1cmUgaGFzIGJlZW4gZGVmaW5lZCwgYWxsb3dpbmcg
dGhlIHVzZXIgdG8gbGltaXQgdGhlIG51bWJlciBvZg0KPiBub2RlIGxldmVscyBiZWxvdyB0
aGUgd2F0Y2hlZCBub2RlIHRvIGNhdXNlIGV2ZW50cy4NCj4gDQo+IFRoaXMgc2VyaWVzIGlz
IGltcGxlbWVudGluZyB0aGlzIGZlYXR1cmUgZm9yIHhlbnN0b3JlZCAoaW5jbHVkaW5nIHRo
ZQ0KPiBQViBhbmQgUFZIIHN0dWJkb20gdmFyaWFudHMpLg0KPiANCj4gUG9zc2libGUgdXNl
cnMgYXJlOg0KPiANCj4gLSB4bC9saWJ4bDogdXNlIGRvbWlkIGluZm9ybWF0aW9uIGZvciB0
aGUgc3BlY2lhbCBAaW50cm9kdWNlRG9tYWluIGFuZA0KPiAgICBAcmVsZWFzZURvbWFpbiB3
YXRjaGVzLCB3aGljaCB3aWxsIGJlIGF2YWlsYWJsZSB3aGVuIHVzaW5nIGRlcHRoID0gMQ0K
PiANCj4gLSB4ZW5jb25zb2xlZCwgbGlrZSB4bC9saWJ4bA0KPiANCj4gLSBhbnkgUFYtZGV2
aWNlIGJhY2tlbmRzIHdhdGNoaW5nIGRpcmVjdG9yaWVzIGZvciBhZGRlZCBkZXZpY2VzIChu
bw0KPiAgICB3YXRjaCBldmVudHMgd2hlbiBhbnkgZGV2aWNlIHNwZWNpZmljIG5vZGUgaXMg
bW9kaWZpZWQpDQo+IA0KPiAtIGFueSBQVi1kZXZpY2UgZnJvbnRlbmQgYW5kIGJhY2tlbmQg
d2F0Y2hpbmcgdGhlICJzdGF0ZSIgbm9kZSBvZiB0aGUNCj4gICAgb3RoZXIgc2lkZSwgaW4g
Y2FzZSB0aGUgb3RoZXIgc2lkZSBwbGF5cyBkaXJ0eSBnYW1lcyBieSBidWlsZGluZw0KPiAg
ICBsYXJnZSBzdWItdHJlZXMgYmVuZWF0aCB0aGUgInN0YXRlIiBub2RlDQo+IA0KPiBUaGlz
IHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBhIG1vZGlmaWVkIHhlbnN0b3JlLXdhdGNo
IGNsaWVudC4NCj4gVGhlIG1vZGlmaWNhdGlvbiB3aWxsIGJlIHNlbnQgYXMgc29vbiBhcyB0
aGUgcGVuZGluZyBzZXJpZXMgb2YgdGhlDQo+IHhzLWNsaWVudHMgaGFzIGJlZW4gYXBwbGll
ZC4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgd2F0Y2ggZGVwdGggc2VyaWVzIGRlcGVuZHMgb24g
dGhlIHN0aWxsIHBlbmRpbmcgc2VyaWVzDQo+ICJ0b29sczogYWRkIHN1cHBvcnQgZm9yIHBl
ci1kb21haW4geGVuc3RvcmUgcXVvdGEiLg0KPiANCj4gSnVlcmdlbiBHcm9zcyAoOCk6DQo+
ICAgIHRvb2xzL3hlbnN0b3JlZDogYWxsb3cgZG9tVSB0byBnZXQgb3duIGZlYXR1cmVzDQo+
ICAgIGRvY3M6IGNsYXJpZnkgWGVuc3RvcmUgd2F0Y2ggZGVwdGggZmVhdHVyZQ0KPiAgICB0
b29scy9saWJzL3N0b3JlOiBhZGQgc3VwcG9ydCB0byB1c2Ugd2F0Y2hlcyB3aXRoIGEgZGVw
dGggcGFyYW1ldGVyDQo+ICAgIHRvb2xzL3hlbnN0b3JlZDogYWRkIGRlcHRoIGluZm9ybWF0
aW9uIHRvIHdhdGNoZXMNCj4gICAgdG9vbHMveGVuc3RvcmVkOiBhZGQgZGVwdGggaGFuZGxp
bmcgdG8gWFNfV0FUQ0gNCj4gICAgdG9vbHMveGVuc3RvcmVkOiByZXBsYWNlIHRoZSBmaXJl
X3dhdGNoZXMoKSBleGFjdCBwYXJhbWV0ZXINCj4gICAgdG9vbHMveGVuc3RvcmVkOiBleHBh
bmQgc3BlY2lhbCB3YXRjaCBoYW5kbGluZyB3aXRoIGRlcHRoIGZlYXR1cmUNCj4gICAgdG9v
bHMveGVuc3RvcmVkOiBtYWtlIFhFTlNUT1JFX1NFUlZFUl9GRUFUVVJFX1dBVENIREVQVEgg
YXZhaWxhYmxlDQo+IA0KPiAgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAgIHwg
ICA2ICsrDQo+ICAgZG9jcy9taXNjL3hlbnN0b3JlLnR4dCAgICAgICAgICAgfCAgMTQgKyst
DQo+ICAgdG9vbHMvaW5jbHVkZS94ZW5zdG9yZS5oICAgICAgICAgfCAgMTYgKysrDQo+ICAg
dG9vbHMvbGlicy9zdG9yZS9saWJ4ZW5zdG9yZS5tYXAgfCAgIDIgKw0KPiAgIHRvb2xzL2xp
YnMvc3RvcmUveHMuYyAgICAgICAgICAgIHwgMTE2ICsrKysrKysrKysrKysrKysrKy0tLS0N
Cj4gICB0b29scy94ZW5zdG9yZWQvY29yZS5jICAgICAgICAgICB8ICAxNSArKy0NCj4gICB0
b29scy94ZW5zdG9yZWQvZG9tYWluLmMgICAgICAgICB8ICA2NCArKysrKysrKystLS0NCj4g
ICB0b29scy94ZW5zdG9yZWQvZG9tYWluLmggICAgICAgICB8ICAgMiArDQo+ICAgdG9vbHMv
eGVuc3RvcmVkL2x1LmMgICAgICAgICAgICAgfCAgIDMgKw0KPiAgIHRvb2xzL3hlbnN0b3Jl
ZC90cmFuc2FjdGlvbi5jICAgIHwgIDE0ICstLQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC90cmFu
c2FjdGlvbi5oICAgIHwgICA0ICstDQo+ICAgdG9vbHMveGVuc3RvcmVkL3dhdGNoLmMgICAg
ICAgICAgfCAxNjEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIHRvb2xz
L3hlbnN0b3JlZC93YXRjaC5oICAgICAgICAgIHwgIDEwICstDQo+ICAgeGVuL2luY2x1ZGUv
cHVibGljL2lvL3hzX3dpcmUuaCAgfCAgIDIgKw0KPiAgIDE0IGZpbGVzIGNoYW5nZWQsIDMy
OCBpbnNlcnRpb25zKCspLCAxMDEgZGVsZXRpb25zKC0pDQo+IA0KDQo=
--------------FLIlGHUv4fAcZ2aEAzsJuxec
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------FLIlGHUv4fAcZ2aEAzsJuxec--

--------------kOYSd3m3MjnfZUdUIOIM0Pjp--

--------------K0et2j3EZuDg5QB8H8WWtxpi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnmSv8FAwAAAAAACgkQsN6d1ii/Ey+0
qgf/Z+g7e9GmVzIfFyzWKjBLroIMMhYzPJZz0TH8vnZKuMtN8eIyLqY1fm4viM5SrvG3UyJfdMlz
DnGoyHfn1zWCtYaZr0pDOiFk/6oivc0mTFuIHzTWknkJRzEb+GTwkCV783ZsOv1/1OOsJNZWTp/1
S4nNBc+J+jztCLL8LOzK9xa5sDMBJpUnEPoTpjaykGeG7WiNHw4KuzfNMBsUr0LulMEUVOJuXMI4
lAtya1fSDnau1RK/w1zrp/M8Y8p0ImdfMbrz7G5n3JGxhPnOPmdJYM16yt34DcH2AZFVzjbf2dCx
2j3rULmLKGeKZroJdOu4b9oUSidQghemaRmAQYDO6g==
=tutt
-----END PGP SIGNATURE-----

--------------K0et2j3EZuDg5QB8H8WWtxpi--

