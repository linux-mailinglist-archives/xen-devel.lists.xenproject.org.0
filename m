Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9787F19EF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 18:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637133.992882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r585y-0003Wf-Qy; Mon, 20 Nov 2023 17:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637133.992882; Mon, 20 Nov 2023 17:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r585y-0003SJ-OD; Mon, 20 Nov 2023 17:30:02 +0000
Received: by outflank-mailman (input) for mailman id 637133;
 Mon, 20 Nov 2023 17:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r585x-0003Ge-IU
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 17:30:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d80106e-87ca-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 18:29:58 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-409299277bbso16160815e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 09:29:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e7-20020a05600c218700b003fee6e170f9sm13988231wme.45.2023.11.20.09.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 09:29:57 -0800 (PST)
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
X-Inumbo-ID: 6d80106e-87ca-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700501398; x=1701106198; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6Gu0inCW6HbJNL3PVyQEnYaXlfihqVMN2PdK1CM+9Q=;
        b=qRRzL8Dik5CxTglsspJM4xrZ8kiks6o+UbK0dEFAf+xEpq0F1NOjfFXG2sHDjejFMH
         SdiQKWxfw1GjSRXrApYDRBguoXmAzFP4N3AQ8qFmwlDliKAP4ePqdU9S9IqYttcfUEcR
         7FN2Do8RO5tiP4osbHsbA1H7ptSo8/VJQ/ZxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501398; x=1701106198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Gu0inCW6HbJNL3PVyQEnYaXlfihqVMN2PdK1CM+9Q=;
        b=a3JmK/S/Dx3j1N5ipe1Usw5nCR08R0ewudK7X+iqoa8eYDmk1LgTE32kXp3Nhv5hXY
         8CCnqfDSwHZDHQ1rYZdqu5eq2OoMAlgly50AlYYfb6Wn3FgSEnBo0zgVp4VbLOli7EYj
         JXXIaEfHp8JUOaq/27QDkhtStf4qYS+xOohSDSOCa7Ds0lK5hp9rPqoAHblSu7E7qr8n
         /EbnsC2kAsRDsaV5si2Sa9O9KVKb93gBnX3j/z7WfcI+aHDvgRME3mI6FLn2rGR62gJL
         HlVOL7VF0/xTasrbRQdFtc3vEdSXIX7Gwlh/N+O4brLsm+KqdwTmm9nNqNqpzJMhKL3v
         /HGQ==
X-Gm-Message-State: AOJu0YxCV/IF6Xwx3dntHborRaUusaS/lzs+6K42RVKqplI/nIzLFWD/
	I8Y+0gyElrH3R+JN3vtfwTo80g==
X-Google-Smtp-Source: AGHT+IE4CHL1MDHAW7i5sP88TgLnhWccQe7lwnRQeOq89Z3/F7skXOmNpmLI33kGrshVQwj68BZb4g==
X-Received: by 2002:a05:600c:548c:b0:408:403a:34dc with SMTP id iv12-20020a05600c548c00b00408403a34dcmr6143215wmb.37.1700501397965;
        Mon, 20 Nov 2023 09:29:57 -0800 (PST)
Date: Mon, 20 Nov 2023 18:29:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 10/17] vpci/header: handle p2m range sets per BAR
Message-ID: <ZVuXlLdot9-9fk4I@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-11-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012220854.2736994-11-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:17PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.
> As the range sets are now created when a PCI device is added and destroyed
> when it is removed so make them named and accounted.
> 
> Note that rangesets were chosen here despite there being only up to
> 3 separate ranges in each set (typically just 1). But rangeset per BAR
> was chosen for the ease of implementation and existing code re-usability.
> 
> This is in preparation of making non-identity mappings in p2m for the MMIOs.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I have some minor comments below, but overall looks good, with the
comments below addresses:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think it's worth mentioning in the commit message that the error
handling of vpci_process_pending() is slightly modified, and that vPCI
handlers are no longer removed if the creation of the mappings in
vpci_process_pending() fails, as that's unlikely to lead to a
functional device in any case.

