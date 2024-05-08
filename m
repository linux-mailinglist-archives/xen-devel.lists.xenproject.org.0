Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F88C04C3
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 21:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718924.1121475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4mj9-0005dS-Ri; Wed, 08 May 2024 19:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718924.1121475; Wed, 08 May 2024 19:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4mj9-0005bF-ON; Wed, 08 May 2024 19:13:19 +0000
Received: by outflank-mailman (input) for mailman id 718924;
 Wed, 08 May 2024 19:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6EkY=ML=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4mj8-0005b9-7n
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 19:13:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 062209ae-0d6f-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 21:13:17 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ebcf01013so810215e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 12:13:17 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b0034e65b8b43fsm14020419wru.8.2024.05.08.12.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 12:13:15 -0700 (PDT)
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
X-Inumbo-ID: 062209ae-0d6f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715195596; x=1715800396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WcdIt/e4eYUzUbM9WS/sjSzHTYUNboHK5drX4E4qu5A=;
        b=OhJGudtWuqeNe+El1F+XLPRSqDr3GYQbNWz1Ebz4pfEHnzjiwrN2Bwpjpca08ZHyaY
         bdt4L2mluaB7JS+tv3vjMLoHSOg2vk1SCxEfDqg07Azb6pHSjF3J7gwdyPWjX0HUMhVs
         50f3WO0shjIr2uRvcMxGycQo38cbaAw+5GhnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715195596; x=1715800396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcdIt/e4eYUzUbM9WS/sjSzHTYUNboHK5drX4E4qu5A=;
        b=enNzpFZgNIWqO0k0HUReV3BOhsx/S9Zj8l5BcRIoLCZoXSHb8iVap3du00gzSCS9CK
         QJxCfs6tbYKSs4YaVG5MNk0v2xMKahWTfYFVNhD0p5I1uuNapvXTUNVK44bpXWMkycZn
         Rj7ISWLJ+7LggMaUYtTdooHVv7S8iUeAbcgQGt5YReAXFX9D/5fEyUC4KM2ZhD4kax+v
         DCOLqOcWyNxarwpb5r4N7Zo1s7wYlZ1pnqYpz/ommEms3u2kY4t8yeDjaYpn8Rk90riY
         Ge71ZxoYaBGcEpTnwyZIHS1heiKnquxQ3zJhdGSJzIBqTe+Yi91uSJ4PlJ2PPwPSHG8A
         7Caw==
X-Forwarded-Encrypted: i=1; AJvYcCUtmpfLAdUu72x4SCD9rhzngFHMxB/aC/cVCNyCvt0LsTvJHvRIiuASyUX0Ry835pz1wIgQ83Avu7UdY/3UAkJSFIREdQ5lPSFVxj2C5nE=
X-Gm-Message-State: AOJu0YzSUG1SvFlr19C7Cvw4b/LV1JUjwkuAu6GZTZ3byYWbrRh0V0gR
	qCOqqv5lw6c0HArzdh5gixDKZcUyi8u4KHPNqyIkNs3sw9CP1spPtl7wWLZIpk0=
X-Google-Smtp-Source: AGHT+IEzmIGoyqAHb9LYk8U+9Ny/Aa5h1lpGH0cCl+JhElteTx124psZi6iNXZ0CuBlcYMuexnHNgA==
X-Received: by 2002:a05:600c:3b88:b0:419:f4d6:463b with SMTP id 5b1f17b1804b1-41fbcea20b7mr4765255e9.14.1715195596256;
        Wed, 08 May 2024 12:13:16 -0700 (PDT)
Message-ID: <45753c70-eef4-4ca7-b7f7-73b452310d4a@citrix.com>
Date: Wed, 8 May 2024 20:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] tools/hvmloader: Wake APs with hypercalls and not
 with INIT+SIPI+SIPI
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2024 1:39 pm, Alejandro Vallejo wrote:
> Removes a needless assembly entry point and simplifies the codebase by allowing
> hvmloader to wake APs it doesn't know the APIC ID of.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

This is basically independent of the rest of the series, and it would be
good to pull it in separately.  A few notes.

The commit message ought to note that this has a side effect of removing
an LMSW instruction which has fastpath at all on AMD CPUs, and requires
full emulation, and it gets rid of 13 vLAPIC emulations when 3
hypercalls would do.

The point being that this is borderline backport material, although it
does depend on the 32 vCPU bugfix.

