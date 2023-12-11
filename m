Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634080CF5A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 16:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652301.1018074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCi6g-0001pe-Qa; Mon, 11 Dec 2023 15:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652301.1018074; Mon, 11 Dec 2023 15:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCi6g-0001mV-Nl; Mon, 11 Dec 2023 15:22:06 +0000
Received: by outflank-mailman (input) for mailman id 652301;
 Mon, 11 Dec 2023 15:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCi6f-0001mP-FA
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 15:22:05 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 092d0bd4-9839-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 16:22:03 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3332e351670so4241607f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 07:22:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g13-20020a056000118d00b003333d46a9e8sm8792758wrx.56.2023.12.11.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 07:22:02 -0800 (PST)
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
X-Inumbo-ID: 092d0bd4-9839-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702308122; x=1702912922; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a/jr27RPVvMWTsClnU42DBXNkzAgyd2hu1MyOOYNXqI=;
        b=tAvsLP9n4/40InRajKXNYqNWkvBhu7XP/HXb32oRW19ggU5d04R8jnPNNLRU7hqX7o
         hcN/kf3E0Au9ismvHjSMnpjMiOLDuZfSwAQ1+fbbGRsI3MsrXnAT7dCT9vjE5kjrjMtp
         la0fAIEWNJw09YfhNpQw/2xy8/X8XxkegP9T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308122; x=1702912922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/jr27RPVvMWTsClnU42DBXNkzAgyd2hu1MyOOYNXqI=;
        b=pxNe5Ak0eTnYGYFIOVOudJRo0RagmqnMylYvPrg5ces4NWVcvK5LG4X6O0ZT9uo5D8
         bxHWG18tqAJS0J16aJpV3qMyofieSN+xDgasthBDiITkx9fzqinuVOE5mMhNgiKCpfXi
         bysrHV9/WIXWR/qDwtcjfFdFu1JbW6WD7qibVjrU3HNboJD2T56kQzpQ6e5NgzDTWv2R
         srm8bzbw+9wCib4o2TSkFWUBzaVobQnRx6bdZJoNXfkZ1BUPc6+elTDDPK0iFN0tBB58
         07HdmrkqCbz53CyBZYFiwQ2dmz2bKPdzKNT8VJlhWwYYsU/V7BEggwh28g4ienX0T5ce
         DeZA==
X-Gm-Message-State: AOJu0YxJlXoLRMubic6giOIU2Payu3xoNcs8H535T/tFFSS3jiKKClWV
	XI7UQMyGZ6hYS+o4d63tjhQqYA==
X-Google-Smtp-Source: AGHT+IGsKak5+p/jbVJ1LV8GlaCZRUmPgLESbv38mTTq0zqNdO9+ZmxFt8etGTrDMyAgHISfD7IUEA==
X-Received: by 2002:a5d:51c6:0:b0:333:4289:b170 with SMTP id n6-20020a5d51c6000000b003334289b170mr1154500wrv.210.1702308122569;
        Mon, 11 Dec 2023 07:22:02 -0800 (PST)
Date: Mon, 11 Dec 2023 16:22:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v3 1/3] xen/vpci: Clear all vpci status of device
Message-ID: <ZXcpGdSgTCwpTBkc@macbook>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210164009.1551147-2-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:40:07AM +0800, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the vpci on Xen
> side won't get notification, so the cached state in vpci is
> all out of date compare with the real device state.
> To solve that problem, add a new hypercall to clear all vpci
> device state. When the state of device is reset on dom0 side,
> dom0 can call this hypercall to notify vpci.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c |  1 +
>  xen/drivers/pci/physdev.c    | 35 +++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c      |  9 +++++++++
>  xen/include/public/physdev.h |  8 ++++++++
>  xen/include/xen/vpci.h       |  6 ++++++
>  5 files changed, 59 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index eeb73e1aa5..6ad5b4d5f1 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_mmcfg_reserved:
>      case PHYSDEVOP_pci_device_add:
>      case PHYSDEVOP_pci_device_remove:
> +    case PHYSDEVOP_pci_device_state_reset:
>      case PHYSDEVOP_dbgp_op:
>          if ( !is_hardware_domain(currd) )
>              return -ENOSYS;
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 42db3e6d13..6ee2edb86a 100644
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
> @@ -67,6 +68,40 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset: {
> +        struct physdev_pci_device dev;
> +        struct pci_dev *pdev;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV,
> +                                     (dev.seg << 16) | (dev.bus << 8) |
> +                                     dev.devfn);
> +        if ( ret )
> +            break;
> +
> +        pcidevs_lock();
> +        pdev = pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devfn));
> +        if ( !pdev )
> +        {
> +            ret = -ENODEV;
> +            pcidevs_unlock();

Nit: assigning -ENODEV could be done after dropping the lock.

> +            break;
> +        }
> +
> +        ret = vpci_reset_device_state(pdev);
> +        if ( ret )
> +            printk(XENLOG_ERR "PCI reset device %pp state failed\n",
> +                   &pdev->sbdf);

Please do the print outside of the locked region, there's no need to
hold the pcidevs lock after the vpci_reset_device_state() call if you
use the data in the local 'dev' variable to print the SBDF.

It would also be fine if you want to introduce a local sbdf variable
that you can use both here and in the call to pci_get_pdev() above.

I think it's also easier to parse if the SBDF is at the begging of the
message:

"%pp: failed to reset PCI device state\n"

That's however a question of taste.

> +        pcidevs_unlock();
> +        break;
> +    }
> +
>      default:
>          ret = -ENOSYS;
>          break;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 72ef277c4f..3c64cb10cc 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -107,6 +107,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_locked());
> +
> +    vpci_remove_device(pdev);
> +    return vpci_add_handlers(pdev);
> +}
> +
>  #endif /* __XEN__ */
>  
>  static int vpci_register_cmp(const struct vpci_register *r1,
> diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
> index f0c0d4727c..92c2f28bca 100644
> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -296,6 +296,14 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
>   */
>  #define PHYSDEVOP_prepare_msix          30
>  #define PHYSDEVOP_release_msix          31
> +/*
> + * On PVH dom0, when device is reset, the vpci on Xen side
> + * won't get notification, so that the cached state in vpci is
> + * all out of date with the real device state. Use this to reset
> + * the vpci state of device.
> + */

I get this feeling this is too specific to vpci, when the hypercall
itself could be used for other purposes in the future.  I would
instead write:

/*
 * Notify the hypervisor that a PCI device has been reset, so that any
 * internally cached state is regenerated.  Should be called after any
 * device reset performed by the hardware domain.
 */

> +#define PHYSDEVOP_pci_device_state_reset     32
> +
>  struct physdev_pci_device {
>      /* IN */
>      uint16_t seg;
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index d20c301a3d..d6377424f0 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -30,6 +30,7 @@ int __must_check vpci_add_handlers(struct pci_dev *pdev);
>  
>  /* Remove all handlers and free vpci related structures. */
>  void vpci_remove_device(struct pci_dev *pdev);
> +int vpci_reset_device_state(struct pci_dev *pdev);

__must_check please.

Thanks, Roger.

