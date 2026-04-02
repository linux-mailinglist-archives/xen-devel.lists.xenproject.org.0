Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLI5KXFkzmmXnQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:43:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF438930B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271826.1559842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HNx-0005ZV-Rf; Thu, 02 Apr 2026 12:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271826.1559842; Thu, 02 Apr 2026 12:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HNx-0005XC-NT; Thu, 02 Apr 2026 12:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1271826;
 Thu, 02 Apr 2026 12:42:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8HNw-0005X6-Qq
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:42:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8HNw-00AFWD-7D
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:42:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6440-2eae-0a2a0a5409dd-0a2a450cadac-38
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:42:56 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce644f-f40c-0a2a450c0019-d1558031dd13-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:42:56 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso11869805e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 05:42:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887a630922sm241522585e9.0.2026.04.02.05.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 05:42:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775133775; x=1775738575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaKMhlI7D75wd7Uq9NDSqWs94NMfdWkPyEvr/vQbMKI=;
        b=BuQuV83TO5l3fYlBLknIHsW0rIrjbXOPKcK4OjMWclSleFpS58jxtmQ4OkhrIu+YpF
         jF8zNi+NBi8vYV+DqJZHPol7bEEhDmoSV7IfMksPthRk1NpRLgbDHYMlk8kOb3qWZ1cE
         6ar64pnpcJlnnDRPaU1mm4OAbc9fWJ0VY9PUhmPKgfOT+R5ap4K9OUbbBP/Mr3duQqj2
         uLXPbVGh8MRriqDsUosuplDxQSjU0cypLwLRorVXJuo15RZgm1b9MAh/kfBJd9dUCGYX
         EadjRuv789DRrB4gCstGKJYPvmpe5qw5j4cVw+wFjSV+kTqzRiafhw0/WodBjXuyShh8
         dssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775133775; x=1775738575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaKMhlI7D75wd7Uq9NDSqWs94NMfdWkPyEvr/vQbMKI=;
        b=BInVWOy/ynS32wQVfSRyySHAhTt4ehWuD/MAjbCukaVdLp7V1lwmro08EEyyI+TxP0
         h2VRcNbzBYfs2ullxXr0Qv+NN6VCNjCl2wGVzsgXXGAXv422l2dHXBAVD8H4C6t10gKj
         5WLZkRgO9+Xvt+0HofcfCIS7d572HH8XSQ/ZthxyR+R2JPCdyJ/kENu4UA5N1YOQ9WFv
         ofU8bkFB2WoiJtra/q1a2zIGAA2KNUH1V7DIW/2mPmSeVYJnXoaBxeRbsxNVWeThvccq
         Vp64cJaYozy+FKvXsO+C/gZxDR20Zt1YIR4mPljChjcqv49mP96Azb79pXaNMlq279Wj
         JVsA==
X-Gm-Message-State: AOJu0Yx5FVpEynvqxYrUMCEYOixLakUCyNDpIPnRRkAebzU5IFh9LXqj
	rFkUi/jqIvzLKEGe0o4b8y/LDqVZt1uqnPfi1FdnHgR7S+gzRaYfX7z9Qq9KHinONQ==
X-Gm-Gg: ATEYQzyz6xVZ6qgn+4jV4E7Gso8HEg6h94Cd4rVQMJQEMv+nByvOSekVbfJNHQLYJW5
	bdN3j74tPwQwooAQeumiyhCbqUOLxXAsW6xg2upqEKuPkzYHFSTRGMDt+Re+7XCfRm0c1aJEpZP
	ZWlUD/VYJ1fwHN9rYnDiBlmnwBRO4R+d/9dAw8HERvDCeMICaE+xb7KzvwRIRF60GhMmyGmgAG+
	12NsA4Iho9yit+Q41QxbyZDc+Tc+5YswlpdEFOlUaciPPjSXIIF+NWKZpePwyKT4Ro7kb59R9W8
	ivWwhrZTi56W6GjIUuKt+eSCUxgw0PaK2qAdBzoB/Vl/gGlJhw1v0qDkuoenId17aUeVNdTqoYZ
	W4l9sY7AKQXr9bHfojGZNhf1UiLBH9WXFAXeAsCCyYIEk8SP8dGZPjmabdG9xKqIrjFO3T+UB00
	/sC5x9a0e7fMfUg0fsnymyqJXQx2Tm78JarWmSUA9xrFiERKoq9pNjXNHrL70GP+APbiN0D4nOZ
	elwNDYLcooqRaA=
X-Received: by 2002:a05:600c:a113:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-4888355e6c8mr96954225e9.5.1775133775473;
        Thu, 02 Apr 2026 05:42:55 -0700 (PDT)
