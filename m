Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C2A20CFA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878565.1288747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnSW-0007xz-7t; Tue, 28 Jan 2025 15:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878565.1288747; Tue, 28 Jan 2025 15:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnSW-0007vh-5L; Tue, 28 Jan 2025 15:25:00 +0000
Received: by outflank-mailman (input) for mailman id 878565;
 Tue, 28 Jan 2025 15:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcnSV-0007vb-HN
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:24:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 089f9b31-dd8c-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 16:24:58 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so1142176066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 07:24:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6aa40824asm356119366b.134.2025.01.28.07.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 07:24:57 -0800 (PST)
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
X-Inumbo-ID: 089f9b31-dd8c-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738077898; x=1738682698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R6+bHWtED+akRsbrsegFrhoUIY65i2DzLq8lI03TP+0=;
        b=KgMxe0LXPDTN8mtv7pkP7GFufGWiIpLSbGu25A8ZszregSEf7QnGgrW371+UaJ+k9y
         PEv4gxFQB2cicgqI7rxuMm4foXpLu2nzGz/91ZAxEmdVkhoenroaQPawHjPy3PTvg7Qn
         0gFItNxyFQjNofILHmoyZUK+p4J7I65cPfiDY25bl5WzuoZnwHPEFJnjz2DNhQC5AQg9
         BHBvrmCr0epI0/hzaBBw5x26cAyOkYgpEIEug3ip3140FJrcpEZ39CWwONum7FKpqNOc
         1K0iP6GVjbDwj4c8yO4eZUo0dIG+tqqjs1GbagFP83GBrHGhETNUeRwNIKo6Cwb+1Pqk
         40qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077898; x=1738682698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6+bHWtED+akRsbrsegFrhoUIY65i2DzLq8lI03TP+0=;
        b=xP6HVtYZ/VG3ajmnPrWvsMTD0BjKzRHbGgUoRsobouA6LonxAJ7YxH6u14WiL0YyBh
         kJTuDZqFSib9CNS6lfFR3ig6k0ffs8HZyYE/Ov4u/SAAe9hnjROL21zTl7E4CUuMu+MZ
         ISC+yX8aphbE6A3zvVzBp8WDIAAg3idyu3heFcH3x+krbUc9XIyIXM5ZHH4HQ78ogMGT
         oqjwU3aXXXZMGmgD96XQlPnhcRkLvedljD3PuKTMbXMv2yMn6rEBcMafki6J86jTTjEg
         4RSmQrbPepmh5fv/kvRZqJNyNNuITLunJeeSsy4OG2fSdmoMOrt1Bo4LPXsm0dvTNLME
         91HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcXj7bQ6M2l963cXaYnE+YGcJJbtM+pfKhbwS0tjLKh74MNR09xbZUAsiV1y9mw9ZgH2V3JGw7nY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWmAxsVD4aGpBMIZKn4cxilrRO99MJx5Z3DWOrbSZvP71n2MLg
	s5u1FARZ09iAUZxozQLBDIk2NlvYi7AlSje9a9nDLckbp0sAbykfDrddfqxJtg==
X-Gm-Gg: ASbGncvBrVUOBQ1zBWlNxo/l3ieZB9zdRnu4rXuHtaEFMBEtgAKpXvQ5QV/RAmT6VMH
	CSICCaa4LON2PWLIpN4Urqjy5O3LzLnVlD5g9XXkk8XTrqMpC8twpIot+d2TzqYDex7Q0YoDK/9
	1QWhfzUJENrdG6F8gwxSGtJ6MF6qvT10aSHs3y7ivyJaLfkXaabw2Ewh2DDV4x4i9EAGaYjagnB
	tqYDxfCYOmPTtzEi4/5xogjM1zZDc9BvkdlPWfAOi0xPY6ek4Cm6zHcxuaGE8Rhzh1+zpHbX7U0
	bUom2qVvfSs1WdL1YttWTW9FEoq89H3mo/jR/+enjthrabOuCNAwAZxGdYhvu7dqsMsrpupSeFI
	e
