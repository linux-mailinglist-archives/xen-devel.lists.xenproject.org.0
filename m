Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82769F7823
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860952.1272938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCdi-0000BB-Fa; Thu, 19 Dec 2024 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860952.1272938; Thu, 19 Dec 2024 09:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCdi-00009N-C4; Thu, 19 Dec 2024 09:16:14 +0000
Received: by outflank-mailman (input) for mailman id 860952;
 Thu, 19 Dec 2024 09:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOCdg-00009H-G1
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:16:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e260c305-bde9-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 10:16:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361f796586so5511905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:16:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847d7fsm1075441f8f.60.2024.12.19.01.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:16:09 -0800 (PST)
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
X-Inumbo-ID: e260c305-bde9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734599770; x=1735204570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x8PtJheKGAJizy16xwiXTRbPJkfpd5ZfDqrbmGqCMc0=;
        b=EhJs8zrUFtfqGHL8yzEPS3Gncg3nYJ0s74Wz8xedCI/h+1Iyqn4PDKL57Z/hC+y7ws
         ZQr7HvlKwVNpCGdwSp6E8AhK8cl1LEXwTZuSR+q2cqC0r7gVKDvwF/AzEUz4Puma0Z1W
         LUpYBDCJEP5+pZf91OeeAKH1vprsXYsXPonNmEJwZv01SlgI2n5tocSC0pBoTxUNHZEn
         V6YdnCWRxC9QPXpo5ql+saMGCP5drMcWuwjRs2fIt36dqONtcgk31ZKqvtOHqJyzT3VZ
         lMRryAalchBjXP1awHP70G7RW5C7cSrvog/uqjHDr2kiPAtxVMxYySnTSlaWTlOmFSXU
         pAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599770; x=1735204570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8PtJheKGAJizy16xwiXTRbPJkfpd5ZfDqrbmGqCMc0=;
        b=MF0Isuw4vyWgxrejTJQHXVrdoxt4JdY7HiqmuVDWep2COQdQL5Von3Y1iPlLkoBmQ0
         SgDy5vNSTc4aZy6M6UhEWF2VIQWUiVENn5jM2LZYfsS/JOFHB0NbMKJ76jeHogFRruFj
         qokBthDeGF1KQDIZkYdAPlkxXYDmWfu/XPG7Op2MmXnDuCyb5rqycIzmvtoOvM7lqS6S
         jaxYQrge4NHp+MTdjh9sRKX7evcFJVl654tjDIdedQkfdGYeqrPFy5hjsGC3UWVM7fCB
         03pwVUj4mUsFB2li58hM//Xtt7C3BnIaxWv2X49C66UPoR5Kyd5Wa3RJgE+cXICB5upF
         r7Og==
X-Forwarded-Encrypted: i=1; AJvYcCXsesnGOm8nyiCzvmrETFLD8FHxMGr8kCPW191CU/r6hPtwEG7kCuWGFyuZQzUiZIHT7dTrSUN1vks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys0jbm+9hBiKlM6DiDN+zPSAoRTXL46CKkxDcaY+MNHCMnu+U3
	SsYsiOSEsllHRl0VFwxME/KiTTextEj07ZqGNBGPcj7NatM5M4vP34af5HvB7g==
X-Gm-Gg: ASbGncvLQDx+KjtV+TmR0F2PXLqpdRsePSH1A2RgWhCSbKYqD3X9SMV4WDIKd5Ei/fB
	CIpNs2+NA9aMyiaUu9vuRp69PIRFDmG69a/NJtWr3kZmIwWG80/tR30dMNp9FLHJjh5hUkpmwgi
	sGVLwSwFvYtJe8LAbr8y5Tc7FBxUbh3RQ4BUu62BQnV9+PaKm7LLCZCxevj2o5tYQqxG5WTgmdv
	ODLnvOSSipNxFYWXNdIBKUHHxQ3RXDBbE+h2V/w2b9qyiiXCkGi3Oot5a373t45XkyidrpjMdKr
	5fyCQ2Hw0aa4tHwYeOafNgCQK62zp7NiG3qy/Z2j5g==
