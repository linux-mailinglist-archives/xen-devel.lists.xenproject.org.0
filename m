Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BC5AF6FFF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031941.1405680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXH8R-0004e6-8d; Thu, 03 Jul 2025 10:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031941.1405680; Thu, 03 Jul 2025 10:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXH8R-0004bN-4U; Thu, 03 Jul 2025 10:25:43 +0000
Received: by outflank-mailman (input) for mailman id 1031941;
 Thu, 03 Jul 2025 10:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXH8P-0004bH-P8
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:25:41 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10bd88b7-57f8-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:25:39 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2972827f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:25:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541cc81sm16437768b3a.58.2025.07.03.03.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:25:38 -0700 (PDT)
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
X-Inumbo-ID: 10bd88b7-57f8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751538339; x=1752143139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FGYrxBovSyy1Qhc2GevDlGnZRh+pRolb2sLIVWcH2b8=;
        b=Toc+kIIi+PWygAMtep9Oqj26mO2WY/jMQytXG1z2OdhfAki67MWdNOZEuevL+06TEs
         Kp3c8aXDjSCw1gSQdZ1iZPBSSLLBbRjoC0xuqH+BxSc9ha1Ye3bpXfTuJVAh3lJADimV
         G9noxxsI19Yiq8XZgMOCogPc3as9lT1QcQ5jyEj23jUhNpFolZySnP6t87oxI5zhujUU
         fBu1b6KOhAtq47JXmhUFj8iHfT0KqNnMAx12DABXA/gSfOynb1Yr3hI8gaMAaqu/i3zZ
         xy5sgniI1JYrXF9JLRNL0agGXgUkufEtejIjOvQZNjz9spzGq63YOSgCxaOVyYvystPT
         0jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538339; x=1752143139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGYrxBovSyy1Qhc2GevDlGnZRh+pRolb2sLIVWcH2b8=;
        b=sOuWJKjZcx4fUjdED0Xu2MVh/+wvGYv+8KyZyk1eLv+7GMg0WwZfLV9Zx4Ts4Y2Mz2
         MEpiOQ2IeYvk6rkgprZnNOb/Z6YsioalLnc4LEEu2zadWCqhmcGa/VQQJ3q9NEmlrg18
         bVgEob+xW3MOQoYFMZQuIml0AZjjPjkPzABOp90W46Zqwic5UKiGsYMorEN7VEyWioLr
         wRnu0iY6sj8HjXom+voHPtrvwjy/tO3bxaRaGxLZdT3sACtmMNc+H5lPjUByAT312eLE
         xePZ4QrtNPuknj04Psi/NRgsduymu0kvqIc6jxb1xzCPhNrnbD/zAtSJ71bwqA4k0A6l
         3m8A==
X-Forwarded-Encrypted: i=1; AJvYcCWVg0OIXYmyNtTDoEDpSsTssLYExbTZH9KjyezrO9c523VYs+6ViU2mpw4F2qfSwq8kWPrqz4778bk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywzg3hIO3zefXtV0owJQPOEJxMkuFh84gZHvWhJ8b6niVABIjVF
	GmqzenJqZSemvp7wodXV5TBilE1/zf8B8FD8GEnOUT9nSxE7miIYNNyRM+LWs/hFnA==
X-Gm-Gg: ASbGncvrGAVi04Mamwu5QCN+qmYcSJAqgiKn6D8xDIjr+NAgp8uuPklBAUus9OJy5eb
	bcmW80BiH5njUrYwqDzl1G048WltknF8FFvbbB6GWS6DZTkiqtwOmnwTutg3LNd1gghCmh9BR0U
	5/CElA9gJyovgsqqlGDCyiVxL4f9JA/25fXSI1OcyE85IeiM70h6TxKBJrBk1NFokVmPfFIbf05
	ojMHCSQqNfxR6rQoCRZkWpghyM5LaMHuyd3HZkVF2tfWu7xixw5JIXHmLL2d70I1FQ95DYrzgJ5
	hRw8co04ABXvjw/ESUoujxHl3eDxBNeXxUZRNzbeXKMJEAmL8xHQOhyY53/XUVXUT7mqDe133Jx
	egsWAtcGseLIit3fk2Y6Ky+/Ycheg3Xo0B/TiO1ef+aA7Rr4=
X-Google-Smtp-Source: AGHT+IFCsDO/+NAgI4Z06IjonEzfrW32AQ/V5wGjRYJsI0KHjFhTXObiOX+ZNMUYhd8llowwwd559w==
X-Received: by 2002:a05:6000:4188:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b32c56e040mr1428139f8f.4.1751538338767;
        Thu, 03 Jul 2025 03:25:38 -0700 (PDT)
Message-ID: <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com>
Date: Thu, 3 Jul 2025 12:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch entry
 point
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> From: Kacper Stojek <kacper.stojek@3mdeb.com>
> 
> Signed-off-by: Kacper Stojek <kacper.stojek@3mdeb.com>
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>

