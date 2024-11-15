Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C89CDFBA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 14:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837606.1253538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwDI-0002Nv-SL; Fri, 15 Nov 2024 13:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837606.1253538; Fri, 15 Nov 2024 13:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBwDI-0002Lb-Pm; Fri, 15 Nov 2024 13:18:16 +0000
Received: by outflank-mailman (input) for mailman id 837606;
 Fri, 15 Nov 2024 13:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBwDH-0002LU-C3
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 13:18:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fdccec5-a354-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 14:18:11 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3821a905dbcso1137621f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 05:18:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38222c14306sm2814852f8f.21.2024.11.15.05.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 05:18:10 -0800 (PST)
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
X-Inumbo-ID: 0fdccec5-a354-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MjkiLCJoZWxvIjoibWFpbC13cjEteDQyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBmZGNjZWM1LWEzNTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc2NjkxLjI3MDczNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731676690; x=1732281490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETDgAX8UFwNrqt3PrrnhX0Zxcvt5DdI5pGjJwyM41eA=;
        b=MLsI8moj6qW3wlHZbkfzxX75wY3BbOR7EMt4IwDL3yWB4ptiGvYIculB0Pk+vG9xA3
         RfdYQEljdJRHcN+jC/QcAx8LtKu8llluT6/u1w4/LYuZYGF4tyim51dZ9bCnhg3GGpaZ
         tAKbWpbpt3vkrrccMAPDzwZZk7mz1cT3ViIQagwonUk+L2Xe28YAaSjvugO7a/tBWavv
         Uxif6YkzFEw02rOGyRiXglkVZTCMgI7uhx5Jaf3LhOPIvNIVov+DLv5BmKp3WayRuOoX
         1DU1QpZGK1Af/w23c2eM6J/pm9lit3CsbD+ZYKU9SKA9cEyI3ZyTdDlZKjQ/eMfC9hna
         19UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731676690; x=1732281490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETDgAX8UFwNrqt3PrrnhX0Zxcvt5DdI5pGjJwyM41eA=;
        b=xPQYLVcVSnTVv+4WBom0FpbJIRD0HTgfYR4EOw7KZ2EoZDaxgg4L2unLnNi3X3GEQb
         zH4zqjOPvm1lKgAFu6mEWOHEhL+HfFbqACI3ki7lxczNVMXjDOBCLHSzf14aI1C937kC
         3m4StKuMy8hH/Qf9HQbsYfS4nngjuzIVekVpHspxIgdWuDPue7PREgzLDNfoR3RtZLPC
         zCotxiTIJnCvU9ZCkoW1FgFoXYy8ZDo3QQHYjhHQabHECnOvBt6Gz2wwMBxErUdEREDa
         buOer1gowsm6n17iftr/+dH7rTZStR8B0ZTLZLnr/WQV7MVZRZ/FEvEv9irb+stItXmO
         xwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMxnVDCJLqQUT6aEtGF3HZLCLQ4tZWNQEh6AlL1J1jyrI6bdQI++tbeRGXEsz7CXmtFmnmhuMe1+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBy5hF6ELQAFPAaJglwa2pfc4cSBILt3rlfLL9bYseGNkv9zRu
	T7a4HjmE5kyfUDPWzkLpTHNI7VqBOg9yfsIaoDOkecWtnKH6S3JAA6nVJ5ae6Q==
X-Google-Smtp-Source: AGHT+IGJp+XGaYkpJSpC/oOjc2NS7OezDUA+r1DqdsA8tUyD8CqmO7IsJTDa+ajag4zRgnmIQXm6Jg==
X-Received: by 2002:a5d:6f11:0:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-382258ee874mr2376834f8f.9.1731676690420;
        Fri, 15 Nov 2024 05:18:10 -0800 (PST)
