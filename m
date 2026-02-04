Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LNWBI4bg2l/hwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:12:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D18E44F5
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220356.1529069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZru-00069G-R4; Wed, 04 Feb 2026 10:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220356.1529069; Wed, 04 Feb 2026 10:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZru-00066B-OS; Wed, 04 Feb 2026 10:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1220356;
 Wed, 04 Feb 2026 10:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vnZrt-00065z-9C
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:12:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8b50db-01b1-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 11:12:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so1091808566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:12:15 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6594a216ac5sm1052882a12.22.2026.02.04.02.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:12:14 -0800 (PST)
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
X-Inumbo-ID: fa8b50db-01b1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770199934; x=1770804734; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yvu5NaCE0H48m1qvj9lQJ8VXBVs690RL+W5tcEoGOB4=;
        b=cb+x2PqDQgEABbqR640rkWT7EpHyMMJI/UpX/+ZQTRgInxoMWFr+inK7KwZ1BjyDn1
         DnRA7nrt4mh/P8sz9EcHdU8/SFVftPofT8BymaQlDWlHNrGuLolgDpHT1g7sbJj1LyXN
         v1rOEFDs5l0DWtPhXw/jMvK6uh2+Sppc1133gUkuEQEkVmV056UFGImvul+YwRdPMH10
         l2bPSuYjMuzkJqbhsKsiwJSwbkLEt+Cnbc+VhrMqnkw0TLXkz4/ECYA+uIBhtQROyiws
         9mIazw8vvL1mJg0maKavP0ofpFAQhTSS+4eviCreb/nkYrYPQOsoQyYcCmNIAKn4QqTx
         ceGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199934; x=1770804734;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvu5NaCE0H48m1qvj9lQJ8VXBVs690RL+W5tcEoGOB4=;
        b=Y7ZqHyYnV5AwyPbR4FkhZjAgKKklDNl3SB7oI9pznM6r8V+Vj66l3IQmO02/VBaNpI
         JzCxNDzjWna6TeoLz9zy5EmjkIci1FynpEvD2A/2WKxnQ6m0NznEMZBXgMLHtetUfF8l
         7yGrbGeZNnwa6Uik+UVT7kyTP9CYVrF2DbihgZ5kSo8tW3d2LEA8whQedu6WykvFwZ0e
         ZunIP1rdn866DdqCNFiOkfBnR7DAuMlHTkTXi6f6YpJFtnuAhqDALon/6XpunvcOeQVJ
         WCVDeTOHnysG8l2wOAKYllmRsdXKsLRinKAWqsbBsbGz7sZrTw+S8pUwekyiJoTXxwUt
         WTcw==
X-Forwarded-Encrypted: i=1; AJvYcCWpdQN5C0xir6EcvYM3UXSi7QhI5ptEzMmE9dYyAhc94KOBflB88BI4imkN2YEfuS5gbQU6YPl1oSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSHeGqJvf8K4Xwbt4phOalDF9u/54eE7eINtUiMSaKpcdnwg6W
	R5R033IuvxJmDE0B4gJO2GJyEhXZmqNw+/2vURV1k3sBu3e+PRFzoVIKBJZzUn2sdfYQBXIXB8S
	sHR3IgTQ=
X-Gm-Gg: AZuq6aJIBqhuC5rZH3Gm2JPZAIQnzSFqJvDP/zwtKRPPNOOkjXBc8BLicFzK7eX/VxY
	o+qlEQlf+r/Z5uxNklCAd1tWpBZ3iipLUYnAer79zBXUzWMkihTlipqbYQhJQAYx9uGy5Zt8zIT
	E8dGpvjwi5Kyyb0st4tPj5hXkB2p989XWK7GWMS9GUKLYuSJsFTK0Kn1+TVc3wizE8TUkUO26NH
	d7IqLke33obTuPHDLl+ueMhcYpY1Xb1UZ/dgKWB9YsqFtaoRqWJRYsHkE4fA0GvLCVq1UMxqHiQ
	r+UGxFkPppP5iWQZEPwOL9L/TYK1vsmoNO2FX4Fvw054DI4Yl7klWcNM+/UrQ2ffVyRbPv1O+1a
	TuOEIpG4eManGaIelNmwhQgHGO10F3PM7Dwxp27yhy4VkmQzrCeQwrWYYhgE6Bpx0QlfLjX0R0W
	OomzEfLPn2BhZd2wiuYJGuSlWCy/xvFcR4D3w0qaIAaodKDbTv184wFzOxhG/z4yCR/Uw20uPHP
	X18SiI3RWJF/P5cErn9XFoXDnKna7s/vzF6FQ==
