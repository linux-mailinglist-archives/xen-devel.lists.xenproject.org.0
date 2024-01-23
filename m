Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF5838D88
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 12:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670395.1043142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF3d-00010J-QZ; Tue, 23 Jan 2024 11:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670395.1043142; Tue, 23 Jan 2024 11:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSF3d-0000xm-N8; Tue, 23 Jan 2024 11:35:09 +0000
Received: by outflank-mailman (input) for mailman id 670395;
 Tue, 23 Jan 2024 11:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSF3b-0000xg-WE
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 11:35:08 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7528d329-b9e3-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 12:35:07 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5100c3f7df1so125584e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 03:35:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a026f08000000b0046e7ae3fea8sm3655326jab.148.2024.01.23.03.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 03:35:06 -0800 (PST)
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
X-Inumbo-ID: 7528d329-b9e3-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706009706; x=1706614506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cusn68H+aGQpnnIylnk+29fUCequDEJhNWvww3NGtHA=;
        b=TiJEGXMtdwQQYFwdX3XWkGtlD+6FAQ8OhdOtsOde5IrtvjFLM+o4HCPu8nX0CKRquB
         RPF4iru1zntW+RXZNRGQmQadeZ1s9NBZTCOYae9gBUSdaKmLQsXrqyfiAPU6MOm6RL4X
         pq8uOeQX9XhihIJLTCl4TD4qYMWDKRHMhfZSxRT7a7yQ105uyR4GAMN6qzuc1AlfKh6f
         rOxZhNtPfS9DqRgArWG7p6uakYUovdR6zmmhK0KpPKRpu/HJ/tCAiGCH8nYyMwUeCr1h
         6Ein3VJWRc9qHlvmOEpnbZWTk64VL6EG2zkueWyChmtdUhX16ZkYTpRAFQpSU0+yXCS3
         rUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706009706; x=1706614506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cusn68H+aGQpnnIylnk+29fUCequDEJhNWvww3NGtHA=;
        b=jbDDPd4zFx/VcaJYVGKzQXPF5iq0jfg+683XfLhBMB0DQQrWX4uQigpxdj551HyFVw
         sx3cZ4IaaAJ9FC8IxjZm2ZP+zgYhCAuQfkkZvU2aMeY/8q9ZuyQgxDyjhdmIk+0iSI9c
         Q2liDzOiV7X4M4fpjl1lB1VSc3Sbtjvh13CRXo6jmGkG8tyiiaB3eLH0K1+A+DZXZAMv
         1C9PdaBOkFrBLlyFNkkf+HJasWdLwQyEUw6knrIUGoXEZquNYHw+C6lMtAt5XQGAXeqN
         lkojAWOOVqqX+bCGmy+Lo2NwmHfoLAA5cY3LBaBSaSFOEL3enDqhdwS5aK6va8+7nXAG
         SaJA==
X-Gm-Message-State: AOJu0Yz6IGq5AWVgUH/mb5Vy2y2h0dDCm9BeLOlCuHRtDemUTRa1ZLol
	ZqlFm+Y4EU5WiaJe8SBynhy4YHusKWC6rHJ0FLyp9exTvef6mJGDdhcTdsawHLW9Zklp1oyWHKc
	=
X-Google-Smtp-Source: AGHT+IErKQItdOt5rJBBbJjz3cQh7m0J2piWzbJSTpC2rUbYBQQaMn+DdovbqP1RvC82zDMOtfD7jw==
X-Received: by 2002:a05:6512:31c7:b0:50e:4e5f:6700 with SMTP id j7-20020a05651231c700b0050e4e5f6700mr2757494lfe.103.1706009706617;
        Tue, 23 Jan 2024 03:35:06 -0800 (PST)
Message-ID: <61450f5d-a723-4126-8e00-6e7155547e99@suse.com>
Date: Tue, 23 Jan 2024 12:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/34] xen/riscv: add required things to current.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <8fd8d3652eafabf5f5586de91d97ecae077b90ea.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8fd8d3652eafabf5f5586de91d97ecae077b90ea.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -3,6 +3,21 @@
>  #ifndef __ASM_CURRENT_H
>  #define __ASM_CURRENT_H
>  
> +#include <xen/bug.h>
> +#include <xen/percpu.h>
> +#include <asm/processor.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Which VCPU is "current" on this PCPU. */
> +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> +
> +#define current            this_cpu(curr_vcpu)
> +#define set_current(vcpu)  do { current = (vcpu); } while (0)
> +#define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
> +
> +#define guest_cpu_user_regs() ({ BUG(); NULL; })

Again with this changed to the "canonical" placeholder:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

