Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Szc4DdAPRWr86AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:02:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BED6EDC48
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bk5Lbh79;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349928.1607539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weuYe-0006pp-SF; Wed, 01 Jul 2026 13:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349928.1607539; Wed, 01 Jul 2026 13:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weuYe-0006nh-PS; Wed, 01 Jul 2026 13:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1349928;
 Wed, 01 Jul 2026 13:00:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1weuYd-0006nb-Cz
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:00:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weuYc-00Auiz-IY
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:00:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a450f7e-bab6-0a2a0a5309dd-0a2a450aa4c4-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:00:50 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a450f81-e40e-0a2a450a0019-d155da2fd994-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:00:49 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c12629c937eso76023566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 06:00:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1296b1f9cesm182606666b.16.2026.07.01.06.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 06:00:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1782910849; x=1783515649; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XGP3Qh8vro3qsOU3zbt5oj9XZUQ7ke15MmykYN9Mi/w=;
        b=bk5Lbh79u0Hk8mLYimLQ8CJu5Zgs0t2zBneW/N0mI/GGwHKcD+pcVS7OTCVLjqmfll
         xnThAzzXHq64u0tln1ByrA+P8t9s9PGs95UDh2eGiy8LiGbK+s8i8BpCslhw+i96fuvf
         z5k+5fiFhp9kLwiQpM2sinNXsmHSMnWFipqpnL8BaupyL+dCqTelgyPo/wSLS9XCMSVy
         0cuHUNcNVCETgwTZrbRg5e5UpkhekH2yHPG9Wndke7j3k1MztQ4UHlx+Shc/XQ2eRXHk
         pUvkuz7z76QbBrpU0jnfxjUvOaXajY862LBO4HOp2xKoj6r2ecbC7DbrP+9uo+ZK+yNu
         f/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910849; x=1783515649;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGP3Qh8vro3qsOU3zbt5oj9XZUQ7ke15MmykYN9Mi/w=;
        b=ktiZz5Ybfi8kZ3B870d9X1pHkj0pR15YRGRi7BYUUOtDn+89gImF3wClmXeL6tpFEN
         43rLK3uoqFV/LX79l10qMc6CKFerZnvvbrRCHXim8+liU2Jd+JBuNR3gRNhuIcEX/han
         ceqREwq7EiPvblV4u5q2riPwOk5bSoYq/19BImstUxxxvVfTlIZx2Qh0U5rFDraAO/bv
         DPoyCa22ot/IBUpg0UHoUdF7jLsnbseqsGy+6erKNRIe12/upbx58BHZ59RwtGIrxVSB
         U6bZunW9S5RI8Ms03F/nflxxdfICh+OUdzmNHXlHn9927HZtVqUqbogL3pSIjjrPEgRc
         /YMw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ggXV9P91jSyDbK/HU49ER2XA0x1tMBiFW6vxN9DS4IaYqwFH+gBxEIYE4t6AUbEK1MJxvk8eqJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpP0zFHmHYS0uozz8Kj6Tl6bK60ew4mGz09WPOqGLcgU1hSRMf
	QyXAc1tFDbsBC+KwYcXLl6+wJkFJMkHWXBvkXS8o6PrRpUdtmaMBFRETFM6u5s73cSo=
X-Gm-Gg: AfdE7cm+mazFr3ON0L0mcB/d9NLP+9WwT/DolP3CpZa/7XYUbvvFZplB/P8NnV7uwU8
	XCUcUF88aoKBrwZR11DsA6rCO9Hv/pvoGHP3bLWOYOix/n7Vl8bhRVrb7kfabyXzNJXt5McVYoQ
	6ZN7ukme1IyU0+LHJGaTXsHbgz/4PEIrHRsPglSHveR8PsFHB8IZk7lBn5ON/9ezKoXrKwS63e9
	9jmVEJOa3rXi6f6iUz6+HVTClZOKeN2fXA180D6WQWK8Bwwa8rGp4DkT+kcLhXgz34VSm+7sh7a
	OcsXN5bI93sQw6V20+ZfjQ/fwlDWMZbSnQQ1NvVAUbMWCJyZdKoKXIXdFb2xhtjrb9EVwVtAgL9
	UjN4LC1fA8RTFDxVJM9OY+aWqyu0isNTHBGrnHOh9fb5PsaZxKbRy4BG5HULLVQeXL2l2FyFqyf
	Xdy8E22XfGdS3xSq7j0TVm7eVlnPjIPTNs5KrgbWF2lZ4GYvjloDJjSseUvjGkhscPVktzYjfnP
	RIiM8IAW6Wz2UcQRdur21gaKrkGs3nXkMHx0MCZmO4=
