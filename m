Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B7B07AF3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045476.1415595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4qA-0006Qg-8A; Wed, 16 Jul 2025 16:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045476.1415595; Wed, 16 Jul 2025 16:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4qA-0006OV-4x; Wed, 16 Jul 2025 16:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1045476;
 Wed, 16 Jul 2025 16:18:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4q8-0006OI-HY
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:18:40 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87fabebb-6260-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:18:38 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so18550f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:18:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4322b2dsm129653155ad.92.2025.07.16.09.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:18:37 -0700 (PDT)
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
X-Inumbo-ID: 87fabebb-6260-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752682718; x=1753287518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0FiZ9+4d8MN3OAHt2JjrA5my30p4ZgMlQWu8i6F+yoM=;
        b=Rdmcu7+nJkOFeD8etUy28BqIQR7b6QEPJ/A8azGq6PHU0YSgWtuWTld66pdUskHvNb
         it6z9Djc74wrwjfzy44jo6+HjRYCEpTpB8ujULga/lnBTpwsLx9kqhpRD4PyHFLBGWYT
         slw9ygxUbm+y0ey9Yop6V23tucZ0yg6B7HOw38HLQ0zBxoOZwuoFNokFIWuJ6DcdufRM
         aLNT8UM/WiQSLFMp3CJoAo5QToTCWQbnXzoGUnq6tz/ItNWjCOwr4gcvQznBCUpvkzjI
         U8Ri0UyP+znqcrcGkKtsV6wOl+sIawFwh2gFzERtq11wEG8GH6Jg1W+kRtJ30ps5f9WE
         fqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682718; x=1753287518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FiZ9+4d8MN3OAHt2JjrA5my30p4ZgMlQWu8i6F+yoM=;
        b=F1c7anrn++QgSRKroyDmiRLN8wbrNJZQWq/wNge5rfkJw7bixFh0c9kZmNIA8PDR4f
         cC32TGUzjlyRvdgzNBd5QY7plcIEyfK4oEZHQfiM1NCdFoSk21Ue2kHZemCTp6p03o5u
         Phk2LTMhuMmiOdx2tXXLuDW05A/tIQVpIK636JPS3gtFbaNOTil9ahCfKhmCgwfsiKJA
         sPLRgW6k56DOwVyBfVFdEo8uODVG3NU68II+T4uREEupqiQCUdcqN0RSQdw/hQCIsauT
         zq4YXSZ1lEQScccgWEjjD8FGcITvHchrfHAcxIgJCidsxyg9F4Z6dEOjaPUm3qv6YO8x
         s+jg==
X-Forwarded-Encrypted: i=1; AJvYcCW/aaGWimgAHUrjTwsnKBfSydQ33A5iI7uYJ3linXN40yAZipuSWBINinfE1iIMybnBnMrwi7bgSV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzutAhcfO51c4THQXc6HN37bx9hUXqM4TQ5ceqrTWjN0mwuDS6P
	W2RHGQhPpcd79k+jCKQxVAO+N6O9I5dQgjVpqqytweK2PDLCvUpAyt5dlUOk+ucTRw==
X-Gm-Gg: ASbGncuBATPt4MqqFfUuXICfvkWzYfcNZdNxyL2/W0dm/+mqSTdCYQM8q8aaydYWEhW
	y8rBHfoK1wbc7XYsFYZvTODIInejAYLMp3lM2reQb1Csj1/2992SRo9D0/JKAA+9spwoZkUpUpk
	q5fGYLkxDx1yVma2tissFZzk3B261OZCVwWiczAxNjEo+PyssqOdy29+lMh6yCTCXHE3ecdpJWN
	1Jgggz2mdc/xnwRNcI2bPmurHXyAbT+LaNTh/SLKCGrrpLyQ5Z1Xd1n/uMJSUP/xDb5lrIkiUx/
	+zLamq880Bt4J7/SlqSVUKQCfkgIkmOlH5uKlIyp8eO9VpyrncwLkk84x9HzSK+T133QrLoqUnI
	+KVW0BjPjPmCPtv/ylNv/isI1AWY8IpouACpUdPbQ1n/FHimocNNv/38tqObwqHmlKNbZVZYEH8
	SNIl5rdW4=
X-Google-Smtp-Source: AGHT+IF9KtAj0mQ7iUcMluXVapV68yEiMt5DrldDKcYhRMI+ND9C225YUgrXwn27RTXy4SQER6F5IA==
X-Received: by 2002:a05:6000:4006:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3b60e55040fmr3064701f8f.56.1752682718122;
        Wed, 16 Jul 2025 09:18:38 -0700 (PDT)
Message-ID: <15c9cb8e-8452-4dc3-933a-5713fc86a12a@suse.com>
Date: Wed, 16 Jul 2025 18:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
 <f6e789cd-0ef3-488d-94da-1b7c94946720@suse.com>
 <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
 <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
 <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
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
In-Reply-To: <e1c469c3-47d5-4a38-8abd-985a26cb8365@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 18:07, Oleksii Kurochko wrote:
> On 7/16/25 1:31 PM, Jan Beulich wrote:
>> On 15.07.2025 16:47, Oleksii Kurochko wrote:
>>> On 7/1/25 5:08 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>>>        return __map_domain_page(p2m->root + root_table_indx);
>>>>>    }
>>>>>    
>>>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>>>> See comments on the earlier patch regarding naming.
>>>>
>>>>> +{
>>>>> +    int rc;
>>>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>>>> How does this work, when you record GFNs only for Xenheap pages?
> 
> 
>>> I think I don't understand what is an issue. Could you please provide
>>> some extra details?
>> Counter question: The mfn_to_gfn() you currently have is only a stub. It only
>> works for 1:1 mapped domains. Can you show me the eventual final implementation
>> of the function, making it possible to use it here?
> 
> At the moment, I planned to support only 1:1 mapped domains, so it is final
> implementation.

Isn't that on overly severe limitation?

>>>> In this context (not sure if I asked before): With this use of a radix tree,
>>>> how do you intend to bound the amount of memory that a domain can use, by
>>>> making Xen insert very many entries?
>>> I didn’t think about that. I assumed it would be enough to set the amount of
>>> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
>>> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.
>> Which would require these allocations to come from that pool.
> 
> Yes, and it is true only for non-hardware domains with the current implementation.

???

>>> Also, it seems this would just lead to the issue you mentioned earlier: when
>>> the memory runs out,|domain_crash()| will be called or PTE will be zapped.
>> Or one domain exhausting memory would cause another domain to fail. A domain
>> impacting just itself may be tolerable. But a domain affecting other domains
>> isn't.
> 
> But it seems like this issue could happen in any implementation. It won't happen only
> if we will have only pre-populated pool for any domain type (hardware, control, guest
> domain) without ability to extend them or allocate extra pages from domheap in runtime.
> Otherwise, if extra pages allocation is allowed then we can't really do something
> with this issue.

But that's why I brought this up: You simply have to. Or, as indicated, the
moment you mark Xen security-supported on RISC-V, there will be an XSA needed.
This is the kind of thing you need to consider up front. Or at least mark with
a prominent FIXME annotation. All of which would need resolving before even
considering to mark code as supported.

Jan

