Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF69433BC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768927.1179824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBgI-0007lT-NW; Wed, 31 Jul 2024 15:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768927.1179824; Wed, 31 Jul 2024 15:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBgI-0007jO-Kp; Wed, 31 Jul 2024 15:56:02 +0000
Received: by outflank-mailman (input) for mailman id 768927;
 Wed, 31 Jul 2024 15:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZBgH-0007jI-0W
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:56:01 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6068ef03-4f55-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 17:55:58 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7093472356dso3428842a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:55:58 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa97575sm74868576d6.102.2024.07.31.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 08:55:56 -0700 (PDT)
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
X-Inumbo-ID: 6068ef03-4f55-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722441357; x=1723046157; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vULipYFs0hyxWvwRw3dkVbCvPcWrYDc4nf6yTLUzABk=;
        b=ZsMthHxQq/gBcYFpq6R/4Zmy93G178fM8HrXHehsohCFV30RZpouInmjaGkqAZCfp+
         76IQK/t1aYuvN6ph+d9d6e2tTYRmXs/A8lEfQp/VDr0ZiwbdlDsxwjkH3i4R6SVP1jS+
         k6cdOU/EEwL78yKkYm7+Pex73B//YFA8m3zq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441357; x=1723046157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vULipYFs0hyxWvwRw3dkVbCvPcWrYDc4nf6yTLUzABk=;
        b=VmUX6k4Od7g8c8TgVfDJ68L8hiTyxBi4yIl8BW76YLIGO+gMyciDhOzGdE4RP/tcAi
         GhKC+ZCgqZIa4OP6buVdvQ+KLL1h2nERiJxJTY+B1XrYkgL1a7pjwzIg2gc+/UrA8zAH
         e54zabUFPWtXWkgb/lSfQDGmGMK3LZRS1z8qUMso/E5CJyszuiUJJCYVbcW88rBBW4UK
         vc5fs7lUnQbKhMqISzBTtuPJAsZk3cR2eXwq1kOktFLivTIF9feUzUVGRmjzKrMY+Grk
         BYO/JcRJ+CQzfHNltybs/qGcOgGb6zRYCdZep8UdoBYDU7RF2QsEq8CM3SzqYOIlbwvG
         Qc9Q==
X-Gm-Message-State: AOJu0YxQZHXkvT0vxIHGaDy0Dm2Z934JJXULBD1Hhzmpe+6Dl5LjSOof
	BaKEvAPeHdrYC8IFUMTkbqWTQRNOx6qdAJUVHwQaypFyKdCohJk3IrY5A9IvAxg=
X-Google-Smtp-Source: AGHT+IEIBWHnUV1G1fXevRhxALfU58UH0I1lQ01udtQ222LLYJs3uq7e0Blu39X3CJJ3MxV1r+yqkA==
X-Received: by 2002:a05:6358:724c:b0:1ac:549b:ce02 with SMTP id e5c5f4694b2df-1adce48337fmr1892492755d.28.1722441357153;
        Wed, 31 Jul 2024 08:55:57 -0700 (PDT)
Date: Wed, 31 Jul 2024 17:55:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Message-ID: <ZqpeiWhuqPXiTeRZ@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240708114124.407797-2-Jiqian.Chen@amd.com>

On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the Xen hypervisor
> doesn't get notification, so the cached state in vpci is all
> out of date compare with the real device state.
> 
> To solve that problem, add a new hypercall to support the reset
> of pcidev and clear the vpci state of device. So that once the
> state of device is reset on dom0 side, dom0 can call this
> hypercall to notify hypervisor.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, just a couple of nits.

This is missing a changelog between versions, and I haven't been
following all the versions, so some of my questions might have been
answered in previous revisions.

