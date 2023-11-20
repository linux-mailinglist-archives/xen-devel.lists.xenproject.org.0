Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD677F16AD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 16:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637028.992711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55pf-0004Bf-Rp; Mon, 20 Nov 2023 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637028.992711; Mon, 20 Nov 2023 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55pf-00049A-P9; Mon, 20 Nov 2023 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 637028;
 Mon, 20 Nov 2023 15:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r55pe-00047A-K3
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 15:05:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2def633e-87b6-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 16:05:02 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507be298d2aso5756984e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 07:05:02 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 s15-20020adfea8f000000b00323287186aasm11493685wrm.32.2023.11.20.07.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 07:05:00 -0800 (PST)
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
X-Inumbo-ID: 2def633e-87b6-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700492701; x=1701097501; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJiMsGwIyeGFrhdEpv5NYLFTNvLLbA+NXezxFZ6FkfQ=;
        b=YrNFrPozT5m2nLJ1234v6rgAh3K5SIgyQMpXX9duDVOMkWNdG0D48mRfABvRcTPy1u
         i1sljICRncEdXFC75owHYHL20WxDtAxvD9d2kUO9lT1COqGgwM/M/h3IYMh26RfYrtxa
         epOymzIIpl7qEVfJ7bg9XCXiodO1kKK6qB/tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700492701; x=1701097501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJiMsGwIyeGFrhdEpv5NYLFTNvLLbA+NXezxFZ6FkfQ=;
        b=twq7ForpLhRu8z5nc8/OMVRJRvFlyei3w5O/a5qnQBliLULGr3T157DpI5ZaAIotb+
         LWgIw2+XGlvfsgMWGVc9It35KXWaUxOgp28EH4n2V6VDqobVZmqek+JHV43Px37zRz61
         dDMi8SlEl2Z0Qspp8palhAKKgL4Sl9oLnK78Mwgv2o8kvEXvQdKgvUaF1nAO1DkxoLv9
         NEiKWzRSXFZA8x8WsGqola2XKfceooQweegp3UztyxM/IqJsk+gm8bvDSGBPFjzHvFRh
         hroHm67tO2Kv+BM9Z+7prixysVNQ+YCUXfkW5OzJj15JdI3yCpgo21mIbLotXCfVWLVK
         2aDw==
X-Gm-Message-State: AOJu0YxX8hxtBqVn6qCMVQaXjWj0pv2GobXXhmQQjEK1s54aJFlPX9uj
	h6cNxLB9UQmtL0vlWR9ljwh/rQ==
X-Google-Smtp-Source: AGHT+IE2a9V1x0QF58vrxmPh+676zXaDNfbRgtbLg2nvjy0Rs9FlGyQwbIVZykXjy0jPI4xlZz4P5Q==
X-Received: by 2002:ac2:5203:0:b0:500:c292:e44e with SMTP id a3-20020ac25203000000b00500c292e44emr5007938lfl.54.1700492700553;
        Mon, 20 Nov 2023 07:05:00 -0800 (PST)
Date: Mon, 20 Nov 2023 16:04:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v10 05/17] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZVt1m4vyw9SqexRp@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-6-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-6-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:15PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned we need to
> initialize/de-initialize vPCI state for the device.
> 
> Also, rename vpci_add_handlers() to vpci_assign_device() and
> vpci_remove_device() to vpci_deassign_device() to better reflect role
> of the functions.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> 
> In v10:
> - removed HAS_VPCI_GUEST_SUPPORT checks
> - HAS_VPCI_GUEST_SUPPORT config option (in Kconfig) as it is not used
>   anywhere
> In v9:
> - removed previous  vpci_[de]assign_device function and renamed
>   existing handlers
> - dropped attempts to handle errors in assign_device() function
> - do not call vpci_assign_device for dom_io
> - use d instead of pdev->domain
> - use IS_ENABLED macro
> In v8:
> - removed vpci_deassign_device
> In v6:
> - do not pass struct domain to vpci_{assign|deassign}_device as
>   pdev->domain can be used
> - do not leave the device assigned (pdev->domain == new domain) in case
>   vpci_assign_device fails: try to de-assign and if this also fails, then
>   crash the domain
> In v5:
> - do not split code into run_vpci_init
> - do not check for is_system_domain in vpci_{de}assign_device
> - do not use vpci_remove_device_handlers_locked and re-allocate
>   pdev->vpci completely
> - make vpci_deassign_device void
> In v4:
>  - de-assign vPCI from the previous domain on device assignment
>  - do not remove handlers in vpci_assign_device as those must not
>    exist at that point
> In v3:
>  - remove toolstack roll-back description from the commit message
>    as error are to be handled with proper cleanup in Xen itself
>  - remove __must_check
>  - remove redundant rc check while assigning devices
>  - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
>  - use REGISTER_VPCI_INIT machinery to run required steps on device
>    init/assign: add run_vpci_init helper
> In v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> In v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/passthrough/pci.c | 20 ++++++++++++++++----
>  xen/drivers/vpci/header.c     |  2 +-
>  xen/drivers/vpci/vpci.c       |  6 +++---
>  xen/include/xen/vpci.h        | 10 +++++-----
>  4 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 182da45acb..b7926a291c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -755,7 +755,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * For devices not discovered by Xen during boot, add vPCI handlers
>           * when Dom0 first informs Xen about such devices.
>           */
> -        ret = vpci_add_handlers(pdev);
> +        ret = vpci_assign_device(pdev);
>          if ( ret )
>          {
>              list_del(&pdev->domain_list);
> @@ -769,7 +769,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              write_lock(&hardware_domain->pci_lock);
> -            vpci_remove_device(pdev);
> +            vpci_deassign_device(pdev);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
> @@ -817,7 +817,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> -            vpci_remove_device(pdev);
> +            vpci_deassign_device(pdev);
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> @@ -875,6 +875,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>              goto out;
>      }
>  
> +    write_lock(&d->pci_lock);
> +    vpci_deassign_device(pdev);
> +    write_unlock(&d->pci_lock);
> +
>      devfn = pdev->devfn;
>      ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
>                       pci_to_dev(pdev));

In deassign_device() you are missing a call to vpci_assign_device() in
order to setup the vPCI handlers for the target domain (not for
dom_io, but possibly for hardware_domain if it's PVH-like).

If the call to reassign_device is successful you need to call
vpci_assign_device().

The rest LGTM.

Thanks, Roger.

