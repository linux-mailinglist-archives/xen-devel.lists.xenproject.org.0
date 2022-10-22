Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDC608566
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 09:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428126.677968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om8n9-0006yT-2N; Sat, 22 Oct 2022 07:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428126.677968; Sat, 22 Oct 2022 07:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om8n8-0006vF-Uu; Sat, 22 Oct 2022 07:19:34 +0000
Received: by outflank-mailman (input) for mailman id 428126;
 Sat, 22 Oct 2022 07:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+E3x=2X=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1om8n7-0006v9-Fw
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 07:19:33 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfc59a13-51d9-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 09:19:32 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id w18so8114583wro.7
 for <xen-devel@lists.xenproject.org>; Sat, 22 Oct 2022 00:19:32 -0700 (PDT)
Received: from [192.168.1.93] (adsl-70.109.242.225.tellas.gr. [109.242.225.70])
 by smtp.gmail.com with ESMTPSA id
 ba3-20020a0560001c0300b002365254ea42sm3813037wrb.1.2022.10.22.00.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 00:19:31 -0700 (PDT)
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
X-Inumbo-ID: dfc59a13-51d9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1dZlb9EtBi62yLpMWc4suMSx0l7x1OxvekcJ6t2eXw=;
        b=WxclziSTWUwmBpLQ1rlfrbFPKFw1cXITk2bR4GNyyqbY3rsO5qAb3RRLwLmLuEUCzA
         An9eqkpVmU9vjVF/8TH3FJYg9dKr73G2jTY3oxT3I9BxjFh+wQ8dcbTP15i+XFlwaJG+
         fF08nn+HfdUMxMZfSyxtBVl1uetK4/2C5r1aELHeo+Xg+o48i+hk7yaVzu0t9MnU5ksg
         P0ShFHEjNZLdcmgWxbw8Cl0p0nHnznB1msigLyYz6poezsSGsE4CpgAfHCSF3/8X3m45
         c5p86Sd9OuR+tWe2VVaJTC3gew84A0O160jUdH5AgIhkmJPibGzR8rKlxDDvwasGHut7
         YqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1dZlb9EtBi62yLpMWc4suMSx0l7x1OxvekcJ6t2eXw=;
        b=L+H2/9qNEwzbF0iyPNhcN8h4UeEuVqPoB4cpAWW3FvewAX4I9gYpESdXuTlHJAxuD7
         8Fbv6PjBmHLrKcSo5XjkwaQlt3skobbRKlTBMFgMsQxZjCbcZE/LMobXarumLciDSg58
         0IskoaG9u/0VYjSh1NpNBc4ucoVt40rKfGfx9qzAnDVpMraCEiYY2YQwYg+TICKIdDu5
         ynzICJ/qjX86Al9WT9yEUpIc1S/wkiIKkAbWifOjUIHF9SAbqIfqfKgOXYocSgNLgB7s
         JX+knGsj4acRpUZKuR+kkJn+7Zs9UrOJP9YkwrB8vrD82/cIf+v0ZiFv8JtCd9YLJ1sg
         yT5Q==
X-Gm-Message-State: ACrzQf2fIU4mzNO3vwla2zR0si8JKRreE2h3RCffHJMCOiTEBcbhCITk
	dzp39e0mopwzi/sG/JwZoIk=
X-Google-Smtp-Source: AMsMyM7SNqesrZYQEbsHqUjbESKxUC3p7D968rbkW6MBa9mgB0eSKqJy7Z6fQz/5sZxkyWPL4S4rTg==
X-Received: by 2002:adf:e785:0:b0:236:5998:67a0 with SMTP id n5-20020adfe785000000b00236599867a0mr2795685wrm.414.1666423171823;
        Sat, 22 Oct 2022 00:19:31 -0700 (PDT)
Message-ID: <c587e513-8862-ca44-3c1d-a54bb01e0c3b@gmail.com>
Date: Sat, 22 Oct 2022 10:19:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v1 11/12] Arm: GICv3: Define macros to read/write 64
 bit
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-12-ayankuma@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221021153128.44226-12-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 18:31, Ayan Kumar Halder wrote:
Hi Ayan

> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
> This in turn calls readl_relaxed()/writel_relaxed() twice for the lower
> and upper 32 bits.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/arm32/io.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
> index 73a879e9fb..6a5f563fbc 100644
> --- a/xen/arch/arm/include/asm/arm32/io.h
> +++ b/xen/arch/arm/include/asm/arm32/io.h
> @@ -80,10 +80,14 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>                                           __raw_readw(c)); __r; })
>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>                                           __raw_readl(c)); __r; })
> +#define readq_relaxed(c) ({ u64 __r = (le64_to_cpu(readl_relaxed(c+4)) << 32) | \
> +                                        readl_relaxed(c); __r; })

Maybe you wanted to write sth like

(((u64)readl_relaxed((c) + 4) << 32) | readl_relaxed(c))

readl_relaxed returns a u32 value so no byteorder conversions are needed 
at this stage. Also, you need to add parentheses around macro parameter 
c because an operator performs on it.

>   
>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
>   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
> +#define writeq_relaxed(v,c)     writel_relaxed(((uint64_t)v&0xffffffff), c); \
> +                                    writel_relaxed((((uint64_t)v)>>32), (c+4));
>   
>   #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
>   #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })

And

writel_relaxed((u32)v, c); writel_relaxed((u32)((v) >> 32), (c) + 4);

v is already u64 and writel_relaxed() expects a u32. Here as well, you 
need to add parentheses around macro parameter c because an operator 
performs on it.

I am wondering if the parts of the register need to be accessed in a 
specific order.

-- 
Xenia

