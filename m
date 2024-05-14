Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F68C4D83
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721202.1124415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nF9-0001wb-0s; Tue, 14 May 2024 08:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721202.1124415; Tue, 14 May 2024 08:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nF8-0001v1-UL; Tue, 14 May 2024 08:10:38 +0000
Received: by outflank-mailman (input) for mailman id 721202;
 Tue, 14 May 2024 08:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6nF7-0001uv-LG
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:10:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717f7e7a-11c9-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:10:36 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59b097b202so1127433766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:10:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eb5ec296sm23926a12.35.2024.05.14.01.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:10:35 -0700 (PDT)
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
X-Inumbo-ID: 717f7e7a-11c9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715674236; x=1716279036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ue2si8TDcodY21jNkP+jHA6IAfQUCqT37+yxOhXm0tw=;
        b=Ai9YUfdx11lomStVo6gXee/mwe8wV1gBFid9RoHp55b47otAgOOcaf4Nuny5i3FfXz
         mpzrxqLkvEqDj4WYXRR7EFN/bSeeUz2V2Pug+ITy3MizV9826gaOH+BfHy2SO+BXunfq
         NP3us77hJ/XyHDvZRnDXXsueXyFlcOmPvT0HTY8cma32b3VbSpZf0RxtHM4XDOlE+KsS
         Bbeo7KbZW9mDBEJvPyODcIaE57ku4llfGMZZiS0a2GbW1Qlf8oLLSIU7hLGJPy5pgmlv
         10LOcSOeTw8Mbtae2T/FjN2gKhnpSMQCprSJvJ05VXG26LjiNMNmDFhmCu+o85ujohOO
         wbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674236; x=1716279036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ue2si8TDcodY21jNkP+jHA6IAfQUCqT37+yxOhXm0tw=;
        b=u2ookj3UjXyYX4D1gJS/6tkE0B4XLzUkIxYyP8akWsac4c/+8CTnmzwwTT/PIvZQQZ
         mUrCZGGhVbzip3aNAcX+bP47Sn/IaqBTeUCMupLD7sal4/VQnTot43lCiu9s2SWZKRNM
         M1bhdNhoDrRVBstYCzA++qO8/uk0CS7ufC3agrKZxnD7GEvw3jVGID1BtYIvK/urSYB3
         u7w1sgzchrtdFXBr6vXFEtrXABdzORRlXMSMuU3cWjeY6k1OKfA0H26N74FVvZJU3ALh
         oGGFE0MACK7/9ykPxkAyYRtwa/jxP45OB2bffvBiGvf61uof+n7ZojGCObvuvMxLvK/+
         isjw==
X-Forwarded-Encrypted: i=1; AJvYcCXvhSa0MNg4jWAkJcjyQ3gqkDTDGoOp5WR5mGNdo6KjedNxhwmDY2UklYrWpQTIF1zZNXXnd6Nxmyr97eN9nKlRPYUr6WjQk5tDkLeugXk=
X-Gm-Message-State: AOJu0YwsQLKsH9QWvF3IfUhBjwJ2dTE71SIl19xCs65hol1qvtFn9E6g
	YguUcMMimdO6JpNxBh4uVeo01/TfjKXzbKn6mLYejJoq/89/fjTvKKwdhdl0ZA==
X-Google-Smtp-Source: AGHT+IEap1g5MWmmr0O6R8azLrDaIln4p8Ak/Kkp89VxfqrQOy68ddbdUOV4CyeyKBeCI3Kcwcrelg==
X-Received: by 2002:a50:9353:0:b0:56c:5990:813e with SMTP id 4fb4d7f45d1cf-5734d5bfbd8mr7580752a12.13.1715674235927;
        Tue, 14 May 2024 01:10:35 -0700 (PDT)
Message-ID: <e6b525cb-a1f1-494b-8dfe-c9d86cfc8f9e@suse.com>
Date: Tue, 14 May 2024 10:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of
 mem_access.c
Content-Language: en-US
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.05.2024 14:32, Alessandro Zucchelli wrote:
> --- a/xen/arch/arm/include/asm/mem_access.h
> +++ b/xen/arch/arm/include/asm/mem_access.h
> @@ -17,6 +17,8 @@
>  #ifndef _ASM_ARM_MEM_ACCESS_H
>  #define _ASM_ARM_MEM_ACCESS_H
>  
> +#include <xen/types.h>
> +
>  static inline
>  bool p2m_mem_access_emulate_check(struct vcpu *v,
>                                    const struct vm_event_st *rsp)
> @@ -35,12 +37,28 @@ static inline bool p2m_mem_access_sanity_check(struct domain *d)
>   * Send mem event based on the access. Boolean return value indicates if trap
>   * needs to be injected into guest.
>   */
> +#ifdef CONFIG_MEM_ACCESS
>  bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec);
>  
>  struct page_info*
>  p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>                                    const struct vcpu *v);
> +#else
> +
> +static inline bool
> +p2m_mem_access_check(paddr_t gpa, vaddr_t gla, const struct npfec npfec)
> +{
> +    return false;
> +}
> +
> +static inline struct page_info*
> +p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
> +                                  const struct vcpu *v)
> +{
> +    return NULL;
> +}
>  
> +#endif /*CONFIG_MEM_ACCESS*/

Why would each arch need to repeat these stubs? IOW why would they not
live in xen/mem_access.h?

Jan

