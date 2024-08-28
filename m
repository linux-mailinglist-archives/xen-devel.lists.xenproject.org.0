Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4207596250D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 12:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784640.1194041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjG2W-0007X4-Sq; Wed, 28 Aug 2024 10:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784640.1194041; Wed, 28 Aug 2024 10:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjG2W-0007Uw-Pc; Wed, 28 Aug 2024 10:36:36 +0000
Received: by outflank-mailman (input) for mailman id 784640;
 Wed, 28 Aug 2024 10:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjG2W-0007Qm-2t
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 10:36:36 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bda02e-6529-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 12:36:34 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23651so1008231a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 03:36:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2073770a12.16.2024.08.28.03.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 03:36:33 -0700 (PDT)
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
X-Inumbo-ID: 65bda02e-6529-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724841394; x=1725446194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2kqiz6hB63jDsjhvU7O+cVSBsv9rLDySCre9tX4VYoc=;
        b=L8fd5bOb9nsRoZ2k4El7P9Wy6s0aMCErGM4sTuOUSBcei3CgvVX7G5Y6s6ZzBaR5xD
         RR5wetb/403lQUgISNcmZkYoXbG+/eq82j2vphoy8jnJf6+PsmCwEHqJXqMPTSh8Ib8K
         ErZwwTTuNOMf5JE88d6MSZPJ5x1sFqJ9YmsNJWiEP1t2fcRvlrF1puYnn6hDMR4XdJbR
         OCFxknhVLMSNIC9SQBP4WPRwcU9Qh1s34+llmfQ5Y499dXR3lyFmWdPMCiaYJQRstK4K
         MHRAbMoDloYE/TKfs1WP9W4IMztCiSa4GyUi3AYU6xLx/q1he4Rm1H0LHqM0Jrnbxfxj
         yymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724841394; x=1725446194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kqiz6hB63jDsjhvU7O+cVSBsv9rLDySCre9tX4VYoc=;
        b=uqg4sO6ibGnfc4r3IsbiyJi/dZpNQWlGDolLryBDTcyTfwE+iEJ/6hpWAYAENyKB00
         Jz3RTn3NmGfeAHYS8oxRUjs0X29uDo9u+hCWewrz/cssqoRujRDfNou0O4Q3Z3dTjlCv
         AOBa0mmqbUza8TCCB9RLGshQVsEcjpBVr2TEmjGFkGXm1X9qmvGp4OvhFUzOBDWKeAFH
         ZQWxQAqhEGSFemooF9AK1lQMpEbVV0GxR1FgFgISzG/QmuDgmlsu90XPjpDHHTJ3Q7Mg
         o7xv30lDfcjeft4sX9fIQ4BnedwLi7hGCIS8bQHXlCf2Hhu18yrZy9bReer5+uv0Hvps
         p6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeD+aZmDGPi0tXtyxal810n3P6ym73UYxCu72YPycqtv2qGs3EE4Qj8GTmQdH4iBgu/4HttP/RsTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD+W+z9m9artptSd7Trh1CMQ+LvonAgHrhY6JX9cqR8xjthb88
	oHfHJFQ7PVEzi0jlCmvMzc8UHIzDM4mHAV3TOqiQFS7dXC36ZMsItPZY/9ZbUl+y2t0PAVMfOMo
	=
X-Google-Smtp-Source: AGHT+IEbZLBJ39Ltx3KW1Eojwj1Ryf3ceRjTrvHVP1vtnAwndaFWVfOGcT6/eXJYJGc2Ex+79UUxMg==
X-Received: by 2002:a05:6402:51c6:b0:5be:e1bc:2304 with SMTP id 4fb4d7f45d1cf-5c2138e0fdemr1388426a12.7.1724841394066;
        Wed, 28 Aug 2024 03:36:34 -0700 (PDT)
Message-ID: <0742fd21-d606-440a-a7fa-dd3bfccfa1c4@suse.com>
Date: Wed, 28 Aug 2024 12:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240827035929.118003-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 05:59, Stewart Hildebrand wrote:
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
> Add links between the VF's struct pci_dev and associated PF struct
> pci_dev, ensuring the PF's struct doesn't get deallocated until all its
> VFs have been removed. Access the vf_rlen array via the new link to the
> PF, and remove the troublesome call to pci_get_pdev().
> 
> Add a call to pci_get_pdev() inside the pcidevs_lock()-locked section of
> pci_add_device() to set up the link from VF to PF. In case the new
> pci_get_pdev() invocation fails to find the associated PF (returning
> NULL), return an error.
> 
> In pci_remove_device(), handle an issue with a corner case when a PF is
> removed with VFs enabled, then re-added with VFs disabled. During PF
> removal, a buggy PF driver may fail to disable SR-IOV, leaving stale
> dangling VFs. At least Linux warns in this case:
> 
> [  106.500334]  0000:01:00.0: driver left SR-IOV enabled after remove
> 
> If the PF is subsequently re-added with VFs disabled, the previously
> associated VFs in Xen would not be backed by a device. Any attempt to
> access the config space of the stale VF would be invalid. Avoid issues
> in this case by removing the VFs right away when removing the PF. This
> also happens to simplify the maintenance of the PF<->VF links since the
> associated PF will always exist during the lifetime of a VF. Note,
> however, if a PF is removed before the VFs, Xen will return an error
> for the VF removals since they were already removed.