X-Google-Smtp-Source: AGHT+IFsirENDebIbdN+I0i90wNlh/UMOmm61p8TGFwzbDJ906klijr9PMAUnpxGGGD3sZJgPuoHrg==
X-Received: by 2002:a5d:64ee:0:b0:385:e2d5:cdf2 with SMTP id ffacd0b85a97d-38a19b05162mr2410144f8f.19.1734599769839;
        Thu, 19 Dec 2024 01:16:09 -0800 (PST)
Message-ID: <da08985b-6864-4dc8-8bff-9b006b163244@suse.com>
Date: Thu, 19 Dec 2024 10:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen/riscv: implement data and instruction cache
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
 <33cf536f15356db894be5bde557060585cc2e410.1734452721.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <33cf536f15356db894be5bde557060585cc2e410.1734452721.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2024 17:32, Oleksii Kurochko wrote:
> Implement following cache operations:
> - clean_and_invalidate_dcache_va_range()
> - clean_dcache_va_range()
> - invalidate_icache()
> 
> The first two functions may require support for the CMO (Cache Management
> Operations) extension and/or hardware-specific instructions.
> Currently, only QEMU is supported, which does not model cache behavior.
> Therefore, clean_and_invalidate_dcache_va_range() and clean_dcache_va_range()
> are implemented to simply return 0. For other cases, generate compilation error
> so a user won't miss to update this function if necessery.
> If hardware supports CMO or hardware-specific instructions, these functions
> should be updated accordingly. To support current implementation of these
> function CONFIG_QEMU_PLATFORM is introduced.
> 
> invalidate_icache() is implemented using fence.i instruction as
> mentioned in the unpriv spec:
>   The FENCE.I instruction was designed to support a wide variety of
>   implementations. A simple implementation can flush the local instruction
>   cache and the instruction pipeline when the FENCE.I is executed.
>   A more complex implementation might snoop the instruction (data) cache
>   on every data (instruction) cache miss, or use an inclusive unified
>   private L2 cache to invalidate lines from the primary instruction cache
>   when they are being written by a local store instruction.
>   If instruction and data caches are kept coherent in this way, or if the
>   memory system consists of only uncached RAMs, then just the fetch pipeline
>   needs to be flushed at a FENCE.I.
> The FENCE.I instruction requires the presence of the Zifencei extension,
> which might not always be available. However, Xen uses the RV64G ISA, which
> guarantees the presence of the Zifencei extension. According to the
> unprivileged ISA specification (version 20240411):
>   One goal of the RISC-V project is that it be used as a stable software
>   development target. For this purpose, we define a combination of a base ISA
>   (RV32I or RV64I) plus selected standard extensions (IMAFD, Zicsr, Zifencei)
>   as a "general-purpose" ISA, and we use the abbreviation G for the
>   IMAFDZicsr_Zifencei combination of instruction-set extensions.
> 
> Set CONFIG_QEMU_PLATFORM=y in tiny64_defconfig to have proper implemtation of
> clean_and_invalidate_dcache_va_range() and clean_dcache_va_range() for CI.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I'm not entirely happy with this (and where it appears to be moving us), but
for the time being it's perhaps good enough, so
Acked-by: Jan Beulich <jbeulich@suse.com>
Albeit with ...

> @@ -148,9 +149,28 @@ static inline bool pte_is_mapping(pte_t p)
>      return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>  }
>  
> +static inline int clean_and_invalidate_dcache_va_range(const void *p,
> +                                                       unsigned long size)
> +{
> +#ifndef CONFIG_QEMU_PLATFORM
> +    #error "should clean_and_invalidate_dcache_va_range() be updated?"
> +#endif
> +
> +    return 0;
> +}
> +
> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
> +{
> +#ifndef CONFIG_QEMU_PLATFORM
> +    #error "should clean_dcache_va_range() be updated?"
> +#endif
> +
> +    return 0;
> +}

... the #-es moved back to the 1st column, which I'll take the liberty of
doing while committing. Personally I wonder anyway why these aren't simply
BUILD_BUG_ON("unimplemented").

Jan


