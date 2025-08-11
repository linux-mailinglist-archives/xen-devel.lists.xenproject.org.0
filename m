Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED4B20190
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077059.1438148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNj9-00088Q-OJ; Mon, 11 Aug 2025 08:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077059.1438148; Mon, 11 Aug 2025 08:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNj9-00086U-Kg; Mon, 11 Aug 2025 08:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1077059;
 Mon, 11 Aug 2025 08:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulNj7-00086I-8c
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:17:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac3f80ff-768b-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:17:51 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so3611705f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:17:51 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm31174068f8f.43.2025.08.11.01.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:17:50 -0700 (PDT)
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
X-Inumbo-ID: ac3f80ff-768b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754900270; x=1755505070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g9PMvwxCExZeAokalVGUH3LPbAT7/E9R+VBk5rApJFs=;
        b=qLlGWLrDiplLfsPi266fFhFjoZoHxNx9Oj/V8oGMY84opSbfbDLsdL3a9prvWzNXMq
         Zpefla/FT8fgJzcAByFQ4UIwMIEgDmX8n//IBou1l05Z6qGtZhQTvVbYhT1p5wEze2Le
         BVpqylespRXWOcOXJfJ7KmntyaoEO9MPbzyeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900270; x=1755505070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9PMvwxCExZeAokalVGUH3LPbAT7/E9R+VBk5rApJFs=;
        b=Qtn4tPpIenz548tXflmtWz6GrmwEjTbjusMfkLVE2/srIzAkdbdz1K8zm8g+xL0mew
         lJxkUCPmudxpZ8r9jvtIPxlDWGmw5CQ4XSPhmDDH4Pr3mqJBB1WUwVUSbsptS0PoQdAN
         uWhCpNpl+jlUpcP6gMxQ8NmGzronZ6SwmSPF5f3ssnKD73J0dThR3hW98TBDR6/3e1ae
         1woHSR4KZJbKccpJNj5X6ujN/s/MtqnCTcyQ75E8qpKRVeuTiOD7OeOPmNwFNCjwG1vb
         N1HADX++f5IXIgkKC4jq54XROzSn66H0LzmmWCdj7Zjnj5/Bt8enxh/ASO3XJoSF+/Xp
         NP5w==
X-Gm-Message-State: AOJu0YxuC9kzNwaN7O2wd3IN1kwnS0zu1WnDJbvUtuCzfZS8veOsHnyT
	5sq6oam5vuolXGyEUUqpLEmxIwzdnfenpJGMRwWevDGkEhJJaUDaS/6mSCmVAVmR4ZAXM8/BDUx
	ncNEdWRM=
X-Gm-Gg: ASbGncuvFnvACgEltGDv+fewV6ZwgiQLuiFkWkZCWC8uelQ5zhgi1Mn1VsTEsvncPKk
	Z6t6oqcurG45CbqPZPgJWWHOVbJ0XE81SRipiC5MfExjRSoAvkuzmtTIedPmouAZarFWjBFVWd7
	Uy4uwiQiGSBJG9g+uYmx3d8mueIN0MP6WAW3FpFRkXyn/oGnHK5ZD8n9ktXLV6rvTdGltMoB9Dk
	cZEXH7gSbd0gAonV8RSFlS26k5ngerswl9ArgmMllIe6yelSX3eI7AEJVrB8h3Td0bpd9Xb/Vx2
	nIP3g6TWEyUXK6uK319Ma6pc4nOvXJYFg1dLTrfzIDX8sQWltjDWbM6ddttSdMdPFFn/GtfMU7M
	XI0y0rVaEUEvwMCHGdyVFIJlyEm24ll1GgOvloNxEI2v5bMDD0YRql+u5yp1qF0+ifZ9Ga5EJni
	WCeCc=
X-Google-Smtp-Source: AGHT+IG+1ktLNOSz3yYoHgwGH2/62TvvbxjUubXxMiB5p2cnN1GjhetPRQqdB0FEItrfNeEubjUiWQ==
X-Received: by 2002:a05:6000:2910:b0:3b8:d22d:a8ad with SMTP id ffacd0b85a97d-3b900b448e7mr9448889f8f.3.1754900270382;
        Mon, 11 Aug 2025 01:17:50 -0700 (PDT)
