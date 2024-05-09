Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F978C0C04
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 09:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719100.1121686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yJS-0002XD-V5; Thu, 09 May 2024 07:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719100.1121686; Thu, 09 May 2024 07:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4yJS-0002UJ-Rl; Thu, 09 May 2024 07:35:34 +0000
Received: by outflank-mailman (input) for mailman id 719100;
 Thu, 09 May 2024 07:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4yJR-0002UD-Fi
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 07:35:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a6f9cb-0dd6-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 09:35:31 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b79451153so4297515e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 00:35:31 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccfe1358sm14607715e9.45.2024.05.09.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 00:35:29 -0700 (PDT)
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
X-Inumbo-ID: b6a6f9cb-0dd6-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715240130; x=1715844930; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kjjrkBdl8ySQSSZfW6M9y7F7JJ7hmW6Y1b6Li6t3Dzg=;
        b=Dg6cx1Y6BEhOCFC2YZr79wsIqnoyr//TNb/gOPEBteyLtHv6Nwj7JJBAbaqC9CkxYs
         GBgVqZiYcXxbI7wePMJXOi4z6l++MWHheoTb4IdKltCv63QhVpb9ALKg5BHq9Gpj0b5i
         fQAW2eG3ZE0JG1PWnDlE8Qzpm8TKGKVizVt7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715240130; x=1715844930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjjrkBdl8ySQSSZfW6M9y7F7JJ7hmW6Y1b6Li6t3Dzg=;
        b=saj0Y1DafTlLI36hRhxafUI+5wM00GYGoKAFVnC0F5wQIutg+kt1pzS0LqAUcY9ryX
         JgwESYfKUCzxYBY9m69iicCyGKGap72ARviKYMUqnmIKYLOOlrmUiI69IRLeS5I++x5r
         Rzl+x6k7Sg6uYHZdCPA74vTfQdH72ZUUZs20mF7C9hijnJ+lw9Rvu3DYCuxmyl7bfX8T
         XeB1RUT+iGnNKrUR3nWXigeSWfa1UtZQkttrBSoqwn/soWNXkjILVa1svCDeGyLoxHEn
         4HSAxdJJ46o1ghC8UCxDv/UCJvh9wukPl0mixtCGEBHXFRGMySRZ1Rf30Sf5EOKX+bLl
         Fe/g==
X-Gm-Message-State: AOJu0YwP0nKFCWSsCpk/5eHPAkBlPX55HjTuu+BfELw3oqGhbAmtHwRJ
	yKhOjcmvE1LckGKXfn6/gubF6Rni+M3bW5nUGY3hK8vyxxPG4Hxwh9BEDX4vn3w=
X-Google-Smtp-Source: AGHT+IGHt+rp8xmgZw4sK/jaDjn2hrEhM/lH4cRlJvDoNZxnGGyfa40TooLd197IomPkfCLQPs2L0w==
X-Received: by 2002:a05:600c:4744:b0:41c:8123:f8a5 with SMTP id 5b1f17b1804b1-41f71bca3famr35272395e9.23.1715240130445;
        Thu, 09 May 2024 00:35:30 -0700 (PDT)
Date: Thu, 9 May 2024 09:35:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <Zjx8wf3m6AlQFbLT@macbook>
References: <cover.a422810661b997e9edf5f8bf5258a4422d9fa3ea.1715085837.git-series.marmarek@invisiblethingslab.com>
 <da180c8419882dc068512b69c6c7ad3ff3343fe0.1715085837.git-series.marmarek@invisiblethingslab.com>
 <ZjujzCnAfHye_eIp@macbook>
 <Zjv0Ea3hQyzFwpmc@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zjv0Ea3hQyzFwpmc@mail-itl>

