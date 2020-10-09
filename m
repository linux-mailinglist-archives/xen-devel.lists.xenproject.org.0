Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76E288907
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 14:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4756.12517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQrhs-0008Df-PU; Fri, 09 Oct 2020 12:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4756.12517; Fri, 09 Oct 2020 12:41:08 +0000
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
	id 1kQrhs-0008DG-M4; Fri, 09 Oct 2020 12:41:08 +0000
Received: by outflank-mailman (input) for mailman id 4756;
 Fri, 09 Oct 2020 12:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdOq=DQ=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kQrhr-0008DB-FC
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 12:41:07 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edd1f79d-2d0e-4e90-8ea1-1308a8beb57c;
 Fri, 09 Oct 2020 12:41:05 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 099CewU6000464;
 Fri, 9 Oct 2020 14:40:58 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 099Cevf3016301;
 Fri, 9 Oct 2020 14:40:57 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 691C17216; Fri,  9 Oct 2020 14:40:57 +0200 (MEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zdOq=DQ=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
	id 1kQrhr-0008DB-FC
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 12:41:07 +0000
X-Inumbo-ID: edd1f79d-2d0e-4e90-8ea1-1308a8beb57c
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id edd1f79d-2d0e-4e90-8ea1-1308a8beb57c;
	Fri, 09 Oct 2020 12:41:05 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 099CewU6000464;
	Fri, 9 Oct 2020 14:40:58 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
	by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 099Cevf3016301;
	Fri, 9 Oct 2020 14:40:57 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
	id 691C17216; Fri,  9 Oct 2020 14:40:57 +0200 (MEST)
Date: Fri, 9 Oct 2020 14:40:57 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Jan Beulich <JBeulich@suse.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
Message-ID: <20201009124057.GC20248@mail.soc.lip6.fr>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009115301.19516-1-andrew.cooper3@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 09 Oct 2020 14:40:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Fri, Oct 09, 2020 at 12:53:01PM +0100, Andrew Cooper wrote:
> Despite appearing to be a deliberate design choice of early PV64, the
> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
> testability problem for Xen.  Furthermore, the behaviour is undocumented,
> bizarre, and inconsistent with related behaviour in Xen, and very liable
> introduce a security vulnerability into a PV guest if the author hasn't
> studied Xen's assembly code in detail.
> 
> There are two different bugs here.
> 
> 1) The current logic confuses the registered entrypoints, and may deliver a
>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>    entrypoint is registered.
> 
>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
> 
>    Xen would malfunction under these circumstances, if it were a PV guest.
>    Linux would as well, but PVOps has always registered both entrypoints and
>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).

What do you mean with «malfunction» ? A 64bits guest can run 32bit code
just fine, this is part of our daily regression tests.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

