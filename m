Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3FA826E2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944179.1342727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vyf-0007wm-BS; Wed, 09 Apr 2025 14:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944179.1342727; Wed, 09 Apr 2025 14:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vyf-0007uv-6z; Wed, 09 Apr 2025 14:00:29 +0000
Received: by outflank-mailman (input) for mailman id 944179;
 Wed, 09 Apr 2025 14:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Vyd-0007up-AL
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:00:27 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8c0d5a-154a-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 16:00:25 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so39692285e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:00:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm17038325e9.23.2025.04.09.07.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 07:00:24 -0700 (PDT)
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
X-Inumbo-ID: fc8c0d5a-154a-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744207225; x=1744812025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rUgA7s9cpFLpo96V+VxzjS9dKAekcYbXvrjflzVJVPE=;
        b=H0lFYTIkv2vsM+UUovNhfAkdfReGdXod1ZlCveK+48AoRh7hryRS2HZEEyFP9WgapK
         +kIB81iE+zqRD/IcFR+Toqw71z3woJ98Gy7fLPSXwUewrDbTC8b+mwurWE0vqB27iZFN
         bI1H1Foj3PdGE8cqe5mVGthhewYAl2D7W0dJFk6gN6g6XJxI6YmGxjS4BPs5/pGM8x7E
         lg50cezmrwQar6ejVJ9ABljuX+OBfb9XPcVO80gXUD/4Vy+QmiFGVXsF/EuZRb3uo970
         2fbQsOgsRP6DQES7jXD9FiEZbRisX7fYxnU6rf8MWAHG8jRbkcbSUfwlWQVBGQi0+kDW
         jcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207225; x=1744812025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUgA7s9cpFLpo96V+VxzjS9dKAekcYbXvrjflzVJVPE=;
        b=Y+HDAhIOvvSPqB6wwIvvcO2+XSAIcgtmvOPw7k7aEQw4WgGSBEsDxVDKWeGliFTlHm
         0iNlViYhP68uQk6TCCV//rQ/6wH1R0R10yvWNQ0s4LHtnYv34W+NQ2KedhDzbOlb8Dgz
         HZr/zOSWC/4ihLuavD1k2vZlHsEkco3T+JcHL3p6QfyRixMDrzQbnZz8cv/zoSvgy9QV
         8y16O4cEfHRIatiRyu8Zq7JLlsFkMyFHnVWjm50+9s9dRnxtwSlHSq2/yGvicUpD4+vw
         uDOTYLuK7Tsa+Mc5FLrtU1zoWAnh1RK1KgXDiAxwIaOe5dHO1w+Jr5iUmtKmVnZX9MZT
         O1iw==
X-Forwarded-Encrypted: i=1; AJvYcCW8AGLrNwswD/swj2bwciIbp0nv2hJOWOd9huwtSD3xjG80BHzeXbqLXcF39Whh6Q2lr53VllhrYpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydcxDQMpOOVX4i/3AFllKBRo6u+gf1Wvil/SdGz5BzQWJDPMH4
	uQw9UGpS7AiXCiz08AEhd4XiRUmsYfwWR065UDxHcBGidIKV/oOaOmWl4++tCg==
X-Gm-Gg: ASbGncuZxDsodJbaqfC0LbFN4b5TsFtq9hwhJOrYThSul9sEpXdcqM8P6h+2QS53fgs
	/S59izmzAYkIBJndAUvyF6DOoZ/CB+zQnqYbZ1CZ4A0cl4tPD2HWmh9n9WbdaH937SizmeTCurd
	F316cuTcd7AADMqO/B2WyunWBVXXYr7jXOiOZQbB9fhCv07rwp/HTn6D48q4MPZYQPauM5T//wS
	Ap+yQmhO3Yd1vUWcJEuM5FfmGn/uTH1gVBjKah+RsjwDMAKiHQ6MMhrME5euYYc/i7e2ZnNJgN7
	mxLF6EaCTorvfSSFCopnHNl1QSU8S/FD4BUEQMHdO592au5PVj26C0paTR6TPR1bKzwKkjnhDfO
	yxht+YMSTYvMUhplaqlaVxMIYQQ==