> 
> ---
> In v10:
> - Added additional checks to vpci_process_pending()
> - vpci_process_pending() now clears rangeset in case of failure
> - Fixed locks in vpci_process_pending()
> - Fixed coding style issues
> - Fixed error handling in init_bars
> In v9:
> - removed d->vpci.map_pending in favor of checking v->vpci.pdev !=
> NULL
> - printk -> gprintk
> - renamed bar variable to fix shadowing
> - fixed bug with iterating on remote device's BARs
> - relaxed lock in vpci_process_pending
> - removed stale comment
> Since v6:
> - update according to the new locking scheme
> - remove odd fail label in modify_bars
> Since v5:
> - fix comments
> - move rangeset allocation to init_bars and only allocate
>   for MAPPABLE BARs
> - check for overlap with the already setup BAR ranges
> Since v4:
> - use named range sets for BARs (Jan)
> - changes required by the new locking scheme
> - updated commit message (Jan)
> Since v3:
> - re-work vpci_cancel_pending accordingly to the per-BAR handling
> - s/num_mem_ranges/map_pending and s/uint8_t/bool
> - ASSERT(bar->mem) in modify_bars
> - create and destroy the rangesets on add/remove
> ---
>  xen/drivers/vpci/header.c | 256 ++++++++++++++++++++++++++------------
>  xen/drivers/vpci/vpci.c   |   6 +
>  xen/include/xen/vpci.h    |   2 +-
>  3 files changed, 184 insertions(+), 80 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 40d1a07ada..5c056923ad 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -161,63 +161,106 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    struct pci_dev *pdev = v->vpci.pdev;
> +    struct map_data data = {
> +        .d = v->domain,
> +        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +    };
> +    struct vpci_header *header = NULL;
> +    unsigned int i;
> +
> +    if ( !pdev )
> +        return false;
> +
> +    read_lock(&v->domain->pci_lock);
> +
> +    if ( !pdev->vpci || (v->domain != pdev->domain) )
>      {
> -        struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -        };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> +        read_unlock(&v->domain->pci_lock);

I think you want to clear v->vpci.pdev here in order to avoid having
to take the lock again and exit early from vpci_process_pending() if
possible.

