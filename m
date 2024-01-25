Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41283BB1C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 08:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671349.1044644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSudl-00012J-7r; Thu, 25 Jan 2024 07:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671349.1044644; Thu, 25 Jan 2024 07:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSudl-0000zd-3p; Thu, 25 Jan 2024 07:59:13 +0000
Received: by outflank-mailman (input) for mailman id 671349;
 Thu, 25 Jan 2024 07:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSudi-0000zX-SV
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 07:59:10 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ef09e0b-bb57-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 08:59:09 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5100893015fso3338482e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 23:59:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h16-20020a056602155000b007bc45c52f55sm7466419iow.13.2024.01.24.23.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 23:59:08 -0800 (PST)
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
X-Inumbo-ID: 9ef09e0b-bb57-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706169549; x=1706774349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgHQziVKHREXn1KO8sOhxHpYyzc78sndffEbjiPRUfQ=;
        b=D75qZHVdKDOxzEZT+Q38BnTaNBlEaM8jj8Q6fL5ged+k2x5Ye0FR9NkSFyHmt2ANE/
         gHGQFa41mB1uaTa2UvFbL5jnGbCI81/rUFYFKMKCfl2mt1577EmiT/48cBqhj+OZpmR7
         tjpAMSXshy/4Dhtucjh1pFtXZmEHhbSn/p2fTdXTXDVnKnyPea+sS92BzV/ljt1GRV+X
         pWUW2MAx4k//1B//Zk5C7lGZSBrrnsTxZHW8+QQ1ttSH+3PCyMkjDEKYCrIo1fnzj80X
         AmKg6hCCrqIdRfQJLHwCbZTmy7bXdZnxEglTealjScQkB06kMtk9fAoLZgRtc2W9HQts
         VXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706169549; x=1706774349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgHQziVKHREXn1KO8sOhxHpYyzc78sndffEbjiPRUfQ=;
        b=vqFXxePPQkyXSgWfgU3TH7bu4IFTjVNQuF/3jJeyP0HNjMq+tddR5vAGeFSRTENVhz
         jFCtWKBWGmsqhn9YwyJ6TSlmQF9A6zdDlwwFMqZ17qcfOqTkoNA+wsNWjLK+hpXxFxWD
         Ef2y++h63H5zyjl8vOKeUgGzejJhqYcb1WltwlrlK1cd5MDvwFe957LsJD6zchP6G2W8
         LRmZa5Sf2ZhemGxdURDQANWBuc+jlI+aXXz8mbm7UKrLTbom0yAp3NTp/I80cMxEp/qn
         39OYRNEswn3lwsEqv4Rs5fKceZQRV9miP+yR21CGOJ14X2kxRz++ebiWnUiqZxysJpHj
         XZEg==
X-Gm-Message-State: AOJu0Yw1NlCpfzWiUohYJk1zT+NmYt8Hunnjlaf94C14WyAmph7iMJDM
	L9i2G70ulhBtmD+LBT3TbaMjGxjHq9FKd+GEP/kvoaJBor5KbuU2Wl64bOlLeQ==
X-Google-Smtp-Source: AGHT+IEXI6vk4q8PkoL/yXfUBUc4H/PIDqIJcVsqyJcre1kD3mZLkDHIuBEeYkPIVQXsM2lz6UfX1Q==
X-Received: by 2002:ac2:44bb:0:b0:50f:f9bc:b248 with SMTP id c27-20020ac244bb000000b0050ff9bcb248mr115555lfm.165.1706169549304;
        Wed, 24 Jan 2024 23:59:09 -0800 (PST)
Message-ID: <6bb0ba9e-0f69-4e31-a99c-16a1ce94a9cf@suse.com>
Date: Thu, 25 Jan 2024 08:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: amend 'n' debug-key output with SMI count
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <50978ef4-9f11-4c70-952b-94107616f265@suse.com>
 <e6dcf78b-bd68-49bc-8711-381befc25f02@citrix.com>
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
In-Reply-To: <e6dcf78b-bd68-49bc-8711-381befc25f02@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 17:24, Andrew Cooper wrote:
> On 24/01/2024 3:27 pm, Jan Beulich wrote:
>> ... if available only, of course.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -406,9 +406,15 @@ void __init early_cpu_init(bool verbose)
>>  		paddr_bits -= (ebx >> 6) & 0x3f;
>>  	}
>>  
>> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
>> +	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) {
>> +		uint64_t smi_count;
>> +
>>  		park_offline_cpus = opt_mce;
>>  
>> +		if (!verbose && !rdmsr_safe(MSR_SMI_COUNT, smi_count))
>> +			setup_force_cpu_cap(X86_FEATURE_SMI_COUNT);
>> +	}
>> +
> 
> I know you're re-using an existing condition, but I think it's more
> likely that it's Intel-only than common to VIA and Shanghai.

Then again when re-using the condition I questioned how likely it is
that people actually use Xen on CPUs of these two vendors, when the
respective code is only bit-rotting.

> Also, why is gated on verbose?
> 
> (I think I can see why this is rhetorical question, and I expect you can
> guess what the feedback will be.)

Hmm, no, I don't think I can guess that. The reason is simple: In
case the MSR doesn't exist, I'd like to avoid the respective (debug)
log message, emitted while recovering from the #GP, appearing twice.
(Which imo eliminates the only guess I might otherwise have: Don't
add complexity [the extra part of the condition] when it's not
needed.)

>> --- a/xen/arch/x86/nmi.c
>> +++ b/xen/arch/x86/nmi.c
>> @@ -589,9 +589,20 @@ static void cf_check do_nmi_stats(unsign
>>      unsigned int cpu;
>>      bool pend, mask;
>>  
>> -    printk("CPU\tNMI\n");
>> +    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
>>      for_each_online_cpu ( cpu )
>> -        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
>> +    {
>> +        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
>> +        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
>> +        {
>> +            unsigned int smi_count, dummy;
>> +
>> +            rdmsr(MSR_SMI_COUNT, smi_count, dummy);
>> +            printk("\t%3u\n", smi_count);
> 
> This reads MSR_SMI_COUNT repeatedly on the same CPU.
> 
> You'll need to IPI all CPUs to dump the count into a per-cpu variable.

Oh, how embarrassing.

Jan

