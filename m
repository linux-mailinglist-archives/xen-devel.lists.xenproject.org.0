Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6656080AA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 23:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427996.677693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzPX-0007bi-Nh; Fri, 21 Oct 2022 21:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427996.677693; Fri, 21 Oct 2022 21:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzPX-0007Yj-JG; Fri, 21 Oct 2022 21:18:35 +0000
Received: by outflank-mailman (input) for mailman id 427996;
 Fri, 21 Oct 2022 21:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jmp5=2W=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1olzPV-0007Yd-4R
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 21:18:33 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea25033b-5185-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 23:18:32 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id w18so6884225wro.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 14:18:32 -0700 (PDT)
Received: from [192.168.1.93] (adsl-214.109.242.138.tellas.gr.
 [109.242.138.214]) by smtp.gmail.com with ESMTPSA id
 f9-20020a5d5689000000b002322bff5b3bsm139163wrv.54.2022.10.21.14.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 14:18:30 -0700 (PDT)
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
X-Inumbo-ID: ea25033b-5185-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHuXkRFBZYtj/pjD6zKPtNSshkc/314CFEhvMMU9mwo=;
        b=niIfW1yfMtq0D2LTeMfiS9sOxGaBehdJBUcuBvMrKvFA2iw+bdC7pfoDOMbXDR3zVX
         HGf6EM8VB+IS74RbUa9f78ZzEZdzgHz82o0iyROjPmlNWY50QcLutzmSBxB2bmME78rW
         OHpFTQO0QC1IAzuJ/3ymrVMr+PKPUgW/Ze2t+qC2X7bKMZoyLJRrarfix2AazpmxzrMM
         daw/QukFBe99VabzJLhg5/wM/QQBJkEhL2AOr2u7GRk6DCHb/59Eegdp7U8y86+3FQ8c
         aVgRwZhZtcmQnpOE5csG+4fR+wmK0G+bqYM7jPeYB4eifsrp2Nevus5auJMxB7/uWRLx
         Fh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHuXkRFBZYtj/pjD6zKPtNSshkc/314CFEhvMMU9mwo=;
        b=gTtIinKBcklV1dtpHQ9cpu2osaPa0sWY/RP+SB84NaqL1rd99Xk2RLYXlJ7nVlbp/4
         kjUmOzyrmBxTSwJwrAF+RLXYCXhz+AhjY3Y11mj5z0+uUF8mR4wwAfQPlGp2pH3oicMO
         SAbBlDiDWezixbd8SU4WJiRkOaYGLG1vcxglcUHLTv4K2qsbUPZ2mN/LbbKgQ/oUPGoE
         4f/oNxKGR+nDjtO7qiaDxGSFjmXJNAFdcpPxbxedUpl7k8moHOTpBdeiVV4geGCZgnXX
         spFvsz1c/aJHHMzHXHpbM3FDIb1lAhdDaI4bwJaHDk2hTVwNgiZVdEYcN52F5ZW5Wzjt
         B7Dw==
X-Gm-Message-State: ACrzQf1n6z3YEgT+cgxnVDtHAY5jeWwz/pSUV8UmupwQ4bsv5pR0PfVB
	i+CAKodECwa3vkyQhm6F5Q4=
X-Google-Smtp-Source: AMsMyM7X5g0JHIzxvGeWgZaN7szR8h31ISW4jQB3ilgR48779q5Rrlrd7unYcBALOj5cyVPbYS7S3Q==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id g7-20020a5d4887000000b00226ed347bbdmr12940819wrq.561.1666387111447;
        Fri, 21 Oct 2022 14:18:31 -0700 (PDT)
Message-ID: <cb67c768-1a05-e5d5-efed-9a282c6a8c2a@gmail.com>
Date: Sat, 22 Oct 2022 00:18:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v1 02/12] Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-3-ayankuma@amd.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221021153128.44226-3-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 18:31, Ayan Kumar Halder wrote:
Hi Ayan

> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
> include/asm/cputype.h#L14 , these macros are specific for arm64.
> 
> When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
> bit register.
> 
> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
> asm/cputype.h#L54  , these macros are specific for arm32.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
>   xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
>   xen/arch/arm/include/asm/processor.h       | 14 --------------
>   3 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
> index 4e679f3273..3e03ce78dc 100644
> --- a/xen/arch/arm/include/asm/arm32/processor.h
> +++ b/xen/arch/arm/include/asm/arm32/processor.h
> @@ -56,6 +56,16 @@ struct cpu_user_regs
>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>   };
>   
> +/*
> + * Macros to extract affinity level. Picked from kernel
> + */
> +
> +#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
> +
> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> +    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
> +
>   #endif
>   
>   #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
> diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
> index c749f80ad9..c026334eec 100644
> --- a/xen/arch/arm/include/asm/arm64/processor.h
> +++ b/xen/arch/arm/include/asm/arm64/processor.h
> @@ -84,6 +84,19 @@ struct cpu_user_regs
>       uint64_t sp_el1, elr_el1;
>   };
>   
> +/*
> + * Macros to extract affinity level. picked from kernel
> + */
> +
> +#define MPIDR_LEVEL_BITS_SHIFT  3
> +#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
> +
> +#define MPIDR_LEVEL_SHIFT(level) \
> +         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> +
> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> +         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
> +
>   #undef __DECL_REG
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 1dd81d7d52..7d90c3b5f2 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -118,20 +118,6 @@
>   #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
>   #define MPIDR_LEVEL_BITS    (8)
>   
> -
> -/*
> - * Macros to extract affinity level. picked from kernel
> - */
> -
> -#define MPIDR_LEVEL_BITS_SHIFT  3
> -#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
> -
> -#define MPIDR_LEVEL_SHIFT(level) \
> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
> -
> -#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> -         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
> -
>   #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << MPIDR_LEVEL_SHIFT(level)) - 1)
>   
>   /* TTBCR Translation Table Base Control Register */

Since only the definition of the MPIDR_AFFINITY_LEVEL() differs, maybe 
you could add only this one to the arch specific headers e.g
for arm64:
#define MPIDR_LEVEL_SHIFT(level) \
     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
for arm32:
#define MPIDR_LEVEL_SHIFT(level) \
     ((level) << MPIDR_LEVEL_BITS_SHIFT)

But in any case don't forget to add parentheses around the macro 
parameters when an operator acts on them to avoid trouble with operator 
precedence (MISRA-C Rule 20.7 :))

-- 
Xenia

