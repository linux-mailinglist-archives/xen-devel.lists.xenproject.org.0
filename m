Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5597FD8EE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 15:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643926.1004512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8LBi-00042u-Ea; Wed, 29 Nov 2023 14:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643926.1004512; Wed, 29 Nov 2023 14:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8LBi-00041B-AO; Wed, 29 Nov 2023 14:05:14 +0000
Received: by outflank-mailman (input) for mailman id 643926;
 Wed, 29 Nov 2023 14:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdkt=HK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8LBg-000415-Tk
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 14:05:12 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f172c8a-8ec0-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 15:05:10 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9c30c7eafso4271571fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 06:05:10 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600001c600b00332ff21038fsm9505546wrx.106.2023.11.29.06.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:05:09 -0800 (PST)
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
X-Inumbo-ID: 4f172c8a-8ec0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701266710; x=1701871510; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AD67BY4tJsvOLcX8AuCp6fBVFOrKOImlKDzoMs0C+1g=;
        b=Z0oqyG7pZvDmc16B8XiL20+ejskqfWm0q0Mog6/uwc+VvqvhnitqX/aAj+NeLfiFR9
         59NKvkE6ItEzW9rXpAaSvvAkTMfLD2s4f5GEmtmYPLr0301TY5W39OadwsI6agkZIJVf
         yW5Y9wb6fmuzutMiqK4i3S7i6NzxVLXk/d3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701266710; x=1701871510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AD67BY4tJsvOLcX8AuCp6fBVFOrKOImlKDzoMs0C+1g=;
        b=B+d3J1Pg8738q2CHF9t2AuLxbrAMWpJve6M0ixM8i6ERqq6GLEDQYzT8WdQbCEvREo
         lrPYoKRSGMS37ZJEO5zb+AWmbd8QxCoVGOzu32xRGVcjZnPWs2aJ2ipC71i3e0Fiw20M
         bLCMAlkhmGxVhHC+7H/JLOP62Wmt1Oqkt0CzeF1utogIVmqoX2kiVNIq7dlMY6apfjVX
         X+bfrUUvMBevjpcAobcucuyjBee+OSKXYZSgIZW2D4u4H1wc7EM6dcXNjaSf8dB0LsQx
         Vp/o4gXeceEo+OfySlKH6n2p7HPjTr4NIvO9J7Os25DJCTm7G37kxbZRCg4hu7BNVgk+
         MROA==
X-Gm-Message-State: AOJu0YxWQHjZ+U7Er3KxY8VCJdZ2zqmgOMdRnQhPLDqoQaih1346CJzT
	hGkN2hdtXZlyNVs/edRZuw94Eg==
X-Google-Smtp-Source: AGHT+IG9LkSDIm9/Z7mjsSHlO4Rnr/A/EVV6bOfNmwDoXIS4LGi4HGxbMCYbkqleqyOo5HlaEo/yCg==
X-Received: by 2002:a2e:9987:0:b0:2c9:b84a:147d with SMTP id w7-20020a2e9987000000b002c9b84a147dmr3390039lji.19.1701266710133;
        Wed, 29 Nov 2023 06:05:10 -0800 (PST)
Date: Wed, 29 Nov 2023 15:05:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v8 2/2] xen/vpci: header: filter PCI capabilities
Message-ID: <ZWdFFa1J6l73kvxb@macbook>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128194427.2513249-3-stewart.hildebrand@amd.com>

On Tue, Nov 28, 2023 at 02:44:25PM -0500, Stewart Hildebrand wrote:
> Currently, Xen vPCI only supports virtualizing the MSI and MSI-X capabilities.
> Hide all other PCI capabilities (including extended capabilities) from domUs for
> now, even though there may be certain devices/drivers that depend on being able
> to discover certain capabilities.
> 
> We parse the physical PCI capabilities linked list and add vPCI register
> handlers for the next elements, inserting our own next value, thus presenting a
> modified linked list to the domU.
> 
> Introduce helper functions vpci_hw_read8 and vpci_read_val. The vpci_read_val
> helper function returns a fixed value, which may be used for RAZ registers, or
                                                               ^ read as zero
> registers whose value doesn't change.
> 
> Introduce pci_find_next_cap_ttl() helper while adapting the logic from
> pci_find_next_cap() to suit our needs, and implement the existing
> pci_find_next_cap() in terms of the new helper.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

