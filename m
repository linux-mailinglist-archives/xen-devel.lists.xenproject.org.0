Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F071B1199B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057494.1425397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDZ2-0002X0-UR; Fri, 25 Jul 2025 08:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057494.1425397; Fri, 25 Jul 2025 08:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDZ2-0002UL-Re; Fri, 25 Jul 2025 08:14:00 +0000
Received: by outflank-mailman (input) for mailman id 1057494;
 Fri, 25 Jul 2025 08:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufDZ1-0002UF-Ro
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:13:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50239699-692f-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 10:13:57 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso1127502f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:13:57 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458705c4dbdsm47121935e9.25.2025.07.25.01.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 01:13:56 -0700 (PDT)
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
X-Inumbo-ID: 50239699-692f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753431237; x=1754036037; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3I+Ad/W/f6nwIgykGr+QVR8D7sHmVWoIUYRyf/ZlhE=;
        b=D2w6hIHzch251DpjJxtk6dsqz7xNs8MCkO3Kv1yMTy8MH+UxhZw/eK9XpXm2H7zSFo
         i1txSZKkj5Cvt+sY+zbt+6uRtgEZ/deiscyhPDutFEiHBKE5NI7JrXp/OPac8KGHXQV0
         i/sPMXUHYuK/EgXETBt80qRL4YS7yNu1PHkow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431237; x=1754036037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3I+Ad/W/f6nwIgykGr+QVR8D7sHmVWoIUYRyf/ZlhE=;
        b=GPQRZP5zOt5Bxg5Bi6MA8hY/3Appu8d09gnTjYrNPriPF291m6cWAtPjhhZ7Iekbkn
         Z41XA3DjhM/oqT8Pi8E0+YNza14yCCchimH0sjlFTyUOn2RRCTa2Rb2qeKOQ3p00nWSM
         hjlac25PzglBKuOlst7OfnIr8duK6xeI6/JZsAlEA5Tb9bM0v33TWv64GiPfmXCl3ofZ
         Do7ewRHFSTN3qC1eylmJNXMcBqtlkGj8mosng3SEguCLPm6Ii3c7HuOipSHQP56nBP3I
         sHrOiOmtlLKHeMBqZLuHbcejMORQt2fn6v+xyR5tgirz1Zi07wF+FLMyY7EGggzyKM3t
         Inbg==
X-Gm-Message-State: AOJu0YwsGc3w/swLdGQESGFp1ZsP7QWDmZ/ciqjVFVFGvo5+VlqQq8PE
	YZCFxr8QdW7iyedPKiLvQsJ2ZKDcmNiWtigLGf8FV+WZ+BbuuI6HrPdDgdHV97hCnWk=
X-Gm-Gg: ASbGncv84hVjgXxJAAqwUykHr9Bu2ufE1DhE9vQuuJCKOZlCaHiDVwXkHgkuK0pAazW
	EWnEkly10/Auc3CRsJ5Qa96luZnmZjSnW9iqoiGnpMFQXrALMH2P8ygMUYcZYqChrhZ6WhFoiBF
	2Tej+5ev0dTO6FOGSA/UD1Vrz6pogF0eEGkatdBJyg68eRXiRyaRsr98HinhWaF/mXjS4a8ineW
	eFWxllt4jhGyJWDWKkA5bOsaMiQdSpymq5Vn1XxptuKB4c4BFkCuo3qX8OdsjDTsYbh9fJTHHMI
	n0PhiWkONNZNE4qajm06DARevd4fHLQ6pTcURh5/siin/5kAb0pmfU3rTh9bUMGGXkp4H0ZSgZr
	vws8+QJLmXrSOvDFnYJd80ZSBiap5wepuwd29Ft3JubR55m1gZ4LAWoCke2Voyz7YoLJUAAouUn
	LB
X-Google-Smtp-Source: AGHT+IGjrLEpWV5MdqE1GDdgm2pZEITL/cZaXvRsac0MLfwQ0/YSfAyEMDGCL0zsRaHZS3+1JrRmMQ==
X-Received: by 2002:a05:6000:2905:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3b776688508mr931828f8f.56.1753431237136;
        Fri, 25 Jul 2025 01:13:57 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:13:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] vpci: allow BAR map/unmap without affecting
 memory decoding bit
