Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE468854D1D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681027.1059545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHNx-0003JZ-NF; Wed, 14 Feb 2024 15:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681027.1059545; Wed, 14 Feb 2024 15:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHNx-0003Go-Ka; Wed, 14 Feb 2024 15:41:21 +0000
Received: by outflank-mailman (input) for mailman id 681027;
 Wed, 14 Feb 2024 15:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raHNv-0003Gg-P8
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:41:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eb53ca1-cb4f-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:41:18 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-411f17700ffso5152155e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:41:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z1-20020a05600c0a0100b00411ce6def3fsm2345857wmp.38.2024.02.14.07.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:41:17 -0800 (PST)
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
X-Inumbo-ID: 7eb53ca1-cb4f-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707925278; x=1708530078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5VUANlO1xV6UYsQayWjOtnZr9ZMmIC4eD4CnxviuJk=;
        b=NGrJJ/IZzZt1FZij4MTchjGnE0IxAPp0O9N9WzrOtjTeZgHAXDugX/ILzkLfT9JjVp
         Rd3aCDxq5SMHVu19QjzkgcJApVMhVEXmmPhaU6GzDGE+gmT5XBgSzbl86qhTvttx38v3
         Svl0tOXf99shij426gZ+vMdFApZrK461NklDyI6o2KMd0/u9dn7kWri18NoHXf4d0WbW
         DAXAW0+JOb6cNy2limWoCehV/tcf+mpG5bLh4rfS3eour8SROVXV96pgRET4k1dZq2K1
         VZprS+0h/FbD6vIJzEJP0cHB0BtaD17FbXH+WzrohyvoeW9V5NGztF1VXFXjG5+cB0oM
         xhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925278; x=1708530078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5VUANlO1xV6UYsQayWjOtnZr9ZMmIC4eD4CnxviuJk=;
        b=R61CI4IaKcjbeXZChJ2TWEIfyf4vUwLPUbMFDT5bNG6rNV3bH8SUQ0WuApSwPPDT8U
         ouCP5Q7GZWBdaPFV+yZWy6d+Hu4thkzzpZujOUNSK1IiLvE0b/LLIO9RKd1kwFctPCR6
         dUmp1GO+0ATXEcSPKe2YTQZH+f840rAFjop/bh8Wi+gI1ExdFJ+f9OjSBb52WT7usCbG
         lSGM19b+63awL8yBtF+KTaCf6LgduP+bcIGDQRkv1OG6GjhkB/olbWMJIqpSX24tUQZO
         H7L6YXlOceub/MZVj6Qn1DSapQS6m7OEEOHyhgOicv+EgHN7jn5hSBmvhhICMvq+7U0R
         +wuw==
X-Forwarded-Encrypted: i=1; AJvYcCXLtVIoyg9JcNBcqiNgGTWWaMynI5KSFoesoEQSeZHJWWINp0Lco9VvHdrk+wQxunJs1/mJG5r1dOQaXA958qRISSUnH8PGncjWWS4xsYQ=
X-Gm-Message-State: AOJu0YxU6MyzMQj4ky+rjVUhe9RKTKFdF2cHHb0IMHHqIuex4gqIPElr
	vGsROewaen1WMg5vSG42CZUHWIa0xXfGZ2YQb67/ZF95sC13/DOtLxwNAvI5nA==
X-Google-Smtp-Source: AGHT+IEBT8gmWi1+xReFfTrYPz8d/ygqnr42j1mWH+xNHEkxZU0eURsKajhdhsMuptbcDV+00FO+yw==
X-Received: by 2002:a05:600c:1991:b0:411:ffcd:8f81 with SMTP id t17-20020a05600c199100b00411ffcd8f81mr444660wmq.18.1707925277883;
        Wed, 14 Feb 2024 07:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbxt9DfIj066IoyEYa8+sAqo/Ls0rTvE2CQloCvqDBkLJVafjyucxcwVZ77MJLuYRfAxG1zwm3IDfUKl2zxALM06y03vNIvbv5vewqz3kNc76cq82N6ApMyyyznhVSZSL818KQtNgPoBg71BhQ7+mjN5YwJVrfV450TtmW2oMbPfSIwNwXF3TTfXGm7g0CVQgAPB5024FJZDEUt9OdOBN+CJQcAOPuoPkLvqOYX2nbx/KXQgSPP/y9uQZ/xDEb0TfDo+kFWv4ICj2nUZvXLjFVU4ZXbS/Fyd7Le1stBgAB5/9XMalQccR6Xg==
Message-ID: <180cac00-e7c4-4bea-bd13-c5983da707d7@suse.com>
Date: Wed, 14 Feb 2024 16:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 10/14] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-11-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240202213321.1920347-11-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 22:33, Stewart Hildebrand wrote:
> @@ -836,9 +870,20 @@ static int cf_check init_header(struct pci_dev *pdev)
>      if ( pdev->ignore_bars )
>          return 0;
>  
> -    /* Disable memory decoding before sizing. */
>      cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> -    if ( cmd & PCI_COMMAND_MEMORY )
> +
> +    /*
> +     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
> +     * always start with memory decoding disabled and to ensure that we will not
> +     * call modify_bars() at the end of this function.

To achieve this, fiddling with PCI_COMMAND_IO isn't necessary. Which isn't
to say its clearing should go away; quite the other way around: Why would
we leave e.g. PCI_COMMAND_MASTER enabled? In fact wasn't it in an earlier
version of the series that the guest view simply started out as zero? The
patch description still says so.

> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,13 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /* Make sure domU doesn't enable INTx while enabling MSI. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +        {
> +            pci_intx(pdev, false);
> +            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
> +        }

While here we're inside "if ( new_enabled )", ...

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -135,6 +135,13 @@ static void cf_check control_write(
>          }
>      }
>  
> +    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
> +    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
> +    {
> +        pci_intx(pdev, false);
> +        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
> +    }

.. here you further check that it's actually a 0->1 transition? Why
not alike for MSI?

Jan

