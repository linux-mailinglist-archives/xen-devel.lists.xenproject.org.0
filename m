Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E06C6A0ED
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 15:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164866.1491727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMu0-0005kc-OU; Tue, 18 Nov 2025 14:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164866.1491727; Tue, 18 Nov 2025 14:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMu0-0005iI-Lg; Tue, 18 Nov 2025 14:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1164866;
 Tue, 18 Nov 2025 14:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLMtz-0005iC-62
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 14:41:51 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b292e78d-c48c-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 15:41:42 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b739b3fc2a0so333439766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 06:41:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac667sm1342383466b.58.2025.11.18.06.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:41:40 -0800 (PST)
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
X-Inumbo-ID: b292e78d-c48c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763476901; x=1764081701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMuMGpaip/XciVhLNa2zvYIsWdsArOHX32hcuN7k2Nc=;
        b=ckVBpeEGBMmirtXWMNqbNGiVU77yR6CzGXSbd20cyhys6vdeNimTKVqKp+yEjq5jAk
         cSXTBAXSYRvHPCg71WHnb6SS0q1DFugJ8TQZ158Rike5KUnSSZBkYd17oV6JsErRSlNN
         Xy5zOHFSdUExbRe/TfcAOueAyk4hftZpKtSfLQ6wJfHJQCI0rN/0XaRA7N9gwF6HhhHb
         PhamJPSjfIDfDE2RUBBtNSX5ndrfzCWenyu+RxyBfRl5nXxybfeL+gXiFsRaftPtd0hH
         RvCijTRqQ12nsV1cLv97OBA5OBmFXyc4W6M1FYxWQORXz/nuIV7avRGMlaF8oqQgDBS8
         1WPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476901; x=1764081701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMuMGpaip/XciVhLNa2zvYIsWdsArOHX32hcuN7k2Nc=;
        b=K3se2vjW9QM0Loa4yfn/CAkZct6FCZcwlApbJP0nTlqCalsR0WFJid9DKuTjwZX7/y
         9NoANmUWXjH700sJox4SRPMhHcxjWMk+Vhohjhguy6/HG0kfiopyDnWwV7byWXmp1wl8
         mmV9NpXxrnp9UPZAAgMS+m61rVGfoq+EF8Iug6Fm9aXYhJr3BRZZooyq8e8HBMgWOjVS
         GyNymPIFnhYku20atFReQ2I8MZERgFxuELdwdT0uYwhIQtWotBItf6cQqKE5ojHaBS0Y
         EMR5OzaXDS8HU8Md4mqquI8CDnHcyn3xFKd7Z+DFczRdEQuNQTAl6cG0HaPUcKT6qGad
         hMPg==
X-Forwarded-Encrypted: i=1; AJvYcCUZD9L3iJRYlcGH+bvv/IOiToprSnjKHcX3J40sA6YoeZzE0nm9bCVTv+amtT9kSQZg5cvJtLuwyQE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKkVt5pJfYdZsfLWc4J9/VI5qSy8HYTanmRdVFCOXm2xMGpf0k
	OJviMIp4Pbnzo1qzb95SaCNrx8bQk06SLT5hn02Uoq4sA/1DrmifLKevGTZlPc6d2g==
X-Gm-Gg: ASbGncvrgoP8OWnoElV+JsiNBdzN5v+yFPIAfgE9EWt/TWlI7tDZnuqHg2DZjcxM3gi
	kP7TgOoJiOk6AipiIThkP/2SltY4u7AG2pdQUt2THynLcakl860KhNYgJCziO/kYyDFlVmam8k9
	MKfXrarzaZLjMZ43YhZFdp0S1lwzO3W60hBqDjssR1mFr3urdQY4vYHsPjb4H+URWUpLALOZAWB
	CHyoS6rFEsmjFd47P2CF8qHD7DnYxeQtoPPtNaFLl1Zfm94Z38tEgPfXjUu21J6bWz776O3PTh+
	XlU0Xz6nlyzR7zOhLN1Z4VPQncXSpQB3GEiyg7bZkY0w1rptYrDgRwgRHIM/Fn46+NbKoGbpkuS
	nzTOzZ2XmebcslCRRAtI8XTwyQMdfa/eVQ8dBwdD9H8aF0pbasKpehMmkTuJgPl9loCEubCiaTC
	dQKg6MfEeQ5ij8wkUpBoTFtZAI+EmS37e6EeL9mSmBTSApiSYL+pT8HjVIUdaC9Ur9UCvL1K0XJ
	PkTm47xlKpZ2dKN1LdReCDG
