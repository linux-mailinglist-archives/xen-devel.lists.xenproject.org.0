Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B228F578
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7468.19530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4nQ-00012r-G2; Thu, 15 Oct 2020 15:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7468.19530; Thu, 15 Oct 2020 15:04:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4nQ-00012Q-CO; Thu, 15 Oct 2020 15:04:00 +0000
Received: by outflank-mailman (input) for mailman id 7468;
 Thu, 15 Oct 2020 15:03:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT4nO-00012I-NH
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:03:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7ea9203-85da-498a-a4fe-86851bc1865d;
 Thu, 15 Oct 2020 15:03:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT4nO-00012I-NH
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:03:58 +0000
X-Inumbo-ID: b7ea9203-85da-498a-a4fe-86851bc1865d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7ea9203-85da-498a-a4fe-86851bc1865d;
	Thu, 15 Oct 2020 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602774237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AmVOV8edVjCau6Ds8dmXzC4qa5h7gP2n9yy/6GpM2t0=;
  b=K2bU8O/Zei2+PtRwS8I7V+1h0Ep7f0+lh19wriJL8qbQ8uONtKa/TCFp
   5l16qaz+IudWxMSyflf4aTlZ0QjIm+ZmDS5z6m6lgEPbJ0To9hyCzdgyG
   c6Z7A6WqsgCDZTbSkBdwi5+YifabMK9Vvm5USbyw3IbKl+iqDXlVkI2TM
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MRlUvHr24y02n57VARV8YpZ941IgLFI4mLFLOVFgb3OsZHBBEucJvbb4MbXdyGE5/OqaUPmA9g
 n3C4G2+iV/wNRuIO0Va0WiNwWC8eLvBH+i7yRrktub9UkCBnHiMKBSehgJnQTAT9T329VkYJ99
 WbqzP8Er6NMZ6A2vY28pb7djUqot+h1pyoQk523K4x8yCCB+QwdqhsP7aX2YzTgKBXDA7DgwS7
 dp3jMko5dRTF2ziY698mYNw+BtcOpoVpmP9p3xQ9Bw9YnISHnKmrQf2xZIZL002WHMb4tCr73C
 Fys=
X-SBRS: 2.5
X-MesageID: 29336058
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29336058"
Date: Thu, 15 Oct 2020 17:03:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
Message-ID: <20201015150326.GE68032@Air-de-Roger>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 15, 2020 at 09:00:09AM +0200, Jan Beulich wrote:
> On 14.10.2020 18:27, Jason Andryuk wrote:
> > On Wed, Oct 14, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 14.10.2020 17:31, Jason Andryuk wrote:
> >>> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
> >>> kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
> >>> virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
> >>> and fail the check against the virt address range.
> > 
> > Oh, these should be CONFIG_XEN_PVH=y and CONFIG_XEN_PV=n
> > 
> >>> Change the code to only check virt_entry against the virtual address
> >>> range if it was set upon entry to the function.
> >>
> >> Not checking at all seems wrong to me. The ELF spec anyway says
> >> "virtual address", so an out of bounds value is at least suspicious.
> >>
> >>> Maybe the overwriting of virt_entry could be removed, but I don't know
> >>> if there would be unintended consequences where (old?) kernels don't
> >>> have an elfnote, but do have an in-range e_entry?  The failing kernel I
> >>> just looked at has an e_entry of 0x1000000.
> >>
> >> And if you dropped the overwriting, what entry point would we use
> >> in the absence of an ELF note?
> > 
> > elf_xen_note_check currently has:
> > 
> >     /* PVH only requires one ELF note to be set */
> >     if ( parms->phys_entry != UNSET_ADDR32 )
> >     {
> >         elf_msg(elf, "ELF: Found PVH image\n");
> >         return 0;
> >     }
> > 
> >> I'd rather put up the option of adjusting the entry (or the check),
> >> if it looks like a valid physical address.
> > 
> > The function doesn't know if the image will be booted PV or PVH, so I
> > guess we do all the checks, but use 'parms->phys_entry != UNSET_ADDR32
> > && parms->virt_entry == UNSET_ADDR' to conditionally skip checking
> > virt?
> 
> Like Jürgen, the purpose of the patch hadn't become clear to me
> from reading the description. As I understand it now, we're currently
> refusing to boot such a kernel for no reason. If that's correct,
> perhaps you could say so in the description in a more direct way?
> 
> As far as actual code adjustments go - how much of
> elf_xen_addr_calc_check() is actually applicable when booting PVH?

I think the only relevant check for PVH would be the symtab loading
(XEN_ELFNOTE_BSD_SYMTAB).

> And why is there no bounds check of ->phys_entry paralleling the
> ->virt_entry one?
> 
> On the whole, as long as we don't know what mode we're planning to
> boot in, we can't skip any checks, as the mere presence of
> XEN_ELFNOTE_PHYS32_ENTRY doesn't mean that's also what gets used.
> Therefore simply bypassing any of the checks is not an option. In
> particular what you suggest would lead to failure to check
> e_entry-derived ->virt_entry when the PVH-specific note is
> present but we're booting in PV mode. For now I don't see how to
> address this without making the function aware of the intended
> booting mode.

That seems the only viable approach. Maybe an intended mode field could
be added to elf_dom_parms in order to signal this?

Thanks, Roger.

