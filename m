Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93363AB3828
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981434.1367830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESwS-0007b6-0F; Mon, 12 May 2025 13:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981434.1367830; Mon, 12 May 2025 13:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESwR-0007Y0-Sq; Mon, 12 May 2025 13:11:35 +0000
Received: by outflank-mailman (input) for mailman id 981434;
 Mon, 12 May 2025 13:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uESwQ-0007Xu-Q6
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:11:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f5f0279-2f32-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 15:11:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso853073466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:11:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd29f9fdc2sm2292434a12.4.2025.05.12.06.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:11:31 -0700 (PDT)
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
X-Inumbo-ID: 9f5f0279-2f32-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747055492; x=1747660292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ri7MrhNgClldSHZwYBLId7hYhTsIsGemJo+9YJa1G7c=;
        b=DcEKC2mxV/QN8HwFT+vMJRYwOatQ9FeMO2oGLPV5mpEZQdSG6+Z7ehokN0Byg6oV37
         d+xqFRcaq7zb9Y6QBuztbLQK2CM58yQ5Guy8EuECvebUqbEpSbLmcpV0+cPC61LmJLh+
         pIhGGX1lpj+vWSZc37UbjRGd+fWgcmAxb7SypG1I4+b819+il46RKz2oJjZoXzV33V4M
         9KXNKBjP6ZlhyeH+QSxemc/V3JlNVup5eck5Lyul9jbApDDkXnclckCre7aNf/IyVwPu
         KSJpP8WT5xTXinPTq9KAMiMVpl3FggvXyqpVQEkzXzNpe3D6LK1R2wBk+TKGL9Ja9JQh
         tjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055492; x=1747660292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri7MrhNgClldSHZwYBLId7hYhTsIsGemJo+9YJa1G7c=;
        b=eQvyrHpigW3fZQBtNhIqAxV24WoIJVfuaQFeLP5sYFWJxA5nxdWZrkAfRh8UPzZloP
         GgW7NRorm6b6YUqDRRvST7vKCu8vCY79ZgJKC5yRbB7bFtEyZuE6jpqyNf8TRoMmJMhK
         iL1fa/dYNqgFKeB07gIoBPkXcir2NWtE/4gGkQBq40vVQaUEyaj1oR6Dqvn7E2cPjxBb
         jiEcLFSarJRcyfXgh1yMA2hCgFcMW+LFY5heIEvAuQ7ZgXGM1Vi3xnfIFgky15MdHD76
         qSGK5mRzAlUVN0tf9AXE2p8kPfkDe4e4QwQiVG74CAaTpGm2sl7LUVkFuvzdWKgkX/wG
         dciw==
X-Forwarded-Encrypted: i=1; AJvYcCWLag96GeD70Vtzal+RtlMoH/M2RGZZKSA1kZr0Dsc8sHV4vmNrXbH+F39nQx8QnCevx4+/ISuoaYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJgu8+lniMR9A+Fo3+meKNaFu/Os+rZkP3xtf4XA+e+20Kg7+N
	icHtmpd2dwnWnofbHeICxeLT8t6UqdXEizzJ19XaaBy9nrQJtWD0Iemo7bLHSg==
X-Gm-Gg: ASbGncuAw5+39e7En7KVIA3YtaCVSWCGgdsTxT7fab4gL50IYJYQQWKQuquxiNBiOd6
	Y9grbGLmhaOONaD/MGNJ/p6MdS75XuiT0IVB/ncl9CMpjbpxtAtOfb1gQEXMk0dqqt02AiStpt7
	WOD21n/MeRgHhyAOeIf1D2vXZcaEimvZ/HvPBeJQbj4MXsgEe5XVqKB6MxamFc8XV2OhwesmvPC
	9vsLuheCUXfs9bICMYi+VMdpuDhKwa5lyF6pkaq8T3N9Ohe6SACwgCZr3hQdj1oAVdYVbw8Hcp6
	9JHqhj4gz8SrNf+BtoS8FlQo505w5aZR4mHAeyF2T+UQ6BDY/PwMqAigSZDuVWn4Zggb7ZmBWB6
	6Ys33feyPS7JFBJhyu6/6k7swmM8mqW+iVZUe
X-Google-Smtp-Source: AGHT+IFZEQllPc9mbdtmDR6Mvlca7IMg4bvgILHGwdaHdPdkktiW14Ee4dWrBtjQnppncRYj0f0VGA==
X-Received: by 2002:a17:906:f80f:b0:ad2:238e:4a1b with SMTP id a640c23a62f3a-ad2238e4b77mr980151266b.15.1747055492045;
        Mon, 12 May 2025 06:11:32 -0700 (PDT)
