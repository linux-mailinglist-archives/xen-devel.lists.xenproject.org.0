Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBz0CTXhr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:15:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926B2481C5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249895.1547266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztBP-0001GE-TN; Tue, 10 Mar 2026 09:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249895.1547266; Tue, 10 Mar 2026 09:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztBP-0001DS-Qc; Tue, 10 Mar 2026 09:15:19 +0000
Received: by outflank-mailman (input) for mailman id 1249895;
 Tue, 10 Mar 2026 09:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vztBO-0001D3-Bd
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 09:15:18 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a620e150-1c61-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 10:15:15 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so6761487f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 02:15:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadac2a7sm35114095f8f.15.2026.03.10.02.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 02:15:13 -0700 (PDT)
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
X-Inumbo-ID: a620e150-1c61-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773134114; x=1773738914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=chx2YjW890Ou0wPw7znAMHOGpEa1l+u9HuoEt9x/NDE=;
        b=DK1FoGX8bEnfrOQiSV3jiDfocaWw8MlOWst0dT3i/TpL+Bkybytaw4hAmaFF218XqQ
         sEEGt+FZYSpMRgLyeT7DwprCUWPmAL8bm7WyrDcjevSriXQtkOS6cEuIclBXZu5XQ7dV
         lheB3AwvF+a9EbdUi6RiZTUTDKP35BrBTUhzJrLt0v93kpmHPo6zE2bUWqVhH5D3v9VW
         Ej6sZFRZUGMPbgT9jIDQgRKiBTOZNYdxKADBcs7dunPHYzybESFFI5VNxhTDi0DducGu
         0OxIKZb5ZJ4AIrpMw9XR894F4Nos1ZJ4Sqr7KYpA1OwRD5EHiVI3xcAAbgqCdsQWNElZ
         86sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134114; x=1773738914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chx2YjW890Ou0wPw7znAMHOGpEa1l+u9HuoEt9x/NDE=;
        b=PBNVWnNL6vTSXd1ZXVAgzsVq2fgXJBq3BGWixXMExzgSvJGRWQ+iLmuBNL/m7L3cKG
         wrRMMmHNfYNypqUjy15e62Xilhd6jp9jrteTTcCHUQijJembY6kgHRoUoDwqWu/I4dJS
         8przSVXRc+yYzVh2vMUeOyzVgxFG2yc47TsovK7Za/irxSRqsuYAQyonfaofxfUeNefJ
         vrRNOgxml4LqXgA59n6ojceWZwBIlF98Aqxpv+GLXxLaTQYr/frsbG26DeDgmKISTPx2
         Id74LUqtMnyUZSK/+N/f9R0nsBPftoYRYQcrlINYNsewodSwF9PAMoVarSeWAn3rL+UI
         Xjhg==
X-Forwarded-Encrypted: i=1; AJvYcCUInaujjVaSFv3oVgHuzffFHpWrQm3arvuftq+HgcUbTkV0NjFrMksdwcx9hNeMnGkmsUHZPhQWkCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYTsST8f9+FqXrRuHk6RoA/Bk8rbknOrX92QQMM7UDRYaDjncU
	NV6iL0n7y3laxk6d0BJE40MIUUHNya0vMlW6wwJdDNAMEQiv0iX5AcgKJpJuL0K8sw==
