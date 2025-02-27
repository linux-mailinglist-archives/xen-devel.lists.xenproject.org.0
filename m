Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31845A47A39
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 11:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897959.1306572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnb3c-0004Qt-J0; Thu, 27 Feb 2025 10:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897959.1306572; Thu, 27 Feb 2025 10:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnb3c-0004PT-GB; Thu, 27 Feb 2025 10:23:56 +0000
Received: by outflank-mailman (input) for mailman id 897959;
 Thu, 27 Feb 2025 10:23:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WoT=VS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnb3b-0004PN-Bz
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 10:23:55 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee29094a-f4f4-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 11:23:48 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-220f4dd756eso13686835ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 02:23:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7de19cdasm895021a12.24.2025.02.27.02.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 02:23:46 -0800 (PST)
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
X-Inumbo-ID: ee29094a-f4f4-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740651827; x=1741256627; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzPPTIV1MIhCohVBsP3a8iY9BCmbsAzTQwZB+Mfb+Mo=;
        b=PV/B/ItFOJjJpqWWbDr7HrL/R/IN+m+sVaYbgR/s60QGKM7ja818rNUnnVP4SqU5x0
         kWZZjq11HR9WiMlTK85iZeutmBIK46VwlFhhKDB68OuqD1iYQmpwhx4F7qjvAMTRiXx9
         2bA4re7GXRIIen5YJgEvYSfWAZC6dwI09vu3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740651827; x=1741256627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzPPTIV1MIhCohVBsP3a8iY9BCmbsAzTQwZB+Mfb+Mo=;
        b=Wv+ZR3QKL1nHjsMEmXK0PLJuanuAwYghuAvKhmKBxlK5eqvUkMrpvw0wbx4m63dcZX
         UeZmTVk4k0n4ZgfxMdgStxiFHLxfqjb6Yp6srpm4O0/048RWhnuGMWIe6nAztvXxCCyO
         Nl58+zfS3+AZd3C7BC8TsnpZjKjC0oJcpGLCYF/6VXYSBg3gmRVzdYxBXqHjWye7aUCK
         F5U/yfHHaJ5Es/TOVPvuHtHGx9ylwaA44SJ53SZA3k2oUvxdSOnzlampqaHLi7/Qn3Bi
         5wkhH0MAzZs8m58Mm29kOIkc1tuXD4B4F3Wdg7e2ImPlf8RoIRSpZDmZ8QFe/lQ2Vi7B
         l/Ew==
X-Gm-Message-State: AOJu0Yw9vb7dFlJ8EYAmcEy8sW7QA6ZgGc4fMw+IPXN4tmkzF8sPnngL
	M5q6q+MZgZT3tpaLBk57y71X9W36We5+FqPYgs2Gb4Ykcpyf6lvSiCNX7wY60+o=
X-Gm-Gg: ASbGncuHLnYkgwxoyjVFRh/Q/6+sbLOBMHSlLX5lVCtXvEgkb2kXc3eN5QLNFry/Ny4
	HzREphzPCWZOklp579B4Ju8R4iAZiPZ+0bem0Z+IAXKOvsBZgfyb1v/K1I83KCp30vNwPXX3bGh
	1SUaEoAkZcPWPpNCAa4IAp0mRvWFcNv4uTHR4TxfaFSFasn4I3KgOV7UhpCu1T7HstgfFi0B3Xz
	StnpHxTPHNCaCruWYT4nGpA+lQPuorOsmEQ7vCBCe7TipXM3t2XtNJRBDsco8pnsjgezP3ZaNbX
	JQrCytsI6pnEU3JHvJP7ljQ2OPYNce0=
X-Google-Smtp-Source: AGHT+IF2EQuoJK1SmRRukuoKUMYx+pB8rFuW0kHGmNIipFM+FGBWJVaib7PyulcELj8svP4YnVKpOw==
X-Received: by 2002:a05:6a21:6d8a:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-1f0fbff6f15mr14320999637.4.1740651826859;
        Thu, 27 Feb 2025 02:23:46 -0800 (PST)
Date: Thu, 27 Feb 2025 11:23:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
Message-ID: <Z8A9LYjgr92IignP@macbook.local>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226211125.43625-1-jason.andryuk@amd.com>