X-Received: by 2002:a17:906:6a27:b0:c12:34ed:e0f9 with SMTP id a640c23a62f3a-c12aa1b0d39mr84914366b.55.1782910848946;
        Wed, 01 Jul 2026 06:00:48 -0700 (PDT)
Message-ID: <3c05b2b0-6a83-4046-9de3-c7e3478c2958@suse.com>
Date: Wed, 1 Jul 2026 15:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
 <4524812f-b9ee-4ef5-b5c6-7583815e859b@citrix.com>
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
In-Reply-To: <4524812f-b9ee-4ef5-b5c6-7583815e859b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------D8Dk0SUKGVgnZWk0UYIUxY3D"
X-purgate-ID: tlsNG-4011c0/1782910849-3C876DDE-A7941F31/0/0
X-purgate-type: clean
X-purgate-size: 10528
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64BED6EDC48

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------D8Dk0SUKGVgnZWk0UYIUxY3D
Content-Type: multipart/mixed; boundary="------------znGHoX2KsgMD0EpG2Du8uocr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <3c05b2b0-6a83-4046-9de3-c7e3478c2958@suse.com>
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
 <4524812f-b9ee-4ef5-b5c6-7583815e859b@citrix.com>
In-Reply-To: <4524812f-b9ee-4ef5-b5c6-7583815e859b@citrix.com>
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

--------------znGHoX2KsgMD0EpG2Du8uocr
Content-Type: multipart/mixed; boundary="------------8eJqjVbKDosdQe3AGtdAnLta"

