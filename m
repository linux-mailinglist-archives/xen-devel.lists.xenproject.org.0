Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FF7FBC3C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643200.1003171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ylD-0001wW-HU; Tue, 28 Nov 2023 14:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643200.1003171; Tue, 28 Nov 2023 14:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ylD-0001us-Eu; Tue, 28 Nov 2023 14:08:23 +0000
Received: by outflank-mailman (input) for mailman id 643200;
 Tue, 28 Nov 2023 14:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7ylC-0001uk-6m
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:08:22 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 960afef2-8df7-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 15:08:21 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50aab0ca90aso7907081e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 06:08:20 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c139300b0040b4562ee20sm938516wmf.0.2023.11.28.06.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 06:08:20 -0800 (PST)
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
X-Inumbo-ID: 960afef2-8df7-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701180500; x=1701785300; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09LGEuN7I4iZi00afpG/Xfc7kxLl8AhrI6FyWaiUvyY=;
        b=QxsQJC1hXsPeoca4I64jwUBykxwI65D1KyP2252FQ0ap450MQ+cWR9QyXkQne0GjfS
         ue7zbtUaHhQOqR2R4rkAP09Aebztr8RmwbJf1BmBxjS8rlflJQMQYaIE6Ow/YhyDGzQT
         sFMlNz0CkERTBKWRrWQDDNSaN2s3/c+JAUGsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180500; x=1701785300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09LGEuN7I4iZi00afpG/Xfc7kxLl8AhrI6FyWaiUvyY=;
        b=LR85oZbhMaTkGjuRE6GxwuBl7lC/li2F12J23NZdwhd8QYcNFr+BEQBnDss8NtG6WM
         rqJfGnzRsJehQE+vl9l1oZZJ6od4Xygk4j296YtGyAavKlAPbvk7eCVi7hOBEmY18N57
         zLqfnZtHm8HjA3AjQh4yUP7bcMZlyAZ7gT5BoPBUFh1MxTnzWwVT1AZm18iTnMA0t4gg
         sqp7y3DDYNTJv9EFp5/cil9OYDgxFjGcwUDCi9tFPbFDpL9Rp0OP5nI4OmVBdVS+znig
         Mn1oXL4j8fAcv2J8VFDtZHJsGDh4hj96mXdlZHfgg3rHJBkIKtoRP/Ozrz04F3Z8/s9c
         8d0Q==
X-Gm-Message-State: AOJu0YxEfbPip720Sg9li5nAqPkuVzdFdqMOapahejCq+mYt36kHgh8J
	5EE8HrqOz1qJlWtvdGD20I9WDQ==
X-Google-Smtp-Source: AGHT+IFRLdgroHb99jGaL6IAV4E4qKAmiDhFFBHlpexPnZZz0NmTGjuHdpZY5YNWN+mwQ6CS52lCHw==
X-Received: by 2002:a05:6512:511:b0:50b:c1ec:4755 with SMTP id o17-20020a056512051100b0050bc1ec4755mr156913lfb.16.1701180500344;
        Tue, 28 Nov 2023 06:08:20 -0800 (PST)
Date: Tue, 28 Nov 2023 15:08:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Message-ID: <ZWX0U1tYooY70UJo@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124104136.3263722-2-Jiqian.Chen@amd.com>

On Fri, Nov 24, 2023 at 06:41:34PM +0800, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the vpci on Xen
> side won't get notification, so the cached state in vpci is
> all out of date compare with the real device state.
> To solve that problem, this patch add new hypercall to clear
> all vpci device state. And when reset device happens on dom0
> side, dom0 can call this hypercall to notify vpci.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c  |  1 +
>  xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
>  xen/drivers/pci/physdev.c     | 14 ++++++++++++++
>  xen/drivers/vpci/vpci.c       |  9 +++++++++
>  xen/include/public/physdev.h  |  2 ++
>  xen/include/xen/pci.h         |  1 +
>  xen/include/xen/vpci.h        |  6 ++++++
>  7 files changed, 54 insertions(+)
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
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 04d00c7c37..f871715585 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> +int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)

You could use pci_sbdf_t here instead of 3 parameters.

I'm however unsure whether we really need this helper just to fetch
the pdev and call vpci_reset_device_state(), I think you could place
this logic directly in pci_physdev_op().  Unless there are plans to
use such logic outside of pci_physdev_op().

> +{
> +    struct pci_dev *pdev;
> +    int ret = -ENODEV;

Some XSM check should be introduced fro this operation, as none of the
existing ones is suitable.  See xsm_resource_unplug_pci() for example.

xsm_resource_reset_state_pci() or some such I would assume.

(adding the XSM maintainer for feedback).

> +
> +    pcidevs_lock();
> +
> +    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
> +    if ( !pdev )
> +        goto error;
> +
> +    ret = vpci_reset_device_state(pdev);
> +    if (ret)
> +        printk(XENLOG_ERR "PCI reset device %pp state failed\n", &pdev->sbdf);
> +
> +error:
> +    pcidevs_unlock();
> +
> +    return ret;
> +}
> +
>  /* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 42db3e6d13..cfdb545654 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -67,6 +67,20 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset: {
> +        struct physdev_pci_device dev;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +
> +        ret = pci_reset_device_state(dev.seg, dev.bus, dev.devfn);
> +        break;
> +    }
> +
>      default:
>          ret = -ENOSYS;
>          break;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3bec9a4153..e9c3eb1cd6 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -103,6 +103,15 @@ int vpci_add_handlers(struct pci_dev *pdev)
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
> index f0c0d4727c..4156948903 100644
> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -305,6 +305,8 @@ struct physdev_pci_device {
>  typedef struct physdev_pci_device physdev_pci_device_t;
>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
>  
> +#define PHYSDEVOP_pci_device_state_reset      32

This needs some comment in order to explain the expected behaviour,
and might be better placed a bit up after PHYSDEVOP_release_msix.

Thanks, Roger.