X-Gm-Gg: ATEYQzwybGZaoly226exfHUbAR3FlqVn27gt+SWO18FE3IeznvOTWHyemMFJRTFjWRu
	6i/J7XRVhexFlJH2xEQePjTFn7I2zEXKYR3OvBfuZunVgHUBwa+fdhc/zHplVeL+DZBuA/rmDar
	l/d7oGamrodeVdtiB1EanJuUt/dDCfqd8tA90VbnOftSbAI/u2cwVQnfShIxnr65wllXopyuLH/
	HzVw4/HiTUJlLhxybO639fTG5LNCWtKWc8y6RWrOZea21KIrM9uhWJw00IOJpDpAyw+oYXbyAWO
	UWCGMPp+coJChvroyf/NkBu36P5DsVa0csy9OPLfoRVhow1ylzB0CjMCttCCIHRFTB4djVKySaY
	ZLwHfP7mFN0CZKbZ5QC+Kj6lKaxK7nEdhyy0oJFNLhg6U51sgNESlKQncgta9uVYg5lViDyX8Jy
	j8CCyBRSiA4DZHc5ByDtJYs3Bv5LlTqOL/lzGZwEMjy24vdJn51UvXAnKPGG+PuKKveDvarI022
	HPOMtHrLIzI8ok=
X-Received: by 2002:a05:6000:2888:b0:439:af96:29e4 with SMTP id ffacd0b85a97d-439da86f748mr24365056f8f.54.1773134114169;
        Tue, 10 Mar 2026 02:15:14 -0700 (PDT)
Message-ID: <9ff93ad1-0151-4f37-a6c2-f7dd4197ca84@suse.com>
Date: Tue, 10 Mar 2026 10:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/riscv: Disable SSTC extension and add
 trap-based CSR probing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8926B2481C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 17:33, Oleksii Kurochko wrote:
> Some RISC-V platforms expose the SSTC extension, but its CSRs are not
> properly saved and restored by Xen. Using SSTC in Xen could therefore
> lead to unexpected behaviour.

And what's wrong with (or what gets in the way of) adding proper
saving/restoring? Also, wouldn't a guest use vstimecmp anyway? I.e. what
saving/restoring are you talking about here?

> To avoid this in QEMU, disable SSTC by passing "sstc=off". On real
> hardware, OpenSBI does not provide a mechanism to disable SSTC via the
> DTS (riscv,isa or similar property), as it does not rely on that
> property to determine extension availability. Instead, it directly
> probes the CSR_STIMECMP register.
> 
> Introduce struct trap_info together with the do_expected_trap() handler
> to safely probe CSRs. The helper csr_read_allowed() attempts to read a
> CSR while catching traps, allowing Xen to detect whether the register
> is accessible. This mechanism is used at boot to verify SSTC support and
> panic if the CSR is not available.
> 
> The trap handling infrastructure may also be reused for other cases
> where controlled trap handling is required (e.g. probing instructions
> such as HLV*).

Hmm, won't you need a more generic way of dealing with traps anyway? See
Linux'es _ASM_EXTABLE(). See also comments further down.

> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -7,7 +7,7 @@ rm -f smoke.serial
>  
>  export TEST_CMD="qemu-system-riscv64 \
>      -M virt,aia=aplic-imsic \
> -    -cpu rv64,svpbmt=on \
> +    -cpu rv64,svpbmt=on,sstc=off \
>      -smp 1 \
>      -nographic \
>      -m 2g \

How does this fit with you panic()ing when SSTC isn't available (i.e. the
register cannot be read)? I must be missing something, likely a result of
me not being able to really understand the description.

> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -17,6 +17,8 @@
>  #include <xen/sections.h>
>  
>  #include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/traps.h>
>  
>  #ifdef CONFIG_ACPI
>  # error "cpufeature.c functions should be updated to support ACPI"
> @@ -483,6 +485,7 @@ void __init riscv_fill_hwcap(void)
>      unsigned int i;
>      const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
>      bool all_extns_available = true;
> +    struct trap_info trap;
>  
>      riscv_fill_hwcap_from_isa_string();
>  
> @@ -509,4 +512,9 @@ void __init riscv_fill_hwcap(void)
>      if ( !all_extns_available )
>          panic("Look why the extensions above are needed in "
>                "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
> +
> +    csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);

Please avoid such casts; see also below.

