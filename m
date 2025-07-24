Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46EB0FF07
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 05:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055080.1423617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uemCZ-00005m-36; Thu, 24 Jul 2025 03:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055080.1423617; Thu, 24 Jul 2025 03:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uemCY-0008UD-Vh; Thu, 24 Jul 2025 03:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1055080;
 Thu, 24 Jul 2025 03:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BvLp=2F=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uemCV-0008U7-GN
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 03:00:56 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68bc64f7-683a-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 05:00:52 +0200 (CEST)
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
X-Inumbo-ID: 68bc64f7-683a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753326050; x=1753585250;
	bh=pRdBvitBIvHafjsHUoyHchkxGIG+zYqt/jMzp1VCOpo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GRM57/s1G57pBvhFM+Q/ci0CKHkzm8gzUc025q/7fPVDwM4RImN6AI2GLUJn7RF5n
	 1xh5q5SCAXkRQCkGYXpbjm4ZCiBDT6k/U/ywW8e3FlcWpI52BlXgQQuy3sF8hcfl3+
	 PtW99xy/HpsWlsIJ/bJAE4hAfrNRsO0rBPjDLNcbfbKuQXM/5bnbXr1CvGpZVO5tex
	 sZbq676S4xrULDbYdtgXAuds93FKh5y7YmhEUQrYHuDV7HPXELV43M+Mk/SCXwbkhv
	 bWOwdiMlhh04/kOhjGbCeudKaSgc1jbkqE8HZPWCqe78+I84FlWvkjE5EZ8nW62AlU
	 VQU0tB+z2d16Q==
