Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAFF9C0453
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831705.1247054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90ra-0000TU-1q; Thu, 07 Nov 2024 11:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831705.1247054; Thu, 07 Nov 2024 11:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90rZ-0000Qx-Ug; Thu, 07 Nov 2024 11:39:45 +0000
Received: by outflank-mailman (input) for mailman id 831705;
 Thu, 07 Nov 2024 11:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t90rY-0000Qr-OK
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:39:44 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f993c4be-9cfc-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 12:39:40 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so741939f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:39:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c26e3sm21137675e9.33.2024.11.07.03.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:39:39 -0800 (PST)
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
X-Inumbo-ID: f993c4be-9cfc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5OTNjNGJlLTljZmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTc5NTgwLjcwNzQ3OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730979580; x=1731584380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y3sWFnTKA+M0AYgMs7ToFiiuGneUzyuFwxDollg57Q=;
        b=f26/mbMOehPLNnYuQC87RdLxjjhYMjEiIQzFIG+0Np+YdX+h8Vx6c87FyIm9Y9FnAk
         Hdo73gopDBTjPIWNJq9DEmdpVjYzT/CZorFKX0ktzz/o0AgQAHSjkvLaVBlNPQjATO9r
         /85Zo2p8maiCFJoORi5lbY3ATgvIFYGXr6qjqX0l5C03xqEao22N7e04vSkr/5T0W/U/
         ri7Zh+HkkgC5JiKZ9DSqHMf6dDutVF4UKvi6mOXqW4sT30e6y0MV9rRp23iOaE/SgJIo
         MzO66U5EpdmwlWMHV9P2PB5pehcjrAuo3wwvSvCDVjD+SOFHQwYa9WpGHHwycO7/qacf
         6B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979580; x=1731584380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y3sWFnTKA+M0AYgMs7ToFiiuGneUzyuFwxDollg57Q=;
        b=ZZxiF6tCwyJfn2Z5sUfb/KCXoZMtkZGTtizkBU4AriUQQiMIWXD/WI+MgZawFomC/y
         pBwtt8JCFgblokILuU91bxFWKw35xhtnH9w50/kisffglH3wfjqlZIM33GOz1XkAD+FX
         V7UA6CikhF/P6C7UqU07Z5+6XashCYxAnHoyv5dMeCg1ojAwuaKpBwB9H9r6IbwxPoo4
         rMVOzqBIOMHrygTSRMEoTxW8Tqt1f9RIYsMi+pd0bPDkhQunTHpSIQQAhlydI/ujleqI
         kSnssKe35svCEtHZi+JsGSDcEXtj/NrCQR7PtH7JhuqQKlhk2wf2XAU5m/MFu2TBlEaW
         lmCg==
X-Forwarded-Encrypted: i=1; AJvYcCXQIU4HjprER9CkWTvTF7C4B8t50+AMb7+1/K4lKdR+3W9ZUHjeF7GWderzF7/k9D0Cu88mYihS0O8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKtQvVY+ZvJg94ewquLznexLHh20p/rK/iQRzResCpdQ3Z7vUu
	fk1VKMHL62bqH1g+8m3Caik/FdNs1ndmvHwmz2leiAg2oGn7gaNVJOwZdWrkHA==
X-Google-Smtp-Source: AGHT+IEghTBKaTxQ3K8cdWEzBcrKC9DXOHwKhDWsMsASxq2ROt7dkZbTzDiRcHnNdmeyjvoA1ATYfg==
X-Received: by 2002:a05:6000:4189:b0:381:d844:512f with SMTP id ffacd0b85a97d-381d844521bmr9918420f8f.57.1730979579985;
        Thu, 07 Nov 2024 03:39:39 -0800 (PST)
Message-ID: <41bdfd6c-f842-4969-a30a-17d91916d8ac@suse.com>
Date: Thu, 7 Nov 2024 12:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241107111440.443547-1-bernhard.kaindl@cloud.com>
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
In-Reply-To: <20241107111440.443547-1-bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.11.2024 12:14, Bernhard Kaindl wrote:
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -4,6 +4,7 @@
>   * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>   */
>  
> +#include "xen/pfn.h"
>  #include <xen/init.h>
>  #include <xen/keyhandler.h>
>  #include <xen/mm.h>

Please retain sorting, and please don't use ""-style includes when all others
use <>-style (and there's no specific reason for using quotes).

> @@ -499,15 +500,41 @@ int __init compute_hash_shift(const struct node *nodes,
>      return shift;
>  }
>  
> -/* Initialize NODE_DATA given nodeid and start/end */
> +/**
> + * @brief Initialize a NUMA node's node_data structure at boot.
> + *
> + * It is given the NUMA node's index in the node_data array as well
> + * as the start and exclusive end address of the node's memory span
> + * as arguments and initializes the node_data entry with this information.
> + *
> + * It then initializes the total number of usable memory pages within
> + * the NUMA node's memory span using the arch_get_ram_range() function.
> + *
> + * @param nodeid The index into the node_data array for the node.
> + * @param start The starting physical address of the node's memory range.
> + * @param end The exclusive ending physical address of the node's memory range.
> + */
>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>  {
>      unsigned long start_pfn = paddr_to_pfn(start);
>      unsigned long end_pfn = paddr_to_pfn(end);
> -
> -    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
> -    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
> -
> +    struct node_data *numa_node = NODE_DATA(nodeid);

Nit: Just "node" as a name would likely suffice, without losing anything,
yet helping readability?

> +    unsigned int idx = 0;
> +    int err;
> +
> +    numa_node->node_start_pfn = start_pfn;
> +    numa_node->node_spanned_pages = end_pfn - start_pfn;
> +    numa_node->node_present_pages = 0;
> +
> +    /* Calculate the number of present RAM pages within the node */
> +    do {
> +        paddr_t ram_start, ram_end;
> +
> +        err = arch_get_ram_range(idx++, &ram_start, &ram_end);
> +        if ( !err && ram_start < end && ram_end > start )
> +            numa_node->node_present_pages += PFN_DOWN(min(ram_end, end)) -
> +                                             PFN_UP(max(ram_start, start));
> +    } while ( err != -ENOENT );
>      node_set_online(nodeid);

Nit: Blank line above here please.

With those (happy to take care of while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

