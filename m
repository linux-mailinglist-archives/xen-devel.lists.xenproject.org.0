Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D787A870
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692437.1079562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOgp-00022R-Co; Wed, 13 Mar 2024 13:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692437.1079562; Wed, 13 Mar 2024 13:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkOgp-00020w-9Q; Wed, 13 Mar 2024 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 692437;
 Wed, 13 Mar 2024 13:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkOgn-00020q-AB
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:30:37 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5cd675-e13d-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 14:30:35 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5687e7662a5so1666743a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 06:30:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k13-20020a1709065fcd00b00a44f0d99d58sm4830378ejv.208.2024.03.13.06.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:30:34 -0700 (PDT)
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
X-Inumbo-ID: df5cd675-e13d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710336635; x=1710941435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBel3iki8J8meyGhrbnmktI8MvSLySCO1UlPcxjldeY=;
        b=D/kjJonaCJ+pKVlU0Z5T6n/aQI/44VsCAcv7ui37xllwWUYtoxMRbY8CQOA2Wixsv5
         yzRTz/gpy+QdDw5TScs58/zw8oaFgINc9hbwLW4GyRInBPUSI4yGdeaqF7pkx+SkJlO0
         cd+yxbsFZgtZgTBMt+f51BnypaaemNqpcPs9ztJHF/bDcNfnsPaTbV8lKBm3QJJCckqw
         P79UasWivXEc77q2l8NS2tdW5Gztycdh0CWNL1kDoS2vuc/6nR6L30eWbukKMAvykrDs
         VbZee5bdbgp05Y483GhVCBidXzP7iAODfxB9EY6cmKd2z1scJ5ZWqkaZiN0D3HMxTm0q
         LaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710336635; x=1710941435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBel3iki8J8meyGhrbnmktI8MvSLySCO1UlPcxjldeY=;
        b=KacdQm+lr2M6XM7iJ4Ca+/1yI7RyLAk4mSx9G0a5hJL4Z9njK2cEEBSO2QtfFymN8r
         azo5QPFIv6oHd672WRQA0/EGpalKf6DF6XNnPdfjrrCH9UnrCeFlg9ZJ73yo5ZyWGriF
         BPIrGGyXMd0Jbto+XblpXOlB5HIqIS4HEsDi1n+oJR3jQoOcSxmef3+dul4Yri7gYBs5
         aw4Tc+ZOdqFbWJTvafGZ902tSYHZeEpPgoG70HP1x09K7CO05sHdFCnxEal6qJfCytC8
         Syq6VwFEsP5gmOIN9+SOjT3Rc+kJdmlmiTNFzWNygH2mkiyFuraEIEccd1ErUSlnb1Q5
         SrHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3YkYdMuKyRQ/swz5NU+ALYvU3eAdzu41B3YGBC60yXPtuZ3FCJ88bQk/uQHE33PfzU8iUASq0Ypzj0mY9CglMRU3vh2ybOFi8Dm/H4gc=
X-Gm-Message-State: AOJu0YzQGAnu+a0hrF/HHgUd0Uj2Mn5l2dzTQiR6IVngP1l2QaX6Pj3q
	WzFCTKxLAVHrVX7E624K3MGQ6L1Rm2GVgfVbkv1jfiR9eDZWmKETGt36LFTEeg==
X-Google-Smtp-Source: AGHT+IEr8RFvXfC/j6y52Lr/LbUgPUggoo4OrGIog/WZgRzB4G5UbZ4C8E9/tLMMYLpLYJjPGeHiRQ==
X-Received: by 2002:a17:906:2b17:b0:a46:5f74:f0b8 with SMTP id a23-20020a1709062b1700b00a465f74f0b8mr946165ejg.26.1710336634696;
        Wed, 13 Mar 2024 06:30:34 -0700 (PDT)
Message-ID: <eec7ec28-87e0-477e-a292-e4ec73b44a5c@suse.com>
Date: Wed, 13 Mar 2024 14:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 9/9] x86/smp: start APs in parallel during boot
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <77c9199eabf3a30ebcf89356b2dd35abd611a3a9.1699982111.git.krystian.hebel@3mdeb.com>
 <dad39029-d0fc-4aa0-8562-4c7a02ca8039@suse.com>
 <d853fb40-ca61-457a-b292-9bc675b86181@3mdeb.com>
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
In-Reply-To: <d853fb40-ca61-457a-b292-9bc675b86181@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 18:13, Krystian Hebel wrote:
> 
> On 8.02.2024 13:37, Jan Beulich wrote:
>> On 14.11.2023 18:50, Krystian Hebel wrote:
>>> Multiple delays are required when sending IPIs and waiting for
>>> responses. During boot, 4 such IPIs were sent per each AP. With this
>>> change, only one set of broadcast IPIs is sent. This reduces boot time,
>>> especially for platforms with large number of cores.
>> Yet APs do their startup work in parallel only for a brief period of
>> time, if I'm not mistaken. Othwerwise I can't see why you'd still have
>> cpu_up() in __start_xen().
> cpu_up() is left because multiple notifiers aren't easy to convert to work
> in parallel. In terms of lines of code it looks like a brief period, but all
> the delays along the way were taking much more time than the actual
> work. As the gain was already more than what I hoped for, I decided
> against spending too much time trying to fix the notifiers' code for
> minimal profit.

Which is all fine. Just that by title of this patch and the cover letter
I expected more. Adding "partly" or some such in both places may help.

>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -425,7 +425,7 @@ void start_secondary(unsigned int cpu)
>>>   
>>>   static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>   {
>>> -    unsigned long send_status = 0, accept_status = 0;
>>> +    unsigned long send_status = 0, accept_status = 0, sh = 0;
>> sh doesn't need to be 64 bits wide, does it?
> No, will change.
>>
>>>       int maxlvt, timeout, i;
>>>   
>>>       /*
>>> @@ -445,6 +445,12 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>>       if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
>>>           return 0;
>>>   
>>> +    /*
>>> +     * Use destination shorthand for broadcasting IPIs during boot.
>>> +     */
>> Nit (style): This is a single line comment.
> Ack
>>
>>> +    if ( phys_apicid == BAD_APICID )
>>> +        sh = APIC_DEST_ALLBUT;
>> I think the latest for this the function parameter wants changing to
>> unsigned int (in another prereq patch).
> What do you mean, phys_apicid in wakeup_secondary_cpu()? It is passed
> as signed int since __cpu_up(), should I change all of those to unsigned?

That would be best, yes. BAD_APICID, after all, is an unsigned constant
(no matter that its definition involves a unary minus operator).

Jan

