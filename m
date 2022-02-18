Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B44BC2C7
	for <lists+xen-devel@lfdr.de>; Sat, 19 Feb 2022 00:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275637.471597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCQl-0006ao-Cu; Fri, 18 Feb 2022 23:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275637.471597; Fri, 18 Feb 2022 23:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nLCQl-0006Z1-9x; Fri, 18 Feb 2022 23:12:51 +0000
Received: by outflank-mailman (input) for mailman id 275637;
 Fri, 18 Feb 2022 23:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0EK=TB=wind.enjellic.com=greg@srs-se1.protection.inumbo.net>)
 id 1nLCQj-0006Yv-BD
 for xen-devel@lists.xen.org; Fri, 18 Feb 2022 23:12:49 +0000
Received: from wind.enjellic.com (wind.enjellic.com [76.10.64.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 482eeb5c-9110-11ec-8723-dd0c611c5f35;
 Sat, 19 Feb 2022 00:12:46 +0100 (CET)
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 21INCgMR006709;
 Fri, 18 Feb 2022 17:12:42 -0600
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 21INCg7Y006708;
 Fri, 18 Feb 2022 17:12:42 -0600
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
X-Inumbo-ID: 482eeb5c-9110-11ec-8723-dd0c611c5f35
Date: Fri, 18 Feb 2022 17:12:42 -0600
From: "Dr. Greg" <greg@enjellic.com>
To: Roger Pau Monn?? <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org
Subject: Re: IGD pass-through failures since 4.10.
Message-ID: <20220218231242.GA6668@wind.enjellic.com>
Reply-To: "Dr. Greg" <greg@enjellic.com>
References: <20220214060011.GA24404@wind.enjellic.com> <Ygoe/e+UzAtHe3Ac@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygoe/e+UzAtHe3Ac@Air-de-Roger>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3 (wind.enjellic.com [127.0.0.1]); Fri, 18 Feb 2022 17:12:42 -0600 (CST)

On Mon, Feb 14, 2022 at 10:21:01AM +0100, Roger Pau Monn?? wrote:

Good afternoon, I hope the week has gone well for everyone.

> On Mon, Feb 14, 2022 at 12:00:11AM -0600, Dr. Greg wrote:

> >
> > [ Material removed ]
> >
> > It appears to be a problem with mapping interrupts back to dom0 given
> > that we see the following:
> > 
> > Feb 10 08:16:05 hostname kernel: xhci_hcd 0000:00:14.0: xen map irq failed -19 for 32752 domain
> > 
> > Feb 10 08:16:05 hostname kernel: i915 0000:00:02.0: xen map irq failed -19 for 32752 domain
> > 
> > Feb 10 08:16:12 hostname kernel: xhci_hcd 0000:00:14.0: Error while assigning device slot ID

> Are you testing with an hypervisor with debug enabled? If not,
> please build one and see if there are any messages in Xen dmesg also
> as a result of the error (uisng `xl dmesg` if you don't have a
> serial attached to the box). Posting full Linux and Xen dmesgs (Xen
> build with debug=y) could also help.

It was just a stock build out of the GIT tree.

We will get a debug hypervisors built and get traces out of the test
machine and post them to this thread.  I don't believe that dom0
kernel was talking very much about what was going on but we will
verify that.

> PHYSDEVOP_map_pirq is failing but without further information it's
> impossible to limit the scope of the issue (and whether the issue is
> with PHYSDEVOP_map_pirq or some previous operation).

Very useful piece of information to have.

From the log messages above, I assume the kernel is getting ENODEV
from the hypervisor call.  We will see if we can get some targeted
debug statements into the hypervisor to figure out what is going on.

> Thanks, Roger.

Thank you for the follow-up, have a good weekend.

Dr. Greg

As always,
Dr. Greg Wettstein, Ph.D    Worker / Principal Engineer
IDfusion, LLC
4206 19th Ave N.            Specialists in SGX secured infrastructure.
Fargo, ND  58102
PH: 701-281-1686            CELL: 701-361-2319
EMAIL: gw@idfusion.org
------------------------------------------------------------------------------
"Real Programmers consider "what you see is what you get" to be just as
 bad a concept in Text Editors as it is in women.  No, the Real
 Programmer wants a "you asked for it, you got it" text editor --
 complicated, cryptic, powerful, unforgiving, dangerous."
                                -- Matthias Schniedermeyer

