Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04DA27340
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881470.1291612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJK0-0006e7-Ck; Tue, 04 Feb 2025 13:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881470.1291612; Tue, 04 Feb 2025 13:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJK0-0006c2-A3; Tue, 04 Feb 2025 13:50:36 +0000
Received: by outflank-mailman (input) for mailman id 881470;
 Tue, 04 Feb 2025 13:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfJJy-0006bw-Ht
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:50:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00852f17-e2ff-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 14:50:32 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab7515df1faso96278966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:50:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6ee76b8fcsm866716866b.137.2025.02.04.05.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:50:31 -0800 (PST)
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
X-Inumbo-ID: 00852f17-e2ff-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738677032; x=1739281832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cNXhWnvOxXUUdXjQ1zX6AoPTZuBKBo0xI/Uf5fqfSt0=;
        b=XWEvt5Qrrh37kjBeQ1Mbq2p48o0/TCXK3EBgKSQHtkj797GMFC4xE41cE1IPVm3uYB
         qA0FbXdUmMk3S+UBH41mJ7tQIhLP6gY9bjhTHraP+s5667A1EQJJKFsanOMM5X8x+46p
         s/fLxUtKTWv7QDjXTWbiDSdmPNJndFxhU4/rVknqkmRz8wqZ6hz4bMoB1CgOv3u44lfY
         +lMZ35N3QS2KzXSwQKifqRa8ZlYUA8KQedjdjgms1Tj/aclvtmDzU+S10swCniREWCA0
         Vt7mQJiWxgXBbxFF6VX5AM1llPWXSGMToc6UggqGZ5ymPHE/jse3znkiPsqMTPYDbkEv
         xMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677032; x=1739281832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNXhWnvOxXUUdXjQ1zX6AoPTZuBKBo0xI/Uf5fqfSt0=;
        b=TYZNurlAYLXVZRNEAqKudgs/+V6ZdmRFc0ELDsVfmqEt3dKjigvE4+tFr5+MQ1AsLo
         Tc9OSWfCyXfsTSn35DVFSI6uYDpWdkNGHBNyoqBZc8Esb645ZzYyWC+zkxfN1Tgcqfv7
         eaqUC3ejOo3MGnNvTfyTYLk93O+Rcly0HFLQmrsuR+JSc2LQHVO71VS53qssEq6LuKhH
         qclqszcU48MBkRDdwAtBjm/E3RYpgmwnpLYr5u7uSPWjgFR7fXPWKnbOIx4VICaY0CBx
         rp6o60rLXVGt4K3wrG+Yk2mfKcUeVcoQJY5i1G+Oo27a40TG4VlOBbQRiOac+23tQgLO
         hQMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKO/vplwt9WZpOVBHUH1iUjGpbt3jWeTTM5XksV46AnkV47h9Ta8SlomHz5YJNN6dFqKP3fGEDF74=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyR8SQkAff45hLfajXNPq3oqmy8Bm0e+k5sRRGgXlZmx1+5OLUg
	JKWAyf3h8IxAWfvQ59Y8HKSiTb6rPItZlW6xB9fSMhxS0N3FS/uz8SrxfRcWAg==
X-Gm-Gg: ASbGncv4ja5gnSg0lNGIW2wL9TaywMSCKYAF7XIz0tfrqSV8KNkC7BK/wyqErtcPixI
	umNRgpLWV4vw5OfBXsjyUZCZyfUz+eIOiUkVEIvQsTsTzM7x6a51figAU87V76yo18uaYvga1O0
	MCwgT2aYtPS44VcqptWoGXLJhZj+IGy0dgVE0Fv46Liuw1opYTky9zDXnlrgqOxTXDJsMyBa61b
	gYPVS1i3FE46P1k7YtMBWO6y/vB9H6w2C3Pzw4v4Q/dBP8HYCSayfGGltjPpynNNDQ9n++RSPZN
	ftfZE0GERhxcaM5LAiUYxseBPrF8UQ3le0Bi8vyRtXOAYSwwIakZP1usfsx/eJ/GxF2smqUeiHR
	J
