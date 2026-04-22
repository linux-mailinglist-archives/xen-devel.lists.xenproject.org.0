Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNe5Awna6Gl7QwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:24:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93C4473BA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290672.1570219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYUc-0000YW-FJ; Wed, 22 Apr 2026 14:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290672.1570219; Wed, 22 Apr 2026 14:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYUc-0000Wr-CT; Wed, 22 Apr 2026 14:23:54 +0000
Received: by outflank-mailman (input) for mailman id 1290672;
 Wed, 22 Apr 2026 14:23:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFYUa-0000Wi-M9
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYUa-007YCj-2q
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:23:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e8d9f3-2eae-0a2a0a5409dd-0a2a450c800a-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:23:52 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e8d9f7-62f1-0a2a450c0019-d155da33ccee-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:23:51 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-baa8c78ac7fso211595166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:23:51 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba451210e49sm567647166b.10.2026.04.22.07.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 07:23:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1776867831; x=1777472631; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WCfyiIcvp3WhdAG7xWq8cf0+9Do9BN8IgUjxfRwwRQg=;
        b=CALBc0kLTl0Y4U6sm9EYjrIX+Kmv/+rtohXzTNYtXsatiUkKQ8Qz0zwh5A3qD969ib
         GHmNpsY2kCCCzBLDz5pCMinrkfYKif8C5wtK//seKaImktAF+3fazn/N3yfxCz9Qy752
         bxM/fMv5huOnM70FeXJfVv8WVugxf44JLEoLwCvG4h3T9dPhl+ZxLV08gSPdd9tld1g5
         XorkJDJe3ytd97ZMANWuRuYgaftSoOlBaeo9ZFyAndESnF9mR03jEpJLs8jgqXfjaXnf
         n8VBRFr+X8nNpozHJf/Pu+OkDTwSsjHbOCCGvUIyyGJolBIWjsDA1NEKIJgsIrVoSHFp
         gSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867831; x=1777472631;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCfyiIcvp3WhdAG7xWq8cf0+9Do9BN8IgUjxfRwwRQg=;
        b=FNiHIuDF5V9qwA+sMcW+htKdUGSXX4zvPUNE6qh41+OX0L5JIuFIQ/5YZ6Z2X0YMQ/
         mLNgdWHHMN1jZWXm2nljGZdR/5IjnrrRLg6Z1SHDgLI856zL+oIuTZov4f1rfJaQ75Zr
         m3I54k8qf8ggaLys0hnvYwwM+jIrjcp6JGii5rL8hk+9a2Hb2rUG2llSOwZg9qhyzeWc
         79LJCOyrbzevGLE7/OCc6RHBdMrk/SJBp06dfDij2aWINC7ieBnVyFgyMd4zPmeVGKq9
         ufJAI254V4jR17IOc7V4AA/vEnfrf7/EYY7Zo8Nb57BW1EDFR/jOE9ACFyqogoPlJreF
         RETw==
X-Gm-Message-State: AOJu0YxH33lBQnyWTygAZ7nDoey7j7rYhm44AgP7Zk9iYtbedDCO2vdU
	mFAI73FBaxzWmJmaP+YmMr29gauJAaiYS2f6zsJUPScnWtjXZUp7pJD2Sp7gkP8aJQw=
X-Gm-Gg: AeBDiev5AaWDlXCZZGfDDu+5Rmgenye8v207CmsjEZoYNdmjSADPFotqOiwiscd3rmI
	oKn9hdSCiDIA1j3u5CIOrDXs299Ru0MsFtPkx1msSzat5FXRqrex8qRPmwd+xlyMuGASXF8+ujo
	lGoB4jOUp7xhponU9xC1PzYkcHQC53y4Bg/e4fWx7tDGILkGaime/Q++EBcz3yp/6JSNyoMDCtu
	bwqWQgj9w0bNiS5uIpnS4LYfOgMqc09bC94LEWeVtYfn+b/sMBIWIJcm2I2aidBOY3J0nwXZyam
	H6X9xuvGykqscUBKX5ykBnuZ6OzfuP3BeUV5xTMkitJQ8rVBbsKut6fakVv1JdzKRWdIKNf7PnA
	EzW4Lb4/cuWkhO3I6PNEE9iP5RSK4zxmm1IFZ/aPaS6Qgt7QbbnhDfQCCxX1JgvahjAEeqOCG9m
	QTgCvA0rxKtVzAR0/mhwtgEzO5ks5hcHB7EOUtJyRRBNxDnf5RBGFjvAADfN9LzN/32oLXBfzlj
	WgQ5nU+T0Q/XF7LvSWJyht9FUPERE1nKYysNPCqvPuljr+AH/X2wKilu4Os5YpCOg6YlU0A60c=
