Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31DB1A5B7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069521.1433373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiwyV-00005n-8g; Mon, 04 Aug 2025 15:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069521.1433373; Mon, 04 Aug 2025 15:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiwyV-0008Vh-5x; Mon, 04 Aug 2025 15:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1069521;
 Mon, 04 Aug 2025 15:19:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiwyT-0008VO-0P
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:19:41 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7062f0e9-7146-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 17:19:39 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61553a028dfso4336771a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:19:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff596sm7024315a12.5.2025.08.04.08.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:19:38 -0700 (PDT)
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
X-Inumbo-ID: 7062f0e9-7146-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754320779; x=1754925579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5BEGIl+6nDFuNrPOpcnk+fWPKWWOAF540EnRgCpaDB8=;
        b=cXSaz3qRCMl9AYa6Kgs7RUHgr4rCt6SVXb647n2RJmeqfSo5WF7jtFKTSvJTQzD/IR
         7R6CS2ydzd+ta76Kzsg4NYqM9PghxZiTzjoFigoX864AlWCTcMigfbPMYh+xqrAws5Ip
         SYYwKqcC5nWpBtHDo73xGTJaZNujtRYUkMQykiRv+JOuonYtg9D7HFdAQ3l49bevJA5P
         nRObl8x0W1liiEi4Wt3uThN2FP/RE/DYV3F/53uEWqvzYk434+XjtXcAUjXhpH7xKae1
         963oWo5L53GdohVuSPRoGR9ujgqd1CTESlnn3ALJ0sZmTnmE5D4pD5lr9APlgF9b57be
         o7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754320779; x=1754925579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BEGIl+6nDFuNrPOpcnk+fWPKWWOAF540EnRgCpaDB8=;
        b=Miqo7yv0DhYhQ3+Ywg7grLJemyKkqSmp7VASBP94RnILVmDDt4dX6AGbRhsgzPxpls
         5vZjdJdkO2lZPQ9qRCq/z3EuMOj1Qe0HfmtfvecGyHaYYSkaFhdUraaeLIc48WkW5EhL
         V/8zB0BBpTL2oqzb3iAcWPW0nlPRHCOUAcqTy1GDOgI3dZD02hWOcVtvrQfILLnQe3UD
         xyE4ESmPwN4lma3+RmpxLfKSyAao+/bNRCahiMaJFczpsmAv9r+nEuzmZMevvrhaWbV+
         kXRzp6p+x0APQFWz8nly4cEptaRhO+Faxfwv8+gqLG5IzLC7wjEJZUP6b7rKwoJLIIWB
         voiA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHbBuaEAptnSuhMyv3wpNvqb06xtL2CBnWZ9S5sJiuA3/d1OAoMyBw3JSOhNpNJCxBiYh/OxUtBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLz9BP1t/ZWtu2hjljO34qeqxLL041LR29wjOHmcxmBngeMEAp
	eoJ8pC+gw1p+6h0HY+pq8vtiMmt80lhY+4AT9CXoqUYANHNZtCwVDSl86NTeGj4fKA==
X-Gm-Gg: ASbGncvJaM94NhQLe3cFwrXTKxCcZlSYK8p5l2BfpuUZY9BHxoxautDxFSQZWQtM4zg
	CyvIr514asBZQwx0IV0I2y06mk98D+56AlB3Oagyq+Nf+A+VQA5eW2GzuaSTbAIUcT//2d20HqZ
	vNAWuRw3UABFRe/gb5vrDCEkD75jqMJm/7tU3cDncuqOUpJm34AHuXAxb5EMUg1zTX9dDsjp2lN
	I/oRdgemWEjSzoPRzRCiiqI+7UlY/gtFsv4xlhtj+49FKzbJqNYn89LwQ36NlxDC8ODptEtKjFH
	aNR1gPuTWmxqrCv9FyoEhw+XTAJ6BM4d+JQb66zcYWAnu4kNLYxLPI/0o0u8l2hJ0/EbMiXmPpp
	F33L0b2kPzwXs+bA6u0r0cMVYZP6ECn/8wD4acIPdX5esU+hLSEy1MeLjMu8WULLOINH8IgWpAI
	NUkBxStq0=
X-Google-Smtp-Source: AGHT+IFkrjhlZsNmXiv9gkcTG5CtSpxqjZSuG6x1coryUFVcSbK8az8nDxf0raQNp41BBluLha4WAw==
X-Received: by 2002:a50:cc03:0:b0:615:b6b9:d873 with SMTP id 4fb4d7f45d1cf-615e715d669mr6751840a12.24.1754320778966;
        Mon, 04 Aug 2025 08:19:38 -0700 (PDT)
Message-ID: <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
Date: Mon, 4 Aug 2025 17:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Current implementation is based on x86's way to allocate VMIDs:
>   VMIDs partition the physical TLB. In the current implementation VMIDs are
>   introduced to reduce the number of TLB flushes.  Each time the guest's
>   virtual address space changes,

virtual?

> instead of flushing the TLB, a new VMID is
>   assigned.  This reduces the number of TLB flushes to at most 1/#VMIDs.
>   The biggest advantage is that hot parts of the hypervisor's code and data
>   retain in the TLB.
> 
>   VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
>   VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
>   VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
>   64-bit generation. Only on a generation overflow the code needs to
>   invalidate all VMID information stored at the VCPUs with are run on the
>   specific physical processor.  This overflow appears after about 2^80
>   host processor cycles,

