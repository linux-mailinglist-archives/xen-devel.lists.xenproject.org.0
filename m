Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53D9A0664
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819888.1233348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10qo-000835-7I; Wed, 16 Oct 2024 10:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819888.1233348; Wed, 16 Oct 2024 10:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10qo-000818-4l; Wed, 16 Oct 2024 10:01:54 +0000
Received: by outflank-mailman (input) for mailman id 819888;
 Wed, 16 Oct 2024 10:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t10qm-000812-KG
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:01:52 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa52dee3-8ba5-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 12:01:51 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d4c482844so3726514f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:01:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7f89233fsm3941539f8f.0.2024.10.16.03.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:01:50 -0700 (PDT)
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
X-Inumbo-ID: aa52dee3-8ba5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729072911; x=1729677711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxvRS70blFHUYe0EVyelAOAywhcxRj0DrkSHtRVI7vs=;
        b=GB6IE1IgW4R+ns3fvEzTBmSqTYCU9Ii4ZCbGKOR2ZE3mlvnpderYrgAUcJ5xE0ncCn
         WlWpfYaMmYiuMLXJ6gQYGL6DQOALS2c47T40seSF332hp7LRVKmq2Kb1Ry0JluiVqDPN
         kOIVS0jCq5294lWY0oxM4YzAWZFMKkGhUZl0cK3PcXIman1vj47VIbglOQ50Hs/QGHW0
         8zQyUcgFm5bnusJSPsvWJwn5dNFNczHrvN9pY5YTt1QbmCL5zzr4PyMRosvHHyzTRNPq
         RaFO/DWqXNr0NyW6musZTg+9b6rOTugveEy+dFwAtAkEScFRAMyLQzLLyFTlS+Wiayew
         Bnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072911; x=1729677711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxvRS70blFHUYe0EVyelAOAywhcxRj0DrkSHtRVI7vs=;
        b=NRLL54KuyXklun8rLoai3aikvNp6uCw9uCOINIfYxjZ5eeyXGDIrfQf8mdHR7tzqRt
         l54Wk0Er1d8Dn2rIKJzJ4BqVq26Mm07FW9a3DDV/5nusaT5vdYPwS3LdSNgR2On/jlty
         GvYscx3jNkwfq11h1uUpdctvumGOMQOg6EmSTbLiNX2wvxLAXOBDuNsfBrx6CwJ0wd4w
         xt5wYpiewfKRoQ87tgG21N8k1oKopjHfyM9/r0CqYyv+slgWOkvGBaLzLbTyloLYUM/s
         sR7zE4ij11yLgmzE+DRWvJDodnIiKgNvhNBDONVfvvwCVxugvoZF/AUYCXCOuqZbf0z8
         wUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG6l7zq796QEul5lVnHlFZQM5h6tTMXRaO4toE4f00tHaFSbzrqESkPL66vJDUxFMLSyIGL69A9B8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgJe/oe7RVNEcsJTbtVGaGLqUQKmoxRWSWwT04Euyk9a6dL07c
	MMqWMVg8jqCYczaVZS/D1IlpPKnlAP7daLZM/h6mQZACQsVYp3K1O/Fsfh4Mkg==
X-Google-Smtp-Source: AGHT+IGzcnqIj64u32KYBk3toJcT3pyU7rNc3pv7PQqUpZ7kpXzdblxDElzcFnbsRmh7Bj7xVw13Mg==
X-Received: by 2002:adf:ce83:0:b0:37d:480f:9a6c with SMTP id ffacd0b85a97d-37d86c02a75mr2178951f8f.25.1729072911000;
        Wed, 16 Oct 2024 03:01:51 -0700 (PDT)
Message-ID: <a20027e3-be10-46ce-bd2f-53e0cb1a19f0@suse.com>
Date: Wed, 16 Oct 2024 12:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
 <20241011152727.366770-4-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241011152727.366770-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 17:27, Stewart Hildebrand wrote:
> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
> structure") a lock was moved from allocate_and_map_msi_pirq() to the
> caller and changed from pcidevs_lock() to read_lock(&d->pci_lock).
> However, one call path wasn't updated to reflect the change, leading to
> a failed assertion observed under the following conditions:
> 
> * PV dom0
> * Debug build (CONFIG_DEBUG=y) of Xen
> * There is an SR-IOV device in the system with one or more VFs enabled
> * Dom0 has loaded the driver for the VF and enabled MSI-X
> 
> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:535
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040284da8>] R pci_get_pdev+0x4c/0xab
> (XEN)    [<ffff82d040344f5c>] F arch/x86/msi.c#read_pci_mem_bar+0x58/0x272
> (XEN)    [<ffff82d04034530e>] F arch/x86/msi.c#msix_capability_init+0x198/0x755
> (XEN)    [<ffff82d040345dad>] F arch/x86/msi.c#__pci_enable_msix+0x82/0xe8
> (XEN)    [<ffff82d0403463e5>] F pci_enable_msi+0x3f/0x78
> (XEN)    [<ffff82d04034be2b>] F map_domain_pirq+0x2a4/0x6dc
> (XEN)    [<ffff82d04034d4d5>] F allocate_and_map_msi_pirq+0x103/0x262
> (XEN)    [<ffff82d04035da5d>] F physdev_map_pirq+0x210/0x259
> (XEN)    [<ffff82d04035e798>] F do_physdev_op+0x9c3/0x1454
> (XEN)    [<ffff82d040329475>] F pv_hypercall+0x5ac/0x6af
> (XEN)    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
> 
> In read_pci_mem_bar(), the VF obtains the struct pci_dev pointer for its
> associated PF to access the vf_rlen array. This array is initialized in
> pci_add_device() and is only populated in the associated PF's struct
> pci_dev.
> 
> Access the vf_rlen array via the link to the PF, and remove the
> troublesome call to pci_get_pdev().
> 
> Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -736,7 +736,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          }
>      }
>  
> -    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
> +    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )

Unrelated to your change: Now that I look at this again, it seems slightly
wrong to me to use array slot 0 as "have we populated the array already"
indicator. If BAR0 was unused, we may end up doing this more than once.

Jan

