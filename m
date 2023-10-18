Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD77CDDFF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 15:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618589.962414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt72F-0000qQ-Pw; Wed, 18 Oct 2023 13:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618589.962414; Wed, 18 Oct 2023 13:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt72F-0000nf-N5; Wed, 18 Oct 2023 13:56:31 +0000
Received: by outflank-mailman (input) for mailman id 618589;
 Wed, 18 Oct 2023 13:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0YN=GA=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1qt72E-0000nZ-Dr
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 13:56:30 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22dc5979-6dbe-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 15:56:29 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.16.1/8.15.2) with ESMTPS id 39IDuPfO014255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 18 Oct 2023 15:56:25 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 39IDuPqG027538;
 Wed, 18 Oct 2023 15:56:25 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 203EE77C1; Wed, 18 Oct 2023 15:56:25 +0200 (MEST)
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
X-Inumbo-ID: 22dc5979-6dbe-11ee-98d4-6d05b1d4d9a1
Date: Wed, 18 Oct 2023 15:56:25 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Message-ID: <ZS_kCeRXXFcP8NxQ@mail.soc.lip6.fr>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
 <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
 <b4f888eb-f49c-c77e-93ea-6d41041d39e5@suse.com>
 <ZS_fZg7AkBItN8fM@mail.soc.lip6.fr>
 <bc203e52-73a8-bc23-6106-15c925c80bc8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc203e52-73a8-bc23-6106-15c925c80bc8@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Wed, 18 Oct 2023 15:56:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.3 on 132.227.60.2

On Wed, Oct 18, 2023 at 03:51:54PM +0200, Jan Beulich wrote:
> On 18.10.2023 15:36, Manuel Bouyer wrote:
> > On Wed, Oct 18, 2023 at 03:24:22PM +0200, Jan Beulich wrote:
> >> On 18.10.2023 13:20, Manuel Bouyer wrote:
> >>> On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
> >>>> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
> >>>>> Hello,
> >>>>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
> >>>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
> >>>>> hardwired to 0), so console_input_domain() will never select that domain
> >>>>> as input.
> >>>>>
> >>>>> The attached patch fixes it by translating 0 to the real domain id for
> >>>>> pvshim, but there may be a better way to do this.
> >>>>>
> >>>>
> >>>> Thankyou for the report.
> >>>>
> >>>> First, CC'ing Henry as 4.18 release manager.
> >>>>
> >>>> There have been changes in how this works recently in 4.18, notably c/s
> >>>> c2581c58bec96.
> >>>
> >>> Yes, it looks like this one introduced the problem.
> >>> Before this, we would switch console_rx to 1 without checking if
> >>> domain (console_rx - 1) exists, and console_rx == 1 is a special case
> >>> in __serial_rx()
> >>>
> >>>>
> >>>> However, it's not obvious whether this worked in 4.17 or not.  i.e.
> >>>> whether it's a regression in 4.18, or whether it's been broken since PV
> >>>> Shim was introduced.
> >>>
> >>> I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15
> >>
> >> >From looking at the code, it doesn't look like it would: There
> >> switch_serial_input() toggles console_rx between 0 and 1 afaict, and
> >> console_input_domain() handles value 0 as "Xen" (like in 4.18), while
> >> otherwise it calls rcu_lock_domain_by_id(console_rx - 1) (i.e. trying
> >> to get hold of Dom0's domain structure, not Dom1's).
> > 
> > Well, I have a 4.15.5 installation in production and I can tell you that
> > with PV+PVSHIM, the console is working, for sure.
> > 
> > AFAIK console_input_domain() is called only on ARM, from
> > vpl011_write_data_xen(). It's never called for x86.
> 
> Oh, indeed. I took your patch touching the function as meaning it's used
> on x86. This then means my earlier suggestion won't work, as we need
> console_rx to have the value 1 for input to be accepted from Dom1. Which
> in turn means your change to switch_serial_input(), suitably cleaned up,
> is then likely the best we can do, despite me not really liking the shim
> special casing.
> 
> As to cleaning up - besides the build, indentation, and style issues I
> think you want to drop the "&& pv_shim" part of the condition (as
> get_initial_domain_id() takes care of that already), and ideally you'd
> also move the new "domid" variable into the more narrow scope. If you
> don't feel like providing a proper (updated) patch, I'm happy to take
> over, but to retain indication of your initial work I'd need you to
> permit me to add your S-o-b (alongside mine).

No problem, please do !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

