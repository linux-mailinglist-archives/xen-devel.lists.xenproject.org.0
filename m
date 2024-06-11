Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5A903E5F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 16:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738465.1145234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH29W-0006qZ-5a; Tue, 11 Jun 2024 14:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738465.1145234; Tue, 11 Jun 2024 14:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH29W-0006oz-2W; Tue, 11 Jun 2024 14:07:10 +0000
Received: by outflank-mailman (input) for mailman id 738465;
 Tue, 11 Jun 2024 14:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sH29U-0006ot-Vq
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 14:07:08 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2b20c55-27fb-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 16:07:07 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-43ffbc0927fso6091861cf.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 07:07:07 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4403895aa9asm46747981cf.7.2024.06.11.07.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 07:07:04 -0700 (PDT)
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
X-Inumbo-ID: e2b20c55-27fb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718114826; x=1718719626; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZOGBocvRXPqBK+JTEw1kCb8PgDJgiulcODOBJvURkc=;
        b=eJLG9Y+ANVRYUdHO0ytWevqHRFPIYRgvsxsKxo26QOIEFMMx+fFq+QCcKf17dwjiAd
         xCmzJrnA/gKGP7GKyPTMbH1acVO4pxFlguYK/eCMgDmWfp43ShN902x5v2bwFLnrcBy7
         anuqoRMUN9U9rczc5Ai6vTRV+7LmIaIVbGmeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718114826; x=1718719626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZOGBocvRXPqBK+JTEw1kCb8PgDJgiulcODOBJvURkc=;
        b=oFsWNHvk2SuYGXuOnPDERy/CoedUa0hyElq2C8l/GMIaLvTeUSGDeiWP6WVVNDEnPZ
         k3iZbNfIf0lGmzhprUlEXSXOq1Or4b1TWT9Xrqi2FKBqPeqDzK6NsqoRULou9hK87RrZ
         qB441otCsMLGb/l87E0N2GEHcuXzixbivyipkJ9MhYHWzkzbROrPTq+gCNc+mTWjBSs7
         dw3gB4561ZeVS6x37a3hpo8hzKtWeMEGOAYHVUjgyQDXhegSM5ActkPHXtCzW/48a0nu
         GvKndQqlgXnA10G8dEsVBGUo6Yt9YZ9q99me3hw8c5inqV4u9znU8Dvhq7sCbdQMArGe
         a+rg==
X-Gm-Message-State: AOJu0Ywz12+PapN0ThZdmDd5cPI4/Rk5Yu5rae4LcGxJBcoZqVVW51Bv
	DIUg0vESjtyDCq7cSe4Q6q1B2Xj1px5g2OnelIMD2uHaUGJ8LQNsuOPaesrx5qA=
X-Google-Smtp-Source: AGHT+IFdT52hiGWCnKDohwsgytDwgakJoQgohxLrK+5taS/8BVKOy9DhWGN5kLemWU54U+CHrX3/fw==
X-Received: by 2002:ac8:5ac4:0:b0:441:2b3:595c with SMTP id d75a77b69052e-44102b35ab6mr51174531cf.30.1718114825336;
        Tue, 11 Jun 2024 07:07:05 -0700 (PDT)
Date: Tue, 11 Jun 2024 16:07:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZmhaB57Tc6BsknVO@macbook>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <ZmgpsZJ4afLd1Fc3@macbook>
 <Zmg3O7zvd9KBC1Fv@mail-itl>
 <ZmhJOjggtJiNccPo@macbook>
 <ZmhN_hNHp7WtyPyD@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmhN_hNHp7WtyPyD@mail-itl>

