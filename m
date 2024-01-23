Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D708B838FAC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 14:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670461.1043241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGhG-0005iy-Ql; Tue, 23 Jan 2024 13:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670461.1043241; Tue, 23 Jan 2024 13:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGhG-0005hP-Np; Tue, 23 Jan 2024 13:20:10 +0000
Received: by outflank-mailman (input) for mailman id 670461;
 Tue, 23 Jan 2024 13:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSGhG-0005hJ-0T
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 13:20:10 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212ce1ef-b9f2-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 14:20:08 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso5987061fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 05:20:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056e02194800b003627f685d1dsm1255464ilu.39.2024.01.23.05.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 05:20:07 -0800 (PST)
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
X-Inumbo-ID: 212ce1ef-b9f2-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706016008; x=1706620808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNpkTzW8tlphLuctg+GxMzUFCbqwaCnOHkPrxRRG6I4=;
        b=J3NiO9KnoMm8/GDuDJnH6bk8XX68UobtET+QpknbNJP+TkynG1nGFQ6xmmuLBsVJ8/
         Dw6d6Copv6JYNZ9km9CMCUt4PgwlqGC7c5Hok8y6lcO3eOkXIZXLo+WvASLPsA0GiJUr
         A8vdyUs3HVEfjcSm6eqIkEDC9Bnp6K9Bh6QrIYb3FTaXyjOF89U4cHHSUkAJ/vsf7NBY
         Bs4s+22csi1GnQZi6mCamoxtTWoHHzWjR+RtNPqWpx6OXBMURNef1BRDEndD3Tq2RllS
         nwHRVSB69TSMteVjXJtmGqCqRSOv0/hqObJu754eDwL+FL3+IRU7avlATohF282zS1+C
         Byag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016008; x=1706620808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNpkTzW8tlphLuctg+GxMzUFCbqwaCnOHkPrxRRG6I4=;
        b=VQ4u0M/u2leUMYhn4eAMp0OgsXmLE8b8CVbWjT0usNk2bmcILZDZwP085ZtgMucOpe
         TE2Apw3obDvtqq3wCJ6eagXZAHr5YcFJVDLyEdpuj+yJEBEu+OR27GdpvzGXuj352lkX
         +zn2JkGdnuKhavVAdvt5dU/IDnfA7DWihi7mM+UPQVOnTA14tKbtDs/M42PwoFNeY3A9
         CaKNR4p6/EfhH2tuVCLUd9wXXpsTXynV+kZ2B264rlyWOcf7jO9UEgKaWGEw/k2SsG1k
         sYCEo6xt7/W4MDpeIHnSgl+m1UA8nWQoUpZz0p0atx+bdkz56VBmbPfDB0G0mZXt56FZ
         EBBw==
X-Gm-Message-State: AOJu0YzZT5+6O4y87966USkxCydc8/7QTPRJgfTpUODGmNMiE9ggX3wH
	bEoZu2kbQUvvgGHz/Pr6naUISGVZoYIoZolxmlNxNU3mpx3eX5MpRDxSXcwAVQ==
X-Google-Smtp-Source: AGHT+IH0uO5ZUAZB/FwbDupMMtqvMpu4Kmo/vwLFM711p489jBQhux/GdFHCOcUv3NK6WdJrg7ibWg==
X-Received: by 2002:a05:651c:116:b0:2ce:4d4:6f1c with SMTP id a22-20020a05651c011600b002ce04d46f1cmr2649880ljb.45.1706016008013;
        Tue, 23 Jan 2024 05:20:08 -0800 (PST)
