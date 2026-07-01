Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +XwhOJowRWrD8QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:22:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8476EF336
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 17:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AiWsQUcg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1350117.1607693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewkh-0001tx-N0; Wed, 01 Jul 2026 15:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350117.1607693; Wed, 01 Jul 2026 15:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewkh-0001rV-JO; Wed, 01 Jul 2026 15:21:27 +0000
Received: by outflank-mailman (input) for mailman id 1350117;
 Wed, 01 Jul 2026 15:21:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wewkf-0001qs-Ub
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:21:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewkf-004tW0-BG
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 17:21:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a45305d-e002-0a2a0a5209dd-0a2a4501cb5a-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:21:25 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a453075-400f-0a2a45010019-d155da36ed42-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 17:21:25 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c12758e75afso140455166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:21:25 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288d1efdcsm294023766b.5.2026.07.01.08.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 08:21:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1782919285; x=1783524085; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fvkn+Q1lRbCuR/PD1NZRPzvfxPN8W8yFaRbTgCBwedA=;
        b=AiWsQUcgfVn2bDKtej22qhwCRaz3ToSmlzLRfkHX/MUisZIYCxiC8/S+ao1KY4v8y1
         VmulbuJeGN/EzxFU3YHCZupNTs0u055T2rNrJ3rWe9TEUtOpiU4sifcNx53S8aEQAuh0
         fi619ohfWD+v2a1IknOjmABBpzNjHTP+jzLRzGGnB4JVx98ZxECpBT3nJZB+0se+e0A4
         SI8dvYk2g3SN0SJGh+aHkfyBULHYpw4/lp9Jw11ETv9ZwKbwhTmam0XYVCObusoTpV1b
         404j0WEDwIvDnut9plmvrGTbSq4lmyfLK6GxJ/nZdY+fPfV9t26wZ4M3T+Cd9A/zg+sm
         QLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919285; x=1783524085;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fvkn+Q1lRbCuR/PD1NZRPzvfxPN8W8yFaRbTgCBwedA=;
        b=ix27ZO7y9pu1VQTFGRjdk8CMOvzYHQCTbkNuv2NiKbpbZywdT1T1//OzAFHFvvO1oR
         rvjicK6JTYTol7mL4APMjI8wmysmJ0tKOsZMGYn2C3m9qlXQMg2MeKLI8k/d1163jvjA
         tFM3QDfBH5hg3drMcwKildpu6v2BBmEiFx4Ie9mt0NfhyP/WNs/49ELmQaPDmTQ5e38F
         Qa+bwqMTvHvmIU6BEAG+GTGIl4b30wPrVgdRniH5j3sQlMqTvDQ4DtL6XDRG/X8DdrzX
         ElTQFLBaj5vYafp9jpX3wmDPQJ/z+TxpXIAZWsyz2yO/H6sWMYGWTXeMj6SQAdwjwVhb
         NmfA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0nmGOsYuidb/GCYODHkLO6G1gGM9K3NoqYWd9RmyXnv40qWZGIHABA8L0EF7iV76nQXLVIiJ7uzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJMZdn5Den8WVuOS9lkFQZ+unjFjw5we7M+x098IFWEyMLvkVP
	1EW5tmiVmGRzABVcRpnXF+EZEwvEz1AIICVkC5jciXcu5hXPt+Yq8IdJugBFzACDOTQ=
