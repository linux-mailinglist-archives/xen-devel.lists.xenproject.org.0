Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AyuArPhw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:22:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B170325A7D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262310.1554864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OC0-0000wt-MO; Wed, 25 Mar 2026 13:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262310.1554864; Wed, 25 Mar 2026 13:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OC0-0000ui-JN; Wed, 25 Mar 2026 13:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1262310;
 Wed, 25 Mar 2026 13:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w5OBz-0000ub-C9
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5OBy-00GFEK-A0
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:22:38 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c3e191-e002-0a2a0a5209dd-0a2a4501a084-42
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:22:38 +0100
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c3e19d-6400-0a2a45010019-d155da2bf081-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:22:37 +0100
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so324506366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:22:37 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b98335f1747sm790969366b.33.2026.03.25.06.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:22:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1774444957; x=1775049757; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+cqNa7YcOUKSoQ7EG4ov8dwqBhYtaSI/mWmcIOm5G0=;
        b=HwCxTHyNKh+3r9qfk+gBOaKHw/arTvKigSlCqXsgI81SvkQhzgQb1sFjFnLvlpW5XJ
         IyKTxJoAmQguYjWgy7g/ei4AwZDQPOqm+/3F4eGGqSJ7HywcRPb1tggkpkLfWxsFSoif
         G+/33R7RvPHwiRYAakggkrzEvfojm+Iz+H21tKFtcEtqPhOegWTyidfV7xE0lk+zBseS
         WeerN1LqWskDX4NQd5MVKuIAw6e6XTBLGjnzzx3t3kF6Rw6GbqTwdM3k8VpFP8twUu4i
         0TvKn55uqhY+ZaRSriP6GEm7wdwaASyn7MIVoCxMr1ubMH1nWNtI38F1TyiLlesLHA5R
         eHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444957; x=1775049757;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+cqNa7YcOUKSoQ7EG4ov8dwqBhYtaSI/mWmcIOm5G0=;
        b=BlREWzfCqm0INP2rOMQIN4NSEZa30wsIIIW7ENusC0a2iZCcStl43K5iB3qzB39391
         HvjiYRGA3dMyfDc3ie5ql7RwEU7mAXSBYFioQuoGF///pFsGEMkA7LC2DFDkReRSvm3C
         d1bitj01Hpo+cDFOp/+q1D6XjtOWmXmPL0to/jWgtbiEl4YZiplODyOcT+tIVk12ilee
         gI/jh8C+U86nsMBGzlxAjzs5odMWu0Z8dtENX3XxQxjo0hr3jqzRcKRy+dZHtFUisQxF
         KDlVx5pqM+gJJMyyf5I2MFVWCe+NiDr66cFzKKONeWYHdqsgyZnUCAJRdYwyipTBB6Oc
         /2dA==
X-Forwarded-Encrypted: i=1; AJvYcCW86Y0Kt7PWG8vFRGh3m46TD5+zqphlc+6fiRrHSjCApQq/3vJmgVqjcnV8zI0lDit46/0I1saQaAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9J8o9BMbYskFX0QtKX0Rj7qy4Sb3ILpiK1VdW92iHuIivG/hu
	ixav97lwLGCjrV+0mdlxkYm7as0orbKvuZKnSfJtrhk53wSTEdoL9gE6s7+vD/XNm3I=