Message-ID: <de4c3443-cede-487b-b3b3-28e92d3dc6e7@suse.com>
Date: Tue, 23 Jan 2024 14:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/34] xen/rirscv: add minimal amount of stubs to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <e40d3e396733ec9e85d72fc3e9f05be97881a763.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e40d3e396733ec9e85d72fc3e9f05be97881a763.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -40,171 +40,3 @@ void early_printk(const char *str)
>          str++;
>      }
>  }
> -
> -/*
> - * The following #if 1 ... #endif should be removed after printk
> - * and related stuff are ready.
> - */
> -#if 1
> -
> -#include <xen/stdarg.h>
> -#include <xen/string.h>
> -
> -/**
> - * strlen - Find the length of a string
> - * @s: The string to be sized
> - */
> -size_t (strlen)(const char * s)
> -{
> -    const char *sc;
> -
> -    for (sc = s; *sc != '\0'; ++sc)
> -        /* nothing */;
> -    return sc - s;
> -}
> -
> -/**
> - * memcpy - Copy one area of memory to another
> - * @dest: Where to copy to
> - * @src: Where to copy from
> - * @count: The size of the area.
> - *
> - * You should not use this function to access IO space, use memcpy_toio()
> - * or memcpy_fromio() instead.
> - */
> -void *(memcpy)(void *dest, const void *src, size_t count)
> -{
> -    char *tmp = (char *) dest, *s = (char *) src;
> -
> -    while (count--)
> -        *tmp++ = *s++;
> -
> -    return dest;
> -}
> -
> -int vsnprintf(char* str, size_t size, const char* format, va_list args)
> -{
> -    size_t i = 0; /* Current position in the output string */
> -    size_t written = 0; /* Total number of characters written */
> -    char* dest = str;
> -
> -    while ( format[i] != '\0' && written < size - 1 )
> -    {
> -        if ( format[i] == '%' )
> -        {
> -            i++;
> -
> -            if ( format[i] == '\0' )
> -                break;
> -
> -            if ( format[i] == '%' )
> -            {
> -                if ( written < size - 1 )
> -                {
> -                    dest[written] = '%';
> -                    written++;
> -                }
> -                i++;
> -                continue;
> -            }
> -
> -            /*
> -             * Handle format specifiers.
> -             * For simplicity, only %s and %d are implemented here.
> -             */
> -
> -            if ( format[i] == 's' )
> -            {
> -                char* arg = va_arg(args, char*);
> -                size_t arglen = strlen(arg);
> -
> -                size_t remaining = size - written - 1;
> -
> -                if ( arglen > remaining )
> -                    arglen = remaining;
> -
> -                memcpy(dest + written, arg, arglen);
> -
> -                written += arglen;
> -                i++;
> -            }
> -            else if ( format[i] == 'd' )
> -            {
> -                int arg = va_arg(args, int);
> -
> -                /* Convert the integer to string representation */
> -                char numstr[32]; /* Assumes a maximum of 32 digits */
> -                int numlen = 0;
> -                int num = arg;
> -                size_t remaining;
> -
> -                if ( arg < 0 )
> -                {
> -                    if ( written < size - 1 )
> -                    {
> -                        dest[written] = '-';
> -                        written++;
> -                    }
> -
> -                    num = -arg;
> -                }
> -
> -                do
> -                {
> -                    numstr[numlen] = '0' + num % 10;
> -                    num = num / 10;
> -                    numlen++;
> -                } while ( num > 0 );
> -
> -                /* Reverse the string */
> -                for (int j = 0; j < numlen / 2; j++)
> -                {
> -                    char tmp = numstr[j];
> -                    numstr[j] = numstr[numlen - 1 - j];
> -                    numstr[numlen - 1 - j] = tmp;
> -                }
> -
> -                remaining = size - written - 1;
> -
> -                if ( numlen > remaining )
> -                    numlen = remaining;
> -
> -                memcpy(dest + written, numstr, numlen);
> -
> -                written += numlen;
> -                i++;
> -            }
> -        }
> -        else
> -        {
> -            if ( written < size - 1 )
> -            {
> -                dest[written] = format[i];
> -                written++;
> -            }
> -            i++;
> -        }
> -    }
> -
> -    if ( size > 0 )
> -        dest[written] = '\0';
> -
> -    return written;
> -}
> -
> -void printk(const char *format, ...)
> -{
> -    static char buf[1024];
> -
> -    va_list args;
> -    va_start(args, format);
> -
> -    (void)vsnprintf(buf, sizeof(buf), format, args);
> -
> -    early_printk(buf);
> -
> -    va_end(args);
> -}
> -
> -#endif
> -

Aren't you transiently breaking the build by removing these here, rather
than in the next patch?

> --- /dev/null
> +++ b/xen/arch/riscv/stubs.c
> @@ -0,0 +1,422 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/cpumask.h>
> +#include <xen/domain.h>
> +#include <xen/irq.h>
> +#include <xen/nodemask.h>
> +#include <xen/time.h>
> +#include <public/domctl.h>
> +
> +#include <asm/current.h>
> +
> +/* smpboot.c */
> +
> +cpumask_t cpu_online_map;
> +cpumask_t cpu_present_map;
> +cpumask_t cpu_possible_map;
> +
> +/* ID of the PCPU we're running on */
> +DEFINE_PER_CPU(unsigned int, cpu_id);
> +/* XXX these seem awfully x86ish... */
> +/* representing HT siblings of each logical CPU */
> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
> +/* representing HT and core siblings of each logical CPU */
> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
> +
> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +/* time.c */
> +
> +unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */

__ro_after_init?

> +s_time_t get_s_time(void)
> +{
> +    BUG();
> +}
> +
> +int reprogram_timer(s_time_t timeout)
> +{
> +    BUG();
> +}
> +
> +void send_timer_event(struct vcpu *v)
> +{
> +    BUG();
> +}
> +
> +void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
> +{
> +    BUG();
> +}
> +
> +/* shutdown.c */
> +
> +void machine_restart(unsigned int delay_millisecs)
> +{
> +    BUG();
> +}
> +
> +void machine_halt(void)
> +{
> +    BUG();
> +}
> +
> +/* vm_event.c */
> +
> +struct vm_event_st;
> +
> +void vm_event_fill_regs(struct vm_event_st *req)
> +{
> +    BUG();
> +}
> +
> +void vm_event_set_registers(struct vcpu *v, struct vm_event_st *rsp)
> +{
> +    BUG();
> +}
> +
> +void vm_event_monitor_next_interrupt(struct vcpu *v)
> +{
> +    /* Not supported on RISCV. */
> +}
> +
> +void vm_event_reset_vmtrace(struct vcpu *v)
> +{
> +    /* Not supported on RISCV. */
> +}

Judging from the comments these last two are in their final shape.
Wouldn't it make sense to put them in vm_event.c right away then? And
then perhaps together with the two stubs?

Yet then - Arm gets away without vm_event_reset_vmtrace()? Can you
explain why the same isn't true for RISC-V?

> @@ -11,3 +15,24 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>  {
>      die();
>  }
> +
> +void vcpu_show_execution_state(struct vcpu *v)
> +{
> +    assert_failed("need to be implented");

Just to mention it again - the expectation is that all instances will
use the same "canonical" pattern for identifying yet-to-be-implemented
functions.

Jan

