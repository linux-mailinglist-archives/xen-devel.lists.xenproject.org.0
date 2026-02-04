Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJtgKfceg2nWhwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:27:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A7E478F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220380.1529089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vna5j-0000MY-Bb; Wed, 04 Feb 2026 10:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220380.1529089; Wed, 04 Feb 2026 10:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vna5j-0000Jb-8j; Wed, 04 Feb 2026 10:26:35 +0000
Received: by outflank-mailman (input) for mailman id 1220380;
 Wed, 04 Feb 2026 10:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vna5h-0000JU-Qq
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:26:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9602e84-01b3-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 11:26:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso1165282666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:26:32 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8ea001eba8sm108851166b.48.2026.02.04.02.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:26:30 -0800 (PST)
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
X-Inumbo-ID: f9602e84-01b3-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770200791; x=1770805591; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lvb/s+ZQ1PoJCb/WFr4HXElwd2DuPk01YtthyuVLgaQ=;
        b=XGz5tubUDcB2rbAmuao0HwNDimxI539orxtid2HOsHMxVfxJvTIogHEwIdmU8Zs01Z
         4qhtGQ6ATU5RjAs3zVJKPk4Br0NpRBjpzxLCOa/2KwVjd5FWBckwceHxpNrRcI6qIrAz
         Jux6Nj/8pSLAmAq+skrdrtBIld+G2RjTzIQLLogOfmNcQUfQdTcaIFUbmMVhMJ+hQoED
         Kas+IzJ+pVYu3A9jGP4rultG9q8NMXFVbn33fafPxoYcars0MMJZv8L0nJsUHsLHf1PC
         doJ+IUBC9CTQ+t26bg8ZtnVZbHTi6FMm1kV5EEv2uA3ALuX9wvazayN1fjXFQVk8GLV9
         45Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200791; x=1770805591;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvb/s+ZQ1PoJCb/WFr4HXElwd2DuPk01YtthyuVLgaQ=;
        b=aZYOTxAn4EolQVvXFaLca5umqaDNvUnmyvr0G3r/4HwaO+Vs73qORSAwmsdxUrARR6
         TSkPd28EDm7XnRQPAZoHSYlx+0ku35RSWyFu9yiUFgpG/dCLfPgCNjLGRYYJP9eGJrsp
         xVdvHl8xcfJKGOIVNs/wyIatUHXwytlDjAfNM1AjoXI/QjLnUpl8JKgCM3wq8RZusAi3
         1CllHTG+saae+tzYd3staq1kOBMCBB5KN50wJgLFYV+5v8InABFb4h9A/E/QyFenwSG4
         OFJyCzWat9H46SSW94cIQSIwKT/SgKnw6aoz1H4wCOAPpClY8D9J0q9sudRTyb8M7L3z
         kSJA==
X-Forwarded-Encrypted: i=1; AJvYcCUQn8pkFWm/g1wwW9DQt6E0yPF+eHAWKimx7dM2Slb7OR5502naFIu7QF4K+umkTqxPNlz23H+IFRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW+F2470z1S1rD4wi61rpkeYqQRpX5ofmQows8rIgVUuXvQthf
	Ws+xS6fI6VCHNe/B2Pqfy+y6oBN6ETsajNjci3Cnz/ROPKxXXBiIB3bfhWJju2a+zLk=