X-Received: by 2002:a17:907:d40e:b0:ba2:e022:c146 with SMTP id a640c23a62f3a-ba41b3e451amr1190778066b.43.1776867830373;
        Wed, 22 Apr 2026 07:23:50 -0700 (PDT)
Message-ID: <92df43ee-10d5-44a2-95db-40ba6d50be79@suse.com>
Date: Wed, 22 Apr 2026 16:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
To: Anthony PERARD <anthony.perard@vates.tech>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org
References: <20260408234046.1314021-1-dmukhin@ford.com>
 <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
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
In-Reply-To: <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZVvIS81M8DFT0VBmW25XLMYd"
X-purgate-ID: tlsNG-d25034/1776867831-F6809CF5-889F0C03/0/0
X-purgate-type: clean
X-purgate-size: 10226
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,ford.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.965];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4D93C4473BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZVvIS81M8DFT0VBmW25XLMYd
Content-Type: multipart/mixed; boundary="------------dNXgFXAAhol0vXtEpcV0ui5x";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org
Message-ID: <92df43ee-10d5-44a2-95db-40ba6d50be79@suse.com>
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
References: <20260408234046.1314021-1-dmukhin@ford.com>
 <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
In-Reply-To: <1776866876.8631fc262581453bbf619ec5b2062170.19db584dbc0000f373@vates.tech>
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

--------------dNXgFXAAhol0vXtEpcV0ui5x
Content-Type: multipart/mixed; boundary="------------cWyudUJ2BoKiiVXBV8bvfkrt"

