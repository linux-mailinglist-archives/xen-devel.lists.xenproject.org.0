Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E784683256D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 09:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668945.1041434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQjts-00040x-4p; Fri, 19 Jan 2024 08:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668945.1041434; Fri, 19 Jan 2024 08:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQjts-0003yf-1s; Fri, 19 Jan 2024 08:06:52 +0000
Received: by outflank-mailman (input) for mailman id 668945;
 Fri, 19 Jan 2024 08:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQjtq-0003yZ-NU
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 08:06:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b15fe7b3-b6a1-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 09:06:47 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33921b8988fso183960f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 00:06:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b0033609b71825sm5832356wrt.35.2024.01.19.00.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 00:06:47 -0800 (PST)
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
X-Inumbo-ID: b15fe7b3-b6a1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705651607; x=1706256407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GG3oevxlfpUsmrJF2OU1t02w4JQySSba6JkTX8CcDs=;
        b=AH6HJqvoWPTBQ7WN+4FFtG4UYRg4FqiaRDRzAOk7YMA+5WCnu7p+4zTZ0sbu3fQ851
         4mfCCfkJ+zCxUlmdhQL6DTjbBP1y/Kxjnytq2VKT02IMNhKpRNn5LUgBSAeMVKUj/y5l
         1PbyEYg5Sv1ismxT6yNwMrlG4P1edLq75wp9n3VUH+RzxYz2KV0j3aEC9Bdrqh3cSMF8
         pVzW9mi7Lso5CipzEy0mpS/JMnKqE3rHUN4nca3ZkpMzFN2tV6UZVGniBB6qIp/JWVPO
         3i4sqETxW+E02CnXPolImWoZa/HC4Pyz8x/Yoi0iuI+S77atbSPwPJrnlcWUWZj20yfs
         MkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705651607; x=1706256407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GG3oevxlfpUsmrJF2OU1t02w4JQySSba6JkTX8CcDs=;
        b=FS5ezk5YnAfpgIXtsSOpiuDu/NFQ9q8po1R+kg2LRIKEoqRFIojiXzja77HG9G+4YT
         4HWVP8JWWQPGCE3X2e20RfSjjD5+lDS9LJcPHTE1VKJKmyXgw8+qh623M16eyC/M0a1I
         CCYkdJHXXSZT/v3TjslVeO2XRTbmXEDfj30/lqTDTv0t319RZCSA139BZKYCOZNTZxsy
         cBrr+6mGSM1O8mYWYQ287cC0YSeXU+bOda59jivKrNJu61ZGp0126GKl0GSHr4djC9v7
         rLjld03zkBJGoTRdQFFTZgBliWhCEFZ5KSDXbDxU7TUSMwoRgjXtMKxMUrVp/SVBNLeT
         INBw==
X-Gm-Message-State: AOJu0YyHt9S3j50k7wvK9J6zcedZhimlboOLIxlcT24mL3uCqhU9ddCS
	m/Aaz9GAuTlocI8SqLA6MPd32F8z6dfCfoesN2xFX0VpWUKnL0NwsBCO+w3trw==
X-Google-Smtp-Source: AGHT+IFXvnE5QHk1aXl1+q0hBTGOwmtvZFRb3341bjufUFymElr7Ik6BklE6bxtxPCRGgDgJNh06UQ==
X-Received: by 2002:a05:6000:1086:b0:337:c872:7153 with SMTP id y6-20020a056000108600b00337c8727153mr1135624wrw.46.1705651607320;
        Fri, 19 Jan 2024 00:06:47 -0800 (PST)
Message-ID: <ceb07b66-8263-41b7-8c79-3cad89fc9400@suse.com>
Date: Fri, 19 Jan 2024 09:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] x86: annotate entry points with type and size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com> <ZaljqHduUIvsdbqm@macbook>
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
In-Reply-To: <ZaljqHduUIvsdbqm@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.01.2024 18:45, Roger Pau Monné wrote:
> On Mon, Jan 15, 2024 at 03:34:56PM +0100, Jan Beulich wrote:
>> @@ -625,7 +627,7 @@ ENTRY(dom_crash_sync_extable)
>>  
>>  /* No special register assumptions. */
>>  #ifdef CONFIG_PV
>> -ENTRY(continue_pv_domain)
>> +FUNC(continue_pv_domain)
>>          ENDBR64
>>          call  check_wakeup_from_wait
>>  ret_from_intr:
>> @@ -640,26 +642,28 @@ ret_from_intr:
>>  #else
>>          jmp   test_all_events
>>  #endif
>> +END(continue_pv_domain)
>>  #else
>> -ret_from_intr:
>> +FUNC_LOCAL(ret_from_intr, 0)
> 
> Why does this need to have an alignment of 0? There's no fallthrough
> of previous code AFAICT.

It doesn't have to, but see the description for where I thought it would
make sense to newly introduce alignment; I simply didn't want to go too
far with such changes leading to generated code being altered. This (and
the other cases below) weren't in that group. Without ...

>>          ASSERT_CONTEXT_IS_XEN

... this I would be strongly inclined to switch ...

>>          jmp   restore_all_xen

... to

#define ret_from_intr restore_all_xen

anyway. And perhaps we ought to change the "#else" above to
"#elif !defined(NDEBUG)", at which point I'd say alignment isn't required
here at all.

>> @@ -713,12 +718,14 @@ ENTRY(common_interrupt)
>>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>>          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
>>          jmp ret_from_intr
>> +END(common_interrupt)
>>  
>> -ENTRY(entry_PF)
>> +FUNC(entry_PF)
>>          ENDBR64
>>          movl  $X86_EXC_PF, 4(%rsp)
>> +END(entry_PF)
>>  /* No special register assumptions. */
>> -GLOBAL(handle_exception)
>> +FUNC(handle_exception, 0)
> 
> Given patch 8/8 that enables support for placing FUNC() into separate
> sections, the fallthrough arrangement here with entry_PF is no longer
> guaranteed, as the linker could re-order the sections and thus
> entry_PF could fallthrough into another text section?
> 
> IOW: entry_PF needs a "jmp handle_exception", and then
> handle_exception itself can be padded as required by the default
> alignment?

Oh, yes, very much so. Thanks for noticing. I'll do that in the later
patch, though.

>> @@ -1149,7 +1176,7 @@ GLOBAL(autogen_entrypoints)
>>          .endm
>>  
>>          .popsection
>> -autogen_stubs: /* Automatically generated stubs. */
>> +FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
> 
> Won't it be good to align the stubs?  As that's possible to make them
> faster?

Well. If I used default alignment here, it would be the 1st stub only
which gains alignment. I'd view that as simply inconsistent. You'll
find there already is an ALIGN inside the .rept below. That covers
only certain cases, but intentionally so, I believe: it's only entry
points which shouldn't be reached anyway which get no alignment. So
yes, in this case I clearly think there wants to explicitly be no
alignment here.

Jan