> --- a/xen/arch/riscv/entry.S
> +++ b/xen/arch/riscv/entry.S
> @@ -99,3 +99,27 @@ restore_registers:
>  
>          sret
>  END(handle_trap)
> +
> +        /*
> +         * We assume that the faulting instruction is 4 bytes long and blindly
> +         * increment SEPC by 4.
> +         *
> +         * This should be safe because all places that may trigger this handler
> +         * use ".option norvc" around the instruction that could cause the trap,
> +         * or the instruction is not available in the RVC instruction set.
> +         *
> +         * do_expected_trap(a3, a4):
> +         *   a3 <- pointer to struct trap_info
> +         *   a4 <- temporary register
> +         */
> +FUNC(do_expected_trap)
> +        csrr    a4, CSR_SEPC
> +        REG_S   a4, RISCV_TRAP_SEPC(a3)
> +        csrr    a4, CSR_SCAUSE
> +        REG_S   a4, RISCV_TRAP_SCAUSE(a3)
> +
> +        csrr    a4, CSR_SEPC

Why read sepc a 2nd time? Yet further, what's the point of storing the value
in the first place? The sole present user doesn't care.

> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -9,6 +9,7 @@
>  #include <asm/asm.h>
>  #include <xen/const.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/traps.h>
>  
>  #ifndef __ASSEMBLER__
>  
> @@ -78,6 +79,37 @@
>                             : "memory" );                        \
>  })
>  
> +/*
> + * Some functions inside asm/system.h requires some of the macros above,
> + * so this header should be included after the macros above are introduced.
> + */
> +#include <asm/system.h>
> +
> +#define csr_read_allowed(csr_num, trap) \
> +({ \
> +    register unsigned long tinfo asm("a3") = (unsigned long)trap; \

Why can't this variable be of the correct (pointer) type? This would then
at the same time serve as a compile-time check for the caller to have
passed an argument of the correct type.

> +    register unsigned long ttmp asm("a4"); \
> +    register unsigned long stvec = (unsigned long)&do_expected_trap; \

Fiddling with stvec may be okay-ish very early during boot. NMIs, for
example, do exist in principle on RISC-V, aiui. There must be a way for them
to be dealt with by other than just M-mode. 

> +    register unsigned long ret = 0; \
> +    unsigned long flags; \
> +    ((struct trap_info *)(trap))->scause = 0; \

"trap" would better be of the correct type. Don't use casts like this, please.

Further, wouldn't you better set the field to a guaranteed invalid value? 0 is
CAUSE_MISALIGNED_FETCH, after all.

> +    local_irq_save(flags); \
> +    asm volatile ( \
> +        ".option push\n" \
> +        ".option norvc\n" \

Shouldn't this come later?

> +        "add %[ttmp], %[tinfo], zero\n" \

Why "add", when you really mean "mv"? And why set ttmp in the first place, when
that's what do_expected_trap() writes to? Don't you really mean to specify "a4"
as a clobber?

> +        "csrrw %[stvec], " STR(CSR_STVEC) ", %[stvec]\n" \

The assembler does understand "stvec" as an operand, doesn't it?

> +        "csrr %[ret], %[csr]\n" \
> +        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
> +        ".option pop" \
> +        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \

tinfo isn't modified, is it?

> +          [ttmp] "+&r" (ttmp), [ret] "=&r" (ret) \

ttmp isn't initialized (in C), so the compiler could legitimately complain
about the use of an uninitialized variable here (due to the use of + where
= is meant).

Whereas for ret the situation is the other way around - you initialize the
variable, just to then tell the compiler that it can drop this
initialization, as - supposedly - the asm() always sets it (which it doesn't
when the csrr faults).

> +        : [csr] "i" (csr_num) \
> +        : "memory" ); \
> +    local_irq_restore(flags); \
> +    ret; \
> +})

A macro of this name would better return an indicator of what it is checking,
rather than the CSR value (which the sole user of this macro doesn't even
care about). Ideally such would also be an inline function.

Jan

