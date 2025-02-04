Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB8A2746B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881621.1291777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJxW-0006CU-93; Tue, 04 Feb 2025 14:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881621.1291777; Tue, 04 Feb 2025 14:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfJxW-0006AP-5f; Tue, 04 Feb 2025 14:31:26 +0000
Received: by outflank-mailman (input) for mailman id 881621;
 Tue, 04 Feb 2025 14:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfJxU-0006AJ-Ca
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:31:24 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4d8bc29-e304-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 15:31:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so87036066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:31:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d0de4sm940455166b.67.2025.02.04.06.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:31:21 -0800 (PST)
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
X-Inumbo-ID: b4d8bc29-e304-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738679482; x=1739284282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DjK2zZBPE6KdGClLSA+ycif6sJlbC8VNUKn0ZccrQhY=;
        b=PJGJCnIPB9XKZrvtaMDO8AvTXXx+J0a4L/Dtz4Om6nL505k1Zmtj6bRq6pKpGtfa+j
         hMCWXZ6GDunoeF8uQvaag8Dkbm5rKoeI4JMOREHJ/O98TpOyc0BD1I1JuQpDGBpT6LEm
         IzQgn1qHK+uuu9Q/PyorXxdri4v3aJlCkP9Sc1TVl8FKGWZDCrvq+pAmRKDitsuu/R9E
         psCTVxDJAaP+58ajGtnJ60akvMxJ5+CHvG8TgWHIYr1zvk3S3lTPuGiiYuh0lahqKFld
         gwhRfgjGZEPIsjfEYvRZCxVXGYtNMyrCkw37nmGKLU761bzCi8JaOLSX6sFRl0Dk0kO4
         mbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679482; x=1739284282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjK2zZBPE6KdGClLSA+ycif6sJlbC8VNUKn0ZccrQhY=;
        b=RjBHh6v1RguKmnmWfTouSYgTTEqpc3otFLQAoWb2Dx122doqD56hK57ltuBBGYwY2M
         2V5bHPrCNZPUyK/hjhFr3SeRLz8qE5j6EBw61n3/k0v5Sre1QqHZNRccllpxtPnAACS2
         sbCN+b/+KvWVoDVzEhWwCKKzhTh+ucfdTHKqm/jLw1OyPtdJJO7xnsROyQkbGew+/4cm
         ws9z/EOj5y88vBI5YCMRyN99d+L9iW4WPuJFGpDmBtWGo8sCwXscQet27zHJiL5lYt4d
         pY8Uzu0h4Vt0PVOZoRpxI60i81Vahi7zs7zxWMnnD2+bha6Yr9Z7V/Ie01ucWw4NoMYl
         cmpw==
X-Forwarded-Encrypted: i=1; AJvYcCXX/TGgI0rqhGTea1vHVusdzparVAKweYKpMFhKeWK5QocGJ7hLIHRyGmzX8rlnSv8xN28Hxtykekk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgfgfrJoItzY/V/XKBEnv6ZHXWoKoeW5kdqj6nnlOTtFU0nnG4
	BDTxp7V6FmKIAbLX9I6fQU9ritq1Jqquqi334srWFY5kTiYRKCiyPnESSO/6tw==
X-Gm-Gg: ASbGncs/as76Rc1XCiKlThsnHNk25L3PTdk54MCbMOdlVg2UKukFaBmvbGGcV2oOaCp
	0q28UnVsH0k2k7bP0pFWTeyEpnE0/ftIrqFhHwGZhqbteml7Pl8mGusR/esKXikwhiv+DpshW8E
	nPlV/Cmdn2REBJK5YBzL4pLOR733H6ZGhJ4u6OJvS+s/crI7vyoWBr1TtyAzvDnx0uCnDutMaMV
	vyvpspyTPTlQyLn308bRlhNEIYOC5+LaHfkIunWj9Lcij+oGK0u1t843JSu+4B7fmzmVanVHIzj
	pIxLFYpuP2NG4AUOXmcVTmD4K4/tmBcUOqCPMLJx7XSHBJPcUemfIJzxJ6tkWG2D7nD0Pzhm/Km
	b
X-Google-Smtp-Source: AGHT+IESn4J0mqVTmtM7BhnTjNGqQntODaxWgw3t5GXLtUp1RMcjbfKPriNAqssH/yDxWf/9n0DzMQ==
X-Received: by 2002:a17:907:7211:b0:ab6:36fd:1c8f with SMTP id a640c23a62f3a-ab6cfdbdd99mr3336558466b.39.1738679481920;
        Tue, 04 Feb 2025 06:31:21 -0800 (PST)
Message-ID: <22f7f541-5c14-4f95-89c9-fae63882e768@suse.com>
Date: Tue, 4 Feb 2025 15:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/arm: enable dom0 to use PCI devices with
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
References: <cover.1738665272.git.mykyta_poturai@epam.com>
 <7d9c8b93c01ee56cb8da6e959a020946efe65330.1738665272.git.mykyta_poturai@epam.com>
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
In-Reply-To: <7d9c8b93c01ee56cb8da6e959a020946efe65330.1738665272.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 14:54, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.
> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.
> 
> is_pci_passthrough_enabled() is not an Arm-only construct, so remove the
> x86 definition of the function.

I can't see how x86 will continue to build correctly then. There's nowhere
else you introduce a replacement.

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;
> @@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;

This is (potentially) a functional change each on x86, which I don't
think would be correct. "Potentially" because without seeing what the
new is_pci_passthrough_enabled() does this is impossible to determine.

Jan

