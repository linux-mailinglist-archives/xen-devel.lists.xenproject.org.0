Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF203625F4D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 17:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442661.697065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otWj0-0006tx-AQ; Fri, 11 Nov 2022 16:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442661.697065; Fri, 11 Nov 2022 16:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otWj0-0006ry-6j; Fri, 11 Nov 2022 16:17:50 +0000
Received: by outflank-mailman (input) for mailman id 442661;
 Fri, 11 Nov 2022 16:17:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBPA=3L=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1otWiz-0006rs-1Y
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 16:17:49 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617531e1-61dc-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 17:17:47 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id kt23so13611002ejc.7
 for <xen-devel@lists.xenproject.org>; Fri, 11 Nov 2022 08:17:47 -0800 (PST)
Received: from [192.168.1.93] (adsl-235.109.242.225.tellas.gr.
 [109.242.225.235]) by smtp.gmail.com with ESMTPSA id
 fi11-20020a056402550b00b00461c1804cdasm1275204edb.3.2022.11.11.08.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:17:46 -0800 (PST)
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
X-Inumbo-ID: 617531e1-61dc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXjrCI04EMEzHiFcpiETeIefl7LbYSYwy1waySB6kBw=;
        b=XD4Bpv0QcKegzLvzhdebKdsYmiCxqTFb5e4OiPfdi+rKpOVY5N4Pf+Dej+yqSsB4cp
         irfFINdp9vjtwnMs7VB1d7O5eJ/tRn5WadorgD76c6eQZmEZWaOQk07IZMNb2oCp83Sv
         a/wVEOmPq9NwTWiyo9ZDtc+4Uw02xrX7y9CdmyufuUSd54WHwfK25SPbTbYfv0hN2wKO
         Bvd3UeG4OqLVLc0IZyAR+fn+DIjWx/5qFZg/MOcih7sr9NXZFL3ITY+E8yAU7XI+A9J2
         RcrVrKfEj6jNIBBZeevxdFrsKcpyj+RtZ+7POgTWGdARb1DRGBsaO5ca6vZhyNCLfz4p
         EuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXjrCI04EMEzHiFcpiETeIefl7LbYSYwy1waySB6kBw=;
        b=xwhX5qOG8kzJj66dsc0Qp491ol3DAeS+w+ROcCSdyqlQe4nJcVFo0pXHwQQ2oDR/rc
         6pA+H3FEiwOR0MbLcu05LkbmBz+gAOr8m9vlJKOcPsg2kVzX3QUoQfaLAwvvexZTSwSf
         Yc6chf2BOndPwyPqDQ8yp/DzumA6aL8iKSFCA3bMFqLXsYZTtf9ogQ5ChaC3Xgnisyba
         TdI0d8AsxsAHE2rKqmHUCKUpA3aKEOBbWIgBgiQ3D6mRrbV/nwhJFO3wPQ4RYRC3dUgq
         s9N6A6lvtr6XJerUS0j6mR2Zf+X8upfx8TwR2Jt+2opu1aQnvnANm80iRUXBbIXOpaW+
         XanA==
X-Gm-Message-State: ANoB5plZ/ruB8X6VRb17FzKWx0Nsl0J2UKWCDHTswhmlRBuwbaFPfopF
	CAOcVgs2p6WBcD5RI7vb4II=
X-Google-Smtp-Source: AA0mqf7Lv8kNiAW3eH5AgwpyJcc5OzzP1sQ7R+10oP7P6H6vve5TR5jFwrMvaijr1oW3E6UaVvlLHw==
X-Received: by 2002:a17:906:c9d9:b0:78d:46b1:3cf2 with SMTP id hk25-20020a170906c9d900b0078d46b13cf2mr2426451ejb.727.1668183467028;
        Fri, 11 Nov 2022 08:17:47 -0800 (PST)
Message-ID: <3ea29174-abb4-0fe9-fde8-28d4d62f2f67@gmail.com>
Date: Fri, 11 Nov 2022 18:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v3 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 jgrall@amazon.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-12-ayan.kumar.halder@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221111141739.2872-12-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/11/22 16:17, Ayan Kumar Halder wrote:
> On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
> Furthermore, ldrd/strd instructions are not decoded by Arm when running as
> a guest to access emulated MMIO region.
> Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
> which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
> 32 bits.
> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
> fashion, so we have used {read/write}q_relaxed_non_atomic() on Arm32.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
> 2. No need to use le64_to_cpu() as the returned byte order is already in cpu
> endianess.
> 
> v2 - 1. Replace {read/write}q_relaxed with {read/write}q_relaxed_non_atomic().
> 
>   xen/arch/arm/gic-v3.c               | 12 ++++++++++++
>   xen/arch/arm/include/asm/arm32/io.h |  9 +++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 6457e7033c..a5bc549765 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -651,7 +651,11 @@ static void __init gicv3_dist_init(void)
>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
> +#ifdef CONFIG_ARM_32
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
> +#else
>           writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
> +#endif
>   }
>   
>   static int gicv3_enable_redist(void)
> @@ -745,7 +749,11 @@ static int __init gicv3_populate_rdist(void)
>           }
>   
>           do {
> +#ifdef CONFIG_ARM_32
> +            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
> +#else
>               typer = readq_relaxed(ptr + GICR_TYPER);
> +#endif
>   
>               if ( (typer >> 32) == aff )
>               {
> @@ -1265,7 +1273,11 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>   
>       if ( desc->irq >= NR_GIC_LOCAL_IRQS )
> +#ifdef CONFIG_ARM_32
> +        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
> +#else
>           writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
> +#endif
>   
>       spin_unlock(&gicv3.lock);
>   }
> diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
> index 73a879e9fb..4ddfbea5c2 100644
> --- a/xen/arch/arm/include/asm/arm32/io.h
> +++ b/xen/arch/arm/include/asm/arm32/io.h
> @@ -80,17 +80,26 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>                                           __raw_readw(c)); __r; })
>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>                                           __raw_readl(c)); __r; })
> +#define readq_relaxed_non_atomic(c) \
> +                         ({ u64 __r = (((u64)readl_relaxed((c) + 4)) << 32) | \
> +                                             readl_relaxed(c); __r; })

As Julien pointed out, the expression c will be evaluated twice and if 
it produces side effects they will be performed twice.
To prevent this, you can either assign the expression to a local 
variable and pass this one to readl_relaxed() or use a static inline 
function instead of a macro, for implementing readq_relaxed_non_atomic().
The latter is the MISRA C recommended (not strictly required) approach 
according to Dir 4.9 "A function should be used in preference to a 
function-like macro where
  they are interchangeable".
...

>   
>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
>   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
> +#define writeq_relaxed_non_atomic(v,c) \
> +                                ({ writel_relaxed((u32)v, c); \
> +                                   writel_relaxed((u32)((v) >> 32), (c) + 4); })

... same here.

>   
>   #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
>   #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
>   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
> +#define readq(c)                ({ u64 __v = readq_relaxed_non_atomic(c); \
> +                                             __iormb(); __v; })

I think that, here also, the macro identifier needs to inform that the 
access is non-atomic.
...

>   
>   #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed_non_atomic(v,c); })

... same here.

>   
>   #endif /* _ARM_ARM32_IO_H */

-- 
Xenia

