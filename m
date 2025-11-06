Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0BC3B0F6
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:04:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156908.1485864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGze6-0006ar-Pk; Thu, 06 Nov 2025 13:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156908.1485864; Thu, 06 Nov 2025 13:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGze6-0006Xu-MZ; Thu, 06 Nov 2025 13:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1156908;
 Thu, 06 Nov 2025 13:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGze5-0006Xn-31
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:03:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f69f6ac3-bb10-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 14:03:18 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so1597331a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 05:03:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6412a27d68dsm892825a12.9.2025.11.06.05.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:03:17 -0800 (PST)
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
X-Inumbo-ID: f69f6ac3-bb10-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762434197; x=1763038997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pTFkOsol1TTrMbH7ADYYyVHOeaP/t2T6e6F++LlNxWU=;
        b=GpOkU+JXMwdZ5UO8bFCm+wGaXB2koOvuf9KQ9r95ZwwC4oXg5DGhKHB/dy3ucPd9TK
         OM6zkFZepeCmhw7uK2etdC/JzOaZ0f9zXnS7lhJXa3CJn1Id27XXMJ6k90JbZvR+BCYO
         NMDl8wJ9+uGjC7f/g23ghnIaAcrh01tgdFqs2cY4m+n54Cy+mV2ki+lwIdyY4jy/z22h
         RZxqUUaSau7kkngsw9XWD2cdq4UR/AbkDRLW6qAjvvm8H0eEOQ0CN6ewoQCg2zVLEJCH
         XC4V96orlKCGamCs14w4WDO3j9lq2mS1XSJaPDv+9EVlcDW/ZCUSCte279bzrDbhtd0q
         Ik2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434197; x=1763038997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTFkOsol1TTrMbH7ADYYyVHOeaP/t2T6e6F++LlNxWU=;
        b=pDqPHnM11I9ANVHiGkmSCOzblUzvuG4mB0UaIfyMXV36GK1ajTwofJNOPzxUFkZl6U
         de3F1RHuUej5bD/tLgH3Mu1jxyHRUHT8A9W56eCZ8z8woiNZ2k3z+6nWj5107v+rsgYM
         RXUFkQOa/PsRq0hHkj+49BaadwTdynQnK+VzGsq1jHkZvM6bnaBW48v1kS4N6ODyRy+r
         utzFZWi+Np9v0MezuFLdRW2Jj8ZqDTIqVAPPaKFukF4AJPMaJMtvXqsMRQdQEEH6D7sn
         GdUKNX3c+ztfgOPSLNqJq3yGRgqdxb39q6dyOQzsSjPwjNrUXEjDQ45qp7IlGSd5tOni
         udZA==
X-Forwarded-Encrypted: i=1; AJvYcCUXqKPe67+SAQZ8YhJGZe0REer7aKvm1kfsKSbiWvqNcZ3i6nXTkru4xYxmckFzrcGZnc2+YoUZdw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz37/fWC4Fdh4vaqgfxX0plSP6zFpQwZI7qIHUC6mpSsWwQc536
	2JV7Bx/DBUdfY3LoXbXsLQE/MOvmtPba/y6uyw6zQqFBPurKPE9x4Oql3Dcxl/Mnhw==
X-Gm-Gg: ASbGncslJAUfQU6SvsUNXD0inEbFb2pPXT+OwBWsUsswKxZy4SEPnGV6SfWilooMD4j
	FKu/RXIgx+tasm66NPtJOUhoyXGkCpnPs4lWb6vHcpEjEMvzEFWNrIFeYqgXrhoBxqaATEUEMeo
	MXI6J6qXpdIWWQosLTqFhalp3srVQOM/w/p0GPMYXkMYX0SVDFJoS4jfH+Gtvxn+vu5EjyOT4B7
	gFyxPyLJqpemtBqNdckrp6In/cjyxXOICaHCs1U9ZwFEkdSNWwQftmTRdWCg6fVCkNaJDQk8RRZ
	4rja6TTeqR3T6ixEwwPNCtPyMJtZKD/BUYg9SjZJAe3UpPvi5mCPXHwDn4vJ3Sp9RoOKXQzM9gW
	H713IbfRU5Wn+tYEL+7OsRKKz+Amj+Ou4sBPT1350J6wQIMtNXSM1uMthP85ERt43N6vtDdqWPf
	MuJWJFAbVtwqI7F022LjkwvY1WvcBpuP3hddDNublvIxd4R1Sppnm8oHkw6s+67WKOWubJ6iqHz
	2c+uZyBhQ==
