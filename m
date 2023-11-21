Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B77F3149
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 15:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637869.993914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Rvs-00019N-MM; Tue, 21 Nov 2023 14:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637869.993914; Tue, 21 Nov 2023 14:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Rvs-00016f-JV; Tue, 21 Nov 2023 14:40:56 +0000
Received: by outflank-mailman (input) for mailman id 637869;
 Tue, 21 Nov 2023 14:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5Rvr-00016Z-GU
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 14:40:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f973d2ee-887b-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 15:40:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b2c8e91afso1913425e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 06:40:54 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003fc0505be19sm17677097wmp.37.2023.11.21.06.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:40:53 -0800 (PST)
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
X-Inumbo-ID: f973d2ee-887b-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700577654; x=1701182454; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5piXL3MfwdAeGGjCII4Ez9Yi2W6IULKwDiak3ZKKEu4=;
        b=V0CRjQxoSRPPCNTNmZtc2IsOfSKYG1uwhO371jDjb2y33Ry4bkbXPyVcGjylU+a1up
         PXkI15YuBsR7bn5eqLjKRm6jJxglaRz0BvbstUn2a/Ov7A8LUf7KcUI66t5JawTqwtGz
         1xxlrIT56ujjxjNg9Fq/02rQjvOq9ZUzDuCzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577654; x=1701182454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5piXL3MfwdAeGGjCII4Ez9Yi2W6IULKwDiak3ZKKEu4=;
        b=KT83DwWHvulqvjym+OapZHxEM5alYX60P9cgNGktsrLRfU709rR2q0KypfmfTt8a8f
         zE7mvkA/O+pJ48FEOyeR7yUVCHEGMq/u0l21uE5FArY2J2YG90Z9yUEERea6zSSVFUW9
         lUlzAn6KOYPW7U+aTPBqaiFH/aS+6b1AGl+R4wprIRQZy72Mr8XM8RNWYTrg92soNiSL
         KmISiLsVI8Gn2lHlKQw1KLhyhw1aH0dBNgAgw+bUTSgtiZFbGUqRF9t+kMnrjLcoYBaV
         9a3NeOmCvTLBU4CcVin9HeoUn8aPZ2jOFQxvzisk8MKtMODAFATp/YNfwBAcIqcd/DZV
         rZSQ==
X-Gm-Message-State: AOJu0YxYlwATQ92nQ8DcHUrRq+d2Rsck3JOwx29x7ICL/8z4HVYwXZX+
	BVoK3W36eLrrby3k93XYnjhUKQ==
X-Google-Smtp-Source: AGHT+IE8LwvDBIZTC+9I6tKRV0XGiEM2oj8HRv6ptyyipd2nwmOH/8z4xypwVIFoaVcp0bWo2l8CWA==
X-Received: by 2002:a05:600c:1548:b0:405:3dbc:8823 with SMTP id f8-20020a05600c154800b004053dbc8823mr8690887wmg.12.1700577653845;
        Tue, 21 Nov 2023 06:40:53 -0800 (PST)
Date: Tue, 21 Nov 2023 15:40:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <ZVzBdBQNcBg9dKwT@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-14-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:18PM +0000, Volodymyr Babchuk wrote:
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
> ---
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
>  xen/drivers/vpci/vpci.c | 63 +++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/sched.h |  8 ++++++
>  xen/include/xen/vpci.h  | 11 +++++++
>  4 files changed, 86 insertions(+)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47..780490cf8e 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 5e34d0092a..7c46a2d3f4 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -36,6 +36,52 @@ extern vpci_register_init_t *const __start_vpci_array[];
>  extern vpci_register_init_t *const __end_vpci_array[];
>  #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static int add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    unsigned long new_dev_number;

Why unsigned long?  unsigned int seems more than enough to account for
all possible dev numbers [0, 31].

> +
> +    if ( is_hardware_domain(d) )
> +        return 0;
> +
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +    new_dev_number = find_first_zero_bit(d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number == VPCI_MAX_VIRT_DEV )
> +    {
> +        write_unlock(&pdev->domain->pci_lock);

This write_unlock() looks bogus, as the lock is not taken by this
function.  Won't this create an unlock imbalance when the caller of
vpci_assign_device() also attempts to write-unlock d->pci_lock?

> +        return -ENOSPC;
> +    }
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
> @@ -46,6 +92,13 @@ void vpci_deassign_device(struct pci_dev *pdev)
>          return;
>  
>      spin_lock(&pdev->vpci->lock);
> +
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pdev->vpci->guest_sbdf.sbdf != ~0 )
> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
> +                    &pdev->domain->vpci_dev_assigned_map);
> +#endif

This chunk could in principle be outside of the vpci->lock region
AFAICT.

> +
>      while ( !list_empty(&pdev->vpci->handlers) )
>      {
>          struct vpci_register *r = list_first_entry(&pdev->vpci->handlers,
> @@ -101,6 +154,13 @@ int vpci_assign_device(struct pci_dev *pdev)
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
>      spin_lock_init(&pdev->vpci->lock);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +    rc = add_virtual_device(pdev);
> +    if ( rc )
> +        goto out;
> +#endif
> +
>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
>      {
>          rc = __start_vpci_array[i](pdev);
> @@ -108,11 +168,14 @@ int vpci_assign_device(struct pci_dev *pdev)
>              break;
>      }
>  
> + out:
> +    __maybe_unused;

Can you place it in the same line as the out: label please?

>      if ( rc )
>          vpci_deassign_device(pdev);
>  
>      return rc;
>  }
> +

Stray newline?

Thanks, Roger.

