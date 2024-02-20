Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B485B507
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683207.1062600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLS5-0001gl-SG; Tue, 20 Feb 2024 08:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683207.1062600; Tue, 20 Feb 2024 08:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLS5-0001eH-Ok; Tue, 20 Feb 2024 08:26:09 +0000
Received: by outflank-mailman (input) for mailman id 683207;
 Tue, 20 Feb 2024 08:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLS4-0001eB-MV
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:26:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1bb5665-cfc9-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:26:07 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4127086bb8aso621215e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:26:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 co3-20020a0560000a0300b0033d70dd0e04sm162106wrb.8.2024.02.20.00.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:26:06 -0800 (PST)
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
X-Inumbo-ID: b1bb5665-cfc9-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708417567; x=1709022367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OePRDQOjkk3bAla0m7Qr0etARY5N6IYAZwBZ2aPacag=;
        b=BVsJWvkwdAkiKmItkmzEzgSmRrNOylDjL3dOk1QKquycptia0FFVRs4rHFHFfQnuan
         iimBOG5NyjPF0hz/AzUSLOFTgSpjOnnV59K8T7FMER3XbEd+346kjv3rkMwYJUBN/j9R
         QJIL1WHbqbfiVIxg6ad69gvMPugkGINPgcpcketjMretB9vxAh39qzRjfzloW39P67cl
         mSAj6d+Z2NSWO1YtG3P3037n12SNhOUJ0j3jFVYgBhV4uO8BflDHk/WIxaUzqt4zSaH+
         04Oj5MJNjWkeWdpsM4FNxK7JMJSyMfhnaVt2swLI9YLYqPP9kxCijseXu2ZpxClOAKi7
         NuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708417567; x=1709022367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OePRDQOjkk3bAla0m7Qr0etARY5N6IYAZwBZ2aPacag=;
        b=jOF3ImA/pAV4KZ4U42dgRUkTG3QkYZyLpvggjX1hm1/oj+UC0fPAcvr8EJyGBY8mms
         +0KpPWg1MiX8Jme2u8aq1LAEqBuei/kRF+sGrWntMIvXIWUx+bo26BOJZqzv5veOcS1v
         +GXQLm0NeHmgANipoA1Y+QYWqToc8EDWoqja1Ileoza7vw505bj5S/c1VtWWp/6IR4hC
         5E82+rk3L/rDx7Kej84T5eeTzcdG7E61mLwJZJM/Qcj1u9+PLE07kNd/2tdtmrrgQdNA
         nUdM6S9N26ZlTnx6Mh6InVnTIhyAglNaTn3GKci9HRzujCdjQVQedXcQ+A7GyRU0wnD+
         Cz6w==
X-Forwarded-Encrypted: i=1; AJvYcCW14rjQSxs4SDmWiNTiHqTfSydnSnbyrMbgFncVa2fR0jNaNyscsUJhHWSuvjqIWXjcSxE+0eOjA+jimwCunMfsniCT9QM3wK4dTA4e568=
X-Gm-Message-State: AOJu0YzWqEcGjjy2QqFj0gTS9w57UbLWgWL1CV0OtXwb+O0/xdQd7lA0
	e7shE09i9RMQRmwLlsvuWrv4QLlhG+vebCrP2zgsSlrV1EsDHaEoVjyUNqyiqg==
X-Google-Smtp-Source: AGHT+IFA5neEU9WAepo8LQ4i3BIraJ2gPDzQw/P5tVjxgFdV/ILvvHl3xV1RJqT9S2QvLY2PBjrveg==
X-Received: by 2002:a5d:6652:0:b0:33d:15c1:cfcb with SMTP id f18-20020a5d6652000000b0033d15c1cfcbmr9121464wrw.40.1708417566820;
        Tue, 20 Feb 2024 00:26:06 -0800 (PST)
Message-ID: <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
Date: Tue, 20 Feb 2024 09:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
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
In-Reply-To: <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 23:22, Julien Grall wrote:
> Title: I would add 'gnttab:' to clarify which subsystem you are modifying.

That's how I actually have it here; it's not clear to me why I lost the
prefix when sending.

> On 05/02/2024 11:03, Jan Beulich wrote:
>> Along the line with observations in the context of XSA-448, besides
>> "op" no field is relevant when the range to be flushed is empty, much
>> like e.g. the pointers passed to memcpy() are irrelevant (and would
>> never be "validated") when the passed length is zero. Split the existing
>> condition validating "op", "offset", and "length", leaving only the "op"
>> part ahead of the check for length being zero (or no flushing to be
>> performed).
> 
> I am probably missing something here. I understand the theory behind 
> reducing the number of checks when len == 0. But an OS cannot rely on it:
>    1) older hypervisor would still return an error if the check doesn't 
> pass)

Right, but that's no reason to keep the bogus earlier behavior.

>    2) it does feel odd to allow "invalid" offset when len == 0 (at least.

I'm puzzled: You've given R-b for patch 1 (thanks), where exactly the
same reasoning is used, i.e. similarly referring to memcpy() to
justify the (new / supposed) behavior.

>> In the course of splitting also simplify the moved part of the condition
>> from 3 to 2 conditionals, potentially (depending on the architecture)
>> requiring one less (conditional) branch.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -3528,15 +3528,16 @@ static int _cache_flush(const gnttab_cac
>>       void *v;
>>       int ret;
>>   
>> -    if ( (cflush->offset >= PAGE_SIZE) ||
>> -         (cflush->length > PAGE_SIZE) ||
>> -         (cflush->offset + cflush->length > PAGE_SIZE) ||
>> -         (cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN)) )
>> +    if ( cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN) )
>>           return -EINVAL;
>>   
>>       if ( cflush->length == 0 || cflush->op == 0 )
>>           return !*cur_ref ? 0 : -EILSEQ;
>>   
>> +    if ( (cflush->offset | cflush->length) > PAGE_SIZE ||
> 
> This is confusing. I understand you are trying to force the compiler to 
> optimize. But is it really worth it? After all, the rest of operation 
> will outweight this check (cache flush are quite expensive).

From purely a performance point of view it may not be worth it. From
code size angle (taken globally) I already view this differently.
Plus I think that we ought to aim at avoiding undesirable patterns,
just because people tend to clone existing code when they can. Thing
is that (as per below) the two of us apparently disagree on what
"undesirable" is in cases like this one.

> We probably should take a more generic decision (and encode in our 
> policy) because you seem to like this pattern and I dislike it :). Not 
> sure what the others think.

Perhaps. If the folding alone was the problem, I'd accept to split (or
even undo) that part. But the earlier aspect you raised also needs
sorting before I can decide whether to adjust or whether to consider
the patch rejected.

Jan

