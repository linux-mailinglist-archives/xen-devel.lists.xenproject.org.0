Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D74C0063E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148957.1480769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsBV-0007Og-Nv; Thu, 23 Oct 2025 10:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148957.1480769; Thu, 23 Oct 2025 10:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsBV-0007N1-LC; Thu, 23 Oct 2025 10:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1148957;
 Thu, 23 Oct 2025 10:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBsBT-0007Mv-NE
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:04:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af7c9085-aff7-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 12:04:38 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so3840065e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 03:04:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949e0a3csm58781295e9.0.2025.10.23.03.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:04:37 -0700 (PDT)
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
X-Inumbo-ID: af7c9085-aff7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761213878; x=1761818678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ULq0ASa9hjDy9wXxwtLZUd3OI6CEawZCURdqRYqyTw=;
        b=bnHDE4g2C4oc3+H/+X1vnUMz+lc7aSvCOjjHGryedkXQJencczdL8VIuP/0TBQerNB
         G52T7/xsIFvLW79vgHyelWZ2S2dlX96ZPHZfHx8fFiyxyYI+KSUsTvPWrSuuEc3RXGXW
         1U1yJLq8msJIAzO5k4ZZyOC3306g2Tyv3AVTmbs1cdqQlIP7nVYbJpKeqj/mzOAmVxEa
         25WRgBrsUHqTVPudSYpprYa6z4XHB+3bnfeufuJaOXR8CzqWZtwGBFH90fbfKnTfUcXQ
         SDIHtuYS91Be93QyZhfi39ewLP7J1uh8zkJKT6Sdgfbv/M/2KAiQgGnircPNW2lF9/hw
         vUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761213878; x=1761818678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ULq0ASa9hjDy9wXxwtLZUd3OI6CEawZCURdqRYqyTw=;
        b=aRl79QOGxKIIUuzPtTKeaXR4OEyWqwq8BOZ73PxyLogukjIYo48gfRmP1t8ScqZf2a
         hmoUaOyFjUk3S+QA00XMEQmrnJ0lsJnpiu675zgwFihFJvvefjJgm8U6rtEdE8FJF6r6
         rmZ8I2cYmRUiDAzMymbLEvkKMy93VfV9VVDnrtoX5WmOVP4wXvnEYznhnhWVvQKt3AGC
         OdNTcV1uJnkFVbYFsbn2Mc8/TkgUz4D4GW6aad8nPPJgqmrnEGohU0/m7djEQRN0S0qJ
         B+3U/0SyDqL1sZgWHnCXL8PTWslh1KnhNMuYfedpBev83Iwn5EBUBftKyWr7aZkIooLL
         oURA==
X-Gm-Message-State: AOJu0YzwR2F9geywhq7aWb98leVSVek+1bKl92h7u0JLPBPyIMeH5FfT
	x3XUuAdZdSsnyznuaJtXc1dkn2pV7BX9XZPu+5ADqUDXWGo1uhj6WM0P/tyhSMFrSw==
X-Gm-Gg: ASbGncuG+ZWF4DTyYmPVCTkxJMG1qmRXNMSq/ckao7suzGTeI7HorGqxGkrTve2vQe8
	lY7C2StPhpNg3MajHK+Oksi25CpnpYqe58jfJqBePEgSP3Lssvsts/VZxd1nxrEa7C//S+MsJ4E
	cTeXcxpb8K2sWcZQwKIiQ1RWXJFbELBiVGEab5WhH1BO5YbXo3DLoo2o/eHR3yWdluNmjkTCSOf
	BdS+V/7nuiTRxSL9GmDEmyd9tyoZZ4CKbvoNHzPTT/W9OTvqn6i38P2wlCpIEyCtgHLKFDT3yLy
	PS5BPCxFpe7o5GNgNFgm4YffWFs6HRhyW+Aict1NNGE2+pPqlN2avDLPmoapqKb9xyE/LDsWbyX
	t2Twpd6Leg8tzFYD5pPw0uTGtR/tJTUvq5iLJcp0lavJ66udpjY3KLwjAdhwUYSNyqWIxTKycf7
	O+im5pLN61yMD99/XLo6uBFtJbP5RAvQKFj15yfb1MhxtWQ/PMc7iOJAGhxxMN