Message-ID: <646c538a-850a-4370-8132-c06d9be8b422@citrix.com>
Date: Mon, 11 Aug 2025 09:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] x86/traps: Move subarch_percpu_traps_init() into
 traps-setup.c
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-11-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808202314.1045968-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 9:23 pm, Andrew Cooper wrote:
> ... along with the supporting functions.  Switch to Xen coding style, and make
> static as there are no external callers.
>
> Rename to legacy_syscall_init() as a more accurate name.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/system.h |  2 -
>  xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
>  xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
>  3 files changed, 95 insertions(+), 96 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
> index 3cdc56e4ba6d..6c2800d8158d 100644
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
>  #define BROKEN_ACPI_Sx          0x0001
>  #define BROKEN_INIT_AFTER_S1    0x0002
>  
> -void subarch_percpu_traps_init(void);
> -
>  #endif
> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
> index 13b8fcf0ba51..fbae7072c292 100644
> --- a/xen/arch/x86/traps-setup.c
> +++ b/xen/arch/x86/traps-setup.c
> @@ -2,13 +2,15 @@
>  /*
>   * Configuration of event handling for all CPUs.
>   */
> +#include <xen/domain_page.h>
>  #include <xen/init.h>
>  #include <xen/param.h>
>  
> +#include <asm/endbr.h>
>  #include <asm/idt.h>
>  #include <asm/msr.h>
>  #include <asm/shstk.h>
> -#include <asm/system.h>
> +#include <asm/stubs.h>
>  #include <asm/traps.h>
>  
>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
> @@ -19,6 +21,8 @@ static bool __initdata opt_ler;
>  boolean_param("ler", opt_ler);
>  
>  void nocall entry_PF(void);
> +void nocall lstar_enter(void);
> +void nocall cstar_enter(void);
>  
>  /*
>   * Sets up system tables and descriptors for IDT devliery.
> @@ -138,6 +142,95 @@ static void load_system_tables(void)
>      BUG_ON(stack_bottom & 15);
>  }
>  
> +static unsigned int write_stub_trampoline(
> +    unsigned char *stub, unsigned long stub_va,
> +    unsigned long stack_bottom, unsigned long target_va)
> +{
> +    unsigned char *p = stub;
> +
> +    if ( cpu_has_xen_ibt )
> +    {
> +        place_endbr64(p);
> +        p += 4;
> +    }
> +
> +    /* Store guest %rax into %ss slot */
> +    /* movabsq %rax, stack_bottom - 8 */
> +    *p++ = 0x48;
> +    *p++ = 0xa3;
> +    *(uint64_t *)p = stack_bottom - 8;
> +    p += 8;
> +
> +    /* Store guest %rsp in %rax */
> +    /* movq %rsp, %rax */
> +    *p++ = 0x48;
> +    *p++ = 0x89;
> +    *p++ = 0xe0;
> +
> +    /* Switch to Xen stack */
> +    /* movabsq $stack_bottom - 8, %rsp */
> +    *p++ = 0x48;
> +    *p++ = 0xbc;
> +    *(uint64_t *)p = stack_bottom - 8;
> +    p += 8;
> +
> +    /* jmp target_va */
> +    *p++ = 0xe9;
> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
> +    p += 4;
> +
> +    /* Round up to a multiple of 16 bytes. */
> +    return ROUNDUP(p - stub, 16);
> +}
> +
> +static void legacy_syscall_init(void)
> +{
> +    unsigned long stack_bottom = get_stack_bottom();
> +    unsigned long stub_va = this_cpu(stubs.addr);
> +    unsigned char *stub_page;
> +    unsigned int offset;
> +
> +    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        return;
> +
> +    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
> +
> +    /*
> +     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
> +     * context switch logic relies on the SYSCALL trampoline being at the
> +     * start of the stubs.
> +     */
> +    wrmsrl(MSR_LSTAR, stub_va);
> +    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
> +                                   stub_va, stack_bottom,
> +                                   (unsigned long)lstar_enter);
> +    stub_va += offset;
> +
> +    if ( cpu_has_sep )
> +    {
> +        /* SYSENTER entry. */
> +        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
> +        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
> +        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
> +    }
> +
> +    /* Trampoline for SYSCALL entry from compatibility mode. */
> +    wrmsrl(MSR_CSTAR, stub_va);
> +    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
> +                                    stub_va, stack_bottom,
> +                                    (unsigned long)cstar_enter);
> +
> +    /* Don't consume more than half of the stub space here. */
> +    ASSERT(offset <= STUB_BUF_SIZE / 2);
> +
> +    unmap_domain_page(stub_page);
> +
> +    /* Common SYSCALL parameters. */
> +    wrmsrl(MSR_STAR, XEN_MSR_STAR);
> +    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
> +}

These want adjusting to use wrmsrns(), similarly to the previous patch. 
Fixed locally.

~Andrew

