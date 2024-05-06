Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DC8BC879
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 09:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717265.1119293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3svc-00059R-M4; Mon, 06 May 2024 07:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717265.1119293; Mon, 06 May 2024 07:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3svc-00057o-J3; Mon, 06 May 2024 07:38:28 +0000
Received: by outflank-mailman (input) for mailman id 717265;
 Mon, 06 May 2024 07:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3svb-00057i-Cs
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 07:38:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e02e2ae-0b7b-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 09:38:23 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so17215005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 00:38:23 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b0041bf7da4200sm15141161wmq.33.2024.05.06.00.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 00:38:22 -0700 (PDT)
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
X-Inumbo-ID: 9e02e2ae-0b7b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714981103; x=1715585903; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjYCOSdMFmFeFYv00bvqUGHB4qSVO8Xv+3DtlFur9B0=;
        b=k0jEjrbK1U+2hKHOhoyoG4zqakLalryJqSIlr1QFei57lhBQQyunQFPfdvPyXYbq8f
         BMlyUtVH2mweuvxrHfZECYKRHmMMPXE1XDjjqrybw32E+0xxyVwtIrPDcnfkdxrjg17G
         A28fBdAKZc2cSoHFGtZPvniyD5zrAicVvxRUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714981103; x=1715585903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjYCOSdMFmFeFYv00bvqUGHB4qSVO8Xv+3DtlFur9B0=;
        b=cj4cIM+UrW6kfVb6msqGB2VHnL0w8rzy0DEGP2Y3UzKl8DPZxABjpZFnUvyLIRsRh1
         nAAsn4oRhWkGIp9upTov0+32npUT2HpHYBV2By6bEGx0Alk0GuNqQBlri4P544aTCe8O
         SeVuNE07qgjuu9iTwacfvraBlx8k+04fO6uDDSoaIpoxd7im2Ir0rOcEjohB+4XrzKQF
         D/L80nDDc89+YcqTtS0ow1AQPhSjDulc0dSKXm0X/c/tqaeVlFF9PlRFb7dsNKUdaDmc
         O9Iz52x3Zd/QKIabaXPCpLXkhPtUHf8vT2/0kIOHRiEEINCwFAWgC/yhhYleM4NBVdGP
         qakA==
X-Gm-Message-State: AOJu0YzxNBUPCwjePeZlYqkurhu/aGCrktGiqH0hC/66p3uf+CN4KBRm
	xr2ufsm5kC3pVI/34ridG0PJQbqC9CjeQsdcf1IELBdp9vuL9a1nM5NGESQH/1Y=
X-Google-Smtp-Source: AGHT+IGYx3Dd8wZbnJ3Oizz+3OPNRKZZjqh9SO2K+wrAoSLUgKPZHikdK3L0k/dpjUbsnVCAUIG55g==
X-Received: by 2002:a05:600c:450e:b0:41b:edf4:4071 with SMTP id t14-20020a05600c450e00b0041bedf44071mr9417881wmo.35.1714981102682;
        Mon, 06 May 2024 00:38:22 -0700 (PDT)
Date: Mon, 6 May 2024 09:38:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <ZjiI7cLtiJTzc1El@macbook>
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
 <a9b04e2224e97a27a127a003e8ccf5edfd4922c7.1714154036.git-series.marmarek@invisiblethingslab.com>
 <ZjShYhUvx694rPEp@macbook>
 <ZjWFzEdJ9wiz2GMI@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjWFzEdJ9wiz2GMI@mail-itl>

