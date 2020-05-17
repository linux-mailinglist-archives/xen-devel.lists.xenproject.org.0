Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CD81D66E7
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 11:32:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaFdU-0002PU-VJ; Sun, 17 May 2020 09:31:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqg2=67=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jaFdT-0002PP-En
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 09:31:07 +0000
X-Inumbo-ID: 21754fe2-9821-11ea-b9cf-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21754fe2-9821-11ea-b9cf-bc764e2007e4;
 Sun, 17 May 2020 09:31:05 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04H9UxNV023817;
 Sun, 17 May 2020 11:30:59 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 28AED2810; Sun, 17 May 2020 11:30:59 +0200 (CEST)
Date: Sun, 17 May 2020 11:30:59 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200517093059.GD1820@antioche.eu.org>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [151.127.5.145]);
 Sun, 17 May 2020 11:30:59 +0200 (MEST)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 16, 2020 at 05:18:45PM +0100, Andrew Cooper wrote:
> On 15/05/2020 22:53, Manuel Bouyer wrote:
> > On Fri, May 15, 2020 at 10:38:13PM +0100, Andrew Cooper wrote:
> >>> [...]
> >>> Does it help ?
> >> Yes and no.  This is collateral damage of earlier bug.
> >>
> >> What failed was xen_init_fv()'s
> >>
> >>     shared_page = xc_map_foreign_range(xc_handle, domid, XC_PAGE_SIZE,
> >>                                        PROT_READ|PROT_WRITE, ioreq_pfn);
> >>     if (shared_page == NULL) {
> >>         fprintf(logfile, "map shared IO page returned error %d\n", errno);
> >>         exit(-1);
> >>     }
> >>
> >> because we've ended up with a non-NULL pointer with no mapping behind
> >> it, hence the SIGSEGV for the first time we try to use the pointer.
> >>
> >> Whatever logic is behind xc_map_foreign_range() should have returned
> >> NULL or a real mapping.
> > What's strange is that the mapping is validated, by mapping it in
> > the dom0 kernel space. But when we try to remap in in the process's
> > space, it fails.
> 
> Hmm - this sounds like a kernel bug I'm afraid.

no I don't think it is. It works with Xen 4.11, and it works with 4.13 for
PV/PVH domUs. Maybe there's a missing flag in the PTE of some sort that is
mandatory for 4.13 but not 4.11 for userland PTE but it doens't look obvious.

The difference could be that the kernel page tables are active when
mapping the foreing page in the dom0's kernel space, but the
user process page table it not (obviously, as we're in the kernel
when doing the mapping).

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

