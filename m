Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G5MBG3lw2lvugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:38:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACAB325EF8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262378.1554910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ORW-0005H9-Vz; Wed, 25 Mar 2026 13:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262378.1554910; Wed, 25 Mar 2026 13:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ORW-0005Ec-Sm; Wed, 25 Mar 2026 13:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1262378;
 Wed, 25 Mar 2026 13:38:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w5ORV-0005ET-Ow
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:38:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ORV-00EVnn-4u
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:38:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c3e55e-bab6-0a2a0a5309dd-0a2a450a91f8-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:38:41 +0100
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c3e560-1772-0a2a450a0019-d155d02ac898-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:38:40 +0100
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6611f41eebcso3582231a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:38:40 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8ef74sm766221666b.25.2026.03.25.06.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:38:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1774445920; x=1775050720; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yBMf19ww6C4snxZ95wNLRitOcSpe4iwhoiaZE2ZQ5JI=;
        b=OEKs6QQQL5D0jLpe0QnEQwYHMXdUGEuLSYbM6eN+ylgpsiw0Vkls4mXYR6TPw9gF+m
         mD6XOwbZ12QtiLQIU+OpOkHH5Z1e9O1+bBKpREjLcVpNmbrRcg3WHJCoPG+cjlKBwTRR
         xlV8brrbdIyobKJ+x4xsCtmxSgPnaJHakWFP0UaV0Lea/+Sb+JUfCXQh4KZw9r2hG0gS
         Flu9eQQLhKRUrKrNa1xb9DRnI24LLHEEqHfiwT8YxKATIDdtf1wGEwZ23cTvRzjayz3v
         n3vp0WLD/XyT3iCCRbgcWEZgvC/MLppnd9TxIIg5Y/5siPx18Kw12uzLJIRNuUQS9lBc
         BfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445920; x=1775050720;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBMf19ww6C4snxZ95wNLRitOcSpe4iwhoiaZE2ZQ5JI=;
        b=RnELbBZYKFodkIEVpDENKtlmdZ1hLz8TjqVEHQpdlQs849JE10YtRDkDSmrkYdhXbW
         USanQ9Y2CHTzcwM/UxosB9VUNw7eFQB0xJ8Ye63MM/N1BtZyTDQexKigSyxZ1JlWGpP3
         a4WcU2+mpw47rebEZ13aLqv3NKejgI2yiXhiX0SHClneatYw51QVkw9qXnNL8algsFEd
         r+JjdqbsFQRTRHHiB9jPBTq4YPbzc7SSsPw54WaxCkYwSaz89jpRBbQAhSQAnyUl/zXJ
         gwRTat1SMy5ytchgxiPwFoyTwsHy6qex6BzuSx4EvP0tPKE187ooD6nehvcvtPLQcjT3
         DR6g==
X-Forwarded-Encrypted: i=1; AJvYcCU2+j59jDbyIEzOR/lG3AdUHQPk10SlTpZevmFiFp+ct15g4oDRVHh+zcHZhk6q/bzG/myZKxy69ZU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6hiHOO//C7WHeYips+8MByz/gVAcNCZE/veRE6TdruNaNR02b
	FVLp7B07M3ZooT4MK75gB59LxNNf9CJlwClROkSMW3GrmPT93QYxYpQEUtDI/vw0nZ8=
X-Gm-Gg: ATEYQzzbIacRscAW3050LSnbe/LCcwLEA2AalwaWhT9EWuePdVNaaOowv9F2p0+NBvz
	P6Zf2tcLgqoyRSoj89Syv5pF8xeAeOMhdOO8+oBRFsnSfoPow3lb31aMoLwo0sDPqVjHBMgH4zy
	JuThAnZe6+BYxiqlRdKQfnLRh9zkKyQucnlMOdU6l+a4BsAiQTEwvIX/FUDfJZeoX2tsCy6OWKL
	OTQNf3TZYkWGaRFKa5mXZRNs88XfHuSifOCqJPOuJZjouIfbqBRa1805SAZL4j7Z8zdaYQBuCGL
	VcXfjzTKQQTZiGafHsrVOOpc9GbAkl26ftp2niQMozk+LKiDSw6NEjGU35JfnG1CIw4UVHkh9iX
	lge3wIoFnm8BGyz/uhIT7axat21fFUdrNZtuQ1B8rQZoz3bmLHNh8b/Cd65JUt9snEA66jvb9qD
	hs8tUF/Ez54wcDVRefME49rGxExFa+loqbwhT8HIDKXaEj9s/wf/XkKGXZ/9b6B08nRbYQSH+oz
	QVBxsrbXdiSBsQfpekdLIPh5ymFP8NgygAjBtiQlwlv04vLG1Z/5A==
X-Received: by 2002:a17:907:6b8e:b0:b98:235b:4dfa with SMTP id a640c23a62f3a-b9a542bcccfmr229554366b.47.1774445920135;
        Wed, 25 Mar 2026 06:38:40 -0700 (PDT)
Message-ID: <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
Date: Wed, 25 Mar 2026 14:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
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
In-Reply-To: <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fd0Q01bpugZgIcUpAkk51Pav"
X-purgate-ID: tlsNG-4011c0/1774445920-53498900-49453201/0/0
X-purgate-type: clean
X-purgate-size: 9692
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5ACAB325EF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fd0Q01bpugZgIcUpAkk51Pav
Content-Type: multipart/mixed; boundary="------------8mmuz0eiMV7E7ka70U1VfC3s";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>
Message-ID: <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
In-Reply-To: <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
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

--------------8mmuz0eiMV7E7ka70U1VfC3s
Content-Type: multipart/mixed; boundary="------------vcHHNiUTwxU4PvgTSJ92Rq0F"

