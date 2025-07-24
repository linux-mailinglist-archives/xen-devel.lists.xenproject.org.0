Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB80B10FD8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056398.1424618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uez3d-0005NY-6z; Thu, 24 Jul 2025 16:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056398.1424618; Thu, 24 Jul 2025 16:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uez3d-0005M8-2V; Thu, 24 Jul 2025 16:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1056398;
 Thu, 24 Jul 2025 16:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uez3c-0005M2-29
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:44:36 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af74ac8-68ad-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 18:44:35 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45634205adaso6227425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:44:35 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45870564ddbsm25254435e9.22.2025.07.24.09.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 09:44:33 -0700 (PDT)
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
X-Inumbo-ID: 7af74ac8-68ad-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753375474; x=1753980274; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2wWUJwq5uTn6wqzGYMdh9Ogql8lUFoCDmvOV2eBYI=;
        b=d8lB9xmDCXBvk9QhbW3vOjud7aFSv9ddKzFlIeYdnXKPbeAgcJhFFV2I71bZdKoEu8
         64CpaQsTCpBnIAk8gfqqJujfBoscwQGhzyKJOY5oFPLDXg50BychuA1jIXLPkEZd7gla
         ACgnUwrvOz39QzQlAXoUjtwFDmEXJtMhuWQxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375474; x=1753980274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN2wWUJwq5uTn6wqzGYMdh9Ogql8lUFoCDmvOV2eBYI=;
        b=SDJ56S0ORKQm1K0CCa3v/1vxZEH14yXrZpzGo/JSDWrzDSJhM3NxrUQ8PqGi6uMqof
         F/nJAuv9d0eWASarj60qLGTX5Shqh3IWwMj0IQrqRznfz9MTxlPsUXXxcLdEIriABfxT
         ve/udEMgvE9X91KqveimqvOSMgxmrLM1ZvSE6yd5fZOzHZFketwZJzEOMf1aAgZ2ip0V
         4YZv1T8DUnmLBszzHbAHjyJibVCZ80TFpMaBppjtobmbM7WJO6/+N4Qxe/W9vMI8Yn94
         mBbOh7YLTUgkwk6giBvsYb9bMFOZBuLCh9cBz/+5UJmOCx/mHBXCxcP2uFE5sdzwYo3T
         CoJw==
X-Gm-Message-State: AOJu0YxAcnLbZOGWAHo46PcH2CrOBGy3pT5T/FL07t0rZ1Zo570AIasD
	YDhSbyHjYz6zVf36vztapOAm6bkEn0KkXClnR4zcQT5zMxVjCjGWURbvbwop+vD9sC0=
X-Gm-Gg: ASbGncsfI4QtDx3s34iQDGlS9gS4L2LGkNMBQqHJRYF35VpAs+/K+/mASf/hP6Phan6
	Bo2FAojVymNsep3pO8bmYKCB5Nit7qoW/UrnjNXE2OhYtTkRguXge82HuVEEkZhqnUrSC8FeQ38
	ZE5ByYphF9Xy1+YEwA4r3Z9sgDqoArVcKqK8NOdFkmMo4dI0nxvFHvjq9U+4p16qGWdls8kF+4e
	93nyxef3+HpHhWCAcdgWyIXVl1iMZj0HrA0El6qzGM/UvMYBcLX4CLOrFN+0yGaNY1guGto/HfH
	iDaD+6whkJWXW/s/+7rMr1mJ2rtB2H/1Drf02+JoLFLesyzOa94CAyA18T4YSYMBonlm120IU3e
	BlGnsTrZGzdLuPS5sfWn6F432nRjfNRBQ7Yr7QpCcayZuqCWWKpLQhyqWlNCASgghg/A0komleZ
	1X
X-Google-Smtp-Source: AGHT+IEyc8Ys1p4889d0hbz+G7bRfovPv/rhvFJgGkOPqemYXNPGcjChLbVoaou4O2FKnRw4YKRzxg==
X-Received: by 2002:a05:600c:638f:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-45868d46f15mr78461305e9.18.1753375474268;
        Thu, 24 Jul 2025 09:44:34 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:44:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aIJi8E2BC-dzAIz8@macbook.local>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723163744.13095-2-stewart.hildebrand@amd.com>

