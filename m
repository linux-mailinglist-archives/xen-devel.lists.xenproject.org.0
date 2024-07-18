Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42665934B5E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 11:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760332.1170144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNuG-0005R6-Pf; Thu, 18 Jul 2024 09:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760332.1170144; Thu, 18 Jul 2024 09:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNuG-0005PM-N3; Thu, 18 Jul 2024 09:58:36 +0000
Received: by outflank-mailman (input) for mailman id 760332;
 Thu, 18 Jul 2024 09:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUNuF-0005PE-0S
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 09:58:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b17bd46-44ec-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 11:58:33 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so139737f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 02:58:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc584764c7sm15399485ad.179.2024.07.18.02.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:58:32 -0700 (PDT)
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
X-Inumbo-ID: 4b17bd46-44ec-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721296713; x=1721901513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dixNdZNY+Ch57hCG0rGhbZD1MMP19b3uBD1jEgHuwvM=;
        b=OJTPE5RrfpGwEX19Vx5XwaZH+cXBoBOHwmlfmbF82O64ekAVeKJmufCSwQ+flhmCw0
         +dFaGlxg5FJzZByfKXKsR2CG5V5jw54Ou8VUmE2Vw1asWRM1PPLS7ugzrQ+CpwAMhOD5
         LeqYP4UY6WD1o0e39WRpmciZzrE19MjmeeD7WqaOJbTRt46rMyankl4xfU6bAdVLrabT
         CHhdGSK9I8X+ifqRajT9yo0srvvwg0otEv8IyWT3lZDWCcrTm2N9Bkp7+aUaD7FowLwp
         3lR4kU1CPmx0RE06PDWZ+MxLPfqLU5BPp50aG4CM7mKvUZoNAAeB5cZAM3KObZhiigUQ
         wqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296713; x=1721901513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dixNdZNY+Ch57hCG0rGhbZD1MMP19b3uBD1jEgHuwvM=;
        b=Cgb46SATwv1eYlXM+AB43B4Xj3qB1bqiCUHqo8krAEYihHTV8hppY+qBYiPiLLPKYc
         1iSNnj5Kj3e4lUUeiZ8bp5ZTMXjP371ZKiWHFdsCerwGpO/h2cr5YKfOuM/t8UdQoIYM
         fxeDWHhXmsA6I2Sl9+whBHQtSSjyphY7ghJyRgJTpfQlGO/kqGN4nBfVFr2A/47ISsxP
         YFOMvDhUWFcneEcEabN5BiQNmuPyex5nukAxkQtfzsX+Zz6v3xJmT9tVkZUtX5LCSH9b
         EzCokcp9aCCGynXCdFJkPmTxGoYn6WP7xhhoLFHC0p+SJos5K3XeHMIyCCeFPIDHTcuD
         W8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1HZGveikZVtTvRSEZiROIsip3EwSsSVbv8zLb6FeoWYuJH31Is9LUhMKrevi9U1DkYzgZo4kgpoELejsK8C7UJDRzC3bSWT1jGQXb9uw=
X-Gm-Message-State: AOJu0YzaaS7d1eHEk4ukH9UFfK9WnpjSsUs/6VmdhJT9Dpf1buiL1NAu
	yRUALkuvPDihEmz5uyhsYEi1B8BRD9Yzn3uQvWVpyXecxb97CORxhyDNyYUBHg==
X-Google-Smtp-Source: AGHT+IFy0Dps+dTEmgAnq4FWBekbPBQpnPLGdwSYV0G5QURWFXksvPOtWkGymLAGCpGHQ/LVaipVtA==
X-Received: by 2002:a05:6000:184d:b0:368:6337:4221 with SMTP id ffacd0b85a97d-36863374885mr693045f8f.54.1721296712997;
        Thu, 18 Jul 2024 02:58:32 -0700 (PDT)
Message-ID: <87a924ed-e258-41e4-8a2a-19527c08a4e3@suse.com>
Date: Thu, 18 Jul 2024 11:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] x86/mm: Simplify/correct l1_disallow_mask()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
 <20240717161415.3586195-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240717161415.3586195-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2024 18:14, Andrew Cooper wrote:
> l1_disallow_mask() yields L1_DISALLOW_MASK with PAGE_CACHE_ATTRS conditionally
> permitted.  First, rewrite it as a plain function.
> 
> Next, correct some dubious behaviours.
> 
> The use of is_pv_domain() is tautological; l1_disallow_mask() is only used in
> the PV pagetable code, and it return true for system domains as well.

Well, only quite. What you say is entirely true for mod_l1_entry(), but sadly
not for get_page_from_l1e(): That's also used by shadow_get_page_from_l1e(),
i.e. theoretically from a PVH Dom0 running in shadow mode. I don't think I
can spot anywhere we'd reject that combination.

> The use of has_arch_pdevs() is wonky; by making the use of cache attributes
> dependent on the instantanious property of whether any devices is assigned,
> means that a guest could have created a legal PTE which will fail validation
> at a later point when the device has been removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> RFC.  I've not tested this, and I doubt it will work to start with owing to
> the removal of the dom_io special case which IIRC dom0 uses to map arbitrary
> MMIO.

I think that check has been dead for a long time. DomIO can't be the page
table owner; it can only be the owner of a page to be mapped. The check
likely was needed only before the proper splitting of which domain involved
plays which role. Dropping this may then want to be done as a separate
change, but it could of course remain here as long as properly explained in
the description. Maybe for the time being we want to retain an assertion to
this effect.

> Furthermore, the rangeset_is_empty() calls have the same problem that
> has_arch_pdevs() has; they're not invariants on the domain.  Also, VMs
> wanting/needing encrypted memory need fully working cacheability irrespective
> of device assignment.
> 
> I expect the way we actually want to fix this is to have a CDF flag for
> allowing reduced cahcebility, and for this expression to simplify to just:
> 
>     if ( d->options & XEN_DOMCTL_CDF_any_cacheability )
>         disallow &= ~PAGE_CACHE_ATTRS;
> 
> which is simpler still.

Perhaps. Or refuse altering the two rangesets post-creation for domains
without IOMMUs ("post-creation" here including the establishing of any
mapping on behalf of the domain).

Jan

