Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C737B2101C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077790.1438816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUjq-0004ob-UD; Mon, 11 Aug 2025 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077790.1438816; Mon, 11 Aug 2025 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUjq-0004ly-RB; Mon, 11 Aug 2025 15:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1077790;
 Mon, 11 Aug 2025 15:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulUjp-0004ls-SN
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:47:05 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d2cff41-76ca-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 17:47:03 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af9842df867so799372766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:47:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0def2esm2013596066b.61.2025.08.11.08.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:47:02 -0700 (PDT)
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
X-Inumbo-ID: 6d2cff41-76ca-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754927223; x=1755532023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J+wb/td4JhJuyVEFvzeq3FHG3ZbRKFYDmMBUUGIvXb8=;
        b=STPB9NLYaFzkps9Wz5f3uka9hKXcSwW/yIIDy7m16sLQrBiF5j49u3ZT181f3IkQas
         VhVPdIUX45tzjHJVKI4FW64u5O/wRnPeDH+V45Via8HRcVdg3rNpCMq2WDBKGTqBhzZr
         FVubQjY2NFQYGfytxS2XXX/5zNXphvtgqTBKsXGx7aC75dH08joYNFvTtgtzKKis5qUq
         gTbccwyOdcshkpTiFI3NAi26DKIDKzsTkH/lZooqJ/qzvQe0MUJoZG9MfV/Qj8yG4Ki0
         VpwfWe6g5V81cNmEv5Q8Xmj6ZujT5oYRIjSLFUh7zhQi5JATdcAw9zr3XFrcTGRozP/H
         TARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927223; x=1755532023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+wb/td4JhJuyVEFvzeq3FHG3ZbRKFYDmMBUUGIvXb8=;
        b=UoOgmC1Kp9lHif+b/iFVBZu9S/IeiwjnD5TjdN8klraWh0MVRNniVqtBWkGYQTtvyW
         fhXtwEUBk3qZpE13GzHn+arrq2EenWDaqyNL6Pk6YSFqMjvcuVWBiS5LLlbjsfcCph8i
         1btJtSWury5z4bEejxRqwCYG9O+jHGA1lE8rgHgvH9AX7sWN7bq+EMfHHaogzGKA9nle
         z8JeFktQq7HhN5ckocJ/EvcUtDBo6HV35wzr3KSH8bJJ04LdEyqylfwS800VxURxX4K9
         5TAAnvPdfWaIgNuH+7O6D2+ayDPEPYyDEaemSJbQ/3Mpw9Em8NmPFEmmByezcVFFL2eZ
         h4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUze0ILL3WFobFCsgqVWVPonjZPWqYNFDEtYrWGokueb0DCqFHfSvI3S4p0ccnZ9/kE5zYhWzSyPfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQq8YIr57PIc1iBQQxGAg1R1pKNOPMFAo6nbcgmdofcqxtzRnf
	JkoD0DdsZPm/OByH+fvWkLolb6CUPdgSFrOlgIMdJUrDuntVXo6SQdV8cV3hrrRZfg==
X-Gm-Gg: ASbGncsVwyI/6ShSjKeTYAdcAPxFv7m7tbZIRDWd8w4+de8COnLtKNMPAEjtAFMzJG/
	1RI7CEAthB/XpDkhJ6xbgjrqSo/sJuOXj+7LIj3SSSnzNO4mb0bnYeQRUwfnvx8MkiQAvtrI9Gp
	26iNI4TAx9f8KV9d/dq1CMd6aZ7ZvZjZedPUHtN6ED1ta/NCHB9Gi1T0avrYlFXYtyPVuLCPY0z
	Hx5zdbJC6orq3ReZl3rE08ZtI295oV+DtQsDRhamnlXxbm9PsFuyw9fVFJ4u9URYdutheYdP+Vx
	75zOK+0umfBGXCDS7USWsDun06BNk+cBS8Hd1+CVf51DgIfLN2GAB+/cxDCM9rxNxPAcYaV0Luf
	GSlhv0mhvmAx6GclickP85w35fZnSfAlQ9SRXCyvGBhmyL0qHdONLTE4R1fl560lo3FFe5kfwJQ
	L1qPTAZ/U=
X-Google-Smtp-Source: AGHT+IGAGJ0FUUZlwLiexK0qUSyWd33aYpaD0tfx1PXazTAfpcVeKfqHfua3V+Apg10ix9SiL2m8Qg==
X-Received: by 2002:a17:907:3c88:b0:af9:237c:bb1c with SMTP id a640c23a62f3a-af9c64f446bmr1413573266b.43.1754927223094;
        Mon, 11 Aug 2025 08:47:03 -0700 (PDT)
Message-ID: <0727aadc-d434-4005-be93-4893e47fab6e@suse.com>
Date: Mon, 11 Aug 2025 17:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/20] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <6890f77e577493194ea94834989dc0841d18eed0.1753973161.git.oleksii.kurochko@gmail.com>
 <cc0fd91c-2dd1-4094-997a-87856f6cd914@suse.com>
 <adc9689b-a3e2-47fb-a8ed-6481371c751d@gmail.com>
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
In-Reply-To: <adc9689b-a3e2-47fb-a8ed-6481371c751d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 17:19, Oleksii Kurochko wrote:
> On 8/11/25 1:59 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -539,6 +539,91 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
>>>       p2m_free_page(p2m, pg);
>>>   }
>>>   
>>> +static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>>> +                                unsigned int level, unsigned int target,
>>> +                                const unsigned int *offsets)
>>> +{
>>> +    struct page_info *page;
>>> +    unsigned long i;
>>> +    pte_t pte, *table;
>>> +    bool rv = true;
>>> +
>>> +    /* Convenience aliases */
>>> +    mfn_t mfn = pte_get_mfn(*entry);
>>> +    unsigned int next_level = level - 1;
>>> +    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
>>> +
>>> +    /*
>>> +     * This should only be called with target != level and the entry is
>>> +     * a superpage.
>>> +     */
>>> +    ASSERT(level > target);
>>> +    ASSERT(pte_is_superpage(*entry, level));
>>> +
>>> +    page = p2m_alloc_page(p2m->domain);
>>> +    if ( !page )
>>> +    {
>>> +        /*
>>> +         * The caller is in charge to free the sub-tree.
>>> +         * As we didn't manage to allocate anything, just tell the
>>> +         * caller there is nothing to free by invalidating the PTE.
>>> +         */
>>> +        memset(entry, 0, sizeof(*entry));
>>> +        return false;
>>> +    }
>>> +
>>> +    table = __map_domain_page(page);
>>> +
>>> +    /*
>>> +     * We are either splitting a second level 1G page into 512 first level
>>> +     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
>>> +     */
>> Such a comment is at risk of (silently) going stale when support for 512G
>> mappings is added. I wonder if it's really that informative to have here.
> 
> Good point, I think we could really drop it.
> Regarding support for 512G mappings. Is it really make sense to support
> such big mappings?

I think so, yes (in the longer run). And yes, ...

> It seems like some operations as splitting or sub-entry
> freeing could be pretty long under some circumstances.

... such will need sorting.

Jan

