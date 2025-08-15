Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3188B27B09
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082972.1442651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpps-0005RB-6d; Fri, 15 Aug 2025 08:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082972.1442651; Fri, 15 Aug 2025 08:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpps-0005OC-2n; Fri, 15 Aug 2025 08:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1082972;
 Fri, 15 Aug 2025 08:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umppq-0005Mb-9U
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:30:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25809729-79b2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:30:49 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso283997466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:30:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53f49sm93900266b.7.2025.08.15.01.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:30:48 -0700 (PDT)
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
X-Inumbo-ID: 25809729-79b2-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755246648; x=1755851448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b8KdAPqjUc62YbZbRyUmVI1Fj7/jzssYQ+5o+G0d1u4=;
        b=Tc5i1jbi5pb3tLF7eXhcw2JSn3Snof6TzEQpDybcLEFbXf2hKJ4qK7fiZXZA52pa5U
         /LNeKNrTuXB5K86WVmBaODYkKhcidCZzuxO3DJQfoSwW6GmjyRLhGXYJOY2gDfJUTh0g
         mSOZOzYl3aWkBBxJxCQ7srHzAmCRdPABhtnMOJOafKz2Gncw62dAb8kIQR8tnyCAbpnS
         TmY/T43mOdxiHD148lT1NWH39vonElAmG3dV69U6Y+o/RM2ZIPcXxG994qNAvLC/JAkv
         bRbbTqKEUopq+IAF02qLpkVVPFXoZGcv8qIFLDF+nk0Sfp76gDXMy1AKD0pBrQpaHlqK
         1h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246648; x=1755851448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8KdAPqjUc62YbZbRyUmVI1Fj7/jzssYQ+5o+G0d1u4=;
        b=o/tO1Q4RBDCXizE1SoZTFUuBeFfqeiEWzUs2672HHfuiW8j8JRSczVd/wZYuWyoSxg
         ZPETDY3W/yTvUg/+0wSuDQekm26NKHyrlIwpGfJIz1+CHmctUHZxFBHxXHksSBljikjK
         SV54GmvPPGa7UEZtkZxryooXtznheOVT2yB+mw6KbiQ8uTQ24jlgejzGtvU7GuBJdQyO
         OLq5TSYUNhI0xo8M3RSNSrfqIrVIKiIgJO3rHvtrr7e3kmMi8ooRgz6X2CWDVfuCpUx3
         RuU6Fc0G0bGaBS4/K4ENGNBaFg6ULJwqFoent2Ma1VflVryqVOYvZccVtNpgcX57QZwi
         fI5g==
X-Gm-Message-State: AOJu0YwYjidQi4/t/xqtjGHw3GxIEfCSBH1viec102jtYzxBP+xi4TU4
	h9PSInF1F8CwcVqNNcvJ94A8pXL8tQweKFPNsfifOdVaLiG7djHujBexapkPVDmLCA==
X-Gm-Gg: ASbGncvE26IxYsAZPT/iU7ys7JBniqu16JYMvXQih8KU4DNLk8GMHp9qCRNKMTKsL5K
	4QZSUj2/E8WYWrO8V8ri+CY1g+2ntkcpGm9qfGh600ZLCPPjLEiLheD3XZLOxLA2oxJFSI5XqYf
	D505QOQrkb+RPXRjed6KePPOxwBLmiXQWiO3cNSL7pgh2bqTdX+Z+qpW0cVJyZmtFSwhhXtFiAg
	hdhZNxFTO9ZCELmZA+yZ7Np+M3MCcBlTQ0ehK630E8Q2RFALMh2LTJ0ZIDbCp9BAdtGt7x/BcO5
	6z++gBIqmWJtVJRxhGMjPWS3QxuTUG2z5DIhsJ1sIgx0fyqsd33gqy655mv+RuGfVDd8JAF9wSO
	okOfX9C9DbwMRWKmT2PefOgqsHCci4Jht971yKFMJIyGOFL6A7vJ4Q7YblZRoED8mr4QYrEwS/v
	TDrBCx9jc=