On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
> Sometimes we have to quirk the PCI IRTE to use a non-zero remap_index
> corresponding to the guest's view of the MSI data register.  The MSI
> data guest vector equals interrupt remapping table index.

I think you need some introduction before making this statement about
remapping indexes and IRTEs.

> The ath11k wifi device does unusual things with MSIs.  The driver lets
> Linux program the MSI capability.  Linux internally caches the MSI data
> it thinks it programmed.  It sets its affinity to CPU0.  The ath11k
> driver then reads the MSI address from the PCI configuration space.  The
> MSI address and cached data are then passed to other components on the
> same card to generate MSI interrupts.
> 
> With Xen, vPCI and QEMU PCI passthrough have a guest idea of the MSI
> address and data.  But Xen programs the actual hardware with its own
> address and data.  With per-device IRT, xen uses index 0.

By "Xen uses index 0" I think you mean that when using per-device
interrupt remapping table indexes start at 0 for every device, instead
of all devices sharing the same index address space.

> When the
> ath11k driver passes the guest address and data to the hardware, it
> generates faults when there is no IRTE for the guest data (~0x25).

What does ~0x25 mean in this context?

> To work around this, we can, for per-device IRTs, program the hardware
> to use the guest data & associated IRTE.  The address doesn't matter
> since the IRTE handles that, and the Xen address & vector can be used as
> expected.

All this work on AMD because when interrupt remapping is enabled all
MSIs are handled by the remapping table, while on Intel there's still
a bit in the MSI address field to signal whether the MSI is using a
remapping entry, or is using the "compatibility" format (iow: no
remapping).

> 
> For vPCI, the guest MSI data is available at the time of initial MSI
> setup, but that is not the case for HVM.  With HVM, the initial MSI
> setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
> only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
> case, we need to tear down and create a new IRTE.  This later location
> can also handle vPCI.
> 
> Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
> call sites.  Use msi_desc->gvec to pass through the desired value.

So basically the solution is to use the guest selected MSI vector as
the interrupt remapping table index, as then the guest can use the MSI
data and address fields without requiring Xen translation.

What about the guest using the same vector across multiple vCPUs?  So
MSI entries having the same vector field, but different target
destination CPUs?  That won't work correctly as all those MSIs will
attempt to use the same IRTE?

Note that when interrupt remapping support was introduced on AMD-Vi it
was indeed the vector that was used as index into the interrupt
remapping table, this was changed in:

2ca9fbd739b8 AMD IOMMU: allocate IRTE entries instead of using a static mapping

> Only tested with AMD-Vi.  Requires per-device IRT.  With AMD-Vi, the
> number of MSIs is passed in, but a minimum of a page is allocated for
> the table.  The vector is 8 bits giving indices 0-255.  Even with 128bit
> IRTEs, 16 bytes, 1 page 4096 / 16 = 256 entries, so we don't have to
> worry about overflow.  N MSIs can only have the last one at 255, so the
> guest can't expect to have N vectors starting above 255 - N.

While this seems like a possible quirk for AMD, what about Intel?

And what about PV?  I think PV mostly works because the migration of
interrupts across CPUs doesn't cause the IRT index to change, but we
should somehow add checks to this regard if this is now a requirement
for such kind of quirky devices.

> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Is something like this feasible for inclusion upstream?  I'm asking
> before I look into what it would take to support Intel.

Intel would be more complicated, as there the usage of the IRT is
explicitly signaled in the MSI address field.  Otherwise it's
considered a "compatibility" (iow: non-translated) MSI.

> e.g. Replace amd_iommu_perdev_intremap with something generic.
> 
> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
> all that has been tested.

DYK why it fails to enable 32?

> Using msi_desc->gvec should be okay since with posted interrupts - the
> gvec is expected to match.
> 
> hvm_pi_update_irte() changes the IRTE but not the MSI data in the PCI
> capability, so that isn't suitable by itself.
> ---
>  xen/arch/x86/include/asm/msi.h           |  3 ++-
>  xen/arch/x86/irq.c                       | 13 +++++++++++-
>  xen/arch/x86/msi.c                       |  1 +
>  xen/drivers/passthrough/amd/iommu_intr.c | 25 ++++++++++++++++++++++++
>  xen/drivers/passthrough/pci.c            | 24 +++++++++++++++++++++++
>  xen/drivers/passthrough/x86/hvm.c        |  3 ++-
>  xen/include/xen/irq.h                    |  2 ++
>  xen/include/xen/pci.h                    |  2 ++
>  8 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index 378b85ee94..ea1004af14 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -107,7 +107,8 @@ struct msi_desc {
>      } msi_attrib;
>  
>      bool irte_initialized;
> -    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
> +    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL or
> +                                when pci_dev gvec_as_irte_idx is true */

