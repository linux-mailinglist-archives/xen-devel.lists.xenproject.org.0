Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85901814330
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 09:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654892.1022375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3AD-000540-Jf; Fri, 15 Dec 2023 08:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654892.1022375; Fri, 15 Dec 2023 08:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3AD-00051j-G7; Fri, 15 Dec 2023 08:03:17 +0000
Received: by outflank-mailman (input) for mailman id 654892;
 Fri, 15 Dec 2023 08:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rE3AB-00051Y-71
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 08:03:15 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 650fe576-9b20-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 09:03:13 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ca02def690so4086151fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 00:03:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r9-20020a6bd909000000b007b42bf452f4sm4049808ioc.33.2023.12.15.00.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 00:03:12 -0800 (PST)
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
X-Inumbo-ID: 650fe576-9b20-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702627393; x=1703232193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ax5qWN2jCHuAZZBuH/izsXI73jZNQrgV3cmPyhzFqUI=;
        b=EclH/0oProrBrKQecDNNIMzYsHm1l2UrtAvFVq4aCDp6Ocwgw48ghOtXJ7rxTOaEZI
         +HpbXxX3EZ0BfkCmUflQENaoqfugYqum0TtWRzC6pYnrR4FonPebnmPewfn4dq0WJO+W
         j4yKQayeg21I33c4FOoosQNxEhNGdlGcHIUuR4Mr8daOQmXHKOd0XtdYLM4zDFy0xpZJ
         l7Eer6NuOZMEn1qA01dARk8++aqZZzIX4l2SmCnRNY9r0nJwhF6ASOoPgjp9QvDGB/qF
         K/ZrPUFihxqSW7z7o+YxSxoINwTG9L8NRyYSPd+iZcU92Fn8ocHyV0CVdlzm+u9aDmUf
         0ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627393; x=1703232193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax5qWN2jCHuAZZBuH/izsXI73jZNQrgV3cmPyhzFqUI=;
        b=tqnBNNmpxoRwJk3CqFyfDVO8m9831+djoAXsaAHvIh57uS+MO71BkzciZ7D2YLrvUV
         mRs6Oprnwj2xXbR15pPhxM4nGYezw7wzrVbLAzEdcrudMivEE7tzzDZMOcNWVRes1gSc
         Ey6YhwrWB9hITX7Oknu263kb7FpYe0zHGeRS1gtrSpxE9AzyWimKlDn0wBXXDbNFMJp4
         6aM2j8qjr5Z1jEqa2IN+0Ahlstr9OJIc2MME+ZRMl9NPo3FupKiVXy6YDN6PQgd9xvK9
         ZlJyK546OT+1Rj3aDO83sGzEicStRD0JkDCH7PLfU1WZ6wVyzGkDGOHpTsD0acxzRfS+
         DDKg==
X-Gm-Message-State: AOJu0Yzi/AiK2x/Ur3KLIRNkr/M/PhGqqqU0K3ozNyJpA8J/Q+qkRDDu
	uefAnqV+O9mQngH9KURKxLh8
X-Google-Smtp-Source: AGHT+IFuw9BQ57yLPmlZUmDD6sZuJ8Cb2oWXQKiU4cgxgz1NE788BDCt7XfZZtjIvWudmfR9gN7K7w==
X-Received: by 2002:a05:651c:1607:b0:2cc:31b4:c33b with SMTP id f7-20020a05651c160700b002cc31b4c33bmr4239630ljq.77.1702627392856;
        Fri, 15 Dec 2023 00:03:12 -0800 (PST)
Message-ID: <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
Date: Fri, 15 Dec 2023 09:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
 <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
 <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
 <CA+zSX=YHW3kGFroNDzwQg=EhEe3F_fw3gCd_9W+P2UxC7+g+0A@mail.gmail.com>
 <0166dd5b-c12e-40d8-88a6-1f3c97bcf2e0@xen.org>
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
In-Reply-To: <0166dd5b-c12e-40d8-88a6-1f3c97bcf2e0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 20:10, Julien Grall wrote:
> On 14/12/2023 14:15, George Dunlap wrote:
>> But I do think that it's fair to ask Julien to think about a suitable
>> wording, since the comment is in a sense to remind him (or other ARM
>> maintainers) what's needed, and since the eventual solution will be
>> something to do with the ARM code and architecture anyway.
> 
> The comment is for anyone using !NUMA (i.e. all architectures but x86) 
> :). What about the following (this is Nicola's patch with the comments 
> reworked):

This clearly is better, yet then ...

> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -2,8 +2,9 @@
>   #define __ARCH_ARM_NUMA_H
> 
>   #include <xen/mm.h>
> +#include <xen/types.h>
> 
> -typedef u8 nodeid_t;
> +typedef uint8_t nodeid_t;
> 
>   #ifndef CONFIG_NUMA
> 
> @@ -11,12 +12,6 @@ typedef u8 nodeid_t;
>   #define cpu_to_node(cpu) 0
>   #define node_to_cpumask(node)   (cpu_online_map)
> 
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
>   /* XXX: implement NUMA support */
>   #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> diff --git a/xen/arch/ppc/include/asm/numa.h 
> b/xen/arch/ppc/include/asm/numa.h
> index 7fdf66c3da74..888de2dbd1eb 100644
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ b/xen/arch/ppc/include/asm/numa.h
> @@ -1,8 +1,8 @@
>   #ifndef __ASM_PPC_NUMA_H__
>   #define __ASM_PPC_NUMA_H__
> 
> -#include <xen/types.h>
>   #include <xen/mm.h>
> +#include <xen/types.h>
> 
>   typedef uint8_t nodeid_t;
> 
> @@ -10,12 +10,6 @@ typedef uint8_t nodeid_t;
>   #define cpu_to_node(cpu) 0
>   #define node_to_cpumask(node)   (cpu_online_map)
> 
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
>   /* XXX: implement NUMA support */
>   #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
>   #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 9b5df74fddab..d874525916ea 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -255,8 +255,10 @@ static PAGE_LIST_HEAD(page_broken_list);
>    */
> 
>   /*
> - * first_valid_mfn is exported because it is use in ARM specific NUMA
> - * helpers. See comment in arch/arm/include/asm/numa.h.
> + * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
> + *
> + * TODO: Consider if we can conditionally export first_valid_mfn based
> + * on whether NUMA is selected.
>    */
>   mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
> 
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 3d9b2d05a5c8..a13a9a46ced7 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned 
> long e);
>   /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>   mfn_t xen_map_to_mfn(unsigned long va);
> 
> +extern mfn_t first_valid_mfn;
> +
>   /*
>    * Create only non-leaf page table entries for the
>    * page range in Xen virtual address space.

... I still disagree with the placement here (should be xen/numa.h imo),
and I still don't see why we can't carry out the TODO right away, if we
have to touch all of this anyway. If it's really too much to ask from
the original contributor, I can certainly see about making a patch myself
(and I've now added this to my short-term TODO list).

Jan

