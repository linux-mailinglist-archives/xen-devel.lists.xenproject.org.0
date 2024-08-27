Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F8960BC6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784009.1193358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siw86-0000am-Ox; Tue, 27 Aug 2024 13:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784009.1193358; Tue, 27 Aug 2024 13:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siw86-0000YP-M6; Tue, 27 Aug 2024 13:21:02 +0000
Received: by outflank-mailman (input) for mailman id 784009;
 Tue, 27 Aug 2024 13:21:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYmO=P2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1siw85-0000YH-5t
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:21:01 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3259bfd1-6477-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:20:58 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-44ff132ff9cso28409341cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:20:58 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe199471sm52645961cf.59.2024.08.27.06.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:20:55 -0700 (PDT)
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
X-Inumbo-ID: 3259bfd1-6477-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724764857; x=1725369657; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6FATiIuItaulb+xyY3jzG0ahY0JFgsPvDjCNdsUmnE=;
        b=BqrxKi2u195pWPWdn+gZBRs2mcKJfP0Il2yJGmsFFHBEx/zfvxWMesmAulyCPEva74
         OJ4UhyvR+ZIiVavJ+ToyUOGVunOouipb/+nxTabEISJs6wfES4U47LanaWtSlDJ7pajI
         GeZKObsM6NiSD3U1XUHM7yo18Bfq8GEz+oQH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764857; x=1725369657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6FATiIuItaulb+xyY3jzG0ahY0JFgsPvDjCNdsUmnE=;
        b=at2CKrJPSiIi51fSMy9K2AIqkexgUlggZuTc8hLvaNfAc8gCsEh1cDpOBbte/6W081
         35HK+qadUKvfAk4Z5aM6i2sWCknzNzbib8yB9l9IzuavO2jE5ls+fW0JcQEDrV5XQhc7
         27cDfRjuhPhnP7nHVIBUfBz0oWAQ0ESxlF5AR0inmUNcIwmx0GkoGRmfguIVGGExyMuO
         oP6+5Jv7xn0UhQINk5/gzpWo8y4YR5bX7P8Gcqaj2WHahrEjPtMdoam+0XE10XuIahtG
         C8M7B7VMLJKKDKs0zeuamD0ITDKpTT7wEbT5i8zQfC0hDjguvbPhWONZzSAgEMMblq1F
         fOGQ==
X-Gm-Message-State: AOJu0YzWJrB2BNAdklmvhG51PGx1lrmn26Jc2+fWvRYPPXHMSn6oNI5g
	ILO3dEdCotaAMm5Dj30qDjbrsehHIoRfewuWQ4KrStic6lktBsj0Mo1WsxC075M=
X-Google-Smtp-Source: AGHT+IGByl62vxk+ytl0Mtj8nWpoVrlAapMjdGVqcV4zAQDaQTQYK8kzDTqesTfOcgVNczNrkk7o5w==
X-Received: by 2002:a05:622a:1924:b0:446:3add:2cf7 with SMTP id d75a77b69052e-455097dc009mr142217541cf.56.1724764857221;
        Tue, 27 Aug 2024 06:20:57 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:20:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4] x86/msi: fix locking for SR-IOV devices
Message-ID: <Zs3StA1aZJi5ffZj@macbook.local>
References: <20240827035929.118003-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240827035929.118003-1-stewart.hildebrand@amd.com>

On Mon, Aug 26, 2024 at 11:59:28PM -0400, Stewart Hildebrand wrote:
> In commit 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci
> structure") a lock moved from allocate_and_map_msi_pirq() to the caller
                    ^ was?
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

I think there are two different fixes in this patch, that should be
split into two separate fixes:

 - Fix for the locking issue, which requires adding a pointer to the
   parent PF in the pci_dev of VFs.
 - Introduce better tracking of the PF<->VF pci_dev relation.

My suggestion would be to introduce the tacking between PF and VFs as
a pre-patch (IOW: the linked list related changes), and then do the
addition of the pf_pdev (the proper fix) as a followup.

> 
> Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Candidate for backport to 4.19
> 
> v3->v4:
> * handle case when PF is removed with VFs enabled, then re-added with
>   VFs disabled
> 
> v2->v3:
> * link from VF to PF's struct pci_dev *
> 
> v1->v2:
> * remove call to pci_get_pdev()
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

It's not clear to me, does this crash happen even without this change
applied?  If that's the case it seems like you need an extra Fixes
tag (see above for my recommendation to split the change into two).

> ---
>  xen/arch/x86/msi.c            | 33 +++++++++++----------
>  xen/drivers/passthrough/pci.c | 55 ++++++++++++++++++++++++++++++++---
>  xen/include/xen/pci.h         | 13 ++++++++-
>  3 files changed, 80 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 0c97fbb3fc03..8d54f268dbbf 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -662,34 +662,31 @@ static int msi_capability_init(struct pci_dev *dev,
>      return 0;
>  }
>  
> -static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
> +static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf,

Since you already have to touch this, I don't think it would very
complicated to pass a pci_sbdf_t here instead of the seg, bus, slot
and func parameters.  You can expand back to seg, bus, slot and func
as local function parameters in order to avoid more code changes than
strictly needed.

> +                            const struct pf_info *pf_info)
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

Is it worth adding a:

if ( !pf_info )
{
    ASSERT_UNREACHABLE();
    return 0;
}

As I think pf_info must be != NULL if vf >= 0?

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
> +             !pf_info->vf_rlen[bir] )
>              return 0;
>          base = pos + PCI_SRIOV_BAR;
>          vf -= PCI_BDF(bus, slot, func) + offset;
> @@ -703,8 +700,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
>          }
>          if ( vf >= num_vf )
>              return 0;
> -        BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
> -        disp = vf * pdev->vf_rlen[bir];
> +        BUILD_BUG_ON(ARRAY_SIZE(pf_info->vf_rlen) != PCI_SRIOV_NUM_BARS);
> +        disp = vf * pf_info->vf_rlen[bir];
>          limit = PCI_SRIOV_NUM_BARS;
>      }
>      else switch ( pci_conf_read8(PCI_SBDF(seg, bus, slot, func),
> @@ -813,6 +810,7 @@ static int msix_capability_init(struct pci_dev *dev,
>          int vf;
>          paddr_t pba_paddr;
>          unsigned int pba_offset;
> +        const struct pf_info *pf_info;
>  
>          if ( !dev->info.is_virtfn )
>          {
> @@ -820,6 +818,7 @@ static int msix_capability_init(struct pci_dev *dev,
>              pslot = slot;
>              pfunc = func;
>              vf = -1;
> +            pf_info = NULL;
>          }
>          else
>          {
> @@ -827,9 +826,11 @@ static int msix_capability_init(struct pci_dev *dev,
>              pslot = PCI_SLOT(dev->info.physfn.devfn);
>              pfunc = PCI_FUNC(dev->info.physfn.devfn);
>              vf = dev->sbdf.bdf;
> +            pf_info = &dev->virtfn.pf_pdev->physfn;
>          }
>  
> -        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
> +        table_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf,
> +                                       pf_info);
>          WARN_ON(msi && msi->table_base != table_paddr);
>          if ( !table_paddr )
>          {
> @@ -852,7 +853,7 @@ static int msix_capability_init(struct pci_dev *dev,
>  
>          pba_offset = pci_conf_read32(dev->sbdf, msix_pba_offset_reg(pos));
>          bir = (u8)(pba_offset & PCI_MSIX_BIRMASK);
> -        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf);
> +        pba_paddr = read_pci_mem_bar(seg, pbus, pslot, pfunc, bir, vf, pf_info);
>          WARN_ON(!pba_paddr);
>          pba_paddr += pba_offset & ~PCI_MSIX_BIRMASK;
>  
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 5a446d3dcee0..97b3417252f7 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -341,6 +341,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>  
>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>  
> +    INIT_LIST_HEAD(&pdev->physfn.vf_list);
> +
>      /* update bus2bridge */
>      switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
>      {
> @@ -446,6 +448,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>  
>      list_del(&pdev->alldevs_list);
>      pdev_msi_deinit(pdev);
> +
> +    if ( pdev->info.is_virtfn )
> +        list_del(&pdev->virtfn.entry);
> +
>      xfree(pdev);
>  }
>  
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
> +                goto out;
> +            }
> +        }
>      }
>  
> -    if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
> +    if ( !pdev->info.is_virtfn && !pdev->physfn.vf_rlen[0] )
>      {
>          unsigned int pos = pci_find_ext_capability(pdev->sbdf,
>                                                     PCI_EXT_CAP_ID_SRIOV);
> @@ -715,7 +742,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          {
>              unsigned int i;
>  
> -            BUILD_BUG_ON(ARRAY_SIZE(pdev->vf_rlen) != PCI_SRIOV_NUM_BARS);
> +            BUILD_BUG_ON(ARRAY_SIZE(pdev->physfn.vf_rlen) !=
> +                                    PCI_SRIOV_NUM_BARS);
> +
>              for ( i = 0; i < PCI_SRIOV_NUM_BARS; )
>              {
>                  unsigned int idx = pos + PCI_SRIOV_BAR + i * 4;
> @@ -730,7 +759,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                      continue;
>                  }
>                  ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
> -                                       &pdev->vf_rlen[i],
> +                                       &pdev->physfn.vf_rlen[i],
>                                         PCI_BAR_VF |
>                                         ((i == PCI_SRIOV_NUM_BARS - 1) ?
>                                          PCI_BAR_LAST : 0));
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
> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->physfn.vf_list,
> +                                         virtfn.entry)
> +                    ret = pci_remove_device(vf_pdev->sbdf.seg,
> +                                            vf_pdev->sbdf.bus,
> +                                            vf_pdev->sbdf.devfn) ?: ret;
> +            }
> +
>              if ( pdev->domain )
>              {
>                  write_lock(&pdev->domain->pci_lock);
> @@ -826,7 +873,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>                  write_unlock(&pdev->domain->pci_lock);
>              }
>              pci_cleanup_msi(pdev);
> -            ret = iommu_remove_device(pdev);
> +            ret = iommu_remove_device(pdev) ?: ret;
>              printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
>              free_pdev(pseg, pdev);
>              break;
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 63e49f0117e9..a24026d25148 100644
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

With this pointer being introduced for VFs, is the information in
pci_dev_info still required?  It would seem to me the physfn.bus and
physfn.devfn fields can now be fetched directly from the pf_pdev
pointer?

Thanks, Roger.