X-Google-Smtp-Source: AGHT+IFLdKx3RnmVUyVNLLMWTlDtpsJgjZ95X8+/E3fGx2IYIqo3pw8fYGG1XPOQQhMZVF7dqvshFg==
X-Received: by 2002:a17:907:788:b0:ad5:74cd:1824 with SMTP id a640c23a62f3a-afcdc35dff2mr103672466b.38.1755246648451;
        Fri, 15 Aug 2025 01:30:48 -0700 (PDT)
Message-ID: <75886e26-29b3-4aab-9780-7301330b4bb1@suse.com>
Date: Fri, 15 Aug 2025 10:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
 <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
 <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
 <0af415c5-df96-4715-a7e6-0d645e2e3a96@citrix.com>
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
In-Reply-To: <0af415c5-df96-4715-a7e6-0d645e2e3a96@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 20:20, Andrew Cooper wrote:
> On 14/08/2025 8:26 am, Jan Beulich wrote:
>> On 13.08.2025 13:36, Andrew Cooper wrote:
>>> On 12/08/2025 10:43 am, Nicola Vetrini wrote:
>>>> On 2025-08-08 22:23, Andrew Cooper wrote:
>>>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>>>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>>>>> --- a/xen/arch/x86/traps-setup.c
>>>>> +++ b/xen/arch/x86/traps-setup.c
>>>>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>>>>
>>>>>  void nocall entry_PF(void);
>>>>>
>>>>> +/*
>>>>> + * Sets up system tables and descriptors for IDT devliery.
>>>>> + *
>>>>> + * - Sets up TSS with stack pointers, including ISTs
>>>>> + * - Inserts TSS selector into regular and compat GDTs
>>>>> + * - Loads GDT, IDT, TR then null LDT
>>>>> + * - Sets up IST references in the IDT
>>>>> + */
>>>>> +static void load_system_tables(void)
>>>>> +{
>>>>> +    unsigned int i, cpu = smp_processor_id();
>>>>> +    unsigned long stack_bottom = get_stack_bottom(),
>>>>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>>>>> +    /*
>>>>> +     * NB: define tss_page as a local variable because clang 3.5
>>>>> doesn't
>>>>> +     * support using ARRAY_SIZE against per-cpu variables.
>>>>> +     */
>>>>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>>>>> +    idt_entry_t *idt = this_cpu(idt);
>>>>> +
>>>> Given the clang baseline this might not be needed anymore?
>>> Hmm.  While true, looking at 51461114e26, the code is definitely better
>>> written with the tss_page variable and we wouldn't want to go back to
>>> the old form.
>>>
>>> I think that I'll simply drop the comment.
>>>
>>> ~Andrew
>>>
>>> P.S.
>>>
>>> Generally speaking, because of the RELOC_HIDE() in this_cpu(), any time
>>> you ever want two accesses to a variable, it's better (code gen wise) to
>>> construct a pointer to it and use the point multiple times.
>>>
>>> I don't understand why there's a RELOC_HIDE() in this_cpu().  The
>>> justification doesn't make sense, but I've not had time to explore what
>>> happens if we take it out.
>> There's no justification in xen/percpu.h?
> 
> Well, it's given in compiler.h by RELOC_HIDE().
> 
> /* This macro obfuscates arithmetic on a variable address so that gcc
>    shouldn't recognize the original var, and make assumptions about it */
> 
> 
> But this is far from convincing.
> 
>>
>> My understanding is that we simply may not expose any accesses to per_cpu_*
>> variables directly to the compiler, or there's a risk that it might access
>> the "master" variable (i.e. CPU0's on at least x86).
> 
> RELOC_HIDE() doesn't do anything about the correctness of the pointer
> arithmetic expression to make the access work.
> 
> I don't see how a correct expression can ever access CPU0's data by
> accident.

Hmm, upon another look I agree. I wonder whether we inherited this from
Linux, where in turn it may have been merely a workaround to deal with
preemptible code not correctly accessing per-CPU data (i.e. not
accounting for get_per_cpu_offset() not being stable across preemption).
Yet then per_cpu() would have been of similar concern when "cpu" isn't
properly re-fetched after any possible preemption point ...

Jan