Message-ID: <71bdba1f-8e2a-4335-8302-b14fd1dcfe7a@suse.com>
Date: Mon, 12 May 2025 15:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/2] xen: add libafl-qemu fuzzer support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250507095338.735228-1-volodymyr_babchuk@epam.com>
 <20250507095338.735228-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250507095338.735228-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 11:53, Volodymyr Babchuk wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -78,6 +78,7 @@ extra-y := symbols-dummy.o
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/
>  obj-$(CONFIG_UBSAN) += ubsan/
> +obj-$(CONFIG_FUZZER_LIBAFL_QEMU) += libafl-qemu.o

This ought to move up into the list of (mostly?) sorted object files.

> --- /dev/null
> +++ b/xen/common/libafl-qemu.c
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +  This file is based on libafl_qemu_impl.h, libafl_qemu_qemu_arch.h
> +  and libafl_qemu_defs.h from LibAFL project.
> +*/
> +#include <xen/lib.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/spinlock.h>
> +#include <xen/libafl-qemu.h>
> +#include <asm/libafl-qemu.h>
> +
> +/* Generates sync exit functions */
> +LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
> +
> +    void libafl_qemu_end(enum LibaflQemuEndStatus status)
> +{
> +    _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
> +}
> +
> +void libafl_qemu_internal_error(void)
> +{
> +    _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
> +}
> +
> +void lqprintf(const char *fmt, ...)

At least this one looks as if it can be static. Anything which can be should
be made so.

> +{
> +    static DEFINE_SPINLOCK(lock);
> +    static char buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] = {0};
> +    va_list args;
> +    int res;
> +
> +    spin_lock(&lock);
> +
> +    va_start(args, fmt);
> +    res = vsnprintf(buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, args);
> +    va_end(args);
> +
> +    if ( res >= LIBAFL_QEMU_PRINTF_MAX_SIZE )
> +    {
> +        /* buffer is not big enough, either recompile the target with more */
> +        /* space or print less things */
> +        libafl_qemu_internal_error();
> +    }
> +
> +    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
> +                            (libafl_word)buffer, res);
> +    spin_unlock(&lock);
> +}
> +
> +void libafl_qemu_trace_vaddr_range(libafl_word start,
> +                                   libafl_word end)
> +{
> +    _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start, end);
> +}
> +
> +static int init_afl(void)
> +{
> +    vaddr_t xen_text_start = (vaddr_t)_stext;
> +    vaddr_t xen_text_end = (vaddr_t)_etext;
> +
> +    lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start,
> +             xen_text_end);
> +
> +    libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
> +
> +    return 0;
> +}
> +
> +__initcall(init_afl);

Please omit the blank line ahead of the __initcall() if that immediately
follows the respective function.

> --- /dev/null
> +++ b/xen/include/xen/libafl-qemu.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: MIT */
> +#ifndef __XEN_LIBAFL_QEMU_H
> +#define __XEN_LIBAFL_QEMU_H
> +
> +#include <xen/stdint.h>
> +#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
> +
> +#define LIBAFL_STRINGIFY(s) #s
> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)

We have STR() (and stringify()) - why would we need yet another macro?

> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
> +
> +typedef enum LibaflQemuCommand
> +{
> +  LIBAFL_QEMU_COMMAND_START_VIRT = 0,
> +  LIBAFL_QEMU_COMMAND_START_PHYS = 1,
> +  LIBAFL_QEMU_COMMAND_INPUT_VIRT = 2,
> +  LIBAFL_QEMU_COMMAND_INPUT_PHYS = 3,
> +  LIBAFL_QEMU_COMMAND_END = 4,
> +  LIBAFL_QEMU_COMMAND_SAVE = 5,
> +  LIBAFL_QEMU_COMMAND_LOAD = 6,
> +  LIBAFL_QEMU_COMMAND_VERSION = 7,
> +  LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW = 8,
> +  LIBAFL_QEMU_COMMAND_INTERNAL_ERROR = 9,
> +  LIBAFL_QEMU_COMMAND_LQPRINTF = 10,
> +  LIBAFL_QEMU_COMMAND_TEST = 11,
> +} LibaflExit;
> +
> +typedef uint64_t libafl_word;

Looking at its uses, this rather wants to be unsigned long as it seems.

Jan

