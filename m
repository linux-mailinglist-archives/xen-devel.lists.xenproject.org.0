Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAt4BC+awmm3fQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:05:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534E309E38
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 15:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260860.1554031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52N0-0001Lq-R1; Tue, 24 Mar 2026 14:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260860.1554031; Tue, 24 Mar 2026 14:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w52N0-0001JK-O6; Tue, 24 Mar 2026 14:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1260860;
 Tue, 24 Mar 2026 14:04:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w52Mz-0001JE-1r
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 14:04:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w52My-009JGS-Di
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:04:32 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c299e1-5cb7-0a2a0a5109dd-0a2a4507b0cc-24
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:04:32 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c299f0-fd74-0a2a45070019-d1558030ec0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 15:04:32 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486507134e4so16488025e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 07:04:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116ee562sm61029855e9.15.2026.03.24.07.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 07:04:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774361071; x=1774965871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZtXJ4QL4oYCky8vWNKV9ap6j7FNQfJ3Oa0YJj/kMEo=;
        b=HWp8iYrIQJQHy7giWOUH9pZZGoX400UcFBuYE5XYRRAkOOCeTf0YQAO41eqhQ0h+ei
         S+jnmwehcdgTx2U4gyTgK9rDFBjM45063reLWb75//8/mCRbGINgH6q6UhJLG2o0y8bU
         YOvY4oT5qy65VqUv7xnQV3P0ogtUD0biuF6H95oHiPdMx4kcJckMiG/4NV7WbncWMjwY
         SSZ/05IhCFnwq6eI7uAHQPVFRz3BjZPtEUKa66Yo2Lmt7Anr4UKEJCGXvfVcWrh3rbxU
         fM+nxgpfxqiW13er65X6Oso2vpJNzWfeYCcK2T0Oj5xcLCwVRRsDCsD/jnRJjxWn3JKc
         3Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361071; x=1774965871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZtXJ4QL4oYCky8vWNKV9ap6j7FNQfJ3Oa0YJj/kMEo=;
        b=hlkKNorLcWRfg6VWVzqnR9N+THs5jwppqeqzZ5ngQrCx0kSvrFQSHB2BGdB1bBKZJL
         X320JA0dzo8qPnmI0rAhifST344wp6h+YIdqQp1CwyCKoNUCrIkkkPcIQX1XrYsDGUiY
         DZS3mx99KkYRku2DZOOoLAEFSnhhyg/Suj7uclrzSYduDN/mXG4RKODp4SFKnMlnnags
         ILdfljMTM1EQJ5QBq/prnhClshDPt31yJ997huTciX3qyev/vPK47bfNV1TT5HSElDuT
         W1Tumgq39rz6LNo5mmU2v4oCnFhgUpiCe3jqykmZDHr6a37bcPkV4zXz3wXEmG814AHa
         OSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6tgglAyDqEAV1Y4Hpvf6nkP76wcvQHrAwQ9MyWgYiRoo8npw+zYfHivg2T88k7Lw782yITKqQos=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBxEdHPuS1GYFAEl4Zcjj0zjk2iHq/XNOboihvp5/f+DHm//00
	bcVqfJxLT8VBAOOHhGFw5kn8aTgaSOHK/Vlse829sjbiaEs/Y+/+1ubObELe45rKgQ==
X-Gm-Gg: ATEYQzyjYZS4xjIkehkUnZqy14hS8tdHjl7fqs7sUYUiAwShADjs0hLoXTqdGgdbJBp
	z42zl5kl77IVeSNI/eEYlUe/hnUNih0B7I2Xl1xi7NjNiLFnx2VmXmLgO+u4uDAFvaxdn/w0qqJ
	YeKD8Uw8PMEQXq4BKLNivCPhlz/LG0rKXSuXo4pBr77bW5GvI3e/Qmn3Rn1NsqSTigfU+JViTDF
	G3B/6yhJWnSHZt+mK0bXsMI7RyWPvNkwXpVNsm/ZVoOv4JHYijlOOkw2XlFZkaxbXUG8GEJN0yo
	5odOBjmPjWgoK1Tm7baKyNBEqp4BrVBluEvNPxXLwQD+lCqWfVNHEmnaTctqEm+zz4oLzoCJHgB
	QGtlNcmI1SM0ZrR8WPQxmt6+WS2RMwYWLjqP16bmymmYVuvoWaMXPDGnJNRxeu6q3L1dpxLhAvv
	4PYh4Kpo/OabeZN/hcOkS8FjlW1u2+LUwLe6mi46uvU5+yrHc9QRFCDLez6JQeU72xRvMGZkgL7
	twDmSaFJ1Op7o0=
