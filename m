Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCDCF75C5
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195915.1513791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2oS-0004EW-TV; Tue, 06 Jan 2026 08:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195915.1513791; Tue, 06 Jan 2026 08:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2oS-0004D3-Qo; Tue, 06 Jan 2026 08:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1195915;
 Tue, 06 Jan 2026 08:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd2oR-0004Cv-Lr
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 08:53:11 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f94b95b-eadd-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 09:53:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so6555955e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 00:53:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f41f5e0sm31413165e9.8.2026.01.06.00.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:53:07 -0800 (PST)
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
X-Inumbo-ID: 1f94b95b-eadd-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767689588; x=1768294388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0LqFlE8Kjt3pdHwCM8kYgyPYzoed+FK5PjoEKPEg9pc=;
        b=Le6nQ0FGOA/aOrCsU8xlqJIe9Ddx2YosGm+czkLkHDTRWFNGtQyDBDNtCdlxVEG5FC
         Sl8NQ165ub2WDiMsxr8EL7vRpMF7JhEJ+4ruGtHHmWho0iooUnuXD2yX/ZIF2wU12s9i
         dKVZPYxQb6+Q4H7QbdL49NFu03pZJmJGQD2ARGag5MsEa3i8aMeRmR9e8np5xv/shh8K
         SLTxQmtmlV9eoxJIDgTCIIHFuqg6FwTpktj4HrzRPrFLiwNI5D4aws16vJpIkGlgaA3k
         1hrTTGm6pa+lPfWifA3KPTYzgOGEOxEbkyCZ6Kcrax4ZTMD2LsLoXFy+csoYE5TyQHn+
         Xuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689588; x=1768294388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LqFlE8Kjt3pdHwCM8kYgyPYzoed+FK5PjoEKPEg9pc=;
        b=Xxqf2dWD5SM2YJ3+bGbuP20PB1H8XMNVqNVvyS2DEZVZQu8vyZu/CL0S8lnLUzzXv9
         8QdkAubGc2Tj1dV7WTMtRgRORHhmEnIaZeuY/2MN8rMGjnHQWDjlVm5prMUmKjX+8wc1
         2kSMaCOByEg9Bh7mv84XPS4iuFymxyGjXtkAJRQzW778ZklxcCZYLIN6qHN99MzuUawF
         wQjHSECO0A7mtoYHIn60W27c1m+bc4uH6PSvFmHE1+UE2YvDEK0kYNSZef4MxZ62Ae4K
         bUgXFR8BLmIA6QoDVzJ0VgjvpfxbTW+5iUIL0VzHV1BaTN0GlKd6jPxPnp/rdHdsgeNC
         p6Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX/SE1SRanLRCQQScsD9zYAITk2SauhL53bKDh5w0OSO0oK/30p2SLVF+9rg0sU1hgil5bIlgH5Xq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIr+D9yFh9Eq0JjmjANSla82QLEKlaSZ7zIT1oC9uyHjLUjmrN
	ZZEQGYyDG9QY7y0YYiplW9OCOP0FEv5SqbCekdkpQa9tVLqboyTySuYZHqnPhYJfnQ==
X-Gm-Gg: AY/fxX7eM7yN4scK5v9k5yYzmgoCgTOwU5khKIMK/ti2twwXSLKgyP4/rluyPzyboB6
	il5TqcVXddrdZmmIpJ8ER0Q+W839qjut38JaW7ecgnWHlPJmUlQBpmZMaHkawrVwZFnbHvpV0hM
	0eq2tOOaV4VgKtSfzRTLR+Le4q6JrK9jHGtT34mAxwY6fyFP+i8AzUKHYN0cCigzRUxBOt4kA1S
	+IVn5xsGiAXua/T/sJ3E+t7rNyArFn0xRrNF6yNa2MvmhIqtEkvuStyOX4HybIcXiNCPsBzYvrS
	xJpNGYLYWBneHsv7m/tGKHOgWn9I+UXi8u2uzuL0D+XI3e3e4YHG8MJyWOG4R8WszmuhYHBwrIb
	P65Ya7gtpwKHcUbT8fNP7qFJp7emDY0tkrr7IHbwpJKV/Xy1b6jJlKgKRYPb5po6afcIHvPjzZX
	5JT3EDpDdQMyceNioy+zgDH3WbQOLeJFg2B427t0V1e7aAaONOTmbGG4+uOAksd6pSFQOAGZ0Vf
	APXWoHQDDUtHg==
