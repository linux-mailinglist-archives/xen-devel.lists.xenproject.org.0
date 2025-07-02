Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE95AF1613
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031082.1404791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwuV-0002Pn-13; Wed, 02 Jul 2025 12:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031082.1404791; Wed, 02 Jul 2025 12:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwuU-0002Mz-UG; Wed, 02 Jul 2025 12:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1031082;
 Wed, 02 Jul 2025 12:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwuT-0002Mt-Sl
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:49:57 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e8d6053-5743-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:49:56 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-453608ed113so44489785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:49:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5571ba9sm14246311b3a.75.2025.07.02.05.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:49:55 -0700 (PDT)
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
X-Inumbo-ID: 0e8d6053-5743-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751460596; x=1752065396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jeRrYbH4d8wIUoviP+6U4X2ANUq+sy3Iql1P8mr1wbo=;
        b=dKerdDkTmSWqr6UbnnnOKYkPbPmASfCiu68Ve+fEvvrya+pPjThT4Oy9QJXjuv/0g4
         nC+47c4D5ipG29YDAqFJscBV9mOWSqlvyyzfKgZaBaoeqETQl2fgdG5Mh3zbKkLe9wlg
         iFlPxKgs8wiTwQpyeZrXF3lomHV8RsD0Dg9a76cKlAVjL+5qB82m7qvIBhLIoQrVDDec
         QQtU3UQ39Pl6xZlXcHpMf68caj7e/X7NYlljeIkA6xwYHIAjKvm6r1E1d2UHeCUy0lEJ
         WZPpSe/LHgZQuBTJgrSFwWp57otyPw0GzfhbaoBq5erwL7zYH2S8NF8NJ0LSpyxvngxC
         3WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460596; x=1752065396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeRrYbH4d8wIUoviP+6U4X2ANUq+sy3Iql1P8mr1wbo=;
        b=eN2MZxX2NQOYLphmlJmYYamlUJPYVlbgAlNSxtL4JSSGSt3/n/7i5w9N79vWA+xgSd
         glu70K68gw+izhrDCYXiwC8iTsZ26U/vN/+eOcNudQtMK4A/rTRzjHcbKKN1EhSYkW0V
         lrOvorxA0tviMOMukLLhGdCbCXQq5JztmqanrLB92RfkMmaXXBwLOicD0LNTuvs+z/US
         v4us/E2Gzq0FFoESxSOC4b+f9Dv33tmqmrQGEGDMLMfo1chkcaa97KjwDsaX20AaoepA
         /dH4qPASQthcVCrz94+CmKHXbhqfBP1WJDnQqYLb7qnTSu087mtSck9QPWJHbOBRdq0J
         jMHg==
X-Forwarded-Encrypted: i=1; AJvYcCVbZBrPCEvfy3t9dpmL4phF/i4o/9kJpnCApMMphSXtCwcuQExXLTCWx4JFcgLJp2kn/MsbqzWEKzo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT+jtuoR8mVeK8TP373KhJv404mHAnEFvIJQKc/qm5zFm8ffEu
	DavcfBdOP/wDF/HSUp0BTFLJRZO7DribAvUpy6Q2vY3k9qq8/Q6qD/3XsC5GoiHDbw==
X-Gm-Gg: ASbGncsH0fl9cQ+L6pxC9CZagUu5B4Zr7GN/7wZ9nXZdzIbABaRn8dmd9qz10inNTm+
	HifKcjQBkdu/dUbBRKD2yC/p6zosRYjynkt4RjR3pRuikih1EZgOPcLC00khuuqR0gtVJgBEv9z
	6itmDgeSyicgSv0cuXL5f1wD79vUvW+6aUcw8zl1Whl3VTAeFszU0Oe32zYyruxEw0vNpqRS4g+
	Ak1VQsWqtkpKd31gsxX37rtEGfy57BOYc6i59TXS2oSH5PZfVOaBTs4NBhqcA93NygWP/XwoROv
	7EDpVZQsIxwv1yRlSOAxL+n6i8K65rux/UG3Xt0NgyCuEWZqpzwWsEEI4dCQumBrXQB2fjOw3L7
	jhA4IA1ux+t8Q+iflWCBhGLKgkJfcCL75xUF89QhMqkN4oN5rEsBIfQ1Hsg==