Missing capital 'V' after full stop.

Nit: multi-line comments should be:

/*
 * guest vector. Valid when pi_desc isn't NULL or
 * when pci_dev gvec_as_irte_idx is true
 */

I would probably move the whole comment ahead of the field
declaration:

    /*
     * Guest vector.  Valid when pi_desc isn't NULL or when pci_dev
     * gvec_as_irte_idx is true.
     */
    uint8_t gvec;

>      const struct pi_desc *pi_desc; /* pointer to posted descriptor */
>  
>      struct list_head list;
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index ff3ac832f4..3fc73feaea 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1600,7 +1600,8 @@ int pirq_shared(struct domain *d, int pirq)
>      return shared;
>  }
>  
> -int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> +int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq, int will_share,

I think you could take the opportunity to convert will_share to a
boolean.

> +                         uint8_t gvec)
>  {
>      struct irq_desc         *desc;
>      irq_guest_action_t *action, *newaction = NULL;
> @@ -1674,7 +1675,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>                                            &cpu_online_map) )
>                  affinity = desc->affinity;
>              if ( affinity )
> +            {
> +                if ( gvec && desc->msi_desc )
> +                    desc->msi_desc->gvec = gvec;

Hm, this feels a bit out of place.  Shouldn't the field better be set
by pt_irq_create_bind() when irq_type == PT_IRQ_TYPE_MSI and the
quirk is enabled for the device?

> +
>                  desc->handler->set_affinity(desc, affinity);
> +            }
>          }
>  
>          desc->status &= ~IRQ_DISABLED;
> @@ -1730,6 +1736,11 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>      return rc;
>  }
>  
> +int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> +{
> +    return pirq_guest_bind_gvec(v, pirq, will_share, 0);
> +}

Could this be a static inline in some header?

> +
>  static irq_guest_action_t *__pirq_guest_unbind(
>      struct domain *d, struct pirq *pirq, struct irq_desc *desc)
>  {
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index bf5b71822e..cef2987038 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -487,6 +487,7 @@ static struct msi_desc *alloc_msi_entry(unsigned int nr)
>          entry[nr].remap_index = -1;
>          entry[nr].pi_desc = NULL;
>          entry[nr].irte_initialized = false;
> +        entry[nr].gvec = 0;

We should rather use xzalloc_array() instead of xmalloc_array() here,
as that would avoid all this manual setting to NULL, 0 and false.

It would be good to do this as a pre-patch, so that you can avoid the
change here.

>      }
>  
>      return entry;
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
> index c0273059cb..2e228d2c21 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      if ( !msg )
>          return 0;
>  
> +    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
> +    {
> +        int new_remap_index = 0;

Newline.  You could make this unsigned also by the looks of it?

> +        if ( msi_desc->gvec )
> +        {
> +            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
> +                   msi_desc->remap_index, msi_desc->gvec);

gprintk(XENLOG_DEBUG, ...

> +            new_remap_index = msi_desc->gvec;
> +        }
> +
> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
> +             msi_desc->remap_index != -1 )
> +        {
> +            /* Clear any existing entries */
> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
> +                                               &msi_desc->remap_index,
> +                                               NULL, NULL);

Why do you need to clear any entries?  This will cause a window where
MSI entries targeting this IRTEs to generate faults because the
entries are not setup.

Just re-use them, update_intremap_entry_from_msi_msg() will update the
IRTE atomically so that there's no window where the entries would be
invalid, and thus to faults will be generated.

> +
> +            for ( i = 0; i < nr; ++i )
> +                msi_desc[i].remap_index = -1;
> +
> +            msi_desc->remap_index = new_remap_index;
> +        }
> +    }
> +
>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);