Such a change can hardly come without any description. As just one aspect,
neither here nor ...

> --- a/docs/hypervisor-guide/x86/how-xen-boots.rst
> +++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
> @@ -55,6 +55,11 @@ If ``CONFIG_PVH_GUEST`` was selected at build time, an Elf note is included
>  which indicates the ability to use the PVH boot protocol, and registers
>  ``__pvh_start`` as the entrypoint, entered in 32bit mode.
>  
> +A combination of Multiboot 2 and MLE headers is used to implement DRTM for
> +legacy (BIOS) boot. The separate entry point is used mainly to differentiate

... here the MLE acronym is being deciphered. Same for DRTM here. There's
also no reference anywhere as to some kind of spec (except in the cover
letter, but that won't land in the tree).

> +from other kinds of boots. It moves a magic number to EAX before jumping into
> +common startup code.
> +
>  
>  xen.gz
>  ~~~~~~

Any reason the single blank line is converted to a double one? Generally, in
particular for patch context to be more meaningful, we'd prefer to not have
double blank lines. In documentation they _sometimes_ may be warranted.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -4,6 +4,7 @@
>  #include <public/xen.h>
>  #include <asm/asm_defns.h>
>  #include <asm/fixmap.h>
> +#include <asm/intel-txt.h>
>  #include <asm/page.h>
>  #include <asm/processor.h>
>  #include <asm/msr-index.h>
> @@ -126,6 +127,25 @@ multiboot2_header:
>          .size multiboot2_header, . - multiboot2_header
>          .type multiboot2_header, @object
>  
> +        .balign 16
> +mle_header:
> +        .long   0x9082ac5a  /* UUID0 */
> +        .long   0x74a7476f  /* UUID1 */
> +        .long   0xa2555c0f  /* UUID2 */
> +        .long   0x42b651cb  /* UUID3 */
> +        .long   0x00000034  /* MLE header size */

Better use an expression (difference of two labels)?

> +        .long   0x00020002  /* MLE version 2.2 */
> +        .long   (slaunch_stub_entry - start)  /* Linear entry point of MLE (SINIT virt. address) */
> +        .long   0x00000000  /* First valid page of MLE */
> +        .long   0x00000000  /* Offset within binary of first byte of MLE */
> +        .long   (_end - start)  /* Offset within binary of last byte + 1 of MLE */

Is the data here describing xen.gz or (rather) xen.efi? In the latter case,
does data past _end (in particular the .reloc section) not matter here?

> +        .long   0x00000723  /* Bit vector of MLE-supported capabilities */
> +        .long   0x00000000  /* Starting linear address of command line (unused) */
> +        .long   0x00000000  /* Ending linear address of command line (unused) */
> +
> +        .size mle_header, .-mle_header
> +        .type mle_header, @object

Please use what xen/linkage.h provides now.

However, the entire additions here and below likely want to go inside some
#ifdef CONFIG_xyz, just like additions in subsequent patches. Which obviously
would require a suitable Kconfig option to be introduced up front.

> @@ -332,6 +352,38 @@ cs32_switch:
>          /* Jump to earlier loaded address. */
>          jmp     *%edi
>  
> +        /*
> +         * Entry point for TrenchBoot Secure Launch on Intel TXT platforms.
> +         *
> +         * CPU is in 32b protected mode with paging disabled. On entry:
> +         * - %ebx = %eip = MLE entry point,
> +         * - stack pointer is undefined,
> +         * - CS is flat 4GB code segment,
> +         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
> +         *   would make it impossible to initialize GDTR, because GDT base must
> +         *   be relocated in the descriptor, which requires write access that
> +         *   CS doesn't provide. Instead we have to assume that DS is set by
> +         *   SINIT ACM as flat 4GB data segment.

Do you really _have to_? At least as plausibly SS might be properly set up,
while DS might not be.

> +         * Additional restrictions:
> +         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
> +         *   some capabilities might be reported as disabled even if they are
> +         *   supported by CPU
> +         * - interrupts (including NMIs and SMIs) are disabled and must be
> +         *   enabled later
> +         * - trying to enter real mode results in reset
> +         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
> +         *   which is supported by a given SINIT ACM

I'm curious: How would MONITOR allow to bring up an AP? That's not even a
memory access.

> +         */
> +slaunch_stub_entry:
> +        /* Calculate the load base address. */
> +        mov     %ebx, %esi
> +        sub     $sym_offs(slaunch_stub_entry), %esi
> +
> +        /* Mark Secure Launch boot protocol and jump to common entry. */
> +        mov     $SLAUNCH_BOOTLOADER_MAGIC, %eax

While I understand you can't add real handling of this case just yet, wouldn't
it be better to at least cover the case by checking for this magic later, and
in that case enter, say, an infinite loop? You don't want to give the wrong
impression of this path functioning, do you?

Jan