On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> Introduce vPCI BAR mapping task queue. Decouple map operation state from
> general vPCI state: in particular, move the per-BAR rangeset out of
> struct vpci and into the map task struct.
> 
> This is preparatory work for further changes that need to perform
> multiple unmap/map operations before returning to guest.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v1->v2:
> * new patch
> 
> Related: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> ---
>  xen/common/domain.c       |   4 +
>  xen/drivers/vpci/header.c | 197 +++++++++++++++++++++++---------------
>  xen/drivers/vpci/vpci.c   |   3 -
>  xen/include/xen/vpci.h    |  16 +++-
>  4 files changed, 139 insertions(+), 81 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..214795e2d2fe 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -459,6 +459,10 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>          d->vcpu[prev_id]->next_in_list = v;
>      }
>  
> +#ifdef CONFIG_HAS_VPCI
> +    INIT_LIST_HEAD(&v->vpci.task_queue);
> +#endif
> +
>      /* Must be called after making new vcpu visible to for_each_vcpu(). */
>      vcpu_check_shutdown(v);
>  
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index bb76e707992c..df065a5f5faf 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -34,7 +34,7 @@
>  
>  struct map_data {
>      struct domain *d;
> -    const struct vpci_bar *bar;
> +    const struct vpci_bar_map *bar;
>      bool map;
>  };
>  
> @@ -173,31 +173,23 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
>  
> -bool vpci_process_pending(struct vcpu *v)
> +static bool vpci_process_map_task(struct vpci_map_task *task)
>  {
> -    const struct pci_dev *pdev = v->vpci.pdev;
> -    struct vpci_header *header = NULL;
> +    const struct pci_dev *pdev = task->pdev;
>      unsigned int i;
>  
>      if ( !pdev )
>          return false;
>  
> -    read_lock(&v->domain->pci_lock);
> -
> -    if ( !pdev->vpci || (v->domain != pdev->domain) )
> -    {
> -        v->vpci.pdev = NULL;
> -        read_unlock(&v->domain->pci_lock);
> +    if ( !pdev->vpci || (task->domain != pdev->domain) )
>          return false;
> -    }
>  
> -    header = &pdev->vpci->header;
> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar_map *bar = &task->bars[i];
>          struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .d = task->domain,
> +            .map = task->cmd & PCI_COMMAND_MEMORY,
>              .bar = bar,
>          };
>          int rc;
> @@ -208,57 +200,79 @@ bool vpci_process_pending(struct vcpu *v)
>          rc = rangeset_consume_ranges(bar->mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
> -        {
> -            read_unlock(&v->domain->pci_lock);
>              return true;
> -        }
>  
>          if ( rc )
>          {
>              spin_lock(&pdev->vpci->lock);
>              /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> +            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY,
>                              false);
>              spin_unlock(&pdev->vpci->lock);
>  
> -            /* Clean all the rangesets */
> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(header->bars[i].mem) )
> -                     rangeset_purge(header->bars[i].mem);
> -
> -            v->vpci.pdev = NULL;
> -
> -            read_unlock(&v->domain->pci_lock);
> -
> -            if ( !is_hardware_domain(v->domain) )
> -                domain_crash(v->domain);
> +            if ( !is_hardware_domain(task->domain) )
> +                domain_crash(task->domain);
>  
>              return false;
>          }
>      }
> -    v->vpci.pdev = NULL;
>  
>      spin_lock(&pdev->vpci->lock);
> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> +    modify_decoding(pdev, task->cmd, task->rom_only);
>      spin_unlock(&pdev->vpci->lock);
>  
> -    read_unlock(&v->domain->pci_lock);
> +    return false;
> +}
> +
> +static void destroy_map_task(struct vpci_map_task *task)
> +{
> +    unsigned int i;
>  
> +    if ( !task )
> +        return;

Maybe I'm missing a case, but is there any caller that can possibly
pass a NULL task?  Not that having the check is bad, just wondering
myself.  You might consider adding an ASSERT_UNREACHABLE() if there
are no callers that pass NULL (to ensure correctness of the calling
logic, not that the function can't deal with them).

> +
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
> +        rangeset_destroy(task->bars[i].mem);
> +
> +    xfree(task);
> +}
> +
> +bool vpci_process_pending(struct vcpu *v)
> +{
> +    struct vpci_map_task *task;

Newline.

> +    read_lock(&v->domain->pci_lock);
> +
> +    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
> +                                             struct vpci_map_task,
> +                                             next)) != NULL )
> +    {
> +        if ( vpci_process_map_task(task) )
> +        {
> +            read_unlock(&v->domain->pci_lock);
> +            return true;
> +        }
> +
> +        list_del(&task->next);
> +        destroy_map_task(task);
> +    }
> +
> +    read_unlock(&v->domain->pci_lock);
>      return false;
>  }
>  
> -static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            uint16_t cmd)
> +static int __init apply_map(struct vpci_map_task *task)
>  {
> -    struct vpci_header *header = &pdev->vpci->header;
> +    struct domain *d = task->domain;
> +    const struct pci_dev *pdev = task->pdev;
> +    uint16_t cmd = task->cmd;
>      int rc = 0;
>      unsigned int i;
>  
>      ASSERT(rw_is_write_locked(&d->pci_lock));
>  
> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar_map *bar = &task->bars[i];
>          struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(bar->mem) )
> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      return rc;
>  }
>  
> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> +                                            uint16_t cmd, bool rom_only)
> +{
> +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);