X-Gm-Gg: AfdE7clXH6gU9TqW0389qTHklCsLXXs4XgBw9kRO+me2PRnH1cw7fMk4fm9DXwD7LA0
	3R9qU0t9ereSLN8JiBwsgC7Y+JIxAZmFzoaTWc8oheCzVUChRs1RiE6fFhHi+zflRV6Oj1E0rDD
	7iqzq7jppGEDbVJX99eybRqn6Zxp/2HzhlHdO+vP5nNY5EF768BL1o+rXUzwwMv48LaGhHGu6bF
	ctJnCP860IrfVF1El3E4lMJZ/KBPhXpjjsIHZ0WaP0JX723CzYMTzZhjq7bDL6URUuPcxrf1utN
	eFxYSpOl1OJGloXrZFU2FS93zd8ePsWgpYznBCSPZjww7PPQOic+taKr9RwNq9uQNYfgY/gJjaP
	LhnpYGYIocCaDzD9/+qGT/cyOC8IXi18feUzspEw2vqEC8RDhQThTBjOJpiNWYF4wpRcwlN69yP
	x/rrYw0SRirGoqSGsJi9P+iQMdAtd0RcsmtQvIjB0bUCv/N9WsWJInhAgkrbowd5Jr75/OkYXMw
	R4GddClmPds1jBXbtvHr9QVrQrRNPi+yWRXd9Kzh4g=
X-Received: by 2002:a17:907:da02:b0:c12:840a:364 with SMTP id a640c23a62f3a-c12ae3acd8fmr66792866b.10.1782919284620;
        Wed, 01 Jul 2026 08:21:24 -0700 (PDT)
Message-ID: <305e0bea-cea8-4260-be84-4e844979987f@suse.com>
Date: Wed, 1 Jul 2026 17:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/Xen: correct commentary and parameter naming of
 xen_exchange_memory()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d2661f83-a97b-4fc7-bf52-25e99f63576b@suse.com>
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
In-Reply-To: <d2661f83-a97b-4fc7-bf52-25e99f63576b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nQgv1Bqlnnr0TaSVOpwNNn6l"
X-purgate-ID: tlsNG-d62444/1782919285-FFECF1E0-E8AEA266/0/0
X-purgate-type: clean
X-purgate-size: 9492
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A8476EF336

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nQgv1Bqlnnr0TaSVOpwNNn6l
Content-Type: multipart/mixed; boundary="------------gwj4yeI9S5JHpZF7F4xM6WWE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <305e0bea-cea8-4260-be84-4e844979987f@suse.com>
Subject: Re: [PATCH] x86/Xen: correct commentary and parameter naming of
 xen_exchange_memory()
References: <d2661f83-a97b-4fc7-bf52-25e99f63576b@suse.com>
In-Reply-To: <d2661f83-a97b-4fc7-bf52-25e99f63576b@suse.com>
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

--------------gwj4yeI9S5JHpZF7F4xM6WWE
Content-Type: multipart/mixed; boundary="------------sHJZ0Ia0uoWyY5r3zY0h0Gg6"

