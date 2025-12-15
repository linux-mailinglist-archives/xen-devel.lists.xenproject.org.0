Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E0CBCF55
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 09:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186679.1508107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV3wE-00074J-66; Mon, 15 Dec 2025 08:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186679.1508107; Mon, 15 Dec 2025 08:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV3wE-00072V-2T; Mon, 15 Dec 2025 08:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1186679;
 Mon, 15 Dec 2025 08:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV3wC-0006Tz-Es
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 08:28:12 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd7ecdab-d98f-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 09:28:10 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso24919085e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 00:28:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4b1347sm190739325e9.8.2025.12.15.00.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 00:28:09 -0800 (PST)
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
X-Inumbo-ID: fd7ecdab-d98f-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765787290; x=1766392090; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6qRfA0WPGABEWDzgLPF/qpTfW0+fzLNFTO1YVf/Np+I=;
        b=KcOyTKyRPVhdUUbjOv6e5TAvcyL+mnwY9iCWspg7NuUwCNRXAXkvrUCq+DQnbOL2Fx
         xxOFfOzYiCH/lr79yh+wJhdHnapBhZXX6ZOamRgBvZvw5cv8wJZr1QtnVH8WnzLF8O9A
         1lKkH6KW+V0b/xtM+rIn/cMVXxZS8aO7jNy0sKvPn1bRzUSFGHvz98UGBfke7+9tUgJ1
         1gFD/frzLSEi9Hrpuzvphx+A6i3zQA/Isji3qLPXCkA2hdGCMxWp45apUxszePSs16Ru
         FP6RACUNdCoESps8zSLyjKMO0VRpcyM5++w75bUgn932kykZLG0TSuzH1bYELPmjQuuJ
         IMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765787290; x=1766392090;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qRfA0WPGABEWDzgLPF/qpTfW0+fzLNFTO1YVf/Np+I=;
        b=C/uIqXSbHK7k3oGhSIcLNIASoeYu9xZIgMJxEqCQy0IwhIQTerBuK7cK7S8G4xd7ya
         jn+8g9GkHu5xwWSoIK+Ihs8y5t5WV12mGkdf/8D00564ZAbVaSOOTlppZDVCQHW9GCUi
         p4x9M7vRmPJdcQTAqx82TFrcR1/vOuv0EmJvdWuRtUZ/vGyDe3PSYiDu4fBB0qTTYA/N
         5l+DPOzWmr1ZsVE0s0SXe/0GWLVLv6PDNzsUifsKs3MdoS8JmgCQdIdTAb5FMTyCEuOt
         +BUnvZyEBpkEkL0Dzf1H1wCOQOqvSCX4pGY+vD7u08ljDf/mNQw1gAsR4FFqhD3UzbE3
         wjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXecGl1r87RIAbd42PRW4cilROOdipo0zW7CGW8AHjn/2qiAXHd6Ddv0AnXd0Gv0zQYyPYwbX8ZctI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj+s/tZ6mvAbMY6sqwXu08CP6PflIoyf74DcmbgoVMa+WEHm5i
	hlIf9xPXmZS0/hDUZU8XyASeUb6IxIXaymQWz43AOvrqnrglzHB0lsNWmadMXAWnnw==
X-Gm-Gg: AY/fxX5f7u6En/x5J3fBVYdNN7bfH1IIc6y4UBR1q0Nk5bCHGFwQv332xexPg4w1RFZ
	pSAHDAQVXC7KtOopMzIequIfeQ9Rf/JyiFyFLG4l1rmc2DaG3sqHa4h3Pn9anOkK+kS+QM9sCT3
	E9d6LErQ8Oq4DYX/xI++ZZyI1Es9Tfvtg5mgsC6E6Sn/Yd/HH1R3XJXxulcy+/umnRZ45z6SkjF
	4B50W2pWgyIDBcUFeqCsvb/RlGzmrAykQ1US1iwLlUI6rhIMsQXertcuwD/TWksp0M0GmpmdWh5
	Qx5Cvmza1h2/w5sisjeXQeuiZ3vNOPdhkWRUJXw9CUbCGZt4QD0Ig8OzJktzsLKSNeCgwZMzT/o
	gmzyL3XQaYtqFM9TA9ZDHdjKNdIj7hb1HyHsgfAUoVvEVdXEDYPrur9H/NdRrSWey+9zL/CXYyH
	05bkOl0kwrlOkgdeoQEDn7V3E4qvUINwiCA5EGkaS9xHlnAQ92T5+Xcu1iB9gXOBkyvT7E8L0jB
	UY=
X-Google-Smtp-Source: AGHT+IEByL7kP3Wvh6M8xfn0pW1etVB54Rs+TC9RMmqiJXlKqwZuyCMIQfWlM8eyXSNCRPvYXjtHFw==
X-Received: by 2002:a05:600c:4e47:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47a8f9155c6mr79820335e9.32.1765787289983;
        Mon, 15 Dec 2025 00:28:09 -0800 (PST)