X-Google-Smtp-Source: AGHT+IENTv2SjYuHaPsH796vCVEfRmcCBZeCk9R3IXTSWvZaDTAnHzE67/ZZFFZD0yr3LdCQT8tIgQ==
X-Received: by 2002:a05:6000:220b:b0:3a4:efbb:6df3 with SMTP id ffacd0b85a97d-3b1fdf02731mr2083754f8f.10.1751460596050;
        Wed, 02 Jul 2025 05:49:56 -0700 (PDT)
Message-ID: <45034558-8218-49fc-b946-7e40bf17728f@suse.com>
Date: Wed, 2 Jul 2025 14:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
 <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>
 <564d3ea1-d79a-490f-a756-78a55b2befda@gmail.com>
 <cef99e20-7585-4de7-84fb-a17bd1bd9a1a@suse.com>
 <71c8627b-6a43-457b-964f-4fa5269f2dba@gmail.com>
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
In-Reply-To: <71c8627b-6a43-457b-964f-4fa5269f2dba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 14:34, Oleksii Kurochko wrote:
> 
> On 7/2/25 1:56 PM, Jan Beulich wrote:
>> On 02.07.2025 13:48, Oleksii Kurochko wrote:
>>> On 7/1/25 3:04 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
>>>>>    
>>>>>        return 0;
>>>>>    }
>>>>> +
>>>>> +/*
>>>>> + * Set the pool of pages to the required number of pages.
>>>>> + * Returns 0 for success, non-zero for failure.
>>>>> + * Call with d->arch.paging.lock held.
>>>>> + */
>>>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>>> +{
>>>>> +    struct page_info *pg;
>>>>> +
>>>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>>>> +
>>>>> +    for ( ; ; )
>>>>> +    {
>>>>> +        if ( d->arch.paging.p2m_total_pages < pages )
>>>>> +        {
>>>>> +            /* Need to allocate more memory from domheap */
>>>>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>>>>> +            if ( pg == NULL )
>>>>> +            {
>>>>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>>>> +                return -ENOMEM;
>>>>> +            }
>>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>>>> +        }
>>>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>>>> +        {
>>>>> +            /* Need to return memory to domheap */
>>>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>>> +            if( pg )
>>>>> +            {
>>>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>>>> +                free_domheap_page(pg);
>>>>> +            }
>>>>> +            else
>>>>> +            {
>>>>> +                printk(XENLOG_ERR
>>>>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>>>>> +                return -ENOMEM;
>>>>> +            }
>>>>> +        }
>>>>> +        else
>>>>> +            break;
>>>>> +
>>>>> +        /* Check to see if we need to yield and try again */
>>>>> +        if ( preempted && general_preempt_check() )
>>>>> +        {
>>>>> +            *preempted = true;
>>>>> +            return -ERESTART;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>> Btw, with the order-2 requirement for the root page table, you may want to
>>>> consider an alternative approach: Here you could allocate some order-2
>>>> pages (possibly up to as many as a domain might need, which right now
>>>> would be exactly one), put them on a separate list, and consume the root
>>>> table(s) from there. If you run out of pages on the order-0 list, you
>>>> could shatter a page from the order-2 one (as long as that's still non-
>>>> empty). The difficulty would be with freeing, where a previously shattered
>>>> order-2 page would be nice to re-combine once all of its constituents are
>>>> free again.
>>> Do we really need to re-combine shattered order-2 pages?
>>> It seems like the only usage for this order-2-list is to have 1 order-2 page
>>> for root page table. All other pages are 4k pages so even if we won't re-combine
>>> them, nothing serious will happen.
>> That's true as long as you have only the host-P2M for each domain. Once you
>> have alternative or nested ones, things may change (unless they all have
>> their roots also set up right during domain creation, which would seem
>> wasteful to me).
> 
> I don't know how it is implemented on x86, but I thought that if it is needed alternative
> or nested P2Ms then it is needed to provide separated from host-P2M page tables (root page
> table including).

Correct, hence why you will then need to allocate multiple root tables.
Those secondary page tables are nevertheless all allocated from the
single pool that a domain has.

Jan

