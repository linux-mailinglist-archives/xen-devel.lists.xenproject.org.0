Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7CB139EC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061364.1426923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM7F-0000bK-Em; Mon, 28 Jul 2025 11:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061364.1426923; Mon, 28 Jul 2025 11:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM7F-0000ZP-Bj; Mon, 28 Jul 2025 11:34:01 +0000
Received: by outflank-mailman (input) for mailman id 1061364;
 Mon, 28 Jul 2025 11:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugM7D-0008T8-AW
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:33:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c05fe3ea-6ba6-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 13:33:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4560d176f97so46432285e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 04:33:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b7868629a4sm4199271f8f.79.2025.07.28.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 04:33:57 -0700 (PDT)
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
X-Inumbo-ID: c05fe3ea-6ba6-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753702438; x=1754307238; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYX6q/XZ3bUhwv35RpRgRGVWzNkKM01c2zweAmA66Wg=;
        b=dgR5V4E3GjXv1aIAVk0EpXduscjpz8HW534dUPClvF67rMdygsimRspUGe/IZm9ON8
         uPMOKcs6n0LpQ/knXxT+dUCfLoCoQ/c4pyWJ0VEXMwPjNC4Rg0aS49A79xm0kXhWbXSu
         Pxss9NTC6hYR8uDqk9kUf7qigEs80Al/xpS70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753702438; x=1754307238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYX6q/XZ3bUhwv35RpRgRGVWzNkKM01c2zweAmA66Wg=;
        b=rOV+2GUjlPnPZB94E5gUOkA+w1f2IOOoYRV5mF7dayJfTWJ2U/rOTdP/i2oV2Hy+x0
         ULIi2jk8dX55r9fauajkpfnsI/rOupp7ywvZwcUuC7FIYv3rDPsdX9LKnlKWo9DWy1gV
         ZN7O85TdvqctFzgYvr2XQPYDG1r/uXabiFPfch8Xo1NspbzbhMzFuLs4ZCEv+GiCin31
         pS4D1w9wYSbePPhaa9Gf5NH2udDUAJMOWBuYgM9i8NW3nTga1RTG9RxOZKHBpq/W7Snl
         LlgAb7IogbOtfNpz32p7PXksay5uFVyQmac8gE6/wEVc1ZEzKyf5aeofIaEoMm0pKvKQ
         Vv2w==
X-Gm-Message-State: AOJu0Yxsoh2VOaS3IE7Lmt1DOI/NeYz+4rzbjS6X3OZkRW0C6uEnMrxn
	QcIedACBcVh6lQIYYeJfgHy+wDHgE0rBjUaY4Deb1ELzbK5VFiY3i13POterykMlYWM=
X-Gm-Gg: ASbGncsAOBZo5LEYarPjYqJ/swe4kx3oqKY4b6iQTnFJCaG2Fjwtgfl2GK7Iejp+7Po
	sKHquWuXYiB3ffQtj4XqijyfXS95F7qJF/nqw8Z+jw/Baa0DGQTm3y9/xfcBNyR01d2cbkhrgk+
	pPY6VluygqZXK11EEsCqlb4hIlLuZ/itSM8zx8vQgswrU2oLi7fHR/tWKP6cWdgb8XWDGzsOXiN
	jIj3fg90lfT32ZjIkTnPEvjR0UZ4omqwUx9GpnQ9tNSYgtto5JV9C6IQ6YTdlmJSxXgEuhRaZQ8
	a9+9BNxuxec92i5jrXGod+/KhTNxmrzSMZ9H7og9c6NqWp7KugDzC5WOQfjU0JPd08RYRj5wz66
	W/iwZGpy+rEvxmUPjD3J5ON70rQFa5TaH6cqHaadvOBISnRa/bRmz3aQPcGO3zivSDw==
X-Google-Smtp-Source: AGHT+IE+BKIn6ZT28m+q0SUD1YY3m2GPwv1Y0QK5q2vjkiQfsSJyaWini5k/Bfw5qEmZ/9bEBBOdgA==
X-Received: by 2002:a05:600c:4f4b:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-4588004c1b9mr62816755e9.30.1753702437708;
        Mon, 28 Jul 2025 04:33:57 -0700 (PDT)
Date: Mon, 28 Jul 2025 13:33:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
Message-ID: <aIdgJPTf17M0g-8m@macbook.local>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>

On Fri, Jul 25, 2025 at 02:24:33PM +0000, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
> for possible changes in the system page size register.
> 
> Relies on dom0 to enable SR-IOV and PHYSDEVOP to inform Xen about
> addition/removal of VFs.

