Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7E9B395A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 19:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826950.1241421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UgZ-0003Es-Ri; Mon, 28 Oct 2024 18:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826950.1241421; Mon, 28 Oct 2024 18:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5UgZ-0003Ck-Oc; Mon, 28 Oct 2024 18:41:51 +0000
Received: by outflank-mailman (input) for mailman id 826950;
 Mon, 28 Oct 2024 18:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owpo=RY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5UgY-0003Ce-7O
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 18:41:50 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4879dec7-955c-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 19:41:45 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso676631466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 11:41:45 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b31bc028asm408302466b.177.2024.10.28.11.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 11:41:44 -0700 (PDT)
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
X-Inumbo-ID: 4879dec7-955c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730140905; x=1730745705; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dx9SZqPUtuDTzY1aacDgsRPoBoWYsbSOXshuWjejwh4=;
        b=MJvQjUpNbkGXKBr8gz4HU9o6EdB3VwDZgnLMlZpDX3q3g5A05v5m0UvG86Oz/Zg0Yf
         x16xJBpXbY+HukpaT64CyErgVAetlyZheyC1Ri79icuPotRxBB/dndYumENiT9Oj1MWB
         XkYhS7A0A2oDmQH6aEPNAibph648u2wVSxjfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140905; x=1730745705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx9SZqPUtuDTzY1aacDgsRPoBoWYsbSOXshuWjejwh4=;
        b=HYJNuRdCkcbNgh8ktxGZNsADcJYfCSBDIkosGc1OcK4JROsjnKTJacD01RGHIcP751
         KSyKEeZ9rluJ2XViiC3bfq6S08en37P/fr2Lqq9lGK1K8HhZ4B37wkXiST38Sx8y4DXO
         zSeOWAxPYUvyEcdk9NMW80LlQvBZ+8neb8v1vCn3BtvD2W0M3jIhgVS7W8VpVU1tkSVt
         ISpUc1btvuQBDtgcbxAKvz3Kq+U/+OB6QEq5nNKhJJm/9+QwCs6QqalAIUszb0TdxL77
         L/zcZRxXUv8vyK4tdZkv+mVooShPJZBLXhWFkjXE873sAq0Zjl6BFWYkfzKzoQk9NjBq
         WMOQ==
X-Gm-Message-State: AOJu0YzLcbNyeD1FIr3MBq1dEMV8dTs8trqmZj3ukPQQF3+cRpk9gzDK
	p/WoJkWxJA2TRUcAkOOpkc6oyfAW4D+U3RKZmanIYxEP/7Y3/XS8IVCNNDiSiLNphHv8VZwZi3+
	1
X-Google-Smtp-Source: AGHT+IEsgeQC4enBRTiOxHgSnswbQxYP1OdE5ie0NkN9N5KGXfQud/sq/xsF/01HL6UDqFcUUaE9Ew==
X-Received: by 2002:a17:907:ea0:b0:a99:f9d6:5590 with SMTP id a640c23a62f3a-a9de6331185mr802714066b.60.1730140905098;
        Mon, 28 Oct 2024 11:41:45 -0700 (PDT)
Date: Mon, 28 Oct 2024 19:41:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 2/3] xen/pci: introduce PF<->VF links
Message-ID: <Zx_a57npsdRhLgYr@macbook>
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018203913.1162962-3-stewart.hildebrand@amd.com>

On Fri, Oct 18, 2024 at 04:39:09PM -0400, Stewart Hildebrand wrote:
> Add links between a VF's struct pci_dev and its associated PF struct
> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> dropping and re-acquiring the pcidevs_lock().
> 
> During PF removal, unlink VF from PF and mark the VF broken. As before,
> VFs may exist without a corresponding PF, although now only with
> pdev->broken = true.
> 
> The hardware domain is expected to remove the associated VFs before
> removing the PF. Print a warning in case a PF is removed with associated
> VFs still present.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Candidate for backport to 4.19 (the next patch depends on this one)
> 
> v5->v6:
> * move printk() before ASSERT_UNREACHABLE()
> * warn about PF removal with VFs still present
> * clarify commit message
> 
> v4->v5:
> * new patch, split from ("x86/msi: fix locking for SR-IOV devices")
> * move INIT_LIST_HEAD(&pdev->vf_list); earlier
> * collapse struct list_head instances
> * retain error code from pci_add_device()
> * unlink (and mark broken) VFs instead of removing them
> * const-ify VF->PF link
> ---
>  xen/drivers/passthrough/pci.c | 76 ++++++++++++++++++++++++++++-------
>  xen/include/xen/pci.h         | 10 +++++
>  2 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 74d3895e1ef6..fe31255b1207 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -333,6 +333,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
>  
> +    INIT_LIST_HEAD(&pdev->vf_list);
> +
>      arch_pci_init_pdev(pdev);
>  
>      rc = pdev_msi_init(pdev);
> @@ -449,6 +451,10 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>  
>      list_del(&pdev->alldevs_list);
>      pdev_msi_deinit(pdev);
> +
> +    if ( pdev->info.is_virtfn && pdev->virtfn.pf_pdev )

Shouldn't having pdev->info.is_virtfn set already ensure that
pdev->virtfn.pf_pdev != NULL?

