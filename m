Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B971B40626
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106586.1457239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRf6-0000R8-Nq; Tue, 02 Sep 2025 14:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106586.1457239; Tue, 02 Sep 2025 14:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRf6-0000Ob-Ka; Tue, 02 Sep 2025 14:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1106586;
 Tue, 02 Sep 2025 14:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utRf4-0000OV-T3
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:07:02 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184df15f-8806-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 16:07:01 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582E6xxK012688
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Sep 2025 16:06:59 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582E6wXX006653;
 Tue, 2 Sep 2025 16:06:58 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 75957107F7; Tue,  2 Sep 2025 16:06:57 +0200 (CEST)
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
X-Inumbo-ID: 184df15f-8806-11f0-8dd7-1b34d833f44b
Date: Tue, 2 Sep 2025 16:06:57 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
        Juergen Gross <jgross@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLb6AcjEer83IrFC@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
 <aLb0I01WASpFremM@mail.soc.lip6.fr>
 <5953e9aa-4b56-4112-b952-7b4ff0ca2a62@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5953e9aa-4b56-4112-b952-7b4ff0ca2a62@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 16:06:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

On Tue, Sep 02, 2025 at 03:55:14PM +0200, Jan Beulich wrote:
> On 02.09.2025 15:41, Manuel Bouyer wrote:
> > On Tue, Sep 02, 2025 at 02:28:27PM +0200, Juergen Gross wrote:
> >>> What puzzles me is that:
> >>>
> >>> - %cr2 is 0, so probably the first fault wasn't a page fault
> >>> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
> >>>
> >>> Could it be the code has been moved to this location, or is about to
> >>> be moved away afterwards?
> >>
> >> And indeed: from the full boot log I can see:
> >>
> >> (XEN)     virt_base        = 0x0
> >> (XEN)     elf_paddr_offset = 0x0
> >> (XEN)     virt_offset      = 0x0
> >> (XEN)     virt_kstart      = 0x200000
> >> (XEN)     virt_kend        = 0x17bab90
> >> (XEN)     virt_entry       = 0x20e4d0
> >>
> >> So virt_kentry is very near to the RIP.
> > 
> > thanks to this, I think I found the issue:
> > with Xen 4.18, the kernel is started with ebx=17bb018; with 4.20 it's
> > 100018.
> > 
> > The bootstrap code assumes that the kernel is after the kernel, and the
> 
> DYM "start info is after the kernel" or some such, seeing that that's what
> %ebx is about?

yes, sorry

> 
> > kernel symbol table. That seems to be no longer true with Xen 4.20 and a
> > PVH dom0 (but probably still true in all other cases).
> > 
> > I can deal with that, but with the new layout how do I get the end of the
> > symbol table ?
> 
> You'll need to handle that internally, I expect, perhaps from properties of
> your (ELF) binary.

But I don't have access to the ELF headers from the kernel binary (nor do I
know which kernel was booted).

Hum, maybe a I can hardcode this info in some const of the binary with a
ld trick ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

