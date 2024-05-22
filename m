Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8F8CBC61
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727288.1131766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gmH-0001Br-LQ; Wed, 22 May 2024 07:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727288.1131766; Wed, 22 May 2024 07:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gmH-0001AE-Ib; Wed, 22 May 2024 07:52:49 +0000
Received: by outflank-mailman (input) for mailman id 727288;
 Wed, 22 May 2024 07:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9gmG-0006Z1-Eg
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:52:48 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46f3f3cd-1810-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 09:52:46 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5238b7d0494so6243102e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 00:52:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a893a91b9sm1059832166b.7.2024.05.22.00.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 00:52:45 -0700 (PDT)
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
X-Inumbo-ID: 46f3f3cd-1810-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716364366; x=1716969166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCOB4JeNG5xQU2yj2tSqSJzbGGZIC4RzJ677ijFSXRA=;
        b=V+EuCGw9ZqwGgqbiqAB8UPiYcoMGy/L5LrcpcjLitGApB/MxC7ZdcQwwxA5uv4y7LW
         L7dU4qQbuWDsAQOSboyIMx7PeN4dpVwmiYeekqXPO9jIBkGsWuMRdW5TEwR7gdIu08fW
         iFg6vmzjNrxlyWaFguR5TzjPJhbWUjLbtFGfwreChaaD6iI5l0OOFD0Hd44yPbM1dp5S
         EiykNh4z0yBhsBzz7AGDOb7ngFzyW8nZB0JVuzJ/YZ9UsRrapVC53mS7hKa/Nuo5GELS
         vHWshRKYKZuBV2Tpf69tTUfhw0QUFNV6ai6Hh/iymhpaQEHfzFzzqV2BQoRhc2y6U2va
         klDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716364366; x=1716969166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCOB4JeNG5xQU2yj2tSqSJzbGGZIC4RzJ677ijFSXRA=;
        b=s6uw2IZjxJeXsjkmsGhBS0mKPiURhNUmnzGxzPpn80qLKF/N3DZMCg8NOOtvb3zyNJ
         dy179aQ1+srRhEnqmaSUgn/csKTNEv8+5MK9GAIugR7D0l7KbngwhU/CwKsYCq43gr8c
         hvQlPh8ygX3GmMkBLjnJua3hCaMHsOGu/nb9flksJXeT1U3isYeo/xvB8npfvlqqE/Fl
         tmdexurSeBZpc0cyEKgKImxdhVbrxrjUc4c9ONh9vA1AkCpRqCnr3xxIqSNctZy4eNdv
         dCu+GawzmB/2KaGr5df6nHXU4h8upPCsyY/iTiF754IDJ1+6sZNbAzZ/0K8JK8tSFrs4
         FGLA==
X-Forwarded-Encrypted: i=1; AJvYcCVHzWErVRXnqP8MlQNvJg9j21FETPNeiBvYjT+3oNrEOA8KChl+7zRg3hbm4/cJDJKv/iSGbIwOkrfA5MlwOl2Ickvf6PEMRGpLFYqTutk=
X-Gm-Message-State: AOJu0Yy5qeO/jXrnO543hqXejwQahpanQSNgqz5bkYOgDyWt454kkybL
	6du8dywqx3B9CMQ6ZQnKo+5RhkZ6YSx0H9RLBz5Sn5VvhWW679OS2IxtcVgqTg==
X-Google-Smtp-Source: AGHT+IGAM6NRvz0OIvbVysBcvW+HGDRWtViIpJYmOkWlHHJ/bX7slkm3WJxsUjr96TO60yKEwDV/LQ==
X-Received: by 2002:ac2:5e3b:0:b0:51d:5ffd:efe4 with SMTP id 2adb3069b0e04-526beca95f8mr1089686e87.1.1716364365778;
        Wed, 22 May 2024 00:52:45 -0700 (PDT)
Message-ID: <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>
Date: Wed, 22 May 2024 09:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2009,6 +2009,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>          goto out_put_gfn;
>      }
>  
> +    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
> +         subpage_mmio_write_accept(mfn, gla) &&

Afaics subpage_mmio_write_accept() is unreachable then when CONFIG_HVM=n?