X-Received: by 2002:a05:600c:320a:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-4871520d201mr7505535e9.31.1774361071228;
        Tue, 24 Mar 2026 07:04:31 -0700 (PDT)
Message-ID: <db8fd1fa-2db4-4df4-8e21-1412783786b2@suse.com>
Date: Tue, 24 Mar 2026 15:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: add exception table support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
 <c6d30625371d56bb8345c987ac6d8095cc7301d2.1773419622.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c6d30625371d56bb8345c987ac6d8095cc7301d2.1773419622.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774361072-4FEA3303-24606DA2/0/0
X-purgate-type: clean
X-purgate-size: 8597
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4534E309E38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:44, Oleksii Kurochko wrote:
> Introduce exception table handling for RISC-V so faults from selected
> instructions can be recovered via fixup handlers instead of being
> treated as fatal.
> 
> Add the RISC-V exception table format, sorting at boot to allow binary
> search used furthuer, and lookup from the trap handler. Update the
> linker script to emit the .ex_table section using introduced common
> EX_TABLE macro shared with other architectures.
> 
> Also, the __start___ext_table is aligned now by POINTER_ALIGN instead
> of just using hard-coded 8 as there is no too much sense to align
> __start___ext_table by 8 for 32-bit systems.

Nit: The identifier named here twice isn't correct (extra 't').

> This implementation is based on Linux 6.16.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Open question:
> 
> With some renaming the following could be generic, at least, between
> x86 and RISC-V:
>  - ASM_EXTABLE() definition
>  - All what is conencted with sort_extable().
>  - With some change of how x86 searchs an extension this cmp_ex_search()
>    could also go to common file.
> 
> Does it make sense to introduce xen/extable.h and common/extable.c?

Maybe, but not right here. Already the introduction of EX_TABLE for
linker script use might better have been broken out.

Seeing the names you suggest here, ...

> ---
>  xen/arch/riscv/Kconfig                |  1 +
>  xen/arch/riscv/Makefile               |  1 +
>  xen/arch/riscv/extables.c             | 85 +++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/extables.h | 72 +++++++++++++++++++++++
>  xen/arch/riscv/setup.c                |  3 +
>  xen/arch/riscv/traps.c                |  3 +
>  xen/arch/riscv/xen.lds.S              |  3 +
>  xen/arch/x86/xen.lds.S                |  6 +-
>  xen/include/xen/xen.lds.h             | 10 ++++
>  9 files changed, 179 insertions(+), 5 deletions(-)
>  create mode 100644 xen/arch/riscv/extables.c
>  create mode 100644 xen/arch/riscv/include/asm/extables.h

... is there a reason you use plural in the name here?

> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -3,6 +3,7 @@ obj-y += cpufeature.o
>  obj-y += domain.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += entry.o
> +obj-$(CONFIG_HAS_EX_TABLE) += extables.o

Simply obj-y please as long as the select is unconditional.

> --- /dev/null
> +++ b/xen/arch/riscv/extables.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/sort.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/extables.h>
> +#include <asm/processor.h>
> +
> +#define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
> +
> +static inline unsigned long ex_insn(const struct exception_table_entry *ex)
> +{
> +    return EX_FIELD(ex, insn);
> +}
> +
> +static inline unsigned long ex_fixup(const struct exception_table_entry *ex)
> +{
> +    return EX_FIELD(ex, fixup);
> +}
> +
> +static void __init cf_check swap_ex(void *a, void *b)
> +{
> +    struct exception_table_entry *x = a, *y = b, tmp;
> +    int delta = b - a;

Better play safe and use "long" (as we have it for x86)?

> +    tmp = *x;
> +    x->insn = y->insn + delta;
> +    y->insn = tmp.insn - delta;
> +
> +    x->fixup = y->fixup + delta;
> +    y->fixup = tmp.fixup - delta;
> +}
> +
> +static int __init cf_check cmp_ex_sort(const void *a, const void *b)
> +{
> +    const unsigned long l = ex_insn(a);
> +    const unsigned long r = ex_insn(b);
> +
> +    /* avoid overflow */
> +    return (l > r) - (l < r);
> +}
> +
> +void __init sort_extable(void)

Better account for live-patching right away (see corresponding x86 code)?

