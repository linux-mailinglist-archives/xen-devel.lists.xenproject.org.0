Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBD950705
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 16:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776322.1186451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sds5b-0002lz-2D; Tue, 13 Aug 2024 14:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776322.1186451; Tue, 13 Aug 2024 14:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sds5a-0002k3-Up; Tue, 13 Aug 2024 14:01:30 +0000
Received: by outflank-mailman (input) for mailman id 776322;
 Tue, 13 Aug 2024 14:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sds5Z-0002jx-G7
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 14:01:29 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884d7266-597c-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 16:01:27 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f1798eaee6so52990131fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 07:01:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd196a7b29sm2982709a12.56.2024.08.13.07.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 07:01:25 -0700 (PDT)
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
X-Inumbo-ID: 884d7266-597c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723557686; x=1724162486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X1eSclQ2lPG1v/tyz4BC45xToY1RW2r4Zy/KO0O9PIc=;
        b=gQKW8dBPkYSbauq6uGlZ1vckJfeoGWW9JVEcYPM6DHhl5uxCheDsJk2CXpFiiBHRjL
         RhuimsmJlOTCoky0crOqBe6nhJYr3PKWf1n3uSUXNJRb28f4Q4cP4RCeIPsQ+jtxZKd+
         u5fEy/fBlpsuGxXV9pmxDH6yIDWRu0xrJMUBVISigVi/ObZrgoFU9VxjsOeQ2PH0SHRE
         Fra0K4zDHe8R0FsqxjGYcPhfyfMqa/Ol/lI8HskQm8H7mRrRcLx+jJyDKXAUoGccD8fh
         11zVlD1HJaui5y9pqNz+fk0eKzjzoiqtxTLJMPkggNSLb1dcFK0bBjBvASA0v2tw+fyh
         oSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723557686; x=1724162486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1eSclQ2lPG1v/tyz4BC45xToY1RW2r4Zy/KO0O9PIc=;
        b=Yb4de12G+VrpbW9aru9bThUOnySAfaqF8ejhE4d1qflP+pZ2VtvAKg31Y39uwlbu/Z
         696jxtY/8kWR28ROOreJEuKnflb2ysYIf2RQwo+A6GFCQpmBUE2G2V3KVhJNewNIzvKh
         ZDioLm8hDUfMEOh8xI2fV39MeXwxaYZFT3ciu+9F/WQ4EvE7hYern/Qqltx7GrAAHPSB
         RrAEMF1zgCSjTX6VF3y2XtFRsx6+1ViL1ejjZzpLXAn0RCidQedupXH9HKj6Cl/70YnP
         5l+JcavlS2skg9WR7KYkL1e4GbXDYDO5tNgknPSKmJJj7CVSa0QTKEf09tiiJQOMMbpG
         PhQw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2DRPaFMRq8oWVY4IVXwckHwIREoQuquK945Om/++kMNY2r9eYgPU7M+fa4D0dyRi2H5GQ/9bojO/JjGJSZhovFyt0iLNS6nwU1Di2xA=
X-Gm-Message-State: AOJu0Yxy2bFCG1Cxh6EiaPIrgN6WcNb9g0RBgvR+tHOtsxzbO/wsqMAo
	U5L0KRHpIwmVC9Re/+RhnHmVAgYgVkSCpo0aiKkx3Q94xok3ZzmhulnuZ0Mx0Q==
X-Google-Smtp-Source: AGHT+IGm5LXC+abpifOmChOcax9ircJfl7s+zmeaDALG3WoSVo/zfdg99EE/mpvBiWwQNiwtTaO8zg==
X-Received: by 2002:a05:651c:2228:b0:2ec:1810:e50a with SMTP id 38308e7fff4ca-2f2b717811emr32658521fa.32.1723557686181;
        Tue, 13 Aug 2024 07:01:26 -0700 (PDT)
Message-ID: <74f88a45-a632-4ca6-9cee-95f52370b397@suse.com>
Date: Tue, 13 Aug 2024 16:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240812203938.981588-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240812203938.981588-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2024 22:39, Stewart Hildebrand wrote:
> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
> and changed from pcidevs_lock() to read_lock(&d->pci_lock). However, one
> call path wasn't updated to reflect the change, leading to a failed
> assertion observed under the following conditions:
> 
> * PV dom0
> * Debug build (debug=y) of Xen
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
> Add a link from the VF's struct pci_dev to the associated PF struct
> pci_dev, ensuring the PF's struct doesn't get deallocated until all its
> VFs have gone away. Access the vf_rlen array via the new link to the PF,
> and remove the troublesome call to pci_get_pdev().
> 
> Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
> pci_add_device() to set up the link from VF to PF. In case the new
> pci_add_device() invocation fails to find the associated PF (returning
> NULL), we are no worse off than before: read_pci_mem_bar() will still
> return 0 in that case.
> 
> Note that currently the only way for Xen to know if a device is a VF is
> if the toolstack tells Xen about it. Using PHYSDEVOP_manage_pci_add for
> a VF is not a case that Xen handles.

