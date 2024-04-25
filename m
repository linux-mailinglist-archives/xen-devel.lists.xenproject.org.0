Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8D8B200F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 13:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712019.1112395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzx4l-0007xf-E8; Thu, 25 Apr 2024 11:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712019.1112395; Thu, 25 Apr 2024 11:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzx4l-0007vg-Ao; Thu, 25 Apr 2024 11:15:39 +0000
Received: by outflank-mailman (input) for mailman id 712019;
 Thu, 25 Apr 2024 11:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzx4k-0007vS-FZ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 11:15:38 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ab2f82-02f5-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 13:15:36 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56c5d05128dso788562a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 04:15:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm9378837ejb.29.2024.04.25.04.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 04:15:35 -0700 (PDT)
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
X-Inumbo-ID: 23ab2f82-02f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714043735; x=1714648535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NYa+swirOWz7pRfJTN723OgMczUciUD2iu62lx8/P8=;
        b=ANEA8KximnX/Ks3qbHDbKw8X6MveJKm6g71mJ2z5twcV2SgHDiFdhCN1o5p6je9OqE
         mhmzngZtrzL6L1gfkvdfd0r38TrUAEcE54KxkItHNVmjAEdf5ijvcXs1j6urlcHQv8CY
         1G4YAukyxDk21FbuY7hjlZ2g1072nKpJXFcf1aKu5Pgq+x1okoGkCp3FQ+o+DJMAN//s
         QCGBpt32t+C/GwGncdmn09mnnvxDeLUpXzp2zm3dbeafgPALbVXcE+UrfDvXyviWnxcB
         HARwE7cOGGZZUdkrhemiMfurqIkUh2Ub8YOa06BD8ZXSPeWvpDTmCbJnjAXmbgLCdtQL
         r1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714043735; x=1714648535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NYa+swirOWz7pRfJTN723OgMczUciUD2iu62lx8/P8=;
        b=eoyj3VijCrzbX3I6CInX2aNRaUTy2aWYL9XCYfxhLpGtcxf5oRB56EjOsDipSdzbWx
         QpGs/LAfRpDb5Vugg3fatR0kWQCwDu+bBtTpJBCCqIqVBl4sZqLRmvY6NTyaauduROqz
         VNm4WZp4IyPW/UmifKw+Im3HCeWlFftu+DM6zQHrGwBUDjr1PxLynAuv79+TQBziRV1t
         goC2OHpqF8/HtPYK9SuER1oaHjJ2AAkEW5yHPmNd10Om/hqWfo/AsiBBayWj02ODzLI7
         QyRD2cKmpVA/xU+cXp89ytXb2ky76ry77IR5zXSzsoXvtc3LIvfJdJ5CpjPuYQ3kziqV
         TAFA==
X-Forwarded-Encrypted: i=1; AJvYcCW7tBg7SGJAv/bRyHzdsJi0HZZzSrO9GZAPiYu0XqSce7E6er5o/X33NWt6DENfr/q2jli6WIXfWqwYWXsJ0L2tdDGrqnBag+8RPyVH5t8=
X-Gm-Message-State: AOJu0YxNMyS5qZ1UbqFPsv0y0NPeC0wVfzx5NoTRUYoQfL8YETwX7dBl
	otV3ekXIDuCX0GoEiuDU8mJXXB8nNIhmyyo3UqEkAzRp3zHgj2JBWFmdgI4rYA==
X-Google-Smtp-Source: AGHT+IHh6v2pAs3GeSJJDSnWEiOzACfRDYQpcdi2lgXyV5/wszHLnov2OD4ggcZCbVBLHcDUMOC3VA==
X-Received: by 2002:a17:907:8686:b0:a58:bdfa:c2b1 with SMTP id qa6-20020a170907868600b00a58bdfac2b1mr788136ejc.9.1714043735604;
        Thu, 25 Apr 2024 04:15:35 -0700 (PDT)
