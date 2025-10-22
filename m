Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AEBFC8A0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148259.1480389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZrh-0002Un-At; Wed, 22 Oct 2025 14:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148259.1480389; Wed, 22 Oct 2025 14:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZrh-0002SM-7y; Wed, 22 Oct 2025 14:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1148259;
 Wed, 22 Oct 2025 14:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBZrf-0002SE-GB
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:30:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f715b4-af53-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 16:30:50 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so24405085e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:30:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b02475sm39690255e9.4.2025.10.22.07.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 07:30:49 -0700 (PDT)
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
X-Inumbo-ID: b4f715b4-af53-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761143449; x=1761748249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FO5Vw28kFJsFl8Z0Dnz1r+91IPQsD9UzA+H6h+5FFvQ=;
        b=U3sl4+JQYkEG5GyxhsNSu2A8hxTc6ZGWfZPfn9SgzEDfO8WIrKGMilZuG2mdvSDoP5
         63x9/Y8nU3jAtURAyiNHO+jHY5hoXYWCquTIOWdKWI6kF9Yv23ipQak1vyxsTnM5Xvnt
         6+3oouKMFOy85SxCDLSL/tzERqYfkGDXryE33q2gucarz3F+pabIGN5169sIl4spVknM
         XabancuVKTiYUw2XOv2LnLiqct2CRHumq4vpkXsBZRv8ucNY+e6ECuXseDAsdRvUauaP
         /+dxVOcTW3ymcuuh/q3DlxEajLOHQYyNL2k3tsVjOYoYRHUa07ad494dhPgenlp8ScXd
         1Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143449; x=1761748249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO5Vw28kFJsFl8Z0Dnz1r+91IPQsD9UzA+H6h+5FFvQ=;
        b=wjoN4PLMwjTMy2Ck8x5phWDFQyeTOvtk26Fy34O4n8ym5aDznJit3TnDhgxOoGEtfs
         VLPKFqzuXsevffKoKD71Nc/r5cOj20kqJ38Ns0+jBjcmiVExuXI13EwxQgT5StQuEE01
         3uTWCWS/+zuxK2xYmV5T0mnn/J5CFuXMuwLV2QeaF8Czn4FdassAAGzww7NYVl5/2jAM
         b8rLqQ1R8a1oZi3RGCm+4JdEof4BqrfqcyxJc78VhvA8HqWDMu4Bi6b81PMzk2I2szlI
         7IBiaXe4hFoDtow2eV+Yd37MfCWtIlNujGsuuZ5FPGtl5YVHWCSw6jolJFtjqoHpijvR
         CQug==
X-Forwarded-Encrypted: i=1; AJvYcCU8ETWgE8cI/U2UMHLivLBq0lUqjLafMP9XGUcm6uzcw+PP3ElT9mmep4uGmmhYYzaH3pKxPCqAKes=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN49IDKrfJH72F2YEklNJMfgK5w/Cb+Qb0by/w0GqCfA7ANBjC
	3vcfBduqWuBMNFtdB55koi+9VmcAWNljFIapFaUbZfXY3b8tTJDp23INpxSDGzQKHw==
X-Gm-Gg: ASbGncsgTgJ4rbuNNu/uj3RkqkFxzV3vfm8yT2o6/K/v2vHd+pWORpM3m0Tf+MRPe6V
	tivn69F5F++BP2+BoIK+Rmm+nsLSks3HstihRUJihLOZViHhjTN5wGJgPMQ2e6DwGBzTFHz4+AN
	6DmzqSf7wpqXBzJrwMsTW80n0T5dsG0A3GSEDJd3d2Rgva2mfqnxlQSxTp+c/m/+Ph1L8YEwNtw
	c78kKr52Q0Wkc3q1KeLhlj4i+dFHtONeDiKsL5lOajWXgLuP7p8xyo0rg/x2I0XfBcBdkAYO7Bi
	Djp4GZ0KJkISAkaQJ9cfYZbe6g5MI5dfjyx6nbk6HDEOUhg8F2mlMp7kWKiDg8N9NCLbqlwLfci
	6oB8/ZBcJN1VPwK2Su/GrxpTECTUa1Eamz4+S0GxTY7gx1BHVr+Zi/bKwOC9XXLvE0tw9KR/Y/y
	Wt4xD1oPWjrdE+/2P8aB0EVBxoP1tWOkAdmLFHoj3CqnaKTzCY0D6c1Sfhz0Ee