> ---
>  xen/arch/x86/hvm/hypercall.c |  1 +
>  xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c      | 10 +++++++
>  xen/include/public/physdev.h | 16 +++++++++++
>  xen/include/xen/vpci.h       |  8 ++++++
>  5 files changed, 87 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 7fb3136f0c7c..0fab670a4871 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_mmcfg_reserved:
>      case PHYSDEVOP_pci_device_add:
>      case PHYSDEVOP_pci_device_remove:
> +    case PHYSDEVOP_pci_device_state_reset:
>      case PHYSDEVOP_dbgp_op:
>          if ( !is_hardware_domain(currd) )
>              return -ENOSYS;
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 42db3e6d133c..c0f47945d955 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -2,6 +2,7 @@
>  #include <xen/guest_access.h>
>  #include <xen/hypercall.h>
>  #include <xen/init.h>
> +#include <xen/vpci.h>
>  
>  #ifndef COMPAT
>  typedef long ret_t;
> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset:
> +    {
> +        struct pci_device_state_reset dev_reset;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        ret = -EOPNOTSUPP;
> +        if ( !is_pci_passthrough_enabled() )
> +            break;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
> +            break;
> +
> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
> +                        dev_reset.dev.bus,
> +                        dev_reset.dev.devfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;
> +
> +        pcidevs_lock();
> +        pdev = pci_get_pdev(NULL, sbdf);
> +        if ( !pdev )
> +        {
> +            pcidevs_unlock();
> +            ret = -ENODEV;
> +            break;
> +        }
> +
> +        write_lock(&pdev->domain->pci_lock);
> +        pcidevs_unlock();
> +        switch ( dev_reset.reset_type )
> +        {
> +        case PCI_DEVICE_STATE_RESET_COLD:
> +        case PCI_DEVICE_STATE_RESET_WARM:
> +        case PCI_DEVICE_STATE_RESET_HOT:
> +        case PCI_DEVICE_STATE_RESET_FLR:
> +            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
> +            break;
> +
> +        default:
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }
> +        write_unlock(&pdev->domain->pci_lock);
> +
> +        break;
> +    }
> +
>      default:
>          ret = -ENOSYS;
>          break;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 1e6aa5d799b9..7e914d1eff9f 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev,
> +                            uint32_t reset_type)

There's probably no use in passing reset_type to
vpci_reset_device_state() if it's ignored?

> +{
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    vpci_deassign_device(pdev);
> +    return vpci_assign_device(pdev);
> +}
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,
> diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
> index f0c0d4727c0b..3cfde3fd2389 100644
> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
>   */
>  #define PHYSDEVOP_prepare_msix          30
>  #define PHYSDEVOP_release_msix          31
> +/*
> + * Notify the hypervisor that a PCI device has been reset, so that any
> + * internally cached state is regenerated.  Should be called after any
> + * device reset performed by the hardware domain.
> + */
> +#define PHYSDEVOP_pci_device_state_reset 32
> +
>  struct physdev_pci_device {
>      /* IN */
>      uint16_t seg;
> @@ -305,6 +312,15 @@ struct physdev_pci_device {
>  typedef struct physdev_pci_device physdev_pci_device_t;
>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
>  
> +struct pci_device_state_reset {
> +    physdev_pci_device_t dev;
> +#define PCI_DEVICE_STATE_RESET_COLD 0
> +#define PCI_DEVICE_STATE_RESET_WARM 1
> +#define PCI_DEVICE_STATE_RESET_HOT  2
> +#define PCI_DEVICE_STATE_RESET_FLR  3
> +    uint32_t reset_type;

This might want to be a flags field, with the low 2 bits (or maybe 3
bits to cope if more rest modes are added in the future) being used to
signal the reset type.  We can always do that later if flags need to
be added.

Seeing as reset_type has no impact on the hypercall, I would like to
ask for some reasoning for it's presence to be added to the commit
message, otherwise it feels like pointless code churn.

> +};
> +
>  #define PHYSDEVOP_DBGP_RESET_PREPARE    1
>  #define PHYSDEVOP_DBGP_RESET_DONE       2
>  
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index da8d0f41e6f4..6be812dbc04a 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -38,6 +38,8 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
>  
>  /* Remove all handlers and free vpci related structures. */
>  void vpci_deassign_device(struct pci_dev *pdev);
> +int __must_check vpci_reset_device_state(struct pci_dev *pdev,
> +                                         uint32_t reset_type);
>  
>  /* Add/remove a register handler. */
>  int __must_check vpci_add_register_mask(struct vpci *vpci,
> @@ -282,6 +284,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
>  
>  static inline void vpci_deassign_device(struct pci_dev *pdev) { }
>  
> +static inline int __must_check vpci_reset_device_state(struct pci_dev *pdev,
> +                                                       uint32_t reset_type)
> +{
> +    return 0;
> +}
> +

Maybe it turns out to be more complicated than the current approach,
but vpci_reset_device_state() could be an static inline function in
vpci.h defined regardless of whether CONFIG_HAS_VPCI is selected or
not, as the underlying functions vpci_{de}assign_device() are always
defined.

Thanks, Roger.

