Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE5FMwBwy2k3HwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:56:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C7364A8F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268498.1557762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7T0b-0003aY-06; Tue, 31 Mar 2026 06:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268498.1557762; Tue, 31 Mar 2026 06:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7T0a-0003Yk-Rk; Tue, 31 Mar 2026 06:55:28 +0000
Received: by outflank-mailman (input) for mailman id 1268498;
 Tue, 31 Mar 2026 06:55:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w7T0Z-0003Ye-85
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 06:55:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7T0Y-0068hh-3p
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:55:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69cb6fd2-2eae-0a2a0a5409dd-0a2a4505980a-36
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:55:25 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69cb6fdd-5aeb-0a2a45050019-d155d02ca874-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:55:25 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-66bd4e0560fso2249891a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 23:55:25 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c0219ed95sm5982066b.29.2026.03.30.23.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 23:55:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1774940125; x=1775544925; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DLf42zTxqeYYkDdxbc1IcFhV935j2RSHmZX1aBALXLI=;
        b=VxItY2X5AsmM1TYTxfJGO1G4cR2bm0/2KuaxuLCOFfDtiL83sEX2Y7mwRuFUOJtA1v
         Kqgt/AcQlzosmpNGjsxGNNlCkBpD1X54w/SKju36ybcjvhzLQpfnneQZ3BQJmCntIQgU
         PcCuZwSSYChdw55qbPMCBXHsu+VKWkVxTDG7dHuTq53Xq/K2lo4zkU3yPo36QX60jevY
         LrudzcfekjSRkeHj1Eoyyy2iqvs1AUxAMIS2OnxbOQniwWdjScmpd6D9rnbShd+gHIfL
         by9Qv6clheOW7IKCS4Be/LH0zZij6rzexk1Lbd5NLGheCA7CyrIPnsQdvd6Hza8P6CeQ
         jq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940125; x=1775544925;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLf42zTxqeYYkDdxbc1IcFhV935j2RSHmZX1aBALXLI=;
        b=Bu+T7lrE9CSbavZC2wkTkmFIusX4ud9CJ7mPBW6BSvuQ9Vp8fammP/vTgLj8b1ro5o
         mEauoFNSAcqqoKtLTDugjn3Pm8RrsYwRdV7C5ihZooWnBn6nn/mO/YdEV3o1dlE+Stm/
         FSBSSJ2R1Wzefbe8UjTIERWFRLVdtzNrOWr+WOjdOZeCYa7z60je/WKxzjoxy/a4zPLj
         KlC1TAYkCtx58xmj13tTEgEa3ik+xeLFyUhCFcELmR+KT960K4tuCOpGX03GuTkStwdy
         GeUw/uZFXZpn9EqF0vVPwgF3KTxpo0hFBT4JqSme3xvdPI4QimPCQwt5bdfv0l2S9Ttf
         M6fA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5ex8U31Eg9XbqfMvjz19z8I3Jk3mN7U7bwwU08PfRGAy0AWTjKFXQwsPzQmMaY9U/UZaTODRmag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgrHF41oOYJYTJI62dn1qR36tIXm5xTXJzU8ZauARNHqFWitpH
	Q2NcDRXwRgEoNJFlmS+ghRHM6M5UzjZq11hc8Nyx4Sp2Z7FdL8wtMKevmfqn2XF97hw=
X-Gm-Gg: ATEYQzwoTdAgY+lcHW3BZPQr3vUOGsLxRs8hAqgBcHu3fWn4B+8U7T+JaWwDuhw9cPt
	MnTX5mHI2ul5KkVZDkAmHNuBISFKRN7yvy+V93PZf5n/CcI4Jf+DPJMaBievTPVjyuuwI9WTFVh
	lVEHdhXaKB2ijqkJEPrf8cv9rePQnvfhBAPFXQ4xgUhGIqRo6AaZlytrDcg4weL8JpO149Sz4Y4
	ch5m295gzqjFVMCDai6OOrT+vN01+HLnxgbcO/jYpCwMBiDHKDcKJyMrSl8hgWfeTSe8gNo8AFn
	JSGHj1y7kWtzjszKyoto1QscAFoKQOpwtx6M+ePPf27lFIkIFBTc9BM6wSIfIMZgY0qHat8zCYO
	tK9JlIo0WnU9Lss+9O7tk2rr0Z783GmEj8nD7dp8iWzln428pcXaDoSB2dFUqJ/i/tSoCNZM9AK
	qbe36TmGZLRwnItL04q/61qQbGRkE2Is4lpcpIRVYRbhLJTCw46Mwmoph1dMbfbSp6O0pokIVMP
	qqdXIt6VcymPRB8phn2KkH44wbhgtsh6PyFmqTXYNIVjl2cwY1ILw==
X-Received: by 2002:a17:907:e90:b0:b97:6d1b:4be8 with SMTP id a640c23a62f3a-b9be8383765mr141242966b.10.1774940125253;
        Mon, 30 Mar 2026 23:55:25 -0700 (PDT)
