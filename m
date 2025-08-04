Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C869AB19DB8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068946.1432799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqfV-0006y2-6m; Mon, 04 Aug 2025 08:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068946.1432799; Mon, 04 Aug 2025 08:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqfV-0006vQ-3G; Mon, 04 Aug 2025 08:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1068946;
 Mon, 04 Aug 2025 08:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiqfU-0006vK-9A
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:35:40 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff99a0a7-710d-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 10:35:38 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af93150f7c2so506454366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:35:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm693128666b.59.2025.08.04.01.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:35:37 -0700 (PDT)
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
X-Inumbo-ID: ff99a0a7-710d-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754296538; x=1754901338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w9uFjqO2ZuAOL1+QcWPRm8ZGsnP+qx6Q4AE1F3h/KMw=;
        b=WaqCryJKY+bDhzQEKam95pXJm7SnRhU2X6NC3kZDmfDOMTuR23h101QEotLfrH6PIm
         VAYfQn5TbI8ZvPs7LWjeAgg0x1XSQPThqxRaHXRG9YHufNhvKSpc8H40OydxqoZh5cYn
         OygqmFtbCNlIJcsfVYrcW8O8mlPW/jZ8/aZu0LqTgv4Z7SpraKY1W1GWxEM5z9kADSdn
         e8D1KKSknLj6f2YtA5oM3qdZeuSccf5WBQ2ng/mNk6yOlVnQgwojnUetmhQBSeGcUenR
         ubhAGBT9hVkOtkdxMvK/S+6POMx0wqauhFQA6i80ksfBvbx+QE3mozVuGGaEYBV6SnIw
         WMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296538; x=1754901338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9uFjqO2ZuAOL1+QcWPRm8ZGsnP+qx6Q4AE1F3h/KMw=;
        b=SZ/2vs16PmwGOj9Igf3zuX30bjGjzFncoQzr3PDHdfZ8e8dFrAG4rqUAKUPmfmZCJg
         ofTXilg03dP1cX52fLYCBGvkv6v0nER1m6q2QuQez0bd6mcMI9aHQ8hvVzCBYOCOunjh
         53d4/af3F3WXuzrqOPNZhFtu4nBd66ftviVzT7ejoX4ScOULKdPH+8Kzl8TmeJ1kY4L5
         o9GlfdzUowiASTWYhiI1rPWHTsq+xlIJ+wNrPF3YMMAMDJn9Fz5dyxALhhDysjsqYO1X
         EVXYNjJpNpKpZw2bHLIm1VcTmYnWuCsxNQh4vRxu0rWpevQzPjJEeXtZtNkk5q1C+l7a
         Q/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW3ySxgmpYJOCkcKFPoLZ23Lk3DsY/EhQd5vmZ/v2UT47oOjPLqNtMXMl8hUSvosHATxwZ6JlkhJq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3R+ar3kFFgRjneNbXmlVnpQxjNu4XiS2wtnw3ZIjeOwzW5wwz
	Xj5xGngztCtTaDG9yufA3tlRM4IHcURdclk+zvl0LnBo+nCRKSGpS/z8VeO2pgPfIA==
X-Gm-Gg: ASbGncsY4QTSxMARwY43SoC9PgWGJPlnFvwukx14615ayn6Ld5wzyedXekLy4Dd+wGA
	UFRIDNbG0G+Wr74QLTz74Ep/haijWX3gO5IvWzm852ZLFdRjtpq7p5xrGfVC+TxI2X8btlGLAhX
	wHVl9X6Nye87yxrNSwRqfDyobbA/IueSCtp1zr7Q/nZcgSCse7Pewnl8YqSZ6uNKvSQ4X0tHCpe
	zTawiVhhLD0R1iK0S+tArO7dK6p+EmVg9PgNEy0I7FtSG4kqiHudtMfxcFDDe1iON0fKnUgxW0c
	6BYiHAZYzh0rLmBHgAZq/Ln9cKO9RNCljmkme72HOTAOQZRarJNey2FL07cTeTCfyyPiEH9V1O1
	cJ+lMlANe7NB/C6k5WlkF2vp4lBGiY6Mswv0Woo8dhJqpw/YCuk4G/fi7PohUCh04RMUJx8hRSo
	UCFjo/RLg=
X-Google-Smtp-Source: AGHT+IGl2pFVk64BeQvpUplaH6ylJJ9kjKTIQhorjoT7CmO+2aMlqIKIUS2w3lcEISzMxQF4+ED9WA==
X-Received: by 2002:a17:907:7fa3:b0:ade:1863:6ff2 with SMTP id a640c23a62f3a-af9401f489dmr927532266b.52.1754296537971;
        Mon, 04 Aug 2025 01:35:37 -0700 (PDT)
Message-ID: <123626b4-3234-40e5-b1cf-bd5c2b19cbc8@suse.com>
Date: Mon, 4 Aug 2025 10:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/pci: add discovered PCI device at boot
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <5097b76acf0a5c64cc78522f6af6233370c948e6.1753968306.git.mykyta_poturai@epam.com>
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
In-Reply-To: <5097b76acf0a5c64cc78522f6af6233370c948e6.1753968306.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 11:22, Mykyta Poturai wrote:
> Create add_discovered_pci_devices function that calls pci_device_add
> on every PCI device discovered.
> The devices will be added to dom_io so that they can be assigned
> later to other domains.

And why's the intermediate step necessary? IOW can't they be assigned to their
target domains right away, and only whatever's left would go to DOM_IO?

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1180,6 +1180,34 @@ int __init scan_pci_devices(void)
>      return ret;
>  }
>  
> +static int __init _add_discovered_pci_devices(struct pci_seg *pseg, void *arg)
> +{
> +    struct pci_dev *pdev;
> +    int ret = 0;
> +
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +    {
> +        ret = pci_add_device(dom_io, pdev->seg, pdev->bus, pdev->devfn, NULL,
> +                             NUMA_NO_NODE);
> +        if ( ret < 0 )
> +        {
> +            printk(XENLOG_ERR
> +                   "%pp: Failure adding the discovered pci device (Error %d)\n",
> +                   &pdev->sbdf, ret);
> +            break;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +void __init add_discovered_pci_devices(void)
> +{
> +    pcidevs_lock();
> +    pci_segments_iterate(_add_discovered_pci_devices, NULL);
> +    pcidevs_unlock();
> +}

This looks to merely be a specialized form of what ...

>  struct setup_hwdom {
>      struct domain *d;
>      int (*handler)(uint8_t devfn, struct pci_dev *pdev);

... follows below here. By generalizing what we have (perhaps from the top, i.e.
iommu_hwdom_init()), you'd also avoid violating Misra rule 2.1 on x86, as you add
unreachable code there.

Jan