X-Google-Smtp-Source: AGHT+IFMW3MomuZTuUZnTLUdaO2JZbtew0OvvUE/eL2d6TZLxyleTPLoh17MORzFjLla01s43P3XCg==
X-Received: by 2002:a05:6402:51d1:b0:640:ceef:7e4d with SMTP id 4fb4d7f45d1cf-64105a5e200mr6716581a12.32.1762434197405;
        Thu, 06 Nov 2025 05:03:17 -0800 (PST)
Message-ID: <88013b48-d548-4eeb-b45b-64a3a0287cd3@suse.com>
Date: Thu, 6 Nov 2025 14:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/8] xen/pci: initialize BARs
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <e50fd6adb255b0c5472a8ff640d714586f59c328.1758618839.git.mykyta_poturai@epam.com>
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
In-Reply-To: <e50fd6adb255b0c5472a8ff640d714586f59c328.1758618839.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 09:59, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> A PCI device must have valid BARs in order to assign it to a domain.  On
> ARM, firmware is unlikely to have initialized the BARs, so we must do
> this in Xen. During setup_hwdom_pci_devices(), check if each BAR is
> valid. If the BAR happens to already be valid, remove the BAR range from
> a rangeset of valid PCI ranges so as to avoid overlap when reserving a
> new BAR. If not valid, reserve a new BAR address from the rangeset and
> write it to the device.
> 
> Avaliable ranges are read from DT during init and stored in distinct
> rangesets.

The "distinct" lacks context here, imo. Maybe add "non-prefetchable and
prefetchable" earlier in the sentence?

> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -21,6 +21,7 @@
>  #include <xen/rwlock.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
> +#include <xen/resource.h>
>  
>  #include <asm/setup.h>
>  
> @@ -232,6 +233,21 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> +static int add_bar_range(const struct dt_device_node *dev, uint32_t flags,
> +                         uint64_t addr, uint64_t len, void *data)

Simply by its purpose, this function looks like it ought to be __init. And indeed,
while its only caller - pci_host_common_probe() - isn't, all callers of that
function are. Hence another prereq patch is wanted to add the missing __init there.

> @@ -286,6 +302,14 @@ pci_host_common_probe(struct dt_device_node *dev,
>      pci_add_host_bridge(bridge);
>      pci_add_segment(bridge->segment);
>  
> +    bridge->bar_ranges = rangeset_new(NULL, "BAR ranges",
> +                                      RANGESETF_prettyprint_hex);
> +    bridge->bar_ranges_prefetch = rangeset_new(NULL,
> +                                               "BAR ranges (prefetchable)",
> +                                               RANGESETF_prettyprint_hex);
> +    if ( bridge->bar_ranges && bridge->bar_ranges_prefetch )
> +        dt_for_each_range(bridge->dt_node, add_bar_range, bridge);
> +
>      return bridge;

This is odd: Why would you silently ignore the -ENOMEM condition here? You can't
blindly use the NULL pointer(s) ...

> @@ -476,6 +500,60 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>  
>      return bar_data.is_valid;
>  }
> +
> +uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
> +                              bool is_64bit, bool prefetch)

(__init as well here)

> +{
> +    struct pci_host_bridge *bridge;
> +    struct rangeset *range;
> +    uint64_t addr;
> +
> +    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> +    if ( !bridge )
> +        return 0;
> +
> +    range = prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;

... here, for example.

> +    if ( size < PAGE_SIZE )
> +        size = PAGE_SIZE;
> +
> +    if ( is_64bit && !rangeset_find_aligned_range(range, size, GB(4), &addr) )
> +    {
> +        if ( rangeset_remove_range(range, addr, addr + size - 1) )
> +        {
> +            printk("%s:%d:%s error\n", __FILE__, __LINE__, __func__);
> +        }
> +        return addr;

No need for the inner figure braces, but more importantly: printk()-style
error handling is, well, insufficient? I'm pretty sure I indicated before that
you can't assume the return value of rangeset_find_aligned_range() isn't stale
the moment you look at (or use) it, unless you make further (written down)
assumptions. For example, rangeset_find_aligned_range() becoming __init would
already be a partial indication that it's not fit for general use.

__FILE__ / __LINE__ based diagnostics also aren't all this useful (and get in
the way elsewhere, e.g. for livepatching).

> +    }
> +    if ( !rangeset_find_aligned_range(range, size, 0, &addr) )
> +    {
> +        if ( !is_64bit && addr >= GB(4) )
> +            return 0;

What guarantees that no lower range is available? It's not said anywhere that
the function would search addresses in increasing order.

> +int pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
> +                          uint64_t size, bool prefetch)