> +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
> +    {
> +        rc = 1;
> +        goto out_put_gfn;
> +    }

Overall this new if() is pretty similar to the immediate preceding one.
So similar that I wonder whether the two shouldn't be folded. In fact
it looks as if the new one is needed only for the case where you'd pass
through (to a DomU) a device partially used by Xen. That could certainly
do with mentioning explicitly.

> +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)

Considering what the function does and what it returns, perhaps better
s/get/map/? The "get_page" part of the name generally has a different
meaning in Xen's memory management.

> +{
> +    void __iomem *mapped_page;
> +
> +    if ( entry->mapped )
> +        return entry->mapped;
> +
> +    mapped_page = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);
> +
> +    spin_lock(&subpage_ro_lock);
> +    /* Re-check under the lock */
> +    if ( entry->mapped )
> +    {
> +        spin_unlock(&subpage_ro_lock);
> +        iounmap(mapped_page);

The only unmap is on an error path here and on another error path elsewhere.
IOW it looks as if devices with such marked pages are meant to never be hot
unplugged. I can see that being intentional for the XHCI console, but imo
such a restriction also needs prominently calling out in a comment next to
e.g. the function declaration.

> +        return entry->mapped;
> +    }
> +
> +    entry->mapped = mapped_page;
> +    spin_unlock(&subpage_ro_lock);
> +    return entry->mapped;
> +}
> +
> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned int offset,
> +    const void *data,
> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;
> +    void __iomem *addr;

Wouldn't this better be pointer-to-volatile, with ...

> +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(entry->mfn, mfn) )
> +        {
> +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
> +            {
> + write_ignored:
> +                gprintk(XENLOG_WARNING,
> +                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> +                        mfn_x(mfn), offset, len);
> +                return;
> +            }
> +
> +            addr = subpage_mmio_get_page(entry);
> +            if ( !addr )
> +            {
> +                gprintk(XENLOG_ERR,
> +                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
> +                        mfn_x(mfn), offset);
> +                return;
> +            }
> +
> +            switch ( len )
> +            {
> +            case 1:
> +                writeb(*(const uint8_t*)data, addr);
> +                break;
> +            case 2:
> +                writew(*(const uint16_t*)data, addr);
> +                break;
> +            case 4:
> +                writel(*(const uint32_t*)data, addr);
> +                break;
> +            case 8:
> +                writeq(*(const uint64_t*)data, addr);
> +                break;

... this being how it's written? (If so, volatile suitably carried through to
other places as well.)

> +            default:
> +                /* mmio_ro_emulated_write() already validated the size */
> +                ASSERT_UNREACHABLE();
> +                goto write_ignored;
> +            }
> +            return;
> +        }
> +    }
> +    /* Do not print message for pages without any writable parts. */
> +}
> +
> +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> +{
> +    unsigned int offset = PAGE_OFFSET(gla);
> +    const struct subpage_ro_range *entry;
> +
> +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)

Considering the other remark about respective devices impossible to go
away, is the RCU form here really needed? Its use gives the (false)
impression of entry removal being possible.

> +        if ( mfn_eq(entry->mfn, mfn) &&
> +             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )

Btw, "qwords" in the field name is kind of odd when SUBPAGE_MMIO_RO_ALIGN
in principle suggests that changing granularity ought to be possible by
simply adjusting that #define. Maybe "->ro_elems"?

> --- a/xen/arch/x86/pv/ro-page-fault.c
> +++ b/xen/arch/x86/pv/ro-page-fault.c
> @@ -330,6 +330,7 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
>              return X86EMUL_UNHANDLEABLE;
>      }
>  
> +    mmio_ro_ctxt.mfn = mfn;
>      ctxt->data = &mmio_ro_ctxt;
>      if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_ctxt.bdf) )
>          return x86_emulate(ctxt, &mmcfg_intercept_ops);

Wouldn't you better set .mfn only on the "else" path, just out of context?
Suggesting that the new field in the struct could actually overlay the
(seg,bdf) tuple (being of relevance only to MMCFG intercept handling).
This would be more for documentation purposes than to actually save space.
(If so, perhaps the "else" itself would also better be dropped while making
the adjustment.)

Jan

