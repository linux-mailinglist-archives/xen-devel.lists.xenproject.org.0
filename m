Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF2C80126
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170289.1495362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUNq-0001Ad-9o; Mon, 24 Nov 2025 11:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170289.1495362; Mon, 24 Nov 2025 11:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUNq-00018w-5r; Mon, 24 Nov 2025 11:05:26 +0000
Received: by outflank-mailman (input) for mailman id 1170289;
 Mon, 24 Nov 2025 11:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNUNo-000142-OW
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:05:24 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78bb90f9-c925-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 12:05:22 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso7344982a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 03:05:22 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536442993sm12335989a12.27.2025.11.24.03.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:05:21 -0800 (PST)
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
X-Inumbo-ID: 78bb90f9-c925-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763982322; x=1764587122; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pxQ5a4aTYbkKnAIZwzUDrthL/kvbIywDORrGo/Jbw4s=;
        b=e0AggBJlEgO/2xkYgz5z6ndJqlRxXI1xq1ArZ7yJCj1F0Tsd5wD65r3VfrLAoV6s84
         NKqGGmELwhIM58i1v+QaT4y5xJGTaxs2vpYWe8naFImG6FsjbLUdOY+Px94Gu/t572dq
         1K89Xgq//k7JdHzedV+EEcgARx34oqdHGidXXCfuWYXuk9jCUgbaKQTBArN1QlZXglak
         DdTYsmfsIdrE72IHgvfqZRM15sz8xuUoXxZ+sB3mdTNPyRwdP2dRwjuAvgkTMcxC/PjY
         Zhki/8O+RDekQnWyfgf5qRLH8LYMjat6VytT8r1fZlJqFz+l3HSayImSP6ixS+53+9ck
         IVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982322; x=1764587122;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxQ5a4aTYbkKnAIZwzUDrthL/kvbIywDORrGo/Jbw4s=;
        b=U9ZV79nqc3dHTlVOBoSuus2oaCjN/Fojo02LyRHrA936pDVC5isCw5nkHycgyLUPlE
         dHoBtP8aitC1DX+kBn3o4f4KjubB2DhgcbWWHm8MCGAHaeHidRYeUduL4y2a2LD645bJ
         NnaowMC5TRG/xi0hL4zpNLXrOCeYBH9RXFz+2LbeZOFd+ZLcGo27b0y5wkvIHgiNKfjB
         8HMgVdbO5tgPhhJPPA9xC+nnRlh3pghQsNe4ajTUGOYlsr6/Urwg3IuvPY/3GCH/Iwfv
         XP0QCgHP36N4DEG6jCehjVpmX+1tmjVxf2tiG1eRdrfB4JCqglMwYNPM01xhr9HUxkQ6
         uvHw==
X-Forwarded-Encrypted: i=1; AJvYcCVix5ljYF2v2X6uz8Jh5OSHk0a7HN4pWYAgeo0cjv76qeT3q8aOfZGp2rXESBqwkbuBnGeUY+jS0lg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUeu3U7qQKmqDajJFycWcgdNHG7wNpCvOwydEK1kjvx8GajPNj
	iUmN0Vi4Ia4cvRaiYNmdJQQ+o5KHrGvL43hlMJmcp75o8oy0sNyvBsXmWmxewy03BA+wnWZIt8k
	1Pnqtxig=
X-Gm-Gg: ASbGncsl5KjU4ofYcfHmIxRAJCoSdb/K8IguZv9gb6mFAROHM+ISu91cAfHh6jsN13o
	jF9IUjaSE+pwRygHqfP/x8nlYFpUkWMVdSKJRnx1sEkU8qS0J2sO+5MTTy2p4VvbCuOe1T0H1is
	+fHrGimnjIyh3AZ2lhY5GUXuL2ZA3CUiFp5v4SNRCDPlQB/YDIs6O9kNha8ouQCGkALB+ipDn5I
	Kjvdhl78F+7mf3BMAf2hVAHKbBrepKajGTSIK9JPAfC6XvRjbopGyO5km+hdmktx/jiGbDqGAXe
	VU/nw0WkC6USFxy3AWMAPdtkm7YqtZztA8cQrw+3Gtj4m3ik9E80bYITL08aN3TXW/FWMW/v+Dx
	5IFSnouTVlZQyfo2JmdpB7/N84HhdICvx5P484xGg04KQssBVoKTEqlUTdpligbr4VpjJya4vki
	cg5KWIfVwLSdMQjj1Sy+oqSTXj28GDKpczI5lWqLdMAr6XX7k8OS3U8d+KBRZgQwuV1O5eSV2vE
	jOx5RtI38tF9DB2XSUoe5FhURfVjSRVJEGpaUs=
X-Google-Smtp-Source: AGHT+IEct/5lurO8jyhrCUtHAdby6h1EaMIZcmpU0nrjAYLT/m+oN3L3JOILjtTTbDAknB8X5atvaA==
X-Received: by 2002:a05:6402:210d:b0:640:ebca:e682 with SMTP id 4fb4d7f45d1cf-64554674c2bmr8880510a12.21.1763982321861;
        Mon, 24 Nov 2025 03:05:21 -0800 (PST)
Message-ID: <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
Date: Mon, 24 Nov 2025 12:05:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
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
In-Reply-To: <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nOmVo6TWtXlwubB0TlRpZT2N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nOmVo6TWtXlwubB0TlRpZT2N
Content-Type: multipart/mixed; boundary="------------nwJd9KJEVi6CYgfZNLrJquar";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
In-Reply-To: <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
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

