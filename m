Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EFB25BDB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 08:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080728.1440941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRXc-0002Yg-K5; Thu, 14 Aug 2025 06:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080728.1440941; Thu, 14 Aug 2025 06:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRXc-0002Wl-Gb; Thu, 14 Aug 2025 06:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1080728;
 Thu, 14 Aug 2025 06:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umRXa-0002Wd-Qw
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 06:34:22 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b673cb0c-78d8-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 08:34:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6188b7949c3so988804a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 23:34:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615cc38aee5sm21586832a12.3.2025.08.13.23.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:34:20 -0700 (PDT)
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
X-Inumbo-ID: b673cb0c-78d8-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755153261; x=1755758061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HFjpRc2ScKrf6SUBtwnE2lnDFKMHvEEZm2FDZdkBLnc=;
        b=KDW/HaItvBDVDvHNCCPsGQT9t4sylWHb4NDfyiGFvw5vjO04uceyDlnZ29rkbsN2HR
         JbrwguF9ssjdT7rJdkd+olWhIac7O/xcts5s50P6HLqlmM8UlZbAssty2e2EN3TLqP4B
         6nAxc9qjLMagCyZ+WqGf6qVmXXRIuw1GdUW+zpa/GYfvgvmZhTqBxCEcOGZZHb+dtffg
         r0Jyp8COJxcSutFg1KCAP9fuqrZAJoinS9RzkjnPXCsKRxCNhAfIsw8VB3CVVl4PPbBB
         hKNu9/VPzTi3r9L0ONBzFhBjSq9cZKilUCi0JMJ58JI2A3fCQE82dHggLFkLvc2tyd6h
         X8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153261; x=1755758061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFjpRc2ScKrf6SUBtwnE2lnDFKMHvEEZm2FDZdkBLnc=;
        b=eS+LC9w/j5nj0DEEzc0eT0ZUYC2Nmnf8Phz7jzejS2QA4iAIeP7YsteieTEVMN6Zcy
         qmHyQfyWHecThjb/eQPxh4Nh77hWLElCYK76dqviiY43fPEA5xZ98pTj0fFcAn1h5fn1
         4z/E06gkTd0ZC+t6yqJbKmnogPSvybm9OjsNJ7CJa3zODEEU1cRtZuis+gj3DLBEseLs
         ai+MZz6dpevjkKFhaIPmgHOc9k2XFuR5GJuqZr43a9Q/FoXwbWqnrGhjFWUycoQ7qdDX
         V11cubhYPgo9hw5cTwtyb1QSoIt7+bcTNZ+YIuX+s9PFqljWVL2D1OI4QtuXHaW0c1lZ
         wdBw==
X-Forwarded-Encrypted: i=1; AJvYcCV91KBTC41sfGlj+3g/z6T4KeNMmQs48GrfqNGg4Xzyo/IWa1bb4xZqIwrnQHIyK97NwviUdeB0x+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAds2Lp4PyzVz7Reh5eLbQ280W0IP/PjRm3pwM/rtcg4o/y1Om
	1aXtE5Jm2Mr83YsCf7UQM1dcH2zcTQjVTtIQeUBKZAZPLXaxhO12fH1tb+cwbsJlxA==
X-Gm-Gg: ASbGncuhlIhKespF2wnW05CPqKoehhIFqx/FQ36v0bCZZHX1CIJ2Fq0YPhiIAy3/t5Q
	gLfMiMRLFWjrGbmlal8kAPtmk6L0fZNXRl6os1LlUo41VgG8uuYpmGOEr7Xpepqi3adOTB/Clpf
	EOLN7g4ng7zGZCOg+YtaMmHk2c7e5T02yR8cVTGzNFZ64Z868C6+jLF0wxgtJ8XgRVcW+jdwlgd
	BoHj2gymRuH3009RzZ5DibCv34uQhOj+8I1/7YAgFOAXdSSzcTI4nHQeVGJ0BpU8D3zDQP/hi1O
	0BysXbjb1vB14sd+5r4HMkU4lARtqcYHs+17zbsJZZB8r8/xAQmy8a6V4jmimLSQag0E1OJX9ux
	dR3SaCCnvlKNqJQTTLww/jZXNxifKuE/Ykw+11BajCaH86eMVOHrhJYyCnc9dIZFEaXl9oKgwZb
	rjEluVCANcwHGGQ+adhA==
X-Google-Smtp-Source: AGHT+IFhquVmSAMzncBz8lQAYAunQ+m+3W14vo87D6cxaSRLcr03ju30Cl/JWe3f9knVHDK6ij2Qbg==
X-Received: by 2002:a05:6402:4402:b0:618:1532:edf2 with SMTP id 4fb4d7f45d1cf-6188b935b2cmr1389138a12.9.1755153261294;
        Wed, 13 Aug 2025 23:34:21 -0700 (PDT)
Message-ID: <136a1af7-5af2-41d8-bca8-f5bfe3ee03d5@suse.com>
Date: Thu, 14 Aug 2025 08:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
 <aba2627f-b38d-4d6c-9c5e-4bdc4f5b563f@suse.com>
 <24d8591e-f669-4142-a783-c7cfea87034c@xen.org>
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
In-Reply-To: <24d8591e-f669-4142-a783-c7cfea87034c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 00:54, Julien Grall wrote:
> Hi Jan,
> 
> On 12/08/2025 08:32, Jan Beulich wrote:
>> On 11.08.2025 23:21, Julien Grall wrote:
>>> On 11/08/2025 21:30, Dmytro Prokopchuk1 wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -330,9 +330,12 @@ shared_entry_header(struct grant_table *t, grant_ref_t ref)
>>>>            /* Returned values should be independent of speculative execution */
>>>>            block_speculation();
>>>>            return &shared_entry_v2(t, ref).hdr;
>>>> +
>>>> +    default:
>>>> +        ASSERT_UNREACHABLE();
>>>> +        break;
>>>>        }
>>>>    
>>>> -    ASSERT_UNREACHABLE();
>>>   >       block_speculation();>
>>>>        return NULL;
>>>
>>> I know you are trying to apply the MISRA rule. But this is odd that you
>>> move the ASSERT_UNREACHABLE() but then code after is still only
>>> reachable from the default. In fact, this is introducing a risk if
>>> someone decides to add a new case but then forgot to return a value.
>>>
>>> By moving the two other lines, the compiler should be able to throw an
>>> error if you forgot a return.
>>
>> I think we did discuss this pattern in the past. While moving everything up
>> to the "return" into the default: handling will please Eclair / Misra, we'll
>> then end up with no return statement at the end of a non-void function.
>> Beyond being good practice (imo) to have such a "main" return statement,
>> that's actually another rule, just one we apparently didn't accept (15.5).
> 
> Reading 15.5, this seems to be about having a single return in the 
> function. Unless I misunderstood something, this is different from what 
> you suggest.

Sue, the connection is a lose one. What I mean is that adding yet another
return _not_ at the end of the function moves use further away from 15.5
compliance.

> Anyway, my main problem with this change is that ASSERT_UNREACHABLE() is 
> moved. I could possibly settle with:
> 
> default:
>    break;
> }

Which would violate another rule, iirc (demanding that there be more than
just "break").

> ASSERT_UNREACHABLE();
> ...
> 
> But at least to me, this pattern is more difficult to read because I 
> have to look through the switch to understand the patch is only meant ot 
> be used by the "default" case.

+1

Jan

