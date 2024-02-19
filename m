Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF04859EA1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682701.1061810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzHD-0000ma-4c; Mon, 19 Feb 2024 08:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682701.1061810; Mon, 19 Feb 2024 08:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzHD-0000kF-1i; Mon, 19 Feb 2024 08:45:27 +0000
Received: by outflank-mailman (input) for mailman id 682701;
 Mon, 19 Feb 2024 08:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbzHA-0000k6-Pe
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:45:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37f443ba-cf03-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 09:45:22 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4125ea5d913so10151385e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:45:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b00412684fbcf3sm1145258wmo.28.2024.02.19.00.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:45:21 -0800 (PST)
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
X-Inumbo-ID: 37f443ba-cf03-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708332322; x=1708937122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdP1TeRLgjrOgSBURn92vZtVOatpVuwsVdPCFMn3gb0=;
        b=dRivTgH0mHPc1DSNHeQ39PFdp6SHJk07W7bzNihoZakaJvvkWU5kRe5Waq7Cx7mn/X
         I4OcR47VctQBKpRuJHFp0XEUYFyDQbybPg6ThboL8IXpOyeuc+/ls6WEzEa+o4BlAtC8
         EloHI5J2g+l+KdaG0/sS4/uh5V2N23IMI3qKSmkznJm7TpYio92cc2babA9bkNvDesaZ
         xnSSlf5YM+g7EckCeQ3uUdDIHw3L75eGlAjGR194XOBvqqaEcShT2v0dOWjkBYVrZWti
         6EuNy6a9E9qpvRutcEELhI4576txmQoQy7bPW9ViBWlraiixA5bZHtPLjnytSX+4Wozv
         SY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332322; x=1708937122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdP1TeRLgjrOgSBURn92vZtVOatpVuwsVdPCFMn3gb0=;
        b=bPWQJICXMl243Z4t9dfCrMR7pzw/36faYrQH1/L6G86raQeBUToLm3+0o9FF9C1/K/
         3gkU2zCvKJFOjfz6LEQnU/ltfi0dgdw5P0Erdfx/wTIMGaIsyd23ealc6ntFqfWmL5uD
         kz3bIT7kUhVg+ZXchzNkDm/GTsnijTY3Dkb/jxu4sAA09FtbxJuF+OOUc2ZuZR5ipPbo
         VgR27FI5icFPbwrstgtMH2mVjk2y+oFyjqbL9HiEnX04Vp9+vryHclE90eLOlmrNxNlx
         69f8UdqbCEpiT1r/LO+V5nfI+w2UZsjvMeGQipzLthE0NnIqzvnTPC6Oe+PYd+iWI5xE
         OPFA==
X-Gm-Message-State: AOJu0YzT0fsrOVFrknibcgwyubkfE/MslG/VZijVuU3zZVYzKQq662XF
	XJeR+1yZRXBt7ZU5VXNrXqJoKizfwvpC4ywgUSMMb4WSn4PtcX/lmm/UxXybQw==
X-Google-Smtp-Source: AGHT+IE01bjpheAN/hG6nFX8IxfRzDIONvgk+KiZUBUvE+zhDI8kikI92lLfk4tkTWFuSOJYw336eQ==
X-Received: by 2002:a05:600c:1ca1:b0:40e:f9df:3531 with SMTP id k33-20020a05600c1ca100b0040ef9df3531mr8124252wms.8.1708332322111;
        Mon, 19 Feb 2024 00:45:22 -0800 (PST)
Message-ID: <ab45f1e5-ed72-40cf-b485-e3682960587d@suse.com>
Date: Mon, 19 Feb 2024 09:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: amend 'n' debug-key output with SMI count
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <549909b7-e34c-4a5c-aa21-9892a1724042@suse.com>
 <Zc8mzlzLTJNwBJup@macbook>
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
In-Reply-To: <Zc8mzlzLTJNwBJup@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.02.2024 10:11, Roger Pau Monné wrote:
> On Wed, Feb 14, 2024 at 11:15:51AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -407,9 +407,15 @@ void __init early_cpu_init(bool verbose)
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
> 
> Why make it dependent on !verbose?  The call with !verbose is tied to
> part of the ucode loading being half-functional (for example
> MCU_CONTROL_DIS_MCU_LOAD not being set) but I don't see that as a
> signal that SMI count shouldn't be used.
> 
> does it need to be part of the early cpu initialization instead of
> being in the (later) Intel specific init code part of the
> identify_cpu()?

Yes, the condition was inverted. It could likely also be dropped
altogether; not sure which one's better: On one hand avoiding multiple
setup_force_cpu_cap() seems desirable (albeit not strictly necessary),
while otoh the code would be simpler without.

>> --- a/xen/arch/x86/nmi.c
>> +++ b/xen/arch/x86/nmi.c
>> @@ -585,15 +585,34 @@ static void cf_check do_nmi_trigger(unsi
>>      self_nmi();
>>  }
>>  
>> +static DEFINE_PER_CPU(unsigned int, smi_count);
>> +
>> +static void cf_check read_smi_count(void *unused)
>> +{
>> +    unsigned int dummy;
>> +
>> +    rdmsr(MSR_SMI_COUNT, this_cpu(smi_count), dummy);
>> +}
>> +
>>  static void cf_check do_nmi_stats(unsigned char key)
>>  {
>>      const struct vcpu *v;
>>      unsigned int cpu;
>>      bool pend, mask;
>>  
>> -    printk("CPU\tNMI\n");
>> +    printk("CPU\tNMI%s\n", boot_cpu_has(X86_FEATURE_SMI_COUNT) ? "\tSMI" : "");
>> +
>> +    if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
>> +        on_each_cpu(read_smi_count, NULL, 1);
>> +
>>      for_each_online_cpu ( cpu )
>> -        printk("%3u\t%3u\n", cpu, per_cpu(nmi_count, cpu));
>> +    {
>> +        printk("%3u\t%3u", cpu, per_cpu(nmi_count, cpu));
>> +        if ( boot_cpu_has(X86_FEATURE_SMI_COUNT) )
>> +            printk("\t%3u\n", per_cpu(smi_count, cpu));
>> +        else
>> +            printk("\n");
>> +    }
>>  
>>      if ( !hardware_domain || !(v = domain_vcpu(hardware_domain, 0)) )
>>          return;
> 
> Could you also amend the debug-key help text to mention SMI?

Hmm, I had considered that and decided against. I'm uncertain, nevertheless,
so could be talked into amending that help text. Just that I can't make it
"NMI and SMI statistics" as whether SMI data is available is conditional.
Yet "NMI (and maybe SMI) statistics" looks a little clumsy to me ...

Jan