--------------nwJd9KJEVi6CYgfZNLrJquar
Content-Type: multipart/mixed; boundary="------------gxZo00q2qAhI0I3jPIOnAxSr"

--------------gxZo00q2qAhI0I3jPIOnAxSr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMTE6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4xMS4yMDI1
IDE0OjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvQ29uZmlnLm1rDQo+PiAr
KysgYi9Db25maWcubWsNCj4+IEBAIC0xNTksNiArMTU5LDE5IEBAIGRlZmluZSBtb3ZlLWlm
LWNoYW5nZWQNCj4+ICAgCWlmICEgY21wIC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEp
ICQoMik7IGVsc2Ugcm0gLWYgJCgxKTsgZmkNCj4+ICAgZW5kZWYNCj4+ICAgDQo+PiArUEFU
SF9GSUxFUyA6PSBQYXRocw0KPj4gK0lOQ19GSUxFUyA9ICQoZm9yZWFjaCBmLCAkKFBBVEhf
RklMRVMpLCAkKFhFTl9ST09UKS9jb25maWcvJChmKS5taykNCj4+ICsNCj4+ICtpbmNsdWRl
ICQoSU5DX0ZJTEVTKQ0KPj4gKw0KPj4gK0JVSUxEX01BS0VfVkFSUyA9ICQoZm9yZWFjaCBm
LCAkKFBBVEhfRklMRVMpLCAkKHNoZWxsIGF3ayAnJCQyID09ICI6PSIgeyBwcmludCAkJDE7
IH0nICQoWEVOX1JPT1QpL2NvbmZpZy8kKGYpLm1rLmluKSkNCj4gDQo+IEZlZWxzIGxpa2Ug
bXkgcHJpb3IgY29tbWVudHMgd2VyZW4ndCByZWFsbHkgYWRkcmVzc2VkLiBJIGNvbnRpbnVl
IHRvIHRoaW5rIHRoYXQNCj4gbm9uZSBvZiB0aGUgYWJvdmUgaXMgcGFydCBvZiB3aGF0IHRo
ZSBzdWJqZWN0IHNheXMuDQoNCkkgcmVhbGx5IGRvbid0IHVuZGVyc3RhbmQgeW91ciBjb25j
ZXJuIGhlcmUuDQoNCkZvciByZXBsYWNpbmcgdGhlIEBtYXJrZXJzQCBtYWtlIG5lZWRzIHRv
IGtub3cgd2hhdCBzaG91bGQgYmUgcmVwbGFjZWQuDQpTbyBpdCBuZWVkcyB0byBzY2FuIHRo
ZSBmaWxlcyBjb250YWluaW5nIHRoZSBtYXJrZXJzIGFuZCBnYXRoZXIgdGhlbS4NClRoaXMg
aXMgd2hhdCBpcyBkb25lIGFib3ZlLg0KDQpJbiB0aGUgZmluYWwgbWFjcm8gYmVsb3cgdGhl
IHJlcGxhY2VtZW50cyBhcmUgZG9uZSB0aGVuLiBIb3cgd291bGQgeW91DQpoYW5kbGUgdGhh
dD8NCg0KPiANCj4+ICsjIFJlcGxhY2UgQHh4eEAgbWFya2VycyBpbiAkKDEpLmluIHdpdGgg
JCh4eHgpIHZhcmlhYmxlIGNvbnRlbnRzLCB3cml0ZSB0byAkKDEpDQo+PiArZGVmaW5lIGFw
cGx5LWJ1aWxkLXZhcnMNCj4+ICsgJCgxKTogJCgxKS5pbiAkJChJTkNfRklMRVMpDQo+IA0K
PiBJIGZ1cnRoZXIgdW5kZXJzdG9vZCB5b3VyIHJlcGx5IHRvIG15IHYyIGNvbW1lbnQgdGhl
IHdheSB0aGF0IHlvdSB3b3VsZCBkcm9wIHRoZQ0KPiBzbGlnaHRseSBvZGQgbGVhZGluZyBi
bGFuayBmcm9tIGhlcmUuDQoNCk9oLCB3aXRoIG5vIGZ1cnRoZXIgcmVzcG9uc2UgSSBkaWRu
J3Qgc2VlIGEgcmVhc29uIHRvIGFjdCBpbW1lZGlhdGVseS4NCg0KDQpKdWVyZ2VuDQo=
--------------gxZo00q2qAhI0I3jPIOnAxSr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gxZo00q2qAhI0I3jPIOnAxSr--

--------------nwJd9KJEVi6CYgfZNLrJquar--

--------------nOmVo6TWtXlwubB0TlRpZT2N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkkO/EFAwAAAAAACgkQsN6d1ii/Ey/n
Rgf/ahsPJpp1rubPXjpoTWlreBmZj4TcsbnwgfhRvQSF6K0YLdfRdg2/3rUz+T5dpA7Fpccgc8GN
KyVj4/3/bpbHNWWQnpZzwSP3hJX8ggvn7RUYvGv4jHsX1LfaGmLZ/Xx2kLEpRv1s4TBF6C4ImMWc
tzCZOCSZyXajlcQVVIkdJ6DYHkutvpvh0XkeQCE2Dx+mMCj9EoF4900682OlW91RQh77htJmIQKH
qyYQhvwgEFr/DIkod1nrAhHlWynY+XzcC/g1QSyKDDrPAas9D9mGCr7h96NgoRpyKQoGkakcq7uL
N+NSlSbYX7kxqltfxApcMaPskvqRF0KzuhPZssn55A==
=JTdP
-----END PGP SIGNATURE-----

--------------nOmVo6TWtXlwubB0TlRpZT2N--