X-Google-Smtp-Source: AGHT+IHcM+CQPqmVw9ZBNXJimXO+t9QbE2HKt2zGEeVpwlD9IDGzMY+wQI5cVn7CUvW0/WOEzWFNsQ==
X-Received: by 2002:a05:600c:15d1:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43f1f78b5abmr17273715e9.8.1744207225235;
        Wed, 09 Apr 2025 07:00:25 -0700 (PDT)
Message-ID: <fd1d3e80-f0e8-4535-a395-06960d01a4ee@suse.com>
Date: Wed, 9 Apr 2025 16:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
 <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
 <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com>
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
In-Reply-To: <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 13:11, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 7:48 AM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
>>>      void *image_start = image_base + image->headroom;
>>>      unsigned long image_len = image->size;
>>>      unsigned long initrd_len = initrd ? initrd->size : 0;
>>> -    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
>>>      const char *initrd_cmdline = NULL;
>>>      struct elf_binary elf;
>>>      struct elf_dom_parms parms;
>>> @@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
>>>              initrd = NULL;
>>>      }
>>>  
>>> -    if ( cmdline )
>>> -        extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
>>> +    if ( bd->cmdline )
>>> +        extra_space += elf_round_up(&elf, strlen(bd->cmdline) + 1);
>>>  
>>>      last_addr = find_memory(d, &elf, extra_space);
>>>      if ( last_addr == INVALID_PADDR )
>>> @@ -778,9 +777,10 @@ static int __init pvh_load_kernel(
>>>      /* Free temporary buffers. */
>>>      free_boot_modules();
>>>  
>>> -    if ( cmdline != NULL )
>>> +    if ( bd->cmdline )
>>>      {
>>> -        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
>>> +        rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
>>> +                                    strlen(bd->cmdline) + 1, v);
>>>          if ( rc )
>>>          {
>>>              printk("Unable to copy guest command line\n");
>>> @@ -791,7 +791,7 @@ static int __init pvh_load_kernel(
>>>           * Round up to 32/64 bits (depending on the guest kernel bitness) so
>>>           * the modlist/start_info is aligned.
>>>           */
>>> -        last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
>>> +        last_addr += elf_round_up(&elf, strlen(bd->cmdline) + 1);
>>>      }
>>>      if ( initrd != NULL )
>>>      {
>>
>> Perhaps better introduce a local variable cmdline_len? That would allow the first
>> if() to go away (but of course not its body).
> 
> I'd agree if the function body was smaller, but it has 16 locals
> already. It's already quite hard to know what's going on, so I'd rather
> not make the situation worse.

You wouldn't: You'd replace one local var by another.

>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>>>      return n;
>>>  }
>>>  
>>> -static struct domain *__init create_dom0(struct boot_info *bi)
>>> +static size_t __init domain_cmdline_size(
>>> +    struct boot_info *bi, struct boot_domain *bd)
>>
>> const for both? And perhaps s/domain/dom0/ in the function name?
>>
>>>  {
>>> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>> +    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
>>> +
>>> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
>>>  
>>> +    if ( s == 0 )
>>> +        return s;
>>
>> While this retains prior behavior, that prior behavior was certainly odd (and
>> pretty likely not meant to be like that).
> 
> What part of it? How would you propose it to behave? Do you mean that if
> no cmdline is passed some ought to be allocated in case we want to
> override it?

"noapic" and "acpi=" want appending (if so intended) irrespective of there
being a non-empty command line already.

> Either way, such a functional change is better suited for a different
> patch that does just that, plus properly handling the acpi adjustments
> for PVH dom0.

Maybe. It's always odd to see issues live on when changes are made in their
area. For backportability, yes, the fix may want to be separate (and first).

Jan