On Sat, May 04, 2024 at 02:48:12AM +0200, Marek Marczykowski-Górecki wrote:
> On Fri, May 03, 2024 at 10:33:38AM +0200, Roger Pau Monné wrote:
> > On Fri, Apr 26, 2024 at 07:54:00PM +0200, Marek Marczykowski-Górecki wrote:
> > > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > > on the same page as MSI-X table. Device model (especially one in
> > > stubdomain) cannot really handle those, as direct writes to that page is
> > > refused (page is on the mmio_ro_ranges list). Instead, extend
> > > msixtbl_mmio_ops to handle such accesses too.
> > > 
> > > Doing this, requires correlating read/write location with guest
> > > of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> >   ^ extra 'of'?
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
> > > GCC 12.2.1 gets confused about 'desc' variable:
> > > 
> > >     arch/x86/hvm/vmsi.c: In function ‘msixtbl_range’:
> > >     arch/x86/hvm/vmsi.c:553:8: error: ‘desc’ may be used uninitialized [-Werror=maybe-uninitialized]
> > >       553 |     if ( desc )
> > >           |        ^
> > >     arch/x86/hvm/vmsi.c:537:28: note: ‘desc’ was declared here
> > >       537 |     const struct msi_desc *desc;
> > >           |                            ^~~~
> > > 
> > > It's conditional initialization is actually correct (in the case where
> > > it isn't initialized, function returns early), but to avoid
> > > build failure initialize it explicitly to NULL anyway.
> > > 
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
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
> > >  xen/arch/x86/hvm/vmsi.c        | 200 ++++++++++++++++++++++++++++++++--
> > >  xen/arch/x86/include/asm/msi.h |   5 +-
> > >  xen/arch/x86/msi.c             |  41 +++++++-
> > >  3 files changed, 236 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> > > index 999917983789..230e3a5dee3f 100644
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
> > > @@ -213,6 +217,138 @@ static struct msi_desc *msixtbl_addr_to_desc(
> > >      return NULL;
> > >  }
> > >  
> > > +/*
> > > + * Returns:
> > > + *  - ADJACENT_DONT_HANDLE if no handling should be done
> > > + *  - ADJACENT_DISCARD_WRITE if write should be discarded
> > > + *  - a fixmap idx to use for handling
> > > + */
> > > +#define ADJACENT_DONT_HANDLE UINT_MAX
> > > +#define ADJACENT_DISCARD_WRITE (UINT_MAX - 1)
> > 
> > I think this could be simpler, there's no need to signal with so fine
> > grained detail about the action to be performed.
> > 
> > Any adjacent access to the MSI-X table should be handled by the logic
> > you are adding, so anything that falls in those ranges should
> > terminate here.
> > 
> > adjacent_handle() should IMO just return whether the access is
> > replayed against the hardware, or if it's just dropped.
> 
> The distinction here is to return X86EMUL_OKAY in case of adjacent write
> that is ignored because PBA is somewhere near, but X86EMUL_UNHANDLABLE
> for other/error cases (like fixmap indices not initialized).
> But maybe this distinction doesn't make sense and X86EMUL_UNHANDLABLE is
> okay in either case? 

That's my suggestion, yes.  I don't think it's expected for ioreqs to
handle those adjacent accesses, the more with the limitation that some
of them might not even have access to such region in the first place.

