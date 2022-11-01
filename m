Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB96144E3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 08:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433342.686324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oplNv-0007Y7-Pz; Tue, 01 Nov 2022 07:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433342.686324; Tue, 01 Nov 2022 07:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oplNv-0007Uh-Mw; Tue, 01 Nov 2022 07:08:31 +0000
Received: by outflank-mailman (input) for mailman id 433342;
 Tue, 01 Nov 2022 07:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Jvn=3B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oplNt-0007Ub-P9
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 07:08:29 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd3300d-59b3-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 08:08:28 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id 21so20585935edv.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Nov 2022 00:08:28 -0700 (PDT)
Received: from [192.168.1.93] (adsl-235.109.242.227.tellas.gr.
 [109.242.227.235]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056402150e00b004610899742asm4120503edw.13.2022.11.01.00.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 00:08:27 -0700 (PDT)
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
X-Inumbo-ID: fbd3300d-59b3-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OE5nUEXCoGJTQIxnJ6QxeDcCeetfHlEtd4i1iX4NJvE=;
        b=lC5WXkEYCyogMF5KDuV2BjapNnYHA8wyKrU4ISZGwhnhjsCgCVzhsgF3NfrMG8kXzb
         VMLqUUC6+ceeCCjuLsaLwiIFLculq+tpYOeQ0NIFti8EC8cxRkomWzR0RZOuQWQOB8wC
         exz7RUlj46FhAmvYa+RonecjO2837Rgbf9WNw1eZ0fQQQPf/1XBvPQcnMpxS9BvtOq0e
         gYcq/s+H12bHSEDQ3yxJk+A3qjxnEkSqJmV95jTbRaj/hrEzceDRbQ38YUBNJxkyj2LN
         jjYj32TWq6Jq7OsMsFhcNlG4WxqiVx2fICf3iQfDHHZVSAYX79I5LHlMIXc3ifaKVWvv
         xdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5nUEXCoGJTQIxnJ6QxeDcCeetfHlEtd4i1iX4NJvE=;
        b=8MLrTXJyTX++FLGYrBPKzOoa6qKnpo37bqrYIN2mcNWUhm1DWa7hfaivy3SN/wt2VR
         OVPTFyzljJuN5I52ICxsO7d1nBuZSNfD1Z/zFEz/NmXi5yk8MwCegC8LV2CQopUQew+s
         fleuno2mqVedZqkOxkva9QIgWmMDmeqnE9323NmSplCq4+F9Rqd7ahhnYH9haA9Y1D6W
         1j1vHqRCKkLMHkztwD2x4PiEdgvOP1ISnXJIpnxjmb0YFJQ+4dZRy6KmpUoecci5q5Vz
         xx3O6bIWGAhQw2oNf7VseHIwwjkXe1MifI91gXFvgc4a9Fj07Ds5v3EfsyBr4l3MPLoz
         rS/A==
X-Gm-Message-State: ACrzQf3KzP8zE/8l3w2KkUHQoxKlvRJE1B7TDGOJanL2MZ6sDnatzkaG
	XVqXGUi39/p1x6ID4zrQg9E=
X-Google-Smtp-Source: AMsMyM4a4CfeWzdQOzdSI95DDPT3ciy9u3s5Iv4flcBeuAUiyrkEFAh/Mq7np1YepV61eIDGe8B6hQ==
X-Received: by 2002:a05:6402:1d4e:b0:461:c7bd:7d9c with SMTP id dz14-20020a0564021d4e00b00461c7bd7d9cmr17551263edb.284.1667286507630;
        Tue, 01 Nov 2022 00:08:27 -0700 (PDT)
Message-ID: <956195e5-0409-1da0-f0db-a0192061d29d@gmail.com>
Date: Tue, 1 Nov 2022 09:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN v2 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-12-ayankuma@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221031151326.22634-12-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/31/22 17:13, Ayan Kumar Halder wrote:
> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
> This uses ldrd/strd instructions.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
> 2. No need to use le64_to_cpu() as the returned byte order is already in cpu
> endianess.
> 
>   xen/arch/arm/include/asm/arm32/io.h | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
> index 73a879e9fb..d9d19ad764 100644
> --- a/xen/arch/arm/include/asm/arm32/io.h
> +++ b/xen/arch/arm/include/asm/arm32/io.h
> @@ -72,6 +72,22 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>           return val;
>   }
>   
> +static inline u64 __raw_readq(const volatile void __iomem *addr)
> +{
> +        u64 val;
> +        asm volatile("ldrd %Q1, %R1, %0"
> +                     : "+Qo" (*(volatile u64 __force *)addr),
> +                       "=r" (val));
> +        return val;
> +}
> +
> +static inline void __raw_writeq(u64 val, const volatile void __iomem *addr)
> +{
> +    asm volatile("strd %Q1, %R1, %0"
> +                 : "+Q" (*(volatile u64 __force *)addr)
> +                 : "r" (val));
> +}
> +
>   #define __iormb()               rmb()
>   #define __iowmb()               wmb()
>   
> @@ -80,17 +96,22 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>                                           __raw_readw(c)); __r; })
>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>                                           __raw_readl(c)); __r; })
> +#define readq_relaxed(c) ({ u64 __r = le64_to_cpu((__force __le64) \
> +                                        __raw_readq(c)); __r; })
>   
>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
>   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
> +#define writeq_relaxed(v,c)     __raw_writeq((__force u64) cpu_to_le64(v),c)
>   
>   #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
>   #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
>   #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
> +#define readq(c)                ({ u64 __v = readq_relaxed(c); __iormb(); __v; })
>   
>   #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
>   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
>   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
> +#define writeq(v,c)             ({ __iowmb(); writeq_relaxed(v,c); })
>   
>   #endif /* _ARM_ARM32_IO_H */

AFAIU, ldrd/strd accesses to MMIO are not guaranteed to be 64-bit 
single-copy atomic. So, as Julien suggested, you still need to use a 
different name to reflect this.
Also, having nested virtualization in mind, since these instructions 
can't be virtualized, maybe it would be better to avoid using them for 
MMIO accesses.

-- 
Xenia

