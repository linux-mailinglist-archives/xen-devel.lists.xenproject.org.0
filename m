Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577DADF0F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 17:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019271.1396092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuYL-0000Vz-Vv; Wed, 18 Jun 2025 15:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019271.1396092; Wed, 18 Jun 2025 15:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuYL-0000Tq-SL; Wed, 18 Jun 2025 15:18:17 +0000
Received: by outflank-mailman (input) for mailman id 1019271;
 Wed, 18 Jun 2025 15:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKfJ=ZB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRuYK-0000Tk-JO
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 15:18:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74db6b4b-4c57-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 17:18:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso63331405e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 08:18:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a568b2ca65sm17308414f8f.77.2025.06.18.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 08:18:14 -0700 (PDT)
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
X-Inumbo-ID: 74db6b4b-4c57-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750259895; x=1750864695; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ntpbTrBDZCWO2gQg50I5OlZunvrht3kL0PIQzhroW8=;
        b=WUHU8Et4HwzeIhOybzPqdd6hm407hzg28yw3I9Lh1U675zyVVMPWOFaRcQfSoLK0v7
         hueHWwpATzYGoXLuy/9b6byOrhkkDhpbf96Yz7g0E6OfvNc3LnbevHLYIh7kiIeil5xU
         8wm0CiPaxHsYDlLkxHxquNMFFpXKkIQwkd6Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259895; x=1750864695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ntpbTrBDZCWO2gQg50I5OlZunvrht3kL0PIQzhroW8=;
        b=GIQ+tEEjlteKgtEQubNAVlC4FjF6wVO+lbO/WVat+HVeBeNJCPlNwQqVSeoSUfiKWg
         tFds7uYZjEYMVY5mr3R/CapPfRgl++nkuU2oaqlCwzz8vJxkLABCNjCak62AdjsbkE5G
         1iismTWDXQideXkrFvCS9QhdGnn/Tcu7CwjFA8ixp2UhfgrMSj25TNkZkHWFvFBPLmGw
         1fDVIXQaGubAL2z5G7p0QxGqR35R9Qe83dfa9lNPRlann731j6y4ZlW2CiYKNP5xZJ7P
         ruE/czyodr2MlmxUKJrEnm6rajkwm0JQW3o4gnfemEEiQbTzUGFfr5W+dbNiCom1PnyJ
         oK4A==
X-Gm-Message-State: AOJu0YzQ9SDTL+0XoagPedbu/HczlZ4YGojLo76YiG3fkXGRG47+st3U
	OxhLe35QTB/WakTxl+9nEs7M/OnSShVUi90b29wLczliaFeN0+rWbshsQCYzaTlQIjA=
X-Gm-Gg: ASbGncvUSubMJYSplmHzBugxGBrpMuyckStwQpMuD5tenBPOh59d1Z16eKzaL0+WkPx
	6XNOHsSPQQQRNIP0Cjbt3xKMznit+4J9eJ907iitqyd79JU1jVXzjPA7snTRt+5w/KjYfG1dgpB
	LLGtPU0AwV46Zv2oir49+WP7xaNzpA1DXstlyfqfQvCKwlrVDzKW2aIq5x/rCq7sdXDysAkOIMd
	ZlunVTQKAehyqwL1foMajLXkw6wNaCpmqMjgMXM25UQo/CdSf9y+nJ6YXoflUpRmxlHTGpZc6i+
	j68cJsYIpWIIgEQrFtR6C2s2AiDyqApPeGJBsV3v5CuH1M10t0nI3GwzR/TAWn4kMpkKPku3bAu
	BtumGvucHp4ULS4scy307yZzL4c1VyA==
X-Google-Smtp-Source: AGHT+IFu0LH4H9NtGHbcaIxfIU6bi7ybFxlWoWXVd8aIDKvrsRBJ0qjgdPEin96X2O3I6MhhiSwJhA==
X-Received: by 2002:a05:6000:2913:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3a57237de18mr14871336f8f.23.1750259894884;
        Wed, 18 Jun 2025 08:18:14 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:18:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: victorm.lira@amd.com
Cc: xen-devel@lists.xenproject.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
Message-ID: <aFLYtSgt5b4lQwgv@macbook.local>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
 <20250606212712.1901838-2-victorm.lira@amd.com>
 <20250606212712.1901838-3-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606212712.1901838-3-victorm.lira@amd.com>

On Fri, Jun 06, 2025 at 02:27:09PM -0700, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The marked functions never return to their caller, but lack the
> `noreturn' attribute.
> 
> Functions that never return should be declared with a `noreturn'
> attribute.
> 
> The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
> currently accepted in Xen), and also Rule 2.1: "A project shall not
> contain unreachable code". Depending on the compiler used and the
> compiler optimization used, the lack of `noreturn' might lead to the
> presence of unreachable code.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One question below.

> ---
> Changes in v2:
> - improved commit message
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/x86/cpu/mcheck/mce.c | 3 ++-
>  xen/arch/x86/efi/efi-boot.h   | 2 +-
>  xen/arch/x86/smp.c            | 2 +-
>  xen/arch/x86/traps.c          | 2 +-
>  xen/arch/x86/x86_64/traps.c   | 2 +-
>  5 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 1c348e557d..79214ce56b 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -79,7 +79,8 @@ static int __init cf_check mce_set_verbosity(const char *str)
>  custom_param("mce_verbosity", mce_set_verbosity);
> 
>  /* Handle unconfigured int18 (should never happen) */
> -static void cf_check unexpected_machine_check(const struct cpu_user_regs *regs)
> +static void noreturn cf_check
> +unexpected_machine_check(const struct cpu_user_regs *regs)
>  {
>      console_force_unlock();
>      printk("Unexpected Machine Check Exception\n");
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 0ecf4ca53f..0194720003 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -769,7 +769,7 @@ static void __init efi_arch_blexit(void)
>          efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
>  }
> 
> -static void __init efi_arch_halt(void)
> +static void noreturn __init efi_arch_halt(void)
>  {
>      local_irq_disable();
>      for ( ; ; )
> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
> index 516dab5528..7936294f5f 100644
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -343,7 +343,7 @@ void __stop_this_cpu(void)
>      cpumask_clear_cpu(smp_processor_id(), &cpu_online_map);
>  }
> 
> -static void cf_check stop_this_cpu(void *dummy)
> +static void noreturn cf_check stop_this_cpu(void *dummy)
>  {
>      const bool *stop_aps = dummy;
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 092c7e4197..34dc077cad 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
>            (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
>  }
> 
> -void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
> +void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs *regs)
>  {
>      fatal_trap(regs, false);
>  }
> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
> index c77f304bb0..8460a4a1ae 100644
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -293,7 +293,7 @@ void show_page_walk(unsigned long addr)
>             l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
>  }
> 
> -void asmlinkage do_double_fault(struct cpu_user_regs *regs)
> +void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)

Does noreturn matter for functions called from assembly (asmlinkage
ones)?  In that case the hint is not useful for code generation, since
it's hand written assembly already?  (it's arguably useful for the
developer writing the code)

Might be worth mentioning in the commit message if the above is
accurate.  For example by adding to the commit message: "noreturn is
not relevant for functions called from assembly, but can be used as a
hint for the developers writing the code".

Thanks, Roger.