X-Google-Smtp-Source: AGHT+IFWyVAHAd9pCAt+w6ij04HEm52pynKRPJKuyL2bntjr1G8NvG8/NTUyGadFo3z/J15COlTBtg==
X-Received: by 2002:a05:600c:4443:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47d821da708mr8940655e9.16.1767689588131;
        Tue, 06 Jan 2026 00:53:08 -0800 (PST)
Message-ID: <8561e1dd-492b-4d51-bf10-0a4523c941a8@suse.com>
Date: Tue, 6 Jan 2026 09:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
 <724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com>
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
In-Reply-To: <724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 09:43, Oleksii Kurochko wrote:
> 
> On 1/5/26 8:57 PM, Andrew Cooper wrote:
>> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
>> support for AMD Family16h") in 2013, despite there being 42 changes worth of
>> other cleanup/rearranging since then.
>>
>> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
>> opcontrol and the GUI and processor models dependent on it") in 2014, as part
>> of releasing version 1.0 and switching over to using operf based on the Linux
>> perf_event subsystem.  Linux's version of this patch was merged in commit
>> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
>>
>> Drop xenoprof and all supporting infrastructure, including the hypercall, the
>> XSM hook and flask vectors which lose their only caller, and even shrinks
>> struct domain by one pointer which wasn't properly excluded in
>> !CONFIG_XENOPROF builds.
>>
>> Retain the public xenoprof.h header as it is ABI, but note that the
>> functionality is removed.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> Despite appearing to be architecture neutral, the internals of Xenoprof were
>> entirely x86-specific.  Another curiosity is that only the VMX MSR hooks
>> called passive_domain_do_{rd,wr}msr(), and I can't see how this was correct
>> for SVM.
>>
>> The real reason for finally getting around to this is the number of MISRA
>> violations reported by the eclair-x86_64-allcode job that I don't feel like
>> fixing.
>> ---
>>   CHANGELOG.md                            |   3 +
>>   docs/misc/xen-command-line.pandoc       |   6 -
>>   tools/flask/policy/modules/dom0.te      |   2 -
>>   xen/arch/x86/Makefile                   |   1 -
>>   xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>>   xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>>   xen/arch/x86/hvm/svm/entry.S            |   1 -
>>   xen/arch/x86/hvm/svm/svm.c              |   2 -
>>   xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>>   xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>>   xen/arch/x86/oprofile/Makefile          |   6 -
>>   xen/arch/x86/oprofile/backtrace.c       | 145 ----
>>   xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>>   xen/arch/x86/oprofile/op_counter.h      |  41 -
>>   xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>>   xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>>   xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>>   xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>>   xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>>   xen/arch/x86/traps.c                    |   4 -
>>   xen/common/Kconfig                      |  11 -
>>   xen/common/Makefile                     |   1 -
>>   xen/common/compat/xenoprof.c            |  42 -
>>   xen/common/domain.c                     |   6 -
>>   xen/common/xenoprof.c                   | 977 ------------------------
>>   xen/include/Makefile                    |   1 -
>>   xen/include/hypercall-defs.c            |   6 -
>>   xen/include/public/xen.h                |   2 +-
>>   xen/include/public/xenoprof.h           |   2 +-
>>   xen/include/xen/sched.h                 |   3 -
>>   xen/include/xen/xenoprof.h              |  49 --
>>   xen/include/xsm/dummy.h                 |   7 -
>>   xen/include/xsm/xsm.h                   |   7 -
>>   xen/xsm/dummy.c                         |   2 -
>>   xen/xsm/flask/hooks.c                   |  35 -
>>   xen/xsm/flask/policy/access_vectors     |   4 -
>>   36 files changed, 5 insertions(+), 3743 deletions(-)
>>   delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>>   delete mode 100644 xen/arch/x86/oprofile/Makefile
>>   delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>>   delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>>   delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>>   delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>>   delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>>   delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>>   delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>>   delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>>   delete mode 100644 xen/common/compat/xenoprof.c
>>   delete mode 100644 xen/common/xenoprof.c
>>   delete mode 100644 xen/include/xen/xenoprof.h
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 3aaf5986231c..1663f6878ef2 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>      - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
>>        deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>>        2011 onwards.
>> +   - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>> +     prior to the version 1.0 release, and there has been no development since
>> +     before then in Xen.
> 
> LGTM:
> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md
> 
> Nit: It is necessary to drop the extra space before "  Oprofile themselves...".

Why would that be? See the other bullet point in context, which also uses a
two blanks after the inner full stop. This is deliberate.

Also - please trim your replies.

Jan