> +        list_del(&pdev->vf_list);
> +
>      xfree(pdev);
>  }
>  
> @@ -656,24 +662,11 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
>      const char *type;
>      int ret;
> -    bool pf_is_extfn = false;
>  
>      if ( !info )
>          type = "device";
>      else if ( info->is_virtfn )
> -    {
> -        pcidevs_lock();
> -        pdev = pci_get_pdev(NULL,
> -                            PCI_SBDF(seg, info->physfn.bus,
> -                                     info->physfn.devfn));
> -        if ( pdev )
> -            pf_is_extfn = pdev->info.is_extfn;
> -        pcidevs_unlock();
> -        if ( !pdev )
> -            pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> -                           NULL, node);
>          type = "virtual function";
> -    }
>      else if ( info->is_extfn )
>          type = "extended function";
>      else
> @@ -703,7 +696,44 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * extended function.
>           */
>          if ( pdev->info.is_virtfn )
> -            pdev->info.is_extfn = pf_is_extfn;
> +        {
> +            struct pci_dev *pf_pdev;

This could be const?

> +
> +            pf_pdev = pci_get_pdev(NULL,
> +                                   PCI_SBDF(seg, info->physfn.bus,
> +                                            info->physfn.devfn));

You can probably initialize at declaration?

> +
> +            if ( !pf_pdev )

Is this even feasible during correct operation?  IOW: shouldn't the PF
always be added first, so that SR-IOV can be enabled and the VFs added
afterwards?

I see previous code also catered for VFs being added without the PF
being present, so I assume there was some need for this.

> +            {
> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> +                                     NULL, node);
> +                if ( ret )
> +                {
> +                    printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",

Could you split this to make the line a bit shorter?

                       printk(XENLOG_WARNING
		              "Failed to add SR-IOV device PF %pp for VF %pp\n",

Same below.

> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);
> +                    free_pdev(pseg, pdev);
> +                    goto out;
> +                }
> +                pf_pdev = pci_get_pdev(NULL,
> +                                       PCI_SBDF(seg, info->physfn.bus,
> +                                                info->physfn.devfn));
> +                if ( !pf_pdev )
> +                {
> +                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);

If you want to add an error message here, I think it should mention
the fact this state is not expected:

"Inconsistent PCI state: failed to find newly added PF %pp for VF %pp\n"

> +                    ASSERT_UNREACHABLE();
> +                    free_pdev(pseg, pdev);
> +                    ret = -EILSEQ;
> +                    goto out;
> +                }
> +            }
> +
> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;
> +            pdev->virtfn.pf_pdev = pf_pdev;
> +            list_add(&pdev->vf_list, &pf_pdev->vf_list);
> +        }
>      }
>  
>      if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
> @@ -821,6 +851,24 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            if ( !pdev->info.is_virtfn )

Given we have no field to mark a device as a PF, we could check that
pdev->vf_list is not empty, and by doing so the warn_stale_vfs
variable could be dropped?

if ( !pdev->info.is_virtfn && !list_empty(&pdev->vf_list) )
{
    struct pci_dev *vf_pdev;

    while ( (vf_pdev = list_first_entry_or_null(&pdev->vf_list,
                                                struct pci_dev,
						vf_list)) != NULL )
    {
        list_del(&vf_pdev->vf_list);
        vf_pdev->virtfn.pf_pdev = NULL;
        vf_pdev->broken = true;
    }

    printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
           &pdev->sbdf);
}

> +            {
> +                struct pci_dev *vf_pdev, *tmp;
> +                bool warn_stale_vfs = false;
> +
> +                list_for_each_entry_safe(vf_pdev, tmp, &pdev->vf_list, vf_list)
> +                {
> +                    list_del(&vf_pdev->vf_list);
> +                    vf_pdev->virtfn.pf_pdev = NULL;
> +                    vf_pdev->broken = true;
> +                    warn_stale_vfs = true;
> +                }
> +
> +                if ( warn_stale_vfs )
> +                    printk(XENLOG_WARNING "PCI SR-IOV PF %pp removed with VFs still present\n",
> +                           &pdev->sbdf);
> +            }
> +
>              if ( pdev->domain )
>              {
>                  write_lock(&pdev->domain->pci_lock);
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index ef56e80651d6..2ea168d5f914 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -153,7 +153,17 @@ struct pci_dev {
>          unsigned int count;
>  #define PT_FAULT_THRESHOLD 10
>      } fault;
> +
> +    /*
> +     * List head if info.is_virtfn == false
> +     * List entry if info.is_virtfn == true
> +     */
> +    struct list_head vf_list;
>      u64 vf_rlen[6];
> +    struct {
> +        /* Only populated for VFs (info.is_virtfn == true) */

All comments here (specially the first ones) would better use PF and
VF consistently, rather than referring to other fields in the struct.
Specially because the fields can change names and the comments would
then become stale.

> +        const struct pci_dev *pf_pdev;        /* Link from VF to PF */
> +    } virtfn;

I'm unsure you need an outer virtfn struct, as it's only one field in
this patch?  Maybe more fields gets added by further patches?

Thanks, Roger.

