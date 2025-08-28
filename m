Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB4B39D51
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098680.1452675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbm1-00073X-Pl; Thu, 28 Aug 2025 12:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098680.1452675; Thu, 28 Aug 2025 12:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbm1-000714-MO; Thu, 28 Aug 2025 12:30:37 +0000
Received: by outflank-mailman (input) for mailman id 1098680;
 Thu, 28 Aug 2025 12:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbm0-00070y-HI
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:30:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb2efa58-840a-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 14:30:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afebe21a1a3so154360766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:30:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe91744c66sm730667266b.88.2025.08.28.05.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:30:33 -0700 (PDT)
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
X-Inumbo-ID: cb2efa58-840a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756384234; x=1756989034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bsrTc/lA0Nn9E7khQt++ebnJPcbrN258ahuu2t+++8s=;
        b=HHK9o4eUP/D09u8xikoiODK0A5c2XEBXVZgickLuF5dmYc83oOPLyfuEQSkKjJzOmr
         ZpW5u5BbopmsEgeKO6abfoc44QJRDjeSFlq6cyUeGsz5D87iEkGdS4BL+6YsYrUQfgIe
         93eIkwswSWR950lRCZPy2N5vr5Tjdv1DOYMo/kOCUXoceWCTFcHRTVr6WAb0OCOwDsLR
         1BykrZY7tz91wbOBAVZdWt0geEhWzcfzYXdus8hQNejE0aK40DgEbY4UQ4Ko/nZIKko2
         pVoIaChINBkDwOoSU5/Ng9+6FWfiDouNB36Y+BRFbn5B1C0glfIYO7EyG7VZnGGa+jo9
         wozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384234; x=1756989034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsrTc/lA0Nn9E7khQt++ebnJPcbrN258ahuu2t+++8s=;
        b=MOzeBfnNFGkpnrXJxCChhX+d+GvVAPAT5fF17KOh2bb/7EG9yvDJdGMdyINzSUB+/d
         9T2MuzRs2MEDT0LhjWjBn0v0I7zMiV3jWCnJuz1QUzHxMKT4l8SzRMUDKoEBeSads8os
         UlIBXdOPRZqNY/oKfihjvFciNhANs43AGWi1lbkZP4SfeKf1VRIxYnlj2lQuqMMExMX7
         2jYIBrm+QBLifr5/WWUMbHuRAlyaa91HidrccJ8qMKlb78w7EVlErCzsIFJa7fmwo814
         ngCnJoZIQUqGfaVl+LEZSAIAo29nWsquAt3s79w8d+M3ZPru5ZqJ+H0/Ay9mXjtvStna
         CooA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7ZAnYjDSBE88bGCxHq6PvjxZElZ3OyiAMwClGPB21Ok6q5TJz6uRdLXsqxTCCWFyk1J/CPHTWuc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHFsIzjZ3x2U1tK+2gZGLWhNpygf2u7rjE32sl/p4N6VIMnEjM
	EViB+XxzJ7fYkby6FoKwszqPDlXNiWIoX+gWBhhkgzkBo6b06Mu7C298jDWqj09rEA==
X-Gm-Gg: ASbGnctODhhFsWo860K0ucNRetP3fgHh4ktn+HfKqZh9kXzLjjJia5PXgr68+YLRqjv
	q7V41j/JNn5mszBw4c6xN6iIirPvGHnzt5DomfEsckCKbulErxmeCXc6iY+mhIn/xB65CgITb3e
	De/Ks0bPKjwuyPSkZuXKMufpOSb84hChBtyy13bA4slMBOte53nGsqyMJBXxWj0TSqRGGgHp4mL
	JrmiaSI1ionWLlo9zONlrnw13LDjTOo9Hbs+2tV/Gb4CA5swkCrnL2JOUxg5CxuBBP2GP/nHLkt
	iSvrc1namKvDc9Lf3AHgEpo4pg6b8NoztVST7yc6I8ZUWFeLxvVP8W0mrTaLiCzo6RsCo8yDwoo
	D4WrzngAS+LONIg1J6hDfaTVBB3vTQXNg0/3IYo+U2tmss4bwbGfwOd7DFQZameV5GHYO889ms8
	/Y0+urBa2DVqDXeFuyHQ==