X-Gm-Gg: ATEYQzxod5JUZpv3yUx15HrhKT2lFecofhlMW8uncN/mU+BWPWZclea3cUVHFNJtnPm
	Pl52IHYCegJacTsHckWRldRgnE0JkBAjKZQklj1EZVRn+v3GOp4dtCs5tj4/gfBRb9Uw0j5Lb4X
	1ZNZJfbJ1+/BHYD4QIjudLeY+TrDdVk9G4TYhSVATzVW7lwzC93iPLSL6M/F8lEB3ZJQ1qoExI8
	SYkt4hP6rU/i1CcJhT+Q7ZfeMAolAF1FrVwDC9q5JdiDULDKPHGRzjJwWpGRTavSjenIJXhTWxJ
	sJFjhuTNGZYzna8dfBQ1HprcnJnCeKaC4sau31q3Zu3oSi03YD5nZYbEFnhZVneitDLzh9ZpPzl
	Y/xeRwpCJ5voCaT3fmAAb7hW4+7omfWZZ45V4skQSXZngj8cGHKLH5ooRn0JtH+qSLpK2FR0gRk
	+dECdfzEm+i3iVcttoubrYbRllPkA0lQINYyPNXPXOZbSoL3pQSb+o+gRt2i9WkQC8AJBn2noM6
	f+OWLhl4r6rQuV03ok7xyLoqT2KR7KpyY/aKWwToYfI5acksK83WQ==
X-Received: by 2002:a17:907:8694:b0:b98:11cb:5fa9 with SMTP id a640c23a62f3a-b9a3f1ac473mr246395666b.22.1774444957033;
        Wed, 25 Mar 2026 06:22:37 -0700 (PDT)
