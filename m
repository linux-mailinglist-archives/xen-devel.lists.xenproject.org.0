Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIVJAzUWzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:57:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C54337AD4C
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270237.1558960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7v89-0006YZ-0C; Wed, 01 Apr 2026 12:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270237.1558960; Wed, 01 Apr 2026 12:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7v88-0006Wi-Tj; Wed, 01 Apr 2026 12:57:08 +0000
Received: by outflank-mailman (input) for mailman id 1270237;
 Wed, 01 Apr 2026 12:57:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w7v87-0006Wc-3V
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:57:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7v86-004Xoh-4t
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:57:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69cd1607-e002-0a2a0a5209dd-0a2a4507aef2-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:57:06 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69cd1621-ba2d-0a2a45070019-d155d029e406-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:57:05 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-66c4c7e2bb7so2508051a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:57:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b1df761sm520131066b.42.2026.04.01.05.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:57:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1775048225; x=1775653025; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e8jbriwqhYKh55tSUwSjeU1qcLXSE6SKmM4As6KTyU4=;
        b=XtvIFHeOSjDfKGE9B82xD4fHcBNIVz/bLQuOV+O/J0PW0T6Ou17a91QJlqXmiM7TYC
         2CttNqeqSzl+aGYo03fQZTnL/QDY9QEfnFRZoaG/ACUjuvbsnT6OEZiLA6oMrLZ5A5ug
         bFPKc5yipNxjIjEGCyyKIiDmbY+85pHwZW+LO4cHLTkWi8Uid3+GeZD1Q4ppLK8lZiQU
         CvRmSnF9W6RURbUbKC10nbeRB2lXcafhU0lPbg32UpRYLNY83MbbcoHpab5+VfkIud26
         3nY4UdTSsIo4HvWaRnJHD0hwDaV9W7j3pViHypeJGBNqLK3asvD2Mas4xvjwqJ107nBM
         602Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775048225; x=1775653025;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8jbriwqhYKh55tSUwSjeU1qcLXSE6SKmM4As6KTyU4=;
        b=slr+czWYSNuyeNTpT4jgB2olagWXpNb+iWjO3RA2q8X0YQxTdRFtyprCC7zbeh7t+n
         OuGPJZFvDdDV/bwhxeq9IsnkjYb8RJ7m6wfHQMlJRGdrXhVIDyUgOixDUZ0FggUTLW/d
         AjHqBkk2wrnxZByYVF8CNgsU9EyeGB3AcWdPBnWGgHd0iR1uba1SeVLvH4hplZUtErgn
         m36jxkQo1zzba9NDfWAi5dGmioo5VTrkSSCtftl1N021wS+Y2UMebXeGLLrsFW0+RL2O
         KTKvVx+9ge3J0RWThAAm00ocjNFMWKqvNnTT0Ihq+yvrEtYtO636pmZzNxzl4mwaMBOa
         lzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3D+g+CQINDd91NgErQOhr+TfpBHMCOJp+Xh1MGjhaLjO+rJdeW5WN+KtLaQUvRW3NWP//f9Vz76U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTcsiT/m/046RYrzxCGjobijs8UOzNlzY0RmNGqkMxvL6BeahG
	GRKhCmkgWj7C+02Z/uW34x+ZvsOuxeSR/G77COkv/sLRKkvX/G9jPkgJllF9ENBZkfE=
X-Gm-Gg: ATEYQzz+jNm0T3YRtFR6gH6szkINtZI5BIBlMzbAD6PbyOHFRemmAhjRJlLROvxC1/m
	WOPVc5HLC9cUmAgaO+VNpLZXessBJTozyFAXra21lpuKf5OJq9ejOX9T56ElDzRoZquLMQSnPiD
	CL9wmEPSS3IvuXaTs6mtJX+ZEj+72FsCKVUq2rdtmwdMA5uoyUZHjO1tEG9jkMiIft4hk0qC+gs
	MnBnQ+rWRBSuoDZNVTdDbrPodRymlGdJitl2dUWlE1ozwA1XlcMK5uxa5nRGXP1xQmLq6q/uRyX
	GA0TGkadjD2a/kKWEFZh3boxfmYGu1RVjTLltAKJ2rjja3EzcqB4yD6Pb3z/jDTzETvhJhLBY8Z
	ShJNkQvQ7RJsze1IUtt4ctxXUAU5/Umh2WG1pBviymgc7P9ISc9hOedVRQUv8FZtqqW/KG8oFLL
	7XOOIJmAXKz9MHRNNPzstx+3FBQRbu69HHUk/AkE5fs8/oZst8fEOIdloWM/p5pMhIVWKT7OWHl
	Mn4Rqbr/cRNC0I+7OnUQjdBeH2wS/WcKDz6djwGWQj4Z4/+lP3e0Q==
