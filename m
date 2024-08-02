Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A517F945920
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770255.1181219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmxU-00081x-Vk; Fri, 02 Aug 2024 07:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770255.1181219; Fri, 02 Aug 2024 07:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZmxU-0007zm-RP; Fri, 02 Aug 2024 07:44:16 +0000
Received: by outflank-mailman (input) for mailman id 770255;
 Fri, 02 Aug 2024 07:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZmxT-0007vh-Ds
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:44:15 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 032169f7-50a3-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 09:44:14 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6b7b28442f9so88737566d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 00:44:14 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c76f8ccsm4657496d6.4.2024.08.02.00.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 00:44:12 -0700 (PDT)
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
X-Inumbo-ID: 032169f7-50a3-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722584653; x=1723189453; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/o79dhHmUDQP4JhXdg4okU5Bb30/RuXPb1uzrA/KSY=;
        b=CCUUIIgKPa7GMUdCSJqeAt57sZpODWsEgM4510Xd28E6PCQ8hSiW/VLmeby5JTbR/w
         fwcBHESEZLnqaC82eYaxp9jmAIYKkiHDWWm5FESxLSm3cPlOv2BxhIMr3cErrD5JIpcp
         hVi3KoWOpSBrVO+pUQ6D4r4EsRbZ5+2ORHYzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722584653; x=1723189453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/o79dhHmUDQP4JhXdg4okU5Bb30/RuXPb1uzrA/KSY=;
        b=li3EElJNZSdC1XtMxfCY/w9+2kD2AVEzQbvS8hZVEx2EowXCMOSxl6NnB/JAkNCzOc
         Xxri399J/duV84fgVbu6LzGOIYswYw1Bzf8nOhSUhchXFy5tEM6+6/sAWoH20yIGx6nr
         KxxDHGeUFka+cU08f8s9OU/YBtpi0LguumbeCGBTxIlYwhQ0WeCyKqX6Owfd5if/PSx9
         mjTurlNj4fbDm5MgdxR6IValiIVryoH7PVk6XTl/ziJHb6wm9D+q2Mq3PKd3OI1VleNl
         AeA0tPRZTsYwBUb2entlJpc892YrYO+VxYL6u4LlCu8NMqTOwcCpJ8XSafk2W5+IqeDL
         vw4w==
X-Forwarded-Encrypted: i=1; AJvYcCWiNTRtqvEna/K8UHguozaRXw8y0F4w8uGaBanlqdxoo5f3Chp2x9/1nmm+pLPw6JknKkBFkqtivZdOCrXOO1tSDFlhr9Iw8AYPhmlZfDY=
X-Gm-Message-State: AOJu0YxcG+EipgPLFcvEG02fbe7L/33rWEICdOfzTzDBIzvpQ3F3c2FK
	ggbnwT6LGfpJv5SlDoFCet/3hgsHVMwN88r0nsZhipsJ+0+HZONX5Z7U7wsVCQk=
X-Google-Smtp-Source: AGHT+IFEz8hYNic0veNXMHp1QXe+XAoszO1Kh290U390CkluvyPtHh9/8fViIK+0K/nuCRUaBIaY2w==
X-Received: by 2002:a05:6214:2e47:b0:6b7:97b8:95ff with SMTP id 6a1803df08f44-6bb984677d0mr25827366d6.54.1722584652656;
        Fri, 02 Aug 2024 00:44:12 -0700 (PDT)
Date: Fri, 2 Aug 2024 09:44:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Message-ID: <ZqyOSrx8aHXh1OKn@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
 <ZqpeiWhuqPXiTeRZ@macbook>
 <BL1PR12MB5849CFC87F0DB92864B54BE4E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>

