Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLNGAw48C2oJFAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:19:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A69570C20
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 18:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312148.1582321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0fy-0000av-Um; Mon, 18 May 2026 16:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312148.1582321; Mon, 18 May 2026 16:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP0fy-0000Y1-S0; Mon, 18 May 2026 16:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1312148;
 Mon, 18 May 2026 16:18:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wP0fw-0000Xv-Sb
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 16:18:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP0fv-001IkX-CI
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 18:18:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a0b3bdc-2eae-0a2a0a5409dd-0a2a450495a0-12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:18:39 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a0b3bde-1dec-0a2a45040019-d155802fdd3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 18:18:39 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso17971385e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 09:18:39 -0700 (PDT)
Received: from [10.2.5.24] (wl.mlade.cb.wlnet.cz. [193.165.72.195])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ff2cb4ae0sm114076225e9.0.2026.05.18.09.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 09:18:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1779121118; x=1779725918; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BpPw5/zJIR0qZbQ74z7sS+aD2QTInuFDoKI9xJxpE+s=;
        b=VdlR/OyeobrAUnGhQ4Zjt7VZG3bZneNhE69pxvwp0zgOu0qxJMGRtwJHF8Yt888UeK
         z3MCG9sg/nKrYB88AwCM0BVZrl/eRe4heXxisamUIHMrezJ1YGQ5Ej1f4cBPyDo55QRs
         bRwD1wDEYZOml929ZUCboAi8KoNWFYzj2NQMA+M45DM6iwjgpbjFynUpxOOAQNi7j5v2
         sqsMjM9PPenh6Nuv92R4G9W38jt7Y6LwYMmqJ+jDLSdNdX8Gyl11QtyikbaazAY0DL20
         aItQBc2FMTa240MCfEWQI0KEuEQZ4dbGyERFKVgXJ9EzOBawtg44rALYYrnHqr8FLMhS
         LNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121118; x=1779725918;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpPw5/zJIR0qZbQ74z7sS+aD2QTInuFDoKI9xJxpE+s=;
        b=sjNl6pdmImf/BM/mc54dProO23Bikp8/4VZWNq9wrQBCT6GPpwySFr+ewy2yGZvgGO
         Mc5XmBKQzXRmVRCEgw8LggS4tv/Lly31VpfdvlGCnEqpFGWkXvVEUCgj2bmkRdS9JK2D
         B0JwcJafLqT4LMKOMBM+c54tvwfAszmqf2t9xgO8MB4qBB1AocIOGGJxANEfV9Yj9HqH
         2prYHLyTTm5mAhJm1T58++vggsp596NDFC56/28UjtedwIRw29Xq/Vlb9Y8C7COykFeY
         QXeuTL6G062Rb0Gmx+v0eFZVMOSa9M6WOaYk3Iq81sUHQLF5HTEzmWNFdA2iBi+D42ym
         wZgw==
X-Forwarded-Encrypted: i=1; AFNElJ8DGYk6zOXru4hrQUQZGg6sQpUqMwFZelTAJ+tWMdDS8XjRAHKWEpSCwGO/wDgfX+X6nGXn09b3UN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQi3yy+VQNAu0Hr0YShaNKTzouhjjtUP1PyKY1Sje+WCwTpyOa
	0HCilVDz6t/FgDrJcSYHXSO3JwEqBgzM4wDcr5KCzHn8DdldDM6o2VtcSj4rEgn72Gw=
X-Gm-Gg: Acq92OGaq22aiVhMSfRrcimV3lN4bdarikT8hQW9CMH8DnzjdOyCYU8MN+UfuY8Nbxv
	7+gVFkRJtotHZL/KsfnWglHrUMvXllUDEwUzfGm8IqAaKXejIGg1JBLn9AGW/AK32QtCEula6fA
	wkWMn/thoZPvqrfbKM5jllRq7DLud9VnjNVNDkt7KFcnvKPMWrtfvle7yzRtm399Q/F31Tgob8j
	nmXwC2ZtGEEKDitp6IgqLyM+TI4ez5eOJnD5REfovO3gm1PP4Kn98fc0rwE2CW3XvwTMKBouMsK
	RvSiqnXlbGI2rD1SBIwwiKFYTQO2yyCqf864JKxOakw2WkrB7j8oLkaogfcJwMx8ydDMIi+Kwul
	438iltqJ0pn9Z5fFJalL3Bj2+ppf7sDc2BP7twUnyffYSyWAiOBZfhDNn+fqSw/bgXmoD08bKht
	PlKYNdcuC7vW+pKtiBzbrQ/blgQMqkyrV7HnVqKDeHeIfWZTA=