X-Received: by 2002:a17:907:72d3:b0:b88:21cd:5fcc with SMTP id a640c23a62f3a-b8e9f396981mr163403066b.36.1770199934381;
        Wed, 04 Feb 2026 02:12:14 -0800 (PST)
Message-ID: <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
Date: Wed, 4 Feb 2026 11:12:13 +0100
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
In-Reply-To: <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IPAk83EaSu1UIXZ8PBathxBl"
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 74D18E44F5
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IPAk83EaSu1UIXZ8PBathxBl
Content-Type: multipart/mixed; boundary="------------XwxvsQTKDKo0DpTdgMI0vyQ0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <056fa0ce-2832-4b0b-925b-a55e4086d88a@suse.com>
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
 <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
 <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
In-Reply-To: <59fa62df-0fd6-4dba-ada9-ab89570ff624@suse.com>
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

--------------XwxvsQTKDKo0DpTdgMI0vyQ0
Content-Type: multipart/mixed; boundary="------------SAOSuQaTgZoN5a8T95ssIyIf"

--------------SAOSuQaTgZoN5a8T95ssIyIf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjYgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMi4yMDI2
IDExOjAxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDQuMDIuMjYgMTA6NTEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIwMjYgMTA6MjUsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA0LjAyLjI2IDEwOjE1LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDA0LjAyLjIwMjYgMTA6MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+
Pj4+Pj4gT24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDg6NTY6MTBBTSArMDEwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjYgMDg6NDksIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+Pj4+Pj4+PiBBbHNvLCBJIHdvdWxkIHJlbW92ZSB0aGUgdG9vbHMg
Z3VhcmRzLCBJIHRoaW5rIG9uY2UgYSBET01JRF8gY29uc3RhbnQNCj4+Pj4+Pj4+IGlzIGFs
bG9jYXRlZCBpdCBiZWNvbWVzIHBhcnQgb2YgdGhlIHB1YmxpYyBBQkksIGFuZCBpdCBjYW5u
b3QgYmUNCj4+Pj4+Pj4+IHdpdGhkcmF3bi4gIFNlZSBmb3IgZXhhbXBsZSBET01JRF9JRExF
OiBpdCdzIG9ubHkgdXNlZCBpbnRlcm5hbGx5IGluDQo+Pj4+Pj4+PiB0aGUgaHlwZXJ2aXNv
ciBBRkFJQ1QsIHlldCB0aGUgZGVmaW5lIGlzIGZ1bGx5IHZpc2libGUgaW4gdGhlDQo+Pj4+
Pj4+PiBoZWFkZXJzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJdCB3YXMgbWUgdG8gYXNrIGZvciBp
dCB0byBiZSBndWFyZGVkIGxpa2UgdGhpcy4gRE9NSURfSURMRSAoYW5kIHBlcmhhcHMNCj4+
Pj4+Pj4gb3RoZXJzKSBub3QgYmVpbmcgZ3VhcmRlZCAoYXQgbGVhc3QgZm9yIElETEU6IGJ5
IGp1c3QgX19YRU5fXykgaW1vIHdhcyBhDQo+Pj4+Pj4+IG1pc3Rha2UuIFRoYXQgbWlzdGFr
ZSBtYXkgaW4gZmFjdCBiZSBjb3JyZWN0YWJsZSwgaWYgd2UgY291bGQgcHJvdmUgdGhhdA0K
Pj4+Pj4+PiB0aGUgSUQgY2Fubm90IHVzZWZ1bGx5IGJlIHBhc3NlZCBpbnRvIGFueXdoZXJl
Lg0KPj4+Pj4+DQo+Pj4+Pj4gRXZlbiBpZiBpdCdzIG5vdCBwYXNzZWQgaW50byBhbnl0aGlu
ZywgZG9lcyBpdCBtYWtlIHNlbnNlIHRvIGd1YXJkDQo+Pj4+Pj4gdGhlbT8gIFRoZSByZXNl
cnZlZCBkb21pZCB2YWx1ZXMgYXJlIGFscmVhZHkgY29uc3VtZWQsIGllOiBjYW5ub3QgYmUN
Cj4+Pj4+PiByZXVzZWQgaW4gYW55IHdheS4gIEl0IGp1c3Qgc2VlbSB0byBtZSBsaWtlIG1v
cmUgaWZkZWZlcnkgY2h1cm4gZm9yIG5vDQo+Pj4+Pj4gc3BlY2lmaWMgYmVuZWZpdC4NCj4+
Pj4+DQo+Pj4+PiBXZWxsLiBGcm9tIGFuIGFic3RyYWN0IHBlcnNwZWN0aXZlLCBwdXJlbHkg
aHlwb3RoZXRpY2FsIGF0IHRoaXMgcG9pbnQsIEkNCj4+Pj4+IGNvdWxkIHNlZSBhIHBvdGVu
dGlhbCBuZWVkIHRvIHJlLW51bWJlciB0aGVtLCBlLmcuIHRvIHNpbXBsaWZ5IGNoZWNraW5n
DQo+Pj4+PiBhZ2FpbnN0IGdyb3VwcyBvZiB0aGVzZSBzcGVjaWFsIElEcy4NCj4+Pj4+DQo+
Pj4+PiBZZXMsIGV4Y2VzcyAjaWZkZWYtYXJ5IGlzIGFuIGlzc3VlLiBFeGNlc3MgZXhwb3N1
cmUgb2YgdGhpbmdzIGFsc28gaXMsDQo+Pj4+PiB0aG91Z2guIEZpbmRpbmcgdGhlIHJpZ2h0
IGJhbGFuY2UgYmV0d2VlbiBib3RoIGNhbiBiZSBpbnRlcmVzdGluZy4NCj4+Pj4NCj4+Pj4g
SSBoYXZlIGEgcGF0Y2ggaW4gd29yayB3aGljaCB3b3VsZCB3YW50IERPTUlEX0FOWSBub3Qg
YmUgZ3VhcmRlZC4gSSB0aGluaw0KPj4+PiBlc3BlY2lhbGx5IERPTUlEX0FOWSBjb3VsZCBi
ZSB1c2VmdWwgZm9yIG90aGVyIGNhc2VzLCB0b28uDQo+Pj4NCj4+PiBNaW5kIG1lIGFza2lu
ZyB3aGVyZSwgb3V0c2lkZSBvZiB0aGUgdG9vbHN0YWNrLCB5b3UgaW50ZW5kIHRvIHVzZSBp
dD8NCj4+DQo+PiBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIHVzZSBpdCBmb3IgWGVuc3RvcmUg
cGVybWlzc2lvbnMuDQo+Pg0KPj4gUHJpbWFyeSB1c2UgY2FzZSB3b3VsZCBiZSB0byBhbGxv
dyB0aGUgc3BlY2lhbCB3YXRjaGVzIGZvciBkb21haW4gY3JlYXRpb24NCj4+IGFuZCByZW1v
dmFsIHRvIGJlIHVzYWJsZSBmb3IgYWxsIGd1ZXN0cywgYnV0IHRoZXJlIG1pZ2h0IGJlIHVz
ZSBjYXNlcyB3aGVyZQ0KPj4gYSBkb21VIHdhbnRzIHRvIGdpdmUgbm9kZSByZWFkIGFjY2Vz
cyBmb3IgZXZlcnlvbmUuDQo+IA0KPiBXb3VsZCB0aGF0IHJlcXVpcmUgZXhwb3NpbmcgYmV5
b25kIHRoZSB0b29sc3RhY2sncyBib3VuZGFyaWVzPw0KDQpZZXMsIGFzIHRoaXMgd291bGQg
cmVxdWlyZSB0aGUgdXNlciB0byBzcGVjaWZ5IERPTUlEX0FOWSBhcyB0aGUgZG9taWQgaW4N
CnN0cnVjdCB4c19wZXJtaXNzaW9ucy4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------SAOSuQaTgZoN5a8T95ssIyIf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------SAOSuQaTgZoN5a8T95ssIyIf--

--------------XwxvsQTKDKo0DpTdgMI0vyQ0--

--------------IPAk83EaSu1UIXZ8PBathxBl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmDG30FAwAAAAAACgkQsN6d1ii/Ey+K
Twf9HAM/pj9x5KuMOr9mVU+e8r7vHXPxf/uQJhWgT1UHvcrJwiX8ba2fra00elWw7Q8D9gGEw8N/
f+PwI12S64XGFh3NSR0ffx3xCm/RBUtLguBke5SX2AbBAZEHo/xXyinPBU8s5yYQlcXE85yoU4tZ
ltbYTEkRcB8FUZFO87uZWEfzNCXRBbpizt/3Sp4Q/M+oMnfrC3ZbywXImq5PZeKRPdsetnGO29Wp
0hFBH9rz683daa0TY6gdgJrQylI1zh7IO28o9NOAAsx+XecpcFAF0HRZMV9gWJd9dExzEuixUYCJ
eBjbMnlS9oJ5VpdzO9cOo/4azTBqRxQmCXNlHSpkUQ==
=NiQi
-----END PGP SIGNATURE-----

--------------IPAk83EaSu1UIXZ8PBathxBl--

