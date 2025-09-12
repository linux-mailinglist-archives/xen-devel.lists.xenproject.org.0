Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92165B54297
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 08:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121413.1465724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwx3x-0005J2-BW; Fri, 12 Sep 2025 06:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121413.1465724; Fri, 12 Sep 2025 06:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwx3x-0005Fs-8B; Fri, 12 Sep 2025 06:15:13 +0000
Received: by outflank-mailman (input) for mailman id 1121413;
 Fri, 12 Sep 2025 06:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwx3v-0005Fg-Tb
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 06:15:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3bb4c14-8f9f-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 08:15:06 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso2814489a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 23:15:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ee40dcaddsm593605a12.6.2025.09.11.23.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 23:15:05 -0700 (PDT)
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
X-Inumbo-ID: d3bb4c14-8f9f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757657706; x=1758262506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DAnJwl5NhEXX/VJqCboUAA4HpYs7h0yS0lxkLE0K0k0=;
        b=HcV/3W//e62+zijb9qtoAwmECXEic9DoRVPN9njoo9IrKx36vf48ZN6p0+A5dlS540
         znv3ZZ5UF0Xkv/rSbY0SdeBTWk4tvOiaFvtXo4krMBiZP4GTDgLSYZ9WYsVUMJJMCjVc
         58cOnFNvcOrpFJhkTDXZgDPnNOUd64nsQciSCT9FTcjexeS4sE6y/9824Yh3B/0P/Nyd
         7d/e/5gPZKTdISGLbHNoWf2YHxRDSl4DpfiWRrGFFsySAoWj4hXIZ6L4tMowc+sH/tPN
         FoNXn2IjHsTJQxC6E0HsQ6JsbL85A6D7XwtUYm7PbW97LWh28XiKNuie80dKmaN6jDNI
         kshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657706; x=1758262506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAnJwl5NhEXX/VJqCboUAA4HpYs7h0yS0lxkLE0K0k0=;
        b=czCssqyWs8MCM8JSU54Z/z3MnA5rgU09mKFkTk2vUWp/yAfl0RUUkHE3oJ27dNbxof
         2tSJguNoAR02hdn0siyBnR+t2409ttJZiSHE+CI7lBO4kw1+XYR0J8pHK/dYkuAyXZ+k
         8sweR7L8gpBxHoIt5/iQUQgU6L5yWjBWNk7qHbJoFnSsx/qbNAJFeswz+NgFHUsOrZWT
         Cms/EIPYohUHPYvm9vLoxCcnfWPMrz3xvLAJQ5k+bkFoEhN3tazDFFsaqMeCZotK6Xr0
         sFkuhZrW8kDejCAu4eTQ3BjrZB+dKu3jGwADRhcAawHpHVNknB66cWbH4y/nZDkqrt2R
         NxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMrJbpaJgN4TRMY4C0JpvfGTwrlyuRW1W9/Ym5CIBd9WIwYqWIZE9rn5XWul1M+J0dSEvzatrBPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzooiKBSxgeVG0x9DNSaZO5GPNNLhoKG4AOZiTnLK2yOVA65Zg4
	o9zNccVRssjKgg2Dli/edOPz2nMlZtn9y7EtdM8ZkDfCrVSH+G3cLVY+500sCkQAbg==
X-Gm-Gg: ASbGncvvoduMEkRfcitKrb08zT/ia2OmMRQTgP+PYEkHLwyTqcwBJDsAAQHaLZVDogQ
	75W4E8ciYC+LB+5ViMs+zcHrxHB64Prn523giM0HdQUz8WAanatwZBMyrBN6foSsowAwbPUGYHc
	lYKdUCTJAy8hazv+aLA4hW/gGI+K99wiaw9nwsQZ6dRq+dEGVOeIrwHRHjOtkyoM58Gg0Y435OC
	5EDjhSNI9WZ0JhbwedeApyIjcHm8aZfG42iT5nJbNyMz/QdHGfoDEwFUkJvxYZ6SQIDIelgpFWJ
	qKu2hBzh/j/EmgH3jUBI/c6uEu7fNCae0aekgbQ76MAjjIIj+/lZtVklVl+9JkOKeVa9mqgmZI/
	U+1+g0nUu3t2HTWqAnhmqzrV/5o4iEFA9FBWaJcmVQ4Wj0i7qtHS1QDdn9v1CIijLGs+bPY/++q
	IsUZvoQxBTE/ZVz+KC2g==