To be on the safe side, I would add a check here that ensures that
update_intremap_entry_from_msi_msg() doesn't change the IRT index
(unless it's -1).

> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index e1a09344df..7031aedb94 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -306,6 +306,17 @@ static void apply_quirks(struct pci_dev *pdev)
>          { PCI_VENDOR_ID_INTEL, 0x6fa0 },
>          { PCI_VENDOR_ID_INTEL, 0x6fc0 },
>      };
> +    static const struct {
> +        uint16_t vendor, device;
> +    } hide_irt[] = {

Nit: hide_irt is not very descriptive, I would rather use
force_gvec_as_irti or something similar.

> +#define PCI_VENDOR_ID_QCOM		0x17cb
> +#define QCA6390_DEVICE_ID		0x1101
> +#define QCN9074_DEVICE_ID		0x1104
> +#define WCN6855_DEVICE_ID		0x1103

There are some hard tabs in the defines above which should instead be
spaces.

> +        { PCI_VENDOR_ID_QCOM, QCA6390_DEVICE_ID },
> +        { PCI_VENDOR_ID_QCOM, QCN9074_DEVICE_ID },
> +        { PCI_VENDOR_ID_QCOM, WCN6855_DEVICE_ID },
> +    };
>      unsigned int i;
>  
>      for ( i = 0; i < ARRAY_SIZE(ignore_bars); i++)
> @@ -316,6 +327,19 @@ static void apply_quirks(struct pci_dev *pdev)
>               * from trying to size the BARs or add handlers to trap accesses.
>               */
>              pdev->ignore_bars = true;
> +
> +    for ( i = 0; i < ARRAY_SIZE(hide_irt); i++)
                                                 ^ missing space.
> +    {
> +        if ( vendor == hide_irt[i].vendor &&
> +             device == hide_irt[i].device )
> +        {
> +            pdev->gvec_as_irte_idx = true;
> +            printk("%pp %04x:%04x quirk gvec as intr remap index\n",
> +                   &pdev->sbdf, hide_irt[i].vendor, hide_irt[i].device);
> +            if ( !amd_iommu_perdev_intremap )
> +                printk("gvec quirk requires per-device intr remap!\n");

I think pdev->gvec_as_irte_idx should not be set if there's no perdev
IRT support.  You should also limit the quirk to AMD-Vi systems, note
that amd_iommu_perdev_intremap is defined as:

bool __ro_after_init amd_iommu_perdev_intremap = true;

And hence would unconditionally be true on Intel systems.

> +        }
> +    }
>  }
>  
>  static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
> diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
> index f5faff7a49..5d17f93b06 100644
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -307,7 +307,8 @@ int pt_irq_create_bind(
>               */
>              pirq_dpci->dom = d;
>              /* bind after hvm_irq_dpci is setup to avoid race with irq handler*/
> -            rc = pirq_guest_bind(d->vcpu[0], info, 0);
> +            rc = pirq_guest_bind_gvec(d->vcpu[0], info, 0,
> +                                      pirq_dpci->gmsi.gvec);
>              if ( rc == 0 && pt_irq_bind->u.msi.gtable )
>              {
>                  rc = msixtbl_pt_register(d, info, pt_irq_bind->u.msi.gtable);
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index 95034c0d6b..96109d6ebe 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -192,6 +192,8 @@ extern void pirq_guest_eoi(struct pirq *pirq);
>  extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
>  extern int pirq_guest_unmask(struct domain *d);
>  extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
> +extern int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq,
> +                                int will_share, uint8_t gvec);

Hm, it seems like a layering violation to put a x86 specific function
in a common header.

Did you consider hiding the need to use the guest vector as the IRT
index in struct arch_pirq?

>  extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
>  extern void pirq_set_affinity(struct domain *d, int pirq,
>                                const cpumask_t *mask);
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 4f12bcf089..14afd78f75 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -127,6 +127,8 @@ struct pci_dev {
>      /* Device with errata, ignore the BARs. */
>      bool ignore_bars;
>  
> +    bool gvec_as_irte_idx;

A small comment might be helpful here:

/* Quirk: force the use of the MSI vector as the IRT index. */

Overall I'm a little at unease for allowing domains to control the IRT
index address space.  I haven't looked closely enough to see if a
guest could cause some kind of clashes or the triggering of internal
Xen state checks by for example forcing multiple MSI entries to use
the same vector.

Thanks, Roger.

