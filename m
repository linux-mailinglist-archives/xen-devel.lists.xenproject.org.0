Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E081355D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654669.1021825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDo3M-0005Qk-Dw; Thu, 14 Dec 2023 15:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654669.1021825; Thu, 14 Dec 2023 15:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDo3M-0005OY-BB; Thu, 14 Dec 2023 15:55:12 +0000
Received: by outflank-mailman (input) for mailman id 654669;
 Thu, 14 Dec 2023 15:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDo3L-0005OS-EF
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:55:11 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2810d5a0-9a99-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:55:08 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a1ec87a7631so737368466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:55:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 kt19-20020a1709079d1300b00a1d9c81418esm9721571ejc.170.2023.12.14.07.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:55:08 -0800 (PST)
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
X-Inumbo-ID: 2810d5a0-9a99-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702569309; x=1703174109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1AA9b8pPqAZkCqGNXQjvl1Q6dVf0lcKY67rRVMMh1Uc=;
        b=G3k+MYhrMzHdc/EMH0y67FQZhJDD3g1yC4nkj4snwZCePGO5bFfWKfoGZVaEFb7RrW
         TqDIxR1f+4uzuhAroEekGaAx6ETqRSfennTFvntibhP7VTkriEmhApc3MgitKLEW/0TS
         yEM8EGWrR284bs1WdwwJ3Yz2vHOrJdNCqX+5652Okj9o/ia+mdUFIQSL3vmX2NbW5ydm
         w32Waiw5a13nfYwV8dUsrKPKyPRdoWKubUP2YgHyTiA85zjcR77xj5xO75n9T5WjqLO7
         8Cz01skQLU4AiRNIOK+91SQFv9tpIaTNjeFkAgBSggjY/XuUjeGtPb2UjATIlcGtPtqW
         bACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569309; x=1703174109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AA9b8pPqAZkCqGNXQjvl1Q6dVf0lcKY67rRVMMh1Uc=;
        b=aDbKquyjaTMEcmJUt9oUn8oi86vR5mTcmYY+47JXFYdsx0IKZtnwfzwg7mV0wexcQV
         aEeZyMCwjm1EryZiZo62WGk0FFNlG6v+C9xeCbn/xGscw6uQcE0kawR/WW4y0RbJNir4
         PjKiK6QoCsS0AKIkNfdnqUUwAep8GNZWJ5vGo56VMvAIDBKhr1A5r9SXCzl+/SKH+3R6
         bQyOWBunmRxXFx4GvIHDcCYSJvdjY/H521IlOPsitP98c3xF24k9OnJtDhSV3f/ZFPdo
         6fJxOKq0luj0AQFkX+AGIV/1d8UaXtfgfGXSzwHShoUaqB1PfXR3Sdim283qh3jLTdW8
         4SiQ==
X-Gm-Message-State: AOJu0YwsNxGmFdFPSXO5Yu14uUFnU4SFYm+fMSk5brVDsY4C71/NeCb9
	EKaUfn9T8bF1ap0kYjfxbLdW
X-Google-Smtp-Source: AGHT+IHNMD56N3/X6z/zV/UmAiCq/D1amJFbKc1lStWNkYD6lHMKqe2xrGhlKAi3V2PQvnBhrHY3Pg==
X-Received: by 2002:a17:906:19:b0:a12:5e2e:d27a with SMTP id 25-20020a170906001900b00a125e2ed27amr5747261eja.0.1702569308789;
        Thu, 14 Dec 2023 07:55:08 -0800 (PST)
Message-ID: <8d089dbe-a411-4083-9540-d0c95fa183cf@suse.com>
Date: Thu, 14 Dec 2023 16:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: add required things to asm/current.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b6328d9b5bbb9269066dc17d7c0fcb32fa935b2b.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -3,6 +3,22 @@
>  #ifndef __ASM_CURRENT_H
>  #define __ASM_CURRENT_H
>  
> +#include <xen/percpu.h>
> +#include <asm/processor.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +struct vcpu;

I don't think you need this here?

> +/* Which VCPU is "current" on this PCPU. */
> +DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
> +
> +#define current            (this_cpu(curr_vcpu))

Nit: No need for the extra parentheses.

> +#define set_current(vcpu)  do { current = (vcpu); } while (0)
> +#define get_cpu_current(cpu)  (per_cpu(curr_vcpu, cpu))

Same here then.

> +#define guest_cpu_user_regs() (0)

0 or NULL? Also perhaps better 

#define guest_cpu_user_regs() ({ BUG(); NULL; })

until it's properly implemented?

> @@ -10,4 +26,8 @@
>      unreachable();                                          \
>  } while ( false )
>  
> +#define get_per_cpu_offset() __per_cpu_offset[get_processor_id()]

I'd like to remind you that there's no get_processor_id() anymore.

Jan

