Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9FA6548B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917100.1322101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBtb-0006FG-AQ; Mon, 17 Mar 2025 14:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917100.1322101; Mon, 17 Mar 2025 14:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBtb-0006Cc-74; Mon, 17 Mar 2025 14:56:51 +0000
Received: by outflank-mailman (input) for mailman id 917100;
 Mon, 17 Mar 2025 14:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBta-0006CW-4t
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:56:50 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7e4d03-0340-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:56:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso14915395e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:56:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ec14bsm15154422f8f.100.2025.03.17.07.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:56:47 -0700 (PDT)
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
X-Inumbo-ID: 0d7e4d03-0340-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742223408; x=1742828208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=osOn3GFo3q5/DPuTeDnhQ4u6DQUGkLET9/F9zhspBGg=;
        b=ROixsBu2EGJOcQ4h16UadfkKvjvwXefKwBAlYeUjGqRSGWcJXjNEKasxtDb9YqY3+A
         DBDP6XDVximb8YJz9QX4qGNt6jqKzcPyWngXMN2ominuisqfDXaM6xfY2wZvt0Rc9der
         K+aYEGhgiamM0wpBO1FIkoZZmXb+o9Vad3KmA7nhhum4WpmkMC4fR0faVf1XPpTSFjwy
         8DO7g2pSwmhZgMUdo7tUhhYi7IF93nK9AX+W1ha6UxzpDvctOX2ITJh73wjDEBozHj2k
         4eHKrIzGVMAp9mp+RCsL/c/4XakmXi8eWHZsrVvHH+JwMkyvwtVVKtU9T5BHcAnTqFAR
         OZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223408; x=1742828208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osOn3GFo3q5/DPuTeDnhQ4u6DQUGkLET9/F9zhspBGg=;
        b=tV1zhSxEU3A6etvNI6Jw/0eL5ApxObYA0Yp4UmxfzvfeHSr8bHfNxz7RT09Z1ee8oG
         g3672iuJyauiYMgSFRzW3+y7bVuGcVO8rYVcv7lBqJQIBVOChT0VRKmqXI9hUR4HV51a
         SAQdVtTp/YoMhOy443v1NsEhAsf+mmmJvDK60nhpyHd8/f3UrjQOfgqbR3Q/mcnMSgmD
         Ko5aMLc/FjKKHAXoxawP5EfjHYGgWOmfflxdECc+nemh7+Rqd5YPv8y8pCjazZmAMUYi
         M6DzwtpQx4gm5Ta1ksM07ow9hKxk2WxPNs8W3uE7kOhdzHFt2iVJIPKA3NN6de4+zodJ
         VedA==
X-Forwarded-Encrypted: i=1; AJvYcCWRD16kRfHWUOc8BBOzLJmLYzjQAhgOr3q7V3qPgTDCxFwD4QejSqUqg7D2q2O7ZKKXiuoUT9KK1cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6jO8r6/J7xED0F1LmDq0KgAmUr+v5qgTFwRVhV/DnNzFgE+2Y
	oZHYjOzWd3+xs1O8yqm6ogZWBhMjHQtPVOx2gcNgS4t+DKdwTjk0PUetIlszwAoherQ2CeT6ATI
	=
X-Gm-Gg: ASbGncscuL/Pt/iYx48SYf02QkAgrOqa84dpncV+1zQDJWU3GLfzNooLAAkWepzY/kq
	piORXK69178+r5+4fMi77NcKylYfA128YFGunETeJKkTrTFfZ+Tp5BfER/Qy9zweGy7woZgK+ZL
	buFrZ0XgAki2yTIiEfZ59LVK9ok41wZyK4JhHr1vrNVpxBdqpWqFiDvcflOqv5/MIY8eLmRCERN
	hYLt2Y9CoyjhQj7gLvFHJ4dp5kx51ph18JdRD8UKBjOTs2TX5jbkXi+Djfj07e7LwPO2nTh+KK0
	krflrhTBm/3vev7epE7PJlQ+EKQbrxFOQAY+vOfA4M2vHLb+Z7U/tfkIo/esw7PeF8ZOZfVlFZG
	uorXEwPtPbnUC6IiUrmZMgi8dO/CSDw==
X-Google-Smtp-Source: AGHT+IFWAvO9kxg0Dq4FOpjKL3+86oNZtRJ9Ymzr4s5ten32kwahcqc+jJuNXx7FcdHuSDr8XWt9iw==
X-Received: by 2002:adf:cb83:0:b0:391:2d8f:dd59 with SMTP id ffacd0b85a97d-3971dae8de5mr9901457f8f.24.1742223408263;
        Mon, 17 Mar 2025 07:56:48 -0700 (PDT)
Message-ID: <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com>
Date: Mon, 17 Mar 2025 15:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
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
In-Reply-To: <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 14:34, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this patch is to add a way to register PCI device
> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> before assigning that device to a domain.
> 
> This behaves similarly to the existing iommu_add_dt_device API, except it
> handles PCI devices, and it is to be invoked from the add_device hook in the
> SMMU driver.
> 
> The function dt_map_id to translate an ID through a downstream mapping
> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> Regarding pci_for_each_dma_alias question: getting host bridge node
> directly seems like a simpler solution with the same result. AFAIU
> with pci_for_each_dma_alias in linux we would arrive to the host brige
> node anyway, but also try to call dt_map_id for each device along the
> way. I am not sure why exactly it is done this way in linux, as
> according to the pci-iommu.txt, iommu-map node can only be present in
> the PCI root.
> 
> v8->v9:
> * replace DT_NO_IOMMU with 1
> * guard iommu_add_pci_sideband_ids with CONFIG_ARM

I fear I'm confused: Isn't this contradicting ...

> v7->v8:
> * ENOSYS->EOPNOTSUPP
> * move iommu_add_pci_sideband_ids to iommu.c to fix x86 build

... this earlier change? Really, with there being no caller, I can't see
why there could be any build issue here affecting only x86. Except for
Misra complaining about unreachable code being introduced, which I'm sure
I said before should be avoided.

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -20,6 +20,7 @@
>  #include <xen/param.h>
>  #include <xen/softirq.h>
>  #include <xen/keyhandler.h>
> +#include <xen/acpi.h>
>  #include <xsm/xsm.h>
>  
>  #ifdef CONFIG_X86
> @@ -744,6 +745,20 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>      return 0;
>  }
>  
> +#ifdef CONFIG_ARM

I realize we have CONFIG_X86 here as well (visible even in context of the
earlier hunk. Yet then the goal ought to be to reduce these anomalies, not
add new ones. Since I don't have a clear picture of what's wanted, I'm also
in trouble suggesting any alternative, I'm afraid.

> +int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = -EOPNOTSUPP;
> +
> +#ifdef CONFIG_HAS_PCI
> +    if ( acpi_disabled )
> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +#endif
> +
> +    return ret;
> +}
> +#endif
> +
>  /*
>   * Local variables:
>   * mode: C

Having reached the end of the changes to this file, it's also not quite clear
why xen/acpi.h would need including uniformly. Can't this live inside the
outer #ifdef?

Further, since #ifdef-ary is used here already anyway, why ...

> @@ -238,8 +252,32 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   */
>  int iommu_remove_dt_device(struct dt_device_node *np);
>  
> +#else /* !HAS_DEVICE_TREE */
> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>  #endif /* HAS_DEVICE_TREE */

... resort to a stub when the inner #ifdef could simple be extended?

Jan