X-Google-Smtp-Source: AGHT+IGl/VOwfBb3yrz4uQ7aDoEFj66G4Ki8YemkEegpypeMpHi3M6jS7MZr5BwFxkS0brp3t6G3pg==
X-Received: by 2002:a17:907:7ba7:b0:af9:c31c:15fb with SMTP id a640c23a62f3a-afeafecc71cmr913736366b.12.1756384233805;
        Thu, 28 Aug 2025 05:30:33 -0700 (PDT)
Message-ID: <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com>
Date: Thu, 28 Aug 2025 14:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/9] hvm: Introduce "fixed memory layout" feature
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> @@ -686,10 +691,31 @@ static int domain_construct_memmap(libxl__gc *gc,
>      /* We always own at least one lowmem entry. */
>      unsigned int e820_entries = 1;
>      struct e820entry *e820 = NULL;
> +    uint64_t highmem_start = ((uint64_t)1 << 32);
>      uint64_t highmem_size =
>                      dom->highmem_end ? dom->highmem_end - (1ull << 32) : 0;
>      uint32_t lowmem_start = dom->device_model ? GUEST_LOW_MEM_START_DEFAULT : 0;
>      unsigned page_size = XC_DOM_PAGE_SIZE(dom);
> +    /* Special region starts at the first 1G boundary after the highmem */
> +    uint64_t special_region_start =
> +        (highmem_start + highmem_size + GB(1) - 1) & ~(GB(1) - 1);

That is, inaccessible before entering PAE mode?

The open-coding of ROUNDUP() also isn't nice, but sadly unavoidable as long
the the macro works in terms of unsigned long.

> @@ -769,6 +805,40 @@ static int domain_construct_memmap(libxl__gc *gc,
>          e820[nr].type = E820_RAM;
>      }
>  
> +    /* Special regions */
> +    if (libxl_defbool_val(d_config->b_info.arch_x86.fixed_mem_layout))
> +    {
> +        e820[nr].type = XEN_HVM_MEMMAP_TYPE_SHARED_INFO;
> +        e820[nr].addr = special_region_offset;
> +        e820[nr].size = page_size;
> +        special_region_offset += e820[nr].size;
> +        nr++;
> +
> +        if ( gnttab_frame_count )
> +        {
> +            e820[nr].type = XEN_HVM_MEMMAP_TYPE_GRANT_TABLE;
> +            e820[nr].addr = special_region_offset;
> +            e820[nr].size = gnttab_frame_count * page_size;
> +            special_region_offset += e820[nr].size;
> +            nr++;
> +        }
> +
> +        if (d_config->b_info.max_grant_version >= 2 && gnttab_status_frame_count)
> +        {
> +            e820[nr].type = XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS;
> +            e820[nr].addr = special_region_offset;
> +            e820[nr].size = gnttab_status_frame_count * page_size;
> +            special_region_offset += e820[nr].size;
> +            nr++;
> +        }
> +
> +        e820[nr].type = XEN_HVM_MEMMAP_TYPE_FOREIGN_REG;
> +        e820[nr].addr = special_region_offset;
> +        e820[nr].size = MB(512);

Can we really know this is going to be enough for all use cases?

> --- a/xen/include/public/arch-x86/hvm/start_info.h
> +++ b/xen/include/public/arch-x86/hvm/start_info.h
> @@ -99,6 +99,13 @@
>  #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
>  #define XEN_HVM_MEMMAP_TYPE_PMEM      7
>  
> +/* Xen-specific types (OEM-specific range of the ACPI spec) */
> +#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page */
> +#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages */
> +#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
> +#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
> +                                                     /* and foreign mappings */

I question it being legitimate for us to introduce new E820 types.

Jan