X-Google-Smtp-Source: AGHT+IFNCW1Qt0A6Gvr+aoJXmzKafNc8nWILg0KZae+f3tNJidCgSUuo7QbssbJc1sLoUlX5QJfKRA==
X-Received: by 2002:a17:907:940f:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ab710123dd0mr1271691666b.14.1738677031862;
        Tue, 04 Feb 2025 05:50:31 -0800 (PST)
Message-ID: <475fc7fc-87ab-493e-8bef-eddeaa64aa54@suse.com>
Date: Tue, 4 Feb 2025 14:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 1/3] xen/riscv: implement software page table
 walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <a4f0b312351e5f6a9e57f50ebbc3bda8a72c18bb.1738587493.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a4f0b312351e5f6a9e57f50ebbc3bda8a72c18bb.1738587493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 14:12, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -156,6 +156,10 @@ static inline struct page_info *virt_to_page(const void *v)
>      return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
>  }
>  
> +#include <asm/page.h>

asm/page.h already includes asm/mm.h, so you're introducing a circular
dependency here (much of which the patch description is about, so it's
unclear why you didn't solve this another way). Afaict ...

> +pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);

... it's pte_t that presents a problem here. Why not simply put the
declaration in asm/page.h (and drop all the secondary changes that
don't really belong in this patch anyway)?

Also nit: Excess blank after the first *.

> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -274,6 +274,61 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>      return rc;
>  }
>  
> +/*
> + * pt_walk() performs software page table walking and returns the pte_t of
> + * a leaf node or the leaf-most not-present pte_t if no leaf node is found
> + * for further analysis.
> + * Additionally, pt_walk() returns the level of the found pte.
> + */
> +pte_t * pt_walk(vaddr_t va, unsigned int *pte_level)

See nit above.

> +{
> +    const mfn_t root = get_root_page();
> +    /*
> +     * In pt_walk() only XEN_TABLE_MAP_NONE and XEN_TABLE_SUPER_PAGE are
> +     * handled (as they are only possible for page table walking), so
> +     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
> +     */
> +    int ret = XEN_TABLE_MAP_NOMEM;
> +    unsigned int level = HYP_PT_ROOT_LEVEL;

With this initialization and ...

> +    pte_t *table;
> +
> +    DECLARE_OFFSETS(offsets, va);
> +
> +    table = map_table(root);
> +
> +    /*
> +     * Find `table` of an entry which corresponds to `va` by iterating for each
> +     * page level and checking if the entry points to a next page table or
> +     * to a page.
> +     *
> +     * Two cases are possible:
> +     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;

(nit: found)

> +     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
> +     *   pt_next_level() is called for page table level 0, it results in the
> +     *   entry being a pointer to a leaf node, thereby returning
> +     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
> +     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
> +     *   mapped.
> +     */
> +    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
> +    {
> +        /*
> +         * This case shouldn't really occur as it will mean that for table
> +         * level 0 a pointer to next page table has been written, but at
> +         * level 0 it could be only a pointer to 4k page.
> +         */
> +        ASSERT(level <= HYP_PT_ROOT_LEVEL);
> +
> +        ret = pt_next_level(false, &table, offsets[level]);
> +        level--;

... this being the only updating of the variable, what are the assertion and
accompanying comment about? What you're rather at risk of is for level to
wrap around through 0. In fact I think it does, ...

> +    }
> +
> +    if ( pte_level )
> +        *pte_level = level + 1;
> +
> +    return table + offsets[level + 1];
> +}

... which you account for by adding 1 in both of the places here. Don't you
think that it would be better to avoid such, e.g.:

    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
    {
        int ret = pt_next_level(false, &table, offsets[level]);

        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
            break;
        ASSERT(level);
    } 

or

    for ( level = CONFIG_PAGING_LEVELS; level--; )
    {
        int ret = pt_next_level(false, &table, offsets[level]);

        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
            break;
    } 

This then also avoids the oddity about ret's initializer.

Jan

