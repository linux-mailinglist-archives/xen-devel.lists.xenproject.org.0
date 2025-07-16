Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672AFB074D1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 13:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045082.1415154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0MP-0007Ts-9a; Wed, 16 Jul 2025 11:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045082.1415154; Wed, 16 Jul 2025 11:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0MP-0007Rs-6s; Wed, 16 Jul 2025 11:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1045082;
 Wed, 16 Jul 2025 11:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc0MN-0007Rk-Bu
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 11:31:39 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fa0065-6238-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 13:31:25 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so42390325e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 04:31:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-75619f92f63sm2747481b3a.22.2025.07.16.04.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 04:31:23 -0700 (PDT)
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
X-Inumbo-ID: 67fa0065-6238-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752665484; x=1753270284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h6hxFq7maPzCq30HemaYrhZDc2YNT2cDLgQNJUWcSak=;
        b=b9vj1ZQmzxc2hU9QtQQ1NxNWk4aeN0MqLHODhY77i+BR/D1riTSF8SNIvtvMmZme43
         Zg1QBSvZ8PTWgxUIlF0x+oJEyOPurC1J9YxZbjltoqJqB7wUXansn1mQZ4WcSvFYvPR1
         z5KmK2fXrmsnBrgpAgInVqoaCNEKvqYkAu3P7lprgtMrMqc94THFVPggE1P/ZaML3akZ
         zpU3BieHC1OPAJuPad21LuU9dg91ZmQIZQoWzA2BC1IxuOXNbPcRvTuPyu1fadYSab4Z
         EbZLktjAaVqfKxdEhS+NmI21E/6gehh1Wjpy4jCWeil88rydfVbkU5KJ7InxL98F2+WB
         bomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665484; x=1753270284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6hxFq7maPzCq30HemaYrhZDc2YNT2cDLgQNJUWcSak=;
        b=vlCsgBL0AcBSEylaoItHyxb+B+HZseUWrAKMEU32XTud2F49R3MMNJYyQG+MGnO5nR
         GM0BboDok3R/2jFI6QDp4Ti9LCK7ji7afwzHYi/3Cv8KyXdqrqT5SZEBqR/AAxMxuGD2
         LeyCy8SFFJJAQy1lcEuJGxTzcbsQJCe7IYPIpfTY5jYNR+pyJYr1mlDJDhOGm1HXTv7+
         +MaRjg7B2wH7sqEKjWGT1e1Pq7hVKy6RV9lx/fpXp6FYn/fiM2KLIIF6Fv8wlsll7DIC
         FFpM8QmvMR5ebSu0SShD8Vj+2n94swbZtw1QwFKxKPKKU1QG67kx5KjsoJzto1ywKrqf
         JZfg==
X-Forwarded-Encrypted: i=1; AJvYcCUMREkv3ansN7sGCIPRb9DXpEAapEdXoCMtnayUw+wtsnnLigg8nQSDmCnlBmmOzPNZ6mszdEOfXbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx96s498t3qjeMD5zmtYQ00X5w9/UWOWolpmuYLsXSZzkcHVaxT
	C00xrmBnyYDuV3fVWS2fvP4gQLx2oZ7m8kec5F4ZDLCBf7OfeMUlxLbxMYKUSFhWZw==
X-Gm-Gg: ASbGnctM1xf9Je0Hxukv3DF0ZYVEvrirIrQcWX4S8Un01Lff1JgP4/p6cP5Jo3VcgXc
	k9T/TuWbY7GBC/tSrHCNpl+ccvmBbVvbH3eximUXBJUpNvugv+AdM+CgHLFt2oDxxnM5F5wXaFf
	6z87NyjphSgTEa2WvRuNIe50dP5KxRM2/UZON87x6Ul+Is8u/cjtl9z/Nu6gX8gBNj5JvVdKx/y
	jp28g/l9bqS+hBRyCtyefqr6T3xc3cwbbXu3ZqePLlYNnEGNzrwqc725T54bzazMIkR0nQkex/s
	9Nl6frVEHr8KIasLOdrxcZ6nXe7kNha4PgAQP84QMUa4yzyltz35UOMAGKMImoMhfuE/EjKgFR1
	oahpyEcNH3nd4YlFuBLxNWqPlyqltM3rF1+rKuFBeEVfOYWLKmvlJ2ejPpe0ubn9TIBTAc1vh5Y
	CdoaaeEPU=