Message-ID: <aIM8xOy6mpJ0tjxJ@macbook.local>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723163744.13095-3-stewart.hildebrand@amd.com>

On Wed, Jul 23, 2025 at 12:37:42PM -0400, Stewart Hildebrand wrote:
> Introduce enum vpci_map_op and allow invoking modify_bars() without
> changing the memory decoding bit.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v1->v2:
> * new patch
> ---
>  xen/drivers/vpci/header.c | 22 +++++++++++++++-------
>  xen/include/xen/vpci.h    |  4 ++++
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index df065a5f5faf..1c66796b625b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -189,7 +189,7 @@ static bool vpci_process_map_task(struct vpci_map_task *task)
>          struct vpci_bar_map *bar = &task->bars[i];
>          struct map_data data = {
>              .d = task->domain,
> -            .map = task->cmd & PCI_COMMAND_MEMORY,
> +            .map = task->map_op == VPCI_MAP,
>              .bar = bar,
>          };
>          int rc;
> @@ -298,7 +298,9 @@ static int __init apply_map(struct vpci_map_task *task)
>  }
>  
>  static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> -                                            uint16_t cmd, bool rom_only)
> +                                            uint16_t cmd,
> +                                            enum vpci_map_op map_op,
> +                                            bool rom_only)
>  {
>      struct vpci_map_task *task = xzalloc(struct vpci_map_task);
>      unsigned int i;
> @@ -333,6 +335,7 @@ static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
>      task->pdev = pdev;
>      task->domain = pdev->domain;
>      task->cmd = cmd;
> +    task->map_op = map_op;
>      task->rom_only = rom_only;
>  
>      return task;
> @@ -359,13 +362,14 @@ static void defer_map(struct vpci_map_task *task)
>      raise_softirq(SCHEDULE_SOFTIRQ);
>  }
>  
> -static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> +static int modify_bars(const struct pci_dev *pdev, uint16_t cmd,
> +                       enum vpci_map_op map_op, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
>      struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    struct vpci_map_task *task = alloc_map_task(pdev, cmd, rom_only);
> +    struct vpci_map_task *task = alloc_map_task(pdev, cmd, map_op, rom_only);
>      unsigned int i, j;
>      int rc;
>  
> @@ -614,7 +618,8 @@ static void cf_check cmd_write(
>           * memory decoding bit has not been changed, so leave everything as-is,
>           * hoping the guest will realize and try again.
>           */
> -        modify_bars(pdev, cmd, false);
> +        modify_bars(pdev, cmd, cmd & PCI_COMMAND_MEMORY ? VPCI_MAP : VPCI_UNMAP,
> +                    false);
>      else
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
> @@ -782,7 +787,8 @@ static void cf_check rom_write(
>       * Pass PCI_COMMAND_MEMORY or 0 to signal a map/unmap request, note that
>       * this fabricated command is never going to be written to the register.
>       */
> -    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0, true) )
> +    else if ( modify_bars(pdev, new_enabled ? PCI_COMMAND_MEMORY : 0,
> +                          new_enabled ? VPCI_MAP : VPCI_UNMAP, true) )
>          /*
>           * No memory has been added or removed from the p2m (because the actual
>           * p2m changes are deferred in defer_map) and the ROM enable bit has
> @@ -1067,7 +1073,9 @@ static int cf_check init_header(struct pci_dev *pdev)
>              goto fail;
>      }
>  
> -    return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
> +    return (cmd & PCI_COMMAND_MEMORY)
> +           ? modify_bars(pdev, cmd, VPCI_MAP, false)
> +           : 0;
>  
>   fail:
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index c2e75076691f..fb6cad62d418 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -205,6 +205,10 @@ struct vpci_map_task {
>          struct rangeset *mem;
>      } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
>      uint16_t cmd;
> +    enum vpci_map_op {
> +        VPCI_MAP,
> +        VPCI_UNMAP,
> +    } map_op;
>      bool rom_only : 1;

Since you already have a bitfield here, I would consider using a
boolean also, ie:

bool rom_only : 1;
bool map : 1;

Or are we expecting to gain new operations aside from map and unmap?

Thanks, Roger.