Message-ID: <68f99f0a-e27a-449f-8d13-fb5ca9f6069a@suse.com>
Date: Thu, 25 Apr 2024 13:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <a040f703a884ff4516314f88b22ee0f9f17329a9.1710342968.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <a040f703a884ff4516314f88b22ee0f9f17329a9.1710342968.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2024 16:16, Marek Marczykowski-Górecki wrote:
> Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> on the same page as MSI-X table. Device model (especially one in
> stubdomain) cannot really handle those, as direct writes to that page is
> refused (page is on the mmio_ro_ranges list). Instead, extend
> msixtbl_mmio_ops to handle such accesses too.
> 
> Doing this, requires correlating read/write location with guest
> of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> for PV would need to be done separately.
> 
> This will be also used to read Pending Bit Array, if it lives on the same
> page, making QEMU not needing /dev/mem access at all (especially helpful
> with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> map it to the guest directly.
> If PBA lives on the same page, discard writes and log a message.
> Technically, writes outside of PBA could be allowed, but at this moment
> the precise location of PBA isn't saved, and also no known device abuses
> the spec in this way (at least yet).
> 
> To access those registers, msixtbl_mmio_ops need the relevant page
> mapped. MSI handling already has infrastructure for that, using fixmap,
> so try to map first/last page of the MSI-X table (if necessary) and save
> their fixmap indexes. Note that msix_get_fixmap() does reference
> counting and reuses existing mapping, so just call it directly, even if
> the page was mapped before. Also, it uses a specific range of fixmap
> indexes which doesn't include 0, so use 0 as default ("not mapped")
> value - which simplifies code a bit.
> 
> GCC 12.2.1 gets confused about 'desc' variable:
> 
>     arch/x86/hvm/vmsi.c: In function ‘msixtbl_range’:
>     arch/x86/hvm/vmsi.c:553:8: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
>       553 |     if ( desc )
>           |        ^
>     arch/x86/hvm/vmsi.c:537:28: note: ‘desc’ was declared here
>       537 |     const struct msi_desc *desc;
>           |                            ^~~~
> 
> It's conditional initialization is actually correct (in the case where
> it isn't initialized, function returns early), but to avoid
> build failure initialize it explicitly to NULL anyway.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Sadly there are further more or less cosmetic issues. Plus, as indicated
before, I'm not really happy for us to gain all of this extra code. In
the end I may eventually give an R-b not including the usually implied
A-b, to indicate the code (then) looks okay to me but I still want
someone else to actually ack it to allow it going in.

> +static int adjacent_read(
> +    unsigned int fixmap_idx,
> +    paddr_t address, unsigned int len, uint64_t *pval)
> +{
> +    const void __iomem *hwaddr;
> +
> +    *pval = ~0UL;
> +
> +    ASSERT(fixmap_idx != ADJACENT_DISCARD_WRITE);

Why only one of the special values? And before you add the other here:
Why not simply ASSERT(fixmap_idx <= FIX_MSIX_IO_RESERV_END)? (Could of
course bound at the other end, too, i.e. against FIX_MSIX_IO_RESERV_BASE.)

> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *pval = readb(hwaddr);
> +        break;
> +
> +    case 2:
> +        *pval = readw(hwaddr);
> +        break;
> +
> +    case 4:
> +        *pval = readl(hwaddr);
> +        break;
> +
> +    case 8:
> +        *pval = readq(hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();

Misra demands "break;" to be here for release builds. In fact I wonder
why "*pval = ~0UL;" isn't put here, too. Question of course is whether
in such a case a true error indicator wouldn't be yet better.

> +    }
> +    return X86EMUL_OKAY;
> +}

Like in adjacent_handle(): Blank line please ahead of the function's main
"return".

> +static int adjacent_write(
> +    unsigned int fixmap_idx,
> +    paddr_t address, unsigned int len, uint64_t val)
> +{
> +    void __iomem *hwaddr;
> +
> +    if ( fixmap_idx == ADJACENT_DISCARD_WRITE )
> +        return X86EMUL_OKAY;

Similar assert as suggested above below here then, too?

> @@ -622,12 +808,15 @@ void msix_write_completion(struct vcpu *v)
>           v->arch.hvm.hvm_io.msix_snoop_gpa )
>      {
>          unsigned int token = hvmemul_cache_disable(v);
> -        const struct msi_desc *desc;
> +        const struct msi_desc *desc = NULL;
> +        const struct msixtbl_entry *entry;
>          uint32_t data;
>  
>          rcu_read_lock(&msixtbl_rcu_lock);
> -        desc = msixtbl_addr_to_desc(msixtbl_find_entry(v, snoop_addr),
> -                                    snoop_addr);
> +        entry = msixtbl_find_entry(v, snoop_addr);
> +        if ( entry && snoop_addr >= entry->gtable &&
> +                      snoop_addr < entry->gtable + entry->table_len )

Nit: Unexpected / unusual indentation. If you really want the two snoop_addr
to line up, then

        if ( entry &&
             snoop_addr >= entry->gtable &&
             snoop_addr < entry->gtable + entry->table_len )

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -208,6 +208,10 @@ struct msg_address {
>                                         PCI_MSIX_ENTRY_SIZE + \
>                                         (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
>  
> +/* Indexes in adj_access_idx[] below */
> +#define ADJ_IDX_FIRST 0
> +#define ADJ_IDX_LAST  1

These may better live ...

> @@ -215,6 +219,7 @@ struct arch_msix {
>      } table, pba;
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
>      int table_idx[MAX_MSIX_TABLE_PAGES];
> +    unsigned int adj_access_idx[2];

... right next to this.

Jan

