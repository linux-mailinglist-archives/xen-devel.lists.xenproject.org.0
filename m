Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87584E075
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 13:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678170.1055236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3HF-0006ZI-6M; Thu, 08 Feb 2024 12:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678170.1055236; Thu, 08 Feb 2024 12:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3HF-0006Wv-3S; Thu, 08 Feb 2024 12:13:13 +0000
Received: by outflank-mailman (input) for mailman id 678170;
 Thu, 08 Feb 2024 12:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY3HD-0006Wp-GQ
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 12:13:11 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf774ee-c67b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 13:13:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b0ecb1965so1124397f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 04:13:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bn14-20020a056000060e00b0033b5a6b4b9bsm842507wrb.71.2024.02.08.04.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 04:13:08 -0800 (PST)
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
X-Inumbo-ID: 6bf774ee-c67b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707394388; x=1707999188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zijVtzTTJMWH7R5G6lvUwxpJR1glBtEArYNbKa6Ng9s=;
        b=U9/pJMKkmmdIiKp+L7dlH2oCjEiw7EelQGbCGdobhlWXLtBjc7fT1STTARRC6Fuj4S
         g1kbLQIL6fB1pXr9Iyely0reUw8/KC8sPZDFFlLR4xFvPo04GQ3ijq+ZZcJ0s+3/ILdA
         rlpM1SIG/SMPdAcTfGKSoUYtgiKrTU9tUD2G9/ZmGuwjs+kXH/DPWq9MoReJsGt0XZPS
         NwUG2mRRLiPJiqK+WcJRUH99vu1/TvZGqaehx+AdgJH+bceocjddkWX7J4l9NKZQTyUj
         KzoauQFTp6qkd2NUT6FYiy4nvXx4aZNNAutqnYVxYKRD3pEPD47hkeIhSolcT4SBFbZj
         Y8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707394388; x=1707999188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zijVtzTTJMWH7R5G6lvUwxpJR1glBtEArYNbKa6Ng9s=;
        b=DjzUoL05jvFf+ld/UzDAji6Rj9s3DXUX+u2mSjUC3AAL9Zb+3m0g635nVOzO+FmYP3
         608PfU+aOqXzCMjrD+JHGlOrvqwPL9auLo8Bul/ndDCjpqA0nqIvdx3Uvutnmpg6KDLZ
         AevMfchbOprCjyAocsC1VSI+Grz3w0fnJ1vFAEitONRvBV+0Nm7hxxVZq+3GraPeGmm/
         mv80bZsb9CD58Uh0BaFOl3gIYeZxyGdLDgkZ4Ael86YmyYRYRVoEzTgcaZFfnP2DCiyk
         ZBnE3gW1M5/WDOK5/1mb2VVd5mBB0X3kmkY33e5ZzbpKDLtOimd5MQWmhpzXzVDcGHdT
         xs2g==
X-Gm-Message-State: AOJu0YxXx1LDIbFAEChQGaCTRzLOiS77XBCla1GWHkNiBcqk7VsRR9vo
	nGbBQ8NJ8H8bvtxkMxSXrcTXmUpVxBFutxkyrZDT2dVMojD0mNQHjjfROzQHTQ==
X-Google-Smtp-Source: AGHT+IEo8wydfTyw7UcbA5yEJSrqGRir9w5aIsKii2VVd44MvBAo1OTrUN5UfM5Ujb0liTDxGHay1g==
X-Received: by 2002:a05:6000:4014:b0:33b:597a:5018 with SMTP id cp20-20020a056000401400b0033b597a5018mr1270925wrb.71.1707394388483;
        Thu, 08 Feb 2024 04:13:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi+NyBq7EoM4oTxqySKuZ37QiGAb1oaYoLZ+VagRg6TVp+EBC1dEZDY/V7+4Rd59oTetjX8fhjIEKthV/mgls3MS/lSUuHm2ZFvtm5jkB8va4qgzW8RmbWLfsx33DyLc6j6UOVgav8+g1p8QVoxDal
Message-ID: <c1e23e38-aaac-44c5-a1af-999f71909110@suse.com>
Date: Thu, 8 Feb 2024 13:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 8/9] x86/smp: make cpu_state per-CPU
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <52083114d4cbbc75f021e8c61763ad0e166cf05b.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <52083114d4cbbc75f021e8c61763ad0e166cf05b.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> This will be used for parallel AP bring-up.
> 
> CPU_STATE_INIT changed direction.

Nit: I think you mean "changes" as you describe what the patch does, not
what has happened before. But ...

> It was previously set by BSP and never
> consumed by AP. Now it signals that AP got through assembly part of
> initialization and waits for BSP to call notifiers that set up data
> structures required for further initialization.

... all of this is, afaict, independent of what the title says the
purpose of this patch is. Since the correctness of the state change
adjustments doesn't look straightforward to prove, please split the
mechanical change from the change to the actual logic.

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -38,6 +38,7 @@ struct cpuinfo_x86 {
>      unsigned int cpu_core_id;          /* core ID of each logical CPU */
>      unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
>      void *stack_base;
> +    unsigned int cpu_state;
>      unsigned short x86_clflush_size;
>  } __cacheline_aligned;

Is there any reason this cannot be ordinary per-CPU data?

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -65,15 +65,18 @@ struct cpuinfo_x86 cpu_data[NR_CPUS] =
>          { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
>  
>  static int cpu_error;
> -static enum cpu_state {
> +enum cpu_state {
>      CPU_STATE_DYING,    /* slave -> master: I am dying */
>      CPU_STATE_DEAD,     /* slave -> master: I am completely dead */
> -    CPU_STATE_INIT,     /* master -> slave: Early bringup phase 1 */
> -    CPU_STATE_CALLOUT,  /* master -> slave: Early bringup phase 2 */
> +    CPU_STATE_INIT,     /* slave -> master: Early bringup phase 1 completed */
> +    CPU_STATE_CALLOUT,  /* master -> slave: Start early bringup phase 2 */

It's not really clear to me whether the adding of "Start" on the 2nd line
really adds value.

>      CPU_STATE_CALLIN,   /* slave -> master: Completed phase 2 */
>      CPU_STATE_ONLINE    /* master -> slave: Go fully online now. */
> -} cpu_state;
> -#define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
> +};
> +#define set_cpu_state(cpu, state) do { \
> +    smp_mb(); \
> +    cpu_data[cpu].cpu_state = (state); \
> +} while (0)

While you merely re-arrange it, I'd still like to ask: Does this really
need to be smp_mb(), not just smp_wmb()?

> @@ -320,6 +317,10 @@ void start_secondary(unsigned int cpu)
>  
>      /* Critical region without IDT or TSS.  Any fault is deadly! */
>  
> +    /* Wait until data set up by CPU_UP_PREPARE notifiers is ready. */
> +    while ( cpu_data[cpu].cpu_state != CPU_STATE_CALLOUT )
> +        cpu_relax();

I'm afraid I don't understand the comment (and hence whether this loop
is actually needed here): __cpu_up() is called only after those
notifiers completed.

> @@ -1161,6 +1171,12 @@ void __init smp_prepare_cpus(void)
>      cpu_data[0].stack_base = (void *)
>               ((unsigned long)stack_start & ~(STACK_SIZE - 1));
>  
> +    /* Set state as CALLOUT so APs won't change it in initialize_cpu_data() */
> +    boot_cpu_data.cpu_state = CPU_STATE_CALLOUT;

This is actually one of the reasons I don't like you putting the item
as a new field in struct cpuinfo_x86. Otherwise imo initialize_cpu_data()
ought to gain a respective assertion.

Jan

