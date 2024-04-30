Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58E8B7AE7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714986.1116408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1p18-0007xU-Ls; Tue, 30 Apr 2024 15:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714986.1116408; Tue, 30 Apr 2024 15:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1p18-0007vy-J7; Tue, 30 Apr 2024 15:03:38 +0000
Received: by outflank-mailman (input) for mailman id 714986;
 Tue, 30 Apr 2024 15:03:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1p17-0007vs-CY
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:03:37 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ad9ab5-0702-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:03:36 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34db6a299b2so76127f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 08:03:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 df7-20020a5d5b87000000b0034bc5934bf8sm16511296wrb.31.2024.04.30.08.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 08:03:35 -0700 (PDT)
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
X-Inumbo-ID: d1ad9ab5-0702-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714489415; x=1715094215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajhYvzYnGmwiL8O5tkWysDPW+BIJuZkEi6+oN5fluT8=;
        b=CIllk+/KJtrlz4p8Lmeb05K4oQTJ+vXr4bgXCUQicm37ydMcrZYXjDXIJ9/5k54AkT
         akcd0ef/4qCdv9jGBnKVdWM4zv2B0RsHu6pPJQrvUTTVf4lVAi5VGSFY5v511/O864zT
         Ze085DuqPDvfQ2VASfUcllAgA1zuwFO7xENbiWZikvX643yCA+FKW1hTktLH82KIBlMP
         tQKCjTU94wu75bR2jBoggx0C+/MVV3I3fcS16vULsWDTnldPTSCstV70tOeHPPTLBSO/
         o0NNlm6lelY2nQxWDxQ2tNOVsR1Vorqd6v+S7pQJDUHJ/2eZXEuNeBLDH8vClNb0NgeB
         JPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489415; x=1715094215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajhYvzYnGmwiL8O5tkWysDPW+BIJuZkEi6+oN5fluT8=;
        b=VBbVyZAmPXx1JLrm5y9ICutzdR+RK7JCzR30IOv36t0I7TimB44Gm7egpDoXQDOcLB
         izqE+3r9NfztoXwawcNMrA4TU0YHrGhQdA7+MXegLfD1SpTIPmj7HjVhiK41/IDIiozg
         qi7OlUbYoF7mYK/2WnMhVcArqODiQPLljRa8F+9Y8UfGl+8zHJZIJDvE9V9IVwBcpZzY
         vR4zCLbFDvNkHsxgOEfqRHuJO0HgSw/I361Lpy3mfbTsETcflcLAvDe770AW0u1r12pu
         uDh0wa5a9IttEJBUvPr0mDFUfjGyQHiubtE+OA5TRf/li46N79ZFvwncYW6eX06Z/1zg
         6Osg==
X-Forwarded-Encrypted: i=1; AJvYcCXXRbcy5fR00UOGPhZevil8dHMqsRugoSrwQTt0KtDyyKJobB3k9/vKuJq8tokmLitsJPsKKqx7vthsIz4VDSyA5jzeqzzFvVJ1dohGnj4=
X-Gm-Message-State: AOJu0YxDrwgCiU9zrT8+6aBDWYZcjKiE+OJ4CIaU69qz86t42s645Tjd
	BbdDN/AbyFQTq+gqDFq67DwYqidO1CKS7rF87MewurHjEYWT4H/opXFWqLPh+g==
X-Google-Smtp-Source: AGHT+IEb2TkrW4q+Vbx+qWLXHdOyw/UZ6fmLjivoIjs1fU2KD+UdghtAIDHpMl2OMaY9klwyA6Gb6g==
X-Received: by 2002:a5d:6dc7:0:b0:343:efb7:8748 with SMTP id d7-20020a5d6dc7000000b00343efb78748mr2070385wrz.66.1714489415545;
        Tue, 30 Apr 2024 08:03:35 -0700 (PDT)
Message-ID: <79914c80-677f-4f5e-afab-370a5cc82437@suse.com>
Date: Tue, 30 Apr 2024 17:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
 <a9b04e2224e97a27a127a003e8ccf5edfd4922c7.1714154036.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <a9b04e2224e97a27a127a003e8ccf5edfd4922c7.1714154036.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 19:54, Marek Marczykowski-Górecki wrote:
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

_Without_ the usually implied ack (as indicated before) and with two
small tweaks (which can likely be taken care of while committing):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> +static int adjacent_read(
> +    unsigned int fixmap_idx,
> +    paddr_t address, unsigned int len, uint64_t *pval)
> +{
> +    const void __iomem *hwaddr;
> +
> +    ASSERT(fixmap_idx <= FIX_MSIX_IO_RESERV_END);
> +
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
> +        *pval = ~0UL;

Nit: Better ~0ULL here (short of there being UINT64_C()).

> +        break;
> +    }
> +
> +    return X86EMUL_OKAY;
> +}
> +
> +static int adjacent_write(
> +    unsigned int fixmap_idx,
> +    paddr_t address, unsigned int len, uint64_t val)
> +{
> +    void __iomem *hwaddr;
> +
> +    if ( fixmap_idx == ADJACENT_DISCARD_WRITE )
> +        return X86EMUL_OKAY;
> +
> +    ASSERT(fixmap_idx <= FIX_MSIX_IO_RESERV_END);
> +
> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        writeb(val, hwaddr);
> +        break;
> +
> +    case 2:
> +        writew(val, hwaddr);
> +        break;
> +
> +    case 4:
> +        writel(val, hwaddr);
> +        break;
> +
> +    case 8:
> +        writeq(val, hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }

There's still a "break;" missing here.

Jan

