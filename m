Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O/A6G44eTWq+vQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:43:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECB71D71E
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:43:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YWQV9HD7;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356362.1611002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7wQ-0004qO-Gq; Tue, 07 Jul 2026 15:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356362.1611002; Tue, 07 Jul 2026 15:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh7wQ-0004ni-Df; Tue, 07 Jul 2026 15:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1356362;
 Tue, 07 Jul 2026 15:42:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh7wP-0004nc-Js
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:42:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh7wP-006rQK-0G
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:42:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1e5e-5cb7-0a2a0a5109dd-0a2a4508e1f6-28
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:42:32 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d1e68-edec-0a2a45080019-d1558033a59b-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:42:32 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so5052515e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:42:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f5bc78sm76588055e9.14.2026.07.07.08.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:42:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1783438952; x=1784043752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AZmMfW/lMUY5tgbDse9XILPCUWwRiOfXgvnmdPjZkUY=;
        b=YWQV9HD7JE+6nPjgIbfVwnw/ctunFy3IO90B6Jn2Q+oCoCu6rhIr2EqXiTXuuXo14y
         z1NKTPz5T64xaXHWN2Y+G6dX6aWMzW9LcDf8vJeuXulhwKFFfrVZjO2JMaUVZ8PgdVjY
         DoFHdR020syAvuvqtD3IjVGGChRiFXcBXvkOnU0Ii9ekxTQO1/DHCQSi2brAnnYMz5UC
         0PLV3T1Sg1ESZCTPHfBRKnn4B9i/CjgRdqhvT4z2p6Q+7JNx3aj91bSN0T0AqSUIX4Gj
         dM1nXrP1lnlSeirQDChWib/e+aS8wQhfEM8Z5bf8VZehgexdBdt1TmGDbqLEYkSJb334
         nBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438952; x=1784043752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZmMfW/lMUY5tgbDse9XILPCUWwRiOfXgvnmdPjZkUY=;
        b=CZo9sxicJl3uNo/bZR9j6xE0fCc+rYiAGTdBU1H0GgkAy20XuamVIUG9StBxUB2UFn
         P4s9W+7uXEf0piQPtgTJpleBqDZuSLrYBYcrA3v7QH4VqhFjOSHJQcHjypnFoJlBZ7lo
         Cfu3Akp5dpl6RhxV0x0JeLwIgF82Hz7ULFdmbNOsHpW9pX9r+AhB/OG226YKWZcStfJg
         BPx9mkCApEhIV08YK61eZIw0fAG9ULO0xcc76eAcUu7StlklJjf7w4kl7dP8PV/Jj+VN
         HG0n1d3WQbNN5GIvwoZ65oA/LEgDKfljtL5GngGMwuRNhtMr2b4CIF4RI1I/SItgElaK
         YBYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb2JPQhZlQhrv7Um6GjxvmXyvivHBNUSSC6a2dMo69iKFvmZMqT/9L5hH8uKuxvwXHZ3pX+aI0M+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+8QP+40sCiDtCmAmATzFZwd1dXAJ35QRLbRbXWnrwvc2DAC2o
	NAW0A4UpcexONMX6VUcnFk9HfFXhs0l23tWkPXmSMHz7hmjLGvgTQicuDJyOrc7f5w==
X-Gm-Gg: AfdE7cl/Viw+aCGBeTYdYCiJNyMJ0J5eU86P/weJWbgSlgv+zTlhr3cd5EqD6Nb70bE
	nEKp1qDR1OaamJuw2mFQtcHM8WKUs5jzwI3Wc6Ub5obD3IkD6gPt1XouoB5DfvyC6/DFX+5Lr03
	memWzUu5mC66lI0dOYpJs0GlOgOvS87OkAtXTxht77BcSxAXgDcXthZvmJHC2qrSugOF5jKl655
	MIB037hQDETmP6Vd6D0b8v9a3lmfdkT2iW78uIo70ejK+yhswF253jHmEox1R0mpa9t410WXnnC
	6fiR/A5LQ3fK7VQjlP+8BOgmrN7UNyitEoz/xO+sGKmEO1YOnHQKfd8XAu5vLY618D2fXaV61Ve
	4pNGxePOqe/AyfX+pBNFiKo/KRryzelGqpJe1HcBV0vAFla2CXhfvqxvKqjRi84WcHHLF/DUlhH
	011D1CK0yCa++OtlyBKHBk/1AuqbMBsvLEoFqh0hXyvP3qVVxzDGqrRkhGM1YgOyetsPrbNtvsq
	a8q
X-Received: by 2002:a05:600c:8a09:20b0:493:e2c3:af25 with SMTP id 5b1f17b1804b1-493e2c3b011mr22295365e9.12.1783438951158;
        Tue, 07 Jul 2026 08:42:31 -0700 (PDT)
Message-ID: <5cdd813f-bef0-4af6-b96e-e715d505023b@suse.com>
Date: Tue, 7 Jul 2026 17:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/18] vtd: Rename acpi_ioapic_unit.ioapic.info to
 acpi_ioapic_unit.bdf
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753820.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <1782753820.8631fc262581453bbf619ec5b2062170.19f1468806b000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1783438952-A253F3FC-CB0320B1/0/0
X-purgate-type: clean
X-purgate-size: 500
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3ECB71D71E

On 29.06.2026 19:21, Teddy Astie wrote:
> This is actually the bdf, collapse the redundant "ioapic" struct
> and rename "info" to "bdf" to avoid confusion.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the tags flipped to be in chronological order:
Acked-by: Jan Beulich <jbeulich@suse.com>
Looks like this is independent of earlier patches in this series, and
hence could go in right away. Please confirm.

Jan

