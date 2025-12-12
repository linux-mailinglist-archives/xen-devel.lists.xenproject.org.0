Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11395CB8E51
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185382.1507544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36I-00006B-HO; Fri, 12 Dec 2025 13:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185382.1507544; Fri, 12 Dec 2025 13:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36I-0008Uw-EP; Fri, 12 Dec 2025 13:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1185382;
 Fri, 12 Dec 2025 13:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vU36G-0008Uq-Bg
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:24 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938263db-d75d-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 14:22:15 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso5409945e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f49da20sm31058195e9.5.2025.12.12.05.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Dec 2025 05:22:14 -0800 (PST)
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
X-Inumbo-ID: 938263db-d75d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765545735; x=1766150535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x0M381zZWIz+mEVFbM/UVlN+M9YheMvDpDXDv6hXtbI=;
        b=bkVM+V2sl8FSRhu2KRaNZQbxwmIkrQ6vIqSOaNYSuRtqCnxXstao8GCSqFXOL0Xy85
         kwOyM3DlQ4+T5lJ9FWVvK9tZZeFFWRl6ESnK3BH7BGnyDnDbZGmTYPoUT561i5fXndJ6
         rtiHiv/OpiY7GQFZRfe9C1giT5EX9o117jaTZK7CnUz7cJZbOn+XXYVetatruI6G3mxa
         BNA5JsLYCRDQAEF4Nu7imvxVm8YnjqcsX9XpMUTaI8WfhMhxPa1egb/TfUDS9cxmm/N9
         rHrimMknmurWy+MyybvmyIpIG8gf+9RYHj/9jaaWf15QMPgbxRNtV5dkoqMJG9LKU2FU
         VrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545735; x=1766150535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0M381zZWIz+mEVFbM/UVlN+M9YheMvDpDXDv6hXtbI=;
        b=L8pzS2eG5jSV1epsJmWUdNRsXpOUp+ap8ztLUQ/IzGp7F/5kM9DA9ezfeZRxK3nVuG
         9sm1prAHbJjSZuLjZiKi58Qbl0eniHiiKYljlhqoJ/BXNsyStNZTa41W5GTtKnzRwmy3
         Vt4iMvENkw6Jzj5+9yxPUwqnsjtMCzYahLQxCts5m3hjioZpkCQr661dYqGCcEboPL5C
         0gIf0ENvKU/JJWdeiOeK8/O1GXUIwwJsiflr+UomQOSNqjDk5pplFST+HM4p5NUHk+5S
         IsKyu3YP29/G7O1Pxto0laoYaM+fhRvxQb3DEQJuvlVV+4/IzIVqDY8v1E25RfVMZdVw
         WgGA==
X-Forwarded-Encrypted: i=1; AJvYcCUXilEUFbMr1yjUmJIP5uRvjtr/jcHPikGIWzZCeuYeEoPhE0PHJqeG+xj/o1GBtMWdjPSbGvCurQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfvDAVJLlBbz3g9DDpPkmaCVIlPxQzEjg30EZCUybhRpZrIKcO
	CgQ/pTuP+ZTnYvq3kBi+umfwQ4od5xfRcjQ1tisxbwypfgLptXUglbokj/45csRfLw==
X-Gm-Gg: AY/fxX7s1xZq1WjVyTUP2FNYt4mBDA9+i5+lRsxwXZTH4yNHRbr/+QCMbN3mjR1Pja3
	X8CrGFL6UvuYMh7SbGg06tux/3tP9apg7ILcojFB2M70rRszrg0Qd/R0hYwgyqo4Ihyidc8cPmQ
	/0A/uMybACXxaYjEugVj4OviGCL+VaA4tX3zY1r8CbOj1wRJG1xRiEZj6Iw468mRNQpo32QXQWA
	OvC5zANmUyXHPzEvweLXLL/mNL76n9poqT2Je7zL3Z8N8Neo2iOrIyuNeUu4zGlAjy3RjCajc3y
	spXA1rpi+P5bh1lNrlHYzI+E/YS03rnPKAvP6XaVmsiKkQeY8bHtiHRwSGjafK1ITqg7LX8bTxb
	zHCrHG2KH5EcNyoCdJB+PcS4D/P1neSlAv4l8auAejouUvMvrjR0K1nRX85CuEKokDGaPJd5CxH
	w/Uz3akvSyqZvJGeQwrH1AZTGVaTMTY/sgPWqg29qcJkc3lGvYRBFSDpHOccUkR5BEqbxLfpyVU
	KmBmO5DdbTglQ==
