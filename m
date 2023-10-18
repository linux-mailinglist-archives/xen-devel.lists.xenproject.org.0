Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2FE7CE037
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618654.962575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7gF-0008Lk-9p; Wed, 18 Oct 2023 14:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618654.962575; Wed, 18 Oct 2023 14:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7gF-0008J6-6c; Wed, 18 Oct 2023 14:37:51 +0000
Received: by outflank-mailman (input) for mailman id 618654;
 Wed, 18 Oct 2023 14:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0YN=GA=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1qt7gD-0008J0-On
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:37:49 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72f2681-6dc3-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:37:46 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.16.1/8.15.2) with ESMTPS id 39IEba14011073
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 18 Oct 2023 16:37:36 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 39IEbaNQ021605;
 Wed, 18 Oct 2023 16:37:36 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id CDA6C77C7; Wed, 18 Oct 2023 16:37:35 +0200 (MEST)
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
X-Inumbo-ID: e72f2681-6dc3-11ee-9b0e-b553b5be7939
Date: Wed, 18 Oct 2023 16:37:35 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Henry Wang <Henry.Wang@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Message-ID: <ZS_tr9SfDEStufs-@mail.soc.lip6.fr>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <9f5c0af3-44b6-e98a-2032-14185af265c9@suse.com>
 <ea9a1990-ecf4-43fb-af5b-b3aac0c71b2b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9a1990-ecf4-43fb-af5b-b3aac0c71b2b@amd.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Wed, 18 Oct 2023 16:37:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.3 on 132.227.60.2

On Wed, Oct 18, 2023 at 04:18:26PM +0200, Michal Orzel wrote:
> Hi,
> 
> On 18/10/2023 15:29, Jan Beulich wrote:
> > 
> > 
> > On 18.10.2023 12:38, Manuel Bouyer wrote:
> >> Hello,
> >> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
> >> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
> >> hardwired to 0), so console_input_domain() will never select that domain
> >> as input.
> >>
> >> The attached patch fixes it by translating 0 to the real domain id for
> >> pvshim, but there may be a better way to do this.
> > 
> > My primary observation with the patch is that it presumably won't build for
> > other than x86. There are also indentation and other style issues, no S-o-b,
> > and no description. But I wonder whether a different approach doesn't want
> > taking: Wouldn't it help if max_init_domid was 1 in the shim case, with no
> > need for any other changes?
> > 
> > Also Cc-ing Michal as the author of the (possibly) offending patch.
> What if we set max_init_domid in pvshim case to the value returned by get_initial_domain_id()
> in create_dom0()? The drawback is that we would waste some time in a loop if the value is large.

I considered this too, but max_init_domid is a constant on x86; it looked
like a more intrusive change.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

