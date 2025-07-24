Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7BB10723
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055604.1423995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesiI-0006n4-Tk; Thu, 24 Jul 2025 09:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055604.1423995; Thu, 24 Jul 2025 09:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesiI-0006k2-Qv; Thu, 24 Jul 2025 09:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1055604;
 Thu, 24 Jul 2025 09:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uesiG-0006jw-KK
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:58:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2cf4fce-6874-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 11:58:07 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so7617685e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:58:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705c4dbdsm14367455e9.25.2025.07.24.02.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 02:58:06 -0700 (PDT)
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
X-Inumbo-ID: b2cf4fce-6874-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753351087; x=1753955887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iLIAb+V5GsNEss/nRkDduP1VFRy54qCYc3jHxk6NmUw=;
        b=ZauD+kKNiyIQm+0DBggXCx6NGHmexvbk0062Czwu49Ux1J0jdCQvmHr22Kz/Xl6DY6
         lxP64azqnRRTk8YtaUz42PyTUSMONGBuVhLDGnl32lfua0ZHrNCUB0fx/el7duGR74Zr
         bb6y+1ztewRWlIjoqQZ4iKwQy8SYH4gJcWjCy8sJw5AAYG7edMXs2YO+E1nIDBnNt83u
         r47mpJgkzf/HUsTAM/3rtRiLOPMwDEGVOqzOb4QKbEVD+EojYHSIhveMj2d5IMF0YmCW
         py3LGBPmr04ifg3gs10l5LF0UPHZik2NEDbk3lddecVmaoroJ+fIGWWysKZIUDXQN5R7
         RweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351087; x=1753955887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLIAb+V5GsNEss/nRkDduP1VFRy54qCYc3jHxk6NmUw=;
        b=cXLzrJPwof6cWrsxOKSIvfORM7YTOkDw/G121Oy97XvXuUH0Q+aFP++2o7prLyZMHE
         q7t0BwiYobtxi/NFpajIGdiWlRrHMcRkk1klDjq60keJtyI5lghhwVCwUnuhdOcqNnji
         atDm3fISf70NDfMPqLoB3lxs0xROI5ZQr0t2VQf2uEXeWv4oF9Ng3RCksMFe13GBWPAS
         Cuk7tALBYMwCnp6P8nQoKYKym9QOhszVC6SwJeD+Sl4eBz5875+7Z+nIERnxodo3puFy
         9WObJVW5TDMswibIdBh9W8kgBdulM+CBIxak09EsetJYBWbqyGOQ29h963K2eXbEuXGP
         dw4A==
X-Forwarded-Encrypted: i=1; AJvYcCW2bmXTT/XbMzpLQmvY9slimbUlSTsl6j9BmAIuH5ewlGom4NVHlK3JY7Y+XbJWxA4rvbpkJUDy9r8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1XvJFyYRKbRqqHPg9G23xoIdjHlrNqwl8XR0/F96AZiEdIInN
	Rfg1Nn8nSLGrp2/qX5HfX/l4tN031cUWEnAjPSAQR+e04o/DzV+S6P2rbMuA09Yf2w==
X-Gm-Gg: ASbGncs3wzpSkyn1T4sp6rclvLg4oD+a7Uo4ty9ZktaD9AmbbHB4Tr6d9iHZ+CoE8fE
	Iq+98b8tQeSwbrT6dKQSmduadEUkFM7EZZv7Wzp1u+71xO44QfrbHB3iO5VdeVvlhT3ccO6FLOc
	kDLyHSebue5w7tzU/6HAAfb7mXNjsKWpLLIr+19dK4x8KG345OIQT50e1g47m9MdQgjdYxK0W8M
	LYa0TvaN+KpP5EfoeT3PH4khi1FBqfFMYNjiqy9tkSfTbV+utphKGWpb5FQIfGsytjMQGKuTHiq
	SJ5YLFOU+0Do8rd8BscfpEYB1Jl+/SoAvX0jZ0tg+HjMCHTrGirPD80ybe0m49VPb3CCv9qhIAm
	WqTJdFRwkbfZrCeWoZEm8+BDiYCYL+2GhkDqNb5Ft5seBfpfwMZVfWt2sb9gUvJrOxp1V9Qc78K
	Eq9Ac4VVmbbEsXas2uUA==
X-Google-Smtp-Source: AGHT+IGhNNoeduUMgOla38InYQa7yhjjLcrG9d6Wzv61z+Bcnk6kEWUgM+suEFW37HboR9L4MHEtUg==
X-Received: by 2002:a05:600c:1c8f:b0:456:1156:e5f5 with SMTP id 5b1f17b1804b1-4586f3f840dmr14849785e9.31.1753351087013;
        Thu, 24 Jul 2025 02:58:07 -0700 (PDT)
Message-ID: <cfeceb0f-4531-46fe-b10e-0b644026b26f@suse.com>
Date: Thu, 24 Jul 2025 11:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753348261.git.mykyta_poturai@epam.com>
 <cac6ce4379335b9a671eaddb934226363b3087f7.1753348261.git.mykyta_poturai@epam.com>
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
In-Reply-To: <cac6ce4379335b9a671eaddb934226363b3087f7.1753348261.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 11:44, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". Due to possible platform specific dependencies
> of the PCI host, we rely on dom0 to initialize it and perform
> a PCI PHYSDEVOP calls to add each device to SMMU.
> 
> Because pci_passthrough is not always enabled on all architectures, add
> a new function arch_pci_device_physdevop that checks if we need to enable
> a subset of the PCI subsystem related to managing IOMMU configuration
> for PCI devices.
> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PCI PHYSDEV ops when pci-passthrough is disabled.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I'd like to point out that ...

> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -57,6 +57,16 @@ static always_inline bool is_pci_passthrough_enabled(void)
>      return true;
>  }
>  
> +/*
> + * Since PCI passthrough is always enabled on x86, physdevop handling doesn't
> + * need special arch-specific behavior. Current call sites work with either
> + * return value, but true is more consistent with passthrough being enabled.
> + */
> +static inline bool arch_pci_device_physdevop(void)
> +{
> +    return true;
> +}

... the comment still isn't quite right. PCI-passthrough isn't always enabled
on x86. Both AMD_IOMMU and INTEL_IOMMU Kconfig options can be used to turn
respective support off. Things then work as if no IOMMU was found, which
means largely "no pass-through".

Jan