> +{
> +    sort(__start___ex_table,  __stop___ex_table - __start___ex_table,
> +         sizeof(struct exception_table_entry), cmp_ex_sort, swap_ex);
> +}
> +
> +static int cf_check cmp_ex_search(const void *key, const void *elt)
> +{
> +    const unsigned long k = *(const unsigned long *)key;

The deref here looks to be needed solely because you pass &pc into bsearch().
Generally I'd expect both search functions to be pretty similar (if already
distinct ones are needed, which indeed looks to make things easier here).

> +    const unsigned long insn = ex_insn(elt);
> +
> +    /* avoid overflow */
> +    return (k > insn) - (k < insn);
> +}
> +
> +static bool ex_handler_fixup(const struct exception_table_entry *ex,
> +			                 struct cpu_user_regs *regs)

Nit: Bad indentation.

> +{
> +	regs->sepc = ex_fixup(ex);
> +
> +	return true;

Nit: Bad use of hard tabs.

And then - why the boolean return type, when this can't fail anyway?

> +}
> +
> +bool fixup_exception(struct cpu_user_regs *regs)
> +{
> +    unsigned long pc = regs->sepc;
> +    const struct virtual_region *region = find_text_region(pc);
> +    const struct exception_table_entry *ex;
> +
> +    if ( !region || !region->ex )
> +        return false;
> +
> +    ex = bsearch(&pc, region->ex, region->ex_end - region->ex,
> +                 sizeof(struct exception_table_entry), cmp_ex_search);

Please prefer sizeof(<expression>) over sizeof(<type>) (also in the sort()
invocation further up, as I notice only now).

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/extables.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM__RISCV__ASM_EXTABLES_H
> +#define ASM__RISCV__ASM_EXTABLES_H
> +
> +#ifdef __ASSEMBLER__
> +
> +#define ASM_EXTABLE(insn, fixup)    \
> +    .pushsection .ex_table, "a";    \
> +    .balign     4;                  \
> +    .long		((insn) - .);       \
> +    .long		((fixup) - .);      \

Nit: More uses of hard tabs. Maybe that alone is the reason for the mis-aligned
trailing backslashes.

> +    .popsection;
> +.endm

I can't spot the corresponding .macro. What's going on here?

> +#else /* __ASSEMBLER__ */
> +
> +#include <xen/bug.h>
> +#include <xen/stringify.h>
> +
> +struct cpu_user_regs;
> +
> +#define ASM_EXTABLE(insn, fixup)        \
> +    ".pushsection .ex_table, \"a\"\n"   \
> +    ".balign    4\n"                    \
> +    ".long      ((" #insn ") - .)\n"     \
> +    ".long      ((" #fixup ") - .)\n"    \

More misaligned backslashes.

> +    ".popsection\n"
> +
> +/*
> + * The exception table consists of pairs of relative offsets: the first
> + * is the relative offset to an instruction that is allowed to fault,
> + * and the second is the relative offset at which the program should
> + * continue. No registers are modified, so it is entirely up to the
> + * continuation code to figure out what to do.

And the program counter is not a register?

> + * All the routines below use bits of fixup code that are out of line
> + * with the main instruction path.  This means when everything is well,
> + * we don't even have to jump over them.  Further, they do not intrude
> + * on our cache or tlb entries.

What is this paragraph about? There's nothing "below" which I can
associate this with.

> + */
> +struct exception_table_entry {
> +	int32_t insn, fixup;
> +};
> +
> +extern struct exception_table_entry __start___ex_table[];
> +extern struct exception_table_entry __stop___ex_table[];
> +
> +#ifdef CONFIG_HAS_EX_TABLE

Why, when this is a RISC-V specific header and HAS_EX_TABLE is selected
unconditionally?

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -12,6 +12,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  
> +#include <asm/extables.h>
>  #include <asm/cpufeature.h>
>  #include <asm/intc.h>
>  #include <asm/processor.h>
> @@ -217,6 +218,8 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>  
>              break;
>          }
> +        else if ( fixup_exception(cpu_regs) )
> +            break;

Instead od the "else" better put a blank line ahead of the if(), to
visually separate the set of checks.

> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -219,4 +219,14 @@
>  #define VPCI_ARRAY
>  #endif
>  
> +#ifdef CONFIG_HAS_EX_TABLE

No real need for this?

> +#define EX_TABLE                  \
> +        . = ALIGN(POINTER_ALIGN); \

Strictly speaking the original 8 (in x86 code) as much as this is more
than we need - each element is a struct of 2 4-byte entities, after all.

Jan