Why I'm not opposed to allowing registration of devices using
PHYSDEVOP, can't Xen detect the addition of the VFs and add them
itself?

When I worked on this long time ago, the version of the series that I
posted had registration of the VFs done by Xen also:

https://lore.kernel.org/xen-devel/20180717094830.54806-12-roger.pau@citrix.com/

> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  CHANGELOG.md              |   3 +-
>  SUPPORT.md                |   2 -
>  xen/drivers/vpci/Makefile |   2 +-
>  xen/drivers/vpci/header.c |   3 +
>  xen/drivers/vpci/sriov.c  | 235 ++++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c   |   1 +
>  xen/include/xen/vpci.h    |   7 +-
>  7 files changed, 247 insertions(+), 6 deletions(-)
>  create mode 100644 xen/drivers/vpci/sriov.c
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..7b0e8beb76 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,8 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - Option to attempt to fixup p2m page-faults on PVH dom0.
>     - Resizable BARs is supported for PVH dom0.
> -   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
> -     capability usage is not yet supported on PVH dom0).
> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.

Don't you need to move this out of the x86 specific section?

According to the cover letter you are testing on an ARM board, so this
probably needs to be put in a non-arch part of CHANGELOG?

>     - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>  
>   - On Arm:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a92189..830b598714 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
>  
>  At least the following features are missing on a PVH dom0:
>  
> -  * PCI SR-IOV.
> -
>    * Native NMI forwarding (nmi=dom0 command line option).
>  
>    * MCE handling.
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index a7c8a30a89..fe1e57b64d 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += vpci.o header.o rebar.o
> +obj-y += vpci.o header.o rebar.o sriov.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f947f652cd..0a840c6dcc 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -839,6 +839,9 @@ static int cf_check init_header(struct pci_dev *pdev)
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> +    if ( pdev->info.is_virtfn )
> +        return 0;
> +
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
>      case PCI_HEADER_TYPE_NORMAL:
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..640430e3e9
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Handlers for accesses to the SR-IOV capability structure.
> + *
> + * Copyright (C) 2018 Citrix Systems R&D

If there's a Citrix copyright header here, shouldn't there be a
matching Signed-off-by from someone at Citrix (I think that's likely
me)?

Otherwise if there's no content authored by a Citrix employee the
copyright notice must be removed.  We need to be careful with
copyright and attribution.

And in any case the date should be updated.

> + */
> +
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +static int vf_init_bars(const struct pci_dev *vf_pdev)
> +{
> +    unsigned int i, sriov_pos;
> +    int vf_idx, rc;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    uint16_t offset, stride;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
> +    offset = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_OFFSET);
> +    stride = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_VF_STRIDE);

You can possibly initialize the fields as definition time?

