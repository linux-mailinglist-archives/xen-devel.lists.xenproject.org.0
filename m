Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A19A65FB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 13:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823354.1237334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qIp-0003xt-DG; Mon, 21 Oct 2024 11:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823354.1237334; Mon, 21 Oct 2024 11:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2qIp-0003vo-AW; Mon, 21 Oct 2024 11:10:23 +0000
Received: by outflank-mailman (input) for mailman id 823354;
 Mon, 21 Oct 2024 11:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2qIo-0003vi-73
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 11:10:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fd1a5b4-8f9d-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 13:10:21 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso448643566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 04:10:21 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571ea5sm188718066b.160.2024.10.21.04.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 04:10:19 -0700 (PDT)
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
X-Inumbo-ID: 0fd1a5b4-8f9d-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729509020; x=1730113820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RdQr/WUPUYdYFMMdvsLv83oQ5FLo3thV2YYeKX+s5k8=;
        b=E4K5t3xv/Qh08jiIuakGnBdu/51BohKwaI8na95Dpa3otwA4id7Ku6ohtvfKcIxdYv
         bU7w3vhQAE/z/0eyyPKbJ1SRuAiuom9EqV45HhiD5zO5lAE5b6jmVOLw7ECfF5h0DUGf
         78aG56qOJAc1XcVGMCqp8bijDXMgQ6Ul2SLdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729509020; x=1730113820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdQr/WUPUYdYFMMdvsLv83oQ5FLo3thV2YYeKX+s5k8=;
        b=A+iymG6EknwZbIAh8sdyL+DhPQ4OtgiZrzz7uvOX2MbSdYRWgvYfydddxi2yJi+7gt
         /A/DDd3UHsR9919W+AD35Ubsrw+tnFo2w7khl+oYQFrqCck11jNDmGVg1C/z0udmllHk
         8c42SlkQ9c6YnjMJEFyky0GyIsZbEC+XoerbdXW1hNXdMUcw8RsYulxLdC4IKa0inzD3
         BJdcNN/O+Vsu3ryFQIBFeTKdFqokLApgX1W9K2K1djlMg60jMwGa7yL6LhgNtD6eBbKq
         NB/JGvMrrfciefTdVBWHuP0ff6x0vt24vsY3vCvb2ueBJrZseUlB1oY9LGv7ns3rMKHo
         DU0g==
X-Forwarded-Encrypted: i=1; AJvYcCXWSq8HEw0/gjH93XhTd0Vs/qHzJbtyjMr+lOf6ZpL+eOBk2DTdivNp5tOjDEjW96RYtiiPmzuSvkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze6byMJgxJxUPSP80vGqUo3aR5ReMbkz5gRlYsM6gTOK/G4ySx
	w5iG/XD5wWvQDn5p+QuAcqlgn2DQTYFPXo+cf0NQwU9Xr/jbn8CUrSYhW0AcSpI=
X-Google-Smtp-Source: AGHT+IFkeCsmjf55MisGwN/cfMHmCRnZuCle/ahoV4SwGgN2hmeD9dwnWLVKzb9z5asYFSFOPbM3XQ==
X-Received: by 2002:a17:907:1b81:b0:a9a:835b:fc8e with SMTP id a640c23a62f3a-a9a835bffd1mr540871066b.54.1729509020453;
        Mon, 21 Oct 2024 04:10:20 -0700 (PDT)
Message-ID: <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
Date: Mon, 21 Oct 2024 12:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Willi Junga <xenproject@ymy.be>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241018080813.45759-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/10/2024 9:08 am, Roger Pau Monne wrote:
> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> repurposed to contain part of the offset into the remapping table.  Previous to
> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> table would match the vector.  Such logic was mandatory for end of interrupt to
> work, since the vector field (even when not containing a vector) is used by the
> IO-APIC to find for which pin the EOI must be performed.
>
> Introduce a table to store the EOI handlers when using interrupt remapping, so
> that the IO-APIC driver can translate pins into EOI handlers without having to
> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> unconditionally when interrupt remapping is enabled, even if strictly it would
> only be required for AMD-Vi.
>
> Reported-by: Willi Junga <xenproject@ymy.be>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Yet more fallout from the multi-MSI work.  That really has been a giant
source of bugs.

> ---
>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e40d2f7dbd75..8856eb29d275 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>  
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>  
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> + * format repurposes the vector field to store the offset into the Interrupt
> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> + * longer matches the contents of the RTE vector field.  Add a translation
> + * table so that directed EOI uses the value in the RTE vector field when
> + * interrupt remapping is enabled.
> + *
> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> + * when using the remapped format, but use the translation table uniformly in
> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + */
> +static unsigned int **apic_pin_eoi;

I think we can get away with this being uint8_t rather than unsigned
int, especially as we're allocating memory when not strictly necessary.

The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.

Vector 0xff is strictly SPIV and not allocated for anything else, so can
be reused as a suitable sentinel here.

> +
>  static void share_vector_maps(unsigned int src, unsigned int dst)
>  {
>      unsigned int pin;
> @@ -273,6 +289,13 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Might be called before apic_pin_eoi is allocated.  Entry will be
> +         * updated once the array is allocated and there's an EOI or write
> +         * against the pin.
> +         */

Is this for the xAPIC path where we turn on interrupts before the IOMMU ?

> +        if ( apic_pin_eoi )
> +            apic_pin_eoi[apic][pin] = e.vector;
>      }
>      else
>          iommu_update_ire_from_apic(apic, pin, e.raw);
> @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( apic_pin_eoi )
> +            vector = apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector == IRQ_VECTOR_UNASSIGNED )
> +        {
>              vector = __ioapic_read_entry(apic, pin, true).vector;
> +            if ( apic_pin_eoi )
> +                /* Update cached value so further EOI don't need to fetch it. */
> +                apic_pin_eoi[apic][pin] = vector;
> +        }
>  
>          *(IO_APIC_BASE(apic)+16) = vector;
>      }
> @@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
>  
>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
>  
> +    if ( iommu_intremap )

MISRA requires this to be iommu_intremap != iommu_intremap_off.

But, if this safe on older hardware?  iommu_intremap defaults to on
(full), and is then turned off later on boot for various reasons.

We do all memory allocations in setup_IO_APIC_irqs() so at least we get
to see a consistent view of iommu_intremap.

I suppose there's nothing wrong with having an extra cache of the vector
in the way when not using interrupt remapping, so maybe it's fine?

> +    {
> +        apic_pin_eoi = xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics);
> +        BUG_ON(!apic_pin_eoi);
> +    }
> +
>      for (apic = 0; apic < nr_ioapics; apic++) {
> +        if ( iommu_intremap )
> +        {
> +            apic_pin_eoi[apic] = xmalloc_array(typeof(**apic_pin_eoi),
> +                                               nr_ioapic_entries[apic]);
> +            BUG_ON(!apic_pin_eoi[apic]);
> +
> +            for ( pin = 0; pin < nr_ioapic_entries[apic]; pin++ )
> +                apic_pin_eoi[apic][pin] = IRQ_VECTOR_UNASSIGNED;
> +        }

This logic will be better if you pull nr_ioapic_entries[apic] out into a
loop-local variable.

It should also allow the optimiser to turn the for loop into a memset(),
which it can't now because of possible pointer aliasing with the
induction variable.

But overall, the patch looks broadly ok to me.

~Andrew

