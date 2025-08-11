Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B56B207FF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077500.1438557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQpQ-0005ul-GM; Mon, 11 Aug 2025 11:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077500.1438557; Mon, 11 Aug 2025 11:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQpQ-0005rd-D8; Mon, 11 Aug 2025 11:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1077500;
 Mon, 11 Aug 2025 11:36:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQpO-0005rX-7l
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:36:34 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d8de603-76a7-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:36:31 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-af95525bac4so762583466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:36:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07659dsm1990757566b.21.2025.08.11.04.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:36:29 -0700 (PDT)
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
X-Inumbo-ID: 6d8de603-76a7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754912191; x=1755516991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XPDykFm7ig9ojixPgGFnVK8vToDaGfT56W5dWqqo6aQ=;
        b=e30nGKu0OC0TqW/gSfFPhyF7iAKWP+7Lrwl1GSrBg3QYkY9aqT+rxcK46xAzvEU2i8
         7Vo/LtixYitYfROF0MVzfQ53AqfeJTEKCy5UlAbZna9nd5PwnS4UQRa4MYiEi5vHig7h
         zIRU884IXnZ/kOxz5EVscMCR6TPI8NKT9o6rmxVdocUDmF+mrPmlY/j4Wfn1vMIERGtU
         tD+tFpnJg+l3Ptx8QIKDhOSvxhV/6hsggztW+6qm9eWLaGYtoYrpVBxs5Itjc+ePhLAc
         yGMS5BQe5+TCy8cDFxsSTbs4LZjji09YRHHsU4PESbII4Y7AXTmumz5yFn2EsBfZ4Jag
         kaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912191; x=1755516991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPDykFm7ig9ojixPgGFnVK8vToDaGfT56W5dWqqo6aQ=;
        b=t+wx4CcFCRDU69Z+llY0flY0ixPgXZZCa/cLQoIMKLDNMqsova6CRYSe1C+S08LLfX
         SrqDam5SMt/Wj+iAKbEZXk7QuASQqkW03QgSwFRM1MVtX47wXhDgvP9R3g1ckjzWAJap
         3V2UsnP71+MwZYxxJtDHlStywu4LbWJH4bPsPqlFt+sSdk09//LQymR1OOmAok59BxtL
         LEc8/ejICXaPcridKDmM7f3dVPnoIt68g5afZdqmtMGtr4UIVTgh/JGUzUWVpSBZhe+6
         S6neQz09Nu5xU/X9F34tp+nI+tZGtyCvMJzAJxX2bM+EsMFFNtubc/uKWFr2TrmBdcyl
         nQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64z2oAdhCLd7chYO1DNM5z7eqQjlyf6l+RXdVs9VkU+x9/Mz17yyGw9997NTYbgaIUPHlSjsJpUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZZ56R+Vsw0S5OpS0HVkxVCx4KmRel3Vj5/qBjDQXiNBTyMwf9
	fgoWOAqLRm6u/Do2ZGPzXzRG2RbJ7rteLfxhHXT95BW9u3oIhMfAIZKiHIaWi48FBn8rOdnWx2s
	dW84=
X-Gm-Gg: ASbGnct91USDa2ghWc/P17E+qutMzT8COYw5K6+fVvF+SM3CrFRGUjsbcpxMCBM7c3d
	kaTbZ5VMKhFHrssr2tblNpjLXRVTvvl4U0IcOBc8e53hBlQycIAsCSd1hRLBWND1ibL1/tiQdws
	uqo59IVjko1KRaQPf9TP0T1qy4os5OWy2oeaTC9WijBYdd8ovFqbtHqN3sTn7/6dLWaEf9b92xP
	sYn7l0h0wCgqSM7z8s4qRxaYN2lQTWpj+Bwy/8xLq1p//5uGAeE4hfoSaFOJP54dZA2vSS8kc9Z
	g1Y798r4lFLAE5jbhreTwy2MMqAQohZIwbu7LxLlDoLCBh7IbMm0CMSyylwrLC0OGKGVCMRKg73
	xMf3pGFDZlaCRRBRYZsycd+FTngFP2BbzQ6D5qaJU6fRqi8ZgZvXTz2vD/s1JjuCrxCNFNJLVoR
	p9lzVooHw=
X-Google-Smtp-Source: AGHT+IGD3zOL2Ex7TbX2SnV02P5tUAtglVdOjmzTodiqgxNGGdZ7PaPQKiMWF6tkX0/6Ljf+lrXY1Q==
X-Received: by 2002:a17:907:972a:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-af9c645b793mr1065087466b.22.1754912191299;
        Mon, 11 Aug 2025 04:36:31 -0700 (PDT)
Message-ID: <3ede10e7-8e43-4277-9197-14a3e5ab1cc1@suse.com>
Date: Mon, 11 Aug 2025 13:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/20] xen/riscv: Implement p2m_pte_from_mfn() and
 support PBMT configuration
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <1370613cd6f52e90591b15ad52c95d7c81908cf6.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1370613cd6f52e90591b15ad52c95d7c81908cf6.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1,3 +1,4 @@
> +#include <xen/bug.h>
>  #include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/rwlock.h>
> @@ -197,6 +198,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> +static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +{
> +    int rc = 0;
> +
> +    if ( t > p2m_ext_storage )

Seeing this separator enumerator in use, it becomes pretty clear that its name
needs to change, so one doesn't need to go look at its definition to understand
whether it's inclusive or exclusive. (This isn't helped by there presently being
a spare entry, which, when made use of, might then cause problems with
expressions like this one as well.)

> @@ -222,11 +235,71 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
>      p2m_write_pte(p, pte, clean_pte);
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
> +static void p2m_set_permission(pte_t *e, p2m_type_t t)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    e->pte &= ~PTE_ACCESS_MASK;
> +
> +    switch ( t )
> +    {
> +    case p2m_grant_map_rw:
> +    case p2m_ram_rw:
> +        e->pte |= PTE_READABLE | PTE_WRITABLE;
> +        break;

While I agree for r/w grants, shouldn't r/w RAM also be executable?

> +    case p2m_ext_storage:

Why exactly would this placeholder ...

> +    case p2m_mmio_direct_io:
> +        e->pte |= PTE_ACCESS_MASK;
> +        break;

... gain full access? It shouldn't make it here at all, should it?

> +
> +    case p2m_invalid:
> +        e->pte &= ~(PTE_ACCESS_MASK | PTE_VALID);

Redundantly masking off PTE_ACCESS_MASK? (Plus, for the entry to be
invalid, turning off PTE_VALID alone ought to suffice anyway?)

> +        break;
> +
> +    case p2m_grant_map_ro:
> +        e->pte |= PTE_READABLE;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +}
> +
> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +{
> +    pte_t e = (pte_t) { PTE_VALID };

This and the rest of the function demand that mfn != INVALID_MFN, no matter
whether ...

> +    switch ( t )
> +    {
> +    case p2m_mmio_direct_io:
> +        e.pte |= PTE_PBMT_IO;
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    pte_set_mfn(&e, mfn);
> +
> +    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));

... PADDR_MASK is actually narrow enough to catch that case. Maybe best to
add an explicit assertion to that effect?

> +    if ( !is_table )
> +    {
> +        p2m_set_permission(&e, t);
> +
> +        if ( t < p2m_ext_storage )
> +            p2m_set_type(&e, t);
> +        else
> +            panic("unimplemeted\n");

The check is already done inside p2m_set_type() - why open-code it here?

Jan

