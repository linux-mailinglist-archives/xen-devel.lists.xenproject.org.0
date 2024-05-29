Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1ED8D3ACF
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732177.1138052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLCp-0003je-Ul; Wed, 29 May 2024 15:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732177.1138052; Wed, 29 May 2024 15:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLCp-0003hF-S8; Wed, 29 May 2024 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 732177;
 Wed, 29 May 2024 15:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCLCo-0003h9-Sj
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:27:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98ab62e-1dcf-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 17:27:08 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so160697a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:27:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57861b4ddefsm7274275a12.60.2024.05.29.08.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 08:27:07 -0700 (PDT)
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
X-Inumbo-ID: e98ab62e-1dcf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716996428; x=1717601228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6MsRT6qQ4rmyScI+Jz3Lny4rVSNKZa/8YroPYI+NZM=;
        b=fEUDq2uVxpNZo//1hgPyJgKzj/ARQSUA+J6pmAF0jvbvaQ+1iW2Wwkx9ZbzoiOAtOu
         0DGP5FFYKUX2LIquWgA4+Cr06p37M28Koq7OmGB5DLH4kKALUBcoorGLYe4WzhwFXRgl
         VsX9KxjLESCGOC5x3JTgLhqj/Y0O7QZmKfz5/um+ggAo51eFpUPsZ9jS5y9xqjQOAk7M
         eHjC2DhKg0HGqyWvJw4ciZG4KCo9YmYEH+MHlfFRPaaPfBN5uPIKw6uobed93iBjTQSv
         /XDCCv4V2i6jz1koGifiRqY6Sn3QfuH2RMvuDbnU9hih+2veWqnhWfmkfzGsEZ8nxbwm
         6Ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996428; x=1717601228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6MsRT6qQ4rmyScI+Jz3Lny4rVSNKZa/8YroPYI+NZM=;
        b=WMCc0jKUnR73B5O2SgZt87QjORC0iCQt/QfzI/rD+6PQ3AzWRG7ByF10rep+hMfKEO
         63XZ1Nmx3lFwJPYa/TYrE2Xo79Omyn7RcOjQeLeBc3Wr6vbRf9f0mA4qlWcFnfEdCjVe
         XRL5bK8s6NbiwYhzRkpMrL80zAcxipjg7Plydu+quit8123H6/dm8rVwOyzcTMb7Sp4m
         4s9mT5tOrTd6+ACIXk+4ECwx4H90amCqWqXxpgWiPxYm8FhChELIxhMpBYr1uzBns2CA
         hiY+nSOezJpT82wr/krx2cz/Xcs3DgWAsYMO3QFuDKiWLuYSs+2XGFdwAPhdvs6YxLaS
         ALEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFeVMv1VTqs87z4Vt4i+xaoLGGRL4V4AFq7Q+8LKl/m/tJ6AyCuA/pK6rRC//r5KGzv8+auF9arTxGRAme2saWLaKnwV76Wzj1WHCke/0=
X-Gm-Message-State: AOJu0YyX601SfriWk6xy0qAXPZcQsipwDuC7UOD406a8iW01sJEYuGHv
	ts65yYBSbiMTU4xYNXRhkn6ichYF9kEKz/dOvu6Mex3KHbcdDe1WN6/x/5SHzA==
X-Google-Smtp-Source: AGHT+IF0FWIqeSqjU2L8e6lfQioqXAc59wKYjgFXUDQW/tMeP8jl6Sstt/qyaXWyU6/A+XW1Y6blIg==
X-Received: by 2002:a50:955c:0:b0:574:ebf4:f786 with SMTP id 4fb4d7f45d1cf-57a03fb3bfcmr2271955a12.16.1716996428014;
        Wed, 29 May 2024 08:27:08 -0700 (PDT)
Message-ID: <b9a667ea-45a6-45d1-8dda-0ec3aa00b9cf@suse.com>
Date: Wed, 29 May 2024 17:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 1/9] x86/irq: remove offline CPUs from old CPU
 mask when adjusting move_cleanup_count
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-2-roger.pau@citrix.com>
 <0a2f1f9a-fab1-409c-96f8-399b19077f12@suse.com> <ZldGe6z70R0CD32Z@macbook>
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
In-Reply-To: <ZldGe6z70R0CD32Z@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 17:15, Roger Pau Monné wrote:
> On Wed, May 29, 2024 at 02:40:51PM +0200, Jan Beulich wrote:
>> On 29.05.2024 11:01, Roger Pau Monne wrote:
>>> When adjusting move_cleanup_count to account for CPUs that are offline also
>>> adjust old_cpu_mask, otherwise further calls to fixup_irqs() could subtract
>>> those again creating and create an imbalance in move_cleanup_count.
>>
>> I'm in trouble with "creating"; I can't seem to be able to guess what you may
>> have meant.
> 
> Oh, sorry, that's a typo.
> 
> I was meaning to point out that not removing the already subtracted
> CPUs from the mask can lead to further calls to fixup_irqs()
> subtracting them again and move_cleanup_count possibly underflowing.
> 
> Would you prefer to write it as:
> 
> "... could subtract those again and possibly underflow move_cleanup_count."

Fine with me. Looks like simply deleting "creating" and keeping the rest
as it was would be okay too? Whatever you prefer in the end.

>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -2572,6 +2572,14 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>              desc->arch.move_cleanup_count -= cpumask_weight(affinity);
>>>              if ( !desc->arch.move_cleanup_count )
>>>                  release_old_vec(desc);
>>> +            else
>>> +                /*
>>> +                 * Adjust old_cpu_mask to account for the offline CPUs,
>>> +                 * otherwise further calls to fixup_irqs() could subtract those
>>> +                 * again and possibly underflow the counter.
>>> +                 */
>>> +                cpumask_and(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
>>> +                            &cpu_online_map);
>>>          }
>>
>> While functionality-wise okay, imo it would be slightly better to use
>> "affinity" here as well, so that even without looking at context beyond
>> what's shown here there is a direct connection to the cpumask_weight()
>> call. I.e.
>>
>>                 cpumask_andnot(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
>>                                affinity);
>>
>> Thoughts?
> 
> It was more straightforward for me to reason that removing the offline
> CPUs is OK, but I can see that you might prefer to use 'affinity',
> because that's the weight that's subtracted from move_cleanup_count.
> Using either should lead to the same result if my understanding is
> correct.

That was the conclusion I came to, or else I wouldn't have made the
suggestion. Unless you have a strong preference for the as-is form, I'd
indeed prefer the suggested alternative.

Jan