X-Google-Smtp-Source: AGHT+IG+BHySZRWbxYV8Woz7twcKuKlaHUpKMvt/xd8XDMIjeLe2TvaKdaqLP4/6i/S/qSDFQkSC0Q==
X-Received: by 2002:a05:600c:6d5:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-47a89ee31b7mr37404885e9.16.1765545734961;
        Fri, 12 Dec 2025 05:22:14 -0800 (PST)
Message-ID: <83eedd0c-dcaf-4e28-ac0f-f4991f053350@suse.com>
Date: Fri, 12 Dec 2025 14:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
 <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
 <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
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
In-Reply-To: <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 02:34, Jason Andryuk wrote:
> The alternative is section groups?  I'm trying that, and it kinda works 
> sometimes, but .attach_to_group fails when .init.text is involved.
> 
> Here's an example that I think would work, I could make it to 
> --gc-sectrions:
> group section [    3] `.group' [.text.vpmu_do_msr] contains 5 sections:
>     [Index]    Name
>     [   43]   .text.vpmu_do_msr
>     [   44]   .rela.text.vpmu_do_msr
>     [   45]   .altinstructions..text.vpmu_do_msr
>     [   46]   .rela.altinstructions..text.vpmu_do_msr
>     [   47]   .altinstr_replacement..text.vpmu_do_msr
> 
> But I don't make it that far.  Other files blow up with tons of:
> {standard input}:9098: Warning: dwarf line number information for 
> .init.text ignored
> and
> {standard input}:50083: Error: leb128 operand is an undefined symbol: 
> .LVU4040
> 
> Line 9098 of apic.s is .loc below:
> """
>          .section        .init.text
>          .globl  setup_boot_APIC_clock
>          .hidden setup_boot_APIC_clock
>          .type   setup_boot_APIC_clock, @function
> setup_boot_APIC_clock:
> .LFB827:
>          .loc 1 1150 1 is_stmt 1 view -0
>          .cfi_startproc
>          pushq   %rbp
> """
> 
> diff below.  Any ideas?

I haven't looked into this in detail yet, but ...

> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -90,25 +90,31 @@ extern void alternative_instructions(void);
>   /* alternative assembly primitive: */
>   #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>           OLDINSTR_1(oldinstr, 1)                                       \
> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
> +        ".attach_to_group %%S\n"                                      \
> +        ".pushsection .altinstructions.%%S, \"a?\", @progbits\n"      \

... wouldn't you need another .attach_to_group here and ...

>           ALTINSTR_ENTRY(feature, 1)                                    \
> -        ".section .discard, \"a\", @progbits\n"                       \
> +        ".popsection\n"                                               \
> +        ".pushsection .discard, \"a\", @progbits\n"                   \
>           ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>           DISCARD_ENTRY(1)                                              \
> -        ".section .altinstr_replacement, \"ax\", @progbits\n"         \
> +        ".popsection\n"                                               \
> +        ".pushsection .altinstr_replacement.%%S, \"ax?\", @progbits\n"\

... here? Or alternatively use the 'G' section flag to the specify the group
name?

As to debug info, I wonder whether playing with groups behind the back of the
compiler is going to work well. Iirc it groups sections itself, too. Did you
look at the generated assembly with this in mind?

Jan

