Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M1sGbAQg2kPhQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:26:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED7E3CE6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 10:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220290.1528999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZ90-0003tl-2R; Wed, 04 Feb 2026 09:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220290.1528999; Wed, 04 Feb 2026 09:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZ8z-0003ql-Vq; Wed, 04 Feb 2026 09:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1220290;
 Wed, 04 Feb 2026 09:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vnZ8y-0003qd-KL
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 09:25:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb2eaf4-01ab-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 10:25:50 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6582e8831aeso10068334a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 01:25:50 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6594a2166acsm1094809a12.18.2026.02.04.01.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 01:25:49 -0800 (PST)
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
X-Inumbo-ID: 7eb2eaf4-01ab-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770197150; x=1770801950; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ctu22ieWP6iQPWf1ngcY8dQ8MxXrIF00NzeTvW/mk+A=;
        b=fsWzomf0uEKISzRM92waa5JGAqO4+abqGqV55EyA5gl/5HOW334uulbiHLhTWEvvtN
         epLryQv3QEJ9e6CMtLmrGOI3HRLjwetULTSdIY4xyVKZZrY8R7jc93lQaGORhaD/ThsP
         LM9ZYaRLVAmBjcMpJfJ6mzCDl7VBj1WRntWI0g+YgQ2Gebe908CKkflF3/i1dDVQxMSf
         BXdKX7h4/RgGck6x2YCTW/xr7f+GymO1JSJwaeEhLm+RR7wmcI643JdYrk0vg8e/91yA
         v/KuAVymx1bhDAJ/DUwJFXi3AJZZvKyZJEejDrEdCJ0SUk2du0DUQwaPmJRZuWFM6dir
         gb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197150; x=1770801950;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctu22ieWP6iQPWf1ngcY8dQ8MxXrIF00NzeTvW/mk+A=;
        b=EiSAa37tQbFtl5vOXlMN28A51IzBFfmhWTTj9377p4ButnFQvaL8ZuDZZ60xJgDQs2
         PjMs0921Rbr281aYRbfylVhYUEt1oS65mHDHdQJ0teOKe38zEJgzB14xkmhSkueI5hlz
         DvYHM8czMEwQwKAdiCt+ZRfkp4cDhs4NvbhFYASuUfFLtLPk3/TTbQvZg8bIvh329w/G
         pOs3bH09B0lwMwHL+c3/H1sv/2KdsHTplfr12C8oUXidoWtiPsWfxzcxWRr7OJq09xeP
         M0F4m5oMU/4rG0mLwSMsVhJyz+7EOvq8WUpHcJK32uY384YefDAgczGwdHDXm29yTDBe
         83tw==
X-Forwarded-Encrypted: i=1; AJvYcCWl20rliKjjTbiZHcovI9VmRQlYXHMfOjfRqRJf3LW6+hF8DC12pqC4Nd4vGA0NPUBiPwfKVyRtWpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQbgD8NJu8sCE5RldXP1QdRq0sBQoloJRafIX1nj1JXpOnDiHq
	rQ2u90TDwRP0SM55Hu/RY987qN9v4WdNr6blrqf/G5txESaVGuK/yRE5Zlyv2tEnUgYy+Ff4F5l
	rAtIqfRE=
X-Gm-Gg: AZuq6aKTU68nrB23t5XatE7kn9YZMSlkKJaMwaLUzSaaIPRr2A25GKYHNLgaWpNXruN
	zYORFNelBeo2pDj7kzSCFA+9yMpdXLULiGIATj3reLsmgJ58Ob4WqFPxLO5NQiMT/a4DTpvAlFD
	lIZ5dn9uPYiexmKmqoVgjWpQV3lJMwqBtA0nWI4U3rFCab0RN7MKxywGV08OjGPd9O9w+9h16Lb
	PxHmYMTlO72xb1HQMpIpMZIroZP5Fz2cNu5Jwedc8Vkr7K3zVBBMU9uA+7tmh+mL3LwygAykj7p
	PZbmvQ7q5v8h1w0TgVLyDBzQaZ9LGkE04MYe+SlpuxLgvz7eN/reyDfB903wdK2sZMzZXX+llDd
	Rj57MyEAgAnDkYOb0aWx3anN8tsl4fgwOpDJbeLQELLCzx9jmH3/rQF/wAyFGG1CfVtFZtf3PoP
	YevGrBxSaGxv93z9z8egmJmYaz/mgPp/dSxgQxMEhUBs2XfEJoZ+7uHjV01PnFNasi237hKg9UW
	A5LguMk3Pq2mpYDerqUDH2mWkWmjMN6X9RopcxfHjnxn3tT