> +        return false;
> +    }
> +
> +    header = &pdev->vpci->header;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +        int rc;
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
> +        {
> +            read_unlock(&v->domain->pci_lock);
>              return true;
> +        }
>  
> -        write_lock(&v->domain->pci_lock);
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> -
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
>          if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> -            vpci_deassign_device(v->vpci.pdev);
> -        write_unlock(&v->domain->pci_lock);
> +        {
> +            spin_lock(&pdev->vpci->lock);
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> +                            false);
> +            spin_unlock(&pdev->vpci->lock);
> +
> +            /* Clean all the rangesets */
> +            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +                if ( !rangeset_is_empty(header->bars[i].mem) )
> +                     rangeset_empty(header->bars[i].mem);
> +
> +            v->vpci.pdev = NULL;
> +
> +            read_unlock(&v->domain->pci_lock);
> +
> +            if ( !is_hardware_domain(v->domain) )
> +                domain_crash(v->domain);
> +
> +            return false;
> +        }
>      }
> +    v->vpci.pdev = NULL;
> +
> +    spin_lock(&pdev->vpci->lock);
> +    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> +    spin_unlock(&pdev->vpci->lock);
> +
> +    read_unlock(&v->domain->pci_lock);
>  
>      return false;
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            struct rangeset *mem, uint16_t cmd)
> +                            uint16_t cmd)
>  {
>      struct map_data data = { .d = d, .map = true };
> -    int rc;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    int rc = 0;
> +    unsigned int i;
>  
>      ASSERT(rw_is_write_locked(&d->pci_lock));
>  
> -    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        /*
> -         * It's safe to drop and reacquire the lock in this context
> -         * without risking pdev disappearing because devices cannot be
> -         * removed until the initial domain has been started.
> -         */
> -        read_unlock(&d->pci_lock);
> -        process_pending_softirqs();
> -        read_lock(&d->pci_lock);
> -    }
> +        struct vpci_bar *bar = &header->bars[i];
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
>  
> -    rangeset_destroy(mem);
> +        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +                                              &data)) == -ERESTART )
> +        {
> +            /*
> +             * It's safe to drop and reacquire the lock in this context
> +             * without risking pdev disappearing because devices cannot be
> +             * removed until the initial domain has been started.
> +             */
> +            write_unlock(&d->pci_lock);
> +            process_pending_softirqs();
> +            write_lock(&d->pci_lock);
> +        }
> +    }
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
>  
> @@ -225,10 +268,12 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>  }
>  
>  static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      struct rangeset *mem, uint16_t cmd, bool rom_only)
> +                      uint16_t cmd, bool rom_only)
>  {
>      struct vcpu *curr = current;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

Shouldn't this be part of the previous commit that introduces the
usage of d->pci_lock?

> +
>      /*
>       * FIXME: when deferring the {un}map the state of the device should not
>       * be trusted. For example the enable bit is toggled after the device
> @@ -236,7 +281,6 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.mem = mem;
>      curr->vpci.cmd = cmd;
>      curr->vpci.rom_only = rom_only;
>      /*
> @@ -250,33 +294,33 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    unsigned int i;
> +    unsigned int i, j;
>      int rc;
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> -    if ( !mem )
> -        return -ENOMEM;
> -
>      /*
> -     * Create a rangeset that represents the current device BARs memory region
> -     * and compare it against all the currently active BAR memory regions. If
> -     * an overlap is found, subtract it from the region to be mapped/unmapped.
> +     * Create a rangeset per BAR that represents the current device memory
> +     * region and compare it against all the currently active BAR memory
> +     * regions. If an overlap is found, subtract it from the region to be
> +     * mapped/unmapped.
>       *
> -     * First fill the rangeset with all the BARs of this device or with the ROM
> +     * First fill the rangesets with the BAR of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        const struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> +        if ( !bar->mem )
> +            continue;
> +
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
>                         : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> @@ -292,14 +336,31 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start, end);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start, end, rc);
> -            rangeset_destroy(mem);
>              return rc;
>          }
> +
> +        /* Check for overlap with the already setup BAR ranges. */
> +        for ( j = 0; j < i; j++ )
> +        {
> +            struct vpci_bar *prev_bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(prev_bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(prev_bar->mem, start, end);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                       "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
> +                        &pdev->sbdf, start, end, rc);
> +                return rc;
> +            }
> +        }
>      }
>  
>      /* Remove any MSIX regions if present. */
> @@ -309,14 +370,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> +        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            const struct vpci_bar *bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
> +                        &pdev->sbdf, start, end, rc);
> +                return rc;
> +            }
>          }
>      }
>  
> @@ -356,27 +424,35 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  
>              for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>              {
> -                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> -                unsigned long start = PFN_DOWN(bar->addr);
> -                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> -
> -                if ( !bar->enabled ||
> -                     !rangeset_overlaps_range(mem, start, end) ||
> -                     /*
> -                      * If only the ROM enable bit is toggled check against
> -                      * other BARs in the same device for overlaps, but not
> -                      * against the same ROM BAR.
> -                      */
> -                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> +                const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
> +                unsigned long start = PFN_DOWN(remote_bar->addr);
> +                unsigned long end = PFN_DOWN(remote_bar->addr +
> +                                             remote_bar->size - 1);
> +
> +                if ( !remote_bar->enabled )
>                      continue;
>  
> -                rc = rangeset_remove_range(mem, start, end);
> -                if ( rc )
> +                for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
> -                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> -                           start, end, rc);
> -                    rangeset_destroy(mem);
> -                    return rc;
> +                    const struct vpci_bar *bar = &header->bars[j];
> +
> +                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
> +                         /*
> +                          * If only the ROM enable bit is toggled check against
> +                          * other BARs in the same device for overlaps, but not
> +                          * against the same ROM BAR.
> +                          */
> +                         (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )

Is this line slightly too long?

Thanks, Roger.