X-Google-Smtp-Source: AGHT+IFIgQKMj5AbJAC82TOrW8kT5snn560+n2wggUqxWeZZMEpThpFRnppnD6eqGTL96fJ/iS3jBA==
X-Received: by 2002:a05:600c:3550:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-471179141cfmr169645745e9.33.1761143449480;
        Wed, 22 Oct 2025 07:30:49 -0700 (PDT)
Message-ID: <a97160d0-bf01-4fa8-8dd8-f94b916e6253@suse.com>
Date: Wed, 22 Oct 2025 16:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/pci: initialize BARs
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
References: <cover.1761134829.git.mykyta_poturai@epam.com>
 <0abec6521491db737f2fa061ddc748eb70f259b3.1761134829.git.mykyta_poturai@epam.com>
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
In-Reply-To: <0abec6521491db737f2fa061ddc748eb70f259b3.1761134829.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 15:56, Mykyta Poturai wrote:
> @@ -232,6 +233,21 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> +static int add_bar_range(const struct dt_device_node *dev, uint32_t flags,
> +                         uint64_t addr, uint64_t len, void *data)
> +{
> +    struct pci_host_bridge *bridge = data;
> +
> +    if ( !(flags & IORESOURCE_MEM) )
> +        return 0;
> +
> +    if ( flags & IORESOURCE_PREFETCH )
> +        return rangeset_add_range(bridge->bar_ranges_prefetch, addr,
> +                                  addr + len - 1);
> +    else
> +        return rangeset_add_range(bridge->bar_ranges, addr, addr + len - 1);

Here and everywhere else you use rangesets: This loses significant bits on
Arm32. Iirc the plan was to select HAS_PCI only for Arm64, but that's entirely
invisible here. I think there want to be perhaps multiple BUILD_BUG_ON()s, at
the very least.

> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -76,4 +76,24 @@ int pci_sanitize_bar_memory(struct rangeset *r);
>  
>  void pci_setup(void);
>  
> +/* Unlike ARM, HW domain alyways uses vpci for x86 */
> +static inline bool hwdom_uses_vpci(void)
> +{
> +    return true;
> +}

What the comment says is not true. It is true for PVH Dom0. The sole use
of the predicate therefore is questionable, too.

> +static inline uint64_t pci_get_new_bar_addr(const struct pci_dev *pdev,
> +                                            uint64_t size, bool is_64bit,
> +                                            bool prefetch)
> +{
> +    return 0;
> +}
> +
> +static inline int pci_reserve_bar_range(const struct pci_dev *pdev,
> +                                        uint64_t addr, uint64_t size,
> +                                        bool prefetch)
> +{
> +    return 0;
> +}

Neither here nor elsewhere is any word said on what these do, what a
"new BAR range" is, or what "reserving" would mean.

> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -357,6 +357,41 @@ int rangeset_claim_range(struct rangeset *r, unsigned long size,
>      return 0;
>  }
>  
> +int rangeset_find_aligned_range(struct rangeset *r, unsigned long size,
> +                                unsigned long min, unsigned long *s)
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
> +
> +        if ( x->e > start_aligned &&
> +             (x->e - start_aligned) >= size &&
> +             start_aligned >= min )
> +        {
> +            read_unlock(&r->lock);

With this and ...

> +            *s = start_aligned;
> +            return 0;
> +        }
> +    }
> +
> +    read_unlock(&r->lock);

... this, how can the caller be sure the result they receive is not stale by
the time they get to look at and use it?

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
> +    }
> +}
> +
> +static int __init cf_check bars_iterate(struct pci_seg *pseg, void *arg)
> +{
> +    struct pci_dev *pdev;
> +    unsigned int i, ret, num_bars = PCI_HEADER_NORMAL_NR_BARS;
> +    uint64_t addr, size;
> +    void (*cb)(struct pci_dev *, uint8_t, uint64_t, uint64_t, bool, bool) = arg;

There needs to be some build-time checking that this and the two callbacks
above actually match in type. Likely by way of using a function typedef.

> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -56,11 +56,15 @@ void rangeset_limit(
>  bool __must_check rangeset_is_empty(
>      const struct rangeset *r);
>  
> -/* Add/claim/remove/query/purge a numeric range. */
> +/* Add/claim/find/remove/query/purge a numeric range. */
>  int __must_check rangeset_add_range(
>      struct rangeset *r, unsigned long s, unsigned long e);
>  int __must_check rangeset_claim_range(struct rangeset *r, unsigned long size,
>                                        unsigned long *s);
> +int __must_check rangeset_find_aligned_range(struct rangeset *r,
> +                                             unsigned long size,
> +                                             unsigned long min,
> +                                             unsigned long *s);

From these parameter names I'm unable to tell what the "aligned" part of
the name is referring to. IOW it may be necessary to have an accompanying
comment.

Jan

