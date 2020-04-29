Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41F1BD468
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 08:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTft1-00056G-09; Wed, 29 Apr 2020 06:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4BoJ=6N=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jTfsz-00056A-JG
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 06:07:57 +0000
X-Inumbo-ID: c5080d66-89df-11ea-ae69-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5080d66-89df-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 06:07:57 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jTfst-000Bac-6g; Wed, 29 Apr 2020 06:07:51 +0000
Date: Wed, 29 Apr 2020 07:07:51 +0100
From: Tim Deegan <tim@xen.org>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH v11 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200429060751.GA44460@deinos.phlegethon.org>
References: <20200423145611.55378-1-roger.pau@citrix.com>
 <20200423145611.55378-2-roger.pau@citrix.com>
 <59e48d80-8ce1-3f3d-c07e-5117adea272a@suse.com>
 <20200427101235.6xko3lvt3qajo64m@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427101235.6xko3lvt3qajo64m@debian>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 11:12 +0100 on 27 Apr (1587985955), Wei Liu wrote:
> On Thu, Apr 23, 2020 at 06:33:49PM +0200, Jan Beulich wrote:
> > On 23.04.2020 16:56, Roger Pau Monne wrote:
> > > Introduce a specific flag to request a HVM guest linear TLB flush,
> > > which is an ASID/VPID tickle that forces a guest linear to guest
> > > physical TLB flush for all HVM guests.
> > > 
> > > This was previously unconditionally done in each pre_flush call, but
> > > that's not required: HVM guests not using shadow don't require linear
> > > TLB flushes as Xen doesn't modify the pages tables the guest runs on
> > > in that case (ie: when using HAP). Note that shadow paging code
> > > already takes care of issuing the necessary flushes when the shadow
> > > page tables are modified.
> > > 
> > > In order to keep the previous behavior modify all shadow code TLB
> > > flushes to also flush the guest linear to physical TLB if the guest is
> > > HVM. I haven't looked at each specific shadow code TLB flush in order
> > > to figure out whether it actually requires a guest TLB flush or not,
> > > so there might be room for improvement in that regard.
> > > 
> > > Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> > > requirement for AMD hardware. Finally keep the flush in
> > > switch_cr3_cr4, as it's not clear whether code could rely on
> > > switch_cr3_cr4 also performing a guest linear TLB flush. A following
> > > patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> > > not be necessary.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Tim, ICYMI, this patch needs your ack.

Sorry!  Thanks for the reminder.

Acked-by: Tim Deegan <tim@xen.org>