X-Google-Smtp-Source: AGHT+IFgdrF1UatBnorbAT+aldRoPhoO6ZewLG79FVuHIDNvePiXvzBcFGT+dh+VdJzJtLg1iw8Ukg==
X-Received: by 2002:a17:907:9804:b0:b73:7418:dfeb with SMTP id a640c23a62f3a-b737418f0d1mr1426862166b.6.1763476901273;
        Tue, 18 Nov 2025 06:41:41 -0800 (PST)
Message-ID: <063fbe0f-8ebc-4a13-a65c-c3225c469b16@suse.com>
Date: Tue, 18 Nov 2025 15:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] xen/pci: initialize BARs
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
References: <cover.1763462211.git.mykyta_poturai@epam.com>
 <20b26b4a3f180139971105ee1b23cc4b0a82092b.1763462211.git.mykyta_poturai@epam.com>
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
In-Reply-To: <20b26b4a3f180139971105ee1b23cc4b0a82092b.1763462211.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2025 14:36, Mykyta Poturai wrote:
> @@ -232,6 +233,25 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> +static int __init add_bar_range(const struct dt_device_node *dev,
> +                                uint32_t flags, uint64_t addr, uint64_t len,
> +                                void *data)
> +{
> +    struct pci_host_bridge *bridge = data;
> +
> +    /* Ensure we are not using bits in a rangeset */
> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(uint64_t));

Can you please help me interpret the comment?

Also, rather than != isn't < sufficient to check for?

> @@ -283,6 +303,18 @@ pci_host_common_probe(struct dt_device_node *dev,
>          bridge->child_ops = &child_ops->pci_ops;
>      }
>  
> +    bridge->bar_ranges = rangeset_new(NULL, "BAR ranges",
> +                                      RANGESETF_prettyprint_hex);
> +    bridge->bar_ranges_prefetch = rangeset_new(NULL,
> +                                               "BAR ranges (prefetchable)",
> +                                               RANGESETF_prettyprint_hex);
> +    if ( bridge->bar_ranges && bridge->bar_ranges_prefetch )
> +    {
> +        err = dt_for_each_range(bridge->dt_node, add_bar_range, bridge);
> +        if ( err )
> +            goto err_child;
> +    }

I'm pretty sure I commented on this already: Without an "else" use sites
of the two rangesets need to have NULL checks added, plus imo there would
want to be a comment here explaining to readers why omitting the "else"
(and hence proper error handling) is okay.

> @@ -476,6 +508,66 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>  
>      return bar_data.is_valid;
>  }
> +
> +/*
> + * Find suitable place for an uninitialized bar of specified size in the
> + * host bridge ranges
> + */
> +uint64_t __init pci_get_new_bar_addr(const struct pci_dev *pdev, uint64_t size,
> +                                     bool is_64bit, bool prefetch)

Seeing the comment - why only "host bridge"? Especially for Dom0, if other
bridges are present in the system, I think you won't get away without having
a virtual counterpart for evey one of them (or alternatively without hiding
all of them plus the devices behind them).

