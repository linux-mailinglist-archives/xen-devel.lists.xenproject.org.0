Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3778C01B1
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 18:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718867.1121405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jrg-0001nV-NQ; Wed, 08 May 2024 16:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718867.1121405; Wed, 08 May 2024 16:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jrg-0001kc-Jq; Wed, 08 May 2024 16:09:56 +0000
Received: by outflank-mailman (input) for mailman id 718867;
 Wed, 08 May 2024 16:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4jrf-0001kW-9Y
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 16:09:55 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c386c6-0d55-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 18:09:52 +0200 (CEST)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-43d3a33d41dso26553321cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 09:09:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 bz6-20020a05622a1e8600b00439c1419553sm7839119qtb.44.2024.05.08.09.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 09:09:50 -0700 (PDT)
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
X-Inumbo-ID: 66c386c6-0d55-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715184591; x=1715789391; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERgYyoQWo4zQ/PeMvKAHRkgO4o9g0joMcpPbVkGfWr8=;
        b=Fg5wLiRe+Up0cdtU+gNRBk4IAvl9ozfIs0ugEVYUc2KVkxVUrkwIwYDlZ9E6cRQ3aS
         noQvD/Eb3jeNNX5kHzbyJpTqQQv8b/Gg+zxrHe+RZ7289sPr9VHD7kxO2U1fOMqUik8z
         4bvnZTgm2eW/Ly8GK+9iNjf5e0Snk1cUsKdt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715184591; x=1715789391;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERgYyoQWo4zQ/PeMvKAHRkgO4o9g0joMcpPbVkGfWr8=;
        b=VxdKcEkbYXL13iyY6jfywIc/7Kg4Dkk38+Oga1dOxf8AoSxGVn8jxDC1t369SVqMBS
         gm78yaVZTpc6LktCPE7BRX2dfUUvNJv9QgGFY1AOqCYzDe7MZ1ALhar2KAvnDhVR1D5l
         pXUkmJ8MeRWQLH8gfRzeCG4c82zZwobodtw5pALRlj8q35m8cVYlzBcR5VacDO5Ng3Oc
         bP7a9KLjh6j5lDKf6sv8iFy32u3Bl9wCTDngjzMkruDwXAu7H2MNl0oC0uRn+USPBh2d
         lwSZVRiDbYvhzj2iPNUzdLJo4sYa3BewcMDvj1DeFTw9K6zMvos/Zt4YXSkjvlWOnhF/
         d+Vw==
X-Gm-Message-State: AOJu0YzSmZGpSlmh6U+Abb0Drv2J0s3qGT+2NewHv9hqADntL8CAdl2g
	YCJdXjH4z5hxY7ASWEjbiNWEJC6RXOnKau6+/MRPSkK7nH0MRRH48SxnAMLw1hs=
X-Google-Smtp-Source: AGHT+IE5oM5oC35wdA9RcOoUYsujpFjSMvST0YLomhmVsj3c+bNqCFjIXOjuwGrux+PPpE/RH6xGRQ==
X-Received: by 2002:ac8:5987:0:b0:43a:e61a:ddc7 with SMTP id d75a77b69052e-43dbf73b39amr39150791cf.44.1715184591206;
        Wed, 08 May 2024 09:09:51 -0700 (PDT)
Date: Wed, 8 May 2024 18:09:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <ZjujzCnAfHye_eIp@macbook>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
 <da180c8419882dc068512b69c6c7ad3ff3343fe0.1715085837.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da180c8419882dc068512b69c6c7ad3ff3343fe0.1715085837.git-series.marmarek@invisiblethingslab.com>

