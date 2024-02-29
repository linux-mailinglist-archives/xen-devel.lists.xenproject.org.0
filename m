Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F286C384
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 09:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686884.1069468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbq5-0003cI-OL; Thu, 29 Feb 2024 08:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686884.1069468; Thu, 29 Feb 2024 08:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbq5-0003a9-Ks; Thu, 29 Feb 2024 08:32:25 +0000
Received: by outflank-mailman (input) for mailman id 686884;
 Thu, 29 Feb 2024 08:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfbq4-0003a1-Rg
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 08:32:24 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f267d62-d6dd-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 09:32:22 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a43488745bcso100772466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 00:32:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sa24-20020a1709076d1800b00a440019ac45sm438328ejc.69.2024.02.29.00.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 00:32:21 -0800 (PST)
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
X-Inumbo-ID: 0f267d62-d6dd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709195542; x=1709800342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLMf8eDTNHw6Alw0RWohgl+4qC6dnJ/q/Vt6MEOnodc=;
        b=DvDYzl9/ym25Uhk1VKateXDJHX3Vz9wvBhhJ/keOi3xIOtq2NCM1ZM5KXhrH5ZJNvr
         qjiA1r7V9+i3uGGXKWkFDYyGdiLEmEAHmvvP/pITCPgi/Fxt1xnoKidK/kf1ur6fxssm
         7WX9PdWFG+UJ+LDIlLh9EVBdY/YuQX5zcL13q8wJq9Tz9janYYEh1o4+U5fsKYrvTDJt
         57SSg6B9bHZCYIO18SYcQX/W81+HKyeLGSrSdjSBMAq54lioTu0seLB9TrG33o8X5+6Z
         yyr2fVT3Z6OB9a0bOVMPEJ8skBHTR8+tJ9fV24XxG++sB3jSg8tA6X2NfrT3LZbTPIq8
         sDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709195542; x=1709800342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLMf8eDTNHw6Alw0RWohgl+4qC6dnJ/q/Vt6MEOnodc=;
        b=A1QosMo8Bl2IplwDjNAuMGDLHG41RFiV6e+aUnm/3LbPcgB0Z/ZyGCT6JP3/5OKBOS
         EesX60zga7xIq4CcEVV7oU0QD3sEiPwyx77miXBsAmmpcsRjUDG/WgssS7z5CGmBzCZ2
         67DRJ2zWgx9EH6w9F8i8K2e1g3rcJW0mflq3T8VCBuiywophntGWQr/kpdom2VH83ZoD
         CjyAFjYULI6Fj4zdCRBIEZKoGNqWpqx+RMlqZyZE1/TNWxWh4yR6qm+lbSSJoeiTkUwx
         IWA9ZRk9C0BtsC2E3iLSs1bYa1WVsuCTlI4c5g+unJ8OPMjhn8xK0u1IYP0M0mGrVgcV
         oeYA==
X-Forwarded-Encrypted: i=1; AJvYcCX7wQ6hYvuc20aSnX21Uq3x+D3kpjc28ByUr0W12uRPSPBlXus50WyoC7SXQ42bZm/Vrvvd9Sc01I6yvzQC7QaZs3v8euRvC3HkjxEGps8=
X-Gm-Message-State: AOJu0YyUUjtHqnTDrQsH7Ju8FbxrLHjp14invXm9/0rA/PQIBUJrUTAQ
	07mCym6fvP1YJfg24+//+44Cm1sn8qngfWZbQx6+A7BdnSZTe+DvazuNKdDV4A==
X-Google-Smtp-Source: AGHT+IFve4bD7L4jKEawJbWIMMsrD0cTVvPZ5QfJl0TsjKBifJu8LQS0Ho96E+jbYAfPUaEAb/La5g==
X-Received: by 2002:a17:906:3bc9:b0:a43:f949:8e8d with SMTP id v9-20020a1709063bc900b00a43f9498e8dmr973821ejf.67.1709195542159;
        Thu, 29 Feb 2024 00:32:22 -0800 (PST)
