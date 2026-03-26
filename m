Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL5FFOzrxGmj5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:18:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AB331264
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263442.1555368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fv2-0003GR-4e; Thu, 26 Mar 2026 08:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263442.1555368; Thu, 26 Mar 2026 08:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fv2-0003Du-1d; Thu, 26 Mar 2026 08:18:20 +0000
Received: by outflank-mailman (input) for mailman id 1263442;
 Thu, 26 Mar 2026 08:18:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5fv0-0003Do-47
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:18:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5fuz-008a4v-13
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:18:17 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ebc2-2eae-0a2a0a5409dd-0a2a4501b244-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:18:16 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ebc8-6400-0a2a45010019-d155dd33bd9a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:18:16 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-439cd6b0aedso369417f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:18:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf069sm5960415f8f.22.2026.03.26.01.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:18:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774513096; x=1775117896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j9vZF5Dz0TFARND9TH4AsgYVM6zKyc2F9Uh6URbA8pE=;
        b=I/l9aVMopvQujdkYUIE51iQYsD7fRS0uocYBtGF3h7t3rHUuwCizfoPoVhfD2MYNcC
         uRHN2vyrFXRILYexSWnULmkM+cFDCoXeatrpBx6OKqalcJgclssp8QEJDQuxU97oz0M7
         nMpY+7DxDne1mpJASJE+5gzLugWnrWBnqAJr9wteUu5g6YGlbKH8OAqCHpwlYv/pfp0G
         3EO3CLIleJzInRHNInOP8SzobSJEMY2zaaOFvRC9XhpREUbFexxHs5EC5D4L/DuZ67aY
         yCn/qX8Lb2iQsJ4sp6x28OmM8YQR9re5P3HwwuavwvVMegemt/dWYVbvlGkEJiBCi7DP
         5MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513096; x=1775117896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9vZF5Dz0TFARND9TH4AsgYVM6zKyc2F9Uh6URbA8pE=;
        b=Y12Vt48nhhSijIWZ8r5OC/VduYPytnhh2RtETkrsPMZLvMvon7tMxUYkcGJ0EFIoPU
         b381sTJQeW7DqdBajT58ln8HQonGY0CeMt5z3cEzwSPp26AgJXaqvUqD24QoYZhwNIkj
         5TT/WF3ZwNfONo4XwCHH9vwoeiMZb8YWTYFmOhJNfbN8e0DVIFRI0ZtMaEZxCJP5qRra
         wcUKY3El8XpynPkX1ivsPr1qsZWXnMj9ZECG8Px+hlWGus8WAPgSaxxwBnHKGX5RgdkA
         Dmsnri/RSilTsNotCNS6fai+7wuyuavZnkaZ2vQIK7ugSgLgllZj6Mb3GwyK3P0/oflk
         sRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpMkFT72Mp0YcLtVIhF8JNYkaXNZ2Yh4VskuaI0RSes4BilUeubVIBq9LSXRmQ4KSn2IHVD1Odo4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm4dJqce1XMqm7EVRQoFiLKEuYiBhVkzqz3bmuvXkMF8IHBP8b
	1vco2rVNWs4KYz50iDJR23nbGtj+yG6kA7/sxsCvG3vyq2VpUJQPCXtVswftrbFnbw==
X-Gm-Gg: ATEYQzzdZMI/uaqFTy1b6m9NNaQkWa2pYj3qHjc7RuDGGZrq5JyAd35bm+B9S/MWWd4
	8PGboyhvDljJ/A1pV5Rxg0c8fU1MkGPnMj4GXsGiZgTPVjCjU9F9WHLeC5WvrfS+NW+jil5f2P9
	amBldW0HStFkfXSp4CU22cO7gEmMvfMYKhBWMMHg/eJb5MO8xsdH8qYgBHTf7QKlWjsq2fI/oKF
	7rg5yqvp8+lI1GVAG7OTnlCeBjmi0/+Nvlh60hhNl09zSduXvDFhaomFEansDQwkTlnIu10l5KJ
	7x6FDNX19Q5tBjNpXB13vJpqH1K507mX3xanIq1k+kNHNYg9nBVeVc96RrV/PcaV1uCyL+TIbfO
	BS0iK1LnAto870QXMVstcyB6J0wUAZcSFsAy5JsNdslY1RJGi+0L2I7xAiIafCDioNYflYV3Tgi
	XMEGcXFn0zI7SXozPRzhLbQTvAQ0UUk2fRwveipua59r1r2TIk46M79ST6BpkEQFSKgSIgY4kC8
	bvLWwbmXZbxCXw=
X-Received: by 2002:a05:6000:60f:b0:43b:5765:96a9 with SMTP id ffacd0b85a97d-43b889af1d0mr9698430f8f.24.1774513096247;
        Thu, 26 Mar 2026 01:18:16 -0700 (PDT)
Message-ID: <9bd94a4b-6724-4978-b00f-c3fd0664814d@suse.com>
Date: Thu, 26 Mar 2026 09:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
 <acQMmXyOGFe5AN2i@macbook.local> <acQTUE3Lm7-KIcRj@macbook.local>
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
In-Reply-To: <acQTUE3Lm7-KIcRj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774513096-8F0E1DF3-41F78754/0/0
X-purgate-type: clean
X-purgate-size: 1778
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A24AB331264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 17:54, Roger Pau Monné wrote:
> On Wed, Mar 25, 2026 at 05:26:01PM +0100, Roger Pau Monné wrote:
>> On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
>>> On 25.03.2026 11:08, Roger Pau Monne wrote:
>>>>  * Disallow XENMEM_decrease_reservation until the domain has finished
>>>>    creation would fix the issue of pages being freed while pending scrub,
>>>>    but it's not clear there might be other usages that would be problematic,
>>>>    as get_page() on non-scrubbed pages would still return success.
>>>
>>> I agree this is of concern.
>>>
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
>>>>                              goto out;
>>>>                          }
>>>>                      }
>>>> +
>>>> +                    if ( assign_page(page, a->extent_order, d, memflags) )
>>>> +                    {
>>>> +                        free_domheap_pages(page, a->extent_order);
>>>
>>> The pages don't have an owner set yet, so that function will go straight
>>> to free_heap_pages(), needlessly passing "true" as last argument. Correct,
>>> but (for large pages, which the stashing is about) highly inefficient.
>>
>> My bad, I was sure I was using the same freeing function as
>> alloc_domheap_pages() on failure to assign, but I clearly wasn't.  I
>> will switch to using free_heap_pages().
> 
> Coming back to this, I can export free_heap_pages(), but then the call
> would also unconditionally have need_scrub == true, as the pages have
> been allocated without scrubbing.

But the assign_page() call is here to have the scrubbing done ahead of
it, so re-scrubbing after freeing shouldn't be necessary?

Jan

