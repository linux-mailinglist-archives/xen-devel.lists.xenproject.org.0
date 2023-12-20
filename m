Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41468819A35
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657417.1026222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFrhk-0002ER-JG; Wed, 20 Dec 2023 08:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657417.1026222; Wed, 20 Dec 2023 08:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFrhk-0002CI-G5; Wed, 20 Dec 2023 08:13:24 +0000
Received: by outflank-mailman (input) for mailman id 657417;
 Wed, 20 Dec 2023 08:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFrhk-0002CC-2H
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:13:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4861321-9f0f-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 09:13:23 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so67296695e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:13:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q15-20020a05600c46cf00b0040b349c91acsm6252004wmo.16.2023.12.20.00.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:13:22 -0800 (PST)
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
X-Inumbo-ID: a4861321-9f0f-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703060002; x=1703664802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iR+eQK4WZMqlV50/1Et7qOFHCdZg/bDzP5iTizcJb/M=;
        b=SRetfITuSo/PRcaV7LSupsBtrMd1UgMzLdWhUuqHRrjgA2PVmcgJuNotabMrzuDqti
         as+arSuHSpDxyDESbzDASHiGOfLbje3yIbNxPdx75mLJoUZxMVmw043NMV3wQezGXt1g
         x+c1Q7BOhsHjrFauKYL7RfqkdhhUVGIRNB0dYbFsLzXAYWeVIf2qQanMlsrmYkDM7Z/l
         Nl+zrHY8bILMdfX40ADyukId64Cqz8yIUud+4oPf7za7/ImLkLr6ZzPINHhOMCBSpy7C
         HEk/kCQbTa2q4UOt4d37hPhCxf3OTjDv4jazVJ/TKfajVxsmG4TJDtFdZksltI12tahl
         IJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703060002; x=1703664802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iR+eQK4WZMqlV50/1Et7qOFHCdZg/bDzP5iTizcJb/M=;
        b=aIzVQTSmIO64ooyK9OrilerUVAMIA0ciB+LowF5vAbJVX8cJaeV3dz2fpiok97LB1d
         bt7FgnD54Qz/l2Zp8PKgvsADOrm2hZBIDlcwfk8kdo8tvrrI5oV58B6gGeEeD3F7WStI
         OvZvEi6ZcBDJ/ZRWRlvmV5EoFbTQ8jCK4q5k2l8hhZ0vUvFehpGLyG8NOM2Gbf08ckLm
         ZSkL1PF/Ue+bWNsdgj8M8Lgjxlpd3mydZHRpqs5xtyuK+7fcHFcC3e4MkaFh+Csxeq2Y
         3VeneEHXgFweH/Sroz1kvmdpQuxUsq8QsnmixxXBYIwh5Q5O9EO2h1xiV2KUuxKJrN6F
         eY2Q==
X-Gm-Message-State: AOJu0Yx9RnmAyE/lV/w2vmgSQlGyywpHD+2qzFXzgPbcxvXFe0h7aFsP
	9GY/DdY23ctCBmg5Xf7ymxln
X-Google-Smtp-Source: AGHT+IHIkQET8msiEY3DLcNh64dG0YtsdRAKRjjHX0IldSfzJY0Q9Zrih4BDmz+rthgXdNJMdGe0Yg==
X-Received: by 2002:a05:600c:538e:b0:40d:2f2a:5709 with SMTP id hg14-20020a05600c538e00b0040d2f2a5709mr839651wmb.47.1703060002520;
        Wed, 20 Dec 2023 00:13:22 -0800 (PST)
Message-ID: <92f14f0d-bd7f-480e-b8a1-57e32f84d5c7@suse.com>
Date: Wed, 20 Dec 2023 09:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: use "break" in arch_memory_op()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <e944cc4f-354c-4752-8794-03e6a7517372@suse.com>
 <alpine.DEB.2.22.394.2312191620000.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312191620000.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 01:22, Stefano Stabellini wrote:
> On Tue, 19 Dec 2023, Jan Beulich wrote:
>> The final return statement is unreachable and hence disliked by Misra
>> C:2012 (rule 2.1). Convert those case-specific (main) return statements
>> which already use "rc", or in one case when it can be used without
>> further adding of code, to break.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01537.html.
>> Yet another option would be to simply pull the default case out of the
>> switch() statement.
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4724,7 +4724,7 @@ long arch_memory_op(unsigned long cmd, X
>>          spin_unlock(&d->arch.e820_lock);
>>  
>>          rcu_unlock_domain(d);
>> -        return rc;
>> +        break;
>>      }
>>  
>>      case XENMEM_memory_map:
>> @@ -4818,7 +4818,7 @@ long arch_memory_op(unsigned long cmd, X
>>          if ( __copy_to_guest(arg, &ctxt.map, 1) )
>>              return -EFAULT;
>>  
>> -        return 0;
>> +        break;
>>      }
> 
> There are also two other return 0; under case XENMEM_memory_map and
> XENMEM_machphys_mapping. I would be consistent and either leave this
> return 0 alone, or change all the return 0.

Yes, that would have been another possible pattern to follow. Due to
the multiple possible approaches I had specifically outlined (in the
description) the pattern I decided to follow.

> Either way, this patch is correct, so:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

Jan