Message-ID: <b7e7b1e5-60ff-419f-9a89-2ac7fc3cd21c@suse.com>
Date: Thu, 2 Apr 2026 14:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] make ioremap_attr() common
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
 <ac5d1zBaSQk7f0nE@wifi-campus-l-10-3-197-236.u-ga.fr>
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
In-Reply-To: <ac5d1zBaSQk7f0nE@wifi-campus-l-10-3-197-236.u-ga.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775133776-FF348A3D-880614EF/0/0
X-purgate-type: clean
X-purgate-size: 3866
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0EBF438930B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 14:15, Roger Pau Monné wrote:
> On Thu, Feb 19, 2026 at 04:51:54PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -6166,41 +6166,15 @@ void *__init arch_vmap_virt_end(void)
>>      return fix_to_virt(__end_of_fixed_addresses);
>>  }
>>  
>> -void __iomem *ioremap(paddr_t pa, size_t len)
>> +void __iomem *x86_ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
>>  {
>> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
>> -    void *va;
>> -
>> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>> +    WARN_ON(page_is_ram_type(PFN_DOWN(pa), RAM_TYPE_CONVENTIONAL));
>>  
>>      /* The low first Mb is always mapped. */
>> -    if ( !((pa + len - 1) >> 20) )
>> -        va = __va(pa);
>> -    else
>> -    {
>> -        unsigned int offs = pa & (PAGE_SIZE - 1);
>> -        unsigned int nr = PFN_UP(offs + len);
>> -
>> -        va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_UCMINUS, VMAP_DEFAULT);
>> -        if ( va )
>> -            va += offs;
>> -    }
>> -
>> -    return (void __force __iomem *)va;
>> -}
>> -
>> -void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
>> -{
>> -    mfn_t mfn = _mfn(PFN_DOWN(pa));
>> -    unsigned int offs = pa & (PAGE_SIZE - 1);
>> -    unsigned int nr = PFN_UP(offs + len);
>> -    void *va;
>> -
>> -    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>> -
>> -    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
>> +    if ( !((pa + len - 1) >> 20) && attr == PAGE_HYPERVISOR_UCMINUS )
>> +        return (void __force __iomem *)__va(pa);
> 
> Sorry, I'm possibly a bit lost: I see that on the bootstrap
> page-tables we map the VGA hole (0xa0000-0xc0000) as UC-, but I'm not
> seeing this being done to the directmap?

I'm not changing that aspect here, do I? ioremap() used the direct map
(apparently assuming the cache attribute is suitable), and so do I now.

Yet then, to address the point you make anyway, I certainly see use of
__PAGE_HYPERVISOR_UCMINUS in l1_directmap[].

>> --- /dev/null
>> +++ b/xen/common/ioremap.c
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/mm.h>
>> +#include <xen/pfn.h>
>> +#include <xen/vmap.h>
>> +
>> +#include <asm/io.h>
>> +
>> +void __iomem *ioremap_attr(paddr_t pa, size_t len, pte_attr_t attr)
>> +{
>> +    void __iomem *ptr = NULL;
>> +    unsigned int offs = PAGE_OFFSET(pa);
>> +
>> +#ifdef arch_ioremap_attr
>> +    ptr = arch_ioremap_attr(pa, len, attr);
>> +    if ( PAGE_OFFSET(ptr) )
>> +        return ptr;
> 
> IMO it's a bit confusing to deal with the offset addition detached
> form here, I would rather do:
> 
> if ( ptr != NULL )
> {
>     ASSERT(PAGE_OFFSET(ptr) == offs);
>     return PAGE_OFFSET(ptr) ? ptr : ptr + off;
> }
> 
> And get rid of the !ptr check in the if below.  So that when
> arch_ioremap_attr() succeeds it's all dealt with in the #ifdef
> protected block.

Possible, yet I deemed the other variant better.

The assertion you suggest isn't valid anyway (see the last sentence of the
description and xen/arch/arm/mpu/mm.c:ioremap_attr() prior to Michal's
"xen/arm: mpu: Fix ioremap_attr region size and return value"). Now that
that's changing, things may indeed be possible to simplify here.

>> +#endif
>> +
>> +    if ( IS_ENABLED(CONFIG_HAS_VMAP) && !ptr )
>> +    {
>> +        mfn_t mfn = _mfn(PFN_DOWN(pa));
>> +
>> +        ptr = (void __force __iomem *)__vmap(&mfn, PFN_UP(offs + len), 1, 1,
>> +                                             attr, VMAP_DEFAULT);
>> +    }
>> +
>> +    if ( !ptr )
>> +        return NULL;
>> +
>> +    return ptr + offs;
> 
> I would also join the NULL checking using a ternary operator:
> 
> return ptr ? ptr + off : NULL;

Can do, sure.

Jan

