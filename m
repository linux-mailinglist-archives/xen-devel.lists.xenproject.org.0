Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2821F9254DA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 09:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752750.1160974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuct-0003aH-Q0; Wed, 03 Jul 2024 07:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752750.1160974; Wed, 03 Jul 2024 07:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuct-0003Xj-NM; Wed, 03 Jul 2024 07:42:03 +0000
Received: by outflank-mailman (input) for mailman id 752750;
 Wed, 03 Jul 2024 07:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOucs-0003Xd-LW
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 07:42:02 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf42d23-390f-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 09:42:01 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso56518811fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 00:42:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce71017sm10091360a91.29.2024.07.03.00.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:42:00 -0700 (PDT)
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
X-Inumbo-ID: bbf42d23-390f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719992521; x=1720597321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p1sP2K7YXMH4jd33k7k5WMbazo+yPTKRcHxYXbiiBEA=;
        b=cnO9Nev/gwyd8lhOruD5IZrmL1BikbbK8omMs4kAEuqRrv3NlVeejqSVflCPBOGoSs
         1czszP2L/p1onES4pEDwX4RUGmNtNl6X4A6nocpx6IAO/5WLKIuEcuvc0qUC4cXToHVQ
         lHbUXgs0VWk+UJSPRlxGZ/XzJG0S4NY3tesmi7JzrbwCTkIPo4bnjy7i79YR6WhGlCo0
         dxFwo9gCIxcSeY+ticDEfKWLqC+YkpNDEsJEM/x/ALmVXHj6c8+lrzTVNVhsV5dmhiLK
         xT6SpIvNWQ1HPxnvZueB1LNBnXtDL8ApTpg+jofJyAV7W/ETAWVt6y2qvjbA7R/1BKrN
         F5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719992521; x=1720597321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1sP2K7YXMH4jd33k7k5WMbazo+yPTKRcHxYXbiiBEA=;
        b=N8AVLI+gEK5eJivclPxYHLraWwdfQF2XQFRqtYShoqNzhORU8IlUZsKlXws9eT6CnN
         a5w/KDICFy6x9j6gYEq/WlhXceLWTTIZaNm81FZo75VOgoxF59U0VpySrN2IPpj7SeRj
         0ZxKCQhzWnutpQ9WmK/Sd2hH4AZe2c2+aMuXB/aMNylSQQj1S9bFaDV238I8xUXSV5By
         jZXG4McewhxNQ74oMXfifVMwPTH1RE6qIDAZgQgUzKH4L08SSHZ7oEZgaaLmcApu4Zk+
         xZKDsFtOU+Z85jAb9YbEmtknsl2vWcz6HP+In7uYbF7vePh7JghpLQ5/0JJ2t7wcl53D
         2ITg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Ip/5cSKp4VNGS8S0xodcM5BIZxN7HN0XEvbu00ymg+Z/c9noO1QVwu/1Iwiovsio4xQMg1+Md/FJ6pN50LcpByKIeo0uZ6Ni4q7YGPY=
X-Gm-Message-State: AOJu0Yx4/8/JoNJ0inj5/LS1FY3Dh8joOFfR2Tcu3MbM3vn86afqyq5I
	+xkTMtbzN6B7vAUEhTVjbxRE+jYD2Ppj9TnLpXZCgdn35cT6bnznfKKkXV8QaA==
X-Google-Smtp-Source: AGHT+IGS/fcjAa+WzqKD4srbxPZHyYW/6YZmSb2Xs6rzgNXisToYPV7Uh9lJ5wbUshAYqqyrck0DjA==
X-Received: by 2002:a2e:8907:0:b0:2ec:1810:e50a with SMTP id 38308e7fff4ca-2ee5e6e71e5mr64110251fa.32.1719992520707;
        Wed, 03 Jul 2024 00:42:00 -0700 (PDT)
Message-ID: <95f8c522-f66e-48cd-bf7c-6033614e7bbf@suse.com>
Date: Wed, 3 Jul 2024 09:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19?] xen/vmap: Document the vmap header
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <b19a5ca7abd27bd4f31a0d87573687297dd7df58.1719849287.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <b19a5ca7abd27bd4f31a0d87573687297dd7df58.1719849287.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 15:03, Alejandro Vallejo wrote:
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,34 +1,131 @@
> +/*
> + * Interface to map physical memory onto contiguous virtual memory areas.
> + *
> + * Two ranges of linear address space are reserved for this purpose: A general
> + * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
> + * latter is used when loading livepatches and the former for everything else.
> + */
>  #if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
>  #define __XEN_VMAP_H__
>  
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
>  
> +/** Identifiers for the linear ranges tracked by vmap */

