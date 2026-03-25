Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMYhDGH6w2klvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:08:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14B3278B6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262572.1555027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PpR-00073G-EI; Wed, 25 Mar 2026 15:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262572.1555027; Wed, 25 Mar 2026 15:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PpR-00070E-BR; Wed, 25 Mar 2026 15:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1262572;
 Wed, 25 Mar 2026 15:07:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w5PpP-000707-TA
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:07:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5PpP-00Eqx6-8v
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:07:27 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c3fa2d-5cb7-0a2a0a5109dd-0a2a4508c25e-14
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:07:27 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c3f722-1950-0a2a45080019-d155d02bb58a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:54:26 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6694c9c02c5so6255441a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:54:26 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668cfdb4659sm6234664a12.13.2026.03.25.07.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 07:54:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774450466; x=1775055266; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HYAHAWzJvOJE6VRHhQ6GA5prEi6dP5vy8cKS5t0jXc0=;
        b=GtG6tuj95gFBEOrz+/USNyqVmF0ZTI3LBZ6RuAnLIiSWKoThPAxr7BjqNOw3COTk1a
         3vXi0SoNJywtvkMGgm0vI8Ga92XH848w61g18FqOk7NX5Duc7lPMW9vXI6p4iLj6vWQS
         djFe9YyvpKXc0yP30KKEOhLuTHnSmCEXGuwrMz+3ItoVmjnAzHi6kKTwq3J9JhdXkmzA
         uYLwRvhM2Q6cA+QAQO8kfoOQzjDt4G41zXPBI2p60kyx8Oox+Q0HEHt8rCbwrYkoeJdU
         2uI2AdnEfzur5zb8+zuxIQq1fOnPHO3igVMVYCIEj1Vg8FWyU1E8/753ImntLHZpQbOv
         ILBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774450466; x=1775055266;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYAHAWzJvOJE6VRHhQ6GA5prEi6dP5vy8cKS5t0jXc0=;
        b=UKWVuGnkTVxOnx2BXvFKbOco4F5REBDY3j5oqqcDuxPT0KV+5mG/Ct+CCFAbTADkfz
         Nxxt8EWIzfD8et5DJ+a0pcS5kv4ni/7p7n/OnFq8nD9GVojX/oWd3jqRAJxGwnnkcwdy
         9r+mL1sddfZCWkfMrrD5Qt6l8ACk5kpXvPVuE2ht6RrLV1wCYymzC1AdGyb9Ez3zmzZO
         wn9y8lso1yexyKqVpftCLP9OoeLfG0X/8HADpMIQAXI997hgHeN5v3AdZCfgNVSHGO2j
         kSLQmhVpBOWEAnn90pAC9LjylprqPv86Q4b/uDM4Gt6N7VnJ98qyDRwbLKgcmli++Yr3
         HJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVAAWVtSqd5T23Hl/jkwnArX1kiZTNpYxxNHp/L/7Ye+cVPddW8o1Du4gGgNfKR5ffylkG5iX3GSXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze8zyJu1UAtZPeOi9WfO0SjaHC+zgB9RwYp5avUD1pZ+xOaCbo
	Kc+J9cHK5d91jYacx1XsG84OozssPIfDKx2uM2/4LQluuE9807rBEiUjXn5Dl6WXQt8=