Where's this number coming from? (If you provide numbers, I think they will
want to be "reproducible" by the reader. Which I fear isn't the case here.)

> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      console_init_postirq();
>  
> +    vmid_init();

This lives here only temporarily, I assume? Every hart will need to execute
it, and hence (like we have it on x86) this may want to be a central place
elsewhere.

> --- /dev/null
> +++ b/xen/arch/riscv/vmid.c
> @@ -0,0 +1,165 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain.h>
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/lib.h>
> +#include <xen/param.h>
> +#include <xen/percpu.h>
> +
> +#include <asm/atomic.h>
> +#include <asm/csr.h>
> +#include <asm/flushtlb.h>
> +
> +/* Xen command-line option to enable VMIDs */
> +static bool __read_mostly opt_vmid_enabled = true;

__ro_after_init ?

> +boolean_param("vmid", opt_vmid_enabled);
> +
> +/*
> + * VMIDs partition the physical TLB. In the current implementation VMIDs are
> + * introduced to reduce the number of TLB flushes.  Each time the guest's
> + * virtual address space changes, instead of flushing the TLB, a new VMID is

The same odd "virtual" again? All the code here is about guest-physical, isn't
it?

> + * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
> + * The biggest advantage is that hot parts of the hypervisor's code and data
> + * retain in the TLB.
> + *
> + * Sketch of the Implementation:
> + *
> + * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
> + * VMIDs are assigned in a round-robin scheme.  To minimize the overhead of
> + * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
> + * 64-bit generation. Only on a generation overflow the code needs to
> + * invalidate all VMID information stored at the VCPUs with are run on the
> + * specific physical processor.  This overflow appears after about 2^80

And the same interesting number again.

> + * host processor cycles, so we do not optimize this case, but simply disable
> + * VMID useage to retain correctness.
> + */
> +
> +/* Per-Hart VMID management. */
> +struct vmid_data {
> +   uint64_t hart_vmid_generation;

Any reason not to simply use "generation"?

> +   uint16_t next_vmid;
> +   uint16_t max_vmid;
> +   bool disabled;
> +};
> +
> +static DEFINE_PER_CPU(struct vmid_data, vmid_data);
> +
> +static unsigned long vmidlen_detect(void)

__init ? Or wait, are you (deliberately) permitting different VMIDLEN
across harts?

> +{
> +    unsigned long vmid_bits;

Why "long" (also for the function return type)?

> +    unsigned long old;
> +
> +    /* Figure-out number of VMID bits in HW */
> +    old = csr_read(CSR_HGATP);
> +
> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
> +    vmid_bits = csr_read(CSR_HGATP);
> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);

Nit: Stray blank.

> +    vmid_bits = flsl(vmid_bits);
> +    csr_write(CSR_HGATP, old);
> +
> +    /*
> +     * We polluted local TLB so flush all guest TLB as
> +     * a speculative access can happen at any time.
> +     */
> +    local_hfence_gvma_all();

There's no guest running. If you wrote hgat.MODE as zero, as per my
understanding now new TLB entries could even purely theoretically appear.
In fact, with no guest running (yet) I'm having a hard time seeing why
you shouldn't be able to simply write the register with just
HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
whether "old" needs restoring; writing plain zero afterwards ought to
suffice. You're in charcge of the register, after all.

> +    return vmid_bits;
> +}
> +
> +void vmid_init(void)
> +{
> +    static bool g_disabled = false;



> +    unsigned long vmid_len = vmidlen_detect();
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +    unsigned long max_availalbe_bits = sizeof(data->max_vmid) << 3;

Nit: Typo in "available". Also now that we have it, better use
BITS_PER_BYTE here?

> +    if ( vmid_len > max_availalbe_bits )
> +        panic("%s: VMIDLEN is bigger then a type which represent VMID: %lu(%lu)\n",
> +              __func__, vmid_len, max_availalbe_bits);

This shouldn't be a runtime check imo. What you want to check (at build
time) is that the bits set in HGATP_VMID_MASK can be held in ->max_vmid.

> +    data->max_vmid = BIT(vmid_len, U) - 1;
> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);

Actually, what exactly does it mean that "VMIDs are disabled"? There's
no enable bit that I could find anywhere. Isn't it rather that in this
case you need to arrange to flush always on VM entry (or always after a
P2M change, depending how the TLB is split between guest and host use)?
If you look at vmx_vmenter_helper(), its flipping of
SECONDARY_EXEC_ENABLE_VPID tweaks CPU behavior, such that the flush
would be implicit (when the bit is off). I don't expect RISC-V has any
such "implicit" flushing behavior?

> +    if ( g_disabled != data->disabled )
> +    {
> +        printk("%s: VMIDs %sabled.\n", __func__,
> +               data->disabled ? "dis" : "en");
> +        if ( !g_disabled )
> +            g_disabled = data->disabled;

This doesn't match x86 code. g_disabled is a tristate there, which only
the boot CPU would ever write to.

A clear shortcoming of the x86 code (that you copied) is that the log
message doesn't identify the CPU in question. A sequence of "disabled"
and "enabled" could thus result, without the last one (or in fact any
one) making clear what the overall state is. I think you want to avoid
this from the beginning.

Jan

