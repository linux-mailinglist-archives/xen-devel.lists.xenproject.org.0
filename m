Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517EB21FCF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 09:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078356.1439339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljkv-0004y5-5j; Tue, 12 Aug 2025 07:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078356.1439339; Tue, 12 Aug 2025 07:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljkv-0004vC-2a; Tue, 12 Aug 2025 07:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1078356;
 Tue, 12 Aug 2025 07:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uljks-0004v6-Pn
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 07:49:10 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d49154fc-7750-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 09:49:09 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-615398dc162so8105069a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 00:49:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f00252sm19704071a12.8.2025.08.12.00.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 00:49:08 -0700 (PDT)
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
X-Inumbo-ID: d49154fc-7750-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754984949; x=1755589749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i3xqbItExMWt0y3cPFRImNwse14AAVMqn8awMMFn8/E=;
        b=QAbq5sHakWG30PdA1m9u1FJMmtlZIahJOgTTwnBu2796dO03NSyf07arihwpJRpDHu
         rjf8fQEN3+a8WKHJlwApt2xxkYT9AfnE1h6gTtkO02DOhNVobkNSnEl90od9X5TfIJmG
         EWIuiCBjww0yBq/btM8a/OHw73YZSiJ38vopv96LdaMgxJ5V6B1L3kjZGcuQg8SzPCsE
         2SiD6pn8V1gusRXeoVSN7yJAARQkdNbjog75q2CJosajgsXLpzjT4GrBdNNP91LJW7Ze
         fBsvjjLOc0h/Gxrvxw8fjLT2nIiK56wyej0RhR6tJdhmDuHVanWSN2HJ6ix7WDG8AWyY
         O/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754984949; x=1755589749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3xqbItExMWt0y3cPFRImNwse14AAVMqn8awMMFn8/E=;
        b=fcsCHVuBVKPHN0cuJX0iLnLarUXEjF9UAcolVp/YBwtnyA+SCRuwFk1hlrwdB/hX3i
         nZ2+ubbjG0UsIDfVDDagohAdjE3ErrT9ryaRLKEuZ8x41Q9dJLrysuR0O9Gh6DUZOkwJ
         axLiUZV9SXvt6S82K3h8ijvpFAZz2oVtFfWY7Zs4XO3b0kI8e9uxcPr7zjxkRIavhqsQ
         /3YvQrBgoMR5iPsr/tGmb1p+0kD05S3n531ogipJFFPfiKTUZbWufTxMcQ2s6Ef3faCX
         056FayfD5hMHalmUFzIRAOHHf2ViTrBxfs3ckb3urFI7tC/NJin3r5fwRyhw+KWajpVL
         NoQw==
X-Forwarded-Encrypted: i=1; AJvYcCVMglnRN1LHV5er4V6pVeV/PvbxINMSP8Nwk6p//LngZUUv9SczwvHPEN9xzQy0msbKRPhVzOPwbzY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/ENkfpJkCy82UM8Z2J1gFqDY1dOp5hq45/4WAstB1Lv9U2ux5
	Mp4c813l359cHCwIEvn5+k+3OIfywSEsuzAhdGlYLglS1aqWBFA1w37bMGwVUkQsDQ==
X-Gm-Gg: ASbGncu84vF2Is0lW1VnjxFCi634nnpELjbQNYJjxKM79RdC8uF10vMxLMm0mii/6Yz
	WXdwaSysFRxL+l1hN14ZMM19eNDOyN+SYiyqWY0iYe0RV1ziJD88nuMJc3ipWl7VWqOclAJ4AEs
	Ldiamykvcj4VW0d7RPXPUWglEdU7hRl45tl7MGvVP1rdBOmfX4v6xspNb00fxRukuPAK8MMrtoI
	HMUJnGjUA+40hK3IDHk6R5f6J6FVCASMasYsgGw+d5av3jW5olrBtJyY8fNsa22+FsRshc6CrSL
	wpLfXpvfiT0EBBwz0zpDaBvM7JD+NYL444Yso+oHA2RouQkCQUOEZuVbJYr1U86phWvlBkjORt1
	DpoTKg4d2+7wEPRfW0J0FVqlKcYRVOzGedYFm9u98YCLqtbH1YwWNEggb8ELRmVhxwvq3PMtBGw
	Y6CE7shqA3UEu1kNZipg==
