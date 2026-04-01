Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LEsBGDezGm0XAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:59:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA337731A
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270041.1558866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rPa-0002NA-K5; Wed, 01 Apr 2026 08:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270041.1558866; Wed, 01 Apr 2026 08:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rPa-0002Ky-Gy; Wed, 01 Apr 2026 08:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1270041;
 Wed, 01 Apr 2026 08:58:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7rPZ-0002Ks-C2
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:58:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7rPY-00AbGc-OC
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:58:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccde3e-5cb7-0a2a0a5109dd-0a2a450592b2-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:58:52 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccde4c-3760-0a2a45050019-d1558029e56b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:58:52 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso59269905e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:58:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887eb5aff3sm141709225e9.15.2026.04.01.01.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 01:58:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775033932; x=1775638732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KqAYsIV/DmBO32oQbhpURcICJKetiNIvgP+vIH+N9uw=;
        b=g4FsSdm/+EWJ3EGEU1IB/JupduM7XC5KrzwaICzXKqKtDlP8ZXc0Uc4y3iS/NqGwZ2
         kMzswUWRwSVwKLPoUp6Gt6UXogXN4ZWim2AAct9koaeah2XAQlIzSy0ajBz+2hWbA5IG
         uzLV5j4POhwmpZl9oNygX4hx28aVqweI2GC1BQru57rz+Q6rO8bREGopi8yMnxOOmF8M
         3ikjFD2++X9fDb/t3ez3RvwYPPOz7LvU1XSLC4cdAl55DHx0IDWJg11+0cECq5ePGoAs
         x/NZv7TLLoDTa5THa/HkKAHeEyfeVPhRXLxyTUu9XML9jsj9jn+/NySo2IrM8kQHzaAk
         TQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033932; x=1775638732;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqAYsIV/DmBO32oQbhpURcICJKetiNIvgP+vIH+N9uw=;
        b=qN5UWlDl2GoyVXDMbrPvcxirfCGtuefsmGJ1jCHlukPwG2aZadlhNOujaNv0TBSX1N
         S074H1tZFkriHP0OhAXc1hw0ebKKwLIecMW4PUs/glMCx92QYhmjqDBT4NfhI7c/9iZx
         pwch1dGqCXmvVUuKRQsdiJP6hBRnqjPzSfD374mgD40TjXzWscvwexmgozdFStnyXjgN
         qfJ9IfVia3Kz+9fF3ciBi7KcksEp/ssA+04jBvKyjz0YulEOsIhuy1dH1gDuT1f7yXJI
         eyE8B53snLDxiQxjqYRP1YqJNI0ObbkjtR9sws0GuKgHzfPe1QEZ/qzArslE0q3CjcIm
         j6hg==
X-Gm-Message-State: AOJu0Ywd2xLfnPriru1Os4N7V2rEHKkbw5N0ARz7/0jM8d+CI7qSvEdS
	2NvlwOQRah8k2wcl1z77J3H3Xshs803PQ/sn8BBv9+2I/jIMqw6wfuGUFHVBesXLna7pEOOMfTL
	fDXxRUQ==
X-Gm-Gg: ATEYQzw2/ZhslH2DpgAWtojm+kHO6+e93adKQGG+ZddBhSs1H8A8ryQJwiDIBOG1Ird
	ZswoI/eDgqxVnxdWzAQCq4oBcv9pQBYIPpBkVQnP87NlGgFSJKw1jr2/vKAkKJZiaOIGhXbHaBo
	5rOtJIPK9sWoZjO4G7jStmcMAunVmRWjimNmJ3XB29JRyqomzq1B40b+AAMGWa8++UXPzUlbtCz
	WKMUbQMT9gZ3+9ajERIBmMZh2Uh1/aObXhoMjJ+ZqdqmdAGQQmxDNA14ZUo+T1hNghMF58snGjz
	uS5rWP+gROIjuhxH+O/r0q5bwDcXt0QdiPV46W6pbZbXZFoR0ni1ckTTEdMSLjKFljR6wbXTtsC
	X29I401TT30N23Ycwtyk4rJYYRMMhDhtEro/75ean9+tTjyEwfnwA+83TSB99Ximw3+ltnL5/KK
	1Nv8DniitLe4Ve96/PEGYQM4m2ToXwdgVc4CP1e+JAs2IlclytxBbhsRbXmWZwungPgtSIXtUsn
	nBDkoc1VYAM2/0=
X-Received: by 2002:a05:600c:a4c:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-4888356844bmr45338675e9.3.1775033931802;
        Wed, 01 Apr 2026 01:58:51 -0700 (PDT)
Message-ID: <69782260-4d92-4979-b624-9c5c6e9a4cba@suse.com>
Date: Wed, 1 Apr 2026 10:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOMMU faults after S3
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
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
In-Reply-To: <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775033932-2312596F-A91EE571/0/0
X-purgate-type: clean
X-purgate-size: 759
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 76FA337731A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 09:14, Jan Beulich wrote:
> Further I suspect the fingered commit may only have uncovered an issue
> elsewhere. I don't think we clear any context table entries during
> suspend or resume. Hence in
> 
> (XEN) [   20.554813] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] fault addr 0
> (XEN) [   20.554819] [VT-D]DMAR: reason 02 - Present bit in context entry is clear
> 
> the latter message is confusing me.

Actually, it makes sense. The address being outside of the interrupt remap
MMIO window (FEExxxxx), it's subject to DMA translation. Yet the HPET has no
entry in the context table; only its IRQs have entries in the intremap table.

So it really all looks to be boiling down to missing HPET_Tn_ROUTE writes.

Jan