On Fri, Aug 02, 2024 at 08:25:58AM +0200, Jan Beulich wrote:
> On 02.08.2024 04:55, Chen, Jiqian wrote:
> > On 2024/7/31 23:55, Roger Pau Monné wrote:
> >> On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
> >>> When a device has been reset on dom0 side, the Xen hypervisor
> >>> doesn't get notification, so the cached state in vpci is all
> >>> out of date compare with the real device state.
> >>>
> >>> To solve that problem, add a new hypercall to support the reset
> >>> of pcidev and clear the vpci state of device. So that once the
> >>> state of device is reset on dom0 side, dom0 can call this
> >>> hypercall to notify hypervisor.
> >>>
> >>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> Thanks, just a couple of nits.
> >>
> >> This is missing a changelog between versions, and I haven't been
> >> following all the versions, so some of my questions might have been
> >> answered in previous revisions.
> > Sorry, I will add changelogs here in next version.
> > 
> >>
> >>> ---
> >>>  xen/arch/x86/hvm/hypercall.c |  1 +
> >>>  xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
> >>>  xen/drivers/vpci/vpci.c      | 10 +++++++
> >>>  xen/include/public/physdev.h | 16 +++++++++++
> >>>  xen/include/xen/vpci.h       |  8 ++++++
> >>>  5 files changed, 87 insertions(+)
> >>>
> >>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> >>> index 7fb3136f0c7c..0fab670a4871 100644
> >>> --- a/xen/arch/x86/hvm/hypercall.c
> >>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>> @@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>      case PHYSDEVOP_pci_mmcfg_reserved:
> >>>      case PHYSDEVOP_pci_device_add:
> >>>      case PHYSDEVOP_pci_device_remove:
> >>> +    case PHYSDEVOP_pci_device_state_reset:
> >>>      case PHYSDEVOP_dbgp_op:
> >>>          if ( !is_hardware_domain(currd) )
> >>>              return -ENOSYS;
> >>> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> >>> index 42db3e6d133c..c0f47945d955 100644
> >>> --- a/xen/drivers/pci/physdev.c
> >>> +++ b/xen/drivers/pci/physdev.c
> >>> @@ -2,6 +2,7 @@
> >>>  #include <xen/guest_access.h>
> >>>  #include <xen/hypercall.h>
> >>>  #include <xen/init.h>
> >>> +#include <xen/vpci.h>
> >>>  
> >>>  #ifndef COMPAT
> >>>  typedef long ret_t;
> >>> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>          break;
> >>>      }
> >>>  
> >>> +    case PHYSDEVOP_pci_device_state_reset:
> >>> +    {
> >>> +        struct pci_device_state_reset dev_reset;
> >>> +        struct pci_dev *pdev;
> >>> +        pci_sbdf_t sbdf;
> >>> +
> >>> +        ret = -EOPNOTSUPP;
> >>> +        if ( !is_pci_passthrough_enabled() )
> >>> +            break;
> >>> +
> >>> +        ret = -EFAULT;
> >>> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
> >>> +            break;
> >>> +
> >>> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
> >>> +                        dev_reset.dev.bus,
> >>> +                        dev_reset.dev.devfn);
> >>> +
> >>> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> >>> +        if ( ret )
> >>> +            break;
> >>> +
> >>> +        pcidevs_lock();
> >>> +        pdev = pci_get_pdev(NULL, sbdf);
> >>> +        if ( !pdev )
> >>> +        {
> >>> +            pcidevs_unlock();
> >>> +            ret = -ENODEV;
> >>> +            break;
> >>> +        }
> >>> +
> >>> +        write_lock(&pdev->domain->pci_lock);
> >>> +        pcidevs_unlock();
> >>> +        switch ( dev_reset.reset_type )
> >>> +        {
> >>> +        case PCI_DEVICE_STATE_RESET_COLD:
> >>> +        case PCI_DEVICE_STATE_RESET_WARM:
> >>> +        case PCI_DEVICE_STATE_RESET_HOT:
> >>> +        case PCI_DEVICE_STATE_RESET_FLR:
> >>> +            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
> >>> +            break;
> >>> +
> >>> +        default:
> >>> +            ret = -EOPNOTSUPP;
> >>> +            break;
> >>> +        }
> >>> +        write_unlock(&pdev->domain->pci_lock);
> >>> +
> >>> +        break;
> >>> +    }
> >>> +
> >>>      default:
> >>>          ret = -ENOSYS;
> >>>          break;
> >>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> >>> index 1e6aa5d799b9..7e914d1eff9f 100644
> >>> --- a/xen/drivers/vpci/vpci.c
> >>> +++ b/xen/drivers/vpci/vpci.c
> >>> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
> >>>  
> >>>      return rc;
> >>>  }
> >>> +
> >>> +int vpci_reset_device_state(struct pci_dev *pdev,
> >>> +                            uint32_t reset_type)
> >>
> >> There's probably no use in passing reset_type to
> >> vpci_reset_device_state() if it's ignored?
> >>
> >>> +{
> >>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> >>> +
> >>> +    vpci_deassign_device(pdev);
> >>> +    return vpci_assign_device(pdev);
> >>> +}
> >>> +
> >>>  #endif /* __XEN__ */
> >>>  
> >>>  static int vpci_register_cmp(const struct vpci_register *r1,
> >>> diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
> >>> index f0c0d4727c0b..3cfde3fd2389 100644
> >>> --- a/xen/include/public/physdev.h
> >>> +++ b/xen/include/public/physdev.h
> >>> @@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
> >>>   */
> >>>  #define PHYSDEVOP_prepare_msix          30
> >>>  #define PHYSDEVOP_release_msix          31
> >>> +/*
> >>> + * Notify the hypervisor that a PCI device has been reset, so that any
> >>> + * internally cached state is regenerated.  Should be called after any
> >>> + * device reset performed by the hardware domain.
> >>> + */
> >>> +#define PHYSDEVOP_pci_device_state_reset 32
> >>> +
> >>>  struct physdev_pci_device {
> >>>      /* IN */
> >>>      uint16_t seg;
> >>> @@ -305,6 +312,15 @@ struct physdev_pci_device {
> >>>  typedef struct physdev_pci_device physdev_pci_device_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
> >>>  
> >>> +struct pci_device_state_reset {
> >>> +    physdev_pci_device_t dev;
> >>> +#define PCI_DEVICE_STATE_RESET_COLD 0
> >>> +#define PCI_DEVICE_STATE_RESET_WARM 1
> >>> +#define PCI_DEVICE_STATE_RESET_HOT  2
> >>> +#define PCI_DEVICE_STATE_RESET_FLR  3
> >>> +    uint32_t reset_type;
> >>
> >> This might want to be a flags field, with the low 2 bits (or maybe 3
> >> bits to cope if more rest modes are added in the future) being used to
> >> signal the reset type.  We can always do that later if flags need to
> >> be added.
> > Do you mean this?
> > +struct pci_device_state_reset {
> > +    physdev_pci_device_t dev;
> > +#define _PCI_DEVICE_STATE_RESET_COLD 0
> > +#define PCI_DEVICE_STATE_RESET_COLD  (1U<<_PCI_DEVICE_STATE_RESET_COLD)
> > +#define _PCI_DEVICE_STATE_RESET_WARM 1
> > +#define PCI_DEVICE_STATE_RESET_WARM  (1U<<_PCI_DEVICE_STATE_RESET_WARM)
> > +#define _PCI_DEVICE_STATE_RESET_HOT  2
> > +#define PCI_DEVICE_STATE_RESET_HOT   (1U<<_PCI_DEVICE_STATE_RESET_HOT)
> > +#define _PCI_DEVICE_STATE_RESET_FLR  3
> > +#define PCI_DEVICE_STATE_RESET_FLR   (1U<<_PCI_DEVICE_STATE_RESET_FLR)
> > +    uint32_t reset_type;
> > +};
> 
> That's four bits, not two. I'm pretty sure Roger meant to keep the enum-
> like #define-s, but additionally define a 2-bit mask constant (0x3). I
> don't think it needs to be three bits right away - we can decide what to
> do there when any of the higher bits are to be assigned a meaning.

Indeed, what I was requesting is just a cosmetic change, it doesn't
result in the values on the enum changing at all.

The field however should be better named "flags" or something more
generic so in the future it can accommodate other flags not related to
the reset type.

Thanks, Roger.