> +
> +    vf_idx = vf_pdev->sbdf.sbdf;
> +    vf_idx -= pf_pdev->sbdf.sbdf + offset;
> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +    if ( stride )
> +    {
> +        if ( vf_idx % stride )
> +            return -EINVAL;
> +        vf_idx /= stride;
> +    }
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;
> +        bars[i].guest_addr = bars[i].addr;
> +        bars[i].size = physfn_vf_bars[i].size;
> +        bars[i].type = physfn_vf_bars[i].type;
> +        bars[i].prefetchable = physfn_vf_bars[i].prefetchable;
> +        rc = vpci_bar_add_rangeset(vf_pdev, &bars[i], i);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +static int map_vf(const struct pci_dev *vf_pdev, uint16_t cmd)
> +{
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    rc = vf_init_bars(vf_pdev);
> +    if ( rc )
> +        return rc;
> +
> +    return vpci_modify_bars(vf_pdev, cmd, false);
> +}
> +
> +static int size_vf_bars(struct pci_dev *pf_pdev, unsigned int sriov_pos)
> +{
> +    /*
> +     * NB: a non-const pci_dev of the PF is needed in order to update
> +     * vf_rlen.
> +     */
> +    struct vpci_bar *bars;
> +    unsigned int i;
> +    int rc = 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +
> +    if ( !pf_pdev->vpci->sriov )

Is this possible?  If the struct is not allocated the hook shouldn't
be registered either.  Maybe it wants to be an ASSERT instead?

> +        return -EINVAL;
> +
> +    /* Read BARs for VFs out of PF's SR-IOV extended capability. */
> +    bars = pf_pdev->vpci->sriov->vf_bars;
> +    /* Set the BARs addresses and size. */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i += rc )
> +    {
> +        unsigned int idx = sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar = pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc = pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i == PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        pf_pdev->physfn.vf_rlen[i] = size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
> +        bars[i].size = size;
> +        bars[i].prefetchable = bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type = VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type = VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type = VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +        }
> +    }
> +
> +    rc = rc > 0 ? 0 : rc;
> +
> +    return rc;
> +}
> +
> +static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
> +                                   uint32_t val, void *data)
> +{
> +    unsigned int sriov_pos = reg - PCI_SRIOV_CTRL;
> +    uint16_t control = pci_conf_read16(pdev->sbdf, reg);
> +    bool mem_enabled = control & PCI_SRIOV_CTRL_MSE;
> +    bool new_mem_enabled = val & PCI_SRIOV_CTRL_MSE;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    if ( new_mem_enabled != mem_enabled )
> +    {
> +        struct pci_dev *vf_pdev;
> +        if ( new_mem_enabled )
> +        {
> +            /* FIXME casting away const-ness to modify vf_rlen */
> +            size_vf_bars((struct pci_dev *)pdev, sriov_pos);
> +
> +            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
> +                map_vf(vf_pdev, PCI_COMMAND_MEMORY);

It's my understating this requires that devices are registerted with
Xen using the PHYSDEVOP prior to dom0 attempting to enable VF MSE.  If
that's the case it should be clearly stated, as it's a relevant
ordering constrain.

I also don't think this will work as expected, as each successive call
to map_vf() (which calls vpci_modify_bars()) will lead to overwriting
the previously queued map/unmap operation, and only the BARs from the
last VF on the list will actually be mapped?

If this is to strictly deal with the PF VF BAR{0-5} registers you
could map the whole register in one go, instead of dealing with each
VF BARs separately.  That would also lead to possibly bigger pages
being used in the p2m, as the whole VF BARs will be mapped in one go,
instead of splitting them into multiple isolated mapping operations.

> +        }
> +        else
> +        {
> +            list_for_each_entry(vf_pdev, &pdev->vf_list, vf_list)
> +                map_vf(vf_pdev, 0);
> +        }
> +    }

Don't you need to track the VF enable bit here, so that VFs are
registered as pci_devs with Xen once VF enable is set?

Also the size of the BARs as result of a change to the System Page
Size register can only happen when VF enable is not set, and hence the
sizing of BARs could be limited to the setting of VF enable, instead
of VF MSE?

> +
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +static int vf_init_header(struct pci_dev *vf_pdev)
> +{
> +    const struct pci_dev *pf_pdev;
> +    unsigned int sriov_pos;
> +    int rc = 0;
> +    uint16_t ctrl;
> +
> +    ASSERT(rw_is_write_locked(&vf_pdev->domain->pci_lock));
> +
> +    if ( !vf_pdev->info.is_virtfn )
> +        return 0;
> +
> +    pf_pdev = vf_pdev->pf_pdev;
> +    ASSERT(pf_pdev);
> +
> +    sriov_pos = pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
> +    ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
> +
> +    if ( (pf_pdev->domain == vf_pdev->domain) && (ctrl & PCI_SRIOV_CTRL_MSE) )
> +    {
> +        rc = map_vf(vf_pdev, PCI_COMMAND_MEMORY);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +static int init_sriov(struct pci_dev *pdev)

This seems to be missing a cf_check attribute?

> +{
> +    unsigned int pos;
> +
> +    if ( pdev->info.is_virtfn )
> +        return vf_init_header(pdev);
> +
> +    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
> +
> +    if ( !pos )
> +        return 0;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return 0;
> +    }
> +
> +    pdev->vpci->sriov = xzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, NULL);
> +}
> +
> +REGISTER_VPCI_INIT(init_sriov, VPCI_PRIORITY_LOW);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 09988f04c2..7af6651831 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -120,6 +120,7 @@ void vpci_deassign_device(struct pci_dev *pdev)
>      for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
>          rangeset_destroy(pdev->vpci->header.bars[i].mem);
>  
> +    xfree(pdev->vpci->sriov);
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 06f7039f20..9e8dcab17e 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -138,7 +138,6 @@ struct vpci {
>           * upon to know whether BARs are mapped into the guest p2m.
>           */
>          bool bars_mapped      : 1;
> -        /* FIXME: currently there's no support for SR-IOV. */
>      } header;
>  
>      /* MSI data. */
> @@ -192,6 +191,12 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];

Can't you re-use the existing vpci_bar array in vpci_header structure?

Thanks, Roger.