On Tue, Jun 11, 2024 at 03:15:42PM +0200, Marek Marczykowski-Górecki wrote:
> On Tue, Jun 11, 2024 at 02:55:22PM +0200, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 01:38:35PM +0200, Marek Marczykowski-Górecki wrote:
> > > On Tue, Jun 11, 2024 at 12:40:49PM +0200, Roger Pau Monné wrote:
> > > > On Wed, May 22, 2024 at 05:39:03PM +0200, Marek Marczykowski-Górecki wrote:
> > > > > +    if ( !entry )
> > > > > +    {
> > > > > +        /* iter == NULL marks it was a newly allocated entry */
> > > > > +        iter = NULL;
> > > > > +        entry = xzalloc(struct subpage_ro_range);
> > > > > +        if ( !entry )
> > > > > +            return -ENOMEM;
> > > > > +        entry->mfn = mfn;
> > > > > +    }
> > > > > +
> > > > > +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> > > > > +    {
> > > > > +        bool oldbit = __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRAN,
> > > > > +                                        entry->ro_elems);
> > > > > +        ASSERT(!oldbit);
> > > > > +    }
> > > > > +
> > > > > +    if ( !iter )
> > > > > +        list_add(&entry->list, &subpage_ro_ranges);
> > > > > +
> > > > > +    return iter ? 1 : 0;
> > > > > +}
> > > > > +
> > > > > +/* This needs subpage_ro_lock already taken */
> > > > > +static void __init subpage_mmio_ro_remove_page(
> > > > > +    mfn_t mfn,
> > > > > +    unsigned int offset_s,
> > > > > +    unsigned int offset_e)
> > > > > +{
> > > > > +    struct subpage_ro_range *entry = NULL, *iter;
> > > > > +    unsigned int i;
> > > > > +
> > > > > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > > > > +    {
> > > > > +        if ( mfn_eq(iter->mfn, mfn) )
> > > > > +        {
> > > > > +            entry = iter;
> > > > > +            break;
> > > > > +        }
> > > > > +    }
> > > > > +    if ( !entry )
> > > > > +        return;
> > > > > +
> > > > > +    for ( i = offset_s; i <= offset_e; i += MMIO_RO_SUBPAGE_GRAN )
> > > > > +        __clear_bit(i / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems);
> > > > > +
> > > > > +    if ( !bitmap_empty(entry->ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN) )
> > > > > +        return;
> > > > > +
> > > > > +    list_del(&entry->list);
> > > > > +    if ( entry->mapped )
> > > > > +        iounmap(entry->mapped);
> > > > > +    xfree(entry);
> > > > > +}
> > > > > +
> > > > > +int __init subpage_mmio_ro_add(
> > > > > +    paddr_t start,
> > > > > +    size_t size)
> > > > > +{
> > > > > +    mfn_t mfn_start = maddr_to_mfn(start);
> > > > > +    paddr_t end = start + size - 1;
> > > > > +    mfn_t mfn_end = maddr_to_mfn(end);
> > > > > +    unsigned int offset_end = 0;
> > > > > +    int rc;
> > > > > +    bool subpage_start, subpage_end;
> > > > > +
> > > > > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > > > > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > > > > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > > > > +        size = ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
> > > > > +
> > > > > +    if ( !size )
> > > > > +        return 0;
> > > > > +
> > > > > +    if ( mfn_eq(mfn_start, mfn_end) )
> > > > > +    {
> > > > > +        /* Both starting and ending parts handled at once */
> > > > > +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
> > > > > +        subpage_end = false;
> > > > 
> > > > Given the intended usage of this, don't we want to limit to only a
> > > > single page?  So that PFN_DOWN(start + size) == PFN_DOWN/(start), as
> > > > that would simplify the logic here?
> > > 
> > > I have considered that, but I haven't found anything in the spec
> > > mandating the XHCI DbC registers to not cross page boundary. Currently
> > > (on a system I test this on) they don't cross page boundary, but I don't
> > > want to assume extra constrains - to avoid issues like before (when
> > > on the older system I tested the DbC registers didn't shared page with
> > > other registers, but then they shared the page on a newer hardware).
> > 
> > Oh, from our conversation at XenSummit I got the impression debug registers
> > where always at the same position.  Looking at patch 2/2, it seems you
> > only need to block access to a single register.  Are registers in XHCI
> > size aligned?  As this would guarantee it doesn't cross a page
> > boundary (as long as the register is <= 4096 in size).
> 
> It's a couple of registers (one "extended capability"), see
> `struct dbc_reg` in xhci-dbc.c.

That looks to be an awful lot of individual registers...

> It's location is discovered at startup
> (device presents a linked-list of capabilities in one of its BARs).
> The spec talks only about alignment of individual registers, not the
> whole group...

Never mind then, I had the expectation we could get away with a single
page, but doesn't look to be the case.

I assume the spec doesn't mention anything about the BAR where the
capabilities reside having a size <= 4KiB.

> > > > > +            if ( !addr )
> > > > > +            {
> > > > > +                gprintk(XENLOG_ERR,
> > > > > +                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
> > > > > +                        mfn_x(mfn), offset);
> > > > > +                return;
> > > > > +            }
> > > > > +
> > > > > +            switch ( len )
> > > > > +            {
> > > > > +            case 1:
> > > > > +                writeb(*(const uint8_t*)data, addr);
> > > > > +                break;
> > > > > +            case 2:
> > > > > +                writew(*(const uint16_t*)data, addr);
> > > > > +                break;
> > > > > +            case 4:
> > > > > +                writel(*(const uint32_t*)data, addr);
> > > > > +                break;
> > > > > +            case 8:
> > > > > +                writeq(*(const uint64_t*)data, addr);
> > > > > +                break;
> > > > > +            default:
> > > > > +                /* mmio_ro_emulated_write() already validated the size */
> > > > > +                ASSERT_UNREACHABLE();
> > > > > +                goto write_ignored;
> > > > > +            }
> > > > > +            return;
> > > > > +        }
> > > > > +    }
> > > > > +    /* Do not print message for pages without any writable parts. */
> > > > > +}
> > > > > +
> > > > > +#ifdef CONFIG_HVM
> > > > > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> > > > > +{
> > > > > +    unsigned int offset = PAGE_OFFSET(gla);
> > > > > +    const struct subpage_ro_range *entry;
> > > > > +
> > > > > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > > > > +        if ( mfn_eq(entry->mfn, mfn) &&
> > > > > +             !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems) )
> > > > > +        {
> > > > > +            /*
> > > > > +             * We don't know the write size at this point yet, so it could be
> > > > > +             * an unaligned write, but accept it here anyway and deal with it
> > > > > +             * later.
> > > > > +             */
> > > > > +            return true;
> > > > 
> > > > For accesses that fall into the RO region, I think you need to accept
> > > > them here and just terminate them?  I see no point in propagating
> > > > them further in hvm_hap_nested_page_fault().
> > > 
> > > If write hits an R/O region on a page with some writable regions the
> > > handling should be the same as it would be just on the mmio_ro_ranges.
> > > This is what the patch does.
> > > There may be an opportunity to simplify mmio_ro_ranges handling
> > > somewhere, but I don't think it belongs to this patch.
> > 
> > Maybe worth adding a comment that the logic here intends to deal only
> > with the RW bits of a page that's otherwise RO, and that by not
> > handling the RO regions the intention is that those are dealt just
> > like fully RO pages.
> 
> I can extend the comment, but I assumed it's kinda implied already (if
> nothing else, by the function name).

Well, at this point we know the write is not going to make it to host
memory.  The only reason to not handle the access here is that we want
to unify the consequences it has for a guest writing to a RO address.

> > I guess there's some message printed when attempting to write to a RO
> > page that you would also like to print here?
> 
> If a HVM domain writes to an R/O area, it is crashed, so you will get a
> message. This applies to both full page R/O and partial R/O. PV doesn't
> go through subpage_mmio_write_accept().

Oh, crashing the domain is more strict than I was expecting.

Thanks, Roger.