Message-ID: <becae376-2d01-4019-919d-c6840c6d4506@suse.com>
Date: Mon, 15 Dec 2025 09:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
 <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
 <36be69fb-9362-43a4-8308-1e62be60d27f@gmail.com>
 <621089a4-d946-46ce-a3cf-4d0938d4a39a@suse.com>
 <db24c624-0432-48ec-aecc-3efaa4973303@gmail.com>
 <6c78a029-7437-4256-afca-c5d39fbd3f8b@suse.com>
 <45231d95-1745-44a6-b364-e97f9f501e10@gmail.com>
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
In-Reply-To: <45231d95-1745-44a6-b364-e97f9f501e10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 17:42, Oleksii Kurochko wrote:
> On 12/11/25 10:39 AM, Jan Beulich wrote:
>> On 10.12.2025 13:44, Oleksii Kurochko wrote:
>>> On 12/10/25 8:06 AM, Jan Beulich wrote:
>>>> On 09.12.2025 18:09, Oleksii Kurochko wrote:
>>>>> On 12/9/25 2:47 PM, Jan Beulich wrote:
>>>>>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>>>>>> +            *md_pg = p2m_alloc_page(p2m);
>>>>>>> +            if ( !*md_pg )
>>>>>>> +            {
>>>>>>> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
>>>>>>> +                domain_crash(p2m->domain);
>>>>>>> +
>>>>>>> +                return;
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if ( *md_pg )
>>>>>>> +        metadata = __map_domain_page(*md_pg);
>>>>>>> +
>>>>>>> +    if ( t >= p2m_first_external )
>>>>>>> +    {
>>>>>>> +        metadata[ctx->index].type = t;
>>>>>>> +
>>>>>>> +        t = p2m_ext_storage;
>>>>>>> +    }
>>>>>>> +    else if ( metadata )
>>>>>>> +        metadata[ctx->index].type = p2m_invalid;
>>>>>>> +
>>>>>>> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>>>>>>> +
>>>>>>> +    unmap_domain_page(metadata);
>>>>>>>     }
>>>>>> Just to mention (towards future work): Once a metadata page goes back to be
>>>>>> entirely zero-filled, it could as well be hooked off and returned to the pool.
>>>>>> Not doing so may mean detaining an unused page indefinitely.
>>>>> Won’t that already happen when p2m_free_table() is called?
>>>> Well, that's when both page table and metadata table are freed. But what if a
>>>> leaf page table is moving back to holding all p2m_ram_rw mappings? Then the
>>>> metadata page is unused, but will remain allocated.
>>> Good point...
>>>
>>> This could be a rather expensive operation, since in the code:
>>>     +    else if ( metadata )
>>>     +        metadata[ctx->index].type = p2m_invalid;
>>> we would have to check all other metadata entries to determine whether they are
>>> (p2m_invalid) or not, and return the page to the pool.
>>>
>>> It would be nice to have something like metadata.used_entries_num, but the entire
>>> page is used for type entries.
>>> As an option, we could reserve 8 bits to store a counter of the number of used
>>> entries in the metadata page, and then use metadata[0].used_entries_num to check
>>> whether it is zero. If it is zero, we could simply return the metadata page to the
>>> pool in the “else if (metadata)” case mentioned above.
>>>
>>> How bad is this idea? Any better suggestions?
>> First, as said in my initial reply: This may not need taking care of right away.
>> It will need keeping in mind, of course.
> 
> I am thinking if it won't be too intrusive, I think that I am okay to introduce that
> now.
> 
>>
>> As to suggestions - hardly any of the fields in struct page_info for the page
>> can be used when the page is a metadata one. Simply record the count there?
> 
> I suppose that|union u| could be used.
> The only thing that confuses me is the shadow paging implementation on x86.
> In|struct page_info|, it has the following:
>      /* Context-dependent fields follow... */
>      union {
> 
>          /* Page is in use: ((count_info & PGC_count_mask) != 0). */
>          struct {
>              /* Type reference count and various PGT_xxx flags and fields. */
>              unsigned long type_info;
>          } inuse;
> 
>          /* Page is in use as a shadow: count_info == 0. */
>          struct {
> 	   ....
>          } sh;
> 
>          /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
>          union {
> 
> So it seems that something in the shadow code must set|count_info| to zero for
> shadow pages. But I cannot find where this happens. I would expect it to be done
> in|shadow_alloc()|, when the page is taken from the free list. However, pages
> from the free list donot have|count_info == 0| since|alloc_heap_pages() |initializes|count_info|.
> What guarantees that|count_info| will be zero for shadow tables?

This is all a little (or maybe even pretty) subtle. On x86 PGC_state_inuse is 0.
Together with logic guaranteeing that PGC_need_scrub would be clear by the time
a page is handed to the caller, what alloc_heap_pages() does is actually to
clear the field.

> Interestingly, in the shadow p2m page free code, there is logic that resets
> |count_info| to zero:

Yes, because iirc there used to be a strict requirement that pages need to be
handed back to the allocator the way they came out of it: With .count_info
clear. mark_page_free() documents / handles a couple of special cases now.

Jan

