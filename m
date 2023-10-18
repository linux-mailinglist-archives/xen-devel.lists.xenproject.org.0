Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E817CDA2A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 13:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618512.962235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4bm-0004Re-Sq; Wed, 18 Oct 2023 11:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618512.962235; Wed, 18 Oct 2023 11:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4bm-0004Q0-Pz; Wed, 18 Oct 2023 11:21:02 +0000
Received: by outflank-mailman (input) for mailman id 618512;
 Wed, 18 Oct 2023 11:21:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0YN=GA=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1qt4bl-0004Pu-2C
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 11:21:01 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 699c27e7-6da8-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 13:20:59 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.16.1/8.15.2) with ESMTPS id 39IBKrVU009113
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 18 Oct 2023 13:20:54 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 39IBKrci012946;
 Wed, 18 Oct 2023 13:20:53 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id A4AB677C1; Wed, 18 Oct 2023 13:20:53 +0200 (MEST)
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
X-Inumbo-ID: 699c27e7-6da8-11ee-9b0e-b553b5be7939
Date: Wed, 18 Oct 2023 13:20:53 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Message-ID: <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Wed, 18 Oct 2023 13:20:54 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.3 on 132.227.60.2

On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
> > Hello,
> > With Xen 4.18, a PV domain running under pvshim doesn't get console input.
> > This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
> > hardwired to 0), so console_input_domain() will never select that domain
> > as input.
> > 
> > The attached patch fixes it by translating 0 to the real domain id for
> > pvshim, but there may be a better way to do this.
> > 
> 
> Thankyou for the report.
> 
> First, CC'ing Henry as 4.18 release manager.
> 
> There have been changes in how this works recently in 4.18, notably c/s
> c2581c58bec96.

Yes, it looks like this one introduced the problem.
Before this, we would switch console_rx to 1 without checking if
domain (console_rx - 1) exists, and console_rx == 1 is a special case
in __serial_rx()

> 
> However, it's not obvious whether this worked in 4.17 or not.  i.e.
> whether it's a regression in 4.18, or whether it's been broken since PV
> Shim was introduced.

I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

