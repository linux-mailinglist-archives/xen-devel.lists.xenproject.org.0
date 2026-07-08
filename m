Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id suD6Ag9jTmryLgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:47:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563807278F5
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:47:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MZSo9tHg;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357122.1611618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTYk-0006Hz-3i; Wed, 08 Jul 2026 14:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357122.1611618; Wed, 08 Jul 2026 14:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTYk-0006G1-0W; Wed, 08 Jul 2026 14:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1357122;
 Wed, 08 Jul 2026 14:47:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whTYj-0006D6-5R
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:47:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whTYi-008hbk-2n
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:47:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e62fb-e002-0a2a0a5209dd-0a2a450aa7aa-16
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:47:31 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e6303-e40e-0a2a450a0019-d1558036ed42-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:47:31 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so7566505e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:47:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f40d50sm166797965e9.5.2026.07.08.07.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 07:47:30 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783522051; x=1784126851; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDhw7yyyh/pcOx2iTl0xYCUDtl4x3a5TTMn0Oh5uE6s=;
        b=MZSo9tHgvmzr8wqKPE32aJuw1tWvACLddEbbREW8iCPCogyTcS5WlhakYNw0pEisaU
         rYwS6I6eEhIbjPkk878DPo90lO7KIgVaDo/vEBUm8VG1ZOLckGw/Y2PhgWpUZeVXXnl6
         yL0jbO8ybAln39qHFhUMJHBaGRo+rf1p4C73gtmug717PtYn4a4bmxeptX/xd0abapl4
         AUPpp1E+8lh+2lVj26AAHQQ0927N+8Z92jBx+xKu/UDj7zRV1IaoFEulukyOkf2R1zA3
         BBm6HBADPzDshf5X6/1Li+9HgwlZaVSS9AozApBzSyS+DV2E8x+xh84/eAj8u24jrYJt
         e0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522051; x=1784126851;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDhw7yyyh/pcOx2iTl0xYCUDtl4x3a5TTMn0Oh5uE6s=;
        b=AQP93XSYOYKvnvNSJW/c1uPU7u8x/5uBgJyjqKe/vWpoRxFdeTzmuaCl2zBv+hnH96
         We2y30z9+KANt549DsWTroP+a8SOKRPmVIoTshD3oD8Vq6y240IctzmA1j0iHcbCDhSF
         Kkt+MSGR2WVV98U3uEJ2p9jO+W+kkBl2XtRvsNxqXu0Z/NwHves4TXC0sBr73QPg3mee
         D8CyDcphrSMwETh/AKltSmGUIFxx4hEjhVaMnbD1HEBbwgL4Fd5ujW5xjUFZ35+zDGsP
         MR//wfuIM9xS5F2vIcLlNsA5sRubHvtGxt0CWCWXxFzGDRfnNEdjSt8DqgikIom69rYw
         qq3w==
X-Forwarded-Encrypted: i=1; AHgh+RrFaLbjiya/dWHkSwu53Atn0yqmUOJR2mWO1fOFJVRiYHCOeIJDsNcV8jbzxJnSeSt2xbH6jG5eHZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrQom98FnZnzLBJu50QuXcJ+bqSec9a7qpugIGPErIYnJx0t2h
	oYg15Y1f6mMvOQpzReHqhlTj6OgJtAE6cWmU9qvadzi3wAJarOpa844qk668OhWpyQ==
X-Gm-Gg: AfdE7cli/w73GhRspSqbUwMMCSMGGVoFaiIMYIojLrWkcpX23CSduhycwlHPWCJj3oR
	T/B5e3RapK632l9YXIA+F2zmtF9R5yNYRL3xAfvK4PWjOFGUokHgWYrTeZB08QN9O89Svvv8Mf9
	4Dmx2d+5YQPfgjpL7z549X1qb6qbZEusWlPz2QizvMBiY3JfIzqiIcmndRSsUnHawFa8LHiOk3c
	dPmkI4EcBtdxNokhBl5WXB2/Pnp3WrdfCWjQBQuQSa3GamBhvEsmno66zD/RRRBRafwdG1qCeDi
	falFSWa/DtKttfyxChJVU7Sg6tH4bUuoRh6a8RXmdex4PHgv1BiIiw9qeIi1kaen2Tc55iHJABt
	UllORPvHTUkkvuzkEYLxCTHRvnhWbiVACMKNZk33tMnVPuQ7AXWlIBcHjaojHBpBSEBn5pVFHmI
	8FeSRTjJJyNwPlpQVuKrAtqXnFvz7L8Ce+vPuP2jXC8rcIgzK6ImErDiAeuYLBxJHCAt3ieOeT3
	dMB
