Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9BE8C2727
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 16:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719933.1122850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Ra0-0007qs-62; Fri, 10 May 2024 14:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719933.1122850; Fri, 10 May 2024 14:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Ra0-0007oj-2P; Fri, 10 May 2024 14:50:36 +0000
Received: by outflank-mailman (input) for mailman id 719933;
 Fri, 10 May 2024 14:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D8H=MN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s5RZy-0007oZ-Vz
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 14:50:35 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a701a6e4-0edc-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 16:50:33 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-792b934de39so165529585a.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 07:50:33 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf27519esm187109685a.1.2024.05.10.07.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 07:50:31 -0700 (PDT)
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
X-Inumbo-ID: a701a6e4-0edc-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715352632; x=1715957432; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcf9dyx3znNaO7fh0N6bAZdnABe5MNxooRIJMetNFKg=;
        b=TAHqfM6m7YO/pf9v9kKAnb4Tm6zfjkpyoucjb4w34nmbk/eSdmQtUre/db1oxgZCkx
         4S6B3yP/VFEez45+bKBga1iXFbA2W78DHYxrCZSx6OfLSH81w1g/VA/aHpxmY/1olpbb
         8pizSaJ1OeKTN4XoTdwaNGu4ipNNjBaXRqN44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715352632; x=1715957432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcf9dyx3znNaO7fh0N6bAZdnABe5MNxooRIJMetNFKg=;
        b=rF4qautRH6sqkkqzBQIS35PgP4L22vVbgtLh3LDZcFX01h0WcGmTvL7Nul4bY8OaBN
         Z/YArmECCvXSLlxPAGmcD99pmTlU5XGnBDSvcnx+sIijBMm+fC/8okAq370g7A8N0sBs
         D80nENSa5dVOXfPBDHbf1JCACW+x7C66fW1tw3AnWtdI1oq9jjIkLIj7BDQqOYQVWRji
         lulwl6MdjTyts9YEhEOuyhBOdxb9PcGuUL2mqTXlq9YPdFZOI95oMQZqi62AVFxwH62F
         Qe9vWPqVyuCdSrl+4lrWnOsg1AGyTXlUUQomvjA9DguR+ooCgtY3QhB5QxntJyTan797
         96hQ==
X-Gm-Message-State: AOJu0Yyfnjt9PtLrE6A7s1/aoW/N1RPQZm9NEBrJQlf07uLoTw3d07HU
	VAKZeCEHqo1pNgv/KfIShzV0mCUz50SstZR7wVgEonXZRcjJzWv8qJPgOzZKgdZAERM7q+J2lla
	4
X-Google-Smtp-Source: AGHT+IE9xdJTA0JhX1yaBpXCpcH+cOXsY5DXrU7ZmmhvxrZTsP5FSAbdwRTwJjbGRrHPSCNKZaWUlQ==
X-Received: by 2002:a05:620a:4958:b0:792:bada:c0a5 with SMTP id af79cd13be357-792c7574a97mr293716885a.16.1715352632197;
        Fri, 10 May 2024 07:50:32 -0700 (PDT)
Date: Fri, 10 May 2024 16:50:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <Zj40NvNqlJWFjcCb@macbook>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
 <fbe01c945d75409406ac0b02bc17d44f57a39ccf.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbe01c945d75409406ac0b02bc17d44f57a39ccf.1715313192.git-series.marmarek@invisiblethingslab.com>

On Fri, May 10, 2024 at 05:53:22AM +0200, Marek Marczykowski-Górecki wrote:
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

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one typo in a logged message, and one comment re the return type
of  adjacent_{read,write}().

> ---
> Changes in v8:
> - rename adjacent_handle to get_adjacent_idx
> - put SBDF at the start of error messages
> - use 0 for ADJACENT_DONT_HANDLE (it's FIX_RESERVED)
> - merge conditions in msixtbl_range into one "if"
> - add assert for address alignment
> - change back to setting pval to ~0UL at the start of adjacent_read
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
>  xen/arch/x86/hvm/vmsi.c        | 208 ++++++++++++++++++++++++++++++++--
>  xen/arch/x86/include/asm/msi.h |   5 +-
>  xen/arch/x86/msi.c             |  42 +++++++-
>  3 files changed, 245 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> index 999917983789..d506d6adaaf6 100644
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
> @@ -213,6 +221,157 @@ static struct msi_desc *msixtbl_addr_to_desc(
>      return NULL;
>  }
>  
> +/*
> + * Returns:
> + *  - 0 (FIX_RESERVED) if no handling should be done
> + *  - a fixmap idx to use for handling
> + */
> +static unsigned int get_adjacent_idx(
> +    const struct msixtbl_entry *entry, unsigned long addr, bool write)
> +{
> +    unsigned int adj_type;
> +    struct arch_msix *msix;
> +
> +    if ( !entry || !entry->pdev )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
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
> +        return 0;
> +    }
> +
> +    msix = entry->pdev->msix;
> +    if ( !msix )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    if ( !msix->adj_access_idx[adj_type] )
> +    {
> +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> +                             adjacent_not_initialized) )
> +            gprintk(XENLOG_WARNING,
> +                    "%pp: Page for adjacent(%d) MSI-X table access not initialized (addr %#lx, gtable %#lx))\n",
                                                                                                             ^ extra )
> +                    &entry->pdev->sbdf, adj_type, addr, entry->gtable);
> +        return 0;
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
> +                    "%pp: MSI-X table and PBA share a page, "
> +                    "discard write to adjacent memory (%#lx)\n",
> +                    &entry->pdev->sbdf, addr);
> +        return 0;
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
> +    ASSERT(IS_ALIGNED(address, len));
> +
> +    *pval = ~0UL;
> +
> +    fixmap_idx = get_adjacent_idx(entry, address, false);
> +
> +    if ( !fixmap_idx )
> +        return X86EMUL_OKAY;
> +
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
> +        break;
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
> +    ASSERT(IS_ALIGNED(address, len));
> +
> +    fixmap_idx = get_adjacent_idx(entry, address, true);
> +
> +    if ( !fixmap_idx )
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

Since adjacent_{read,write}() unconditionally return X86EMUL_OKAY now
they could as well just return void.

I'm fine with leaving it like this, unless the committer doesn't mind
adjusting on commit.  I should have requested earlier to make the
function return void.

Thanks, Roger.

