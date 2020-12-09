Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BA2D3F1C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 10:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48068.85036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmw67-0002lr-3o; Wed, 09 Dec 2020 09:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48068.85036; Wed, 09 Dec 2020 09:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmw67-0002lU-0h; Wed, 09 Dec 2020 09:49:23 +0000
Received: by outflank-mailman (input) for mailman id 48068;
 Wed, 09 Dec 2020 09:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdhY=FN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kmw66-0002lP-2X
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 09:49:22 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6572575-c20b-4e6b-b715-acfde1cdd48a;
 Wed, 09 Dec 2020 09:49:19 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B99nAfK029140
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 10:49:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id E0FA42E93A2; Wed,  9 Dec 2020 10:49:04 +0100 (MET)
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
X-Inumbo-ID: c6572575-c20b-4e6b-b715-acfde1cdd48a
Date: Wed, 9 Dec 2020 10:49:04 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201209094904.GC1469@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <cf1f85eb-1aa2-c3fa-680c-ea5ba5f68647@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf1f85eb-1aa2-c3fa-680c-ea5ba5f68647@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 09 Dec 2020 10:49:11 +0100 (MET)

On Wed, Dec 09, 2020 at 09:39:49AM +0100, Jan Beulich wrote:
> On 08.12.2020 19:13, Andrew Cooper wrote:
> > On 08/12/2020 17:57, Manuel Bouyer wrote:
> >> Hello,
> >> for the first time I tried to boot a xen kernel from devel with
> >> a NetBSD PV dom0. The kernel boots, but when the first userland prcess
> >> is launched, it seems to enter a loop involving search_pre_exception_table()
> >> (I see an endless stream from the dprintk() at arch/x86/extable.c:202)
> >>
> >> With xen 4.13 I see it, but exactly once:
> >> (XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8
> >>
> >> with devel:
> >> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> >> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> >> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> >> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> >> (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> >> [...]
> >>
> >> the dom0 kernel is the same.
> >>
> >> At first glance it looks like a fault in the guest is not handled at it should,
> >> and the userland process keeps faulting on the same address.
> >>
> >> Any idea what to look at ?
> > 
> > That is a reoccurring fault on IRET back to guest context, and is
> > probably caused by some unwise-in-hindsight cleanup which doesn't
> > escalate the failure to the failsafe callback.
> 
> But is this a 32-bit Dom0? 64-bit ones get well-known selectors
> installed for CS and SS by create_bounce_frame(), and we don't
> permit registration of non-canonical trap handler entry point
> addresses.

No, it's a 64bits dom0.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