__init again (I won't further repeat this)

> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -357,6 +357,41 @@ int rangeset_claim_range(struct rangeset *r, unsigned long size,
>      return 0;
>  }
>  
> +int rangeset_find_aligned_range(struct rangeset *r, unsigned long size,
> +                                unsigned long min, unsigned long *s)

What is "min" when there ought to be some alignment specified instead?
(Reading the function body I understand that "size" also specifies the
alignment, but that's not clear at all when looking at e.g. just the
function declaration.)

How does the use of unsigned long here fit with the use of uint64_t in the
callers?

> +{
> +    struct range *x;
> +
> +    /* Power of 2 check */
> +    if ( (size & (size - 1)) != 0 )
> +    {
> +        *s = 0;
> +        return -EINVAL;
> +    }
> +
> +    read_lock(&r->lock);
> +
> +    for ( x = first_range(r); x; x = next_range(r, x) )
> +    {
> +        /* Assumes size is a power of 2 */
> +        unsigned long start_aligned = (x->s + size - 1) & ~(size - 1);

The comment says what somehow you should actually assure: It _needs_ to be
a power of 2 for this to work, yet size being 0 passes the check at the top
of the function.

Also please don't open-code ROUNDUP().

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1172,6 +1172,80 @@ int __init scan_pci_devices(void)
>      return ret;
>  }
>  
> +static void __init cf_check reserve_bar_range(struct pci_dev *pdev, uint8_t reg,
> +                                              uint64_t addr, uint64_t size,
> +                                              bool is_64bit, bool prefetch)
> +{
> +    if ( pci_check_bar(pdev, maddr_to_mfn(addr),
> +                       maddr_to_mfn(addr + size - 1)) )
> +        pci_reserve_bar_range(pdev, addr, size, prefetch);
> +}
> +
> +static void __init cf_check get_new_bar_addr(struct pci_dev *pdev, uint8_t reg,
> +                                             uint64_t addr, uint64_t size,
> +                                             bool is_64bit, bool prefetch)
> +{
> +    if ( !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                        maddr_to_mfn(addr + size - 1)) )
> +    {

With how pci_check_bar() works on x86 right now, ...

> +        uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +
> +        addr = pci_get_new_bar_addr(pdev, size, is_64bit, prefetch);
> +
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND,
> +                         cmd & ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO));
> +
> +        pci_conf_write32(pdev->sbdf, reg,
> +                         (addr & GENMASK(31, 0)) |
> +                         (is_64bit ? PCI_BASE_ADDRESS_MEM_TYPE_64 : 0));
> +
> +        if ( is_64bit )
> +            pci_conf_write32(pdev->sbdf, reg + 4, addr >> 32);
> +
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);

... all of this is unreachable code there. Misra doesn't like such.

Furthermore x86'es variant emits diagnostics, and aiui we'd now see them more
frequently (possibly: than wanted).

> +static int __init cf_check bars_iterate(struct pci_seg *pseg, void *arg)
> +{
> +    struct pci_dev *pdev;
> +    unsigned int i, ret, num_bars = PCI_HEADER_NORMAL_NR_BARS;
> +    uint64_t addr, size;
> +    void (*cb)(struct pci_dev *, uint8_t, uint64_t, uint64_t, bool, bool) = arg;

There is still no connection at all between this function pointer type variable
and the two functions tobe called? Why is "cb" not directly the function
parameter? (For Misra's sake it may also be necessary to name the six parameters;
I'm not entirely sure, though. There was some back and forth at the time.)

Also, why is the first parameter not pointer-to-const?

> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        if ( (pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f) ==
> +             PCI_HEADER_TYPE_NORMAL )
> +        {
> +            for ( i = 0; i < num_bars; i += ret )
> +            {
> +                uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +                bool prefetch;
> +
> +                if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE)
> +                     == PCI_BASE_ADDRESS_SPACE_IO )

Nit (style): Operator placement.

> +                {
> +                    ret = 1;
> +                    continue;
> +                }
> +
> +                ret = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                                      (i == num_bars - 1) ? PCI_BAR_LAST : 0);

Nit (style): Indentation.

> +                if ( !size )
> +                    continue;
> +                prefetch = !!(pci_conf_read32(pdev->sbdf, reg) &
> +                              PCI_BASE_ADDRESS_MEM_PREFETCH);

No need for !!.

> @@ -1263,6 +1337,11 @@ void __hwdom_init setup_hwdom_pci_devices(
>      struct setup_hwdom ctxt = { .d = d, .handler = handler };
>  
>      pcidevs_lock();
> +    if ( hwdom_uses_vpci() )
> +    {
> +        pci_segments_iterate(bars_iterate, reserve_bar_range);
> +        pci_segments_iterate(bars_iterate, get_new_bar_addr);
> +    }
>      pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
>      pcidevs_unlock();

Does this really need splitting into 3 steps? Can't _setup_hwdom_pci_devices()
take care of the uninitialized BARs?

Jan

