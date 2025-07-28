Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C007FB13A09
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061388.1426943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMMJ-0003FB-Sk; Mon, 28 Jul 2025 11:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061388.1426943; Mon, 28 Jul 2025 11:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugMMJ-0003CU-Pj; Mon, 28 Jul 2025 11:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1061388;
 Mon, 28 Jul 2025 11:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugMMI-0003A2-Ao
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:49:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed097a31-6ba8-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 13:49:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso2200293f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 04:49:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e83544f2esm5616081a91.29.2025.07.28.04.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:49:31 -0700 (PDT)
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
X-Inumbo-ID: ed097a31-6ba8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753703372; x=1754308172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xBojJdEzgADQ1zDVN1IoLpeg7FVR7iPvPMLg/LvZDno=;
        b=PO8SsZ2mMNcbFk2Gxl9IBul87E5Jw11QJhqgRx3rGjfuuQYHmuIS7Uf0LrPo6ARH9Q
         r3kSgcAVn8jioyRhPXZ+7d2uO0GF1TxYg+EujiN1Ee6YROf1WwjzAfxYvdO6RZMrL5GF
         486OFZcR4MYhr2M+4BN3QMC4pnnF3x4j7pHIWnDky88dZpfdDS16oXKS8DEvTSkDMlf2
         QuakMMj6Frld1LfZNsaCtCk2C8PhwD5V+4KfGPfXIDSRbzn2O3e+PAcD3qKynFYSEEaN
         zGl7v/YJXKVTwj3/NkZmUuuNTau6TIa1sjDvw7VwslnZHXMNoVK2YWWa2Jn8atYiery0
         k7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753703372; x=1754308172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBojJdEzgADQ1zDVN1IoLpeg7FVR7iPvPMLg/LvZDno=;
        b=JR84iurt+pNjm9lrwMGtt9rQqh/RjZYTrLCC+DRMkngZPNxb+qYt5gIlsBa/azdI8e
         nEO/PvC4ZuIy2Ts1GUqeGMAZv3YbhJbS7UBLRFTbG9D6MXof/Dr4WBZSN4cnGAb2T0Q+
         7eNpx491BXNDub+qGAR/ieM//hAM9khkDwDNyBmFlakNawBry/irnH3tS2eE+l6n3Mtt
         jnz5taFnriBN+YvN++IKwZQyOeUvRjR4mYSWqiPAWux7xaClJWMhHEPNE1PEFDauW2lv
         q1URvOItX3kYYJ2xaifcAF7ceskKnYt6xa6k2h/H2HmN0Qb3TdSmGAfGFT+6AOtorlTE
         4fOQ==
X-Gm-Message-State: AOJu0YwiXX1NGtR8wKAz2Dsq0IS6cXxD7ZlbdkWbLAZIXjjAadZNhZ9M
	+TMVoBSVt3Ii1Psj22t+p5AlN3Z/D+dnwHWpEjv2DDHYK0K/28gHd5XxUItu08Gy9Q==
X-Gm-Gg: ASbGncveGxafNoISvruEkNXtNyxIenfULWtPE7ovyplsfu2/26HMaBjLZRXEAEd+C2i
	4FNh5RQUsZSLJqO9xrY7Wnn+ya8cYfA2R5ecHYUKaN/C39/Y27TqCgwmrB5sTcjQpm1p4AL57dS
	0UgdyuFFufWfPs/cYbjCIrtXrivxl3TakxcZyS2KzvZFt877DmFK2FAaFVDXgpHc7FRETYvtnKf
	x9HcqAANKKR4Ji/jhhCrVWjOjQbfvhhHHYd7A/qni++0SyLKNphEmbSCPPYFdEL+Ig4wHeFcWUu
	znmST8IYaSYhPkr8Hc5SzVf1OpIxaKLYejOxmZBbY5XDAxwuM34ULrn3DZytiHVPqmrzBtsgsOq
	cAIWSkCKqYcgF75E22dDBXBC6ID/vbtwCH7Unljf4XgBMlAo+ELg5z1HGtdneJWnjAKn9MWyNO+
	oT8b5OM+d0ZlqipaBJwA==
X-Google-Smtp-Source: AGHT+IFxVCj+6pSy9hStSqTpeefclfuRbct8Rv0Y0zIFkixRFRAa7ymFxjKwf22ed5nDtDmwqAJI4Q==
X-Received: by 2002:a05:6000:4203:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3b7766818c0mr7511242f8f.54.1753703371835;
        Mon, 28 Jul 2025 04:49:31 -0700 (PDT)