xvzalloc() preferably.

This however introduces run-time allocations as a result of guest
actions, which is not ideal IMO.  It would be preferable to do those
allocations as part of the header initialization, and re-use them.

> +    unsigned int i;
> +
> +    if ( !task )
> +        return NULL;
> +
> +    BUILD_BUG_ON(ARRAY_SIZE(task->bars) != ARRAY_SIZE(pdev->vpci->header.bars));
> +
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
> +    {
> +        if ( pdev->vpci->header.bars[i].type >= VPCI_BAR_MEM32 )

You possibly don't need to prepare this for VPCI_BAR_MEM64_HI BAR
types?

I think you want to use the existing MAPPABLE_BAR() macro to check
whether a BAR requires backing mapping infrastructure.

Also, a nit, but you might want to do something like:

if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
    continue;

To reduce a level of indentation.

> +        {
> +            char str[32];
> +
> +            snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> +
> +            task->bars[i].mem = rangeset_new(pdev->domain, str,
> +                                             RANGESETF_no_print);
> +
> +            if ( !task->bars[i].mem )
> +            {
> +                destroy_map_task(task);
> +                return NULL;
> +            }
> +
> +            task->bars[i].addr = pdev->vpci->header.bars[i].addr;
> +            task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
> +        }
> +    }
> +
> +    task->pdev = pdev;
> +    task->domain = pdev->domain;
> +    task->cmd = cmd;
> +    task->rom_only = rom_only;
> +
> +    return task;
> +}
> +
> +static void defer_map(struct vpci_map_task *task)
>  {
>      struct vcpu *curr = current;
>  
> @@ -293,9 +348,9 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * is mapped. This can lead to parallel mapping operations being
>       * started for the same device if the domain is not well-behaved.
>       */
> -    curr->vpci.pdev = pdev;
> -    curr->vpci.cmd = cmd;
> -    curr->vpci.rom_only = rom_only;
> +
> +    list_add_tail(&task->next, &curr->vpci.task_queue);

You could probably assert the list is empty before adding, albeit that
won't be the case after further patches are added?

>      /*
>       * Raise a scheduler softirq in order to prevent the guest from resuming
>       * execution with pending mapping operations, to trigger the invocation
> @@ -310,11 +365,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> +    struct vpci_map_task *task = alloc_map_task(pdev, cmd, rom_only);
>      unsigned int i, j;
>      int rc;
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> +    if ( !task )
> +        return -ENOMEM;
> +
>      /*
>       * Create a rangeset per BAR that represents the current device memory
>       * region and compare it against all the currently active BAR memory
> @@ -330,12 +389,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct rangeset *mem = task->bars[i].mem;
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest = PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
>  
> -        if ( !bar->mem )
> +        if ( !mem )
>              continue;
>  
>          if ( !MAPPABLE_BAR(bar) ||
> @@ -353,7 +413,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        ASSERT(rangeset_is_empty(bar->mem));
> +        ASSERT(rangeset_is_empty(mem));
>  
>          /*
>           * Make sure that the guest set address has the same page offset
> @@ -365,21 +425,23 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              gprintk(XENLOG_G_WARNING,
>                      "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
>                      &pdev->sbdf, i, bar->guest_addr, bar->addr);
> +            destroy_map_task(task);
>              return -EINVAL;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
> +        rc = rangeset_add_range(mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start_guest, end_guest, rc);
> +            destroy_map_task(task);
>              return rc;
>          }
>  
>          /* Check for overlap with the already setup BAR ranges. */
>          for ( j = 0; j < i; j++ )
>          {
> -            struct vpci_bar *prev_bar = &header->bars[j];
> +            struct vpci_bar_map *prev_bar = &task->bars[j];
>  
>              if ( rangeset_is_empty(prev_bar->mem) )
>                  continue;
> @@ -390,16 +452,18 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
>                          &pdev->sbdf, start_guest, end_guest, rc);
> +                destroy_map_task(task);
>                  return rc;
>              }
>          }
>  
> -        rc = pci_sanitize_bar_memory(bar->mem);
> +        rc = pci_sanitize_bar_memory(mem);
>          if ( rc )
>          {
>              gprintk(XENLOG_WARNING,
>                      "%pp: failed to sanitize BAR#%u memory: %d\n",
>                      &pdev->sbdf, i, rc);
> +            destroy_map_task(task);
>              return rc;
>          }
>      }
> @@ -413,7 +477,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  
>          for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            const struct vpci_bar *bar = &header->bars[j];
> +            const struct vpci_bar_map *bar = &task->bars[j];
>  
>              if ( rangeset_is_empty(bar->mem) )
>                  continue;
> @@ -424,6 +488,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
>                          &pdev->sbdf, start, end, rc);
> +                destroy_map_task(task);
>                  return rc;
>              }
>          }
> @@ -468,8 +533,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                  for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
>                      const struct vpci_bar *bar = &header->bars[j];
> +                    struct rangeset *mem = task->bars[j].mem;
>  
> -                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
> +                    if ( !rangeset_overlaps_range(mem, start, end) ||
>                           /*
>                            * If only the ROM enable bit is toggled check against
>                            * other BARs in the same device for overlaps, but not
> @@ -480,12 +546,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                            bar->type == VPCI_BAR_ROM) )
>                          continue;
>  
> -                    rc = rangeset_remove_range(bar->mem, start, end);
> +                    rc = rangeset_remove_range(mem, start, end);
>                      if ( rc )
>                      {
>                          gprintk(XENLOG_WARNING,
>                                  "%pp: failed to remove [%lx, %lx]: %d\n",
>                                  &pdev->sbdf, start, end, rc);
> +                        destroy_map_task(task);
>                          return rc;
>                      }
>                  }
> @@ -509,10 +576,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, cmd);
> +        rc = apply_map(task);
> +        destroy_map_task(task);

All the destroy calls are a bit repetitive, you could consider using
an error label or similar.

> +        return rc;
>      }
>  
> -    defer_map(pdev, cmd, rom_only);
> +    defer_map(task);
>  
>      return 0;
>  }
> @@ -731,18 +800,6 @@ static void cf_check rom_write(
>      }
>  }
>  
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> -                            unsigned int i)
> -{
> -    char str[32];
> -
> -    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> -
> -    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> -
> -    return !bar->mem ? -ENOMEM : 0;
> -}
> -
>  static int vpci_init_capability_list(struct pci_dev *pdev)
>  {
>      int rc;
> @@ -947,10 +1004,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> -        rc = bar_add_rangeset(pdev, &bars[i], i);
> -        if ( rc )
> -            goto fail;
> -
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> @@ -1003,12 +1056,6 @@ static int cf_check init_header(struct pci_dev *pdev)
>                                 4, rom);
>          if ( rc )
>              rom->type = VPCI_BAR_EMPTY;
> -        else
> -        {
> -            rc = bar_add_rangeset(pdev, rom, num_bars);
> -            if ( rc )
> -                goto fail;
> -        }
>      }
>      else if ( !is_hwdom )
>      {
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 09988f04c27c..7177cfce355d 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -117,9 +117,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
>                  iounmap(pdev->vpci->msix->table[i]);
>      }
>  
> -    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
> -        rangeset_destroy(pdev->vpci->header.bars[i].mem);
> -
>      xfree(pdev->vpci->msix);
>      xfree(pdev->vpci->msi);
>      xfree(pdev->vpci);
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 6a481a4e89d3..c2e75076691f 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -103,7 +103,6 @@ struct vpci {
>              uint64_t guest_addr;
>              uint64_t size;
>              uint64_t resizable_sizes;
> -            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -194,14 +193,25 @@ struct vpci {
>  #endif
>  };
>  
> -struct vpci_vcpu {
> +#ifdef __XEN__
> +struct vpci_map_task {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> +    struct list_head next;
>      const struct pci_dev *pdev;
> +    struct domain *domain;
> +    struct vpci_bar_map {
> +        uint64_t addr;
> +        uint64_t guest_addr;
> +        struct rangeset *mem;
> +    } bars[PCI_HEADER_NORMAL_NR_BARS + 1];

You might be able to use ARRAY_SIZE() to derive the number of elements
from the existing array in vpci_header struct.

Thanks, Roger.