Here and below: Why /** ? Seeing ...

>  enum vmap_region {
> +    /*
> +     * Region used for general purpose RW mappings. Mapping/allocating memory
> +     * here can induce extra allocations for the supporting page tables.
> +     */

... this vs ...

>      VMAP_DEFAULT,
> +    /**
> +     * Region used for loading livepatches. Can't use VMAP_DEFAULT because it
> +     * must live close to the running Xen image. The caller also ensures all
> +     * page tables are already in place with adequate PTE flags.
> +     */

... this, it's not even looking to be consistent.

>      VMAP_XEN,
> +    /** Sentinel value for bounds checking */
>      VMAP_REGION_NR,
>  };
>  
> +/**
> + * Runtime initialiser for each vmap region type
> + *
> + * Must only be called once per vmap region type.
> + *
> + * @param type  Designation of the region to initialise.
> + * @param start Start address of the `type` region.
> + * @param end   End address (not inclusive) of the `type` region
> + */
>  void vm_init_type(enum vmap_region type, void *start, void *end);
>  
> +/**
> + * Maps a range of physical ranges onto a single virtual range

Largely related to it not really being clear what "a range of physical ranges"
actually is, maybe "a set of physical ranges"?

> + * `mfn` is an array of `nr` physical ranges, each of which is `granularity`
> + * pages wide. `type` defines which vmap region to use for the mapping and
> + * `flags` is the PTE flags the page table leaves are meant to have.
> + *
> + * Typically used via the vmap() and vmap_contig() helpers.
> + *
> + * @param mfn          Array of mfns
> + * @param granularity  Number of contiguous pages each mfn represents
> + * @param nr           Number of mfns in the `mfn` array
> + * @param align        Alignment of the virtual area to map
> + * @param flags        PTE flags for the leaves of the PT tree.
> + * @param type         Which region to create the mappings on
> + */
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
>               unsigned int align, unsigned int flags, enum vmap_region type);
> +
> +/**
> + * Map an arrray of pages contiguously into the VMAP_DEFAULT vmap region

Nit: One r too many in "array".

> + * @param[in] mfn Pointer to the base of an array of mfns
> + * @param[in] nr  Number of mfns in the array
> + */
>  void *vmap(const mfn_t *mfn, unsigned int nr);
> +
> +/**
> + * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
> + *
> + * Used when the directmap is unavailable (i.e: due to secret hiding)

Please omit this. There's no reason to suggest it can't also be used for
other purposes.

> + * @param mfn Base mfn of the physical region
> + * @param nr  Number of mfns in the physical region
> + */
>  void *vmap_contig(mfn_t mfn, unsigned int nr);
> +
> +/**
> + * Unmaps a range of virtually contiguous memory from one of the vmap regions
> + *
> + * The system remembers internally how wide the mapping is and unmaps it all.
> + * It also can determine the vmap region type from the `va`.
> + *
> + * @param va Virtual base address of the range to unmap
> + */
>  void vunmap(const void *va);
>  
> +/**
> + * Allocate `size` octets of possibly non-contiguous physical memory and map
> + * them contiguously in the VMAP_DEFAULT vmap region
> + *
> + * The system remembers internally how wide the mapping is and unmaps it all.

This is a verbatim copy of what you say for vunmap(), yet it looks unrelated
here. Maybe you meant to edit it after copy-and-paste? Or maybe this was
meant to go ...

> + * @param size Pointer to the base of an array of mfns
> + * @return Pointer to the mapped area on success; NULL otherwise.
> + */
>  void *vmalloc(size_t size);
> +
> +/** Same as vmalloc(), but for the VMAP_XEN vmap region. */
>  void *vmalloc_xen(size_t size);
>  
> +/** Same as vmalloc(), but set the contents to zero before returning */
>  void *vzalloc(size_t size);
> +
> +/**
> + * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
> + *
> + * @param va Virtual base address of the range to free and unmap
> + */
>  void vfree(void *va);

... here?

Also, if you want this to be considered for 4.19, please don't forget to Cc
Oleksii.

Jan

