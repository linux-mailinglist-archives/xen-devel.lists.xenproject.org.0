Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4684C4D0B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 18:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279556.477294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNeq9-0000ro-1p; Fri, 25 Feb 2022 17:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279556.477294; Fri, 25 Feb 2022 17:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNeq8-0000py-Ux; Fri, 25 Feb 2022 17:57:12 +0000
Received: by outflank-mailman (input) for mailman id 279556;
 Fri, 25 Feb 2022 17:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXke=TI=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1nNeq6-0000ps-LH
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 17:57:11 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 595b51d5-9664-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 18:57:08 +0100 (CET)
Received: by mail-qt1-x82c.google.com with SMTP id e2so3140832qte.12
 for <xen-devel@lists.xenproject.org>; Fri, 25 Feb 2022 09:57:08 -0800 (PST)
Received: from development (c-73-166-253-254.hsd1.tx.comcast.net.
 [73.166.253.254]) by smtp.gmail.com with ESMTPSA id
 s18-20020a05622a179200b002de9529450csm1864947qtk.85.2022.02.25.09.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:57:07 -0800 (PST)
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
X-Inumbo-ID: 595b51d5-9664-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aye+ci87ryBSKRStBASOk0eHohf3P3XgeSTb7JDgzyo=;
        b=bdSH/6ThxZbAO/X+OeR0LhEqy8vdmkCDpUPnjo4syIqL05UZBBG8ygUXIWAIwwo57U
         ReFMbH/Eb2AyNBzofml8Mj2vt7owXZywFBSdLr+jpwk4swajpzWeOyHSJIArwYly1eEZ
         2wyF8ZSFiH2kpcsk2eHaC3e/pyOirtNas+G4bACRrzlkcuAkKXRuIuPANlfXhclSZUH8
         +qc9x5MTXrGIWCtlzvMfD1c9p75bnSJzNverdrxomS8sv9zJjlvPXeSWSoxzVn/xkCsx
         r0Eo3uZ4ZNor9LzqNtLaaQqbZY7AndqJTzoWnSw6vzTl9odER9cThSx8HQL6bpfl+iGN
         FyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aye+ci87ryBSKRStBASOk0eHohf3P3XgeSTb7JDgzyo=;
        b=HT98R34jCBmMNAoVCSGlhnsiRw4HbHTU0ef2q5FRiS06WJnw0irNecUFgjt1RMkvQt
         TP3xG9cKIGM3yt7WmfOaY1Nxn/ioUDJHZvMY84K70mltka7s40336SmwJJrX6iAcoZRt
         +LuETm1NAb+yDLxt8Oy29LvxKC/S3OTxbvgqxxtaA5oX+1ETnuzfdLb6SenKeTgopLpK
         VlUfi5loJ57qUf8+l5+12ndV+7ZyvI6eWJGaIFhPT+HvTaHYzoVltB2RnlKtYpgGRRlc
         XocBM9wAsbnvA+9+o07LHjInNda4iCMwqgFIeoWzz/B+WclY5H5dQqLPVkWVkIdYud6P
         m15Q==
X-Gm-Message-State: AOAM532RiUcYLxQmSXldg0KULgPns3t36+UhDFK0Ed2v3mjan4Nz/nSR
	HOmEk91xVACm4LdcUVWyJSpUpt1iBlbgow==
X-Google-Smtp-Source: ABdhPJzKxuBSHfok7FLyjGUo2vbV5ivLu+N/HZsWCH6HdlP8u1fIKkHcNdrO6xLtHV4YsIYkF7JNkQ==
X-Received: by 2002:a05:622a:90:b0:2de:57e3:c77a with SMTP id o16-20020a05622a009000b002de57e3c77amr7961741qtw.488.1645811827689;
        Fri, 25 Feb 2022 09:57:07 -0800 (PST)
Message-ID: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] vpci/msix: fix PBA accesses
From: Alex Olson <this.is.a0lson@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Date: Fri, 25 Feb 2022 11:57:05 -0600
In-Reply-To: <20220225153956.1078-3-roger.pau@citrix.com>
References: <20220225153956.1078-1-roger.pau@citrix.com>
	 <20220225153956.1078-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I think there is an issue in the spin_lock handling of patch 2 for the
"msix_write" function as it results in the lock being taken a second time while
held (hangs). 

The lock taken before checking "VMSIX_ADDR_IN_RANGE" isn't unlocked for the non-
PBA case and a second lock is attempted just before the call to get_entry()
later in the same function.  It looks like either the added lock should either
be moved inside the PBA case or the lock before get_entry() should be removed.


