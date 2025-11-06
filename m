Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D63C3B90F
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 15:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156989.1485925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0cV-00005S-Dc; Thu, 06 Nov 2025 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156989.1485925; Thu, 06 Nov 2025 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0cV-0008VV-Aj; Thu, 06 Nov 2025 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1156989;
 Thu, 06 Nov 2025 14:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vH0cU-0008VO-Mo
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 14:05:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af7c6531-bb19-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 15:05:44 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b728a43e410so172754566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 06:05:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72896c7991sm222289566b.71.2025.11.06.06.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:05:43 -0800 (PST)
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
X-Inumbo-ID: af7c6531-bb19-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762437943; x=1763042743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XGSSzUsukcbLeqmAgWDj27S8tDCZi8FIbqNAXoogc04=;
        b=bT9FtivH+Sgu3+YF6uOy4BtV9rCHbXLtLNa75eksP1dkY58W5HLXAlY/nPR4ghfLe0
         qUl5rArAPiD9ALpUzucqTAjUofnR5sH4W79AWwc5SmXAeaqm2//53gqPARhiwOugnpFj
         584IpQKTycgOunQa+HiR4k2zy1NqRcYhGl2+ujFB3lyoxU/1QPMgjl9Sqj/qwwqrvvHZ
         tH4zK7n78BXQyQ0T6G/2QxjY524FJaL3aCCQoQ6h1fuJ+Zf5s38YWmlwfxNCvY1X4j1Y
         Kv/BJ8vugoukCrS3qLrqJcE2/CnZEH0zE3SmTPWWPDvYLI5miBaPMZfyLTGBnY4qRvVw
         MWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762437944; x=1763042744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGSSzUsukcbLeqmAgWDj27S8tDCZi8FIbqNAXoogc04=;
        b=RlWjx1ETPeIQZ2vrsNQNplZuf/JAAu93QTkA7O/DfP4YpvhutdYMH6KV2OIuUHaU7I
         Q/8Lq/K0L2IosL4q2TyxheCbZcByL/2+yFIVv8XfhyY7/Z7cI47bbIkwCPgKRXKGaOlR
         53Ynvms0ks+4lx8+73FA8cld+kHCTTqqEwXhFVDW+PuaUQzZld3BInDMMznitKVigX9x
         EEYIphCg868TbxSNrrtvBgDKQAcoyyV02IsswUB1Q958Ep6NyaTS94JbhSTiKM3z5O+2
         WvYHUpOLc7vCPwVTxmlKKpB5B8jZssDz0EeMxCRf2+k5TSaHna+jOBzP4nDezEPTXkw7
         qzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXUniVEeF0Hp4gGhWj5RFmvQvjUZiuBmVZBBME4mXBOqcbezUaquz2cgtpVY49hIcjIBsAhqOb3rMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt8uZXchcEXMqYuOks/gqKnpchwgt+as35o28sYMGfw5TNt/xt
	uo9ag4ywrUCzG4OjLOrLDr65sXA6hNmRY90XOZnYtS2WGPo87kKHTYZMUBSlZUjd7Q==
X-Gm-Gg: ASbGncuCmeukYhE1V9gE3Y82QLUJ0o8+lQfV8nKgOTmlh8mguhP+qHzeDEPVgW/pFvP
	/iPPoA5gX6MXq4UKhzthWz1TNK0oNoimHwcP5HlM3dFKRMGP8eACnot0e/+L88cW2sg9AVWIS0k
	bP15yeunbKfyh8cJRHiZFP0hJLRvq4zqytk5QebLoIKJhj/fUejwt9m6DF/wKw3fp3BMN4PSBP+
	NG9Sc2tAgs6Q5KANSl6Tzq1TMS29HDaU0fZcnGW9NeG2Ywwv1reFY70qk5XGVjnkD1DZ1gZgnPu
	P0PHELRpb/X/T1xw6fRPsdIpTfOmAknr2DrQck7vdau6xJianLagaXDQJ5NoPHs1UdbraP6bwwq
	qNRJ8aRveaTxZraZh7uCkoXL/B0DLUJC8bonrdrdBAs669aRUnHWY15IarlJikCT0u0dFvXKyOZ
	TX7M3YLWITvlAn+8IHhtcnVrqy5Z/w/s5L2UlazBUA8DnxDn4tv6vLPHAkZCw/tQCE+bDxjdyiB
	2ygoYfAWg==
