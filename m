Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89695A877F1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 08:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949055.1345703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DOC-00083N-6D; Mon, 14 Apr 2025 06:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949055.1345703; Mon, 14 Apr 2025 06:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4DOC-00081I-3P; Mon, 14 Apr 2025 06:33:52 +0000
Received: by outflank-mailman (input) for mailman id 949055;
 Mon, 14 Apr 2025 06:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4DOA-00081A-Pl
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 06:33:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b78574d-18fa-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 08:33:48 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so32484275e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 13 Apr 2025 23:33:47 -0700 (PDT)
Received: from ?IPV6:2003:ca:b71f:2f7e:1407:af3a:2658:6d8d?
 (p200300cab71f2f7e1407af3a26586d8d.dip0.t-ipconnect.de.
 [2003:ca:b71f:2f7e:1407:af3a:2658:6d8d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cb29sm9985778f8f.76.2025.04.13.23.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Apr 2025 23:33:46 -0700 (PDT)
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
X-Inumbo-ID: 6b78574d-18fa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744612427; x=1745217227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JR/bqBy8MI+iMLE8/NYuOC9+CSB+cI9bJg5q7tpQHaA=;
        b=bQnxnW5if45f+gfUeYLC7B3qjeYRxEft0iyfKFUQXce2TJ8+aHKZGFWYUSMz5cfDFF
         HVqTT3J2n94IgCcXCQrTcAw7eRsbFn2bu4Jdi2+Aw2sqP+3uqgAxyw4O+zz+UJJJXP2p
         fzunKi+J20aY9DoRXy4D+gpAKOUsHIVe5YRDrQDlY1jsDQmA1GmSfOj6qLNhgOwA1gYT
         4poeuhZaW3tw0OJHRcPyzuY+4jYIPTzTNvVtq8p/CgXE0/PBQZSP3kJ0XyhZEus6IHJQ
         CroR4+v4bDvH6Qn3nx7Dl8w5X1fXMRY+65hmAlvnCtr0f10A4SdbZhLUMUuAWFeC9f8R
         VOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744612427; x=1745217227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR/bqBy8MI+iMLE8/NYuOC9+CSB+cI9bJg5q7tpQHaA=;
        b=GvkVwxE3HF9gsVi8djm2SFg+2Q15YkjCHrUowmSH3ABUo3a0Jaa/NCjd6Wdi1JUfQx
         3EBLyWyz6zxRc4TWsVFsW2Uw/5jiS078xNLNXBXN0JXONmA7DAjKNm/xAkqOr7Iladlz
         OzB+n2gauh/YiqjFMs/t9W3hqRPYwkyJT4QAGy4tM22M/27zGoMnO+5ybvqDHWnk92RD
         GxP2hK7M12FHfYxzSpch+FqkLTZ93foFoi3nM53db+AivEc0PmcbCiET+vy+XYg3F2wB
         +D0C5sguMwkcKE0xstnJqSCR4BdZhTI1LhPTMKFUQKm7gu5npme/dxFjVod4U8xAQbpW
         u3ug==
X-Forwarded-Encrypted: i=1; AJvYcCV5t+1NxgzXvOfJGXXzvV/54xwFWnrmO0h7/kgQ5PDVM/Qx41oQgHCvCoFcGHWOtRhHM/HXC6w3WOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxs5Wm93N2oD92P01aKlSrYs1mnaQtP8eL29uiijtMM61WdIKdz
	+paNednnob6A07xU97yhZ9yTvVsbO/BH1iW5qaBb9aQcHVqCP1n2znuPbYTs3g==
X-Gm-Gg: ASbGncuynABiHhiiyMUrM8atkY0h9Sd9PtK/7lmBtOsPaGFmCH1bEd826tTMNLkwD87
	EvuQ199tXCkNl4FNI26q47jqc80tVNuyDNOsoGBOPXfhQlXcl4mtCtLYWFVZh1fzSYbfRdv6WTu
	vrftmcKQyH3/HNAAPkJzlYsA398ihoCbppsihx8Aoe8Xv/jxFaLXHQlNIuCeDy4VJLAvbqZ6w7U
	UwjnM6bui2grjeBwPSzL8ttSV8GLMUeU3uO145nCbuAdcWZjN9ylnC8Gv8xyp+XxatdIVI0xYdy
	G6KReIhLtH+zR28A+91zTP0YlBqikOqa3Q6eLNj8bYhZhElcGaMO9P7SraeV9YLawLEg0m+o86y
	vKHURbK2SFra6XLfeGpv8NCX3StV0iduwNPCpkqheeRNGJBkHs9524Rf39MrmmttQrcv1ubY68g
	H/PndMl4iyVw==
X-Google-Smtp-Source: AGHT+IGZkfoHHO3xJMncDruYa4SrqP98ZALvGR5h6j1FQrRWt1YbTgi15ZOHv5nepZ+zd/BSlLSiLQ==
X-Received: by 2002:a05:600c:46d0:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43f3a9b02b3mr103432455e9.30.1744612426720;
        Sun, 13 Apr 2025 23:33:46 -0700 (PDT)
Message-ID: <eaf5f71b-2c56-4bd8-a45f-35280af16466@suse.com>
Date: Mon, 14 Apr 2025 08:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/hvm: fix handling of accesses to partial r/o MMIO
 pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250411105411.22334-1-roger.pau@citrix.com>
 <20250411105411.22334-4-roger.pau@citrix.com>
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
In-Reply-To: <20250411105411.22334-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.04.2025 12:54, Roger Pau Monne wrote:
> The current logic to handle accesses to MMIO pages partially read-only is
> based on the (now removed) logic used to handle accesses to the r/o MMCFG
> region(s) for PVH v1 dom0.  However that has issues when running on AMD
> hardware, as in that case the guest linear address that triggered the fault
> is not provided as part of the VM exit.  This caused
> mmio_ro_emulated_write() to always fail before calling
> subpage_mmio_write_emulate() when running on AMD and called from an HVM
> context.
> 
> Take a different approach and convert the handling of partial read-only
> MMIO page accesses into an HVM MMIO ops handler, as that's the more natural
> way to handle this kind of emulation for HVM domains.
> 
> This allows getting rid of hvm_emulate_one_mmio() and it's single cal site
> in hvm_hap_nested_page_fault().
> 
> Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
> attempting to fixup faults resulting from accesses to read-only MMIO
> regions, as handling of those accesses is now done by handle_mmio().
> 
> Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The fixes tag is maybe a bit wonky, it's either this or:
> 
> 8847d6e23f97 ('x86/mm: add API for marking only part of a MMIO page read only')
> 
> However the addition of subpage r/o access handling to the existing
> mmio_ro_emulated_write() function was done based on the assumption that the
> current code was working - which turned out to not be the case for AMD,
> hence my preference for blaming the commit that actually introduced the
> broken logic.

I agree.

> ---
>  xen/arch/x86/hvm/emulate.c             | 47 +-------------
>  xen/arch/x86/hvm/hvm.c                 | 89 +++++++++++++++++++++++---

It's quite a bit of rather special code you add to this catch-all file. How
about introducing a small new one, e.g. mmio.c (to later maybe become home
to some further stuff)?

> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -370,7 +370,8 @@ static int hvmemul_do_io(
>          /* If there is no suitable backing DM, just ignore accesses */
>          if ( !s )
>          {
> -            if ( is_mmio && is_hardware_domain(currd) )
> +            if ( is_mmio && is_hardware_domain(currd) &&
> +                 !rangeset_contains_singleton(mmio_ro_ranges, PFN_DOWN(addr)) )

I think this needs a brief comment - it otherwise looks misplaced here.

> @@ -585,9 +585,81 @@ static int cf_check hvm_print_line(
>      return X86EMUL_OKAY;
>  }
>  
> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> +{
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, addr, &t);
> +
> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> +           !!subpage_mmio_find_page(mfn);

The !! isn't needed here, is it?

> +}
> +
> +static int cf_check subpage_mmio_read(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +{
> +    struct domain *d = v->domain;
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query(d, addr, &t);
> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *mem;
> +
> +    *data = ~0UL;
> +
> +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> +    {
> +        put_gfn(d, addr);
> +        return X86EMUL_RETRY;
> +    }
> +
> +    entry = subpage_mmio_find_page(mfn);
> +    if ( !entry )
> +    {
> +        put_gfn(d, addr);
> +        return X86EMUL_RETRY;
> +    }
> +
> +    mem = subpage_mmio_map_page(entry);
> +    if ( !mem )
> +    {
> +        put_gfn(d, addr);
> +        gprintk(XENLOG_ERR, "Failed to map page for MMIO read at %#lx\n",
> +                mfn_to_maddr(mfn) + PAGE_OFFSET(addr));

Makes me wonder whether the function parameter wouldn't better be named
"curr" and the local variable "currd", to reflect that this log message
will report appropriate context.

Would also logging the guest physical address perhaps be worthwhile here?

> +        return X86EMUL_OKAY;
> +    }
> +
> +    *data = read_mmio(mem + PAGE_OFFSET(addr), len);
> +
> +    put_gfn(d, addr);
> +    return X86EMUL_OKAY;
> +}
> +
> +static int cf_check subpage_mmio_write(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
> +{
> +    struct domain *d = v->domain;
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query(d, addr, &t);
> +
> +    if ( mfn_eq(mfn, INVALID_MFN) || t != p2m_mmio_direct )
> +    {
> +        put_gfn(d, addr);
> +        return X86EMUL_RETRY;
> +    }
> +
> +    subpage_mmio_write_emulate(mfn, PAGE_OFFSET(addr), data, len);
> +
> +    put_gfn(d, addr);
> +    return X86EMUL_OKAY;
> +}

Unlike the read path this doesn't return RETRY when subpage_mmio_find_page()
fails (indicating something must have changed after "accept" said yes).

> @@ -1981,7 +2056,9 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>       */
>      if ( (p2mt == p2m_mmio_dm) ||
>           (npfec.write_access &&
> -          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server))) )
> +          (p2m_is_discard_write(p2mt) || (p2mt == p2m_ioreq_server) ||
> +           /* MMIO entries can be r/o if the target mfn is in mmio_ro_ranges. */
> +           (p2mt == p2m_mmio_direct))) )
>      {
>          if ( !handle_mmio_with_translation(gla, gfn, npfec) )
>              hvm_inject_hw_exception(X86_EXC_GP, 0);

Aren't we handing too many things to handle_mmio_with_translation() this
way? At the very least you're losing ...

> @@ -2033,14 +2110,6 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>          goto out_put_gfn;
>      }
>  
> -    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&

... the .present check.

I'm also concerned of e.g. VT-x'es APIC access MFN, which is
p2m_mmio_direct.

Jan