X-Gm-Gg: AZuq6aL566lHMzWKepx/hrn2e6YOmP1y8qf+GcraFLJMyShLttuInH0inZ59ToILTFe
	3OqoRxMWoQCTENkdrk2sGAGEJxMowz6vAH1pnLI6b59hD4O+BwrFKK6nFlh82/V8H6BVigRRe84
	da7ItoprK84J/GIJgJEN4ed9d2Wv6Bm6twZNbZIxF+DBCOe7gHKoRde8z1tipFi8eiXX9RlW7NS
	6Q4cntxLCC7ladDw6Y5JUeeY1w+b5Cfq4KYwtSUEJ2O9QiG7X8wjrzMqO0DL+4+t7YRkbWM0kJ5
	X6EC57ftYon9xRsn/FVf5JtW8Qu7K1ZGEmv2Sk++k24iT/9m3bPy/kXz+VeZ3Ka8H/QdzP0aiun
	wL5YD+Mf1t+hr0jP/gpE7lIWZkCO+ipVy3Ul/kGOCLykwCLmRPlwc4lrEGekRpO7mo9ACnXlnFd
	AhV/4igkTKcYohG62mprzga8cREddSuDHiCAxyg26nC8ZUUtrkWCFQ0xS1m7JIGDYRa0l3VaDtC
	SXDaWQDh+5LjHO4ZhJhoJisQ7bZCave4URdOw==
X-Received: by 2002:a17:907:5c9:b0:b88:713e:78a5 with SMTP id a640c23a62f3a-b8e9f10d7afmr185782966b.28.1770200791186;
        Wed, 04 Feb 2026 02:26:31 -0800 (PST)
Message-ID: <306ba24c-efe9-4dd6-bb6c-19bb5195c410@suse.com>
Date: Wed, 4 Feb 2026 11:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
 <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
 <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
 <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
 <17480ac0-438b-4af5-b733-f51eedd6e7a4@suse.com>
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
In-Reply-To: <17480ac0-438b-4af5-b733-f51eedd6e7a4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OkwD5DPgi4NP0h07v0JMGjgr"
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 151A7E478F
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OkwD5DPgi4NP0h07v0JMGjgr
Content-Type: multipart/mixed; boundary="------------O1weGE6xePw50M8PikxURbZl";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <306ba24c-efe9-4dd6-bb6c-19bb5195c410@suse.com>
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
 <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
 <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
 <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
 <17480ac0-438b-4af5-b733-f51eedd6e7a4@suse.com>
In-Reply-To: <17480ac0-438b-4af5-b733-f51eedd6e7a4@suse.com>
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

--------------O1weGE6xePw50M8PikxURbZl
Content-Type: multipart/mixed; boundary="------------mlOUH2JiaL0P5SZcu4Qnjh5I"

