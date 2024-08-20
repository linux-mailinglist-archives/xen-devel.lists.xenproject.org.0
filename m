Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429169582CF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 11:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780241.1189867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgLJd-0005sm-Pa; Tue, 20 Aug 2024 09:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780241.1189867; Tue, 20 Aug 2024 09:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgLJd-0005pd-MJ; Tue, 20 Aug 2024 09:38:13 +0000
Received: by outflank-mailman (input) for mailman id 780241;
 Tue, 20 Aug 2024 09:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgLJc-0005pE-Dn
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 09:38:12 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9a3ed67-5ed7-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 11:38:10 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso800241566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 02:38:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838d015asm738899266b.90.2024.08.20.02.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 02:38:09 -0700 (PDT)
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
X-Inumbo-ID: e9a3ed67-5ed7-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724146690; x=1724751490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+NozY5ZdvAwIajBZmKZXdaHS6vOEqlk/A9b6+fwi6NE=;
        b=SF/ofDOM1fUugmRZjyG0hANampMySqHLxvDrTa9JMzsKaWxZW2sCisdCuI0JJXwhZF
         tOaAuRb2zBKMxc2c/Xo9d6IQgVEnXDEq/daJqDOMd1ldfXCuhMl93VTJws1POw76BnyN
         9yU87W7Fdew5uXWYvX414DjK35+3moStCd/PwPHiU1axXLN9AAMPpzyN6LaVHnO8Q4Sq
         FV97rua37A+0D19KrmVkUtt0Hidwa/zWiv7B6ETOwBuiAgcFrZGLUeBpPt5+16k6xLtk
         ixeDL3YKtqlOGtBiefuA5BnPvf3ixEblw6v2o9nfjQigAewZTX9YhNFmGEmRSWgjH6Sm
         RpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146690; x=1724751490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NozY5ZdvAwIajBZmKZXdaHS6vOEqlk/A9b6+fwi6NE=;
        b=S0LhKc0uwO0KHiRHpGsFqE83GI55IAIWZLzgdzfKYUlCFL3zcCIgFIlqGOtPKEwVAf
         noL8GQkLAo6G523veSPcQxnk563hRhQcMVERg2lVIvB6i7z6JeYrBkgq8nTAfieye1f1
         r3KjeTU5/aAfGIhfTcxErvDD/7McX94YKDJXq12F+1+pEdzyy2UdeSoX9Q49uDaYwhy+
         +mDPm7tm6YbhF0CtEPawnVmBrlegLyzk+Wzh7VMgGdOMtdHR3n6qLMxZvOjAZHf5BYNg
         edcPV42IsVDyd5aZNf7nLZxda3KPL6Pf2Ch1eQINQKHsUFNeZqWZg7RHiLc9exSwDaT4
         2CTw==
X-Forwarded-Encrypted: i=1; AJvYcCXVb6JA6vDTx0CDGUu/WzmnumWnqe/pPom6q4gDmnCEUwDYxK6pBLS+wtW4MX1TdjHR2NDr1B35uP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6xb1OwV4Qe+Bm2BvuT23z5Vfipa917vBsN9EBaQ/SC/RYawV8
	4eJlH/W2nymWBE4LZpPziACx2JjnLPScL0vMg5nLWDjCWY/Dj3Z7D0HJZvGz9g==
X-Google-Smtp-Source: AGHT+IEPBH5lFRLcB4lxBgQg9tNKFfBqKQQfsk6wOfQV5ywxbBkGJCylykN/aC4NPHooONPyfH3Fbg==
X-Received: by 2002:a17:907:2d07:b0:a7a:b26d:fb5 with SMTP id a640c23a62f3a-a8643f8115emr239072066b.19.1724146689632;
        Tue, 20 Aug 2024 02:38:09 -0700 (PDT)