Message-ID: <0e2f5394-6322-4845-954f-ff080626523f@suse.com>
Date: Thu, 29 Feb 2024 09:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: extend deviations of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com>
 <1a00c221-ce1c-45be-9ab3-e8f1a0e5678d@suse.com>
 <98d82c40-a81a-4c75-8cdf-aaef640382b6@bugseng.com>
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
In-Reply-To: <98d82c40-a81a-4c75-8cdf-aaef640382b6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 09:01, Federico Serafini wrote:
> On 28/02/24 10:06, Jan Beulich wrote:
>> On 28.02.2024 09:53, Federico Serafini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>
>> Comments below apply similarly to text added to this file.
>>
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -291,7 +291,14 @@ Deviations related to MISRA C:2012 Rules:
>>>        - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>>>   
>>>      * - R16.3
>>> -     - Switch clauses ending with continue, goto, return statements are safe.
>>> +     - Switch clauses ending with an unconditional flow control statement
>>> +       (i.e., continue, goto, or return) are safe.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> With this edit (unmentioned in the description, btw) ...
>>
>>> +   * - R16.3
>>> +     - Switch clauses ending with an if-else statement are safe if both
>>> +       branches consist of a flow control statement (i.e., continue, break,
>>> +       goto, return).
>>
>> ... why is it not also "ending with" here?
> 
> Because the allowed pattern is:
> 
> if ( cond )
>   return; /* Or continue / break / goto */
> else
>   break;  /* Or continue / goto / return */
> 
> See below for more information.
> 
>>
>> Also what about either situation ending with a call to a noreturn function?
> 
> This can be added.
> 
>>
>>> @@ -307,6 +314,16 @@ Deviations related to MISRA C:2012 Rules:
>>>        - Switch clauses ending with failure method \"BUG()\" are safe.
>>>        - Tagged as `safe` for ECLAIR.
>>>   
>>> +   * - R16.3
>>> +     - On X86, switch clauses ending generating an exception through
>>> +       \"generate_exception()\" are safe.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> This macro is limited to the emulator, so shouldn't be deviated globally.
> 
> Noted.
> 
>> Furthermore - why does the special case need mentioning here? Shouldn't
>> it be the underlying pattern which is deviated (along the lines of the
>> earlier ones):
>>
>>      if ( true )
>>      {
>>          ...
>>          goto ...; /* Or break / continue / return */
>>      }
> 
> This pattern that involves a compound statement for the true branch
> is not deviated by this configuration.
> 
> See below for more information.
> 
>>
>>> +   * - R16.3
>>> +     - Switch clauses ending generating a parse error through
>>> +       \"PARSE_ERR_RET()\" are safe.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> Again this isn't a global scope macro, so shouldn't be deviated globally.
> 
> Noted.
> 
>> Plus it ends in "return", so ought to be covered by the earlier clause.
>> The fact that the return is in a body of do {} while(0) shouldn't matter
>> at all - that's purely syntactic sugar.
> 
> I gather from your comments/questions that you would like to deviate
> *all* the patterns where an unintentional fall through can not happen.
> 
> Rule 16.3 is a purely syntactic rule, and, as a consequence,
> in the current version of ECLAIR additional "allowed pattern" (aka
> deviations) for that rule need to be described through AST nodes,
> meaning that all what you consider as syntactic sugar cannot be ignored.
> 
> A deviation that covers all the pattern you are asking for could be
> done, but it will result in a complex and quite long expression
> (not easy to read and justify in front of an assessor).
> 
> Hence, what I am proposing is to deviate only the the simplest and
> most readable cases, such as:
> 
> if ( cond )
>    return x;
> else
>    return y;
> 
> without involving compound statements, fake do-wile and fake if
> statements but rather deviating the macro inside of which are used
> (as I did).

I see. Problem is that this isn't sufficient for the code we have, and
the seemingly random deviation of certain constructs by name looks to
me as pretty undesirable.

Jan