Message-ID: <15a4daca-a07d-4519-8e80-d981a9a2343a@suse.com>
Date: Mon, 28 Jul 2025 13:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
 <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
 <958ae1b0-d139-41e8-b965-43ce640569c5@gmail.com>
 <007654f3-e26b-43b1-bc81-40ba25c9d787@suse.com>
 <ca3467a2-c795-4709-ad92-1744b138a148@gmail.com>
 <9e9c1943-b2af-471f-b8c9-f7179073ef99@suse.com>
 <fb7176a2-740e-4773-b1cb-3cd430d6f838@gmail.com>
 <f110cd42-d34b-44fc-bd76-85cb0bfc2357@gmail.com>
 <25f17da6-1c82-422c-941a-b0eb57786c8f@suse.com>
 <342e8524-268c-46ae-817c-5af71254b624@gmail.com>
 <7ba83171-a377-4c3d-a33b-7edb57621bb7@suse.com>
 <dabc1c47-f392-4fc1-9f84-36c880c6dd63@gmail.com>
 <170d6cc9-542e-4129-b3bb-bf9ea0844bc4@suse.com>
 <78488064-694a-4020-8c08-7b12184b8669@gmail.com>
 <7d789e2d-19c1-443e-a319-ad230f5f9ebd@suse.com>
 <e9ac761d-dc12-43b5-8d67-984f3938817d@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <e9ac761d-dc12-43b5-8d67-984f3938817d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 13:37, Oleksii Kurochko wrote:
> 
> On 7/28/25 11:09 AM, Jan Beulich wrote:
>> On 28.07.2025 10:52, Oleksii Kurochko wrote:
>>> On 7/23/25 11:46 AM, Jan Beulich wrote:
>>>>> I assume that I have in this case to take some pages for an intermediate page
>>>>> table from freelist P2M pool, set an owner domain to NULL (pg->inuse.domain = NULL).
>>>>>
>>>>> Then in this case it isn't clear why pg->list can't be re-used to link several pages
>>>>> for intermediate page table purposes + metadata? Is it because pg->list can be not
>>>>> empty? In this case it isn't clear if I could use a page, which has threaded pages.
>>>> Actually looks like I was mis-remembering. Pages removed from freelist indeed
>>>> aren't put on any other list, so the linking fields are available for use. I
>>>> guess I had x86 shadow code in mind, where the linking fields are further used.
>>> Perhaps, I misunderstood you about "linking fields", but it seems like I can't reuse
>>> struct page_info->list as it is used by page_list_add() which is called by p2m_alloc_page()
>>> to allocate page(s) for an intermediate page table:
>>>      static inline void
>>>      page_list_add(struct page_info *page, struct page_list_head *head)
>>>      {
>>>           list_add(&page->list, head);
>>>      }
>>>
>>>       struct page_info * paging_alloc_page(struct domain *d)
>>>       {
>>>           struct page_info *pg;
>>>
>>>           spin_lock(&d->arch.paging.lock);
>>>           pg = page_list_remove_head(&d->arch.paging.freelist);
>>>           spin_unlock(&d->arch.paging.lock);
>>>
>>>           INIT_LIST_HEAD(&pg->list);
>>>
>>>           return pg;
>>>       }
>>>
>>>       static struct page_info *p2m_alloc_page(struct domain *d)
>>>       {
>>>           struct page_info *pg = paging_alloc_page(d);
>>>
>>>           if ( pg )
>>>               page_list_add(pg, &p2m_get_hostp2m(d)->pages);
>>>
>>>           return pg;
>>>       }
>>>
>>> So I have to reuse another field from struct page_info. It seems like it won't be an
>>> issue if to add a new struct page_list_entry metadata_list to 'union v':
>>>       union {
>>>           /* Page is in use */
>>>           struct {
>>>               /* Owner of this page (NULL if page is anonymous). */
>>>               struct domain *domain;
>>>           } inuse;
>>>
>>>           /* Page is on a free list. */
>>>           struct {
>>>               /* Order-size of the free chunk this page is the head of. */
>>>               unsigned int order;
>>>           } free;
>>> +
>>> +       struct page_list_entry metadata_list;
>>>       } v;
>>>
>>> Am I missing something?
>> Well, you're doubling the size of that union then, aren't you? As was mentioned
>> quite some time ago, struct page_info needs quite a bit of care when you mean
>> to add new fields there. Question is whether for the purpose here you actually
>> need a doubly-linked list. A single pointer would be fine to put there.
> 
> Agree, a single pointer will be more then enough.
> 
> I'm thinking if it is possible to do something with the case if someone will try
> to use:
>    #define page_get_owner(p)    (p)->v.inuse.domain
> for a page which was allocated for metadata storage. Shouldn't I have a separate
> list for such pages and a macro which will check if a page is in this list?
> Similar a list which we have for p2m pages in struct p2m_domain:
>      ...
>      /* Pages used to construct the p2m */
>      struct page_list_head pages;
>      ...
> 
> Of course, such pages are allocated by alloc_domheap_page(d, MEMF_no_owner),
> so there is no owner. But if someone will accidentally use this macro for such
> pages then it will be an issue as ->domain likely won't be a NULL anymore.

It's the nature of using unions that such a risk exists. Take a look at x86'es
structure, where several of the fields are re-purposed for shadow pages. It's
something similar you'd do here, in the end.

Jan

