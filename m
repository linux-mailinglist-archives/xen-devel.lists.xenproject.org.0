Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66B8CBF4B
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 12:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727474.1131940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jIG-0001NZ-PF; Wed, 22 May 2024 10:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727474.1131940; Wed, 22 May 2024 10:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9jIG-0001M2-Md; Wed, 22 May 2024 10:34:00 +0000
Received: by outflank-mailman (input) for mailman id 727474;
 Wed, 22 May 2024 10:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ieL=MZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9jIE-0001Lt-PQ
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 10:33:58 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca9f1ca2-1826-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 12:33:56 +0200 (CEST)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4df3f7b93a7so238994e0c.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 03:33:56 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792dc0a5bb2sm1063747185a.42.2024.05.22.03.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:33:54 -0700 (PDT)
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
X-Inumbo-ID: ca9f1ca2-1826-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716374035; x=1716978835; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgajI+gTSooT6QyaQjrxAm9fg0R7qgPUodTv4dLfUDk=;
        b=kvYYHXR4xP9VSlkk7y6ee032DTv4aDpmwZS2sBV8MwUyv/YF4wmTvEZO6a685Jpc20
         0rrvc4hDebG3qCcoFIwXgyJUukxYGPPhTvk06O7db9eFP2nnhfB6FW+KdoFqt5Fr9FDn
         SXgGzN8TaQmBADBwIjnYhplNyh4t7o0QfaJlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716374035; x=1716978835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgajI+gTSooT6QyaQjrxAm9fg0R7qgPUodTv4dLfUDk=;
        b=Y/0KD8W4S0ICKolO/vo+CKeVaf6pggguIA6hHpEYaqd4gqn3iOS1DL+U/rhpZqD+IZ
         lFvzsNi5r6jtqHgtJQt8z12EWQJK3fbsyEZk3nVu9lg9o3KdBXr+BXDBNbfoID5IvPob
         ZBdZhfX5q9avqyDOkrvYjoVRPnL/4yi6jy6hBfbvIIGtdFj2u3wtpZpPMPVc5mgAXyx8
         zloDOmyWH5mAuimHgAo0DczxcFwXY2A0Dm4SWCvJxmTvzt+Oh0GTh2Kl6hcREqlwpIqR
         pImK6isTxk0iBcClz35uPNVANHNEtYOzztrn7RWljhbwe+GYAAU+vVE8x9s8I+sGQIHh
         TjDg==
X-Gm-Message-State: AOJu0YzJcFRHlFXLmaCNRDm3lwe/kZbEUsRxGhsvo6PKRyoM7oqOjMhV
	w55Sw4x5+0yX40lhew2P4XKJ4E2jARPXo6cCuLBh7c7C7o/OrfZPcX3Bs1MFABA=
X-Google-Smtp-Source: AGHT+IGIJx7Q5C9fIuBMt7z5SOvQVv+nyedzlS3WpPdjf5OU5LMSZxPQO/F1ApjtlbUIRwld87XQJw==
X-Received: by 2002:a05:6122:31a8:b0:4d8:7222:b6da with SMTP id 71dfb90a1353d-4e2184ed83amr1520531e0c.6.1716374035190;
        Wed, 22 May 2024 03:33:55 -0700 (PDT)
Date: Wed, 22 May 2024 12:33:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v15 3/5] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <Zk3KEKSb5ZsDhFBR@macbook>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
 <20240517170619.45088-4-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240517170619.45088-4-stewart.hildebrand@amd.com>

On Fri, May 17, 2024 at 01:06:13PM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> In v15:
> - add Jan's A-b
> In v13:
> - s/depends on/select/ in Kconfig
> - check pdev->sbdf.fn instead of two booleans in add_virtual_device()
> - comment #endifs in sched.h
> - clarify comment about limits in vpci.h with seg/bus limit
> In v11:
> - Fixed code formatting
> - Removed bogus write_unlock() call
> - Fixed type for new_dev_number
> In v10:
> - Removed ASSERT(pcidevs_locked())
> - Removed redundant code (local sbdf variable, clearing sbdf during
> device removal, etc)
> - Added __maybe_unused attribute to "out:" label
> - Introduced HAS_VPCI_GUEST_SUPPORT Kconfig option, as this is the
>   first patch where it is used (previously was in "vpci: add hooks for
>   PCI device assign/de-assign")
> In v9:
> - Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
> In v8:
> - Added write lock in add_virtual_device
> Since v6:
> - re-work wrt new locking scheme
> - OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
> Since v5:
> - s/vpci_add_virtual_device/add_virtual_device and make it static
> - call add_virtual_device from vpci_assign_device and do not use
>   REGISTER_VPCI_INIT machinery
> - add pcidevs_locked ASSERT
> - use DECLARE_BITMAP for vpci_dev_assigned_map
> Since v4:
> - moved and re-worked guest sbdf initializers
> - s/set_bit/__set_bit
> - s/clear_bit/__clear_bit
> - minor comment fix s/Virtual/Guest/
> - added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
>   later for counting the number of MMIO handlers required for a guest
>   (Julien)
> Since v3:
>  - make use of VPCI_INIT
>  - moved all new code to vpci.c which belongs to it
>  - changed open-coded 31 to PCI_SLOT(~0)
>  - added comments and code to reject multifunction devices with
>    functions other than 0
>  - updated comment about vpci_dev_next and made it unsigned int
>  - implement roll back in case of error while assigning/deassigning devices
>  - s/dom%pd/%pd
> Since v2:
>  - remove casts that are (a) malformed and (b) unnecessary
>  - add new line for better readability
>  - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>     functions are now completely gated with this config
>  - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/drivers/Kconfig     |  4 +++
>  xen/drivers/vpci/vpci.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/sched.h | 10 +++++++-
>  xen/include/xen/vpci.h  | 12 +++++++++
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47a6..20050e9bb8b3 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	select HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 97e115dc5798..23722634d50b 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -40,6 +40,49 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)

This seems quite generic, IMO it would better named
`assign_{guest,virtual}_sbdf()` or similar, unless there are plans to
add more code here that's not strictly only about setting the guest
SBDF.

> +{
> +    struct domain *d = pdev->domain;
> +    unsigned int new_dev_number;
> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

Shouldn't the assert be done before the is_hardware_domain() check, so
that we assert that all possible paths (even those from dom0) have
taken the correct lock?

> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->sbdf.fn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number == VPCI_MAX_VIRT_DEV )
> +        return -ENOSPC;
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
> +
> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    pdev->vpci->guest_sbdf = PCI_SBDF(0, 0, new_dev_number, 0);
> +
> +    return 0;
> +}
> +
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  void vpci_deassign_device(struct pci_dev *pdev)
>  {
>      unsigned int i;
> @@ -49,6 +92,12 @@ void vpci_deassign_device(struct pci_dev *pdev)
>      if ( !has_vpci(pdev->domain) || !pdev->vpci )
>          return;
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +#endif
> +
>      spin_lock(&pdev->vpci->lock);
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
> @@ -103,6 +152,13 @@ int vpci_assign_device(struct pci_dev *pdev)
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>      spin_lock_init(&pdev->vpci->lock);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    pdev->vpci->guest_sbdf.sbdf = ~0;

I think ~0 wants to be in a define here:

#define INVALID_GUEST_SBDF ~0

Or similar.

Thanks, Roger.