On Wed, May 08, 2024 at 11:52:17PM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, May 08, 2024 at 06:09:48PM +0200, Roger Pau Monné wrote:
> > On Tue, May 07, 2024 at 02:44:02PM +0200, Marek Marczykowski-Górecki wrote:
> > > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > > on the same page as MSI-X table. Device model (especially one in
> > > stubdomain) cannot really handle those, as direct writes to that page is
> > > refused (page is on the mmio_ro_ranges list). Instead, extend
> > > msixtbl_mmio_ops to handle such accesses too.
> > > 
> > > Doing this, requires correlating read/write location with guest
> > > MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> > > it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> > > for PV would need to be done separately.
> > > 
> > > This will be also used to read Pending Bit Array, if it lives on the same
> > > page, making QEMU not needing /dev/mem access at all (especially helpful
> > > with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> > > map it to the guest directly.
> > > If PBA lives on the same page, discard writes and log a message.
> > > Technically, writes outside of PBA could be allowed, but at this moment
> > > the precise location of PBA isn't saved, and also no known device abuses
> > > the spec in this way (at least yet).
> > > 
> > > To access those registers, msixtbl_mmio_ops need the relevant page
> > > mapped. MSI handling already has infrastructure for that, using fixmap,
> > > so try to map first/last page of the MSI-X table (if necessary) and save
> > > their fixmap indexes. Note that msix_get_fixmap() does reference
> > > counting and reuses existing mapping, so just call it directly, even if
> > > the page was mapped before. Also, it uses a specific range of fixmap
> > > indexes which doesn't include 0, so use 0 as default ("not mapped")
> > > value - which simplifies code a bit.
> > > 
> > > Based on assumption that all MSI-X page accesses are handled by Xen, do
> > > not forward adjacent accesses to other hypothetical ioreq servers, even
> > > if the access wasn't handled for some reason (failure to map pages etc).
> > > Relevant places log a message about that already.
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > 
> > Thanks, just a couple of minor comments, I think the only relevant one
> > is that you can drop ADJACENT_DONT_HANDLE unless there's something
> > I'm missing.  The rest are mostly cosmetic, but if you have to respin
> > and agree with them might be worth addressing.
> > 
> > Sorry for giving this feedback so late in the process, I should have
> > attempted to review earlier versions.
> > 
> > > ---
> > > Changes in v7:
> > > - simplify logic based on assumption that all access to MSI-X pages are
> > >   handled by Xen (Roger)
> > > - move calling adjacent_handle() into adjacent_{read,write}() (Roger)
> > > - move range check into msixtbl_addr_to_desc() (Roger)
> > > - fix off-by-one when initializing adj_access_idx[ADJ_IDX_LAST] (Roger)
> > > - no longer distinguish between unhandled write due to PBA nearby and
> > >   other reasons
> > > - add missing break after ASSERT_UNREACHABLE (Jan)
> > > Changes in v6:
> > > - use MSIX_CHECK_WARN macro
> > > - extend assert on fixmap_idx
> > > - add break in default label, after ASSERT_UNREACHABLE(), and move
> > >   setting default there
> > > - style fixes
> > > Changes in v5:
> > > - style fixes
> > > - include GCC version in the commit message
> > > - warn only once (per domain, per device) about failed adjacent access
> > > Changes in v4:
> > > - drop same_page parameter of msixtbl_find_entry(), distinguish two
> > >   cases in relevant callers
> > > - rename adj_access_table_idx to adj_access_idx
> > > - code style fixes
> > > - drop alignment check in adjacent_{read,write}() - all callers already
> > >   have it earlier
> > > - delay mapping first/last MSI-X pages until preparing device for a
> > >   passthrough
> > > v3:
> > >  - merge handling into msixtbl_mmio_ops
> > >  - extend commit message
> > > v2:
> > >  - adjust commit message
> > >  - pass struct domain to msixtbl_page_handler_get_hwaddr()
> > >  - reduce local variables used only once
> > >  - log a warning if write is forbidden if MSI-X and PBA lives on the same
> > >    page
> > >  - do not passthrough unaligned accesses
> > >  - handle accesses both before and after MSI-X table
> > > ---
> > >  xen/arch/x86/hvm/vmsi.c        | 205 ++++++++++++++++++++++++++++++++--
> > >  xen/arch/x86/include/asm/msi.h |   5 +-
> > >  xen/arch/x86/msi.c             |  42 +++++++-
> > >  3 files changed, 242 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > > index 999917983789..f7b7b4998b5e 100644
> > > --- a/xen/arch/x86/hvm/vmsi.c
> > > +++ b/xen/arch/x86/hvm/vmsi.c
> > > @@ -180,6 +180,10 @@ static bool msixtbl_initialised(const struct domain *d)
> > >      return d->arch.hvm.msixtbl_list.next;
> > >  }
> > >  
> > > +/*
> > > + * Lookup an msixtbl_entry on the same page as given addr. It's up to the
> > > + * caller to check if address is strictly part of the table - if relevant.
> > > + */
> > >  static struct msixtbl_entry *msixtbl_find_entry(
> > >      struct vcpu *v, unsigned long addr)
> > >  {
> > > @@ -187,8 +191,8 @@ static struct msixtbl_entry *msixtbl_find_entry(
> > >      struct domain *d = v->domain;
> > >  
> > >      list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> > > -        if ( addr >= entry->gtable &&
> > > -             addr < entry->gtable + entry->table_len )
> > > +        if ( PFN_DOWN(addr) >= PFN_DOWN(entry->gtable) &&
> > > +             PFN_DOWN(addr) <= PFN_DOWN(entry->gtable + entry->table_len - 1) )
> > >              return entry;
> > >  
> > >      return NULL;
> > > @@ -203,6 +207,10 @@ static struct msi_desc *msixtbl_addr_to_desc(
> > >      if ( !entry || !entry->pdev )
> > >          return NULL;
> > >  
> > > +    if ( addr < entry->gtable ||
> > > +         addr >= entry->gtable + entry->table_len )
> > > +        return NULL;
> > > +
> > >      nr_entry = (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
> > >  
> > >      list_for_each_entry( desc, &entry->pdev->msi_list, list )
> > > @@ -213,6 +221,152 @@ static struct msi_desc *msixtbl_addr_to_desc(
> > >      return NULL;
> > >  }
> > >  
> > > +/*
> > > + * Returns:
> > > + *  - ADJACENT_DONT_HANDLE if no handling should be done
> > > + *  - a fixmap idx to use for handling
> > > + */
> > > +#define ADJACENT_DONT_HANDLE UINT_MAX
> > 
> > Isn't it fine to just return 0 to signal that the access is not
> > handled?
> > 
> > fixmap index 0 is reserved anyway (see FIX_RESERVED), so could be used
> > for this purpose and then you don't need to introduce
> > ADJACENT_DONT_HANDLE?
> 
> It was this way before in v2 and you asked me to not use 0 for this
> purpose...

Sorry, I think I didn't realize fixmap idx 0 was reserved, and hence
can be used to signal no idx.

> > > +
> > > +    if ( !msix->adj_access_idx[adj_type] )
> > > +    {
> > > +        if ( MSIX_CHECK_WARN(msix, entry->pdev->domain->domain_id,
> > > +                             adjacent_not_initialized) )
> > > +            gprintk(XENLOG_WARNING,
> > > +                    "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
> > 
> > Do you really need to log an error here?  There's an error already
> > printed in msix_capability_init() if the adjacent pages can't be
> > mapped.
> 
> IMO it's better to keep this message, otherwise it might be pretty hard
> to debug not working device - a message buried somewhere on startup
> might be hard to correlate with an issue much later.

Would you mind starting the entry with the SBDF then?

"%pp: MSI-X adjacent memory not mapped, dropping access to %#lx\n"

Or similar.

> > > +    fixmap_idx = adjacent_handle(entry, address, false);
> > > +
> > > +    if ( fixmap_idx == ADJACENT_DONT_HANDLE )
> > > +    {
> > > +        *pval = ~0UL;
> > > +        return X86EMUL_OKAY;
> > > +    }
> > 
> > FWIW, I find it safer to unconditionally init *pval = ~0UL at the
> > start of the function, and then the return here and in the default
> > switch statement case can avoid setting it.  It's less easy to return
> > without the variable being set.
> 
> It was this way in v5, but Jan asked me to move it to only relevant
> branch.

Hm, I see, we had this discussion with Jan in the past.  I'm fine this
way if you prefer, but I think it's less robust.

> > > @@ -374,16 +550,25 @@ static bool cf_check msixtbl_range(
> > >  {
> > >      struct vcpu *curr = current;
> > >      unsigned long addr = r->addr;
> > > -    const struct msi_desc *desc;
> > > +    const struct msixtbl_entry *entry;
> > > +    bool ret = false;
> > >  
> > >      ASSERT(r->type == IOREQ_TYPE_COPY);
> > >  
> > >      rcu_read_lock(&msixtbl_rcu_lock);
> > > -    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
> > > +    entry = msixtbl_find_entry(curr, addr);
> > > +    if ( entry )
> > > +    {
> > > +        if ( addr < entry->gtable || addr >= entry->gtable + entry->table_len )
> > > +            /* Possibly handle adjacent access. */
> > > +            ret = true;
> > > +        else
> > > +            ret = msixtbl_addr_to_desc(entry, addr) != NULL;
> > > +    }
> > 
> > You could probably put all this into a single condition:
> > 
> > if ( entry &&
> >       /* Adjacent access. */
> >      (addr < entry->gtable || addr >= entry->gtable + entry->table_len ||
> >       /* Otherwise check if there's a matching msi_desc. */
> >       msixtbl_addr_to_desc(entry, addr)) )
> >     ret = true;
> > 
> > That's IMO easier to read by setting ret once only.
> 
> Is multi-line "if" mixed with comments really easier to follow?

It is for me, because ret gets set in a single place, it's a single
branch to analyze and reduces indentation.

Ultimately it's a question of taste, so would leave that up to you as
the author of the code.  I also dislike the 'ret =
msixtbl_addr_to_desc(entry, addr) != NULL' expression, but again it's
a question of taste.

Thanks, Roger.

