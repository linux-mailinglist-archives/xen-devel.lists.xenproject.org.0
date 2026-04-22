Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBZVO0+76GkHPgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:13:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F382445C02
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 14:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290445.1570040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWRi-0001z3-30; Wed, 22 Apr 2026 12:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290445.1570040; Wed, 22 Apr 2026 12:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWRi-0001wp-01; Wed, 22 Apr 2026 12:12:46 +0000
Received: by outflank-mailman (input) for mailman id 1290445;
 Wed, 22 Apr 2026 12:12:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFWRg-0001wj-AQ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:12:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFWRf-000T04-K3
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:12:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8bb35-e002-0a2a0a5209dd-0a2a450ae5da-26
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:12:43 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8ba87-56b3-0a2a450a0019-d155dd2eac0f-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:09:43 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d70b3e159so2711879f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 05:09:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1176sm46753609f8f.3.2026.04.22.05.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 05:09:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1776859783; x=1777464583; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1T+yJ5lV7gcGcLpzVGqXyOjFPnFt4xhCOY5pVEHRXFM=;
        b=FjkjnFxEfvYg0uN46l8TzKOUfwk1ovWADFIfJhxO1JHbSp9ZeDylYWqXLWBsw7fbxN
         04VlfdUXaonQpABC0eLDshVV6AN0Zl19i8a5FvqG+gScd5dih50+o4yHEsBE2gkI0mqK
         qQaTxjEXMy14DZU3LJRqB4HbWweYOA1YGOdCRHIHZj7IPIKJfa+EbHc5hTcyA2YLuhXn
         FJZJghzMNc+K/koRR9uZuqvb91QyRb011zylcusRkK673+515Q3TRrhImzGmDP4ud+6d
         W5XVPJNeWFWznHRx2uLOofcjmZN2ZKEYYcme1gsu8r3M9wKXZdnqamw2LRdpHc2007z/
         Btcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859783; x=1777464583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T+yJ5lV7gcGcLpzVGqXyOjFPnFt4xhCOY5pVEHRXFM=;
        b=Xgdu0SQKf6tydfBfhKekSTvOG07haZzPppwO/0oJgRZd9YYH8BmHal6NaoZ89rfsFV
         P/JIBBNyqwiVmbT1TnacqbxlbmOoFerTFf1c7XRe2KLWPr12eytjNhTF1ZIUskTcEHOR
         uVsDbdXjvlDBXzZFdFYuh7svuq3g7NI/HZGWUTLMIuf1GLtL60Vyxpi3gnhdzixQH7sc
         b2J++gyiK4LIkBj2LuJM72u15j/qetoPXkfLpjnkVeEbIwV/1UXt+T/eans9sbExbSqD
         x7xQ58jHo4KYPe/J9uDZHpXVlZDZksN+q8Fy53AmrPjVAfizbOkwsULa7Ma0UbVP+hL6
         kt2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DiakJFTcoPrrB4YWa+z1N1qDQBf5d1BAEdHWzVPfQPS4bRg5JcO3d/fbRkGDE7/lGlmyTw01TS4o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLFUzDZW+Qo/mSYwVDVOhKHGjp8qNH4xyeqg9CNJlK+I6IVv27
	z0VwuvALyko3FR5diRlOeCtnyjBapPVXIpvNOnbkgPuSl7En8gzkpySUwTWMAkGKdA==
X-Gm-Gg: AeBDietDlUjwsMIDSzyRStJgkj8LQYkO4dHYfcokMq1lKhXofaJjVFkbw/sAtfO+9ll
	dbpKOYGeqegRJOE0PqKgrRYXIb4/90T2ozrl0nJxgDf7g5yhFEnE1H9D+2lErLhD0cI+WtxHZJ2
	9kKn7eXPlO+o+gfDY9zvqg6clZmbkHlhrLH0bBruHRa1s1JaLl4TsnzMVDe4TRXBiVlKDOUWmPQ
	l8V7zfISIb7Y6u2wLeV6HW+W9QCROpoUH0tn7wmw0JXlwKgXUHDdNS94mUfJNsgEWJ1AKRsrAMb
	OdOnwG5oDBI7nqJaFXC1I+hr6gxM4QAOy8cfP80u0GQ4wJaRCTatcEBYLi4s0li9dPVcMJJCIpF
	NIOhkyFkuSlWmVzdmsn5ND/6XqvE419yku8yNtc8BNbatdhxlivKPHXl7rMLlWJfcCOhKHITUjE
	LDAkj74HqBnJyU11ojebRQLuK6KNm/fnZG5iVAiJCLt+fAwrHJjGdMNnPpXoBSC1S2M8gEtFX5L
	o3ntr+Y+IurjObYjsrN9rKAoQ==
X-Received: by 2002:a5d:6751:0:b0:43e:a69b:d805 with SMTP id ffacd0b85a97d-43fe3dfbd18mr22034167f8f.27.1776859782577;
        Wed, 22 Apr 2026 05:09:42 -0700 (PDT)
Message-ID: <f91fae0b-7d3b-4ca6-a5ed-72de50daee9c@suse.com>
Date: Wed, 22 Apr 2026 14:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: adjust cfg file buffer freeing
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
 <77234acb-4539-4efe-9c30-03cb7a389912@citrix.com>
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
In-Reply-To: <77234acb-4539-4efe-9c30-03cb7a389912@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776859783-CE9768B7-8B7D92DB/13/0
X-purgate-type: clean
X-purgate-size: 1419
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,xen.org:url];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F382445C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 13:59, Andrew Cooper wrote:
> On 22/04/2026 12:51 pm, Jan Beulich wrote:
>> The boot services FreePages() needs passing the size. Since we allocated
>> one more byte to put a trailing nul there, we also need to bump the size
>> passed there. Make a small helper function to centralize this.
>>
>> Note that there's no permanent memory leak because of the oversight: The
>> allocation is done using EfiLoaderData, and all memory of that type is
>> later reclaimed anyway.
> 
> This depends on -mapbs at a minimum.

But that's affecting only EfiBootServices{Code,Data}, isn't it?

>> Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
>> Reported-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2026-04/msg01044.html.
> 
> One thing this patch does not do is fix the boundary passed to
> efi_arch_flush_dcache_area().

Deliberately so, and I commented to this effect in reply to Bernhard's
patch. I do think ...

> I find it hard to believe that cache maintenance is actually needed, but
> given it is present in the code currently it needs to stay correct.
> 
> Or, if it's not needed, it should be dropped in a separate patch.

... this is the way to go, but it'll need input from Arm folks (as
requested there).

Jan