> +{
> +    struct pci_host_bridge *bridge;
> +    struct rangeset *range;
> +    uint64_t addr = 0, end = GB(4);
> +
> +    /* Make sure we can store addr in a rangeset */
> +    BUILD_BUG_ON(sizeof(addr) != sizeof(unsigned long));

While "store" looks right here, ...

> +    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> +    if ( !bridge )
> +        return 0;
> +
> +    range = prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
> +
> +    if ( size < PAGE_SIZE )
> +        size = PAGE_SIZE;
> +
> +    if ( is_64bit )
> +    {
> +        addr = GB(4);
> +        end = ~0;
> +    }
> +
> +    if ( !rangeset_claim_aligned_range(range, size, &addr, end) )
> +        return addr;
> +
> +    printk(XENLOG_ERR "Failed to claim BAR range %lx-%lx from rangeset\n",
> +           addr, addr + size - 1);
> +
> +    return 0;
> +}
> +
> +/*
> + * Remove already used memory from the host bridge bar ranges
> + */
> +int __init pci_reserve_bar_range(const struct pci_dev *pdev, uint64_t addr,
> +                                 uint64_t size, bool prefetch)
> +{
> +    struct pci_host_bridge *bridge;
> +    struct rangeset *range;
> +
> +    /* Make sure we can store addr in a rangeset */
> +    BUILD_BUG_ON(sizeof(addr) != sizeof(unsigned long));

... it doen't here, as ...

> +    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> +    if ( !bridge )
> +        return 0;
> +
> +    range = prefetch ? bridge->bar_ranges_prefetch : bridge->bar_ranges;
> +
> +    return rangeset_remove_range(range, addr, addr + size - 1);

... there's nothing being stored.

But I'm apparently confused in a broader way: Here you remove a range from the
selected rangeset. rangeset_claim_aligned_range() also does so. Why are there
two removals? 

> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -95,6 +95,108 @@ boolean_param("pci-passthrough", pci_passthrough_enabled);
>  __ro_after_init bool pci_scan_enabled;
>  boolean_param("pci-scan", pci_scan_enabled);
>  
> +typedef int (*bar_callback_t)(struct pci_dev *, uint8_t, uint64_t, uint64_t,
> +                              bool, bool);

Hmm, okay, you have a typedef now. But ...

> +static int __init reserve_bar_range(struct pci_dev *pdev, uint8_t reg,
> +                                    uint64_t addr, uint64_t size, bool is_64bit,
> +                                    bool prefetch)

... if I altered e.g. this function's signature, ...

> +{
> +    if ( pci_check_bar(pdev, maddr_to_mfn(addr),
> +                       maddr_to_mfn(addr + size - 1)) )
> +        return pci_reserve_bar_range(pdev, addr, size, prefetch);
> +    return 0;
> +}
> +
> +static int __init setup_bar(struct pci_dev *pdev, uint8_t reg, uint64_t addr,
> +                            uint64_t size, bool is_64bit, bool prefetch)
> +{
> +    if ( !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                        maddr_to_mfn(addr + size - 1)) )
> +    {
> +        uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +
> +        addr = pci_get_new_bar_addr(pdev, size, is_64bit, prefetch);
> +        if ( !addr )
> +            return -ENOMEM;
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
> +    }
> +
> +    return 0;
> +}
> +
> +static int __init bars_iterate(struct pci_dev *pdev, void *arg)

... the use of void * here still renders things type-unsafe. Plus you
needlessly introduce function pointer <=> data pointer conversions,
which Misra wants us to avoid. IOW ...

