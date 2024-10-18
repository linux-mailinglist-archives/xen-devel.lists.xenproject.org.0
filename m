Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD69A3595
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 08:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821616.1235526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1gdy-0001hf-MZ; Fri, 18 Oct 2024 06:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821616.1235526; Fri, 18 Oct 2024 06:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1gdy-0001gB-Iv; Fri, 18 Oct 2024 06:39:26 +0000
Received: by outflank-mailman (input) for mailman id 821616;
 Fri, 18 Oct 2024 06:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1gdx-0001g5-09
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 06:39:25 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5df6089-8d1b-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 08:39:22 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d63a79bb6so1252950f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 23:39:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf146e2asm1028155f8f.116.2024.10.17.23.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 23:39:21 -0700 (PDT)
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
X-Inumbo-ID: b5df6089-8d1b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729233562; x=1729838362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lN0rfgA0CPLJ8E+1VU7tZMJVgzD0vTwjwmAcbfaDlIw=;
        b=AT0PcwClUx6g0+/Qm0jU1iGf17LPx+z+2YGLPf3ttY1DbVLFElkKJV/bC80HhPfWjo
         t7yi4dCASHeflfMUQYO83d++cRc8Sbl+woXFrYRfvFzInhYv2QblFF0O9ydho1m/hnPI
         5rx2PicFhUwDYIw9ONT1NCYy816ZWOlmdwNm+g/7QcL+VelWlCUOr1/gP+MrSDLXx3KJ
         Jnd/BqNfokH64Oc2mmvOWyTJ+Mhh9xgLJ7oj1rlkeoctaydnLq2oLegrA61qTzs1/hmK
         XhaaybUanryEpC9TGSkjKufmQtNT/FVIakOJ99YTx4WR7mg9wmxVbqNCe7/btG/+F4Lo
         8YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729233562; x=1729838362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN0rfgA0CPLJ8E+1VU7tZMJVgzD0vTwjwmAcbfaDlIw=;
        b=bOgaT3AN4cotISz2OCffzw6KYuBSJj75KocjR9P9m+2BKlBkGm2bA14m88qMNbaSzW
         hBsKnZ1U4DI/HwDS8GnQ6TxQzsSBGjFpw3xqYSJ3HvVt0UqfqEQNG5vlJ8ozAw61aPbI
         e1TrRvVl6GRpHv0ExZenwtv9g99XCXjLgp7H/LtnzhiglccJShN0RLICw4M2NOsdZbQ3
         S+w5C8dpgiK32Ot2n2QERcbwmJvwQJibqPZTgPdjHlX7LvqnE0o5KkV2VzHgmUZIfL5d
         LhVx0+Z9FNwJ8cfv3ZeHuEQeouZghrop6HMfYsmuExFuYV9nUTo6mylWZYrzcvnxk65+
         Xbzw==
X-Forwarded-Encrypted: i=1; AJvYcCVOWX84s8uYpBUaUjAt1Iihcjp1WnbJubK9MALNfPavZU9bhcMlJSOtyh7xogKJLTQFVkidY/NRZvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrlFVkBHTF4GSbaKsDxQUQT2Z9t6hlM5pFElUHRreCNl33Ixag
	dfUt7RijPH8W9elJp7ODQCs3kNoGSBFgmp7zNkTV5dWa1kolvBtvXcO8d/N1gQ==
X-Google-Smtp-Source: AGHT+IEmp1gVG+sta7fbs+XJLDiZj68Qt50yheN3nq7QjV04ANEnwRHRykj7YfpksvE5FYzow3NP1g==
X-Received: by 2002:a5d:67cc:0:b0:37d:4cd6:6f2b with SMTP id ffacd0b85a97d-37eab6ec97cmr1025143f8f.14.1729233562079;
        Thu, 17 Oct 2024 23:39:22 -0700 (PDT)
Message-ID: <cd25c03d-456d-49a8-a832-e8ec02b69108@suse.com>
Date: Fri, 18 Oct 2024 08:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/44] x86/boot: transition relocation calculations to
 struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-14-dpsmith@apertussolutions.com>
 <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
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
In-Reply-To: <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.10.2024 02:42, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> @@ -1686,12 +1682,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>   
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        set_pdx_range(bi->mods[i].mod->mod_start,
>> -                      bi->mods[i].mod->mod_start +
>> -                      PFN_UP(bi->mods[i].mod->mod_end));
>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
>> -            _mfn(bi->mods[i].mod->mod_start),
>> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
>> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
>> +                      paddr_to_pfn(bi->mods[i].start) +
>> +                      PFN_UP(bi->mods[i].size));
>> +        map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),
>> +            maddr_to_mfn(bi->mods[i].start),
>> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);
> 
> I would vertically align all the parameters inside the (.

At the very least the two successive calls want formatting the same way.
Plus imo the presented formatting of map_pages_to_xen() isn't "legal"
anyway, it ought to be

        map_pages_to_xen(
            (unsigned long)maddr_to_virt(bi->mods[i].start),
            maddr_to_mfn(bi->mods[i].start),
            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);

(if not doing it the way Jason asked for).

Jan