Message-ID: <58b636eb-a2bb-40f9-87f1-0a38c036a495@suse.com>
Date: Fri, 15 Nov 2024 14:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <3a57e277-5fd2-4400-86b9-29479b3dfda1@suse.com>
 <CEB38FF8-ACFD-4AE1-B571-1A9219575EE6@arm.com>
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
In-Reply-To: <CEB38FF8-ACFD-4AE1-B571-1A9219575EE6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.11.2024 13:46, Luca Fancellu wrote:
> 
> 
>> On 15 Nov 2024, at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.11.2024 11:50, Luca Fancellu wrote:
>>> --- a/xen/common/vmap.c
>>> +++ b/xen/common/vmap.c
>>> @@ -426,3 +426,10 @@ void *_xvrealloc(void *va, size_t size, unsigned int align)
>>>
>>>     return ptr;
>>> }
>>> +
>>> +void iounmap(void __iomem *va)
>>> +{
>>> +    unsigned long addr = (unsigned long)(void __force *)va;
>>> +
>>> +    vunmap((void *)(addr & PAGE_MASK));
>>> +}
>>
>> Why is this being moved here, and converted from inline to out-of-line?
>> What the description says is insufficient imo, as even if you mean to
>> only support vmap_contig() and ioremap() on MPU systems, you'll still
>> need both vunmap() and iounmap().
>>
>> Plus, if it really needs converting, I don't think it should live at the
>> very end of the file, past _xvmalloc() and friends. Better suitable places
>> may then be next to vunmap() itself, or between vfree() and xvfree().
> 
> I’ll try to keep it as it was originally, I gave a brief look into the R82 branch and it should be fine.
> I’m planning to define vmap_config(), vunmap(), ioremap(), iounmap() in a vmap-mpu.c under arch/arm/mpu
> 
>>
>>> --- a/xen/include/xen/vmap.h
>>> +++ b/xen/include/xen/vmap.h
>>> @@ -5,7 +5,7 @@
>>>  * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
>>>  * latter is used when loading livepatches and the former for everything else.
>>>  */
>>> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
>>> +#if !defined(__XEN_VMAP_H__)
>>> #define __XEN_VMAP_H__
>>
>> With this adjustment, where are the functions defined that you "unhide"
>> the declarations of, in the MPU case? As you say in the description,
>> vmap.c won't be built in that case.
> 
> Sure, I’ll wrap what can’t be used in MPU case with HAS_VMAP, I would like to keep out:
> 
> void *vmap_contig(mfn_t mfn, unsigned int nr);
> 
> void vunmap(const void *va);
> 
> void __iomem *ioremap(paddr_t pa, size_t len);
> 
> static inline void iounmap(void __iomem *va)
> 
> static inline void vm_init(void)
> 
> In order to don’t put too many #ifdef, are you ok if I move the declarations in order to have these close to each other. like below:

Some re-arrangement ought to be fine, especially when the #ifdef is
accompanied by a comment. I can't see how there can be #else though.

Jan

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -11,6 +11,8 @@
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
>  
> +#ifdef CONFIG_HAS_VMAP
> +
>  /* Identifiers for the linear ranges tracked by vmap */
>  enum vmap_region {
>      /*
> @@ -68,25 +70,6 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
>   */
>  void *vmap(const mfn_t *mfn, unsigned int nr);
>  
> -/*
> - * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
> - *
> - * @param mfn Base mfn of the physical region
> - * @param nr  Number of mfns in the physical region
> - * @return Pointer to the mapped area on success; NULL otherwise.
> - */
> -void *vmap_contig(mfn_t mfn, unsigned int nr);
> -
> -/*
> - * Unmaps a range of virtually contiguous memory from one of the vmap regions
> - *
> - * The system remembers internally how wide the mapping is and unmaps it all.
> - * It also can determine the vmap region type from the `va`.
> - *
> - * @param va Virtual base address of the range to unmap
> - */
> -void vunmap(const void *va);
> -
>  /*
>   * Allocate `size` octets of possibly non-contiguous physical memory and map
>   * them contiguously in the VMAP_DEFAULT vmap region
> @@ -112,6 +95,33 @@ void *vzalloc(size_t size);
>   */
>  void vfree(void *va);
>  
> +/* Return the number of pages in the mapping starting at address 'va' */
> +unsigned int vmap_size(const void *va);
> +
> +/* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
> +void *arch_vmap_virt_end(void);
> +
> +#else /* !CONFIG_HAS_VMAP */
> +
> +/*
> + * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
> + *
> + * @param mfn Base mfn of the physical region
> + * @param nr  Number of mfns in the physical region
> + * @return Pointer to the mapped area on success; NULL otherwise.
> + */
> +void *vmap_contig(mfn_t mfn, unsigned int nr);
> +
> +/*
> + * Unmaps a range of virtually contiguous memory from one of the vmap regions
> + *
> + * The system remembers internally how wide the mapping is and unmaps it all.
> + * It also can determine the vmap region type from the `va`.
> + *
> + * @param va Virtual base address of the range to unmap
> + */
> +void vunmap(const void *va);
> +
>  /*
>   * Analogous to vmap_contig(), but for IO memory
>   *
> @@ -124,9 +134,6 @@ void vfree(void *va);
>   */
>  void __iomem *ioremap(paddr_t pa, size_t len);
>  
> -/* Return the number of pages in the mapping starting at address 'va' */
> -unsigned int vmap_size(const void *va);
> -
>  /* Analogous to vunmap(), but for IO memory mapped via ioremap() */
>  static inline void iounmap(void __iomem *va)
>  {
> @@ -135,9 +142,6 @@ static inline void iounmap(void __iomem *va)
>      vunmap((void *)(addr & PAGE_MASK));
>  }
>  
> -/* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
> -void *arch_vmap_virt_end(void);
> -
>  /* Initialises the VMAP_DEFAULT virtual range */
>  static inline void vm_init(void)
>  {
> @@ -146,4 +150,6 @@ static inline void vm_init(void)
>  #endif
>  }
>  
> +#endif /* CONFIG_HAS_VMAP */
> +
>  #endif /* __XEN_VMAP_H__ */