Message-ID: <713d4c85-6b39-4c6e-aed3-f5bae0a4d174@suse.com>
Date: Tue, 31 Mar 2026 08:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: remove unneeded check in create_node()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260330163153.676464-1-jgross@suse.com>
 <0664a324-a0c8-43b5-a92f-81bda9803ede@suse.com>
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
In-Reply-To: <0664a324-a0c8-43b5-a92f-81bda9803ede@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ME1QPUZtS8T7r8MDSWLFFUYY"
X-purgate-ID: tlsNG-c201ff/1774940125-22484488-ECDA984A/0/0
X-purgate-type: clean
X-purgate-size: 8720
X-Spamd-Result: default: False [-1.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1B7C7364A8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ME1QPUZtS8T7r8MDSWLFFUYY
Content-Type: multipart/mixed; boundary="------------AjagN60LomXYc91L7BmKEGuK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Message-ID: <713d4c85-6b39-4c6e-aed3-f5bae0a4d174@suse.com>
Subject: Re: [PATCH] tools/xenstored: remove unneeded check in create_node()
References: <20260330163153.676464-1-jgross@suse.com>
 <0664a324-a0c8-43b5-a92f-81bda9803ede@suse.com>
In-Reply-To: <0664a324-a0c8-43b5-a92f-81bda9803ede@suse.com>
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

--------------AjagN60LomXYc91L7BmKEGuK
Content-Type: multipart/mixed; boundary="------------a00Qf7VviHsI0JqP2gAlcSV1"

--------------a00Qf7VviHsI0JqP2gAlcSV1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDMuMjYgMDg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wMy4yMDI2
IDE4OjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gY3JlYXRlX25vZGUoKSBpcyBjYWxs
ZWQgb25seSBmb3IgaXNzdWVkIHhlbnN0b3JlIGNvbW1hbmRzLiBUaGlzIG1lYW5zDQo+PiB0
aGF0IHRoZSAiY29ubiIgcGFyYW1ldGVyIGlzIG5ldmVyIE5VTEwuDQo+Pg0KPj4gUmVtb3Zl
IGNoZWNraW5nIHdoZXRoZXIgImNvbm4iIGlzIG5vdCBOVUxMLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFNob3VsZCBD
b3Zlcml0eSBJRCAxNjkwODU5IHBlcmhhcHMgYmUgbWVudGlvbmVkLCBhcyBwcmVzdW1hYmx5
IGFkZHJlc3NlZA0KPiBieSB0aGlzPyAoSWYgaXQgaXMgYWRkcmVzc2VkIGJ5IHRoZSBjaGFu
Z2UsIHRoZSBxdWVzdGlvbiBvZiBwb3NzaWJseQ0KPiBiYWNrcG9ydGluZyB3b3VsZCB0aGVu
IGFsc28gYXJpc2UuKQ0KDQpJJ20gbm90IHN1cmUgdGhpcyB3aWxsIHJlYWxseSBhZGRyZXNz
IENvdmVyaXR5IElEIDE2OTA4NTkuIEl0IHdvdWxkIGJlIGp1c3QNCmFuICJlZHVjYXRlZCBn
dWVzcyIuDQoNCkFuZCByZWdhcmRpbmcgYmFja3BvcnRpbmcgLSB0aGlzIGlzbid0IGZpeGlu
ZyBhIGJ1ZywgaXQgaXMganVzdCBhIG1pbm9yDQpvcHRpbWl6YXRpb24uDQoNCkl0IG1pZ2h0
IGV2ZW4gYmUgdGhhdCBpbiBvbGRlciB2ZXJzaW9ucyB0aGUgY2hlY2sgaXMgbmVlZGVkLiBP
bmUgd291bGQgaGF2ZQ0KdG8gdmVyaWZ5IHRoYXQgdGhlcmUgaXNuJ3QgYW55IGNhbGwgcGF0
Y2ggd2l0aCBjb25uID09IE5VTEwuDQoNCg0KSnVlcmdlbg0K
--------------a00Qf7VviHsI0JqP2gAlcSV1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------a00Qf7VviHsI0JqP2gAlcSV1--

--------------AjagN60LomXYc91L7BmKEGuK--

--------------ME1QPUZtS8T7r8MDSWLFFUYY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnLb9wFAwAAAAAACgkQsN6d1ii/Ey8p
Mwf/W/JwtKNZEci8knOvB7vQH/rkZdDB5cX/t7q3IaCOgeraKiUVO5HlM+oT6diArNn7k19dtpAd
F7KkMkNKebj/424NxuhwwAA1Dftufef2WoDLM4C3ovAOz75JMYV3adVQeukSftIkF5oFKwEZgcHC
Uig5DPRzb6NxWgt2ad+eIar1V2bjWS9XynHG346BeDppzlHfRVDDj2GVZhodfViIbmN/mtnnY9Yh
UfZ2Iz28Z5boxzEo8FuF4DGTS164z+BMZM7id7XAKbQzkyKRwftEWWYYzXVEOkX3PLIE19sihdVl
WOgL+OQzk+WGUaMkBVwogR5D7kFDRseP7sQxpwb/Mw==
=B2g0
-----END PGP SIGNATURE-----

--------------ME1QPUZtS8T7r8MDSWLFFUYY--