Date: Thu, 24 Jul 2025 03:00:46 +0000
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aIGh2i5+Z2CW0mPr@kraken>
In-Reply-To: <20250723163744.13095-2-stewart.hildebrand@amd.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com> <20250723163744.13095-2-stewart.hildebrand@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2bf3069c54601a4c7d625c671b3d909a420e285c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> Introduce vPCI BAR mapping task queue. Decouple map operation state from
> general vPCI state: in particular, move the per-BAR rangeset out of
> struct vpci and into the map task struct.
>=20
> This is preparatory work for further changes that need to perform
> multiple unmap/map operations before returning to guest.
>=20
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v1->v2:
> * new patch
>=20
> Related: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> ---
>  xen/common/domain.c       |   4 +
>  xen/drivers/vpci/header.c | 197 +++++++++++++++++++++++---------------
>  xen/drivers/vpci/vpci.c   |   3 -
>  xen/include/xen/vpci.h    |  16 +++-
>  4 files changed, 139 insertions(+), 81 deletions(-)
>=20
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..214795e2d2fe 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -459,6 +459,10 @@ struct vcpu *vcpu_create(struct domain *d, unsigned =
int vcpu_id)
>          d->vcpu[prev_id]->next_in_list =3D v;
>      }
>=20
> +#ifdef CONFIG_HAS_VPCI
> +    INIT_LIST_HEAD(&v->vpci.task_queue);
> +#endif
> +
>      /* Must be called after making new vcpu visible to for_each_vcpu(). =
*/
>      vcpu_check_shutdown(v);
>=20
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index bb76e707992c..df065a5f5faf 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -34,7 +34,7 @@
>=20
>  struct map_data {
>      struct domain *d;
> -    const struct vpci_bar *bar;
> +    const struct vpci_bar_map *bar;

Perhaps s/vpci_bar_map/vpci_bar_mmio/g to highlight the BAR type?

>      bool map;
>  };
>=20
> @@ -173,31 +173,23 @@ static void modify_decoding(const struct pci_dev *p=
dev, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
>=20
> -bool vpci_process_pending(struct vcpu *v)
> +static bool vpci_process_map_task(struct vpci_map_task *task)
>  {
> -    const struct pci_dev *pdev =3D v->vpci.pdev;
> -    struct vpci_header *header =3D NULL;
> +    const struct pci_dev *pdev =3D task->pdev;
>      unsigned int i;
>=20
>      if ( !pdev )
>          return false;
>=20
> -    read_lock(&v->domain->pci_lock);
> -
> -    if ( !pdev->vpci || (v->domain !=3D pdev->domain) )
> -    {
> -        v->vpci.pdev =3D NULL;
> -        read_unlock(&v->domain->pci_lock);
> +    if ( !pdev->vpci || (task->domain !=3D pdev->domain) )
>          return false;
> -    }
>=20
> -    header =3D &pdev->vpci->header;
> -    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar =3D &header->bars[i];
> +        struct vpci_bar_map *bar =3D &task->bars[i];
>          struct map_data data =3D {
> -            .d =3D v->domain,
> -            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .d =3D task->domain,
> +            .map =3D task->cmd & PCI_COMMAND_MEMORY,
>              .bar =3D bar,
>          };
>          int rc;
> @@ -208,57 +200,79 @@ bool vpci_process_pending(struct vcpu *v)
>          rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
>=20
>          if ( rc =3D=3D -ERESTART )
> -        {
> -            read_unlock(&v->domain->pci_lock);
>              return true;
> -        }
>=20
>          if ( rc )
>          {
>              spin_lock(&pdev->vpci->lock);
>              /* Disable memory decoding unconditionally on failure. */
> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> +            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY,
>                              false);
>              spin_unlock(&pdev->vpci->lock);
>=20
> -            /* Clean all the rangesets */
> -            for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
> -                if ( !rangeset_is_empty(header->bars[i].mem) )
> -                     rangeset_purge(header->bars[i].mem);
> -
> -            v->vpci.pdev =3D NULL;
> -
> -            read_unlock(&v->domain->pci_lock);
> -
> -            if ( !is_hardware_domain(v->domain) )
> -                domain_crash(v->domain);
> +            if ( !is_hardware_domain(task->domain) )
> +                domain_crash(task->domain);
>=20
>              return false;
>          }
>      }
> -    v->vpci.pdev =3D NULL;
>=20
>      spin_lock(&pdev->vpci->lock);
> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> +    modify_decoding(pdev, task->cmd, task->rom_only);
>      spin_unlock(&pdev->vpci->lock);
>=20
> -    read_unlock(&v->domain->pci_lock);
> +    return false;
> +}
> +
> +static void destroy_map_task(struct vpci_map_task *task)
> +{
> +    unsigned int i;
>=20
> +    if ( !task )

Looks like task is never NULL in the code, suggest ASSERT().

> +        return;
> +
> +    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
> +        rangeset_destroy(task->bars[i].mem);
> +
> +    xfree(task);
> +}
> +
> +bool vpci_process_pending(struct vcpu *v)
> +{
> +    struct vpci_map_task *task;
> +    read_lock(&v->domain->pci_lock);
> +
> +    while ( (task =3D list_first_entry_or_null(&v->vpci.task_queue,
> +                                             struct vpci_map_task,
> +                                             next)) !=3D NULL )
> +    {
> +        if ( vpci_process_map_task(task) )
> +        {
> +            read_unlock(&v->domain->pci_lock);

I would add local variable and use it here for shorter code:

    int rc;

    read_lock(&v->domain->pci_lock);

    while (...)
    {
        rc =3D vpci_process_map_task(task);
        if ( rc )
            break;

        ...
    }

    read_unlock(&v->domain->pci_lock);

    return rc;



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
>=20
> -static int __init apply_map(struct domain *d, const struct pci_dev *pdev=
,
> -                            uint16_t cmd)
> +static int __init apply_map(struct vpci_map_task *task)
>  {
> -    struct vpci_header *header =3D &pdev->vpci->header;
> +    struct domain *d =3D task->domain;
> +    const struct pci_dev *pdev =3D task->pdev;
> +    uint16_t cmd =3D task->cmd;
>      int rc =3D 0;
>      unsigned int i;
>=20
>      ASSERT(rw_is_write_locked(&d->pci_lock));
>=20
> -    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
> +    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
>      {
> -        struct vpci_bar *bar =3D &header->bars[i];
> +        struct vpci_bar_map *bar =3D &task->bars[i];
>          struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar=
 };
>=20
>          if ( rangeset_is_empty(bar->mem) )
> @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const =
struct pci_dev *pdev,
>      return rc;
>  }
>=20
> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom=
_only)
> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> +                                            uint16_t cmd, bool rom_only)
> +{
> +    struct vpci_map_task *task =3D xzalloc(struct vpci_map_task);
> +    unsigned int i;
> +

I would move allocation outside of initializer and use preferred xvzalloc()
variant:

       task =3D xvzalloc(struct vpci_map_task);
> +    if ( !task )
> +        return NULL;
> +
> +    BUILD_BUG_ON(ARRAY_SIZE(task->bars) !=3D ARRAY_SIZE(pdev->vpci->head=
er.bars));
> +
> +    for ( i =3D 0; i < ARRAY_SIZE(task->bars); i++ )
> +    {
> +        if ( pdev->vpci->header.bars[i].type >=3D VPCI_BAR_MEM32 )

I would reduce one level of indentation by

           if ( pdev->vpci->header.bars[i].type < VPCI_BAR_MEM32 )
                continue;


> +        {
> +            char str[32];
> +
> +            snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> +
> +            task->bars[i].mem =3D rangeset_new(pdev->domain, str,
> +                                             RANGESETF_no_print);
> +
> +            if ( !task->bars[i].mem )
> +            {
> +                destroy_map_task(task);

What if allocation fails in the middle of the loop, e.g. i =3D=3D 5?
I think previously allocated rangesets in this loop should be freed.

> +                return NULL;
> +            }
> +
> +            task->bars[i].addr =3D pdev->vpci->header.bars[i].addr;
> +            task->bars[i].guest_addr =3D pdev->vpci->header.bars[i].gues=
t_addr;
> +        }
> +    }
> +
> +    task->pdev =3D pdev;
> +    task->domain =3D pdev->domain;
> +    task->cmd =3D cmd;
> +    task->rom_only =3D rom_only;
> +
> +    return task;
> +}
> +
> +static void defer_map(struct vpci_map_task *task)
>  {
>      struct vcpu *curr =3D current;
>=20
> @@ -293,9 +348,9 @@ static void defer_map(const struct pci_dev *pdev, uin=
t16_t cmd, bool rom_only)
>       * is mapped. This can lead to parallel mapping operations being
>       * started for the same device if the domain is not well-behaved.
>       */
> -    curr->vpci.pdev =3D pdev;
> -    curr->vpci.cmd =3D cmd;
> -    curr->vpci.rom_only =3D rom_only;
> +
> +    list_add_tail(&task->next, &curr->vpci.task_queue);
> +
>      /*
>       * Raise a scheduler softirq in order to prevent the guest from resu=
ming
>       * execution with pending mapping operations, to trigger the invocat=
ion
> @@ -310,11 +365,15 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>      struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix =3D pdev->vpci->msix;
> +    struct vpci_map_task *task =3D alloc_map_task(pdev, cmd, rom_only);

Same comment re: having allocation on a separate line.

>      unsigned int i, j;
>      int rc;
>=20
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>=20
> +    if ( !task )
> +        return -ENOMEM;
> +
>      /*
>       * Create a rangeset per BAR that represents the current device memo=
ry
>       * region and compare it against all the currently active BAR memory
> @@ -330,12 +389,13 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>      for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar =3D &header->bars[i];
> +        struct rangeset *mem =3D task->bars[i].mem;
>          unsigned long start =3D PFN_DOWN(bar->addr);
>          unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
>          unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
>          unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size=
 - 1);
>=20
> -        if ( !bar->mem )
> +        if ( !mem )
>              continue;
>=20
>          if ( !MAPPABLE_BAR(bar) ||
> @@ -353,7 +413,7 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
>              continue;
>          }
>=20
> -        ASSERT(rangeset_is_empty(bar->mem));
> +        ASSERT(rangeset_is_empty(mem));
>=20
>          /*
>           * Make sure that the guest set address has the same page offset
> @@ -365,21 +425,23 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>              gprintk(XENLOG_G_WARNING,
>                      "%pp: can't map BAR%u - offset mismatch: %#lx vs %#l=
x\n",
>                      &pdev->sbdf, i, bar->guest_addr, bar->addr);
> +            destroy_map_task(task);

I think using goto would be justified for doing cleanup in one place.

>              return -EINVAL;
>          }
>=20
> -        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
> +        rc =3D rangeset_add_range(mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start_guest, end_guest, rc);
> +            destroy_map_task(task);
>              return rc;
>          }
>=20
>          /* Check for overlap with the already setup BAR ranges. */
>          for ( j =3D 0; j < i; j++ )
>          {
> -            struct vpci_bar *prev_bar =3D &header->bars[j];
> +            struct vpci_bar_map *prev_bar =3D &task->bars[j];
>=20
>              if ( rangeset_is_empty(prev_bar->mem) )
>                  continue;
> @@ -390,16 +452,18 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %l=
x]: %d\n",
>                          &pdev->sbdf, start_guest, end_guest, rc);
> +                destroy_map_task(task);
>                  return rc;
>              }
>          }
>=20
> -        rc =3D pci_sanitize_bar_memory(bar->mem);
> +        rc =3D pci_sanitize_bar_memory(mem);
>          if ( rc )
>          {
>              gprintk(XENLOG_WARNING,
>                      "%pp: failed to sanitize BAR#%u memory: %d\n",
>                      &pdev->sbdf, i, rc);
> +            destroy_map_task(task);
>              return rc;
>          }
>      }
> @@ -413,7 +477,7 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
>=20
>          for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            const struct vpci_bar *bar =3D &header->bars[j];
> +            const struct vpci_bar_map *bar =3D &task->bars[j];
>=20
>              if ( rangeset_is_empty(bar->mem) )
>                  continue;
> @@ -424,6 +488,7 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove MSIX table [%lx, %lx]: %d\=
n",
>                          &pdev->sbdf, start, end, rc);
> +                destroy_map_task(task);
>                  return rc;
>              }
>          }
> @@ -468,8 +533,9 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
>                  for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
>                      const struct vpci_bar *bar =3D &header->bars[j];
> +                    struct rangeset *mem =3D task->bars[j].mem;
>=20
> -                    if ( !rangeset_overlaps_range(bar->mem, start, end) =
||
> +                    if ( !rangeset_overlaps_range(mem, start, end) ||
>                           /*
>                            * If only the ROM enable bit is toggled check =
against
>                            * other BARs in the same device for overlaps, =
but not
> @@ -480,12 +546,13 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>                            bar->type =3D=3D VPCI_BAR_ROM) )
>                          continue;
>=20
> -                    rc =3D rangeset_remove_range(bar->mem, start, end);
> +                    rc =3D rangeset_remove_range(mem, start, end);
>                      if ( rc )
>                      {
>                          gprintk(XENLOG_WARNING,
>                                  "%pp: failed to remove [%lx, %lx]: %d\n"=
,
>                                  &pdev->sbdf, start, end, rc);
> +                        destroy_map_task(task);
>                          return rc;
>                      }
>                  }
> @@ -509,10 +576,12 @@ static int modify_bars(const struct pci_dev *pdev, =
uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs=
.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, cmd);
> +        rc =3D apply_map(task);
> +        destroy_map_task(task);
> +        return rc;
>      }
>=20
> -    defer_map(pdev, cmd, rom_only);
> +    defer_map(task);
>=20
>      return 0;
>  }
> @@ -731,18 +800,6 @@ static void cf_check rom_write(
>      }
>  }
>=20
> -static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar =
*bar,
> -                            unsigned int i)
> -{
> -    char str[32];
> -
> -    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
> -
> -    bar->mem =3D rangeset_new(pdev->domain, str, RANGESETF_no_print);
> -
> -    return !bar->mem ? -ENOMEM : 0;
> -}
> -
>  static int vpci_init_capability_list(struct pci_dev *pdev)
>  {
>      int rc;
> @@ -947,10 +1004,6 @@ static int cf_check init_header(struct pci_dev *pde=
v)
>          else
>              bars[i].type =3D VPCI_BAR_MEM32;
>=20
> -        rc =3D bar_add_rangeset(pdev, &bars[i], i);
> -        if ( rc )
> -            goto fail;
> -
>          rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0=
);
>          if ( rc < 0 )
> @@ -1003,12 +1056,6 @@ static int cf_check init_header(struct pci_dev *pd=
ev)
>                                 4, rom);
>          if ( rc )
>              rom->type =3D VPCI_BAR_EMPTY;
> -        else
> -        {
> -            rc =3D bar_add_rangeset(pdev, rom, num_bars);
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
>=20
> -    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
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
>=20
> -struct vpci_vcpu {
> +#ifdef __XEN__
> +struct vpci_map_task {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. =
*/
> +    struct list_head next;
>      const struct pci_dev *pdev;
> +    struct domain *domain;
> +    struct vpci_bar_map {
> +        uint64_t addr;
> +        uint64_t guest_addr;

Perhaps use hpa/gpa notation for naming address fields?

> +        struct rangeset *mem;
> +    } bars[PCI_HEADER_NORMAL_NR_BARS + 1];

I would add a brief comment for `+ 1`

>      uint16_t cmd;
>      bool rom_only : 1;
>  };
>=20
> -#ifdef __XEN__
> +struct vpci_vcpu {
> +    struct list_head task_queue;
> +};
> +
>  void vpci_dump_msi(void);
>=20
>  /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
> --
> 2.50.1
>=20
>=20


