Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCFZJI5EzmlQmQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:27:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B6387B68
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271473.1559613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EuB-0006ax-ST; Thu, 02 Apr 2026 10:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271473.1559613; Thu, 02 Apr 2026 10:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8EuB-0006Ye-Pi; Thu, 02 Apr 2026 10:04:03 +0000
Received: by outflank-mailman (input) for mailman id 1271473;
 Thu, 02 Apr 2026 10:04:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8EuA-0006YY-R5
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:04:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8EuA-00F5J2-36
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:04:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce3f11-2eae-0a2a0a5409dd-0a2a450b8f02-2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:04:01 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce3f11-bca8-0a2a450b0019-d1558034d03d-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:04:01 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so8413765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:04:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a626100sm104214135e9.1.2026.04.02.03.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 03:04:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1775124241; x=1775729041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sEeSB2R8YMZaBkK4fuhIHo275MsR8H9lYYg2WvMdxmA=;
        b=fIU5SMFnsp/Km/TL3ZI7s9/JIhG02SHouOjCKgVj1GLBkoygYvNNOItkNztGOLl3zi
         UQQ/snKJ/R923r9ynRSfdSSucuYG7SLco0ND4w2w9YCfYS6ng3c0SXy7JBZnTLC/QD10
         HPvDLfieShtlLThfm0Cf5D8HDRt7KDo2d2Sl++daRq9ssWK7nGYMVM5asBQm1bqYpMEP
         soUkjxNTrMyb/G3fSyG1/Y65nLXyVenI66sM40ocr5hEt2IyyXXK9//oXzPnRCXWibcw
         6XmPgI8aKd/lCK7fs6GPpcE2RW3sxPtoB4MiwaRVtXy7ZrFjQ+dh+kewUb14ULAr+STa
         T99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124241; x=1775729041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEeSB2R8YMZaBkK4fuhIHo275MsR8H9lYYg2WvMdxmA=;
        b=Mq/bCGBG0sdxxG5fLlaJVSTzgJXH63++4r/79QRp1Lr+S+KOl4kVSi2KW4qbXpSnME
         wYmlbCO20LRPwI6/f8gD6gdQwEOt2mfJY4N0yCE3dsEAnpVy2EHI6OBCgRp8KvGmgCBZ
         isiU/FB85cSuD3KD/l8fJn2ahaLDgHzczZguNwaS3EMn10e7ZxO+PY6xDW3dDWs4czLa
         GrRjV21/zqid+UaJA4eKyN4/ZqFYr7AIk5ps9zl5j8gfOlNGWzAXucMYVQFESZnDWlju
         7VVamkFxxWiNwxerJWlc/IHZbWra/VRuN/yS30NV/YMptJKXVLSX9Z/2QjBr12JnM66W
         41EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+p1eEAPPtyXGWOP08UHM7zS1+Q9+ofNqYhpjVGFbA1zUbQy7pwIe9owZ6Kj8ecmewM7Vke4qwzj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoxnQZcI7rRAGSQWMrcRy3jz0d0cV6vd8bkg04KKviAK2dyK9i
	Hb7jXt2P9PZjEiwL5w2uFm03i6dEHXO9DvqE7hx/I82QRi7vW2anEvY/yM4SHWi/hg==
X-Gm-Gg: ATEYQzzDMrsP91ADaXwnykv3xxiKMqtI9Uft6HlOxdXtehWP5vnqi+whXLjfo5CMQRv
	+W/aFxAl5094OX3cpf1ZDUnBusGrWspIWTxk754n7vkK35xnb1zMAxpFui7amr8RNyfL7GGO7+M
	zu9p5uBYMzdWxs1DEuKFzCqbHFnpDmwXOzDCjGrt0XEC79z0vryJSqRd7sz4SuZAm1xJhtxoF0A
	ek6L/I5udA4zEUBN8eiczOireD0ZFyNw3+dk9oxQwzZ2BqQKbzrDP6YcObnlCe+QTHuD3Q+CsdL
	OuVM6mtrD57eMe6BlQYvqOCBvnys0vldMtQ3Us10NUhT3LKUiAKgNX0/dKXpRG5IUnspJcwAqbI
	NUARKCdnfTR4UgWa98m14tdvPC4mEjBpk9wfcvsY923rcGgTy26wLpyQbi3N/nUYIX05+KntWCn
	qx3ORl0QHmtAIjTshIR9Ir84/lcJOLT4NK2CVTHzqEeYxgcy7zt7G/TH7tAcTF++8htqC07kz+O
	eHxV+A7PAWhNKL5teV12s714g==