Not very nice, but probably tolerable.

> ---
> When I tested removing a PF with VFs enabled, then re-adding with VFs
> disabled, I observed the following Xen crash when dom0 attempted to
> access the config space of a stale VF:
> 
> (XEN) Assertion 'pos' failed at arch/x86/msi.c:1275
> (XEN) ----[ Xen-4.20-unstable  x86_64  debug=y  Tainted:   C    ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040346834>] R pci_msi_conf_write_intercept+0xa2/0x1de
> (XEN)    [<ffff82d04035d6b4>] F pci_conf_write_intercept+0x68/0x78
> (XEN)    [<ffff82d0403264e5>] F arch/x86/pv/emul-priv-op.c#pci_cfg_ok+0xa0/0x114
> (XEN)    [<ffff82d04032660e>] F arch/x86/pv/emul-priv-op.c#guest_io_write+0xb5/0x1c8
> (XEN)    [<ffff82d0403267bb>] F arch/x86/pv/emul-priv-op.c#write_io+0x9a/0xe0
> (XEN)    [<ffff82d04037c77a>] F x86_emulate+0x100e5/0x25f1e
> (XEN)    [<ffff82d0403941a8>] F x86_emulate_wrapper+0x29/0x64
> (XEN)    [<ffff82d04032802b>] F pv_emulate_privileged_op+0x12e/0x217
> (XEN)    [<ffff82d040369f12>] F do_general_protection+0xc2/0x1b8
> (XEN)    [<ffff82d040201aa7>] F x86_64/entry.S#handle_exception_saved+0x2b/0x8c
> 
> This crash is avoided by removing the VFs right away with the PF.

If I'm not mistaken the same would happen independent of your change if
Dom0 disabled VFs without reporting their removal (first). That's
technically no different from removing with VFs enabled, then adding
with VFs disabled. We may want to be able to cope with that.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>  
>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>  
> +    INIT_LIST_HEAD(&pdev->physfn.vf_list);

There is a certain risk with doing such uniformly when the field is part
of a union. Yes, little initialization has happened up to here, but I'm
still concerned. (One of the reasons I don't like the struct list_head
instances to be split, despite your legitimate point regarding naming.)
At the very least this wants moving yet earlier in the function, before
the new struct is passed anywhere else.

> @@ -700,10 +706,31 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
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
> +                list_add(&pdev->virtfn.entry, &pf_pdev->physfn.vf_list);
> +            }
> +            else
> +            {
> +                printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
> +                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                       &pdev->sbdf);
> +                free_pdev(pseg, pdev);
> +                ret = -ENODEV;

Why -ENODEV? Ideally the error code from the earlier pci_add_device() could
be retained (even if some fallback would be needed in case that one succeeded
or the path wasn't even taken). Yet on the whole I wonder if we wouldn't be
better off delaying that recursive call some, such that the lock wouldn't
be dropped anymore between the call and getting here. This would then also
eliminate the need for the new pci_get_pdev() invocation.

> @@ -818,6 +847,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            ret = 0;
> +
> +            if ( !pdev->info.is_virtfn )
> +            {
> +                struct pci_dev *vf_pdev, *tmp;
> +
> +                /*
> +                 * If a PF with VFs enabled is removed, then re-added without
> +                 * VFs enabled, the previously associated VFs would no longer be
> +                 * backed by a device. Remove the associated VFs right away.
> +                 */

While in the description the "enabled" and "disabled" are kind of
tolerable, at least in the code comment I think we want to be more
precise. The question isn't whether VFs are enabled, but whether we
know of the VFs.

It's further unclear here what "a device" is.

> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
> +                                         virtfn.entry)
> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
> +                                            vf_pdev->sbdf.bus,
> +                                            vf_pdev->sbdf.devfn) ?: ret;

And if this fails, the VF will still remain orphaned. I think in the
model I had suggested no such risk would exist.

Misra also isn't going to like the recursion here.

> @@ -826,7 +873,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>                  write_unlock(&pdev->domain->pci_lock);
>              }
>              pci_cleanup_msi(pdev);
> -            ret = iommu_remove_device(pdev);
> +            ret = iommu_remove_device(pdev) ?: ret;
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;

Is it even legitimate to continue cleaning up if there was an earlier
failure?

In any event - please consider e.g. the case where the XSM check allows
the PF removal, but denies the removal of some of the VFs.

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -150,7 +150,18 @@ struct pci_dev {
>          unsigned int count;
>  #define PT_FAULT_THRESHOLD 10
>      } fault;
> -    u64 vf_rlen[6];
> +    union {
> +        struct pf_info {
> +            /* Only populated for PFs (info.is_virtfn == false) */
> +            struct list_head vf_list;             /* List head */
> +            uint64_t vf_rlen[PCI_SRIOV_NUM_BARS];
> +        } physfn;
> +        struct {
> +            /* Only populated for VFs (info.is_virtfn == true) */
> +            struct list_head entry;               /* Entry in vf_list */
> +            struct pci_dev *pf_pdev;              /* Link from VF to PF */

const?

Jan

