Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCBIJq7IDWr93AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:43:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82258FE6E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314035.1584047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPi8w-0002t4-BQ; Wed, 20 May 2026 14:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314035.1584047; Wed, 20 May 2026 14:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPi8w-0002qE-8Y; Wed, 20 May 2026 14:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1314035;
 Wed, 20 May 2026 14:43:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPi8v-0002q8-6f
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:43:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPi8u-0081b5-If
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:43:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc888-5cb7-0a2a0a5109dd-0a2a45018db4-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:43:28 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc890-c1f2-0a2a45010019-d155802dcc11-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:43:28 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so55127045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:43:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fed253f93sm130787775e9.16.2026.05.20.07.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:43:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779288208; x=1779893008; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1nbudUEqnTAxYGN5Oi8IfyVVCmUa+WSp+/nGr6qgW0w=;
        b=KoAQrQ6VA9DQ5JISjkHQys8Nr3ZR82yZCbSkcwUFCiF+gspZAcF9hwsfsonKk4ou1p
         7dzQ2kPyaX/DAXbfOv9bBT1CtbUjIb3x1PyESH5f9KZThIAEsZIdInrEi/6v2n6+QgMD
         1e8MznzMNiNITVT+J0vyXEjuS3e8Wk8YYp0Kl3gGkeyLcoKvB7u1wVi69TdOdPndiCnF
         ARPEwZj/lNZW5ebyUhKFfWZthzy8pg+yFkn0LnJEJY9zpD6BQ63qz/6S3lDbWskRvDIk
         fxBUgtM0SjUMb5f4eQ4xXpBO9cb3FScmmsiqDbo1YmTkwMcFxeTteHVYMCyfFcsZEYVz
         J31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288208; x=1779893008;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1nbudUEqnTAxYGN5Oi8IfyVVCmUa+WSp+/nGr6qgW0w=;
        b=D6e/LuSSCTWTsr2G55lklAAl7BmOcPQ32yx1FjsvUVGJyupKkGhPZHjCF7s+vwHCaM
         IRqMmqxysqykhk+yDencOo/D/R//fZ1jATxmk7Af/0bIMXzadE8JZND3oCzumMLiAIst
         KP6dB/lzXiosBDohT8Y32pMsEjtpDPlMACnQvQtGFreYf+/jpOdPh2NKuc1pWpwpmebG
         09PXs3Dq6ArJdtvX68biFhDl/H0RAHAqahbxoes3W2FyHn9FlH6mH+olV03VgGXFAwc7
         mfa8LdZs1aWnyzfOs06KGjPg/XH81nJ+lQuEmwQo4f/O31HSFY3pByEYuQ8ddP6asDLg
         P3Pg==
X-Gm-Message-State: AOJu0YyiyMZZb4dwT/wUUMHtu8f2BTlEm0e1nOiHPnhu+OGvkuWM6mTF
	Q7dwO93zLCgca2xAH5SDWmQvjHt3n4NPx7K447IKo0gK5KTA9+e5BIUWr7x2Dy/XNzjA37KN4gv
	1SYw=
X-Gm-Gg: Acq92OEWHfMcXH0bBDfRmnBM4p0BVq833mYtRQpQ8/MndqTNMBRS9RNvTo+L8Vh0kR7
	Ao/lIG40kRXEBfRWyghiRQbnrZfKeiRzTxFPmsBP6IsJC+k3G7FHNRCsO4NxKrKwTo6v2DeXrlN
	hDmKmHUtMxUwwbayYIkqZTI8gWjqUGglnw+otlbdgMK0OrraCnwN+MEdq5z4GUprg2fpSnM2zt/
	C7tAkvXphoQcij43B2Mah6XM4tglXNnvXbuUjun2+Q6xTWl1aGfVK/so8RpGUMwh3kLqQNTjw+S
	cvhS4LQ8DaeyHpyPJTa4wvV4rRD+341oM0YKUiV+Hm3BTuLpXjysrTsJP3lMr3FrEna5mWT+8cK
	EymbM6dhN31G2ll3kORzUdn2BOBvakUXRhKH4wKQwWXoONfSb1nnBb+/ASqW81F4AyQFKA+ISXc
	Kem6iR0pBKVpR29XHAsM5WRAdJQjUpe798gnw6p96CQiYTN+EDAlVZwVkiYjlv0YfnDGl8n4ohJ
	ouBTeXDsvz90H4=
X-Received: by 2002:a05:600c:4f13:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48fe6328bb7mr414252495e9.21.1779288207813;
        Wed, 20 May 2026 07:43:27 -0700 (PDT)
Message-ID: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
Date: Wed, 20 May 2026 16:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC v3 0/3] x86/time: avoid early uses of NOW() to return zero
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779288208-AE55DFF4-D7EBF1CA/0/0
X-purgate-type: clean
X-purgate-size: 245
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4C82258FE6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Two new prereq patches were added in response to review feedback.

1: time: add "NOW() good" indicator
2: x86/Intel: split model-specific freq calculation off of intel_log_freq()
3: x86/time: avoid early uses of NOW() to return zero

Jan