--------------mlOUH2JiaL0P5SZcu4Qnjh5I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjYgMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMi4yMDI2
IDExOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDQuMDIuMjYgMTE6MDQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIwMjYgMTE6MDEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA0LjAyLjI2IDEwOjUxLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDA0LjAyLjIwMjYgMTA6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gT24gMDQuMDIuMjYgMTA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAw
NC4wMi4yMDI2IDEwOjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+Pj4gT24g
V2VkLCBGZWIgMDQsIDIwMjYgYXQgMDg6NTY6MTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+Pj4+Pj4gT24gMDQuMDIuMjAyNiAwODo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToNCj4+Pj4+Pj4+Pj4gQWxzbywgSSB3b3VsZCByZW1vdmUgdGhlIHRvb2xzIGd1YXJk
cywgSSB0aGluayBvbmNlIGEgRE9NSURfIGNvbnN0YW50DQo+Pj4+Pj4+Pj4+IGlzIGFsbG9j
YXRlZCBpdCBiZWNvbWVzIHBhcnQgb2YgdGhlIHB1YmxpYyBBQkksIGFuZCBpdCBjYW5ub3Qg
YmUNCj4+Pj4+Pj4+Pj4gd2l0aGRyYXduLiAgU2VlIGZvciBleGFtcGxlIERPTUlEX0lETEU6
IGl0J3Mgb25seSB1c2VkIGludGVybmFsbHkgaW4NCj4+Pj4+Pj4+Pj4gdGhlIGh5cGVydmlz
b3IgQUZBSUNULCB5ZXQgdGhlIGRlZmluZSBpcyBmdWxseSB2aXNpYmxlIGluIHRoZQ0KPj4+
Pj4+Pj4+PiBoZWFkZXJzLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSXQgd2FzIG1lIHRvIGFz
ayBmb3IgaXQgdG8gYmUgZ3VhcmRlZCBsaWtlIHRoaXMuIERPTUlEX0lETEUgKGFuZCBwZXJo
YXBzDQo+Pj4+Pj4+Pj4gb3RoZXJzKSBub3QgYmVpbmcgZ3VhcmRlZCAoYXQgbGVhc3QgZm9y
IElETEU6IGJ5IGp1c3QgX19YRU5fXykgaW1vIHdhcyBhDQo+Pj4+Pj4+Pj4gbWlzdGFrZS4g
VGhhdCBtaXN0YWtlIG1heSBpbiBmYWN0IGJlIGNvcnJlY3RhYmxlLCBpZiB3ZSBjb3VsZCBw
cm92ZSB0aGF0DQo+Pj4+Pj4+Pj4gdGhlIElEIGNhbm5vdCB1c2VmdWxseSBiZSBwYXNzZWQg
aW50byBhbnl3aGVyZS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBFdmVuIGlmIGl0J3Mgbm90IHBh
c3NlZCBpbnRvIGFueXRoaW5nLCBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZ3VhcmQNCj4+Pj4+
Pj4+IHRoZW0/ICBUaGUgcmVzZXJ2ZWQgZG9taWQgdmFsdWVzIGFyZSBhbHJlYWR5IGNvbnN1
bWVkLCBpZTogY2Fubm90IGJlDQo+Pj4+Pj4+PiByZXVzZWQgaW4gYW55IHdheS4gIEl0IGp1
c3Qgc2VlbSB0byBtZSBsaWtlIG1vcmUgaWZkZWZlcnkgY2h1cm4gZm9yIG5vDQo+Pj4+Pj4+
PiBzcGVjaWZpYyBiZW5lZml0Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXZWxsLiBGcm9tIGFuIGFi
c3RyYWN0IHBlcnNwZWN0aXZlLCBwdXJlbHkgaHlwb3RoZXRpY2FsIGF0IHRoaXMgcG9pbnQs
IEkNCj4+Pj4+Pj4gY291bGQgc2VlIGEgcG90ZW50aWFsIG5lZWQgdG8gcmUtbnVtYmVyIHRo
ZW0sIGUuZy4gdG8gc2ltcGxpZnkgY2hlY2tpbmcNCj4+Pj4+Pj4gYWdhaW5zdCBncm91cHMg
b2YgdGhlc2Ugc3BlY2lhbCBJRHMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFllcywgZXhjZXNzICNp
ZmRlZi1hcnkgaXMgYW4gaXNzdWUuIEV4Y2VzcyBleHBvc3VyZSBvZiB0aGluZ3MgYWxzbyBp
cywNCj4+Pj4+Pj4gdGhvdWdoLiBGaW5kaW5nIHRoZSByaWdodCBiYWxhbmNlIGJldHdlZW4g
Ym90aCBjYW4gYmUgaW50ZXJlc3RpbmcuDQo+Pj4+Pj4NCj4+Pj4+PiBJIGhhdmUgYSBwYXRj
aCBpbiB3b3JrIHdoaWNoIHdvdWxkIHdhbnQgRE9NSURfQU5ZIG5vdCBiZSBndWFyZGVkLiBJ
IHRoaW5rDQo+Pj4+Pj4gZXNwZWNpYWxseSBET01JRF9BTlkgY291bGQgYmUgdXNlZnVsIGZv
ciBvdGhlciBjYXNlcywgdG9vLg0KPj4+Pj4NCj4+Pj4+IE1pbmQgbWUgYXNraW5nIHdoZXJl
LCBvdXRzaWRlIG9mIHRoZSB0b29sc3RhY2ssIHlvdSBpbnRlbmQgdG8gdXNlIGl0Pw0KPj4+
Pg0KPj4+PiBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIHVzZSBpdCBmb3IgWGVuc3RvcmUgcGVy
bWlzc2lvbnMuDQo+Pj4+DQo+Pj4+IFByaW1hcnkgdXNlIGNhc2Ugd291bGQgYmUgdG8gYWxs
b3cgdGhlIHNwZWNpYWwgd2F0Y2hlcyBmb3IgZG9tYWluIGNyZWF0aW9uDQo+Pj4+IGFuZCBy
ZW1vdmFsIHRvIGJlIHVzYWJsZSBmb3IgYWxsIGd1ZXN0cywgYnV0IHRoZXJlIG1pZ2h0IGJl
IHVzZSBjYXNlcyB3aGVyZQ0KPj4+PiBhIGRvbVUgd2FudHMgdG8gZ2l2ZSBub2RlIHJlYWQg
YWNjZXNzIGZvciBldmVyeW9uZS4NCj4+Pg0KPj4+IFdvdWxkIHRoYXQgcmVxdWlyZSBleHBv
c2luZyBiZXlvbmQgdGhlIHRvb2xzdGFjaydzIGJvdW5kYXJpZXM/DQo+Pg0KPj4gWWVzLCBh
cyB0aGlzIHdvdWxkIHJlcXVpcmUgdGhlIHVzZXIgdG8gc3BlY2lmeSBET01JRF9BTlkgYXMg
dGhlIGRvbWlkIGluDQo+PiBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMuDQo+IA0KPiBIbW0sIEkg
c2VlLiBJIHdvbmRlciB0aG91Z2ggd2hldGhlciB0aGluZ3MgbGlrZSB0aGlzIHdvdWxkbid0
IHdhbnQgYSBzZXBhcmF0ZQ0KPiBsYXllciBvZiBhYnN0cmFjdGlvbiwgc3VjaCB0aGF0IHVz
ZXJzIG9mIHRoZSBsaWJyYXJ5IHdvbid0IG5lZWQgdG8gaW5jbHVkZQ0KPiAoYW5kIGhlbmNl
IGhhdmUgYXZhaWxhYmxlKSBYZW4ncyBwdWJsaWMgaGVhZGVycy4NCg0KQ3VycmVudGx5IG1v
c3QgbGlicmFyeSBoZWFkZXIgZmlsZXMgI2luY2x1ZGUgb25lIG9yIG1vcmUgWGVuIHB1Ymxp
YyBoZWFkZXJzLg0KDQp4ZW5zdG9yZS5oIGUuZy4gYWxyZWFkeSBkZXBlbmRzIG9uIHhlbi9w
dWJsaWMvaW8veHNfd2lyZS5oLg0KDQoNCkp1ZXJnZW4NCg==
--------------mlOUH2JiaL0P5SZcu4Qnjh5I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mlOUH2JiaL0P5SZcu4Qnjh5I--

--------------O1weGE6xePw50M8PikxURbZl--

--------------OkwD5DPgi4NP0h07v0JMGjgr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmDHtYFAwAAAAAACgkQsN6d1ii/Ey96
5Qf7BPvRh/laZBb+gF/G2vghxwH3W866FBbl5Aof/dzaz6LyrPmUz3oKf4v5H8d8UNHD+NDWV0AR
g0GDHYL105m5byLV2/jZNOZBcsdeaE0jFQsmonroOQEZn/JCRHKsFsC2qo+fLO8Pq7CQlCEVpMl5
5vnejw9u7a/xJElDHi470WedxV/sgzhxAPUVOEv2pnmWyhrzmomevsLp7XsOmp+hJqFNpKW1sPLt
1cFEjkf0AFvQSjxL9vH2J9dF3ABC/baSAtyWCT18/NGPUeovNU/pHvn0e+fXE3WU374ccl0qWbsP
+IRX99tIu3tbj/IhVUwuNHdZ9qmVpbJQnseaZVZdFg==
=AJUD
-----END PGP SIGNATURE-----

--------------OkwD5DPgi4NP0h07v0JMGjgr--