--------------sHJZ0Ia0uoWyY5r3zY0h0Gg6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjYgMTE6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBBcyBkb2N1bWVudGVk
IGluIGNvbW1lbnRzIGluIHN0cnVjdCB4ZW5fbWVtb3J5X2V4Y2hhbmdlLCB0aGUgaW5wdXQg
dG8gdGhlDQo+IGh5cGVyY2FsbCBpcyBhIHNldCBvZiBNRk5zIHdoaWNoIGFyZSB0byBiZSBy
ZW1vdmVkIGZyb20gdGhlIGRvbWFpbiwgcGx1cyBhDQo+IHNldCBvZiBQRk5zIHdoZXJlIHRo
ZSBuZXdseSBhbGxvY2F0ZWQgTUZOcyBhcmUgdG8gYXBwZWFyLiBQcmVzZW50IGNvbW1lbnQN
Cj4gYW5kIHBhcmFtZXRlciBuYW1pbmcgZG9uJ3QgY29ycmVjdGx5IHJlZmxlY3QgdGhhdC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gLS0tDQo+IFNob3VsZCAiZm5zX291dCIgbWF5YmUgYmUgImZuc19pbm91dCIgdG8gZnVy
dGhlciBlbXBoYXNpemUgdGhlIGR1YWwNCj4gcHVycG9zZT8NCg0KSSB0aGluayBzbywgeWVz
LiBBbmQgSSdkIGxpa2UgdG8gaGF2ZSB0aGF0IHJlZmxlY3RlZCBpbiB0aGUgY29tbWVudCB5
b3UgYXJlDQptb2RpZnlpbmcgLi4uDQoNCj4gDQo+IC0tLSBhL2FyY2gveDg2L3hlbi9tbXVf
cHYuYw0KPiArKysgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMNCj4gQEAgLTIyOTEsMTggKzIy
OTEsMTkgQEAgc3RhdGljIHZvaWQgeGVuX3JlbWFwX2V4Y2hhbmdlZF9wdGVzKHVucw0KPiAg
IH0NCj4gICANCj4gICAvKg0KPiAtICogUGVyZm9ybSB0aGUgaHlwZXJjYWxsIHRvIGV4Y2hh
bmdlIGEgcmVnaW9uIG9mIG91ciBwZm5zIHRvIHBvaW50IHRvDQo+IC0gKiBtZW1vcnkgd2l0
aCB0aGUgcmVxdWlyZWQgY29udGlndW91cyBhbGlnbm1lbnQuICBUYWtlcyB0aGUgcGZucyBh
cw0KPiAtICogaW5wdXQsIGFuZCBwb3B1bGF0ZXMgbWZucyBhcyBvdXRwdXQuDQo+ICsgKiBQ
ZXJmb3JtIHRoZSBoeXBlcmNhbGwgdG8gZXhjaGFuZ2UgYSByZWdpb24gb2Ygb3VyIHBhZ2Vz
IHRvIHBvaW50IHRvIG1lbW9yeQ0KPiArICogd2l0aCB0aGUgcmVxdWlyZWQgY29udGlndW91
cyBhbGlnbm1lbnQuICBUYWtlcyBhcyBpbnB1dCB0aGUgbWZucyB0byB0cmFkZQ0KPiArICog
aW4gYW5kIHRoZSBwZm5zIHdoZXJlIHRoZSBuZXcgcGFnZXMgYXJlIHRvIGFwcGVhciwgYW5k
IHBvcHVsYXRlcyBtZm5zIGFzDQo+ICsgKiBvdXRwdXQuDQoNCi4uLiBsaWtlOg0KDQogICBb
Li4uXSBUYWtlcyBhcyBpbnB1dCB0aGUgbWZucyB0byB0cmFkZSBpbiAobWZuc19pbikgYW5k
IHRoZSBwZm5zIHdoZXJlIHRoZSBuZXcNCiAgIHBhZ2VzIGFyZSB0byBhcHBlYXIgKGZuc19p
bm91dCksIGFuZCBwb3B1bGF0ZXMgbWZucyBhcyBvdXRwdXQgKGZuc19pbm91dCkuDQoNCldp
dGggdGhhdDoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------sHJZ0Ia0uoWyY5r3zY0h0Gg6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------sHJZ0Ia0uoWyY5r3zY0h0Gg6--

--------------gwj4yeI9S5JHpZF7F4xM6WWE--

--------------nQgv1Bqlnnr0TaSVOpwNNn6l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpFMHMFAwAAAAAACgkQsN6d1ii/Ey/2
jwf8C4Ir62V2ZdCImI/molyOq+JPPLJRySa8FvIy9Gut7SM4zDwslPkhZQPqimKudUVIqKSeRdzw
ExEm7PWvMaVHQ0MbwbZUerrLWph6kMfoYiEPP1Fbne6Tm8TX/AnSgMEi7oeM1V0e474JQZVezj13
yPpzOLuRCOTrjTELUUi/9PuhmagIVEe2959UBQ07L2OMrJtn2bjekgur5Kwgh6S+6n2GIwtfm+q+
vLWXGMwH2DknizAVtEA9etD7EmYHGImhywo5eaJhX8kaqzjMcqOJbZFeh3EnkCUalffMdMU6SvHK
ED1BF2QF0gKaj8r2Y3d/cT0SgBgxofrXLorCakMwYQ==
=Hxhx
-----END PGP SIGNATURE-----

--------------nQgv1Bqlnnr0TaSVOpwNNn6l--