X-Google-Smtp-Source: AGHT+IEJuhthSg+z2yegqLNG7hX6GmP3vz0DQuaIAhdH1orQzf+ZD07PVhpkU15MAVWP6wsIMqjMWw==
X-Received: by 2002:a17:907:9815:b0:b71:854:4e49 with SMTP id a640c23a62f3a-b72655edfabmr791338666b.56.1762437943488;
        Thu, 06 Nov 2025 06:05:43 -0800 (PST)
Message-ID: <7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com>
Date: Thu, 6 Nov 2025 15:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <bdbe6c13991c2d166614795d43db3f71d790c00f.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bdbe6c13991c2d166614795d43db3f71d790c00f.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/vmid.c
> @@ -0,0 +1,193 @@
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
> +#include <asm/p2m.h>
> +
> +/* Xen command-line option to enable VMIDs */
> +static bool __ro_after_init opt_vmid = true;
> +boolean_param("vmid", opt_vmid);

Command line options, btw, want documenting in docs/misc/xen-command-line.pandoc.

> +/*
> + * VMIDs partition the physical TLB. In the current implementation VMIDs are
> + * introduced to reduce the number of TLB flushes. Each time a guest-physical
> + * address space changes, instead of flushing the TLB, a new VMID is
> + * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
> + * The biggest advantage is that hot parts of the hypervisor's code and data
> + * retain in the TLB.
> + *
> + * Sketch of the Implementation:
> + *
> + * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
> + * VMIDs are assigned in a round-robin scheme. To minimize the overhead of
> + * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
> + * 64-bit generation. Only on a generation overflow the code needs to
> + * invalidate all VMID information stored at the VCPUs with are run on the
> + * specific physical processor. When this overflow appears VMID usage is
> + * disabled to retain correctness.
> + */
> +
> +/* Per-Hart VMID management. */
> +struct vmid_data {
> +   uint64_t generation;
> +   uint16_t next_vmid;
> +   uint16_t max_vmid;
> +   bool used;
> +};
> +
> +static DEFINE_PER_CPU(struct vmid_data, vmid_data);
> +
> +static unsigned int vmidlen_detect(void)
> +{
> +    unsigned int vmid_bits;
> +
> +    /*
> +     * According to the RISC-V Privileged Architecture Spec:
> +     *   When MODE=Bare, guest physical addresses are equal to supervisor
> +     *   physical addresses, and there is no further memory protection
> +     *   for a guest virtual machine beyond the physical memory protection
> +     *   scheme described in Section "Physical Memory Protection".
> +     *   In this case, the remaining fields in hgatp must be set to zeros.
> +     * Thereby it is necessary to set gstage_mode not equal to Bare.
> +     */
> +    ASSERT(gstage_mode != HGATP_MODE_OFF);
> +    csr_write(CSR_HGATP,
> +              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
> +    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
> +    vmid_bits = flsl(vmid_bits);
> +    csr_write(CSR_HGATP, _AC(0, UL));
> +
> +    /*
> +     * From RISC-V spec:
> +     *   Speculative executions of the address-translation algorithm behave as
> +     *   non-speculative executions of the algorithm do, except that they must
> +     *   not set the dirty bit for a PTE, they must not trigger an exception,
> +     *   and they must not create address-translation cache entries if those
> +     *   entries would have been invalidated by any SFENCE.VMA instruction
> +     *   executed by the hart since the speculative execution of the algorithm
> +     *   began.
> +     *
> +     * Also, despite of the fact here it is mentioned that when V=0 two-stage
> +     * address translation is inactivated:
> +     *   The current virtualization mode, denoted V, indicates whether the hart
> +     *   is currently executing in a guest. When V=1, the hart is either in
> +     *   virtual S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest
> +     *   OS running in VS-mode. When V=0, the hart is either in M-mode, in
> +     *   HS-mode, or in U-mode atop an OS running in HS-mode. The
> +     *   virtualization mode also indicates whether two-stage address
> +     *   translation is active (V=1) or inactive (V=0).
> +     * But on the same side, writing to hgatp register activates it:
> +     *   The hgatp register is considered active for the purposes of
> +     *   the address-translation algorithm unless the effective privilege mode
> +     *   is U and hstatus.HU=0.
> +     *
> +     * Thereby it leaves some room for speculation even in this stage of boot,
> +     * so it could be that we polluted local TLB so flush all guest TLB.
> +     */
> +    local_hfence_gvma_all();

That's a lot of redundancy with gstage_mode_detect(). The function call here
actually renders the one there redundant, afaict. Did you consider putting a
single instance at the end of it in pre_gstage_init()? Otherwise at least
don't repeat the comment here, but merely point at the other one?

> +    return vmid_bits;
> +}
> +
> +void vmid_init(void)

This (and its helper) isn't __init because you intend to also call it during
bringup of secondary processors?

> +{
> +    static int8_t g_vmid_used = -1;

Now that you're getting closer to the x86 original - __ro_after_init?

> +    unsigned int vmid_len = vmidlen_detect();
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    BUILD_BUG_ON((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) >
> +                 (BIT((sizeof(data->max_vmid) * BITS_PER_BYTE), UL) - 1));
> +
> +    data->max_vmid = BIT(vmid_len, U) - 1;
> +    data->used = opt_vmid && (vmid_len > 1);
> +
> +    if ( g_vmid_used < 0 )
> +    {
> +        g_vmid_used = data->used;
> +        printk("VMIDs use is %sabled\n", data->used ? "en" : "dis");
> +    }
> +    else if ( g_vmid_used != data->used )
> +        printk("CPU%u: VMIDs use is %sabled\n", smp_processor_id(),
> +               data->used ? "en" : "dis");
> +
> +    /* Zero indicates 'invalid generation', so we start the count at one. */
> +    data->generation = 1;
> +
> +    /* Zero indicates 'VMIDs use disabled', so we start the count at one. */
> +    data->next_vmid = 1;
> +}
> +
> +void vmid_flush_vcpu(struct vcpu *v)
> +{
> +    write_atomic(&v->arch.vmid.generation, 0);
> +}
> +
> +void vmid_flush_hart(void)
> +{
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    if ( !data->used )
> +        return;
> +
> +    if ( likely(++data->generation != 0) )
> +        return;
> +
> +    /*
> +     * VMID generations are 64 bit.  Overflow of generations never happens.
> +     * For safety, we simply disable ASIDs, so correctness is established; it
> +     * only runs a bit slower.
> +     */
> +    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);

Is logging of the function name of any value here? Also, despite the x86
original havinbg it like this - generally no full stops please if log
messages. "VMID generation overrun; disabling VMIDs\n" would do.

> +bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
> +{
> +    struct vmid_data *data = &this_cpu(vmid_data);
> +
> +    /* Test if VCPU has valid VMID. */

x86 has a ->disabled check up from here; why do you not check ->used?

> +    if ( read_atomic(&vmid->generation) == data->generation )
> +        return 0;
> +
> +    /* If there are no free VMIDs, need to go to a new generation. */
> +    if ( unlikely(data->next_vmid > data->max_vmid) )
> +    {
> +        vmid_flush_hart();
> +        data->next_vmid = 1;
> +        if ( !data->used )
> +            goto disabled;
> +    }
> +
> +    /* Now guaranteed to be a free VMID. */
> +    vmid->vmid = data->next_vmid++;
> +    write_atomic(&vmid->generation, data->generation);
> +
> +    /*
> +     * When we assign VMID 1, flush all TLB entries as we are starting a new
> +     * generation, and all old VMID allocations are now stale.
> +     */
> +    return (vmid->vmid == 1);

Minor: Parentheses aren't really needed here.

Jan