X-Google-Smtp-Source: AGHT+IG29kyt0dxHhJPHyqd5Lk1neZJlKjlI4wO1kVDCMgvVAFZa4ildmhvFQvGgg2gDZDR0xQhk0A==
X-Received: by 2002:a05:600c:3e0f:b0:471:803:6a26 with SMTP id 5b1f17b1804b1-4711791d945mr186435345e9.37.1761213877925;
        Thu, 23 Oct 2025 03:04:37 -0700 (PDT)
Message-ID: <7c179c6a-1bf8-4d8a-846b-e8673bf07fa0@suse.com>
Date: Thu, 23 Oct 2025 12:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] vtd: Drop (un)map_vtd_domain_page wrapper
To: Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <a832488afe6eeb8dd83ccd1214dff87c5e6b4fc0.1761209564.git.teddy.astie@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <a832488afe6eeb8dd83ccd1214dff87c5e6b4fc0.1761209564.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 11:12, Teddy Astie wrote:
> Replace use of (un)map_vtd_domain_page with its general
> equivalents. Also take the opportunity to make iommu->root_page
> (previously root_maddr) use struct page_info instead of u64.

free_pgtable_maddr() also goes away as it seems.

> @@ -244,7 +245,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned int nr)
>          {
>              /* This entry across page boundry */
>              if ( iremap_entries )
> -                unmap_vtd_domain_page(iremap_entries);
> +                unmap_domain_page(iremap_entries);

Please can you also drop such redundant conditionals then? unmap_domain_page()
may validly be called with NULL. Overall it looks as if this patch could do
with splitting, as the unmap_vtd_domain_page() replacement is an entirely
mechanical one (and accounts for a fair part of the patch). I'm not going to
insist, though.

> @@ -366,8 +367,8 @@ struct iremap_entry {
>   */
>  #define GET_IREMAP_ENTRY(maddr, index, entries, entry)                        \
>  do {                                                                          \
> -    entries = (struct iremap_entry *)map_vtd_domain_page(                     \
> -              (maddr) + (( (index) >> IREMAP_ENTRY_ORDER ) << PAGE_SHIFT ) ); \
> +    entries = (struct iremap_entry *)map_domain_page(maddr_to_mfn(            \
> +              (maddr) + (( (index) >> IREMAP_ENTRY_ORDER ) << PAGE_SHIFT ) ));\
>      entry = &entries[(index) % (1 << IREMAP_ENTRY_ORDER)];                    \
>  } while(0)

You drop casts elsewhere - why not here? Also, as you touch the 2nd of the lines,
can you please also drop the excess blanks? And then, while only theoretically at
risk of overflowing, the open-coded left shift may also want replacing by e.g.
pfn_to_paddr(), i.e. something which incorporates a suitable cast to paddr_t.

> --- a/xen/drivers/passthrough/vtd/qinval.c
> +++ b/xen/drivers/passthrough/vtd/qinval.c
> @@ -18,6 +18,7 @@
>   */
>  
>  
> +#include <xen/domain_page.h>
>  #include <xen/sched.h>
>  #include <xen/iommu.h>
>  #include <xen/time.h>

Please could you take the opportunity and also get rid of one of the two blank
lines?

> @@ -99,38 +100,38 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
>             iommu->index, &PCI_SBDF(iommu->drhd->segment, bus, devfn),
>             gmfn);
>  
> -    if ( iommu->root_maddr == 0 )
> +    if ( iommu->root_page == NULL )
>      {
> -        printk("    iommu->root_maddr = 0\n");
> +        printk("    iommu->root_maddr = NULL\n");

root_page here then as well?

Jan

