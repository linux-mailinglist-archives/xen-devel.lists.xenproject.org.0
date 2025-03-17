Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA1A65513
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917163.1322136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuC4T-0002He-UL; Mon, 17 Mar 2025 15:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917163.1322136; Mon, 17 Mar 2025 15:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuC4T-0002FT-RZ; Mon, 17 Mar 2025 15:08:05 +0000
Received: by outflank-mailman (input) for mailman id 917163;
 Mon, 17 Mar 2025 15:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuC4S-0002FJ-Kz
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:08:04 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 980e4ec1-0341-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 16:07:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso15042985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:07:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975bdfsm15001813f8f.49.2025.03.17.08.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:07:49 -0700 (PDT)
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
X-Inumbo-ID: 980e4ec1-0341-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742224070; x=1742828870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rjQRww3wa6aTKDn8JIFbMoujhyDxTa3cZy2GqdSgozQ=;
        b=Ukh8advbpZ/SdlY/jm7wJvoOxC4BHrk7Ecg5cAynv73PY/4+DN7sJd12yjfHeyaRP7
         dWYOfikGHL9QGqDx8DUglKFhKK8qkps+0LcLMZzvEGr4KzpfUkaPLzy17bg0ZvM2rfB4
         G4rwbGyk5E/jZxt5CKjaKWCWGcjAUucRYOK85GzcszgGPeg19kDTdqS7PaqPOs+3JAtd
         uNtnl36k/eBEAdvpFzDaer1y4m8V5RdsWVT/87OkRxD+hwcMzkZ+hajuF2Iqt95R/k8H
         Uqd7Q68J74D8EtoTUvqsmx+9Y3u5UwJdpxE6xZsojfky3yG8Te/Da/EWPiJ2PSKO4fH3
         ctcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742224070; x=1742828870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjQRww3wa6aTKDn8JIFbMoujhyDxTa3cZy2GqdSgozQ=;
        b=B0oYvw2s5ljD5om+PkQzX4AEGazBwQGNqsOJQzXaYnEQk2LFfr7gXhsVfcOGUFnB0R
         s9wQ9Y/pxH1JNPrGMG3oHTTrK1YO5mkbre+om3WsSGqvHViuMX4SSAJ7jn5PkJqmUpvM
         FeWjp7fT6CQ5kQMWJSZWlRvgWE3e84OovVqz3EuAEjXbe7Csh6sbaz7ePMicSd9pnmQO
         /3lOOPYzDF6p1jC9RtY1VdvPLPOdeTnA528a1e7VJWObVQo+5oz6g0MkZDJH/Ebd/WAy
         iqib7BrRAvm04gJxlvNeE+0jbg4ZPA5MBuVDGSmw1FH4EtNbjmdU/Uvs3OXrNZMT6np/
         g1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhuTgv9wVLYh9oykJxfoZX1gJw3Apkyvwxs1b6ozF2gu3hBKyJQIhbaRTrMM9M4VxU51GEzgIx+iM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQS2UGu1X0hXvjL/MCo4gPpDFKuFlIAXJAjyHGnoD8iolp8mm+
	467dS8/OSepSPJqSyVR8vBdvcRNZKFWUcvgLQlrTuHqzDFDDcDl8HIA2ZYsl0g==
X-Gm-Gg: ASbGncuDhOZDYvOsCN3yikryQVjb56bSq77pxwvrNGE91ajRg2eFcrC6ZEwtSJEnf5y
	UVEDEclcsQBCmLk2CTIEOyugaAhUcGZXnNn59kGyfmtzMR9eW3+v4b8OxRnzTvRs8+zgjo9egy2
	0ZwXXmVHHue4khZtK89SxXhPQHpsETPrJ2jts59REpgBrxo8Twa2ZDg66SWOldkxb8qPARV3mEy
	VlR+fOcNnA1oR/g3T+YyXwA8iG4FliH/W4jgGHXqVcSVszZDMTFYl9L0yVl1SzRz7gTB+1P6qys
	FS1+CNFCg+fkCSjzS1eshFojt/DY6JhNrtuPW9dP0lp4hX5J6anrDqwwvoFtKOPJsrw0gD3NFyC
	ASWpQzcLqy++ergUjeA9oRvOB39Zifg==
X-Google-Smtp-Source: AGHT+IHzylMRCTZS13bjx2qWLECaCp+VsNQTvUOvI4O3FQ+r7LU9L0lrlrZ+pXj21ECK+6Cc3ZoaIw==
X-Received: by 2002:a5d:588b:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3971ded2b2dmr12999551f8f.29.1742224070210;
        Mon, 17 Mar 2025 08:07:50 -0700 (PDT)
Message-ID: <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
Date: Mon, 17 Mar 2025 16:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
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
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
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
In-Reply-To: <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 14:34, Mykyta Poturai wrote:
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -16,9 +16,18 @@
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/iommu.h>
>  #include <xen/param.h>
>  #include <xen/pci.h>
>  
> +bool is_pci_passthrough_enabled(bool dom0)
> +{
> +    if ( dom0 )
> +        return pci_passthrough_enabled || iommu_enabled;

As I think I said before - the function's name now no longer expresses
what it really checks. That (imo heavily) misleading at the use sites
of this function.

> +    return pci_passthrough_enabled;
> +}

Personally I also view it as undesirable that the global
pci_passthrough_enabled is evaluated twice in this function. Better
might be e.g.

bool is_pci_passthrough_enabled(bool dom0)
{
    if ( pci_passthrough_enabled )
        return true;

    return dom0 && iommu_enabled;
}

Yet then I'm not a maintainer of this code.

> @@ -85,7 +94,7 @@ static int __init pci_init(void)
>       * Enable PCI passthrough when has been enabled explicitly
>       * (pci-passthrough=on).
>       */
> -    if ( !pci_passthrough_enabled )
> +    if ( !is_pci_passthrough_enabled(true) )

There's no Dom0 in sight anywhere here, is there? How can you pass true
as argument for the "dom0" parameter?

> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -50,7 +50,7 @@ extern int pci_mmcfg_config_num;
>  extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>  
>  /* Unlike ARM, PCI passthrough is always enabled for x86. */
> -static always_inline bool is_pci_passthrough_enabled(void)
> +static always_inline bool is_pci_passthrough_enabled(__maybe_unused bool dom0)

Function parmeters don't need such annotation.

> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled(true) )
>              return -EOPNOTSUPP;

Seeing the function's parameter name, how do you know it's Dom0 calling
here?

Jan

