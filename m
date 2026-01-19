Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C14D3A1B4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 09:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208020.1520246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkiA-000482-Ge; Mon, 19 Jan 2026 08:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208020.1520246; Mon, 19 Jan 2026 08:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkiA-00045X-DQ; Mon, 19 Jan 2026 08:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1208020;
 Mon, 19 Jan 2026 08:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhki9-00045R-LD
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 08:34:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9efcc39e-f511-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 09:34:08 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801d98cf39so15812795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 00:34:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9d8ba8sm78309355e9.3.2026.01.19.00.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 00:34:06 -0800 (PST)
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
X-Inumbo-ID: 9efcc39e-f511-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768811647; x=1769416447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tkuiGBZS0YjW31rqeXS35kc3lMmLmi0YtGHC4cZOsJc=;
        b=YtsaEsBxWw2XygfYfg4uJkBCQM2JiLUT3YwDQtJcGa1HTeo1U7cJbF/SCkootIwrZK
         xEiD2NWg5LgTz7KeD/Gi1VNbp/tEbAjA8rEic/uPs/ispWBWTdiY2reVmFhlxRLuzdpK
         WbPHnfslm87uorI/0BWbCE5b9OEiVI4tsT2uk+axvIyXXPKa15in993f4ig97KV6LX4e
         nXq+X6DzWd+y0KpjnHMAnuBfqAbPHX2yaLiq4ZrvTRMVSNg4leUuKciSWp4l4kCEPD9f
         zjEdmtuQ1RT3n8ejWluCr4MgOMJv/20y4wDnc7V9sqpcbrWx3aKqyw0Vp6/yr0DGfVLy
         Jo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811647; x=1769416447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkuiGBZS0YjW31rqeXS35kc3lMmLmi0YtGHC4cZOsJc=;
        b=md2/qoYXh6aCy4cjymfpiuFXIcEn3dhRpF84sL/uMSr1jwaWugQVfGmYse9ojG1I/f
         OidI02p9BuPYaJji4vw6U0uDKh+hl26vw0UPnRqMO4bLLjM8dPvyzi1Ax8ygMDFWLUxq
         j6KKsJp0O2KKu07BVDsvv1uGDWJhbeGufWDaHXtlzjHLEmWWveqC8UUiiq2kTMNtrN1h
         XL7JPHYo37CRu4//uVEAjnScogdrfQ4tVQlT/v9Wgu9O67+4XpsVZWWAkX+ILk697M36
         ctPc1Xl7oNhN+qWr0DaqqGl9XSGMEekJqTzojs6XvtAqT6E42l/RCDs2cgUs/1Hdwl0N
         GCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsXEyhCYk7nQoOu/31vWy3WYBYpOw7WBDOMlcJKoMi0/lwOsSmnLUw/shwo8oNE6bYaGwstRkZ1vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+TtrXh3Dtt8HjPzEcC/HXlb/A8OO6vn2naBtBf2yoe+c3s7d0
	t9k5tDeI2PCSobtcn/uRw7m62DGFb61AVddWNM+6t7Hwez+/XfVmkSqDRkJMXqt99w==
X-Gm-Gg: AY/fxX6hSVjJNlOf4dy0OWLiuM62uhw+Xaxxy9XFH+BwLWSILmdvdqv97egp970AUmJ
	2HPWJHHgHyDcvog/Z/KU+9fnJMxk3yQ9ftuZBPOBB8X9Yyb/x3aQHTbhnjLyv5WDyqnQIygzmQ4
	yEz0sLtaOdmTP9y2OkF8nUbUEGjn9lAxMYX3+zsKu4sOThhdbvoyVCdDQzkOY2vTHbXmyAbwAZe
	Nq0oyNmP8WHfXH97xsUg9Df/t+D7ka3KbniuANNHB4RO27R1F2NCeUqjwueZ0ENfOLyrAzrFyzw
	vAV1i8Re8eQWOWq5m8lTl5nfpcBDgYYRdnbAnNROtNejPUFR8P81xmaAawJhGIDWypymzFgvmxR
	6TRBKxv5HuMA3dMsiybxW2brUIehcMZh/Oj3R6apnGRWHveVqMENgZvUf2xBjdJUcVs5FNnK+De
	B300/x9keC2UbUjb9Tm7WOEMpKngQjFC3vT4Ci4fFcQCK30g9oNbWX4DB+UkZLLxMs3F+kI2RZ2
	cQ=
