Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE50A3200F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 08:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886162.1295845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti7K4-0002jE-QZ; Wed, 12 Feb 2025 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886162.1295845; Wed, 12 Feb 2025 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti7K4-0002hc-NZ; Wed, 12 Feb 2025 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 886162;
 Wed, 12 Feb 2025 07:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ti7K2-0002hP-NZ
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 07:38:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 509d210d-e914-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 08:38:13 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7c501bbecso465842866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 23:38:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7d243bba5sm394894666b.71.2025.02.11.23.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 23:38:12 -0800 (PST)
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
X-Inumbo-ID: 509d210d-e914-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739345893; x=1739950693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wLjQan+KyC+EpAJYQuttIKXaoxesdXErEUY1UHSBnrM=;
        b=cjao93XdrXmggpOYoHag86ATwLwRfxs6vW86+LAyVCnZz2Eki28FYSbiTxpgXIqdBk
         NerI6dTNF4LEMrvu0FuiJWMVttoBDpEqGYgMFrytmtaqhT/53y94OOefHtY+Q0+ws/z5
         7Gtx0RClxY2LT6RDUeAgmKGoMw3a1+zvY0dM9zmot+kFOpIXnUkEcIplsPknlhamwbDt
         vc+wHyOgd/Zqav4AK/rIYDeEIMqfbkU5hknE1f6atS0Vrd1T2XADILbIgZqln9W4mJ2B
         TuacACAvl79ISKMB3qCZ30mLajTXE2JHg9+FC6fndJdT+lLSAAToajnUHbjRMcVVkq7X
         bk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345893; x=1739950693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLjQan+KyC+EpAJYQuttIKXaoxesdXErEUY1UHSBnrM=;
        b=JLSN6LTtIvy+OTbhDxSgwmhJU7PFRU4wFbOqY/Sf4DTHiiNP+qMmy2asAEVrbNL+TR
         qVvROd9BRExZirL1h2HogaHH8xC6kpkhQv9sTxeftWImR7uDQPfn/SGgtQouy3J8nh4z
         w3nUFv6TRXJiwd01JMHsxXZjaSsbVnecwuiyjw2sFpWLaD3FHCRE/FMv9EAyH/lJcCfL
         Gvhs4vof+YBBDqxNsAR46la2WAK/cBca+nWDSo+5fWGEopLzf043qveGrUewNhSBu4Fg
         64DD1FjJVROxLkXf3vbEXpvZHuI4eTAbz5qoDBJKjPzVA/ggzW7shlNEVt2CSlFRIMen
         gM5w==
X-Forwarded-Encrypted: i=1; AJvYcCX+FRLN8olb2X7g6ox8HNuwzEkmbpdhAWHlhBZihLfIU1vW1hQCHfSLLzMuHgAv+3lwgfbAhTnY7E4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9MtuE4+qFF/n+3U/NFvbK7yBbr+fEJhic6gBVTTmAlX4raWG8
	rRPatDbXjUB+BTg2a5pW0zDzYMd1oTyhWM0fnzURa+Xg1XVbfARgx7b1E5CVrA==
X-Gm-Gg: ASbGncvB7s+jwCNWq1/fTvthTiKkXfQesa1/JAb9sR7iaLTOGOYwq1albp3kNNUgVNt
	kxxBac918dJZ9YLInDyB7QSnD3n/mO83wW7Sz3jXC5eJsZqQ6WrYi/Pl8pZI4xrDGp3lgpCcJVG
	nA11fVweKIYAcPrD2pSvBdeY/EXXL/887/+M31xIFYTBuQ2Bd+v63QbctjkgAqlK2FO1R6fEYXo
	ZMZ6Ws2plO79ybvkbOPq0QrByVi+EB7rijFEl9ygfdzQsQKBZAimQFxfs6kj2kRtbTjCkBDYkZ5
	Bsaw9XQQ6RAJyUbFmHGoABgFzws2AFB7k4vmbZvtYsJ2TR1ZetZZG8AhlVUhDRs9CghxSxJaGsZ
	A