X-Google-Smtp-Source: AGHT+IG7lKKdeOQl2WGGWu5hg3C36ZqNreoUFyU59TmynYr4bsmW/gaxeqTwYMgoo31Rr/nAtgMzcQ==
X-Received: by 2002:a17:906:7955:b0:ab2:f816:c5e1 with SMTP id a640c23a62f3a-ab38b1b4659mr4533584766b.1.1738077897383;
        Tue, 28 Jan 2025 07:24:57 -0800 (PST)
Message-ID: <ebb76855-9ab4-445d-9f43-5554c4743755@suse.com>
Date: Tue, 28 Jan 2025 16:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/24] xen/domain: move get_initial_domain_id() to
 arch-independent header
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-11-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-11-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Honor 'hardware_domid=' parameter across all architectures

In which way is it not honored right now (besides depending on
LATE_HWDOM=y)? It is, for example, not supposed to be the case that
in a late-hwdom configuration all IDs below hardware_domid are
unavailable for new domains to be created.

> and update
> max_init_domid correctly so that toolstack and, subsequently, console driver
> could iterate across known domains more efficiently.
> 
> Also, move max_init_domid to arch-independent location.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>


> @@ -2387,15 +2388,15 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |= CDF_directmap;
>  
> -    dom0 = domain_create(0, &dom0_cfg, flags);
> +    dom0 = domain_create(domid, &dom0_cfg, CDF_privileged | CDF_directmap);

Why the move from "flags" to "CDF_privileged | CDF_directmap"?

>      if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));
>  
>      if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
>          panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
>  
>      if ( alloc_dom0_vcpu0(dom0) == NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating domain %d vcpu0\n", domid);

If already you alter this, please switch to %pd.

> @@ -65,6 +68,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Last known non-system domain ID. */
> +domid_t __read_mostly max_init_domid;

I'm afraid comment and variable name conflict with one another. And
really with its present purpose it ought to be __ro_after_init, I
think.

> @@ -2261,6 +2267,15 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +domid_t get_initial_domain_id(void)
> +{
> +#ifdef CONFIG_PV_SHIM
> +    if ( pv_shim )
> +        return pv_shim_get_initial_domain_id();
> +#endif

Aiui the #ifdef is necessary for non-x86? Would be nice to avoid that, yet
then I'm not meaning to ask you to do a lot of further rearrangements.

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -415,10 +415,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_createdomain:
>      {
>          domid_t        dom;
> -        static domid_t rover = 0;
>  
>          dom = op->domain;
> -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> +        if ( (dom > max_init_domid) && (dom < DOMID_FIRST_RESERVED) )
>          {
>              ret = -EEXIST;
>              if ( !is_free_domid(dom) )
> @@ -426,19 +425,19 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          }
>          else
>          {
> -            for ( dom = rover + 1; dom != rover; dom++ )
> +            for ( dom = max_init_domid + 1; dom != max_init_domid; dom++ )

The "dom != max_init_domid" is dead code now if I'm no t mistaken, due to ...

>              {
>                  if ( dom == DOMID_FIRST_RESERVED )
> -                    dom = 1;
> +                    dom = max_init_domid + 1;

... this. Thus the loop will become infinite if all permissible domain IDs
are in use. Yet then ...

>                  if ( is_free_domid(dom) )
>                      break;
>              }
>  
>              ret = -ENOMEM;
> -            if ( dom == rover )
> +            if ( dom == max_init_domid )
>                  break;
>  
> -            rover = dom;
> +            max_init_domid = dom;
>          }

... why would all of this code need changing? (If it does, I think that
wants to be in a separate patch, with appropriate description.)

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -568,6 +568,14 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return sz;
>  }
>  
> +static int __init cf_check globals_init(void)
> +{
> +    max_init_domid = get_initial_domain_id();
> +
> +    return 0;
> +}
> +__initcall(globals_init);

Imo this wants to live in the CU defining the variable.

Jan

