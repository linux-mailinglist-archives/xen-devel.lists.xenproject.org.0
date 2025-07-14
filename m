Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF930B04541
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042983.1413100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLsQ-0003ni-5F; Mon, 14 Jul 2025 16:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042983.1413100; Mon, 14 Jul 2025 16:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLsQ-0003lP-20; Mon, 14 Jul 2025 16:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1042983;
 Mon, 14 Jul 2025 16:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubLsO-0003lJ-G2
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:18:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ba83c00-60ce-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 18:17:59 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so7926825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:17:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6c5660sm10321824a12.48.2025.07.14.09.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 09:17:57 -0700 (PDT)
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
X-Inumbo-ID: 1ba83c00-60ce-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752509879; x=1753114679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e1xHXIc61kk/YAk1OXTRkyBjFWmSEODHbnRCXeTYDss=;
        b=QI4hNiT1Z7Tgt4X0AKUZdSVS+A4l8eANkQQdSrBc1nOj0FrXFmvhQnftIv/eATwmRN
         0hjxxbV15ItYZSotMObd/JlOh8qHBtXejegizpWbaaJ/a53zPOz/Ugr4mMr4CZbmMMbT
         LcYo/QLfS63axbHEu7wvRJag0K8oXhFdlhjNVVYOkG7CTzmFWlMngsX+2Ial+jQyStmH
         Jtby9KgY5KbaK4idUfgQ3QB7L+QHGdNYeL/2Xk8b9/za5tmSCXRjL1sxyGNZnpRn8zw7
         kmV58HWTbj9Vkkp1LHscXyS369V89BlNoLSJBcSoik1kVuCJ5p4zc2NUSWb/B4rg1/Im
         diDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509879; x=1753114679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1xHXIc61kk/YAk1OXTRkyBjFWmSEODHbnRCXeTYDss=;
        b=OChBCLzkPIDLGtBu/p86Ujf/Gq1C0X16ea5xYjtAUTn18YOd0QAfWqLQv+2ruRTJkJ
         KoNV9qoI22dE7wRrl7rTGD8WGjhx6T+/+ixnMEcRNp2eyd2vrkIUROcbDmQClqFy4spK
         1c3d8zvvoXufy3kGBEwupeAcv6Jrny3wyydajV3lm9+Umi6QRrNUKUi01/5Xcq0mRaOK
         N06tXX8+1brvB93r2W+uRUEN2dErAfxucEoQ7v/YmsConasMjuW87VeCS/B2y8Hk6xva
         38ZQrAQ4w8h+JlG8QTOz5lUzuAjDd8K0IbMSBWaBnN7JTMb54ZBRueZpelI+DSfC8twQ
         FeGg==
X-Forwarded-Encrypted: i=1; AJvYcCWazq/Bcd5wS5XuzFKqhTRk47y8GVmgvfyZCekdVeBfnOZeJ7qhDfifYiqIL3MJLhgVtP5cDvoPzd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAqm4GTGmzEzcT8VeE2Ps1OxRHJBXEoSY91svSf+sBuxENT+b6
	oCarRdrSio5rfSZQHEwN1xdTx3c3uB1iad+0pWiDxnA90XxpqN36hob92lqnUxfQrg==
X-Gm-Gg: ASbGnct1Hld/cx7EflO8ZyEsJAUV/jjMnXn2rV+ajniy2Z8kB2ldhmqvNdDB7HXwAS3
	rk3q5xCC9ykKWEU+qk64yHbyFBFg0A7v8GRG2HBxTM9AOQ5cndyvJdDLVhTaSaSW+ussZHXndj4
	jv1mCFLJpmJwgH9D0WEx06cTBxxlTaK4nxDONP2qnCixtbn8ebSemOZOCorKxH4jpNfaN04PaYu
	aOmagpEaHeIbQKeDtSXjcab2V4nQvAM2WoffIIqPNE5BFM/Hjk0EPZo7b87lu77Wk9iWUft3AmM
	D1KiHN/QFrVjPkFXDTAo6KT4D5xDwrYtsEdb8IaJSrhtC73BNkb8BEKZPlBNxLN/U4W7BHslrUf
	eBB0UM2r/Tcww0+h79xO/DvpfoiswjPWYFobQlAwDlMeCxK0th3q3AFjYORODi6KLz0rwIkBFWc
	rT8dzfCEc=
X-Google-Smtp-Source: AGHT+IGLDTz9iqDmCHzzJUEJU3Ru+y8FBVjgLYdZ8qVF8Sg/fvZc5p7ssewLjMc820qgjNhEU+Gerg==
X-Received: by 2002:a5d:5d85:0:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b60953f903mr131114f8f.24.1752509878531;
        Mon, 14 Jul 2025 09:17:58 -0700 (PDT)
