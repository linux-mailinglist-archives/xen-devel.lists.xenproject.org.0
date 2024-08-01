Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CCE9449A3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 12:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769561.1180455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTKI-00006p-DY; Thu, 01 Aug 2024 10:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769561.1180455; Thu, 01 Aug 2024 10:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTKI-0008Vt-9t; Thu, 01 Aug 2024 10:46:30 +0000
Received: by outflank-mailman (input) for mailman id 769561;
 Thu, 01 Aug 2024 10:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZTKG-0008Vn-Ot
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 10:46:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e0e1dbd-4ff3-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 12:46:27 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so890472066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 03:46:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7d9fbe215bsm179485966b.59.2024.08.01.03.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 03:46:26 -0700 (PDT)
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
X-Inumbo-ID: 4e0e1dbd-4ff3-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722509187; x=1723113987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfnf2cbvTIxo8WfSAHirmqemjHa941ZgfAsY0pOgQ0M=;
        b=WznavFH54llMCxVduu1EoRoNnfEWqsQxoM1XLeG2NzZJfNaHiVvAKuBjsZH06bHSGv
         A44j3U5ZyS2KuDWX/pcquef5xrnyyTg4k0uw63cFiaAo9ocx4ZFrKH+p85QARur6q0rM
         G6kEyRwuprnqFEugT+9dktbP/2+z8hrASmthcqlT4o+VxAIW4Q3RUFhDnj1wskL6M5ed
         YKFuqDSF9Xv55Rdl8SR0rHmnjR+H6eyGsAAWkJ24SbnNdbxNu20e3C0uJ1wpI5ycWqjZ
         olKTzKtuMkkZgmmXD6MqKSL8s+15+DIA3Pj2qEfcfmf5gPmh5+qG2tX5ascP5+N5TEnJ
         /KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722509187; x=1723113987;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfnf2cbvTIxo8WfSAHirmqemjHa941ZgfAsY0pOgQ0M=;
        b=mvcnL2d2KngJOCFnj/H3nZrFj/Y/J5gvUAl59GVgCLotoBlxXTP08BJJz81fABQUKB
         DCU2hgLA+gdBm4GqLwD8dWikCIVvlHZv5tNxhJvSW6/YsDCdjm5NL3aMZctw7JnNjonQ
         aoudDZo+37oaTijUiujFPFirV0ce6vgaFWAGsdCvg3NO7g0qj4CB5I4c6WJmaZzjvAaF
         Pi1SaTIgS3iMtaPvDJ/NqJoMR7ENX175UW9NeAjqQ1BnEfqdj/TRL2x/MWS/O0FJJGcc
         kYMKqy6E45Du8dR5Xd4apNFXc/YGVDbbinDrDEFRtWdPGMgE9XBfmbEFSbR4J/O+JjCk
         PGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDUUvOkO5XYU1/lGm5sOAe5v9QEXJL0Fzyau92tqQ5p++26yudAyi2LAiEFLhpJfqpMam/cHTWIAyBi1YQyo9I5tT6JWob23sHne1uVUA=
X-Gm-Message-State: AOJu0Ywkfj1YCP0+CGMvp6nS4dvEB4p04Wp4/Jjy0Q47+Htqz4cWw4vu
	59RhZQqeFQqYWAmePDBu2K9YWHraCqYZjrI/Nx9GAKoykvLfK3YRSE+qcqxlDw==
X-Google-Smtp-Source: AGHT+IHrrHSawVa7dVnq8LayCBA0Ed7Dg84j/KqgoGLgAFS7IGeCtIX8RDA+ORXwqW9PTGsK3+U6zA==
X-Received: by 2002:a17:907:a701:b0:a7a:a763:8438 with SMTP id a640c23a62f3a-a7daf617297mr114104766b.55.1722509187173;
        Thu, 01 Aug 2024 03:46:27 -0700 (PDT)
Message-ID: <f530ce42-a98f-4742-ab3d-a866fc9efdb9@suse.com>
Date: Thu, 1 Aug 2024 12:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240801095201.91180-1-roger.pau@citrix.com>
 <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>
Content-Language: en-US
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
In-Reply-To: <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 12:28, Jan Beulich wrote:
> On 01.08.2024 11:52, Roger Pau Monne wrote:
>> @@ -2048,6 +2040,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>      if ( !dom0 )
>>          panic("Could not set up DOM0 guest OS\n");
>>  
>> +    /*
>> +     * Enable SMAP only after being done with the domain building phase, as the
>> +     * PV builder switches to the domain page-tables and must be run with SMAP
>> +     * disabled.
>> +     */
>> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
>> +    {
>> +        ASSERT(mmu_cr4_features & X86_CR4_SMAP);
>> +        write_cr4(read_cr4() | X86_CR4_SMAP);
>> +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
>> +    }
> 
> Similarly for the BSP here: If we take an NMI between setting CR4.SMAP and
> setting the bit in cr4_pv32_mask, cr4_pv32_restore() would hit the BUG
> there if I'm not mistaken. I further fear that switching things around won't
> help either. The code you remove from create_dom0() looks to have the same
> issue. The only NMI-safe sequence looks to be: Clear both bits from %cr4,
> update cr4_pv32_mask as wanted, and then write %cr4 with the bits from
> cr4_pv32_mask ORed in.

Argh - and that would need doing simultaneously on all CPUs, as it seems.
Getting a little too complicated, I guess.

Jan

