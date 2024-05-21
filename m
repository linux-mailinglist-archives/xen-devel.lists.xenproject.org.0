Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57548CAC3D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 12:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726815.1131189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MlS-00040M-88; Tue, 21 May 2024 10:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726815.1131189; Tue, 21 May 2024 10:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MlS-0003xs-5X; Tue, 21 May 2024 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 726815;
 Tue, 21 May 2024 10:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9MlR-0003xm-2o
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:30:37 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2842443a-175d-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 12:30:34 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so592331366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 03:30:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f0dsm1588205966b.211.2024.05.21.03.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 03:30:34 -0700 (PDT)
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
X-Inumbo-ID: 2842443a-175d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716287434; x=1716892234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en/AzRk/WEfRzuawz7Kqg4Hvj7RCwJmtNwU8noXrYUo=;
        b=QfIZyMtAORIH4jnFEBoAKe2kjBrFnPrbbz9Hrbg/bblXmOWPF568vDxLckDy/tdw08
         Anrx/L8ok4varTJ6ClwzM3hWpV0f5BhtqiKfeT68Awe/0MyAg1tGMS6Rbq7KC0E3LjU0
         uvPmb6MH/t7T5UzXgeyaL1gmRiiQhOKS2bDFB562M6CAVOiEL2MC5RPJKeXG1Pw6fbcR
         8Kkl/5J90jNv4DsAuaxyBC0/Ecio4Geam2rS/AqNDsbzgcNpwFr7/l4uQdh0hCyiq1Qe
         +3GMbj1jtMOFZFszTDlt3GyuQV+5F1ZwFsrE8Shi+M3gx6yyeg4wBYFpqaXAFe5sgsaR
         iXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716287434; x=1716892234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=en/AzRk/WEfRzuawz7Kqg4Hvj7RCwJmtNwU8noXrYUo=;
        b=TakUjPoLjUCgYMcm5cstnw9aXJdgPTZOUdrGXkbcL4CUKIZ4uPtsWjuJbK+XWBAe1K
         jo8RfeyltA1L2tbQ2WMNu6X9m6VPrj/xdLfpKsj0Y+0m9RwW0ms20WO3J0NWGkHTIQX2
         tfVh4hTsE1+F2HXINu1mX/0syWJxBDGoJDSeaLKWuj0tHFOT6UKKSZezlxUgazYENDfS
         uCwYb2U457u/B0Lu0U+fym0qPVVIdiqLpPd/I4narEkZfCfhH/Z7O3KnPQqBS/RuLOIY
         Acd3XLkB4hraCVbregMCBwLMQ0NiChI4qAfdfyipwpHVegDF7MZ2tWTPOOQR04jm0cub
         PejQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHnhUtmKAjrHwoWbuNsXf+pIEMakUwxrBEysCWNj8LQn7SjpAoWLhM268KuzeRF/p+d23P75iNvjeSo2ydnwwukorUszmhjQmrPOCUsWw=
X-Gm-Message-State: AOJu0Yy7QgSPyXZN4qXQ09PhIIHe8F3xtr1x2IouusBeJVhvupjiH5QN
	6GdcNt0OJP+sOlTZB2ksnjeok1CPt2R48JUXEbDCyF5nvbRXB7J/7ydg29nWAg==
X-Google-Smtp-Source: AGHT+IH7/j/Th8iA6++dCnnalHKSsnZe2z57dYjHKt5K30zsTiwegAibQFGvYk6WtFfGBOrfqYxvGQ==
X-Received: by 2002:a17:907:d22:b0:a59:aa9d:3142 with SMTP id a640c23a62f3a-a5a2d5cb794mr2572004266b.37.1716287434331;
        Tue, 21 May 2024 03:30:34 -0700 (PDT)
Message-ID: <cd1bf7b0-4a0a-4a38-9129-53822cb8e037@suse.com>
Date: Tue, 21 May 2024 12:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
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
In-Reply-To: <20240517133352.94347-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.05.2024 15:33, Roger Pau Monne wrote:
> Enabling it using an HVM param is fragile, and complicates the logic when
> deciding whether options that interact with altp2m can also be enabled.
> 
> Leave the HVM param value for consumption by the guest, but prevent it from
> being set.  Enabling is now done using and additional altp2m specific field in
> xen_domctl_createdomain.
> 
> Note that albeit only currently implemented in x86, altp2m could be implemented
> in other architectures, hence why the field is added to xen_domctl_createdomain
> instead of xen_arch_domainconfig.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
albeit with one question:

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -637,6 +637,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
>      unsigned int max_vcpus;
> +    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
> +                                         XEN_DOMCTL_ALTP2M_mode_mask);
>  
>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
>      {
> @@ -715,6 +717,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
> +    {
> +        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
> +                config->flags);
> +        return -EINVAL;
> +    }
> +
> +    if ( altp2m_mode && nested_virt )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Nested virt and altp2m are not supported together\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( altp2m_mode && !hap )
> +    {
> +        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
> +        return -EINVAL;
> +    }

Should this last one perhaps be further extended to permit altp2m with EPT
only?

Jan