X-Received: by 2002:a05:600c:4e92:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4801eb0426fmr127326205e9.24.1768811647317;
        Mon, 19 Jan 2026 00:34:07 -0800 (PST)
Message-ID: <843ba134-099c-49a1-8561-5e364b630bc8@suse.com>
Date: Mon, 19 Jan 2026 09:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: dump GPRS and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <f6f7ec863e92ade433f23ae0061391d2ef731f41.1768579139.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f6f7ec863e92ade433f23ae0061391d2ef731f41.1768579139.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 17:16, Oleksii Kurochko wrote:
> Provide more context on the exception state when an unexpected
> exception occurs by dumping various Supervisor, Virtual Supervisor
> and Hypervisor CSRs, and GPRs pertaining to the trap.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2
>  - Address coments about print_csr() macros and dump_csrs().
>  - Add dumping of GPRs pertaining to the trap.
> ---
>  xen/arch/riscv/traps.c | 82 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index e9c967786312..4e0df698552f 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -17,6 +17,13 @@
>  #include <asm/traps.h>
>  #include <asm/vsbi.h>
>  
> +#define print_csr(csr) \
> +    printk("\t" #csr ": %016lx\n", csr_read(csr));

This prints the CSR_ prefix of the internally used constants. Is this useful
(rather than extra clutter)? Unlike for the GPRs this also prints the register
names in upper case. That may be fine, or may not be. The values printed also
won't align, which may make reading more difficult.

> +#define print_gprs(regs, reg1, reg2) \
> +    printk("\t%-7s: %016lx %-7s: %016lx\n", \
> +           #reg1, (regs)->reg1, #reg2, (regs)->reg2)

Yes, two per line is certainly helpful. Why not also for some of the CSRs.

> @@ -99,12 +106,87 @@ static const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>  
> +static void dump_general_regs(const struct cpu_user_regs *regs)
> +{
> +    printk("\nDumping GPRs...\n");

Register names alone will be meaningful enough? Be mindful of serial line
bandwidth as well as screen resolution.

> +    print_gprs(regs, ra, sp);
> +    print_gprs(regs, gp, tp);
> +    print_gprs(regs, t0, t1);
> +    print_gprs(regs, t2, s0);
> +    print_gprs(regs, s1, a0);
> +    print_gprs(regs, a1, a2);
> +    print_gprs(regs, a3, a4);
> +    print_gprs(regs, a5, a6);
> +    print_gprs(regs, a7, s2);
> +    print_gprs(regs, s3, s4);
> +    print_gprs(regs, s5, s6);
> +    print_gprs(regs, s7, s8);
> +    print_gprs(regs, s9, s10);
> +    print_gprs(regs, s11, t3);
> +    print_gprs(regs, t4, t5);
> +    print_gprs(regs, t6, sepc);
> +    print_gprs(regs, sstatus, hstatus);

The last three aren't GPRs. Why would they be logged here? (All three also
being logged in dump_csrs() would further require some disambiguation in
the output, for people to not need to go look at the source code every
time.)

> +}
> +
> +static void dump_csrs(unsigned long cause)
> +{
> +    unsigned long hstatus;
> +
> +    printk("\nDumping CSRs...\n");
> +
> +    printk("Supervisor CSRs\n");
> +    print_csr(CSR_STVEC);
> +    print_csr(CSR_SATP);
> +    print_csr(CSR_SEPC);
> +
> +    hstatus = csr_read(CSR_HSTATUS);
> +
> +    printk("\tCSR_STVAL: %016lx%s\n", csr_read(CSR_STVAL),
> +           (hstatus & HSTATUS_GVA) ? ", (guest virtual address)" : "");
> +
> +    printk("\tCSR_SCAUSE: %016lx\n", cause);
> +    printk("\t\tDescription: %s\n", decode_cause(cause));
> +    print_csr(CSR_SSTATUS);
> +
> +    printk("\nVirtual Supervisor CSRs\n");
> +    print_csr(CSR_VSTVEC);
> +    print_csr(CSR_VSATP);
> +    print_csr(CSR_VSEPC);
> +    print_csr(CSR_VSTVAL);
> +    cause = csr_read(CSR_VSCAUSE);
> +    printk("\tCSR_VSCAUSE: %016lx\n", cause);
> +    printk("\t\tDescription: %s\n", decode_cause(cause));
> +    print_csr(CSR_VSSTATUS);

As before, imo justification is wanted (in the description) for logging
VS* values.

Jan