X-Google-Smtp-Source: AGHT+IH3OsodKDruToDkB+VWGVa8UaMjifPGuxzGncTvd82uuwSt70k+GMaRrFIB1RTQ3jlTdNq1Uw==
X-Received: by 2002:a05:6402:35c7:b0:628:b619:49ca with SMTP id 4fb4d7f45d1cf-62ed82fe63amr2079736a12.25.1757657705713;
        Thu, 11 Sep 2025 23:15:05 -0700 (PDT)
Message-ID: <3d0d9653-e96f-4ed7-a6c2-2a082f03b712@suse.com>
Date: Fri, 12 Sep 2025 08:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: domU reboot claim failed
To: Jason Andryuk <jason.andryuk@amd.com>
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
 <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
 <44207905-ece0-48f1-a7d7-8c30720cb48d@amd.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <44207905-ece0-48f1-a7d7-8c30720cb48d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2025 23:20, Jason Andryuk wrote:
> Thanks, everyone.
> 
> On 2025-09-10 17:57, Andrew Cooper wrote:
>> On 10/09/2025 7:58 pm, Jason Andryuk wrote:
>>> Hi,
>>>
>>> We're running Android as a guest and it's running the Compatibility
>>> Test Suite.  During the CTS, the Android domU is rebooted multiple times.
>>>
>>> In the middle of the CTS, we've seen reboot fail.  xl -vvv shows:
>>> domainbuilder: detail: Could not allocate memory for HVM guest as we
>>> cannot claim memory!
>>> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
>>> allocate low memory for domain: Out of memory
>>> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
>>> failed: Cannot allocate memory
>>> domainbuilder: detail: xc_dom_release: called
>>>
>>> So the claim failed.  The system has enough memory since we're just
>>> rebooting the same VM.  As a work around, I added sleep(1) + retry,
>>> which works.
>>>
>>> The curious part is the memory allocation.  For d2 to d5, we have:
>>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>> xc: detail:   4KB PAGES: 0x0000000000000000
>>> xc: detail:   2MB PAGES: 0x00000000000006f8
>>> xc: detail:   1GB PAGES: 0x0000000000000003
>>>
>>> But when we have to retry the claim for d6, there are no 1GB pages used:
>>> domainbuilder: detail: range: start=0x0 end=0xf0000000
>>> domainbuilder: detail: range: start=0x100000000 end=0x1af000000
>>> domainbuilder: detail: HVM claim failed! attempt 0
>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>> xc: detail:   4KB PAGES: 0x0000000000002800
>>> xc: detail:   2MB PAGES: 0x0000000000000ce4
>>> xc: detail:   1GB PAGES: 0x0000000000000000
>>>
>>> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>>>
>>> Does the change in memory allocation stick out to anyone?
>>>
>>> Unfortunately, I don't have insight into what the failing test is doing.
>>>
>>> Xen doesn't seem set up to track the claim across reboot.  Retrying
>>> the claim works in our scenario since we have a controlled configuration.
>>
>> This looks to me like a known phenomenon.  Ages back, a change was made
>> in how Xen scrubs memory, from being synchronous in domain_kill(), to
>> being asynchronous in the idle loop.
>>
>> The consequence being that, on an idle system, you can shutdown and
>> reboot the domain faster, but on a busy system you end up trying to
>> allocate the new domain while memory from the old domain is still dirty.
>>
>> It is a classic example of a false optimisation, which looks great on an
>> idle system only because the idle CPUs are swallowing the work.
>>
>> This impacts the ability to find a 1G aligned block of free memory to
>> allocate a superpage with, and by the sounds of it, claims (which
>> predate this behaviour change) aren't aware of the "to be scrubbed"
>> queue and fail instead.
> 
> Claims check total_avail_pages and outstanding_claims.  It looks like 
> free_heap_pages() sets PGC_need_scrub and then increments 
> total_avail_pages.  But then it's not getting through the accounting far 
> enough to stake a claim?
> 
> Also free_heap_page() looks like it's trying to merge chunks - I thought 
> that would handle larger allocations.  Are they not truly usable until 
> they've been scrubbed, which leads to the lack of 1GB pages?
> 
> Clearly I need to learn more here.

I rather expect this then may not be scrubbing related, but domain cleanup
hasn't progressed quickly enough for the earlier instance.

Jan