X-Received: by 2002:a05:600c:34c3:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-493e689b37amr37619815e9.14.1783522051340;
        Wed, 08 Jul 2026 07:47:31 -0700 (PDT)
Message-ID: <41ae8496-03e6-4e39-bce9-e98e9db85c5d@suse.com>
Date: Wed, 8 Jul 2026 16:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20260703091544.183548-1-taka@valinux.co.jp>
 <20260703091544.183548-3-taka@valinux.co.jp>
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
In-Reply-To: <20260703091544.183548-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783522051-CFD33DDE-C6A14872/0/0
X-purgate-type: clean
X-purgate-size: 8423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,valinux.co.jp:email];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,lists.xenproject.org,suse.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 563807278F5

On 03.07.2026 11:15, Hirokazu Takahashi wrote:
> Make CPU topology information available to the Xen scheduler.
> Additionally, ensure that this topology information is displayed
> when executing the 'xl info -n' command.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v4
>  - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
>    that arch-specific definitions of cpu_to_core() and cpu_to_socket()
>    take precedence over the generic fallbacks.
>  - Introduce inline initialization functions for cpu_sibling_mask and
>    cpu_core_mask in cpu-topology.h, providing separate variants for both
>    when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.
> 
> Changes in v3
>  - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
>    from RISC-V and PPC processor.h.
>  - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
>    Elimination (DCE) where possible.
> 
>  xen/arch/arm/include/asm/processor.h   |  4 --
>  xen/arch/arm/smpboot.c                 |  8 +---
>  xen/arch/ppc/include/asm/processor.h   |  4 --
>  xen/arch/riscv/include/asm/processor.h |  4 --
>  xen/common/device-tree/cpu-topology.c  | 51 ++++++++++++++++++++++++++
>  xen/common/sched/credit2.c             |  3 ++
>  xen/common/sysctl.c                    |  1 +
>  xen/drivers/acpi/topology.c            |  3 ++
>  xen/include/xen/cpu-topology.h         | 45 ++++++++++++++++++++++-
>  9 files changed, 103 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index a3753c317f..41fa73cfc4 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
>  
>  #define cpu_relax() barrier() /* Could yield? */
>  
> -/* All a bit UP for the moment */
> -#define cpu_to_core(_cpu)   (0)
> -#define cpu_to_socket(_cpu) (0)
> -
>  struct vcpu;
>  void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
>                             struct vcpu_guest_core_regs *regs);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 5ce2bcf6ec..3c9f2a5c53 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -92,13 +92,7 @@ static int setup_cpu_sibling_map(int cpu)
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
>          return -ENOMEM;
>  
> -    /*
> -     * Currently we assume there is no multithread and NUMA, so
> -     * a CPU is a sibling with itself, and the all possible CPUs
> -     * are supposed to belong to the same socket (NUMA node).
> -     */
> -    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> -    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
> +    init_cpu_sibling_map(cpu);
>  
>      return 0;
>  }
> diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
> index 242346cab9..1bf6f6c66c 100644
> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -141,10 +141,6 @@
>  /* Macro to adjust thread priority for hardware multithreading */
>  #define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )
>  
> -/* TODO: This isn't correct */
> -#define cpu_to_core(cpu)   (0)
> -#define cpu_to_socket(cpu) (0)
> -
>  /*
>   * User-accessible registers: most of these need to be saved/restored
>   * for every nested Xen invocation.
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> index 6b89df4a2d..d478ffb76b 100644
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -54,10 +54,6 @@ struct cpu_user_regs
>      unsigned long pregs;
>  };
>  
> -/* TODO: need to implement */
> -#define cpu_to_core(cpu)   0
> -#define cpu_to_socket(cpu) 0
> -
>  static inline void cpu_relax(void)
>  {
>  #ifdef __riscv_zihintpause
> diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
> index b653227ef4..43322a153f 100644
> --- a/xen/common/device-tree/cpu-topology.c
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -330,6 +330,55 @@ int __init parse_dt_topology(void)
>      return parse_socket(map);
>  }
>  
> +static void __init setup_cpu_topology_ids(void)
> +{
> +    unsigned int cpu;
> +    unsigned int next_core_id = 0;
> +    unsigned int next_cluster_id = 0;
> +    unsigned int next_socket_id = 0;
> +
> +    for_each_possible_cpu(cpu)
> +    {
> +        unsigned int first_cpu;
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +
> +        first_cpu = cpumask_first(topo->thread_sibling);
> +        if ( first_cpu == cpu )
> +        {
> +            topo->phys_core_id = next_core_id;
> +            next_core_id++;
> +        }
> +        else
> +            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;

Not even an assertion to make sure first_cpu is within bounds, i.e.
topo->thread_sibling isn't (by mistake) empty? (Same again further down.)

> +        /* Reuse the calculated core id if clustering is not supported */
> +        if ( cpumask_empty(topo->cluster_sibling) )
> +            topo->phys_cluster_id = topo->phys_core_id;

Wouldn't the cluster better be uniformly the same value (perhaps 0) for
all CPUs when there's no clustering?

> +        else
> +        {
> +            first_cpu = cpumask_first(topo->cluster_sibling);

No need to use cpumask_empty() and cpumask_first(). The return value of the
latter allows to identify the "empty" case.

> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -9,6 +9,7 @@
>   * Based on an earlier verson by Emmanuel Ackaouy.
>   */
>  
> +#include <xen/cpu-topology.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
>  {
>  #ifdef CONFIG_X86
>      return cpu_data[cpu].x86_num_siblings;
> +#elif defined(CONFIG_CPU_TOPOLOGY)
> +    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;

Apart from the naming issue I continue to think that the generic case should
come first, and x86'es special case second. Yet then I'm not a maintainer of
this code ...

> --- a/xen/include/xen/cpu-topology.h
> +++ b/xen/include/xen/cpu-topology.h
> @@ -4,6 +4,9 @@
>  #define XEN_CPU_TOPOLOGY_H
>  
>  #include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +#include <asm/processor.h>
> +#include <asm/smp.h>

Blank line please between the xen/ group and the asm/ one.

> @@ -11,16 +14,56 @@ struct cpu_topology {
>      cpumask_var_t thread_sibling;
>      cpumask_var_t core_sibling;
>      cpumask_var_t cluster_sibling;
> +    unsigned int phys_core_id;
> +    unsigned int phys_cluster_id;
> +    unsigned int phys_socket_id;
> +    unsigned int num_siblings;
>  };
>  
>  extern struct cpu_topology *cpu_topology;
>  void init_cpu_topology(void);
>  
> +static inline void init_cpu_sibling_map(unsigned int cpu)
> +{
> +    if ( cpu_topology )
> +    {
> +        cpumask_copy(per_cpu(cpu_sibling_mask, cpu),
> +                     cpu_topology[cpu].thread_sibling);
> +        cpumask_copy(per_cpu(cpu_core_mask, cpu),
> +                     cpu_topology[cpu].core_sibling);
> +    }
> +    else
> +    {
> +        cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> +        cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);

Isn't this the same as ...

> +    }
> +}
> +
> +#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
> +#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
> +
>  #else /* CONFIG_GENERIC_CPU_TOPOLOGY */
>  
> -#define cpu_topology ((struct cpu_topology *)NULL)
>  static inline void init_cpu_topology(void) {}
>  
> +static inline void init_cpu_sibling_map(unsigned int cpu)
> +{
> +    /*
> +     * If CONFIG_GENERIC_CPU_TOPOLOGY is disabled, it is assumed that
> +     * all CPUs reside in the same socket and that SMT is not used.
> +     */
> +    cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
> +    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);

... this? Would be nice to avoid the duplication.

Jan

