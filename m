Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F73B40160
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106378.1457080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQXB-000811-US; Tue, 02 Sep 2025 12:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106378.1457080; Tue, 02 Sep 2025 12:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQXB-0007yN-RE; Tue, 02 Sep 2025 12:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1106378;
 Tue, 02 Sep 2025 12:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utQXA-0007yD-TQ
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:54:48 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018e2ef1-87fc-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 14:54:47 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582CsjNn012955
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Sep 2025 14:54:46 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582CsjZU008739;
 Tue, 2 Sep 2025 14:54:45 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 2D703107F7; Tue,  2 Sep 2025 14:54:44 +0200 (CEST)
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
X-Inumbo-ID: 018e2ef1-87fc-11f0-8adc-4578a1afcccb
Date: Tue, 2 Sep 2025 14:54:44 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
        Juergen Gross <jgross@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLbpFH2jPRPEqjhe@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
 <7d0fc0eb-52a4-4478-8c1b-9a359513abdd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d0fc0eb-52a4-4478-8c1b-9a359513abdd@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 14:54:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

On Tue, Sep 02, 2025 at 02:45:04PM +0200, Jan Beulich wrote:
> >> What puzzles me is that:
> >>
> >> - %cr2 is 0, so probably the first fault wasn't a page fault
> > 
> > AFAIK it can't be as we're still in real mode
> 
> It's protected mode, but with paging still off.
> 
> >> - RIP is %ebx + 8, so maybe the code was just clobbered by the loop?
> >>
> >> Could it be the code has been moved to this location, or is about to
> >> be moved away afterwards?
> > 
> > No. RIP shouldn't end up there in any way. the assembly code is quite simple,
> > it's just a loop and I'm quite confident that we did enter the loop with
> > sane values
> 
> Yet Jürgen has a point - entry point and what is being modified are on the
> same page (and despite paging still being off, you writing page tables here
> makes pages a relevant unit). Considering
> - entry point @ 0x20e4d0
> - %ecx = 0xdfeb7
> - %ebx = 0x20e260
> the loop continuing a little further will overwrite the entry point code.
> And with the entry point not at an even (e.g page-aligned) address, other
> code (like the one here) could conceivably live immediately ahead of it.
> (Of course this overwriting may be intentional, but it looks suspicious in
> this context.)

Indeed. Now the exact same kernel is booting fine with Xen 4.18 (and also
the same bootstrap is used for domU PVH which works with Xen 4.20).
I guess something changed in the way Xen sets up the dom0 kernel.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