Message-ID: <362f599f-b195-49da-8c53-1db69add203f@suse.com>
Date: Wed, 25 Mar 2026 14:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arinc653: avoid array overrun
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
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
In-Reply-To: <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E8kN60KZ20qHA15vjNqk2d4C"
X-purgate-ID: tlsNG-d62444/1774444957-228E5DF3-7012851D/0/0
X-purgate-type: clean
X-purgate-size: 9513
X-Spamd-Result: default: False [-2.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4B170325A7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E8kN60KZ20qHA15vjNqk2d4C
Content-Type: multipart/mixed; boundary="------------HJ35cNX2pDmumbNuSRbjSygA";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Kamil Frankowicz <kamil.frankowicz@cert.pl>
Message-ID: <362f599f-b195-49da-8c53-1db69add203f@suse.com>
Subject: Re: [PATCH v2 3/3] arinc653: avoid array overrun
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
In-Reply-To: <7829c799-64b2-4686-8895-6ec73231c5d8@suse.com>
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

--------------HJ35cNX2pDmumbNuSRbjSygA
Content-Type: multipart/mixed; boundary="------------Dq40zhO00aWGOwD49nfIA4Ox"

--------------Dq40zhO00aWGOwD49nfIA4Ox
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjYgMTM6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBJbmNyZW1lbnRpbmcg
LT5zY2hlZF9pbmRleCBiZXR3ZWVuIGJvdW5kcyBjaGVjayBhbmQgYXJyYXkgYWNjZXNzIG1h
eQ0KPiByZXN1bHQgaW4gYWNjZXNzaW5nIG9uZSBwYXN0IHRoZSBhcnJheSB3aGVuIHRoYXQg
aXMgZnVsbHkgZmlsbGVkDQo+ICgtPm51bV9zY2hlZHVsZV9lbnRyaWVzID09IEFSSU5DNjUz
X01BWF9ET01BSU5TX1BFUl9TQ0hFRFVMRSkuDQo+IA0KPiBGaXhlczogMjI3ODdmMmUxMDdj
ICgiQVJJTkMgNjUzIHNjaGVkdWxlciIpDQo+IFJlcG9ydGVkLWJ5OiBLYW1pbCBGcmFua293
aWN6IDxrYW1pbC5mcmFua293aWN6QGNlcnQucGw+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCg0Kd2l0aCAuLi4NCg0KPiAtLS0NCj4gSsO8cmdlbiwg
cHJvdmlkZWQgSSB1bmRlcnN0b29kIGhpbSBjb3JyZWN0bHksIHN1Z2dlc3RzIHRoYXQgc29t
ZXRoaW5nIGxpa2UNCj4gDQo+ICAgICAgd2hpbGUgKCBub3cgPj0gc2NoZWRfcHJpdi0+bmV4
dF9zd2l0Y2hfdGltZSApDQo+ICAgICAgew0KPiAgICAgICAgICBzY2hlZF9wcml2LT5zY2hl
ZF9pbmRleCsrOw0KPiAgICAgICAgICBBU1NFUlQoc2NoZWRfcHJpdi0+c2NoZWRfaW5kZXgg
PCBzY2hlZF9wcml2LT5udW1fc2NoZWR1bGVfZW50cmllcyk7DQo+ICAgICAgICAgIHNjaGVk
X3ByaXYtPm5leHRfc3dpdGNoX3RpbWUgKz0NCj4gICAgICAgICAgICAgIHNjaGVkX3ByaXYt
PnNjaGVkdWxlW3NjaGVkX3ByaXYtPnNjaGVkX2luZGV4XS5ydW50aW1lOw0KPiAgICAgIH0N
Cj4gDQo+IHNob3VsZCBhbHNvIGJlIHZhbGlkIHRvIG1vdmUgdG8sIGR1ZSB0byBjb25zdHJh
aW50cyBhcHBsaWVkIGJ5DQo+IGFyaW5jNjUzX3NjaGVkX3NldCgpLiBJJ20gaGVzaXRhbnQg
dG8gbWFrZSBzdWNoIGEgY2hhbmdlIHRob3VnaCwgbm90DQo+IHJlYWxseSBrbm93aW5nIHRo
ZSBzY2hlZHVsZXI7IHRoZSBjaGFuZ2UgaGVyZSBsb29rcyBtb3JlIG9idmlvdXNseSBjb3Jy
ZWN0DQo+IHRvIG1lLiBBbGJlaXQgdGhlIEZpeGVzOiB0YWcgbWF5IHRodXMgd2FudCBkcm9w
cGluZy4NCg0KdGhlIEZpeGVzOiB0YWcgZHJvcHBlZCwgYXMgdGhlIGNvbnN0cmFpbnRzIG1l
bnRpb25lZCBhcmUgSU1PIHJlYWxseSBlbm91Z2gNCnRvIGF2b2lkIGFuIGlzc3VlLg0KDQpJ
IGFncmVlIHRoYXQgdGhlIGN1cnJlbnQgY29kZSBpcyBmYXIgZnJvbSBvYnZpb3VzbHkgY29y
cmVjdCwgc28geW91ciBwYXRjaA0KaXMgZGVmaW5pdGl2ZWx5IGFuIGltcHJvdmVtZW50Lg0K
DQoNCkp1ZXJnZW4NCg==
--------------Dq40zhO00aWGOwD49nfIA4Ox
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Dq40zhO00aWGOwD49nfIA4Ox--

--------------HJ35cNX2pDmumbNuSRbjSygA--

--------------E8kN60KZ20qHA15vjNqk2d4C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnD4ZsFAwAAAAAACgkQsN6d1ii/Ey+e
Dgf/T3Usezpe2g9SQU3IzdZu90xIVAaZIXN/uKSpctHRSpMJ543U8f5wGGSq5cJ3NgMj/AryFI6p
4ZUbgaG7J0bUQ+eRYn+2L5bN3VrZKahZfCPTefhE35b4MTQy4RCK1yi07yy1A+9fn+QlbbXSOtEe
ZM6Srnbo/n35lLha4zoItPVFOTEQLxSp3wqPBMhVLWeSimo51JUopegjtMzWp4DW2vaBGIIc8Ewt
Q8ls8br+eQaE+ZokkGfdrMIzKI3oqBXK50HjnjatU9HmGj1pxbelAy5pDR+LEywRHgHd4Jrx/xk8
UgYDG8i75nIBrbFANfYyUnGVYTXJRG8lTsP6W6TUKw==
=xkqA
-----END PGP SIGNATURE-----

--------------E8kN60KZ20qHA15vjNqk2d4C--