X-Google-Smtp-Source: AGHT+IF3zSiMmxFZXBNozijM2lwcq+pcsR8uVqJ2SggnCO7HyoCGLld7iCX9vYK7mg1Ujy32qy/Clw==
X-Received: by 2002:a5d:584e:0:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3b60e523551mr1436077f8f.50.1752665484482;
        Wed, 16 Jul 2025 04:31:24 -0700 (PDT)
Message-ID: <0265e61a-ad08-4b6b-a87d-dba304f6d27d@suse.com>
Date: Wed, 16 Jul 2025 13:31:12 +0200
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
In-Reply-To: <640178f8-a189-4f84-abff-0ef87ba566a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 16:47, Oleksii Kurochko wrote:
> On 7/1/25 5:08 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>>>       return __map_domain_page(p2m->root + root_table_indx);
>>>   }
>>>   
>>> +static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
>> See comments on the earlier patch regarding naming.
>>
>>> +{
>>> +    int rc;
>>> +    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
>> How does this work, when you record GFNs only for Xenheap pages?
> 
> I think I don't understand what is an issue. Could you please provide
> some extra details?

Counter question: The mfn_to_gfn() you currently have is only a stub. It only
works for 1:1 mapped domains. Can you show me the eventual final implementation
of the function, making it possible to use it here? Having such stubs, and not
even annotated in any way, is imo a problem: People may thing they're fine to
use when really they aren't.

>>> +static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
>>> +{
>>> +    pte_t e = (pte_t) { 1 };
>> What's the 1 doing here?
> 
> Set valid bit of PTE to 1.

But something like this isn't to be done using a plain, unannotated literal
number. Aiui you mean PTE_VALID here.

>>> +    switch ( t )
>>> +    {
>>> +    case p2m_mmio_direct_dev:
>>> +        e.pte |= PTE_PBMT_IO;
>>> +        break;
>>> +
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    p2m_set_permission(&e, t, a);
>>> +
>>> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
>>> +
>>> +    pte_set_mfn(&e, mfn);
>> Based on how things work on x86 (and how I would have expected them to also
>> work on Arm), may I suggest that you set MFN ahead of permissions, so that
>> the permissions setting function can use the MFN for e.g. a lookup in
>> mmio_ro_ranges.
> 
> Sure, just a note that on Arm, the MFN is set last.

That's apparently because they (still) don't have mmio_ro_ranges. That's only
a latent issue (I hope) while they still don't have PCI support.

>>> +    BUG_ON(p2m_type_radix_set(p2m, e, t));
>> I'm not convinced of this error handling here either. Radix tree insertion
>> _can_ fail, e.g. when there's no memory left. This must not bring down Xen,
>> or we'll have an XSA right away. You could zap the PTE, or if need be you
>> could crash the offending domain.
> 
> IIUC what is "zap the PTE", then I will do in this way:
>      if ( p2m_set_type(p2m, e, t) )
>          e.pte = 0;
> 
> But then it will lead to an MMU failure—how is that expected to be handled?
> There’s no guarantee that, at the moment of handling this exception, enough
> memory will be available to set a type for the PTE and also there is not really
> clear how to detect in exception handler that it is needed just to re-try to
> set a type. Or should we just call|domain_crash()|?
> In that case, it seems more reasonable to call|domain_crash() |immediately in
> |p2m_pte_from_mfn().|

As said - crashing the domain in such an event is an option. The question
here is whether to do so right away, or whether to defer that in the hope
that the PTE may not actually be accessed (before being rewritten).

>> In this context (not sure if I asked before): With this use of a radix tree,
>> how do you intend to bound the amount of memory that a domain can use, by
>> making Xen insert very many entries?
> 
> I didn’t think about that. I assumed it would be enough to set the amount of
> memory a guest domain can use by specifying|xen,domain-p2m-mem-mb| in the DTS,
> or using some predefined value if|xen,domain-p2m-mem-mb| isn’t explicitly set.

Which would require these allocations to come from that pool.

> Also, it seems this would just lead to the issue you mentioned earlier: when
> the memory runs out,|domain_crash()| will be called or PTE will be zapped.

Or one domain exhausting memory would cause another domain to fail. A domain
impacting just itself may be tolerable. But a domain affecting other domains
isn't.

Jan