X-Google-Smtp-Source: AGHT+IGZ72i6Rj1ILp7sIukW9X50Yx4C6ntvuB7bEFmaIndiWN9iUEmgWsZ1+dj4/eLXQBFnFT80lw==
X-Received: by 2002:a05:6402:3510:b0:618:1606:92ba with SMTP id 4fb4d7f45d1cf-6184ec8fafemr2057029a12.28.1754984948997;
        Tue, 12 Aug 2025 00:49:08 -0700 (PDT)
Message-ID: <0994e19c-a14a-4ff1-9d8c-f0b7a9d8f1e2@suse.com>
Date: Tue, 12 Aug 2025 09:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: comment default case in single-clause switch
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 19:36, Dmytro Prokopchuk1 wrote:
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -735,6 +735,11 @@ static int cpu_errata_callback(struct notifier_block *nfb,
>          rc = enable_nonboot_cpu_caps(arm_errata);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not require handling here.
> +         * The single CPU_STARTING action in the switch is sufficient because this function
> +         * specifically handles enabling errata workarounds during CPU startup.
> +         */
>          break;
>      }

Here and below - please obey to the 80 char line length limit set forth
by ./CODING_STYLE.

As to what the comment says: There not being a need to clean up is tied to
there not being any resources allocated during CPU_STARTING. Whether that's
the case is left unclear.

> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -436,6 +436,12 @@ static int cpu_gic_callback(struct notifier_block *nfb,
>          release_irq(gic_hw_ops->info->maintenance_irq, NULL);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not require handling here.
> +         * The CPU_DYING action specifically handles releasing resources acquired by
> +         * init_maintenance_interrupt(), when the CPU is being taken offline. Other CPU
> +         * actions do not require GIC-specific handling.
> +         */
>          break;
>      }

I don't think this suffices. What about CPU_UP_CANCELED or
CPU_RESUME_FAILED? It may well be that in that case
init_maintenance_interrupt() would never have run, yet imo such needs
stating explicitly.

> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -1828,6 +1828,12 @@ static int cpu_virt_paging_callback(struct notifier_block *nfb,
>          setup_virt_paging_one(NULL);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not require handling here.
> +         * The CPU_STARTING action is specifically handled because this function sets up
> +         * virtual paging for CPUs, particularly for non-boot CPUs during hotplug. Other
> +         * actions do not involve virtual paging setup.
> +         */
>          break;
>      }

See cpu_errata_callback() comment.

> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -382,6 +382,12 @@ static int cpu_time_callback(struct notifier_block *nfb,
>          deinit_timer_interrupt();
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not require handling here.
> +         * The CPU_DYING action is specifically handled to revert actions done in
> +         * init_timer_interrupt() and properly disable timer interrupts on the CPU being
> +         * taken offline. Other actions do not involve timer deinitialization.
> +         */
>          break;
>      }

See cpu_gic_callback() comment.

> --- a/xen/common/kexec.c
> +++ b/xen/common/kexec.c
> @@ -549,6 +549,12 @@ static int cf_check cpu_callback(
>          kexec_init_cpu_notes(cpu);
>          break;
>      default:
> +        /*
> +         * Default case left empty as other notifier actions do not require handling here.
> +         * The CPU_UP_PREPARE action is specifically handled to allocate crash note buffers
> +         * for a newly onlined CPU. Other actions do not pertain to crash note allocation
> +         * or memory preservation for kexec.
> +         */
>          break;
>      }

Yet when bringing down a CPU, these allocations are leaked. Looking at
kexec_init_cpu_notes() that appears to be intentional, but again - such needs
saying explicitly. Plus of course intentional leaks are always somewhat
questionable, so extra justification may be on order.

One further suggestion: Please consider splitting such patches at
maintainer boundaries. For the patch to go in as is, you need both Arm and
kexec approval. If you split, the part having got its approval could go in
without need to wait for the other approval to trickle in.

Jan