--------------cWyudUJ2BoKiiVXBV8bvfkrt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjYgMTY6MDcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOCwgMjAyNiBhdCAwNDo0MDo0NlBNIC0wNzAwLCBkbXVraGluQGZvcmQuY29tIHdyb3Rl
Og0KPj4gRnJvbTogRGVuaXMgTXVraGluIDxkbXVraGluQGZvcmQuY29tPg0KPj4NCj4+IEFk
ZCBhIG5ldyBzeW1ib2wgRE9NSURfQU5ZIHRvIGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5IG9m
IHRoZSBjb2RlLg0KPj4NCj4+IFVwZGF0ZSBhbGwgcmVsZXZhbnQgZG9taWRfYWxsb2MoKSBj
YWxsIHNpdGVzIGFuZCBoYXJkZW4gdGhlIGRvbWlkX2FsbG9jKCkNCj4+IGlucHV0IHZhbHVl
IGNoZWNrLg0KPj4NCj4+IEFsc28sIGZpeCBwcm9ibGVtIHdpdGggcGFzc2luZyBpbnZhbGlk
IGRvbWFpbiBJRHMgaW4NCj4+IFhFTl9ET01DVExfY3JlYXRlZG9tYWluOiB0dXJucyBvdXQg
bGlieGxfX2RvbWFpbl9tYWtlKCkgKHRvb2xzdGFjaykNCj4+IHVzZXMgMHhmZmZmIGFzIGRv
bWFpbiBJRC4NCj4+DQo+PiBBbWVuZHM6IDJkNTA2NTA2MDcxMCAoInhlbi9kb21haW46IHVu
aWZ5IGRvbWFpbiBJRCBhbGxvY2F0aW9uIikNCj4+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE11
a2hpbiA8ZG11a2hpbkBmb3JkLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBzaW5jZSB2NjoN
Cj4+IC0gZml4ZWQgbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoKSBjaGVjayBpbiBsaWJ4bF9j
cmVhdGUuYw0KPj4gLSBMaW5rIHRvIHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4t
ZGV2ZWwvMjAyNjAzMDcwMjU0NTEuMzE0ODA3OC0yLWRtdWtoaW5AZm9yZC5jb20vDQo+PiAt
IENJOiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2RtdWtoaW4veGVu
Ly0vcGlwZWxpbmVzLzI0Mzg3OTA3NDgNCj4gDQo+IFVuZm9ydHVuYXR0bHksIHRoaXMgcGF0
Y2ggYnJlYWtzIHRlc3RzIGluIHRvb2xzL3Rlc3RzLCBzZWUNCj4gICAgICBodHRwczovL2dp
dGxhYi5jb20veGVuLXByb2plY3QvaGFyZHdhcmUveGVuLXN0YWdpbmcvLS9waXBlbGluZXMv
MjQ3MTY4NDE0Mg0KPiANCj4gVGhlIHRlc3RzIHByb2R1Y2VzIHRoaXM6DQo+IA0KPiAgICAg
IFJ1bm5pbmcgL3Vzci9saWIveGVuL3Rlc3RzL3Rlc3QtbWVtLWNsYWltDQo+ICAgICAgTWVt
b3J5IGNsYWltcyB0ZXN0cw0KPiAgICAgIEZyZWUgcGFnZXM6IDMwNTkwMTIsIE91c3RhbmRp
bmcgY2xhaW1zOiAwDQo+ICAgICAgICBEb21haW4gY3JlYXRlIGZhaWx1cmU6IDE3IC0gRmls
ZSBleGlzdHMNCj4gICAgICBGQUlMRUQ6IC91c3IvbGliL3hlbi90ZXN0cy90ZXN0LW1lbS1j
bGFpbQ0KPiANCj4gICAgICBSdW5uaW5nIC91c3IvbGliL3hlbi90ZXN0cy90ZXN0LXBhZ2lu
Zy1tZW1wb29sDQo+ICAgICAgUGFnaW5nIG1lbXBvb2wgdGVzdHMNCj4gICAgICAgIERvbWFp
biBjcmVhdGUgZmFpbHVyZTogMTcgLSBGaWxlIGV4aXN0cw0KPiAgICAgIEZBSUxFRDogL3Vz
ci9saWIveGVuL3Rlc3RzL3Rlc3QtcGFnaW5nLW1lbXBvb2wNCg0KSSd2ZSBsb29rZWQgaW50
byB0aGlzIG9uZS4gVGhlIGlucHV0IGRvbWlkIGlzIDAgaGVyZSwgd2hpY2ggd2lsbCBiZSBy
ZWplY3RlZA0Kbm93Lg0KDQpJIGd1ZXNzIHRoZSBvdGhlciBmYWlsaW5nIGNhc2VzIGhhdmUg
dGhlIHNhbWUgaXNzdWUuDQoNCkkgaGF2ZSBvbmUgcmVxdWVzdDogY291bGQgdGhlIGRlZmlu
aXRpb24gb2YgRE9NSURfQU5ZIGJlIHNwbGl0IG91dCBpbnRvIGENCnBhdGNoIG9mIGl0cyBv
d24/IEkgaGF2ZSBhIHNlY3VyaXR5IHJlbGF0ZWQgcGF0Y2ggc2VyaWVzIHBlbmRpbmcgd2hp
Y2gNCndvdWxkIG5lZWQgdGhhdCBkZWZpbml0aW9uIGZvciBhbm90aGVyIHB1cnBvc2UgKG5v
dCBhbiBYU0EsIHRob3VnaCkuDQoNCg0KSnVlcmdlbg0K
--------------cWyudUJ2BoKiiVXBV8bvfkrt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cWyudUJ2BoKiiVXBV8bvfkrt--

--------------dNXgFXAAhol0vXtEpcV0ui5x--

--------------ZVvIS81M8DFT0VBmW25XLMYd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmno2fUFAwAAAAAACgkQsN6d1ii/Ey9J
Nwf9GYln88oVVwRdAHk/fn7SF9hVVGc3zQLVPva0nVj6JS/4iXIQuHAWUiFO66ncPCI/sX8R55Zj
AmVTTDf/0zv/2TWxLf+PmRsMMrHt3efjV6wQxRcLdT6SQh4/Y85eLpKwDm0sJeeGGyKbkPUp6Q9T
cIMO0yAHafdTO/ga7siBEJa24h5nXFHNxK5a6OYG7qmlY4iTEOCZyQvB3GP5MboNgettQBO1vAOh
4xviXHt3Nf4iMVPFmBcxn6NLxfvDPsDhvv4F5FLxGDbv7wUbfNTNmZLMxiXXRbf/TOQ5w1MAkpWL
dZieY7/1nn9JIGZIPalD5Q4EmmvEmvxZt/loaGG7aw==
=WWWh
-----END PGP SIGNATURE-----

--------------ZVvIS81M8DFT0VBmW25XLMYd--