--------------8eJqjVbKDosdQe3AGtdAnLta
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjYgMTM6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzA3LzIw
MjYgMTI6MzkgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDcuMjAyNiAxMzox
NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBUb2RheSB0aGUgWEVOX0RPTUNUTF9zZXR2
Y3B1YWZmaW5pdHkgaHlwZXJjYWxsIHdpbGwgbm90IG9ubHkgY2hhbmdlIHRoZQ0KPj4+IGFm
ZmluaXR5IHNldHRpbmdzIG9mIGEgdmNwdSwgaXQgd2lsbCByZXR1cm4gdGhlIG5ldyBlZmZl
Y3RpdmUgc2V0dGluZ3MsDQo+Pj4gdG9vLg0KPj4+DQo+Pj4gSW4gY2FzZSBhbiBlcnJvciBo
YXBwZW5zIGR1cmluZyB0aGlzIGh5cGVyY2FsbCwgdGhlIGV4cGVjdGF0aW9uIG9mIHRoZQ0K
Pj4+IGNhbGxlciBpcyB0aGF0IHRoZSBhZmZpbml0eSBvZiB0aGUgdmNwdSBkaWRuJ3QgY2hh
bmdlLiBUaGlzIGlzbid0IHRydWUsDQo+Pj4gaG93ZXZlciwgaWYgcGFzc2luZyB0aGUgbmV3
IGVmZmVjdGl2ZSBhZmZpbml0eSBiYWNrIHRvIHRoZSB1c2VyIGlzDQo+Pj4gZmFpbGluZy4N
Cj4+IFRoYXQnbGwgYmUgdGhlIGNhbGxlcidzIGZhdWx0IHRob3VnaC4gQW55IC1FRkFVTFQg
Y29taW5nIGJhY2sgYXJlIGFuDQo+PiBpbmRpY2F0aW9uIHRoYXQgdGhlIGNhbGxlciBuZWVk
cyBmaXhpbmcuDQo+Pg0KPj4+IEluc3RlYWQgb2YgbWFraW5nIGVycm9yIGhhbmRsaW5nIGlu
IHRoZSBoeXBlcnZpc29yIGV2ZW4gbW9yZSBjb21wbGV4LA0KPj4+IGp1c3QgY2hhbmdlIHRo
ZSBpbnRlcmZhY2UgYnkgTk9UIHBhc3NpbmcgYmFjayB0aGUgbmV3IGFmZmluaXR5LiBJdCBj
YW4NCj4+PiBlYXNpbHkgYmUgb2J0YWluZWQgYnkgYW5vdGhlciBYRU5fRE9NQ1RMX2dldHZj
cHVhZmZpbml0eSBjYWxsIGlmDQo+Pj4gbmVlZGVkLg0KPj4gQXQgdGhlIGV4cGVuc2Ugb2Yg
ZnVydGhlciBpbmNyZWFzaW5nIHRoZSBwcmVzc3VyZSBvbiB0aGUgZG9tY3RsIGxvY2suDQo+
PiBXaGVuIG1ha2luZyB0aGUgcmVjZW50IGVycm9yIGNvZGUgY2hhbmdlIGluIHRoaXMgYXJl
YSwgSSB3YXMgYWN0dWFsbHkNCj4+IHdvbmRlcmluZyBpbiBob3cgZmFyIHRoZXNlIHR3byBz
dWItb3BzIG1pZ2h0IGFsc28gYmUgY2FuZGlkYXRlcyBmb3INCj4+IG1vdmluZyBvdXQgb2Yg
dGhlIGxvY2tlZCByZWdpb24uIFlldCB3aXRoIHZjcHVfYWZmaW5pdHlfZG9tY3RsKCkgbm90
DQo+PiB1c2luZyBhbnkgbG9ja2luZyB0aGF0IGRpZG4ndCBsb29rIGVudGlyZWx5IHN0cmFp
Z2h0Zm9yd2FyZCB0byBhbnN3ZXIuDQo+IA0KPiBIb3cgZG9lcyB0aGUgZWZmZWN0aXZlIHNl
dHRpbmcgZGlmZmVyIGZyb20gd2hhdCdzIHBhc3NlZCBpbj8NCg0KVGhlIGhhcmQgYWZmaW5p
dHkgbWlnaHQgZGlmZmVyIGluIGNhc2UgdGhlIHRhcmdldCBkb21haW4gaXMgaW4gYSBjcHVw
b29sDQpub3QgY292ZXJpbmcgdGhlIHdob2xlIG1hY2hpbmUgYW5kIGUuZy4gImFsbCIgaXMg
cGFzc2VkIG9uIGlucHV0LiBUaGUNCmVmZmVjdGl2ZSBzZXR0aW5nIHdpbGwgaGF2ZSBvbmx5
IHRoZSBDUFVzIG9mIHRoZSBjcHVwb29sIHNldC4NCg0KPiBJIGhhZG4ndCBldmVuIHJlYWxp
c2VkIHRoYXQgd2UgcGFzcyBkYXRhIG91dCBvZiB0aGUgc2V0IG9wLCBhbmQgaXQgZG9lcw0K
PiBzbWVsbCBvZiBiYWQgQVBJIGRlc2lnbi4NCg0KWWVzLCBlc3BlY2lhbGx5IGFzIHRoZSBk
YXRhIGlzIHVzZWQgb25seSBieSBvbmUgY2FsbGVyIGZvciB2ZXJpZmljYXRpb24uDQoNCj4g
V2hpbGUgd2UgZG8gY2FyZSBhYm91dCB0aGUgZG9tY3RsIGxvY2ssIEkgZG9uJ3QgY29uc2lk
ZXIgImV4dHJhIHByZXNzdXJlDQo+IG9uIGl0IiBhcyBhIHZhbGlkIGFyZ3VtZW50IHRvIGJl
IHVzZWQgaGVyZS7CoCBJdCdzIGFuIGludGVybmFsIGRldGFpbCwNCj4gd2hlcmVhcyB0aGUg
aHlwZXJjYWxsIEFQSSBpcyBhbiBleHRlcm5hbCBkZXRhaWwuDQoNCg0KSnVlcmdlbg0K
--------------8eJqjVbKDosdQe3AGtdAnLta
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8eJqjVbKDosdQe3AGtdAnLta--

--------------znGHoX2KsgMD0EpG2Du8uocr--

--------------D8Dk0SUKGVgnZWk0UYIUxY3D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpFD4AFAwAAAAAACgkQsN6d1ii/Ey+M
kwf/SWInyPW89P95ELLY/48zP6HEFuTsDDmDC0HRthkslpClMORJnn/+0ZcWeCPhz3duFm3nOWN+
UL+fwrnpo7mdXkyQM0FOhyt+L4t44/epCHhrUjnSQCqTSD6eNRXFRtLP3L6fwr8tfbhRoXh+2Oye
NIhbT7UyKwwjF2ApIcKVfeOTDuNq0K3AZi4NL0tTtJeGzd5TGv0xgSR7bjhXuY1joYPnpKbp/moK
30/Ookh/79+pWB66TtI+0w1SLInyPgs5BrTPoCSnDTpzOlsOkX9FvhmLBkHFbxPjnvkTg0gwa+/f
DFBWYzoPX3yacglDZsVWwGOpZICI+29+UyjH8IXaNw==
=bCS/
-----END PGP SIGNATURE-----

--------------D8Dk0SUKGVgnZWk0UYIUxY3D--