How does the toolstack come into play here? It's still the Dom0 kernel to
tell Xen, via PHYSDEVOP_pci_device_add (preferred) or
PHYSDEVOP_manage_pci_add_ext (kind of deprecated; PHYSDEVOP_manage_pci_add
is even more kind of deprecated).

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -662,34 +662,32 @@ static int msi_capability_init(struct pci_dev *dev,
>      return 0;
>  }
>  
> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
> +static u64 read_pci_mem_bar(struct pf_info *pf_info, u16 seg, u8 bus, u8 slot,
> +                            u8 func, u8 bir, int vf)
>  {
> +    pci_sbdf_t sbdf = PCI_SBDF(seg, bus, slot, func);
>      u8 limit;
>      u32 addr, base = PCI_BASE_ADDRESS_0;
>      u64 disp = 0;
>  
>      if ( vf >= 0 )
>      {
> -        struct pci_dev *pdev = pci_get_pdev(NULL,
> -                                            PCI_SBDF(seg, bus, slot, func));
>          unsigned int pos;
>          uint16_t ctrl, num_vf, offset, stride;
>  
> -        if ( !pdev )
> -            return 0;
> -
> -        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
> -        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
> -        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
> -        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
> -        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
> +        pos = pci_find_ext_capability(sbdf, PCI_EXT_CAP_ID_SRIOV);
> +        ctrl = pci_conf_read16(sbdf, pos + PCI_SRIOV_CTRL);
> +        num_vf = pci_conf_read16(sbdf, pos + PCI_SRIOV_NUM_VF);
> +        offset = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_OFFSET);
> +        stride = pci_conf_read16(sbdf, pos + PCI_SRIOV_VF_STRIDE);
>  
>          if ( !pos ||
>               !(ctrl & PCI_SRIOV_CTRL_VFE) ||
>               !(ctrl & PCI_SRIOV_CTRL_MSE) ||
>               !num_vf || !offset || (num_vf > 1 && !stride) ||
>               bir >= PCI_SRIOV_NUM_BARS ||
> -             !pdev->vf_rlen[bir] )
> +             !pf_info ||

See further down - I think it would be nice if we didn't need this new
check.

> @@ -813,6 +811,7 @@ static int msix_capability_init(struct pci_dev *dev,
>          int vf;
>          paddr_t pba_paddr;
>          unsigned int pba_offset;
> +        struct pf_info *pf_info = NULL;

Pointer-to-const?

> @@ -827,9 +826,12 @@ static int msix_capability_init(struct pci_dev *dev,
>              pslot = PCI_SLOT(dev->info.physfn.devfn);
>              pfunc = PCI_FUNC(dev->info.physfn.devfn);
>              vf = dev->sbdf.bdf;
> +            if ( dev->virtfn.pf_pdev )
> +                pf_info = &dev->virtfn.pf_pdev->physfn;
>          }
>  
> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
> +        table_paddr = read_pci_mem_bar(pf_info, seg, pbus, pslot, pfunc, bir,
> +                                       vf);

I don't think putting the new arg first is very nice. SBDF should remain
first imo. Between the latter arguments I'm not as fussed.

> @@ -446,7 +448,27 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>  
>      list_del(&pdev->alldevs_list);
>      pdev_msi_deinit(pdev);
> -    xfree(pdev);
> +
> +    if ( pdev->info.is_virtfn )
> +    {
> +        struct pci_dev *pf_pdev = pdev->virtfn.pf_pdev;
> +
> +        if ( pf_pdev )
> +        {
> +            list_del(&pdev->virtfn.next);
> +            if ( pf_pdev->physfn.dealloc_pending &&
> +                 list_empty(&pf_pdev->physfn.vf_list) )
> +                xfree(pf_pdev);
> +        }
> +        xfree(pdev);
> +    }
> +    else
> +    {
> +        if ( list_empty(&pdev->physfn.vf_list) )
> +            xfree(pdev);
> +        else
> +            pdev->physfn.dealloc_pending = true;
> +    }

Could I talk you into un-indenting the last if/else by a level, by making
the earlier else and "else if()"?

One aspect I didn't properly consider when making the suggestion: What if,
without all VFs having gone away, the PF is re-added? In that case we
would better recycle the existing structure. That's getting a little
complicated, so maybe a better approach is to refuse the request (in
pci_remove_device()) when the list isn't empty?

> @@ -700,10 +722,22 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * extended function.
>           */
>          if ( pdev->info.is_virtfn )
> +        {
> +            struct pci_dev *pf_pdev;
> +
>              pdev->info.is_extfn = pf_is_extfn;
> +            pf_pdev = pci_get_pdev(NULL,
> +                                   PCI_SBDF(seg, info->physfn.bus,
> +                                            info->physfn.devfn));
> +            if ( pf_pdev )
> +            {
> +                pdev->virtfn.pf_pdev = pf_pdev;
> +                list_add(&pdev->virtfn.next, &pf_pdev->physfn.vf_list);
> +            }
> +        }

Hmm, yes, we can't really use the result of the earlier pci_get_pdev(), as
we drop the lock intermediately. I wonder though if we wouldn't better fail
the function if we can't find the PF instance.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -150,7 +150,17 @@ struct pci_dev {
>          unsigned int count;
>  #define PT_FAULT_THRESHOLD 10
>      } fault;
> -    u64 vf_rlen[6];
> +    struct pf_info {
> +        /* Only populated for PFs (info.is_virtfn == false) */
> +        uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
> +        struct list_head vf_list;             /* List head */
> +        bool dealloc_pending;
> +    } physfn;
> +    struct {
> +        /* Only populated for VFs (info.is_virtfn == true) */
> +        struct pci_dev *pf_pdev;              /* Link from VF to PF */
> +        struct list_head next;                /* Entry in vf_list */

For doubly-linked lists "next" isn't really a good name. Since both struct
variants need such a member, why not use vf_list uniformly? That'll then
also lower the significance of my other question:

> +    } virtfn;

Should the two new struct-s perhaps be a union?

Jan

