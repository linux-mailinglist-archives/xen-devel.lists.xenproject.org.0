Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984886CFA6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687331.1070651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjZ5-0002Ry-E1; Thu, 29 Feb 2024 16:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687331.1070651; Thu, 29 Feb 2024 16:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjZ5-0002Pu-AQ; Thu, 29 Feb 2024 16:47:23 +0000
Received: by outflank-mailman (input) for mailman id 687331;
 Thu, 29 Feb 2024 16:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjZ3-0002Pm-RB
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:47:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34a77297-d722-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:47:20 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso1664877a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:47:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fe1-20020a056402390100b00566a1b8614esm704231edb.58.2024.02.29.08.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:47:20 -0800 (PST)
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
X-Inumbo-ID: 34a77297-d722-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709225240; x=1709830040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9B+z67McwWOw6JQKYvIA0eTo1/FoaYxnTLvrl1OPJI=;
        b=EipfeJCmjBa3PcsmS0R0uhIoCQZBdG/zwD5TKfGzbHR5S7UsCBv2ykPtGkQV+M4ar3
         7PNV00Qn1TPkGGI3ALaPGkDW3DZYjTd/gLQf8Dn/iIWMbhYbwopP746V7ZvQmTMKcodz
         NpBXbmr8Iurqu6TfBaTIoOEdph4v32os9IKRxJ+3AtpMcRrpniJdf0vmGbw1yZA9z9up
         5ROyBXjyPY/pMqtdxBw9WWQA3b0y4WmEzzcONpgR6RaF3zmB9btivYTZKHs/fKLpPi40
         54KFnnRE10KQH/78pQaxvNM77cTyQYYiCaRbZAgSR4O5IDhju3Xuoix/IyhThNdtOAXK
         AC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225240; x=1709830040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9B+z67McwWOw6JQKYvIA0eTo1/FoaYxnTLvrl1OPJI=;
        b=oPEaCv3DnTCGe3BxVzIt4QJMBBSqlpbljjy/xR/Z+MxctRp9kfHSFHoYKQTYgKbXKx
         VzCCW//d1V0azLDjMZ8wBZjDVmCvlujcWwjCveKP+yulJ5S3hmwHVCkMIHDJLaQTnxyk
         jIAKhZ2LSS8+M4TJVj5wIJEhixpY2hxqXe7S6mcDbrmVAHiBByAwzANNQxrV6sNB2JPJ
         KcK5RzAe4qk2iZC/oD5J7i3VpgXFHiU9BbcKbjiHj/asSVXDQCbgSzpbN7xe5AN/xkJx
         Obsq7BTChgEz4dL7rRyoqj678qrMQZyP6FR71inbR3tWfn6mZFiGHVIl/CZwAb8emreW
         50yw==
X-Forwarded-Encrypted: i=1; AJvYcCUQRWF7cqeMt9CEwPI6xXmnbXKSph+K8Yv/sZFXDZy9H/vW9oRWAL/Au+K92p2KiaqzAQJ7nSQkna9mbnTGG0QjFBjplzu3NEXTwlfiRqQ=
X-Gm-Message-State: AOJu0YzJvXGiXkA5BWScowo0N5Oc+5OFr0R5gpmFH+cFItDeHEg3ioOc
	bOYiWXU1Lk/+MlDskKgl+/CuMT14gR6V/3KmMl/3phgmqIiy/tXC/NtZ+yXg5g==
X-Google-Smtp-Source: AGHT+IEdnCKBhbzvM76uMG8xc6/KhdoMOmk2PPPvu8+qjniUKS0SddbtbpbPFv/DkmqashrwvkVh2A==
X-Received: by 2002:a05:6402:3119:b0:564:f6d5:f291 with SMTP id dc25-20020a056402311900b00564f6d5f291mr1664887edb.34.1709225240244;
        Thu, 29 Feb 2024 08:47:20 -0800 (PST)
