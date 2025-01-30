Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A2A23240
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 17:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879693.1289908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXjh-0008Q8-BH; Thu, 30 Jan 2025 16:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879693.1289908; Thu, 30 Jan 2025 16:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdXjh-0008O7-8a; Thu, 30 Jan 2025 16:49:49 +0000
Received: by outflank-mailman (input) for mailman id 879693;
 Thu, 30 Jan 2025 16:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdXjg-0008O1-34
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 16:49:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368d8ab4-df2a-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 17:49:47 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso1395938a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 08:49:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a5ada4sm145011666b.184.2025.01.30.08.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 08:49:46 -0800 (PST)
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
X-Inumbo-ID: 368d8ab4-df2a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738255786; x=1738860586; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uV1oRjfWeNJ+hcG6a/H7qJp9pizg0klJ3xuXIMWx4Ug=;
        b=GVVZ1XVtm+Tpy4jwsNen5CqM42uTuCwXXJvPFciIW3zvRgeooMB/c7YRncqJI1Z/gn
         F69CkWHZX8jOu+Ig1pLGkKG6/dhOjKVAF6iaTo1Cv3dJBRv0+EBrE5U/PtiilypfaLFu
         VHapoAlYhpQdfEgMmL3QPA2xTwddiEHSC1OFGmbbUIXtmvxk6wz5CuEsisogoJpAKaMI
         KjUv87GUvUW91ICYjxFnAMy1z3xAXxM10gPuE+tkVDFmcMR+U3w72gvQIl42WtshAcXi
         QkYlrnaBx93JnkHMGQOK0bfKSiod2uU/TDz/Lb5y8fBC5Ojc0WlQfHDY23jtCEgwsyvg
         l4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255786; x=1738860586;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV1oRjfWeNJ+hcG6a/H7qJp9pizg0klJ3xuXIMWx4Ug=;
        b=KnbTYtiGZkTPrgDaHRqVTrlchwKG86c7CIhbvF8PfDm5dfqA8TB/qQcHjn2r3k4YTC
         2Ph0X0PVhVJzaFCOD5QWCq48Sv0D1cgCajfGKq1vCBWOEE1uhWiSXZwqC0qwMiGxL5nu
         v3PXKXs9PFl1fRBl8C0egFaUKGY7Ge4qKH4Z/aQaALMASJ0VMdS3GamcxOHtBb5YJglK
         XDitNChXTRKyYyrxaPm6ffVPgr2/jhMr4TFoSeiY3RmBxMuXdRDfwaVXkqC4xUr+mijg
         AY/iAO7li6O6sHYqyd8rbD9n7s96oXiIjuH19noqaBCh7d/+jJtnu/YTkt87m04SxGJt
         OBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWujozEWDFtu0oWbTZx2V3VnCaZy8QWCP6uzzeHP6lJXlcWMZCLY2hEAoekYfyuE8P2IF+juMvdU1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO0S0xztK/1za0g9JdnC0KkzGv8urcy/eMWOFPWueuB4Cz1+0i
	aY/FXz7t5fAJR+iNQriXgBkvI5vTtk5/E0oMmOA6Pq7JfrescMzDtDokuKU3tA==
X-Gm-Gg: ASbGnctWzCly8tW7UCEXrofHzvrEGjz/SVdH6IuVS4wuUv7MXm4EhZYjgf/303sa5vm
	0E1DArdnkpI8hrlc6HQcQvgJQ1xrAX/k70WlJR7k5AyhkyzMBDhqtfnNbuTMEOmcLViz1cED3H4
	dz46cdLnkf2sFEFBQZ/zc5S85/6BBaiHc8ICJ0BwBbEqkkHJtnrMdW6YZdVBDxSoFk+DQb3zJMf
	7Hf1ax8BsnrEs3dFP6El8Bv7hvzQVBuaGQtEpGHkRj5a5L6QWrnbcgJ9O50pKDCoPqJ6Mehlz2E
	/a6zZNBZw5A1ERInnqRsyEwEk3fww8tmcGgnD8LfdZnUqMtIYnmyhiXN0W7auC5zX5KlVNSBNFx
	o
X-Google-Smtp-Source: AGHT+IH6a+b16sacKqOcL3iI6Im174Uqx9gUU94HhX8lN71aD1iw7pjxrH8XsLsx1zo1enGyxyagTQ==
X-Received: by 2002:a05:6402:360f:b0:5dc:7fbe:7305 with SMTP id 4fb4d7f45d1cf-5dc7fbe738amr489877a12.13.1738255786425;
        Thu, 30 Jan 2025 08:49:46 -0800 (PST)
Message-ID: <0c4e53ef-3771-49d8-b63d-4e4439798c32@suse.com>
Date: Thu, 30 Jan 2025 17:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-12-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the domain
> node in the device tree configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

(Not going to repeat style remarks already made on earlier patches. Please
apply throughout the series.)

> @@ -61,10 +62,40 @@ static int __init dom0less_module_index(
>  static int __init process_domain_node(
>      struct boot_info *bi, void *fdt, int dom_node)
>  {
> -    int node;
> +    int node, property;
>      struct boot_domain *bd = &bi->domains[bi->nr_domains];
>      const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>  
> +    fdt_for_each_property_offset(property, fdt, dom_node)
> +    {
> +        const struct fdt_property *prop;
> +        const char *prop_name;
> +        int name_len;
> +
> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
> +        if ( !prop )
> +            continue; /* silently skip */
> +
> +        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
> +
> +        if ( strncmp(prop_name, "domid", name_len) == 0 )

Isn't this going to (wrongly) match when e.g. the property has just "d" (and
hence name_len is 1).

> +        {
> +            uint32_t val = DOMID_INVALID;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
> +            {
> +                printk("  failed processing domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            if ( val >= DOMID_FIRST_RESERVED )
> +            {
> +                printk("  invalid domain id for domain %s\n", name);
> +                return -EINVAL;
> +            }
> +            bd->domid = (domid_t)val;
> +            printk("  domid: %d\n", bd->domid);
> +        }
> +    }

Perhaps the question comes too early (will be taken care of in later
patches), but still: What if multiple domains have the same ID specified?

> @@ -125,7 +156,29 @@ static int __init process_domain_node(
>          else if (
>              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
>          {
> -            int idx = dom0less_module_node(fdt, node, size_size, address_size);
> +            unsigned int idx;
> +            int ret = 0;
> +
> +            if ( bd->ramdisk )
> +            {
> +                printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",
> +                       name);
> +                continue;
> +            }
> +
> +            /* Try hyperlaunch property, fall back to dom0less property. */
> +            if ( hl_module_index(fdt, node, &idx) < 0 )
> +            {
> +                int address_size = fdt_address_cells(fdt, dom_node);
> +                int size_size = fdt_size_cells(fdt, dom_node);
> +
> +                if ( address_size < 0 || size_size < 0 )
> +                    ret = -EINVAL;
> +                else
> +                    ret = dom0less_module_index(
> +                            fdt, node, size_size, address_size, &idx);
> +            }

Doesn't this belong into the earlier patch?

> @@ -154,6 +207,12 @@ static int __init process_domain_node(
>          return -EFAULT;
>      }
>  
> +    if ( bd->domid == DOMID_INVALID )
> +        bd->domid = get_initial_domain_id();

Isn't this redundant with ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1029,8 +1029,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    if ( bd->domid == DOMID_INVALID )
> +        /* Create initial domain.  Not d0 for pvshim. */
> +        bd->domid = get_initial_domain_id();

... this?

Jan