On Tue, May 07, 2024 at 02:44:02PM +0200, Marek Marczykowski-Górecki wrote:
> Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> on the same page as MSI-X table. Device model (especially one in
> stubdomain) cannot really handle those, as direct writes to that page is
> refused (page is on the mmio_ro_ranges list). Instead, extend
> msixtbl_mmio_ops to handle such accesses too.
> 
> Doing this, requires correlating read/write location with guest
> MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> for PV would need to be done separately.
> 
> This will be also used to read Pending Bit Array, if it lives on the same
> page, making QEMU not needing /dev/mem access at all (especially helpful
> with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> map it to the guest directly.
> If PBA lives on the same page, discard writes and log a message.
> Technically, writes outside of PBA could be allowed, but at this moment
> the precise location of PBA isn't saved, and also no known device abuses
> the spec in this way (at least yet).
> 
> To access those registers, msixtbl_mmio_ops need the relevant page
> mapped. MSI handling already has infrastructure for that, using fixmap,
> so try to map first/last page of the MSI-X table (if necessary) and save
> their fixmap indexes. Note that msix_get_fixmap() does reference
> counting and reuses existing mapping, so just call it directly, even if
> the page was mapped before. Also, it uses a specific range of fixmap
> indexes which doesn't include 0, so use 0 as default ("not mapped")
> value - which simplifies code a bit.
> 
> Based on assumption that all MSI-X page accesses are handled by Xen, do
> not forward adjacent accesses to other hypothetical ioreq servers, even
> if the access wasn't handled for some reason (failure to map pages etc).
> Relevant places log a message about that already.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks, just a couple of minor comments, I think the only relevant one
is that you can drop ADJACENT_DONT_HANDLE unless there's something
I'm missing.  The rest are mostly cosmetic, but if you have to respin
and agree with them might be worth addressing.

Sorry for giving this feedback so late in the process, I should have
attempted to review earlier versions.

> ---
> Changes in v7:
> - simplify logic based on assumption that all access to MSI-X pages are
>   handled by Xen (Roger)
> - move calling adjacent_handle() into adjacent_{read,write}() (Roger)
> - move range check into msixtbl_addr_to_desc() (Roger)
> - fix off-by-one when initializing adj_access_idx[ADJ_IDX_LAST] (Roger)
> - no longer distinguish between unhandled write due to PBA nearby and
>   other reasons
> - add missing break after ASSERT_UNREACHABLE (Jan)
> Changes in v6:
> - use MSIX_CHECK_WARN macro
> - extend assert on fixmap_idx
> - add break in default label, after ASSERT_UNREACHABLE(), and move
>   setting default there
> - style fixes
> Changes in v5:
> - style fixes
> - include GCC version in the commit message
> - warn only once (per domain, per device) about failed adjacent access
> Changes in v4:
> - drop same_page parameter of msixtbl_find_entry(), distinguish two
>   cases in relevant callers
> - rename adj_access_table_idx to adj_access_idx
> - code style fixes
> - drop alignment check in adjacent_{read,write}() - all callers already
>   have it earlier
> - delay mapping first/last MSI-X pages until preparing device for a
>   passthrough
> v3:
>  - merge handling into msixtbl_mmio_ops
>  - extend commit message
> v2:
>  - adjust commit message
>  - pass struct domain to msixtbl_page_handler_get_hwaddr()
>  - reduce local variables used only once
>  - log a warning if write is forbidden if MSI-X and PBA lives on the same
>    page
>  - do not passthrough unaligned accesses
>  - handle accesses both before and after MSI-X table
> ---
>  xen/arch/x86/hvm/vmsi.c        | 205 ++++++++++++++++++++++++++++++++--
>  xen/arch/x86/include/asm/msi.h |   5 +-
>  xen/arch/x86/msi.c             |  42 +++++++-
>  3 files changed, 242 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 999917983789..f7b7b4998b5e 100644
> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -180,6 +180,10 @@ static bool msixtbl_initialised(const struct domain *d)
>      return d->arch.hvm.msixtbl_list.next;
>  }
>  
> +/*
> + * Lookup an msixtbl_entry on the same page as given addr. It's up to the
> + * caller to check if address is strictly part of the table - if relevant.
> + */
>  static struct msixtbl_entry *msixtbl_find_entry(
>      struct vcpu *v, unsigned long addr)
>  {
> @@ -187,8 +191,8 @@ static struct msixtbl_entry *msixtbl_find_entry(
>      struct domain *d = v->domain;
>  
>      list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> -        if ( addr >= entry->gtable &&
> -             addr < entry->gtable + entry->table_len )
> +        if ( PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
> +             PFN_DOWN(addr) <= PFN_DOWN(entry->gtable + entry->table_len - 1) )
>              return entry;
>  
>      return NULL;
> @@ -203,6 +207,10 @@ static struct msi_desc *msixtbl_addr_to_desc(
>      if ( !entry || !entry->pdev )
>          return NULL;
>  
> +    if ( addr < entry->gtable ||
> +         addr >= entry->gtable + entry->table_len )
> +        return NULL;
> +
>      nr_entry = (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
>  
>      list_for_each_entry( desc, &entry->pdev->msi_list, list )
> @@ -213,6 +221,152 @@ static struct msi_desc *msixtbl_addr_to_desc(
>      return NULL;
>  }
>  
> +/*
> + * Returns:
> + *  - ADJACENT_DONT_HANDLE if no handling should be done
> + *  - a fixmap idx to use for handling
> + */
> +#define ADJACENT_DONT_HANDLE UINT_MAX

Isn't it fine to just return 0 to signal that the access is not
handled?

fixmap index 0 is reserved anyway (see FIX_RESERVED), so could be used
for this purpose and then you don't need to introduce
ADJACENT_DONT_HANDLE?

> +static unsigned int adjacent_handle(
> +    const struct msixtbl_entry *entry, unsigned long addr, bool write)

Now that it has been quite pruned, get_adjacent_idx() or some such
might be more inline with the function logic.

> +{
> +    unsigned int adj_type;
> +    struct arch_msix *msix;
> +
> +    if ( !entry || !entry->pdev )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable) && addr < entry->gtable )
> +        adj_type = ADJ_IDX_FIRST;
> +    else if ( PFN_DOWN(addr) == PFN_DOWN(entry->gtable + entry->table_len - 1) &&
> +              addr >= entry->gtable + entry->table_len )
> +        adj_type = ADJ_IDX_LAST;
> +    else
> +    {
> +        /* All callers should already do equivalent range checking. */
> +        ASSERT_UNREACHABLE();
> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    msix = entry->pdev->msix;
> +    ASSERT(msix);

Since you already do it above, would be best to do:

if ( !msix )
{
    ASSERT_UNREACHABLE();
    return 0;
}

> +
> +    if ( !msix->adj_access_idx[adj_type] )
> +    {
> +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> +                             adjacent_not_initialized) )
> +            gprintk(XENLOG_WARNING,
> +                    "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",

Do you really need to log an error here?  There's an error already
printed in msix_capability_init() if the adjacent pages can't be
mapped.

> +                    adj_type, &entry->pdev->sbdf, addr, entry->gtable);
> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    /* If PBA lives on the same page too, discard writes. */
> +    if ( write &&
> +         ((adj_type == ADJ_IDX_LAST &&
> +           msix->table.last == msix->pba.first) ||
> +          (adj_type == ADJ_IDX_FIRST &&
> +           msix->table.first == msix->pba.last)) )
> +    {
> +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> +                             adjacent_pba) )
> +            gprintk(XENLOG_WARNING,
> +                    "MSI-X table and PBA of %pp live on the same page, "
> +                    "writing to other registers there is not implemented\n",
> +                    &entry->pdev->sbdf);

I would usually start those errors with the SBDF, as that makes it
easier to identify error originating from the same device:

"%pp: MSI-X table and PBA share a page, discard write to adjacent memory (%#lx)\n",
&entry->pdev->sbdf, addr

> +        return ADJACENT_DONT_HANDLE;
> +    }
> +
> +    return msix->adj_access_idx[adj_type];
> +}
> +
> +static int adjacent_read(
> +    const struct msixtbl_entry *entry,
> +    paddr_t address, unsigned int len, uint64_t *pval)
> +{
> +    const void __iomem *hwaddr;
> +    unsigned int fixmap_idx;
> +

I would add an ASSERT(IS_ALIGNED(address, len)) (and in
adjacent_write()) just in case, as otherwise the access could cross a
page boundary.

> +    fixmap_idx = adjacent_handle(entry, address, false);
> +
> +    if ( fixmap_idx == ADJACENT_DONT_HANDLE )
> +    {
> +        *pval = ~0UL;
> +        return X86EMUL_OKAY;
> +    }

FWIW, I find it safer to unconditionally init *pval = ~0UL at the
start of the function, and then the return here and in the default
switch statement case can avoid setting it.  It's less easy to return
without the variable being set.

> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        *pval = readb(hwaddr);
> +        break;
> +
> +    case 2:
> +        *pval = readw(hwaddr);
> +        break;
> +
> +    case 4:
> +        *pval = readl(hwaddr);
> +        break;
> +
> +    case 8:
> +        *pval = readq(hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        *pval = ~0UL;
> +        break;

We should likely move this to some kind of helpers, as it's now
exactly the same that's done in adjacent_{read,write}() in
vpci/msix.c (not that you should do it here, just a note).

> +    }
> +
> +    return X86EMUL_OKAY;
> +}
> +
> +static int adjacent_write(
> +    const struct msixtbl_entry *entry,
> +    paddr_t address, unsigned int len, uint64_t val)
> +{
> +    void __iomem *hwaddr;
> +    unsigned int fixmap_idx;
> +
> +    fixmap_idx = adjacent_handle(entry, address, true);
> +
> +    if ( fixmap_idx == ADJACENT_DONT_HANDLE )
> +        return X86EMUL_OKAY;
> +
> +    hwaddr = fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> +
> +    switch ( len )
> +    {
> +    case 1:
> +        writeb(val, hwaddr);
> +        break;
> +
> +    case 2:
> +        writew(val, hwaddr);
> +        break;
> +
> +    case 4:
> +        writel(val, hwaddr);
> +        break;
> +
> +    case 8:
> +        writeq(val, hwaddr);
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +
> +    return X86EMUL_OKAY;
> +}
> +
>  static int cf_check msixtbl_read(
>      const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
>      uint64_t *pval)
> @@ -222,7 +376,7 @@ static int cf_check msixtbl_read(
>      unsigned int nr_entry, index;
>      int r = X86EMUL_UNHANDLEABLE;
>  
> -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> +    if ( !IS_ALIGNED(address, len) )
>          return r;
>  
>      rcu_read_lock(&msixtbl_rcu_lock);
> @@ -230,6 +384,17 @@ static int cf_check msixtbl_read(
>      entry = msixtbl_find_entry(current, address);
>      if ( !entry )
>          goto out;
> +
> +    if ( address < entry->gtable ||
> +         address >= entry->gtable + entry->table_len )
> +    {
> +        r = adjacent_read(entry, address, len, pval);
> +        goto out;
> +    }
> +
> +    if ( len != 4 && len != 8 )
> +        goto out;
> +
>      offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
>  
>      if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
> @@ -291,6 +456,17 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
>      entry = msixtbl_find_entry(v, address);
>      if ( !entry )
>          goto out;
> +
> +    if ( address < entry->gtable ||
> +         address >= entry->gtable + entry->table_len )
> +    {
> +        r = adjacent_write(entry, address, len, val);
> +        goto out;
> +    }
> +
> +    if ( len != 4 && len != 8 )
> +        goto out;
> +
>      nr_entry = array_index_nospec(((address - entry->gtable) /
>                                     PCI_MSIX_ENTRY_SIZE),
>                                    MAX_MSIX_TABLE_ENTRIES);
> @@ -356,8 +532,8 @@ static int cf_check _msixtbl_write(
>      const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
>      uint64_t val)
>  {
> -    /* Ignore invalid length or unaligned writes. */
> -    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
> +    /* Ignore unaligned writes. */
> +    if ( !IS_ALIGNED(address, len) )
>          return X86EMUL_OKAY;
>  
>      /*
> @@ -374,16 +550,25 @@ static bool cf_check msixtbl_range(
>  {
>      struct vcpu *curr = current;
>      unsigned long addr = r->addr;
> -    const struct msi_desc *desc;
> +    const struct msixtbl_entry *entry;
> +    bool ret = false;
>  
>      ASSERT(r->type == IOREQ_TYPE_COPY);
>  
>      rcu_read_lock(&msixtbl_rcu_lock);
> -    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
> +    entry = msixtbl_find_entry(curr, addr);
> +    if ( entry )
> +    {
> +        if ( addr < entry->gtable || addr >= entry->gtable + entry->table_len )
> +            /* Possibly handle adjacent access. */
> +            ret = true;
> +        else
> +            ret = msixtbl_addr_to_desc(entry, addr) != NULL;
> +    }

You could probably put all this into a single condition:

if ( entry &&
      /* Adjacent access. */
     (addr < entry->gtable || addr >= entry->gtable + entry->table_len ||
      /* Otherwise check if there's a matching msi_desc. */
      msixtbl_addr_to_desc(entry, addr)) )
    ret = true;

That's IMO easier to read by setting ret once only.

>      rcu_read_unlock(&msixtbl_rcu_lock);
>  
> -    if ( desc )
> -        return 1;
> +    if ( ret )
> +        return ret;
>  
>      if ( r->state == STATE_IOREQ_READY && r->dir == IOREQ_WRITE )
>      {
> @@ -429,7 +614,7 @@ static bool cf_check msixtbl_range(
>          }
>      }
>  
> -    return 0;
> +    return false;
>  }
>  
>  static const struct hvm_io_ops msixtbl_mmio_ops = {
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index bcfdfd35345d..923b730d48b8 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -224,6 +224,9 @@ struct arch_msix {
>      } table, pba;
>      int table_refcnt[MAX_MSIX_TABLE_PAGES];
>      int table_idx[MAX_MSIX_TABLE_PAGES];
> +#define ADJ_IDX_FIRST 0
> +#define ADJ_IDX_LAST  1
> +    unsigned int adj_access_idx[2];
>      spinlock_t table_lock;
>      bool host_maskall, guest_maskall;
>      domid_t warned_domid;
> @@ -231,6 +234,8 @@ struct arch_msix {
>          uint8_t all;
>          struct {
>              bool maskall                   : 1;
> +            bool adjacent_not_initialized  : 1;

Not sure we need that, since we already warn of failure to map at
initialization time, not sure it's worth also printing another error
at access time.

> +            bool adjacent_pba              : 1;
>          };
>      } warned_kind;
>  };
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 42c793426da3..87190a88ed5d 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -913,6 +913,37 @@ static int msix_capability_init(struct pci_dev *dev,
>          list_add_tail(&entry->list, &dev->msi_list);
>          *desc = entry;
>      }
> +    else
> +    {
> +        /*
> +         * If the MSI-X table doesn't start at the page boundary, map the first page for
> +         * passthrough accesses.
> +         */
> +        if ( PAGE_OFFSET(table_paddr) )
> +        {
> +            int idx = msix_get_fixmap(msix, table_paddr, table_paddr);
> +
> +            if ( idx > 0 )
> +                msix->adj_access_idx[ADJ_IDX_FIRST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map first MSI-X table page: %d\n", idx);
> +        }
> +        /*
> +         * If the MSI-X table doesn't end on the page boundary, map the last page
> +         * for passthrough accesses.
> +         */
> +        if ( PAGE_OFFSET(table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE) )
> +        {
> +            uint64_t entry_paddr = table_paddr +
> +                (msix->nr_entries - 1) * PCI_MSIX_ENTRY_SIZE;
> +            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
> +
> +            if ( idx > 0 )
> +                msix->adj_access_idx[ADJ_IDX_LAST] = idx;
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);

Could you prefix the messages with the SBDF of the device please?
It's in the seg, bus, slot, func local variables AFAICT.

Thanks, Roger.