> > > @@ -220,9 +356,10 @@ static int cf_check msixtbl_read(
> > >      unsigned long offset;
> > >      struct msixtbl_entry *entry;
> > >      unsigned int nr_entry, index;
> > > +    unsigned int adjacent_fixmap;
> > >      int r = X86EMUL_UNHANDLEABLE;
> > >  
> > > -    if ( (len != 4 && len != 8) || (address & (len - 1)) )
> > > +    if ( !IS_ALIGNED(address, len) )
> > >          return r;
> > >  
> > >      rcu_read_lock(&msixtbl_rcu_lock);
> > > @@ -230,6 +367,21 @@ static int cf_check msixtbl_read(
> > >      entry = msixtbl_find_entry(current, address);
> > >      if ( !entry )
> > >          goto out;
> > > +
> > > +    adjacent_fixmap = adjacent_handle(entry, address, false);
> > 
> > This seems overly complicated, but is possible I'm missing some logic.
> > 
> > IMO it would seem way less convoluted to simply do:
> > 
> > entry = msixtbl_find_entry(current, address);
> > if ( !entry )
> >     goto out;
> > 
> > if ( address < entry->gtable ||
> >      address >= entry->gtable + entry->table_len )
> > {
> >     adjacent_read(...);
> >     goto out;
> > }
> > 
> > And put all the logic in adjacent_{read,write}() directly rather than
> > having both adjacent_{read,write}() plus adjacent_handle() calls here?
> > 
> > If the access doesn't fall between the boundaries of the MSI-X table
> > it's either going to be a handled adjacent access, or it's going to be
> > discarded.
> 
> Discarded - should it return X86EMUL_OKAY in that case? Currently it
> returns X86EMUL_UNHANDLABLE in case adjacent access isn't handled (for
> any reason) either.

Yes, I think we want to terminate all adjacent accesses here - there's
so far no need to forward them to any other handler, and that would
simplify the logic.  I don't see an use case for handling those
elsewhere, but if that ever arises we can always add the support them.
There's no need to cater for a non-existent use-case that just makes
the code more complicated.

> > > +    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
> > > +    {
> > > +        r = adjacent_read(adjacent_fixmap, address, len, pval);
> > > +        goto out;
> > > +    }
> > > +
> > > +    if ( address < entry->gtable ||
> > > +         address >= entry->gtable + entry->table_len )
> > > +        goto out;
> > > +
> > > +    if ( len != 4 && len != 8 )
> > > +        goto out;
> > > +
> > >      offset = address & (PCI_MSIX_ENTRY_SIZE - 1);
> > >  
> > >      if ( offset != PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET )
> > > @@ -282,6 +434,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
> > >      int r = X86EMUL_UNHANDLEABLE;
> > >      unsigned long flags;
> > >      struct irq_desc *desc;
> > > +    unsigned int adjacent_fixmap;
> > >  
> > >      if ( !IS_ALIGNED(address, len) )
> > >          return X86EMUL_OKAY;
> > > @@ -291,6 +444,21 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
> > >      entry = msixtbl_find_entry(v, address);
> > >      if ( !entry )
> > >          goto out;
> > > +
> > > +    adjacent_fixmap = adjacent_handle(entry, address, true);
> > > +    if ( adjacent_fixmap != ADJACENT_DONT_HANDLE )
> > > +    {
> > > +        r = adjacent_write(adjacent_fixmap, address, len, val);
> > > +        goto out;
> > > +    }
> > > +
> > > +    if ( address < entry->gtable ||
> > > +         address >= entry->gtable + entry->table_len )
> > > +        goto out;
> > > +
> > > +    if ( len != 4 && len != 8 )
> > > +        goto out;
> > > +
> > >      nr_entry = array_index_nospec(((address - entry->gtable) /
> > >                                     PCI_MSIX_ENTRY_SIZE),
> > >                                    MAX_MSIX_TABLE_ENTRIES);
> > > @@ -356,8 +524,8 @@ static int cf_check _msixtbl_write(
> > >      const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
> > >      uint64_t val)
> > >  {
> > > -    /* Ignore invalid length or unaligned writes. */
> > > -    if ( (len != 4 && len != 8) || !IS_ALIGNED(address, len) )
> > > +    /* Ignore unaligned writes. */
> > > +    if ( !IS_ALIGNED(address, len) )
> > >          return X86EMUL_OKAY;
> > >  
> > >      /*
> > > @@ -374,14 +542,22 @@ static bool cf_check msixtbl_range(
> > >  {
> > >      struct vcpu *curr = current;
> > >      unsigned long addr = r->addr;
> > > -    const struct msi_desc *desc;
> > > +    const struct msixtbl_entry *entry;
> > > +    const struct msi_desc *desc = NULL;
> > > +    unsigned int adjacent_fixmap;
> > >  
> > >      ASSERT(r->type == IOREQ_TYPE_COPY);
> > >  
> > >      rcu_read_lock(&msixtbl_rcu_lock);
> > > -    desc = msixtbl_addr_to_desc(msixtbl_find_entry(curr, addr), addr);
> > > +    entry = msixtbl_find_entry(curr, addr);
> > > +    adjacent_fixmap = adjacent_handle(entry, addr, false);
> > > +    if ( adjacent_fixmap == ADJACENT_DONT_HANDLE )
> > > +        desc = msixtbl_addr_to_desc(entry, addr);
> > 
> > I'm not sure you need adjacent_handle() here, I would think that any
> > address adjacent to the MSI-X table Xen would want to handle
> > unconditionally, and hence msixtbl_range() should return true:
> 
> I put it here to not duplicate a set of checks for adjacent access. It
> isn't only about the range, but also few other case (like if fixmap
> indices are set).

Right, but as discussed above, we likely want to terminate those
accesses here anyway, since there's no other handler that cares about
MSI-X table adjacent regions.

> > entry = msixtbl_find_entry(curr, addr);
> > if ( !entry )
> >     return 0;
> > 
> > if ( addr < entry->gtable || addr >= entry->gtable + entry->table_len )
> >     /* Possibly handle adjacent access. */
> >     return 1;
> > 
> > desc = msixtbl_find_entry(curr, addr);
> > ...
> > 
> > (Missing the _unlock calls in the chunk above)
> > 
> > There's no other processing that can happen for an adjacent access
> > unless it's are handled here.  Otherwise such accesses will be
> > discarded anyway?  Hence better short-circuit the MMIO handler search
> > earlier.
> 
> Can't there be some ioreq server that could theoretically handle them?

I don't think any of the current ioreq implementations care about
those ATM, and with your work to make QEMU not depend on /dev/mem
it's even more unlikely that we might gain such in the future.

As said above, I wouldn't mind allowing such forwarding if it made the
code easier, but seeing how it makes the logic more complicated I
think it's best to terminate all MSI-X table adjacent accesses here.

Thanks, Roger.