> +{
> +    unsigned int i, barsize, ret = 0, num_bars = PCI_HEADER_NORMAL_NR_BARS;
> +    uint64_t addr, size;
> +    bar_callback_t cb = arg;

... this (bar_callback_t cb) is what the function parameter wants to be.
Ideally though as "bar_callback_t *cb" to not hide the pointer-ness, then
requiring the pointer part to be dropped from the typedef itself.

> +    if ( (pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f) ==
> +         PCI_HEADER_TYPE_NORMAL )
> +    {
> +        for ( i = 0; i < num_bars; i += barsize )
> +        {
> +            uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +            bool prefetch;
> +
> +            if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) ==
> +                 PCI_BASE_ADDRESS_SPACE_IO )
> +            {
> +                barsize = 1;
> +                continue;
> +            }
> +
> +            barsize = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> +                                       (i == num_bars - 1) ? PCI_BAR_LAST : 0);
> +
> +            if ( !size )
> +                continue;
> +
> +            prefetch = pci_conf_read32(pdev->sbdf, reg) &
> +                       PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +            ret = cb(pdev, reg, addr, size, barsize == 2, prefetch);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static int __init pci_setup_bars(void)
> +{
> +    int ret;
> +    /* We can't change the signature of bars_iterate to only accept
> +     * bar_callback_t, so use intermediate variables to ensure callback
> +     * signatures are always correct
> +     */
> +    bar_callback_t cb_reserve = reserve_bar_range;
> +    bar_callback_t cb_setup = setup_bar;

Oh, here you actually fake partial type-safety. This should be dropped.

> @@ -244,8 +241,18 @@ int rangeset_remove_range(
>              destroy_range(r, x);
>      }
>  
> - out:
> +out:

Why are you violating style here? See ./CODING_STYLE, also for other labels
you introduce.

> +    return rc;
> +}
> +
> +int rangeset_remove_range(struct rangeset *r, unsigned long s, unsigned long e)
> +{
> +    int rc = 0;

Pointless initializer.

> +    write_lock(&r->lock);
> +    rc = remove_range(r, s, e);
>      write_unlock(&r->lock);
> +
>      return rc;
>  }
>  
> @@ -357,6 +364,51 @@ int rangeset_claim_range(struct rangeset *r, unsigned long size,
>      return 0;
>  }
>  
> +int rangeset_claim_aligned_range(struct rangeset *r, unsigned long size,
> +                                 unsigned long *s, unsigned long e)
> +{
> +    struct range *x;
> +    int rc = 0;

Again, plus this variable looks to be used only ...

> +    /* Power of 2 check */
> +    if ( (size & (size - 1)) != 0 && size != 0 )
> +    {
> +        *s = 0;
> +        return -EINVAL;
> +    }
> +
> +    if ( e < *s )
> +        return -EINVAL;
> +
> +    write_lock(&r->lock);
> +
> +    for ( x = first_range(r); x; x = next_range(r, x) )
> +    {
> +        /* Assumes size is a power of 2 */
> +        unsigned long start_aligned = ROUNDUP(x->s, size);

I don't think the comment is very useful - you do the necessary check above,
and what is said is an inherent property of ROUNDUP().

> +        if ( x->e > start_aligned &&
> +             (x->e - start_aligned) >= size &&

Remember that x->e is an inclusive upper bound.

> +             start_aligned >= *s &&
> +             start_aligned + size <= e)
> +        {
> +            rc = remove_range(r, start_aligned, start_aligned + size - 1);

... in the narrow scope (so should move here).

> +            if ( !rc )
> +                *s = start_aligned;
> +            else
> +                *s = 0;

Is it reasonably possible to take this path? If not, please add
ASSERT_UNREACHABLE().

> +            write_unlock(&r->lock);

This can move up some, can't it? We want to keep locked regions as narrow as
possible.

> +            return rc;
> +        }
> +    }
> +
> +    *s = 0;
> +
> +    write_unlock(&r->lock);
> +    return -ENOSPC;

Blank line please ahead of the main / final "return" of a function.

> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -61,6 +61,17 @@ int __must_check rangeset_add_range(
>      struct rangeset *r, unsigned long s, unsigned long e);
>  int __must_check rangeset_claim_range(struct rangeset *r, unsigned long size,
>                                        unsigned long *s);
> +
> +/*
> + * Find a range subset that starts at or after s, ends before e,
> + * and is aligned to the size.

Is "before" correct? Isn't it "at or before", just like for s it's "at or after"?

As to "aligned", nothing contrary being said here I think I ought to be able to
pass e.g. 7. (Tying together size and alignment is suitable for the BAR handling
purpose you have, but is making this new interface pretty much not general-
purpose.)

Jan