X-Received: by 2002:a05:600c:354a:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-48883592076mr113085105e9.22.1775124241164;
        Thu, 02 Apr 2026 03:04:01 -0700 (PDT)
Message-ID: <09fed304-685c-46a9-9159-72baa1721224@suse.com>
Date: Thu, 2 Apr 2026 12:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/27] xen/riscv: add basic VGEIN management for AIA
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f358325514c91c540e0edf992ca51414a1964fe0.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775124241-F49CB2A1-DDE6FB35/0/0
X-purgate-type: clean
X-purgate-size: 7886
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C77B6387B68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> AIA provides a hardware-accelerated mechanism for delivering external
> interrupts to domains via "guest interrupt files" located in IMSIC.
> A single physical hart can implement multiple such files (up to GEILEN),
> allowing several virtual harts to receive interrupts directly from hardware

Isn't use of such an optimization coming prematurely? Shouldn't this series
focus on getting basic functionality in place?

> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -1,11 +1,24 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bitmap.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/sections.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
> +#include <xen/xvmalloc.h>
>  
> +#include <asm/aia.h>
>  #include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/current.h>
> +
> +/*
> + * Bitmap for each physical cpus to detect which VS (guest)
> + * interrupt file id was used.
> + */
> +DEFINE_PER_CPU(struct vgein_bmp, vgein_bmp);

Why can this not be static? All management looks to be in this same file.

> @@ -14,12 +27,109 @@ bool aia_available(void)
>      return is_aia_available;
>  }
>  
> +int __init vgein_init(unsigned int cpu)

If this needs invoking once per CPU being brought up, it can't be __init.

Also - static?

> +{
> +    struct vgein_bmp *vgein = &per_cpu(vgein_bmp, cpu);
> +
> +    csr_write(CSR_HGEIE, -1UL);
> +    vgein->geilen = flsl(csr_read(CSR_HGEIE));
> +    csr_write(CSR_HGEIE, 0);
> +    if ( vgein->geilen )
> +        vgein->geilen--;

I don't understand this. The "len" in "geilen" stands for "length", I suppose,
i.e. the number of bits. Hmm, the spec itself is inconsistent: "The number of
bits implemented in hgeip and hgeie for guest external interrupts is UNSPECIFIED
and may be zero. This number is known as GEILEN." This may or may not include
bit 0 (which is implemented, but r/o zero). Then saying "Hence, if GEILEN is
nonzero, bits GEILEN:1 shall be writable in ..." suggests 0 isn't included, but
that's not unambiguous.

Anyway, may I suggest

    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);

instead?

> +    BUG_ON(!vgein->geilen);

You can return (an error, but see the respective remark on the earlier patch),
no need to crash the system. That return may want to come after the printk()
below, though.

> +    printk("cpu%d.geilen=%d\n", cpu, vgein->geilen);

As before - %u please with unsigned int.

> +    if ( !vgein->bmp )

Why would this check be needed?

> +    {
> +        vgein->bmp = xvzalloc_array(unsigned long, BITS_TO_LONGS(vgein->geilen));

With the determination above, isn't BITS_TO_LONGS(vgein->geilen) ==
BITS_PER_LONG in all cases? Surely you don't mean to runtime-allocate
space for a single unsigned long? So I wonder is the dimension used
is wrong.

If it isn't, dynamically allocating the owners array may be more
useful, as (on RV64) occupies a fixed 512 bytes right now.

> +        if ( !vgein->bmp )
> +            return -ENOMEM;
> +    }
> +
> +    spin_lock_init(&vgein->lock);
> +
> +    return 0;
> +}
> +
>  int __init aia_init(void)
>  {
> +    int rc = 0;
> +
>      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>          return -ENODEV;
>  
> +    if ( (rc = vgein_init(0)) )
> +        return rc;
> +
>      is_aia_available = true;

Ah, this answers a question of mine on the earlier patch: This boolean
indicates more than just the extension being available. But why does
the description there not simply say so? How am I as a reviewer supposed
to know?

> -    return 0;
> +    return rc;
> +}
> +
> +unsigned int vgein_assign(struct vcpu *v)
> +{
> +    unsigned int vgein_id;
> +

Seemingly undue blank line.

> +    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
> +    unsigned long *bmp = vgein_bmp->bmp;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&vgein_bmp->lock, flags);
> +    vgein_id = bitmap_weight(bmp, vgein_bmp->geilen);