Message-ID: <43e89225-5e69-49a6-a8c8-bda6d120d8ff@suse.com>
Date: Mon, 14 Jul 2025 18:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] xen/riscv: Implement p2m_free_entry() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <67148a7cceffdcbc5d8a51cd6af0a0c83e5b93bc.1749555949.git.oleksii.kurochko@gmail.com>
 <ec05b4c8-c328-4dc3-9f35-207421990893@suse.com>
 <de4ce9e3-c858-4ef6-917e-c9dd05bca02e@gmail.com>
 <9b84393c-37a7-4621-a7bb-3249e28fb69e@suse.com>
 <e5b90a21-03fd-4aef-b35a-f767d34c5dde@gmail.com>
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
In-Reply-To: <e5b90a21-03fd-4aef-b35a-f767d34c5dde@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 18:01, Oleksii Kurochko wrote:
> On 7/14/25 9:15 AM, Jan Beulich wrote:
>> On 11.07.2025 17:56, Oleksii Kurochko wrote:
>>> On 7/1/25 4:23 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> +/* Put any references on the single 4K page referenced by mfn. */
>>>>> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
>>>>> +{
>>>>> +    /* TODO: Handle other p2m types */
>>>>> +
>>>>> +    /* Detect the xenheap page and mark the stored GFN as invalid. */
>>>>> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>>>>> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>>>> Is this a valid thing to do? How do you make sure the respective uses
>>>> (in gnttab's shared and status page arrays) are / were also removed?
>>> As grant table frame GFN is stored directly in struct page_info instead
>>> of keeping it in standalone status/shared arrays, thereby there is no need
>>> for status/shared arrays.
>> I fear I don't follow. Looking at Arm's header (which I understand you
>> derive from), I see
>>
>> #define gnttab_shared_page(t, i)   virt_to_page((t)->shared_raw[i])
>>
>> #define gnttab_status_page(t, i)   virt_to_page((t)->status[i])
>>
>> Are you intending to do things differently?
> 
> I missed these arrays... Arm had different arrays:
> -    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
> -    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
> 
> I think I don't know the answer to your question, as I'm not deeply familiar
> with grant tables and would need to do some additional investigation.
> 
> And just to be sure I understand your question correctly: are you asking
> whether I marked a page as|INVALID_GFN| while a domain might still be using
> it for grant table purposes?

Not quite. I'm trying to indicate that you may leave stale information around
when you update the struct page_info instance without also updating one of the
array slots. IOW I think both updates need to happen in sync, or it needs to
be explained why not doing so is still okay.

>>>>> +/* Put any references on the superpage referenced by mfn. */
>>>>> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>>>>> +{
>>>>> +    struct page_info *pg;
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    ASSERT(mfn_valid(mfn));
>>>>> +
>>>>> +    pg = mfn_to_page(mfn);
>>>>> +
>>>>> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
>>>>> +        p2m_put_foreign_page(pg);
>>>>> +}
>>>>> +
>>>>> +/* Put any references on the page referenced by pte. */
>>>>> +static void p2m_put_page(struct p2m_domain *p2m, const pte_t pte,
>>>>> +                         unsigned int level)
>>>>> +{
>>>>> +    mfn_t mfn = pte_get_mfn(pte);
>>>>> +    p2m_type_t p2m_type = p2m_type_radix_get(p2m, pte);
>>>> This gives you the type of the 1st page. What guarantees that all other pages
>>>> in a superpage are of the exact same type?
>>> Doesn't superpage mean that all the 4KB pages within that superpage have the
>>> same type and contiguous in memory?
>> If the mapping is a super-page one - yes. Yet I see nothing super-page-ish
>> here.
> 
> Probably, I just misunderstood your reply, but there is a check below:
>      if ( level == 2 )
>          return p2m_put_l2_superpage(mfn, pte.p2m.type);
> And I expect that if|level == 2|, it means it is a superpage, which means that
> all the 4KB pages within that superpage share the same type and are contiguous
> in memory.

Let's hope that all of this is going to remain consistent then.

>>>>> +static void p2m_free_page(struct domain *d, struct page_info *pg)
>>>>> +{
>>>>> +    if ( is_hardware_domain(d) )
>>>>> +        free_domheap_page(pg);
>>>> Why's the hardware domain different here? It should have a pool just like
>>>> all other domains have.
>>> Hardware domain (dom0) should be no limit in the number of pages that can
>>> be allocated, so allocate p2m pages for hardware domain is done from heap.
>>>
>>> An idea of p2m pool is to provide a way how to put clear limit and amount
>>> to the p2m allocation.
>> Well, we had been there on another thread, and I outlined how I think
>> Dom0 may want handling.
> 
> I think that I don't remember. Could you please remind me what was that thread?
> Probably, do you mean this reply:https://lore.kernel.org/xen-devel/cover.1749555949.git.oleksii.kurochko@gmail.com/T/#m4789842aaae1653b91d3368f66cadb0ef87fb17e ?
> But this is not really about Dom0 case.

It would have been where the allocation counterpart to the freeing here is,
I expect.

Jan