LGTM, some nits below:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v7->v8:
> * use to array instead of match function
> * include lib.h for ARRAY_SIZE
> * don't emulate PCI_CAPABILITY_LIST register if PCI_STATUS_CAP_LIST bit is not
>   set in hardware
> * spell out RAZ/WI acronym
> * dropped R-b tag since the patch has changed moderately since the last rev
> 
> v6->v7:
> * no change
> 
> v5->v6:
> * add register handlers before status register handler in init_bars()
> * s/header->mask_cap_list/mask_cap_list/
> 
> v4->v5:
> * use more appropriate types, continued
> * get rid of unnecessary hook function
> * add Jan's R-b
> 
> v3->v4:
> * move mask_cap_list setting to this patch
> * leave pci_find_next_cap signature alone
> * use more appropriate types
> 
> v2->v3:
> * get rid of > 0 in loop condition
> * implement pci_find_next_cap in terms of new pci_find_next_cap_ttl function so
>   that hypothetical future callers wouldn't be required to pass &ttl.
> * change NULL to (void *)0 for RAZ value passed to vpci_read_val
> * change type of ttl to unsigned int
> * remember to mask off the low 2 bits of next in the initial loop iteration
> * change return type of pci_find_next_cap and pci_find_next_cap_ttl
> * avoid wrapping the PCI_STATUS_CAP_LIST condition by using ! instead of == 0
> 
> v1->v2:
> * change type of ttl to int
> * use switch statement instead of if/else
> * adapt existing pci_find_next_cap helper instead of rolling our own
> * pass ttl as in/out
> * "pass through" the lower 2 bits of the next pointer
> * squash helper functions into this patch to avoid transient dead code situation
> * extended capabilities RAZ/WI
> ---
>  xen/drivers/pci/pci.c     | 31 ++++++++++++-------
>  xen/drivers/vpci/header.c | 63 +++++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c   | 12 ++++++++
>  xen/include/xen/pci.h     |  3 ++
>  xen/include/xen/vpci.h    |  5 ++++
>  5 files changed, 104 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
> index 3569ccb24e9e..1645b3118220 100644
> --- a/xen/drivers/pci/pci.c
> +++ b/xen/drivers/pci/pci.c
> @@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
>      return 0;
>  }
>  
> -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> -                               unsigned int cap)
> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> +                                   unsigned int *cap, unsigned int n,
> +                                   unsigned int *ttl)
>  {
> -    u8 id;
> -    int ttl = 48;
> +    unsigned int id, i;

Nit: those can be defined inside the while loop.

> -    while ( ttl-- )
> +    while ( (*ttl)-- )
>      {
>          pos = pci_conf_read8(sbdf, pos);
>          if ( pos < 0x40 )
>              break;
>  
> -        pos &= ~3;
> -        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
> +        id = pci_conf_read8(sbdf, (pos & ~3) + PCI_CAP_LIST_ID);
>  
>          if ( id == 0xff )
>              break;
> -        if ( id == cap )
> -            return pos;
> +        for ( i = 0; i < n; i++ )
> +        {
> +            if ( id == cap[i] )
> +                return pos;
> +        }
>  
> -        pos += PCI_CAP_LIST_NEXT;
> +        pos = (pos & ~3) + PCI_CAP_LIST_NEXT;
>      }
> +
>      return 0;
>  }
>  
> +unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> +                               unsigned int cap)
> +{
> +    unsigned int ttl = 48;
> +
> +    return pci_find_next_cap_ttl(sbdf, pos, &cap, 1, &ttl) & ~3;
> +}
> +
>  /**
>   * pci_find_ext_capability - Find an extended capability
>   * @sbdf: PCI device to query
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 351318121e48..d7dc0c82a6ba 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -18,6 +18,7 @@
>   */
>  
>  #include <xen/iocap.h>
> +#include <xen/lib.h>
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/vpci.h>
> @@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)

Could you please rename to init_header now that we do much more than
dealing with the BARs?

>      if ( rc )
>          return rc;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> +        {
> +            /* Only expose capabilities to the guest that vPCI can handle. */
> +            unsigned int next, ttl = 48;
> +            unsigned int supported_caps[] = {

const?

We likely need to find a way to do this programmatically, so that when
a new capability is supported we don't need to go and modify the list
here every time.  We can sort that out at a later point however.

> +                PCI_CAP_ID_MSI,
> +                PCI_CAP_ID_MSIX,
> +            };
> +
> +            next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
> +                                         supported_caps,
> +                                         ARRAY_SIZE(supported_caps), &ttl);
> +
> +            rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                   PCI_CAPABILITY_LIST, 1,
> +                                   (void *)(uintptr_t)next);
> +            if ( rc )
> +                return rc;
> +
> +            next &= ~3;
> +
> +            if ( !next )
> +                /*
> +                 * If we don't have any supported capabilities to expose to the
> +                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
> +                 * register.
> +                 */
> +                mask_cap_list = true;
> +
> +            while ( next && ttl )
> +            {
> +                unsigned int pos = next;
> +
> +                next = pci_find_next_cap_ttl(pdev->sbdf,
> +                                             pos + PCI_CAP_LIST_NEXT,
> +                                             supported_caps,
> +                                             ARRAY_SIZE(supported_caps), &ttl);
> +
> +                rc = vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
> +                                       pos + PCI_CAP_LIST_ID, 1, NULL);
> +                if ( rc )
> +                    return rc;
> +
> +                rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> +                                       pos + PCI_CAP_LIST_NEXT, 1,
> +                                       (void *)(uintptr_t)next);
> +                if ( rc )
> +                    return rc;
> +
> +                next &= ~3;
> +            }
> +        }
> +
> +        /* Extended capabilities read as zero, write ignore */
> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, NULL, 0x100, 4,
> +                               (void *)0);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
>      rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
>                                  PCI_STATUS, 2, NULL,
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 96187b70141b..99307e310bbb 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -137,6 +137,18 @@ static void cf_check vpci_ignored_write(
>  {
>  }
>  
> +uint32_t cf_check vpci_read_val(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    return (uintptr_t)data;
> +}
> +
> +uint32_t cf_check vpci_hw_read8(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    return pci_conf_read8(pdev->sbdf, reg);
> +}
> +
>  uint32_t cf_check vpci_hw_read16(
>      const struct pci_dev *pdev, unsigned int reg, void *data)
>  {
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 50d7dfb2a2fd..b2dcef01a1cf 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -205,6 +205,9 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
>  int pci_mmcfg_write(unsigned int seg, unsigned int bus,
>                      unsigned int devfn, int reg, int len, u32 value);
>  unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
> +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> +                                   unsigned int *cap, unsigned int n,
> +                                   unsigned int *ttl);
>  unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
>                                 unsigned int cap);
>  unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 8e8e42372ec1..3c14a74d6255 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -52,7 +52,12 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size);
>  void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data);
>  
> +uint32_t cf_check vpci_read_val(
> +    const struct pci_dev *pdev, unsigned int reg, void *data);

A small comment could be helpful: helper to return the value passed in the data
parameter.

Thanks, Roger.

