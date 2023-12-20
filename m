Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC8819AE9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657451.1026286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsKG-0003Dc-Tz; Wed, 20 Dec 2023 08:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657451.1026286; Wed, 20 Dec 2023 08:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsKG-0003Ax-Pb; Wed, 20 Dec 2023 08:53:12 +0000
Received: by outflank-mailman (input) for mailman id 657451;
 Wed, 20 Dec 2023 08:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsKF-0003Ao-CO
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:53:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2457f3a9-9f15-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 09:52:44 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso63522605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:52:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b00336787ccc92sm1634026wrx.114.2023.12.20.00.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:52:44 -0800 (PST)
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
X-Inumbo-ID: 2457f3a9-9f15-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703062364; x=1703667164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROU0AEBFYd3KnAl6fIcmKX1GoZ/DRJ6fdlH15aA/zvk=;
        b=a6i1fLT6T+Kh3riU/7pk0p4YiUvP0P2bZtjakwcoYAz1FgG8yiQ+m9xZwOxdVYfkK1
         HJkq4525NmLr3IlGvQSZ6YqhX7K0Mf0qWrMWUnJXrHzqpRpNfF0ON7KuU3WBtU+R2bnF
         pluWVHJz8OmqOgiVJuhUedv2pVwUHkswPnzWBnj8HAryh6h7qgCq+HGZ0BIigotnU9Pk
         lDsi49JCwwULlIjohS49SFAOrm3O++MO1QCNivWchpbD4fJBoaN8qlkWEZ/CQxgqpiwG
         sSjbykTGkp34gBLJ7aUxU0rNM1vDrPZgCdovydQfx4DoQkdnQchA24Re8UleEAmxFKJz
         /TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062364; x=1703667164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROU0AEBFYd3KnAl6fIcmKX1GoZ/DRJ6fdlH15aA/zvk=;
        b=NbCpuNGyiATPDaFuSWG5eBts6/EFkDxFENilDOtdTwNninCYJTJQitrqHLUGq0z1JR
         hTy9s0pP7d5/Zl48Z6jUVKVAHIMMiGogL8i/bxoOGhPoOOoUTzIAsD+Vd7etMQ/FlAoc
         ePTPWcUA4dimK8Q/k4khh4XMlEfMbtlO0ffxtxuWirfG8tcT/h7HcDp+HAo2y9WyhSQo
         PxuWorrauY8Kd2tQuGHf55x/rNS80I5nUM7jz6BN5BUqihWlPwmm3hLKSvjO2jvjn585
         JXs4MaPB5RL+tK0rQzc94JjZEwS81YeEMLAUEo0GWcJlN32i8ycrnxwYdR6AesA7efkf
         r86w==
X-Gm-Message-State: AOJu0YwpTxvy/1o2xefAs5Dg7AIdNd+YcOnM4qVCaqZPtRcG3wEpgJ8d
	MFU4BdLdY5GkoSN+nO0fCiQrp15xZn/z3i/gq9tk
X-Google-Smtp-Source: AGHT+IFJkAgctcsEQG8iQZ2j+ZOLOfSg2sAGsVk7rLJuc70FR5XSp/O0nvhLikQLrCC9RnUDxmHLiw==
X-Received: by 2002:a05:600c:43c5:b0:405:1c19:b747 with SMTP id f5-20020a05600c43c500b004051c19b747mr10783109wmn.15.1703062364399;
        Wed, 20 Dec 2023 00:52:44 -0800 (PST)
Message-ID: <dfb8321b-f9ed-48ec-b646-830caba2c4a1@suse.com>
Date: Wed, 20 Dec 2023 09:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -452,21 +452,29 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>              if ( rc > 0 )
>              {
>                  struct msi_desc *msi_desc = NULL;
> +                struct pci_dev *pdev;
>  
>                  pcidevs_lock();
>  
> -                rc = pci_enable_msi(&msi, &msi_desc);
> -                if ( !rc )
> +                pdev = pci_get_pdev(NULL, msi.sbdf);
> +                if ( pdev )
>                  {
> -                    struct irq_desc *desc = irq_to_desc(msi.irq);
> -                    unsigned long flags;
> -
> -                    spin_lock_irqsave(&desc->lock, flags);
> -                    rc = setup_msi_irq(desc, msi_desc);
> -                    spin_unlock_irqrestore(&desc->lock, flags);
> -                    if ( rc )
> -                        pci_disable_msi(msi_desc);
> +                    rc = pci_enable_msi(pdev, &msi, &msi_desc);
> +
> +                    if ( !rc )
> +                    {
> +                        struct irq_desc *desc = irq_to_desc(msi.irq);
> +                        unsigned long flags;
> +
> +                        spin_lock_irqsave(&desc->lock, flags);
> +                        rc = setup_msi_irq(desc, msi_desc);
> +                        spin_unlock_irqrestore(&desc->lock, flags);
> +                        if ( rc )
> +                            pci_disable_msi(msi_desc);
> +                    }
>                  }
> +                else
> +                    rc = -ENODEV;
>  
>                  pcidevs_unlock();

When mere re-indenting is needed, and even more so when indentation gets
this deep, I think it is necessary to consider alternatives: With

                pdev = pci_get_pdev(NULL, msi.sbdf);
                rc = pdev ? pci_enable_msi(pdev, &msi, &msi_desc) : -ENODEV;

I think all of the other code churn could be avoided.

Jan