X-Received: by 2002:a05:600c:c087:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-48fe60de6bdmr189702555e9.1.1779121118520;
        Mon, 18 May 2026 09:18:38 -0700 (PDT)
Message-ID: <8b37000c-1b44-4ae8-acf4-5ea3e4f069d9@suse.com>
Date: Mon, 18 May 2026 18:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] tools/xenstore: fix issue related to XSA-417
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260429120619.1013440-1-jgross@suse.com>
 <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
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
In-Reply-To: <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6vKDRpy0r0xguvdHwOlq6kGT"
X-purgate-ID: tlsNG-ebf023/1779121119-29B7B3FF-DB875C19/10/73395122804
X-purgate-type: spam
X-purgate-size: 12457
X-Spamd-Result: default: False [-1.58 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 46A69570C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6vKDRpy0r0xguvdHwOlq6kGT
Content-Type: multipart/mixed; boundary="------------Wb1oIGPfuMai8FvQltbG2Axn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <8b37000c-1b44-4ae8-acf4-5ea3e4f069d9@suse.com>
Subject: Re: [PATCH v2 0/4] tools/xenstore: fix issue related to XSA-417
References: <20260429120619.1013440-1-jgross@suse.com>
 <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
In-Reply-To: <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
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

--------------Wb1oIGPfuMai8FvQltbG2Axn
Content-Type: multipart/mixed; boundary="------------CxnSkQVdbP6MzIbORzJDJMZV"

--------------CxnSkQVdbP6MzIbORzJDJMZV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDUuMjYgMTc6NDgsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IA0KPiANCj4g
T24gNC8yOS8yNiAyOjA2IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlcmUgaXMg
b25lIGNvcm5lciBjYXNlIG9mIFhTQS00MTcgd2hpY2ggd2Fzbid0IGhhbmRsZWQgY29tcGxl
dGVseQ0KPj4gd2l0aCB0aGUgcGF0Y2hlcyBiYWNrIHRoZW4uDQo+Pg0KPj4gVGhlIFhTQS00
MTcgZml4ZXMgdHJpZWQgdG8gc29sdmUgdGhlIHByb2JsZW0sIHRoYXQgYSBuZXcgZG9tVSB3
b3VsZA0KPj4gaW5oZXJpdCBhY2Nlc3MgcGVybWlzc2lvbnMgdG8gYWNjZXNzIFhlbnN0b3Jl
IGVudHJpZXMgd2l0aCB0aGF0IGRvbWlkDQo+PiBsaXN0ZWQgaW4gdGhlIGFjY2VzcyByaWdo
dHMuIEluIG9yZGVyIG5vdCB0byBtYWtlIGl0IGVhc3kgZm9yIGEgZG9tVQ0KPj4gdG8gcXVl
cnkgZXhpc3RlbmNlIG9mIGEgZG9taWQsIGFkZGluZyBwZXJtaXNzaW9uIGZvciBhIG5vbi1l
eGlzdGluZw0KPj4gZG9tYWluIGlzIG5vdCByZWplY3RlZCBieSBYZW5zdG9yZS4gVGhlIFhT
QS00MTcgcGF0Y2hlcyBzb2x2ZWQgdGhhdA0KPj4gcHJvYmxlbSBieSBhZGRpbmcgYSBmbGFn
IHRvIGEgcGVybWlzc2lvbiBlbnRyeSByZWZlcmVuY2luZyBhIG5vdA0KPj4gZXhpc3Rpbmcg
ZG9tYWluLCBpbmRpY2F0aW5nIHRoYXQgdGhlIHBlcm1pc3Npb24gc2hvdWxkIG5vdCBiZQ0K
Pj4gZWZmZWN0aXZlIGZvciBYZW5zdG9yZS4NCj4+DQo+PiBPbmUgY29ybmVyIGNhc2Ugd2Fz
IG5vdCBoYW5kbGVkOg0KPj4NCj4+IENvbnNpZGVyIGd1ZXN0IDEgYW5kIGd1ZXN0IDIgcnVu
bmluZy4gR3Vlc3QgMSBhZGRzIGd1ZXN0IDIgdG8gYmUgYWJsZQ0KPj4gdG8gYWNjZXNzIGEg
WGVuc3RvcmUgZW50cnkuIE5vdyBndWVzdCAyIGlzIHJlbW92ZWQgZnJvbSB0aGUgc3lzdGVt
IGFuZA0KPj4gYSBuZXcgZ3Vlc3QgMyB3aXRoIHRoZSBzYW1lIGRvbWlkIGFzIGd1ZXN0IDIg
aGFkIGlzIGJlaW5nIGNyZWF0ZWQuDQo+Pg0KPj4gV2hlbiBndWVzdCAzIHdvdWxkIHRyeSBu
b3cgdG8gYWNjZXNzIHRoZSBYZW5zdG9yZSBlbnRyeSwgaXQgd291bGQgZmFpbCwNCj4+IGFz
IFhlbnN0b3JlIHdvdWxkIHNlZSB0aGF0IHRoZSBYZW5zdG9yZSBlbnRyeSBpcyBvbGRlciB0
aGFuIGd1ZXN0IDMuDQo+Pg0KPj4gQnV0IGlmIGd1ZXN0IDEgaXMgbW9kaWZ5aW5nIHRoZSBw
ZXJtaXNzaW9ucyBvZiB0aGUgWGVuc3RvcmUgZW50cnkNCj4+IGFnYWluLCBlLmcuIGJ5IGFk
ZGluZyBhbm90aGVyIGRvbWFpbiwgdGhlIHBlcm1pc3Npb24gZW50cnkgZm9yIGd1ZXN0IDIN
Cj4+IHdvdWxkIGxvc2UgaXRzICJzcGVjaWFsIGZsYWciLCByZXN1bHRpbmcgaW4gZ3Vlc3Qg
MyBub3cgcmVhbGx5IGdhaW5pbmcNCj4+IGFjY2VzcyB0byB0aGUgWGVuc3RvcmUgZW50cnku
DQo+Pg0KPj4gVGhpcyBzZXJpZXMgaXMgZml4aW5nIHRoaXMgcHJvYmxlbSBieSB0aGUgZm9s
bG93aW5nIG1lYW5zOg0KPj4NCj4+IC0gSW4gb3JkZXIgdG8gYWxsb3cgZ3Vlc3RzIHRvIGtu
b3cgdGhhdCBhIFhlbnN0b3JlIGVudHJ5IHBlcm1pc3Npb24NCj4+IMKgwqAgbWlnaHQgaGF2
ZSBnb25lIHN0YWxlLCBhbGxvdyB1bnByaXZpbGVnZWQgZ3Vlc3RzIHRvIHJlY2VpdmUNCj4+
IMKgwqAgQHJlbGVhc2VEb21haW4gd2F0Y2ggZXZlbnRzLiBUaGlzIGRvZXNuJ3Qgb3BlbiBh
IHNlY3VyaXR5IGhvbGUsIGFzDQo+PiDCoMKgIHRoZSBvbmx5IGtub3dsZWRnZSB3aGljaCBj
YW4gYnkgZ2F0aGVyZWQgZnJvbSB0aGF0IGNoYW5nZSBpcyB0aGF0IGENCj4+IMKgwqAgZG9t
YWluIGlzIGdvbmUsIG5vdCB0aGF0IGEgZG9tYWluIHdpdGggYSBzcGVjaWZpYyBkb21pZCBp
cyBleGlzdGluZy4NCj4+DQo+PiAtIFdoZW4gYSBkb21haW4gaXMgcmVtb3ZlZCwgcmVtb3Zl
IGFsbCBwZXJtaXNzaW9ucyByZWxhdGluZyB0byB0aGlzDQo+PiDCoMKgIGRvbWFpbiBmcm9t
IGFsbCBYZW5zdG9yZSBlbnRyaWVzLg0KPj4NCj4+IE5vdGUgdGhhdCB0aGlzIGlzc3VlIHdh
cyBkaXNjdXNzZWQgYnkgdGhlIFhlbiBzZWN1cml0eSB0ZWFtIGFuZCB3ZQ0KPj4gZGVjaWRl
ZCBub3QgdG8gaXNzdWUgYW4gWFNBLCBhcyB0aGVyZSBhcmUgbm8ga25vd24gdXNlIGNhc2Vz
IHdoZXJlIG9uZQ0KPj4gdW5wcml2aWxlZ2VkIGd1ZXN0IHdvdWxkIGdyYW50IGFjY2VzcyB0
byBpdHMgWGVuc3RvcmUgbm9kZXMgdG8gbW9yZQ0KPj4gdGhhbiBvbmUgb3RoZXIgdW5wcml2
aWxlZ2VkIGd1ZXN0cy4NCj4+DQo+PiBXZSBkZWNpZGVkIHRvIGRlbGF5IHRoaXMgcGF0Y2gg
c2VyaWVzIHVudGlsIHRoZSB3YXRjaCBkZXB0aCBmZWF0dXJlIGhhcw0KPj4gYmVlbiBjb21t
aXR0ZWQsIGFzIHdpdGggdGhhdCBmZWF0dXJlIGF2YWlsYWJsZSBpdCBpcyBub3cgcG9zc2li
bGUgZm9yDQo+PiBhIGd1ZXN0IHRvIGhhbmRsZSB0aGUgZGVhdGggb2YgYSBzcGVjaWZpYyBk
b21haW4gaW4gYSBzYW5lIHdheS4NCj4+DQo+PiBDaGFuZ2VzIGluIFYyOg0KPj4gLSBzb21l
IG1pbm9yIGNvbW1lbnRzIGFkZHJlc3NlZA0KPj4NCj4+IERlbmlzIE11a2hpbiAoMSk6DQo+
PiDCoMKgIHhlbi9wdWJsaWM6IGludHJvZHVjZSBET01JRF9BTlkNCj4+DQo+PiBKdWVyZ2Vu
IEdyb3NzICgzKToNCj4+IMKgwqAgdG9vbHMveGVuc3RvcmVkOiBhZGQgc3VwcG9ydCBmb3Ig
ImFsbCBkb21haW5zIiBub2RlIHBlcm1pc3Npb24NCj4+IMKgwqAgdG9vbHMveGVuc3RvcmVk
OiBhbGxvdyBAcmVsZWFzZURvbWFpbiB3YXRjaCBmb3IgYWxsIGRvbWFpbnMNCj4+IMKgwqAg
dG9vbHMveGVuc3RvcmVkOiByZW1vdmUgcGVybWlzc2lvbnMgcmVsYXRlZCB0byBkZWFkIGRv
bWFpbg0KPj4NCj4+IMKgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbsKgwqDCoMKgwqDCoMKg
IHzCoCA0ICsrDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvY29yZS5jwqDCoMKgwqDCoMKgwqDC
oMKgIHwgNDUgKysrKysrKysrKysrKystLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2Rv
bWFpbi5jwqDCoMKgwqDCoMKgwqAgfCA3OCArKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uaMKgwqDCoMKgwqDCoMKgIHzC
oCAzICstDQo+PiDCoCB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oIHzCoCAyICsN
Cj4+IMKgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsr
Kw0KPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRp
b25zKC0pDQo+Pg0KPiANCj4gUmVsZWFzZS1BY2tlZC1ieTogT2xla3NpaSBLdXJvY2hrbyA8
b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+DQoNCkkgYmVsaWV2ZSB0aGlzIHNlcmllcyBj
YW4gYmUgY29tbWl0dGVkIG5vdywgYXMgU3RlZmFubyBoYXMgQWNrLWVkIHBhdGNoIDE/DQoN
Cg0KSnVlcmdlbg0K
--------------CxnSkQVdbP6MzIbORzJDJMZV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------CxnSkQVdbP6MzIbORzJDJMZV--

--------------Wb1oIGPfuMai8FvQltbG2Axn--

--------------6vKDRpy0r0xguvdHwOlq6kGT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoLO9wFAwAAAAAACgkQsN6d1ii/Ey+R
lAf8CmigA9dldr+ZO/QQ3kXy8ZId5XZ0EzjAcKKwwKl/oub9/W0Uzo8vcNOatmBmcBzL0ZUs4Mm6
SLsNQDgfC5C5ZhPOBBBgKEoPKmVGW4NN5D4/kvP+uy3PggKxtsIfSo2ZfOZmSSpwyAzTYVWx1Zbc
RDmYjOBC/4FPpJC+DNDr3/H8FV0sCEAm57oCa4IDIWWebQReEDwwW7W6hFZxE4iKMP0FQjrdhAYZ
D3fwj7uVUeHCiOQ5PclPCo64B2RlcHCezekOPGEKdHmHF7hs69z085i7OHfms9oiWyoiqnK9pweS
tdZd6eFmM5FoXY0Br8VEvxvfEeh/t9OK3MI+rdlawQ==
=X0YZ
-----END PGP SIGNATURE-----

--------------6vKDRpy0r0xguvdHwOlq6kGT--

