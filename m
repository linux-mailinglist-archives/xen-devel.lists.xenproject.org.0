Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83936CAD86E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180818.1503935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScnU-0006SA-Sb; Mon, 08 Dec 2025 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180818.1503935; Mon, 08 Dec 2025 15:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScnU-0006PO-Pc; Mon, 08 Dec 2025 15:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1180818;
 Mon, 08 Dec 2025 15:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vScnT-0006PI-QP
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:05:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 476eda01-d447-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 16:05:05 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477a219db05so31803245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 07:05:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm238459595e9.15.2025.12.08.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 07:05:03 -0800 (PST)
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
X-Inumbo-ID: 476eda01-d447-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765206305; x=1765811105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qbvy8vPiPeBLmPIIJL9b1OwoeLYk8AFuNuzUbTevJis=;
        b=NRVmHqGlSFPjdycqrlbhRVB5Qt6VdpPa3p0gqXS4nQGnO7BWInAR3IoE/Lq74tK6Fc
         Ouiex2JvXVE4gOKc8k6mKU92q6DRUSnBmvbFa2hYrpoNGuZNb/dw1+ZrWTy4h/ybo06x
         qivUlwVliAuWCNhWttDMkLu5Q0Fz0SbxOLZVfVZouEuDS/aYBUdN2UsosDHr55Mr1xyR
         pk3nhkhWPns0LyJdDqkKlEZE8Eq6OaseMjEwlqY8VJO2UWvBGH10lUO7zhNJMgNO09T9
         kZawSAlfDvBk/dg0IYmDGrfFkOJe/AaC0npqTBldB/VqokexBEIwG2QRzVuNzPQotecR
         y0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765206305; x=1765811105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbvy8vPiPeBLmPIIJL9b1OwoeLYk8AFuNuzUbTevJis=;
        b=MIrmB4uf8Y+xmBwVVlaAFOoDLRPue6vk3TitQBExzNn2yvldNz+91O+qnAbWuogSOO
         Fa3zpw966QuaAnG1X46RTQn0Gmrv7OIKapx6Ysx9PMj4WxIWVy9JG5VsNDw3HiVIfH94
         xqDRsWrYOGvv4F+87opNx9mU68SKJrYAs0xxz8G8RetVC+58rBv3YpmvwCgJ560TuL1j
         CBqWiNoOrFs5LpsNelbW41dY1hDH8xKmyDr/SQUHOhIIguthYt7dwgglIyyVSD37WRHg
         /fWWpjUN0Fqk+yedluNVCELz0Dg9GwVgLS1YeMQbVuuClD392PCXjMJV9mik4SgVftf6
         ekrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAzy96lp0vOtqCx2TlqM6irgWAJ+kdyM+MWLR+5u00IBk7qEQWOVElihyvZDUL7hhbuUSwGfX2PFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9zd7b9o6poi+iTcU3AbN8bz39VRrJcHBPtdZw8DWG6l14y3pT
	YNRAXXrLKIfLR32VX85myaKkXfEBrNyPXOi9965eifBqPGu5dMMrDeHbwg7ffTC4Sw==
X-Gm-Gg: ASbGnctNSCzPcWDSx7b3UrNJPXLjJNO78KnGboEvFNAyen10y9MKgzvZTT6x5Dr0dut
	u6RB1X7y7xhCp9sq0WHkwpCjjZXtF439Oy6H46vLHnIt962wBneXY3NKlRYx60IDdjznjOyjz+2
	xVUYHDThp9jodjTM9tGyLfjXRrT0m6qBz64gPCHGgmiMnc8rYqfZo5x7onzAC+wIXChEiCPk64l
	sZ372eN3lGYmvM5QYRWaNnrrb/deLII0q/Wtf40vUOV9DT3FQhdU9ESljbxdw7oLVuffDTlvyAI
	qm+7lpERCXEiTDKW3XEP0f2WerMQUA9ZuPC0hYqaUfw7MLMPYAGOMSueGfdVHRBKiCiUza1Jbu0
	zn1JBnVPvng3cpuKjAWfnD3c77mTeYNcajeAenxMw1Ukqp7L1yMD29Oa6UG/1hsg5GpyajFRbsz
	vE45WJnb9DVeCRIF/byrDJ1Ci5xqHM3iPOX7dRnE9jmsES0Khd8X2PMvAUKi0/FkDUBuhmPtTUN
	2Q=
X-Google-Smtp-Source: AGHT+IF1EdYfXz2+VVZTWqGkJvfeYoxCmbR8+RkXcao7Zy+o/JbtfDBdQeGYae2CkT1ZlEN0T4EIcg==
X-Received: by 2002:a05:600c:c3cb:20b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47a7aa0175emr10536955e9.26.1765206304984;
        Mon, 08 Dec 2025 07:05:04 -0800 (PST)
Message-ID: <c3d2a4c4-f591-4bff-b978-18b8c09cf512@suse.com>
Date: Mon, 8 Dec 2025 16:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.12.2025 11:24, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -14,8 +14,15 @@
>  
>  #include <xen/cpumask.h>
>  
> -#define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
> -#define SBI_EXT_0_1_SHUTDOWN			0x8
> +#define SBI_EXT_0_1_SET_TIMER           0x0
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1

Why the padding adjustment when ...

> +#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
> +#define SBI_EXT_0_1_CLEAR_IPI           0x3
> +#define SBI_EXT_0_1_SEND_IPI            0x4
> +#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID  0x7

... you immediately have one that doesn't fit?

> --- a/xen/arch/riscv/vsbi/Makefile
> +++ b/xen/arch/riscv/vsbi/Makefile
> @@ -1 +1,2 @@
>  obj-y += vsbi.o
> +obj-y += vsbi-legacy-extension.o

No vsbi- prefixes please underneath vsbi/.

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
> @@ -0,0 +1,37 @@
> +
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +
> +#include <asm/processor.h>
> +#include <asm/vsbi.h>
> +
> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
> +                                     unsigned long fid,
> +                                     struct cpu_user_regs *regs)
> +{
> +    int ret = 0;
> +
> +    switch ( eid )
> +    {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        printk("%c", (char)regs->a0);

This is guest output, so shouldn't use plain printk().

> +        break;
> +
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        regs->a0 = SBI_ERR_NOT_SUPPORTED;

This will be overwritten with the return value you pass to the caller (i.e. 0),
by that caller (i.e. vsbi_handle_ecall()).

> +        break;
> +
> +    default:
> +        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
> +              __func__, fid, eid);

Please don't. domain_crash() may be okay to use here, but crashing the hypervisor
because of unexpected guest input isn't okay.

> +		break;

Bad indentation.

Jan