X-Received: by 2002:a17:907:c789:b0:b99:1074:74d with SMTP id a640c23a62f3a-b9c13ce565cmr216593666b.49.1775048225345;
        Wed, 01 Apr 2026 05:57:05 -0700 (PDT)
Message-ID: <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
Date: Wed, 1 Apr 2026 14:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
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
In-Reply-To: <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DQCt9CVS1Vvmkgx7LdJwDmwK"
X-purgate-ID: tlsNG-ef75cf/1775048226-1334C41E-567A9673/0/0
X-purgate-type: clean
X-purgate-size: 10488
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4C54337AD4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DQCt9CVS1Vvmkgx7LdJwDmwK
Content-Type: multipart/mixed; boundary="------------tvq1gyNl077XUXcsIgVdKB77";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
Message-ID: <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
In-Reply-To: <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
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

--------------tvq1gyNl077XUXcsIgVdKB77
Content-Type: multipart/mixed; boundary="------------q9w39TgOQsvHK0ALw5JTyJla"

--------------q9w39TgOQsvHK0ALw5JTyJla
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDQuMjYgMTQ6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBMZWF2aW5nIGFzaWRl
IGhpZ2hseSBkaXNhZ2dyZWdhdGVkIGVudmlyb25tZW50cywgdGhlIGNvbnRyb2wgZG9tYWlu
IGlzDQo+IHdoYXQgd2lsbCBpbnZva2UgWEVOX1NZU0NUTF9TQ0hFRE9QX3B1dGluZm8uIEl0
cyB2Q1BVLXMgdGhlcmVmb3JlIG5lZWQgdG8NCj4gYmUgYWJsZSB0byBydW4gdW5jb25kaXRp
b25hbGx5LCBub3QgdGhvc2Ugb2YgdGhlIGRvbWFpbiB3aXRoIElEIDAgKHdoaWNoDQo+IG1h
eSBub3QgZXhpc3QgYXQgYWxsKS4NCj4gDQo+IEZpeGVzOiA5ZjBjNjU4YmFlZGMgKCJhcmlu
YzogYWRkIGNwdS1wb29sIHN1cHBvcnQgdG8gc2NoZWR1bGVyIikNCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gVGhlcmUgYmVp
bmcgbm8gImVsc2UiIHRvIHRoZSBpZigpLCB3aGF0IGFib3V0IG90aGVyIGNvbnRyb2wgZG9t
YWluIHZDUFUtcz8NCg0KSSBndWVzcyB0aGlzIGlzIGEgc3RhbGUgbGVmdG92ZXIuIERvZXNu
J3QgbWF0dGVyIGZvciBjb21taXR0aW5nIGFueXdheS4NCg0KPiAtLS0NCj4gdjM6IERvbid0
IG1pc3Rha2VubHkgaW5jbHVkZSB0aGUgaWRsZSBkb21haW4uDQo+IHYyOiBOZXcuDQo+IA0K
PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4gKysrIGIveGVuL2NvbW1v
bi9zY2hlZC9hcmluYzY1My5jDQo+IEBAIC00MTEsMTAgKzQxMSwxMCBAQCBhNjUzc2NoZWRf
YWxsb2NfdWRhdGEoY29uc3Qgc3RydWN0IHNjaGVkDQo+ICAgICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZzY2hlZF9wcml2LT5sb2NrLCBmbGFncyk7DQo+ICAgDQo+ICAgICAgIC8qDQo+IC0g
ICAgICogQWRkIGV2ZXJ5IG9uZSBvZiBkb20wJ3MgdW5pdHMgdG8gdGhlIHNjaGVkdWxlLCBh
cyBsb25nIGFzIHRoZXJlIGFyZQ0KPiAtICAgICAqIHNsb3RzIGF2YWlsYWJsZS4NCj4gKyAg
ICAgKiBBZGQgZXZlcnkgb25lIG9mIHRoZSBjb250cm9sIGRvbWFpbidzIHVuaXRzIHRvIHRo
ZSBzY2hlZHVsZSwgYXMgbG9uZyBhcw0KPiArICAgICAqIHRoZXJlIGFyZSBzbG90cyBhdmFp
bGFibGUuDQo+ICAgICAgICAqLw0KPiAtICAgIGlmICggdW5pdC0+ZG9tYWluLT5kb21haW5f
aWQgPT0gMCApDQo+ICsgICAgaWYgKCBpc19jb250cm9sX2RvbWFpbih1bml0LT5kb21haW4p
ICYmICFpc19pZGxlX2RvbWFpbih1bml0LT5kb21haW4pICkNCj4gICAgICAgew0KPiAgICAg
ICAgICAgZW50cnkgPSBzY2hlZF9wcml2LT5udW1fc2NoZWR1bGVfZW50cmllczsNCj4gICAN
Cg0KSG1tLCBpcyBpdCByZWFsbHkgdGhlIGNvbnRyb2wgZG9tYWluIG9ubHkgd2hpY2ggd2Fu
dHMgdG8gYmUgc2NoZWR1bGVkIGluaXRpYWxseT8NCkkgd291bGQgdGhpbmsgdGhhdCBhdCBs
ZWFzdCB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBwcm9iYWJseSBhIFhlbnN0b3JlIGRvbWFp
bg0Kd291bGQgd2FudCB0byBiZSBpbmNsdWRlZCwgdG9vLg0KDQpJbiB0aGUgZW5kIGl0IG1p
Z2h0IGV2ZW4gYmUgdGhhdCBvdGhlciBkb21haW5zIGNyZWF0ZWQgdmlhIGRvbTBsZXNzIHdv
dWxkIHdhbnQNCnRvIGJlIGFibGUgdG8gcnVuIGluaXRpYWxseS4gVGhleSBjb3VsZCBiZSBw
YXJ0IG9mIGEgbWFuZGF0b3J5IGluZnJhc3RydWN0dXJlLg0KV2h5IHdvdWxkIHRoZXkgbmVl
ZCB0byBiZSBjcmVhdGVkIGF0IGJvb3QgaWYgdGhleSBhcmUgTk9UIGltcG9ydGFudD8NCg0K
VGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlIGFyaW5jNjUzIHNjaGVkdWxlciBpcyByZWFs
bHkgbWVhbnQgZm9yIHN1Y2ggc2V0dXBzLg0KT1RPSCBqdXN0IG1vZGlmeWluZyB0aGUgdGVz
dCB0bzoNCg0KICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgJiYN
CiAgICAgICAgICB1bml0LT5kb21haW4tPmRvbWFpbl9pZCA8IERPTUlEX0ZJUlNUX1JFU0VS
VkVEICkNCg0Kc2VlbXMgdG8gYmUgZmluZSBmb3IgY2F0Y2hpbmcgYWxsIHRob3NlIGNhc2Vz
Lg0KDQpXaXRoIG9yIHdpdGhvdXQgdGhpcyBtb2RpZmljYXRpb246DQoNClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------q9w39TgOQsvHK0ALw5JTyJla
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------q9w39TgOQsvHK0ALw5JTyJla--

--------------tvq1gyNl077XUXcsIgVdKB77--

--------------DQCt9CVS1Vvmkgx7LdJwDmwK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnNFiAFAwAAAAAACgkQsN6d1ii/Ey+H
wQf/YIekTd0xOwsf2o9bcHYob1t5lnJAnZgZ6eDxRL8UQgK0MZbK9Mj69xGHfiqeL5BXI8xhwHBZ
k7Q7B/LsoqQqaVvlQkmcqOk4KxTE4Z39swakgaO6x3FnkRqVFmhORuUYuoh2atqfMSttDn6ijpVZ
eW/GgmkKdVgs44NNhIiXmDi0qNoEErLchY90RoZz6Skvn9eJ7z4Ql7+9X9uQMXMhrZFpewGvWlfM
7+DOEpUrkI48E6Uk5nlZU6ivHQyECzSwUZW6T4EYaWF2gtQlOxolIEa+0Z8UEAqfMBiJlaPmfLkD
NDlQx/it+BH0uVxwDMyQLQETWRHmVgifHqI/lVyt1A==
=hV1Y
-----END PGP SIGNATURE-----

--------------DQCt9CVS1Vvmkgx7LdJwDmwK--