X-Received: by 2002:a05:6402:146b:b0:658:bab5:5801 with SMTP id 4fb4d7f45d1cf-65949bb6e72mr1690042a12.5.1770197149721;
        Wed, 04 Feb 2026 01:25:49 -0800 (PST)
Message-ID: <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
Date: Wed, 4 Feb 2026 10:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
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
In-Reply-To: <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Lxyp0NA0YUSetyMxTPpU0hiT"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: CBED7E3CE6
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Lxyp0NA0YUSetyMxTPpU0hiT
Content-Type: multipart/mixed; boundary="------------P6IFotX3rFvIXHv1yI0yHKhV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Message-ID: <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
In-Reply-To: <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
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

--------------P6IFotX3rFvIXHv1yI0yHKhV
Content-Type: multipart/mixed; boundary="------------zAPeMZxZa2f8IoMki0QDQzw8"

--------------zAPeMZxZa2f8IoMki0QDQzw8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjYgMTA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMi4yMDI2
IDEwOjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4gT24gV2VkLCBGZWIgMDQsIDIw
MjYgYXQgMDg6NTY6MTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQu
MDIuMjAyNiAwODo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4gQWxzbywgSSB3
b3VsZCByZW1vdmUgdGhlIHRvb2xzIGd1YXJkcywgSSB0aGluayBvbmNlIGEgRE9NSURfIGNv
bnN0YW50DQo+Pj4+IGlzIGFsbG9jYXRlZCBpdCBiZWNvbWVzIHBhcnQgb2YgdGhlIHB1Ymxp
YyBBQkksIGFuZCBpdCBjYW5ub3QgYmUNCj4+Pj4gd2l0aGRyYXduLiAgU2VlIGZvciBleGFt
cGxlIERPTUlEX0lETEU6IGl0J3Mgb25seSB1c2VkIGludGVybmFsbHkgaW4NCj4+Pj4gdGhl
IGh5cGVydmlzb3IgQUZBSUNULCB5ZXQgdGhlIGRlZmluZSBpcyBmdWxseSB2aXNpYmxlIGlu
IHRoZQ0KPj4+PiBoZWFkZXJzLg0KPj4+DQo+Pj4gSXQgd2FzIG1lIHRvIGFzayBmb3IgaXQg
dG8gYmUgZ3VhcmRlZCBsaWtlIHRoaXMuIERPTUlEX0lETEUgKGFuZCBwZXJoYXBzDQo+Pj4g
b3RoZXJzKSBub3QgYmVpbmcgZ3VhcmRlZCAoYXQgbGVhc3QgZm9yIElETEU6IGJ5IGp1c3Qg
X19YRU5fXykgaW1vIHdhcyBhDQo+Pj4gbWlzdGFrZS4gVGhhdCBtaXN0YWtlIG1heSBpbiBm
YWN0IGJlIGNvcnJlY3RhYmxlLCBpZiB3ZSBjb3VsZCBwcm92ZSB0aGF0DQo+Pj4gdGhlIElE
IGNhbm5vdCB1c2VmdWxseSBiZSBwYXNzZWQgaW50byBhbnl3aGVyZS4NCj4+DQo+PiBFdmVu
IGlmIGl0J3Mgbm90IHBhc3NlZCBpbnRvIGFueXRoaW5nLCBkb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gZ3VhcmQNCj4+IHRoZW0/ICBUaGUgcmVzZXJ2ZWQgZG9taWQgdmFsdWVzIGFyZSBhbHJl
YWR5IGNvbnN1bWVkLCBpZTogY2Fubm90IGJlDQo+PiByZXVzZWQgaW4gYW55IHdheS4gIEl0
IGp1c3Qgc2VlbSB0byBtZSBsaWtlIG1vcmUgaWZkZWZlcnkgY2h1cm4gZm9yIG5vDQo+PiBz
cGVjaWZpYyBiZW5lZml0Lg0KPiANCj4gV2VsbC4gRnJvbSBhbiBhYnN0cmFjdCBwZXJzcGVj
dGl2ZSwgcHVyZWx5IGh5cG90aGV0aWNhbCBhdCB0aGlzIHBvaW50LCBJDQo+IGNvdWxkIHNl
ZSBhIHBvdGVudGlhbCBuZWVkIHRvIHJlLW51bWJlciB0aGVtLCBlLmcuIHRvIHNpbXBsaWZ5
IGNoZWNraW5nDQo+IGFnYWluc3QgZ3JvdXBzIG9mIHRoZXNlIHNwZWNpYWwgSURzLg0KPiAN
Cj4gWWVzLCBleGNlc3MgI2lmZGVmLWFyeSBpcyBhbiBpc3N1ZS4gRXhjZXNzIGV4cG9zdXJl
IG9mIHRoaW5ncyBhbHNvIGlzLA0KPiB0aG91Z2guIEZpbmRpbmcgdGhlIHJpZ2h0IGJhbGFu
Y2UgYmV0d2VlbiBib3RoIGNhbiBiZSBpbnRlcmVzdGluZy4NCg0KSSBoYXZlIGEgcGF0Y2gg
aW4gd29yayB3aGljaCB3b3VsZCB3YW50IERPTUlEX0FOWSBub3QgYmUgZ3VhcmRlZC4gSSB0
aGluaw0KZXNwZWNpYWxseSBET01JRF9BTlkgY291bGQgYmUgdXNlZnVsIGZvciBvdGhlciBj
YXNlcywgdG9vLg0KDQpMb29rIGUuZy4gYXQgWEVOX0FSR09fRE9NSURfQU5ZLiBFdmVuIGlm
IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHN3aXRjaCBpdA0KdG8gRE9NSURfQU5ZLCBpdCBzaG93
cyB0aGF0IHRoZSBjb25jZXB0IGFzIHN1Y2ggaXMgbm90IHJlc3RyaWN0ZWQgdG8gWGVuDQpp
bnRlcm5hbCB1c2UgY2FzZXMuDQoNCg0KSnVlcmdlbg0K
--------------zAPeMZxZa2f8IoMki0QDQzw8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zAPeMZxZa2f8IoMki0QDQzw8--

--------------P6IFotX3rFvIXHv1yI0yHKhV--

--------------Lxyp0NA0YUSetyMxTPpU0hiT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmDEJwFAwAAAAAACgkQsN6d1ii/Ey/w
iQf/Qtr3jDpJVNKOKzhTaJwpFgM4WwH1ua9uetsH6dZL2D9D/dvEBrpGJtFUZds3+OAF5PnRGM6+
LVT4uLK2efzCJy8m0E5T4Zyie0G8Bl7+ZuiYAlVe3VnZSkSJeqw2tziKh1sj9YoL2WYElUYa96vL
+lhnEWkSEiXFOi0izGEFszHB0OA0KISXdKHIuIY2soxnKdcHcLVO5PuBWALB88OXuCGt9AddSFd2
vNm14VI+ARPzY1iMg4vKJdYb3z21T18vijeCe0izrgli7i/LIRqwuJ/KelGKYwaOSTdjGQCtiFF6
LUcRA6+me7PVue8jeOWX28xOjMAn1vUFJerb46V8hA==
=B+JI
-----END PGP SIGNATURE-----

--------------Lxyp0NA0YUSetyMxTPpU0hiT--