How can the ID to use be the number of bits which are set? This only works
if all set bits are contiguous at the bottom.

> +    /*
> +     * All vCPU guest interrupt files are used and we don't support a case
> +     * when number of vCPU on 1 pCPU is bigger then geilen.
> +     */

This wants checking in vgein_init() then. CPUs (beyond the boot one)
violating this should not be brought online.

> +    ASSERT(vgein_id < vgein_bmp->geilen);

What if not bit is available? By asserting, you assume the caller will not
call here when no ID is available. Yet there is no caller of this function,
so how can one verify whether this assertion is appropriate?

> +    bitmap_set(bmp, vgein_id, 1);

__set_bit()?

> +    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
> +
> +    /*
> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
> +     * external interrupt source is selected for VS-level external interrupts
> +     * according to RISC-V priviliged spec:
> +     *   8.2.1 Hypervisor Status Register (hstatus) in RISC-V priviliged spec:

Please avoid section numbers in such references. The section of this name
in the version I'm looking at is 21.2.1.

> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
> +     *   a guest external interrupt source for VS-level external interrupts.
> +     *   VGEIN is a WLRL field that must be able to hold values between zero
> +     *   and the maximum guest external interrupt number (known as GEILEN),
> +     *   inclusive.
> +     *   When VGEIN=0, no guest external interrupt source is selected for
> +     *   VS-level external interrupts.
> +     */
> +    vgein_id++;

Related to my comment regarding GEILEN, this shouldn't be necessary. Keep
bits in their natural positions, and simply avoid using bit 0 (either by
setting it during init and then never clearing it, or by starting the
scan for clear bits at bit 1).

> +#ifdef VGEIN_DEBUG
> +    printk("%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
> +           __func__, v, vgein_id, v->processor, *bmp);
> +#endif
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
> +        MASK_INSR(vgein_id, HSTATUS_VGEIN);

When is this function going to be invoked? (As before, not knowing this is
one of the problems with introducing functions with no callers.)

> +    return vgein_id;
> +}
> +
> +void vgein_release(struct vcpu *v, unsigned int vgen_id)
> +{
> +    unsigned long flags;
> +

Another seemingly stray blank line.

> +    struct vgein_bmp *vgein_bmp = &per_cpu(vgein_bmp, v->processor);
> +
> +    spin_lock_irqsave(&vgein_bmp->lock, flags);
> +    bitmap_clear(vgein_bmp->bmp, vgen_id - 1, 1);

__clear_bit()?

> +    spin_unlock_irqrestore(&vgein_bmp->lock, flags);
> +
> +#ifdef VGEIN_DEBUG
> +    printk("%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
> +           __func__, vgen_id, v->processor, *vgein_bmp->bmp);

I can't spot a difference from the message in vgein_assign(). How is one
to distinguish the two in a log?

> --- a/xen/arch/riscv/include/asm/aia.h
> +++ b/xen/arch/riscv/include/asm/aia.h
> @@ -3,8 +3,26 @@
>  #ifndef ASM__RISCV__AIA_H
>  #define ASM__RISCV__AIA_H
>  
> +#include <xen/percpu.h>
> +#include <xen/spinlock.h>
> +
> +struct vcpu;
> +
> +struct vgein_bmp {

What does the _bmp suffix indicate here? There's ...

> +    unsigned long *bmp;

... a bitmap field, yes, but ...

> +    spinlock_t lock;
> +    struct vcpu *owners[BITS_PER_LONG];
> +    unsigned int geilen;
> +};

... the structure as a whole has quite a bit more.

Jan