Message-ID: <3b7af122-2970-4f66-a6ea-bfb242302639@suse.com>
Date: Thu, 29 Feb 2024 17:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
 <26be05f7-7361-40d9-92f2-cf2e22da9d4e@suse.com>
 <4143df23c3d1f8dcb7fcc2d97e077d01@bugseng.com>
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
In-Reply-To: <4143df23c3d1f8dcb7fcc2d97e077d01@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 17:40, Nicola Vetrini wrote:
> On 2024-02-29 17:25, Jan Beulich wrote:
>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/kconfig.h
>>> +++ b/xen/include/xen/kconfig.h
>>> @@ -25,7 +25,7 @@
>>>  #define __ARG_PLACEHOLDER_1 0,
>>>  #define config_enabled(cfg) _config_enabled(cfg)
>>>  #define _config_enabled(value) 
>>> __config_enabled(__ARG_PLACEHOLDER_##value)
>>> -#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 
>>> 1, 0)
>>> +#define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 
>>> (1), (0))
>>>  #define ___config_enabled(__ignored, val, ...) val
>>
>> In addition to what Andrew said, would you mind clarifying what exactly 
>> the
>> violation is here? I find it questionable that numeric literals need
>> parenthesizing; they don't normally need to, aynwhere.
>>
> 
> This one's a little special. I couldn't parenthesize val further down, 
> because then it would break the build:
> 
> In file included from ././include/xen/config.h:14,
>                   from <command-line>:
> ./include/xen/kconfig.h:29:52: error: expected identifier or ‘(’ before 
> ‘)’ token
>     29 | #define ___config_enabled(__ignored, val, ...) (val)
>        |                                                    ^
> ./include/xen/kconfig.h:39:34: note: in expansion of macro 
> ‘___config_enabled’
>     39 | #define _static_if(arg1_or_junk) ___config_enabled(arg1_or_junk 
> static,)
>        |                                  ^~~~~~~~~~~~~~~~~
> ./include/xen/kconfig.h:38:26: note: in expansion of macro ‘_static_if’
>     38 | #define static_if(value) _static_if(__ARG_PLACEHOLDER_##value)
>        |                          ^~~~~~~~~~
> ./include/xen/kconfig.h:41:27: note: in expansion of macro ‘static_if’
>     41 | #define STATIC_IF(option) static_if(option)
>        |                           ^~~~~~~~~
> common/page_alloc.c:260:1: note: in expansion of macro ‘STATIC_IF’
>    260 | STATIC_IF(CONFIG_NUMA) mfn_t first_valid_mfn = 
> INVALID_MFN_INITIALIZER;
>        | ^~~~~~~~~
> make[2]: *** [Rules.mk:249: common/page_alloc.o] Error 1

So if we're not gong to deviate the construct, then this change needs to
come entirely on its own, with a really good description.

>>> --- a/xen/include/xen/list.h
>>> +++ b/xen/include/xen/list.h
>>> @@ -490,9 +490,9 @@ static inline void list_splice_init(struct 
>>> list_head *list,
>>>   * @member: the name of the list_struct within the struct.
>>>   */
>>>  #define list_for_each_entry(pos, head, member)                        
>>>   \
>>> -    for (pos = list_entry((head)->next, typeof(*pos), member);        
>>>   \
>>> -         &pos->member != (head);                                      
>>>   \
>>> -         pos = list_entry(pos->member.next, typeof(*pos), member))
>>> +    for (pos = list_entry((head)->next, typeof(*(pos)), member);      
>>>     \
>>> +         &(pos)->member != (head);                                    
>>>   \
>>> +         pos = list_entry((pos)->member.next, typeof(*(pos)), 
>>> member))
>>
>> this ends up inconsistent, which I think isn't nice: Some uses of "pos"
>> are now parenthesized, while others aren't. Applies further down as 
>> well.
>>
> 
> Yeah, the inconsistency is due to the fact that a non-parenthesized 
> parameter as lhs is already deviated. To keep it consistent here I can 
> add parentheses, but then the deviation would be kind of pointless, 
> wouldn't it?

I don't think so: It would still be useful for cases where a macro
parameter is used solely as the lhs of some kind of assignment
operator. But yes, before making adjustments you will want to wait
for possible further comments, especially from e.g. Julien, who iirc
was primarily against this kind of parenthesization.

Jan

