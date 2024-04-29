Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737568B5E55
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714298.1115475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TP3-0001Oz-Pp; Mon, 29 Apr 2024 15:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714298.1115475; Mon, 29 Apr 2024 15:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TP3-0001Lv-N0; Mon, 29 Apr 2024 15:58:53 +0000
Received: by outflank-mailman (input) for mailman id 714298;
 Mon, 29 Apr 2024 15:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1TP1-0001Lk-Qp
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:58:51 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e3ef620-0641-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:58:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41b782405bbso25700415e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:58:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b00418e4cc9de7sm41758437wmb.7.2024.04.29.08.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:58:48 -0700 (PDT)
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
X-Inumbo-ID: 5e3ef620-0641-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714406329; x=1715011129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WAxPDI0Rd31wP0H1Lyu8gqujUldLTZXnWNlpch9I+RM=;
        b=Qu+DxwSlCk9FGd6qbQxeXbMvbNJ0YGzxqITj/QuuJSiiiPAHMvdHXA4RulAaSDFof7
         yrC+U7dxU4lxUyMnoUmlCxI8XBofwM1nfT940g/zR3VI7CExacvGK8RC5oypX/hDqV58
         4M+hXW8rSZihZCcIBcwkmCQD86MIxpjbelMD2xN1M6odrqpxd13Lxst4QyxeUyPqZkC9
         byxAYbTS6/O7T7iUy4Yoq8miBq80RuTv0HJ2e6jo07XS4av8zRq4zhQyXn9Wg7kdoJwY
         K77eFUunhnZbBsoHaOXssV51Oaf+NnaC7nlPRc3ctyUnFljS0OVOhJqR2axm7MhKycDv
         RdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714406329; x=1715011129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAxPDI0Rd31wP0H1Lyu8gqujUldLTZXnWNlpch9I+RM=;
        b=u64Xo7K3/foCvfvCZzm8vTtfm734bkYqSv27p5GkrG1aq6USgknbNJ/ImO4A4Wn9Hq
         asn/8nEa37cAsja+i31sIpEanCfdVMzpNfiJSynZ+4GBaLEMH7FMEidqeWYPtfJXwiuh
         ns9I7wkvf6goCpYS40JaxHh3h63LfecoVhkpu1S78Qvu8RnGhsnmZBLLjGJ8ujtFhBd3
         wFNeze9Qs5/QmW1DGJkIjjEnbYR5Frr0yd+eopdc7uwchDEz3Usaud3yDpD+4c7HEn/Y
         kcG1Y0tLYf0w4yuBDsv0Ijj/M5aZ2H+9PH6SS3RJP4BBXgtNJbu7Ox+Hwn2fwPFIs7Go
         3CUg==
X-Forwarded-Encrypted: i=1; AJvYcCXfuI7Co48X1WDLU2ul4xdubPEt4Q6zTPae6/q/fnGVUjcxfLZUb3WI4wVpeiKtToMpgcqBtKgAbjdNNkVxjRtKNzt2zunITZlNcTL5SK0=
X-Gm-Message-State: AOJu0YzUx0L95hBqiQQgM/+WNOF8MQvktWioLjmJgpVrEYxcW+KyF+Xx
	DuUoWArXnlK2KQwiv//zIS3U8ZhiZztCacu5KLwSyXjGFvjttDUfPm1Rtxop4wB5Fe4AVhOPYvY
	=
X-Google-Smtp-Source: AGHT+IFuGHkzaRsqwnnCBB7y5UY53fMQpSBG6oHSbFlTLsh/qk0okw0myrw2YoaIRFvDMH3qPdlLLA==
X-Received: by 2002:a05:600c:1c26:b0:419:f9ae:e50 with SMTP id j38-20020a05600c1c2600b00419f9ae0e50mr9438224wms.37.1714406329136;
        Mon, 29 Apr 2024 08:58:49 -0700 (PDT)
Message-ID: <08eb5444-2bf0-48c0-9fcb-d8e4b801e8fa@suse.com>
Date: Mon, 29 Apr 2024 17:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/mem_access: address violations of MISRA C: 2012
 Rule 8.4
Content-Language: en-US
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 17:45, Alessandro Zucchelli wrote:
> Change #ifdef CONFIG_MEM_ACCESS by OR-ing defined(CONFIG_ARM),
> allowing asm/mem_access.h to be included in all ARM build configurations.
> This is to address the violation of MISRA C: 2012 Rule 8.4 which states:
> "A compatible declaration shall be visible when an object or function
> with external linkage is defined". Functions p2m_mem_access_check
> and p2m_mem_access_check_and_get_page when CONFIG_MEM_ACCESS is not
> defined in ARM builds don't have visible declarations in the file
> containing their definitions.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  xen/include/xen/mem_access.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
> index 87d93b31f6..ec0630677d 100644
> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -33,7 +33,7 @@
>   */
>  struct vm_event_st;
>  
> -#ifdef CONFIG_MEM_ACCESS
> +#if defined(CONFIG_MEM_ACCESS) || defined(CONFIG_ARM)
>  #include <asm/mem_access.h>
>  #endif

This doesn't look quite right. If Arm supports mem-access, why would it
not set MEM_ACCESS=y? Whereas if it's only stubs that Arm supplies, then
those would better move here, thus eliminating the need for a per-arch
stub header (see what was e.g. done for numa.h). This way RISC-V and PPC
(and whatever is to come) would then be taken care of as well.

Jan