X-Google-Smtp-Source: AGHT+IEFvNs8uOtbXE41Ln0wTMYaIqbADY6HMkDnwvoMjcBj/NSWHknj+g9ufEucmWh6ko9ZNtziNA==
X-Received: by 2002:a17:907:7d88:b0:ab7:8d23:1fef with SMTP id a640c23a62f3a-ab7f334583amr189319666b.9.1739345892840;
        Tue, 11 Feb 2025 23:38:12 -0800 (PST)
Message-ID: <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
Date: Wed, 12 Feb 2025 08:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux.dev
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
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
In-Reply-To: <20250211120432.29493-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.02.2025 13:04, Juergen Gross wrote:
> In case xen_swiotlb_alloc_coherent() needed to create a contiguous
> region only for other reason than the memory not being compliant with
> the device's DMA mask, there is no reason why this contiguous region
> should be destroyed by xen_swiotlb_free_coherent() later. Destroying
> this region should be done only, if the memory of the region was
> allocated with more stringent placement requirements than the memory
> it did replace.

I'm not convinced of this: Even the mere property of being contiguous
may already be enough to warrant freeing when possible. The hypervisor
may not have that many contiguous areas available. The bigger the
chunk, the more important to give it back once no longer needed in
this shape.

Plus also take into account how Xen behaves here: It specifically tries
to hold back, during boot, lower addressed memory to later satisfy such
requests. Hence even if you don't ask for address restricted memory,
you may get back such. You'd need to compare input and output addresses,
not input addresses and requested restriction to alleviate this.

> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2208,19 +2208,22 @@ void __init xen_init_mmu_ops(void)
>  static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
>  
>  #define VOID_PTE (mfn_pte(0, __pgprot(0)))
> -static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
> -				unsigned long *in_frames,
> -				unsigned long *out_frames)
> +static int xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
> +			     unsigned long *in_frames,
> +			     unsigned long *out_frames)
>  {
>  	int i;
> +	u64 address_bits = 0;

First I was inclined to suggest to use paddr_t here, but ...

>  	struct multicall_space mcs;
>  
>  	xen_mc_batch();
>  	for (i = 0; i < (1UL<<order); i++, vaddr += PAGE_SIZE) {
>  		mcs = __xen_mc_entry(0);
>  
> -		if (in_frames)
> +		if (in_frames) {
>  			in_frames[i] = virt_to_mfn((void *)vaddr);
> +			address_bits |= in_frames[i] << PAGE_SHIFT;

... why do a shift on every loop iteration when you can ...

> +		}
>  
>  		MULTI_update_va_mapping(mcs.mc, vaddr, VOID_PTE, 0);
>  		__set_phys_to_machine(virt_to_pfn((void *)vaddr), INVALID_P2M_ENTRY);
> @@ -2229,6 +2232,8 @@ static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
>  			out_frames[i] = virt_to_pfn((void *)vaddr);
>  	}
>  	xen_mc_issue(0);
> +
> +	return fls64(address_bits);

... simply add in PAGE_SHIFT here, once?

> @@ -2321,7 +2326,8 @@ static int xen_exchange_memory(unsigned long extents_in, unsigned int order_in,
>  
>  int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  				 unsigned int address_bits,
> -				 dma_addr_t *dma_handle)
> +				 dma_addr_t *dma_handle,
> +				 unsigned int *address_bits_in)
>  {
>  	unsigned long *in_frames = discontig_frames, out_frame;
>  	unsigned long  flags;
> @@ -2336,7 +2342,7 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  	spin_lock_irqsave(&xen_reservation_lock, flags);
>  
>  	/* 1. Zap current PTEs, remembering MFNs. */
> -	xen_zap_pfn_range(vstart, order, in_frames, NULL);
> +	*address_bits_in = xen_zap_pfn_range(vstart, order, in_frames, NULL);

Nit: Converting plain int to unsigned int, when there's no real reason
to do any conversion. Since xen_zap_pfn_range() can't return a negative
value for the caller caring about the return value (yet more obviously
so with the suggested adjustment, and then true for both callers), the
function could easily return unsigned int.

Jan