X-Gm-Gg: ATEYQzwXkGJSX/3mk4MSpEv4vwgjyXIdxMC7wRnJyRRfbiEAaqdmEX9br4t+kqSsii9
	+6HRf3H8PMAkcUZFTuTto2gMaR/U79dLtTigqguBnZlkr8zbRcDXE28N2E9UsCNlOr7dn+KsR8f
	KR4qCrYVeWFwTH5gSKXAUWWpG8UVVTe8pgyDCaNuVVwCIjrh/dEfoLQCtpzw2XtzIekcKNrGo/m
	6Gh4IiUIJptCMJoV0zx/7OrB8tEvoSVb3m/XGxZxp4Ok9a0WGuWL9TXF5E39mgO+IA+aIJ4F/LT
	LS/QEnuodczf5TthMZJAYibb7jdYyzR6fAdBKInFd57LHSupefLQRuPhrtCLTXABvCQB25uUxfx
	A+FQZJAfjTJfQMFUttChqlgjsIgAHCsqtcHO1QFwD3cWngH9OkFypQGycRjgAdvAzAVuzWSJU2o
	zPupAPP9UqVlqboa+8nldmWxEofoKdXQWIXJUm6aVMkpH42/YtVa3s4NyepqusC2V0A9NUAkETB
	g7aX7X1Yc4+gVKMAcOSc1qbSNTA0dGfrcwfLwRPwFa/l9zQRPh1cw==
X-Received: by 2002:a05:6402:5213:b0:668:488a:d3da with SMTP id 4fb4d7f45d1cf-66a826cd5fbmr2295364a12.25.1774450465604;
        Wed, 25 Mar 2026 07:54:25 -0700 (PDT)
Message-ID: <bf76d5d5-5b3f-45fc-93e4-6bff07e60288@suse.com>
Date: Wed, 25 Mar 2026 15:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
 <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
 <d7af5c2d-f700-4a16-bc55-750cd7f5ba1b@suse.com>
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
In-Reply-To: <d7af5c2d-f700-4a16-bc55-750cd7f5ba1b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Mw0D29h3sG4Q0oIlI3MJbP1o"
X-purgate-ID: tlsNG-c1860d/1774450466-F24E6726-5A4B9F2A/0/0
X-purgate-type: clean
X-purgate-size: 11191
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C14B3278B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Mw0D29h3sG4Q0oIlI3MJbP1o
Content-Type: multipart/mixed; boundary="------------nAngyBcelk0Y2H3NUlOYgmZh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <bf76d5d5-5b3f-45fc-93e4-6bff07e60288@suse.com>
Subject: Re: [PATCH v2 2/3] arinc653: don't assume Dom0 is the control domain
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <3a491956-81a6-4c7e-acb0-14f135fc5596@suse.com>
 <e0031df1-12a6-4459-a670-fbcbca13368a@suse.com>
 <d7af5c2d-f700-4a16-bc55-750cd7f5ba1b@suse.com>
In-Reply-To: <d7af5c2d-f700-4a16-bc55-750cd7f5ba1b@suse.com>
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

--------------nAngyBcelk0Y2H3NUlOYgmZh
Content-Type: multipart/mixed; boundary="------------ZdTaCr2GwlvQF0UofizSQ6jk"