Message-ID: <d32735a1-79a9-43c1-b4a6-15ddbc203646@suse.com>
Date: Tue, 20 Aug 2024 11:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-6-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 10:20, Juergen Gross wrote:
> When running as a Xen PV dom0 it can happen that the kernel is being
> loaded to a guest physical address conflicting with the host memory
> map.
> 
> In order to be able to resolve this conflict, add the capability to
> remap non-RAM areas to different guest PFNs. A function to use this
> remapping information for other purposes than doing the remap will be
> added when needed.
> 
> As the number of conflicts should be rather low (currently only
> machines with max. 1 conflict are known), save the remap data in a
> small statically allocated array.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - split off from patch 5 of V1 of the series
> - moved to p2m.c
> ---
>  arch/x86/xen/p2m.c     | 65 ++++++++++++++++++++++++++++++++++++++++++
>  arch/x86/xen/xen-ops.h |  3 ++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
> index 7c735b730acd..bb55e0fe1a04 100644
> --- a/arch/x86/xen/p2m.c
> +++ b/arch/x86/xen/p2m.c
> @@ -80,6 +80,7 @@
>  #include <asm/xen/hypervisor.h>
>  #include <xen/balloon.h>
>  #include <xen/grant_table.h>
> +#include <xen/hvc-console.h>
>  
>  #include "xen-ops.h"
>  
> @@ -792,6 +793,70 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
>  	return ret;
>  }
>  
> +/* Remapped non-RAM areas */
> +#define NR_NONRAM_REMAP 4
> +static struct nonram_remap {
> +	phys_addr_t maddr;
> +	phys_addr_t paddr;
> +	unsigned long size;

size_t?

> +} xen_nonram_remap[NR_NONRAM_REMAP];
> +static unsigned int nr_nonram_remap;

Both __initdata? Or, considering patch 6, at least __ro_after_init?

> +/*
> + * Do the real remapping of non-RAM regions as specified in the
> + * xen_nonram_remap[] array.
> + * In case of an error just crash the system.
> + */
> +void __init xen_do_remap_nonram(void)
> +{
> +	unsigned int i;
> +	unsigned int remapped = 0;
> +	struct nonram_remap *remap = xen_nonram_remap;
> +	unsigned long pfn, mfn, len;
> +
> +	if (!nr_nonram_remap)
> +		return;
> +
> +	for (i = 0; i < nr_nonram_remap; i++) {
> +		pfn = PFN_DOWN(remap->paddr);
> +		mfn = PFN_DOWN(remap->maddr);
> +		for (len = 0; len < remap->size; len += PAGE_SIZE) {
> +			if (!set_phys_to_machine(pfn, mfn)) {
> +				pr_err("Failed to set p2m mapping for pfn=%ld mfn=%ld\n",

I'm not convinced that frame numbers logged in decimal are overly useful.

> +				       pfn, mfn);
> +				BUG();
> +			}
> +
> +			pfn++;
> +			mfn++;
> +			remapped++;
> +		}
> +
> +		remap++;
> +	}
> +
> +	pr_info("Remapped %u non-RAM page(s)\n", remapped);

This message may be useful in a log also when nothing was remapped - maybe
drop the initial if()?

> +}
> +
> +/*
> + * Add a new non-RAM remap entry.
> + * In case of no free entry found, just crash the system.
> + */
> +void __init xen_add_remap_nonram(phys_addr_t maddr, phys_addr_t paddr,
> +				 unsigned long size)
> +{
> +	if (nr_nonram_remap == NR_NONRAM_REMAP) {
> +		xen_raw_console_write("Number of required E820 entry remapping actions exceed maximum value\n");
> +		BUG();
> +	}
> +
> +	xen_nonram_remap[nr_nonram_remap].maddr = maddr;
> +	xen_nonram_remap[nr_nonram_remap].paddr = paddr;
> +	xen_nonram_remap[nr_nonram_remap].size = size;
> +
> +	nr_nonram_remap++;
> +}

You don't enforce any constraints on the addresses / size here. With
this the loop in xen_do_remap_nonram() may terminate too early if non-
page-aligned values were passed into here. Both addresses not having
the same offset-into-page may also end up anomalous. Might be worth
switching to frame numbers / number-of-pages for the tracking struct.

Jan