On my server, upon loading the ioatdma driver, it now successfully attempts an
PBA write (which now doesn't crash the system), but I'm not sure I have a way to
fully exercise it...

I also see a different (related) issue in which modify_bars is called on a
virtual function seemingly before the BAR addresses are initialized/known and
will start a different thread for that topic.

Regards,

-Alex


On Fri, 2022-02-25 at 16:39 +0100, Roger Pau Monne wrote:
> Map the PBA in order to access it from the MSI-X read and write
> handlers. Note that previously the handlers would pass the physical
> host address into the {read,write}{l,q} handlers, which is wrong as
> those expect a linear address.
> 
> Map the PBA using ioremap when the first access is performed. Note
> that 32bit arches might want to abstract the call to ioremap into a
> vPCI arch handler, so they can use a fixmap range to map the PBA.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Alex Olson <this.is.a0lson@gmail.com>
> ---
> Changes since v1:
>  - Also handle writes.
> 
> I don't seem to have a box with a driver that will try to access the
> PBA, so I would consider this specific code path only build tested. At
> least it doesn't seem to regress the current state of vPCI.
> ---
>  xen/drivers/vpci/msix.c | 55 +++++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/vpci.c |  2 ++
>  xen/include/xen/vpci.h  |  2 ++
>  3 files changed, 54 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index a1fa7a5f13..9fbc111ecc 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -198,8 +198,13 @@ static int cf_check msix_read(
>      if ( !access_allowed(msix->pdev, addr, len) )
>          return X86EMUL_OKAY;
>  
> +    spin_lock(&msix->pdev->vpci->lock);
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> +        struct vpci *vpci = msix->pdev->vpci;
> +        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> +        unsigned int idx = addr - base;
> +
>          /*
>           * Access to PBA.
>           *
> @@ -207,25 +212,43 @@ static int cf_check msix_read(
>           * guest address space. If this changes the address will need to be
>           * translated.
>           */
> +
> +        if ( !msix->pba )
> +        {
> +            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
> +            if ( !msix->pba )
> +            {
> +                /*
> +                 * If unable to map the PBA return all 1s (all pending): it's
> +                 * likely better to trigger spurious events than drop them.
> +                 */
> +                spin_unlock(&vpci->lock);
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: unable to map MSI-X PBA, report all pending\n",
> +                        msix->pdev);
> +                return X86EMUL_OKAY;
> +           }
> +        }
> +
>          switch ( len )
>          {
>          case 4:
> -            *data = readl(addr);
> +            *data = readl(msix->pba + idx);
>              break;
>  
>          case 8:
> -            *data = readq(addr);
> +            *data = readq(msix->pba + idx);
>              break;
>  
>          default:
>              ASSERT_UNREACHABLE();
>              break;
>          }
> +        spin_unlock(&vpci->lock);
>  
>          return X86EMUL_OKAY;
>      }
>  
> -    spin_lock(&msix->pdev->vpci->lock);
>      entry = get_entry(msix, addr);
>      offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
>  
> @@ -273,27 +296,49 @@ static int cf_check msix_write(
>      if ( !access_allowed(msix->pdev, addr, len) )
>          return X86EMUL_OKAY;
>  
> +    spin_lock(&msix->pdev->vpci->lock);
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> +        struct vpci *vpci = msix->pdev->vpci;
> +        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> +        unsigned int idx = addr - base;
>  
>          if ( !is_hardware_domain(d) )
> +        {
>              /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
> +            spin_unlock(&vpci->lock);
>              return X86EMUL_OKAY;
> +        }
> +
> +        if ( !msix->pba )
> +        {
> +            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
> +            if ( !msix->pba )
> +            {
> +                /* Unable to map the PBA, ignore write. */
> +                spin_unlock(&vpci->lock);
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: unable to map MSI-X PBA, write ignored\n",
> +                        msix->pdev);
> +                return X86EMUL_OKAY;
> +           }
> +        }
>  
>          switch ( len )
>          {
>          case 4:
> -            writel(data, addr);
> +            writel(data, msix->pba + idx);
>              break;
>  
>          case 8:
> -            writeq(data, addr);
> +            writeq(data, msix->pba + idx);
>              break;
>  
>          default:
>              ASSERT_UNREACHABLE();
>              break;
>          }
> +        spin_unlock(&vpci->lock);
>  
>          return X86EMUL_OKAY;
>      }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index f3b32d66cb..9fb3c05b2b 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> +    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
> +        iounmap(pdev->vpci->msix->pba);
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index bcad1516ae..c399b101ee 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -127,6 +127,8 @@ struct vpci {
>          bool enabled         : 1;
>          /* Masked? */
>          bool masked          : 1;
> +        /* PBA map */
> +        void *pba;
>          /* Entries. */
>          struct vpci_msix_entry {
>              uint64_t addr;