--------------ZdTaCr2GwlvQF0UofizSQ6jk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjYgMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wMy4yMDI2
IDE0OjM4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjUuMDMuMjYgMTM6NTQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IExlYXZpbmcgYXNpZGUgaGlnaGx5IGRpc2FnZ3JlZ2F0
ZWQgZW52aXJvbm1lbnRzLCB0aGUgY29udHJvbCBkb21haW4gaXMNCj4+PiB3aGF0IHdpbGwg
aW52b2tlIFhFTl9TWVNDVExfU0NIRURPUF9wdXRpbmZvLiBJdHMgdkNQVS1zIHRoZXJlZm9y
ZSBuZWVkIHRvDQo+Pj4gYmUgYWJsZSB0byBydW4gdW5jb25kaXRpb25hbGx5LCBub3QgdGhv
c2Ugb2YgdGhlIGRvbWFpbiB3aXRoIElEIDAgKHdoaWNoDQo+Pj4gbWF5IG5vdCBleGlzdCBh
dCBhbGwpLg0KPj4+DQo+Pj4gRml4ZXM6IDlmMGM2NThiYWVkYyAoImFyaW5jOiBhZGQgY3B1
LXBvb2wgc3VwcG9ydCB0byBzY2hlZHVsZXIiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gVGhhbmtzLg0KPiANCj4+PiAtLS0N
Cj4+PiBUaGVyZSBiZWluZyBubyAiZWxzZSIgdG8gdGhlIGlmKCksIHdoYXQgYWJvdXQgb3Ro
ZXIgY29udHJvbCBkb21haW4gdkNQVS1zPw0KPj4NCj4+IGE2NTNzY2hlZF9hbGxvY191ZGF0
YSgpIGlzIGNhbGxlZCBmb3IgYWxsIHVuaXRzIG9mIGEgZG9tYWluLg0KPiANCj4gWWVzLCBh
bmQgd2hhdCBpZiBmb3IgdGhlIGxhc3QgZmV3IG5vIHZhY2FudCBzbG90IGlzIGF2YWlsYWJs
ZT8gV2l0aCBvbmUgdkNQVQ0KPiBwZXIgdW5pdCBhbmQgRG9tMCBoYXZpbmcgNjUgdkNQVS1z
LCB0aGlzIHdvdWxkIGFscmVhZHkgYmUgYSBwcm9ibGVtIGFpdWkuDQo+IEFuZCBBUklOQzY1
M19NQVhfRE9NQUlOU19QRVJfU0NIRURVTEUgY2FuJ3QgZXZlbiBiZSBjaGFuZ2VkIGVhc2ls
eSwgYXMgaXQncw0KPiBiYWtlZCBpbnRvIHRoZSBzeXNjdGwgcHVibGljIGhlYWRlciAod2hl
biBzdWNoIGFuIHVwcGVyIGJvdW5kIHNob3VsZCByZWFsbHkNCj4gYmUgYW4gaW1wbGVtZW50
YXRpb24gZGV0YWlsLCBtYXliZSBhIEtjb25maWcgc2V0dGluZykuIFlldCB0aGVuIGV2ZW4g
dGhlDQo+ICJET01BSU5TIiBpbiB0aGUgbmFtZSBpcyBjb25mdXNpbmcsIHdoZW4gaXQgbGlt
aXRzIHRoZSBudW1iZXIgb2YgdW5pdHMgd2hpY2gNCj4gY2FuIGJlIGRlYWx0IHdpdGguDQoN
CkFGQUlVSSB0aGUgYXJpbmM2NTMgc2NoZWR1bGVyIGlzIG1lYW50IHRvIHNlcnZlIGEgc2lu
Z2xlIHBoeXNpY2FsIGNwdSBvbmx5Lg0KV2l0aCBjb3JlIHNjaGVkdWxpbmcgdGhpcyBjYW4g
YmUgZXh0ZW5kZWQgdG8gYSBjb3JlIG9yIGEgc29ja2V0LCBidXQgdGhpcw0Kd29uJ3QgaW5j
cmVhc2UgdGhlIG51bWJlciBvZiB1bml0cywgb2YgY291cnNlLg0KDQpJIGFncmVlIHRoYXQg
dGhlcmUgc2hvdWxkIGJlIHNhZmV0eSBjaGVja3MgYWRkZWQgdG8gZW5zdXJlIHRoaXMgYXNz
dW1wdGlvbg0KaXNuJ3QgdmlvbGF0ZWQsIGJ1dCBPVE9IIHRoZSBhcmluYzY1MyBzY2hlZHVs
ZXIgaXMgZm9yIHZlcnkgc3BlY2lhbCBzZXR1cHMNCm9ubHkuDQoNCj4gDQo+IEltbyBhdCB0
aGUgdmVyeSwgdmVyeSBsZWFzdCBub3QgYmVpbmcgYWJsZSB0byBkZWFsIHdpdGggYWxsIERv
bTAgLyBjdGxkb20NCj4gdkNQVS1zIHNob3VsZCBiZSBsb2dnZWQuDQoNCkkgYWdyZWUuDQoN
Cj4gDQo+Pj4gQW5kIHdoeSBhcmUgdGhleSBhZGRlZCB0byBhbGwgc2NoZWR1bGVyIGluc3Rh
bmNlcz8NCj4+DQo+PiBXaGF0IGRvIHlvdSBtZWFuIHdpdGggImFkZGVkIHRvIGFsbCBzY2hl
ZHVsZXIgaW5zdGFuY2VzIj8NCj4+DQo+PiBhNjUzc2NoZWRfYWxsb2NfdWRhdGEoKSB3aWxs
IGJlIGNhbGxlZCBvbmx5IGZvciB0aGUgdW5pdHMgb2YgYSBkb21haW4gYmVpbmcNCj4+IGlu
IHRoZSBpbnN0YW5jZSAoaS5lLiBjcHVwb29sKSBkZXNpZ25hdGVkIGJ5IHRoZSBvcHMgcGFy
YW1ldGVyLg0KPiANCj4gUGVyaGFwcyB0aGUgcXVlc3Rpb24gaXMgYSByZXN1bHQgb2YgbWUg
YmVpbmcgY29uZnVzZWQuIE15IHVuZGVyc3RhbmRpbmcgd2FzDQo+IHRoYXQgYTY1M3NjaGVk
X2FsbG9jX3VkYXRhKCkgaXMgc3VwcG9zZWQgdG8gYmUgc2V0dGluZyB1cCBwZXItdW5pdCBk
YXRhLA0KPiBub3QgcGVyLXNjaGVkdWxlciBpbnN0YW5jZSBzdHVmZi4gWWV0IHRoZSBsYXR0
ZXIgaXMgd2hhdCBsb29rcyB0byBiZQ0KPiBoYXBwZW5pbmcgaW4gdGhlIERvbTAgKG5vdyBj
b250cm9sLWRvbWFpbikgc3BlY2lmaWMgYmxvY2sgb2YgY29kZS4NCg0KSSBkb24ndCB0aGlu
ayBzby4NCg0KRG9tMCBpcyBzcGVjaWFsLCBhcyBpdCBuZWVkcyB0byBiZSBmdW5jdGlvbmFs
IHdpdGhvdXQgc29tZW9uZSBoYXZpbmcNCnVwbG9hZGVkIHRoZSBzY2hlZHVsaW5nIHRhYmxl
LiBJbiBjYXNlIGRvbTAgaXNuJ3QgaW4gdGhlIGNwdXBvb2wgb2YgdGhlDQphcmluYzY1MyBz
Y2hlZHVsZXIsIHRoZXJlIHdvbid0IGJlIGFueSBkb20wLXNwZWNpZmljIGVudHJpZXMuDQoN
Cg0KSnVlcmdlbg0K
--------------ZdTaCr2GwlvQF0UofizSQ6jk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZdTaCr2GwlvQF0UofizSQ6jk--

--------------nAngyBcelk0Y2H3NUlOYgmZh--

--------------Mw0D29h3sG4Q0oIlI3MJbP1o
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnD9yEFAwAAAAAACgkQsN6d1ii/Ey+M
VwgAkmM94PS7Df/V7v2rU3kyYBZjCBzxKpsvmK+Y6Ap+wppByDZquoHIWIsktFFlbhsNf/s4qcIe
iRvMu0ZYGt+ZEo8j0Ob+9cd6xmHgbUBvs/TXQlq7OwPMlKrE9HqC9tCSPDYPtCygPlmkADqk8s+M
7m665zOBACDVi2A6un78x7TEU2Qsxr78bRBHJSc4JNYCI3ifFQXIJHrbGqroAiaHPULCvrvaBvRG
xN9ZlBsMXgsKX9b/J8tmm016BpwHNnsBJmHKl7vMKfM3sjsCJqV/mbQAA9NZvtsbVbogbRNd0Yi/
WO+otAqQo+NxLhmOBWevnrCPjxIvGqR8SkJXI4Yglw==
=hzXZ
-----END PGP SIGNATURE-----

--------------Mw0D29h3sG4Q0oIlI3MJbP1o--