> ---
> v2:
>   * New patch. Replaces adding cpu policy to hvmloader in v1.
> ---
>  tools/firmware/hvmloader/smp.c | 111 +++++++++++++--------------------
>  1 file changed, 44 insertions(+), 67 deletions(-)
>
> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> index 082b17f13818..a668f15d7e1f 100644
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -22,88 +22,68 @@
>  #include "util.h"
>  #include "config.h"
>  #include "apic_regs.h"
> +#include "hypercall.h"
>  
> -#define AP_BOOT_EIP 0x1000
> -extern char ap_boot_start[], ap_boot_end[];
> +#include <xen/asm/x86-defns.h>
> +#include <xen/hvm/hvm_vcpu.h>
> +
> +#include <xen/vcpu.h>
>  
>  static int ap_callin, ap_cpuid;
>  
> -asm (
> -    "    .text                       \n"
> -    "    .code16                     \n"
> -    "ap_boot_start: .code16          \n"
> -    "    mov   %cs,%ax               \n"
> -    "    mov   %ax,%ds               \n"
> -    "    lgdt  gdt_desr-ap_boot_start\n"
> -    "    xor   %ax, %ax              \n"
> -    "    inc   %ax                   \n"
> -    "    lmsw  %ax                   \n"
> -    "    ljmpl $0x08,$1f             \n"
> -    "gdt_desr:                       \n"
> -    "    .word gdt_end - gdt - 1     \n"
> -    "    .long gdt                   \n"
> -    "ap_boot_end: .code32            \n"
> -    "1:  mov   $0x10,%eax            \n"
> -    "    mov   %eax,%ds              \n"
> -    "    mov   %eax,%es              \n"
> -    "    mov   %eax,%ss              \n"
> -    "    movl  $stack_top,%esp       \n"
> -    "    movl  %esp,%ebp             \n"
> -    "    call  ap_start              \n"
> -    "1:  hlt                         \n"
> -    "    jmp  1b                     \n"
> -    "                                \n"
> -    "    .align 8                    \n"
> -    "gdt:                            \n"
> -    "    .quad 0x0000000000000000    \n"
> -    "    .quad 0x00cf9a000000ffff    \n" /* 0x08: Flat code segment */
> -    "    .quad 0x00cf92000000ffff    \n" /* 0x10: Flat data segment */
> -    "gdt_end:                        \n"
> -    "                                \n"
> -    "    .bss                        \n"
> -    "    .align    8                 \n"
> -    "stack:                          \n"
> -    "    .skip    0x4000             \n"
> -    "stack_top:                      \n"
> -    "    .text                       \n"
> -    );
> -
> -void ap_start(void); /* non-static avoids unused-function compiler warning */
> -/*static*/ void ap_start(void)
> +static void ap_start(void)
>  {
>      printf(" - CPU%d ... ", ap_cpuid);
>      cacheattr_init();
>      printf("done.\n");
> +
> +    if ( !ap_cpuid )
> +        return;
> +
>      wmb();
>      ap_callin = 1;

/* After this point, the BSP will shut us down. */

> -}
>  
> -static void lapic_wait_ready(void)
> -{
> -    while ( lapic_read(APIC_ICR) & APIC_ICR_BUSY )
> -        cpu_relax();
> +    while ( 1 )

For this, we tend to favour "for ( ;; )".

> +        asm volatile ( "hlt" );
>  }
>  
>  static void boot_cpu(unsigned int cpu)
>  {
> -    unsigned int icr2 = SET_APIC_DEST_FIELD(LAPIC_ID(cpu));
> +    static uint8_t ap_stack[4 * PAGE_SIZE] __attribute__ ((aligned (16)));

I know you're just copying what was there, but 4 pages is stupidly large
for something that needs about 4 stack slots.

4K is absolutely plenty.

> +    static struct vcpu_hvm_context ap;
>  
>      /* Initialise shared variables. */
>      ap_cpuid = cpu;
> -    ap_callin = 0;
>      wmb();
>  
> -    /* Wake up the secondary processor: INIT-SIPI-SIPI... */
> -    lapic_wait_ready();
> -    lapic_write(APIC_ICR2, icr2);
> -    lapic_write(APIC_ICR, APIC_DM_INIT);
> -    lapic_wait_ready();
> -    lapic_write(APIC_ICR2, icr2);
> -    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
> -    lapic_wait_ready();
> -    lapic_write(APIC_ICR2, icr2);
> -    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
> -    lapic_wait_ready();
> +    /* Wake up the secondary processor */
> +    ap = (struct vcpu_hvm_context) {
> +        .mode = VCPU_HVM_MODE_32B,
> +        .cpu_regs.x86_32 = {
> +            .eip = (uint32_t)ap_start,
> +            .esp = (uint32_t)ap_stack + ARRAY_SIZE(ap_stack),

Not that it really matters, but these want to be unsigned long casts.

> +
> +            /* Protected mode with MMU off */
> +            .cr0 = X86_CR0_PE,
> +
> +            /* Prepopulate the GDT */

/* 32bit Flat Mode */

This isn't the GDT; it's the segment registers, but "Flat Mode" is the
more meaningful term to use.


I'm happy to fix all on commit.

~Andrew

