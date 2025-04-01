Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F2A77A81
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933944.1335772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaXk-0007OU-Pp; Tue, 01 Apr 2025 12:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933944.1335772; Tue, 01 Apr 2025 12:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaXk-0007MG-N9; Tue, 01 Apr 2025 12:16:36 +0000
Received: by outflank-mailman (input) for mailman id 933944;
 Tue, 01 Apr 2025 12:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzaXj-0007MA-De
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:16:35 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26c9ecee-0ef3-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:16:34 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so4514043f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:16:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314b5e7sm199241115e9.35.2025.04.01.05.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:16:32 -0700 (PDT)
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
X-Inumbo-ID: 26c9ecee-0ef3-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743509793; x=1744114593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kPWTSv5K/ONC8F+o1mQaSyKy+gzQpEWQzDbOHHnxz78=;
        b=Ipqq59I8FsJArUrIUBxQg64tNsrAyGbij7m/HpG1Gp/ev0Ji4NbR2eA+JeAl4zSBng
         rwvVGzosvrRhXi8i+hjC/FjF67tAyEWKTEnf/s9E4lwxCg3Q56it7NyxQkAtIvMnvFqF
         ITCU3q+LRkFBQwacWmbIA7p4yhlQJ7pbfNEBdWl7ISxoZupS/YymAHXAz0f86b4SruMl
         oy2vaSW45jwWgSOJ6M/FUqKEk18Cqrrcrh1S8fF1YaiBtBLDZ9x1OM4Z2lXwUrHtwsgz
         sWBbcOMjuHC8e7L1iP5G7V+xWI2DDskZoAXt37NlIdMyE5CEXwWiaBtQRi6PZbK/GIBY
         2cDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743509793; x=1744114593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPWTSv5K/ONC8F+o1mQaSyKy+gzQpEWQzDbOHHnxz78=;
        b=GrPL7c5ZgMbL3gtRpx4dRRkK9UEdOCrPZRSMu+OCQLQojsRFBYzPijdnQY4ghq9A8t
         TF6kgrslljBgnQoDrlgomo9TceQRBQGCx57dhfWg1T9RvdzYFfLEc+cdRBHz0A0wLLWm
         UUGWaIo2bo/rZ3NTpQ2Ya9n66Gp5UrHL4dlIXn5FsaBfg2tT6qWCampc+bK5ve3hzsRb
         3x0/fxOGwc9R2KuX3wccmWsucXmhB+d/YzpHzmWW5gEKuQpT5pHL2WEQC5u86vlNUl4w
         4HlAFVK26xsdP+A6K24/Bzsp2vX2zMBq3yOeO0LNas86ydqX0byQqCW5SMS9cJgZ0ivw
         oVAA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNppYsT952tYZa/NkP3qqkMqqCBtp2kRr45ThdFaoB7mIJkw0bE/C/QPAhUGGmKGG4WD6a3wx3wc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm/NpdhHKRQcEDMy4bh57cOvONXvk4PLYwp/3I7Q49A9G9MzP6
	vY3vfhDgt+q7wrzY1eD/UxijitkE1aYfwv52RREfCorooso/otKR/uTtyoC24Q==
X-Gm-Gg: ASbGnctXLh/fiz5Fx1nfxzCJo8bfYmFL0vFunnJHSeO10HPnwr6Wis3vUsT22mkoIaT
	mDiE5HLsFkCCAt37nQn99bn1Qgr81Bw0V2zQciPfb5MvLn2Rpi1WHxwFXKL6QX8DIeXXQr4pzRJ
	ZzO5+ps8guHd+EnBMOenMdrbYXuRtMesfPkZjzu6BJ3PMC9oyX5gkEuRNlS9l4RsRdDNwuupohQ
	BAetXJewLJbcdogihnmTkBZVFv90pDBvHe/QUB9dHHrnrmXGOb+vXdV45+32WmhBbK3LlqTUoeU
	rRm664XLtw9OU2yLkXWvEXTZtBkxSERrVVdWds8LGLwhgEZabIsUwrHK4UUfE1iYIEgAIAfUgPU
	mPQL9Dwi1ayqrX+q8kQo2KbmKQnYsyBEP0NShhkYb
X-Google-Smtp-Source: AGHT+IGR6XEBWGq3rif+DS8uWb9hT6JlG9cY25zlVFhFU3RrNgNAvlHVMP8bZN9pfAgJnkEJYV9Q4g==
X-Received: by 2002:a05:6000:2706:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39c1257d4fbmr6864114f8f.57.1743509793253;
        Tue, 01 Apr 2025 05:16:33 -0700 (PDT)
Message-ID: <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
Date: Tue, 1 Apr 2025 14:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table entry
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250331214321.205331-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 23:43, Jason Andryuk wrote:
> xenstored maps other domains' xenstore pages.  Currently this relies on
> init-dom0less or xl to seed the grants from Dom0.  With split
> hardware/control/xenstore domains, this is problematic since we don't
> want the hardware domain to be able to map other domains' resources
> without their permission.  Instead have the hypervisor seed the grant
> table entry for every dom0less domain.  The grant is then accessible as
> normal.

Yet aiui the original idea was to specifically not do this in the hypervisor.
I agree it shouldn't be the hardware domain, but what's wrong with having the
control domain do that? It is what is responsible for creating new domains as
well. The question of where to do that when there's no control domain must
also have been solved already (without me knowing the answer), as that's
where init-dom0less must be running.

> This works with C xenstored.  OCaml xenstored does not use grants and
> would fail to foreign map the page.

From the sentence it's not clear whether this is unchanged behavior or
a deliberate regression.

> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
>          rc = alloc_xenstore_evtchn(d);
>          if ( rc < 0 )
>              panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> +
> +        if ( gfn != ~0ULL )

Is this an odd open-coding of INVALID_GFN? And even if not - why ULL when
"gfn" is unsigned long? The way you have it the condition will always be
false on Arm32, if I'm not mistaken.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4346,6 +4346,21 @@ static void gnttab_usage_print(struct domain *rd)
>          printk("no active grant table entries\n");
>  }
>  
> +#ifdef CONFIG_DOM0LESS_BOOT
> +void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
> +                              domid_t be_domid, uint64_t frame,
> +                              unsigned int flags)
> +{
> +    const struct grant_table *gt = d->grant_table;
> +
> +    ASSERT(!d->creation_finished);

While I don't mind the assertion, it's a little funny to see such in an
__init function.

> +    ASSERT(gt->gt_version == 1);
> +    shared_entry_v1(gt, idx).flags = flags;

Does this really need to be a function parameter? The sole caller passes
a constant (GTF_permit_access).

> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -45,6 +45,11 @@ void grant_table_destroy(
>      struct domain *d);
>  void grant_table_init_vcpu(struct vcpu *v);
>  
> +/* Seed a gnttab entry for Hyperlaunch/dom0less. */
> +void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,

No __init on declarations please. They have no effect (as long as the definition
properly has the attribute) and hence are only at risk of going stale.

Jan