--------------vcHHNiUTwxU4PvgTSJ92Rq0F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjYgMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBMZWF2aW5nIGFzaWRl
IGhpZ2hseSBkaXNhZ2dyZWdhdGVkIGVudmlyb25tZW50cywgdGhlIGNvbnRyb2wgZG9tYWlu
IGlzDQo+IHdoYXQgd2lsbCBpbnZva2UgWEVOX1NZU0NUTF9TQ0hFRE9QX3B1dGluZm8uIEl0
cyB2Q1BVLXMgdGhlcmVmb3JlIG5lZWQgdG8NCj4gYmUgYWJsZSB0byBydW4gdW5jb25kaXRp
b25hbGx5LCBub3QgdGhvc2Ugb2YgdGhlIGRvbWFpbiB3aXRoIElEIDAgKHdoaWNoDQo+IG1h
eSBub3QgZXhpc3QgYXQgYWxsKS4NCj4gDQo+IEZpeGVzOiA5ZjBjNjU4YmFlZGMgKCJhcmlu
YzogYWRkIGNwdS1wb29sIHN1cHBvcnQgdG8gc2NoZWR1bGVyIikNCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQo+IC0tLQ0KPiBUaGVyZSBiZWluZyBu
byAiZWxzZSIgdG8gdGhlIGlmKCksIHdoYXQgYWJvdXQgb3RoZXIgY29udHJvbCBkb21haW4g
dkNQVS1zPw0KDQphNjUzc2NoZWRfYWxsb2NfdWRhdGEoKSBpcyBjYWxsZWQgZm9yIGFsbCB1
bml0cyBvZiBhIGRvbWFpbi4NCg0KPiBBbmQgd2h5IGFyZSB0aGV5IGFkZGVkIHRvIGFsbCBz
Y2hlZHVsZXIgaW5zdGFuY2VzPw0KDQpXaGF0IGRvIHlvdSBtZWFuIHdpdGggImFkZGVkIHRv
IGFsbCBzY2hlZHVsZXIgaW5zdGFuY2VzIj8NCg0KYTY1M3NjaGVkX2FsbG9jX3VkYXRhKCkg
d2lsbCBiZSBjYWxsZWQgb25seSBmb3IgdGhlIHVuaXRzIG9mIGEgZG9tYWluIGJlaW5nDQpp
biB0aGUgaW5zdGFuY2UgKGkuZS4gY3B1cG9vbCkgZGVzaWduYXRlZCBieSB0aGUgb3BzIHBh
cmFtZXRlci4NCg0KPiAtLS0NCj4gdjI6IE5ldy4NCj4gDQo+IC0tLSBhL3hlbi9jb21tb24v
c2NoZWQvYXJpbmM2NTMuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMN
Cj4gQEAgLTQxMSwxMCArNDExLDEwIEBAIGE2NTNzY2hlZF9hbGxvY191ZGF0YShjb25zdCBz
dHJ1Y3Qgc2NoZWQNCj4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYtPmxv
Y2ssIGZsYWdzKTsNCj4gICANCj4gICAgICAgLyoNCj4gLSAgICAgKiBBZGQgZXZlcnkgb25l
IG9mIGRvbTAncyB1bml0cyB0byB0aGUgc2NoZWR1bGUsIGFzIGxvbmcgYXMgdGhlcmUgYXJl
DQo+IC0gICAgICogc2xvdHMgYXZhaWxhYmxlLg0KPiArICAgICAqIEFkZCBldmVyeSBvbmUg
b2YgdGhlIGNvbnRyb2wgZG9tYWluJ3MgdW5pdHMgdG8gdGhlIHNjaGVkdWxlLCBhcyBsb25n
IGFzDQo+ICsgICAgICogdGhlcmUgYXJlIHNsb3RzIGF2YWlsYWJsZS4NCj4gICAgICAgICov
DQo+IC0gICAgaWYgKCB1bml0LT5kb21haW4tPmRvbWFpbl9pZCA9PSAwICkNCj4gKyAgICBp
ZiAoIGlzX2NvbnRyb2xfZG9tYWluKHVuaXQtPmRvbWFpbikgKQ0KPiAgICAgICB7DQo+ICAg
ICAgICAgICBlbnRyeSA9IHNjaGVkX3ByaXYtPm51bV9zY2hlZHVsZV9lbnRyaWVzOw0KDQoN
Cg==
--------------vcHHNiUTwxU4PvgTSJ92Rq0F
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vcHHNiUTwxU4PvgTSJ92Rq0F--

--------------8mmuz0eiMV7E7ka70U1VfC3s--

--------------fd0Q01bpugZgIcUpAkk51Pav
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnD5V8FAwAAAAAACgkQsN6d1ii/Ey9B
8Qf/U8lPkT5gEjuUPUngNLbt5SZsl+FdViCHK6zgNo2Po+8PM9hgCV3NO5/dIOjebsSCroJ4zgfU
ULijyOGcnHj/K7xW8sglxjdbOw4pYdExQBDItQMHMRLFToSWb76Y0IFveYLSpNV1wIsnvlDRS9Z3
+uZVodZeEksmkScbAgsnSlqlSj2uOLD5fQxYEdCso4er+AG5Bpn8QAkopiHTrR4HLqCs3qGFyapM
V/VO8yKr27G8hFFmcHja5i7zeUTwrJcyYeVb7p/REPGbVFMARi9lCUA3KQ+e+itJy6NzR3xuhAs+
LnTAHpquU1RrZdRw505Wepu0rvEIxJAiH2koQ4z5dQ==
=uaxZ
-----END PGP SIGNATURE-----

--------------fd0Q01bpugZgIcUpAkk51Pav--

