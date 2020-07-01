Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2719210747
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 11:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqYdH-0002uB-AP; Wed, 01 Jul 2020 09:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqYdG-0002u4-CH
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 09:02:18 +0000
X-Inumbo-ID: 902528b0-bb79-11ea-bca7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 902528b0-bb79-11ea-bca7-bc764e2007e4;
 Wed, 01 Jul 2020 09:02:17 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: i8xnSH4MPIXch7CDs6lVi0mHG8WXUgDdXmURI54kbExyL3Z1gYHmQ/MIONC1VwCIl9dXwU8Y4K
 lPaCcdjNGB1TeAr6GCrU2lk9S+Y+oxcBn7kNkvmDDXTxMsNZT5gzzgt47/3LLrzcq4jpHS1KCm
 2abuATUcY6TJFW3SoEFpPRalqkanCAH5XfkUFSC8IXz3HW+4jM6j78/VOTdRJKjM7BIUCzILsp
 AmoiT1LRijD/kM/tCGJW0A6A0Jkw0ybgaBcfD5hyd1vb+D25Ia1JR3bXCzcZgKqfEVAj4vRh3l
 GG8=
X-SBRS: 2.7
X-MesageID: 22186773
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="22186773"
Date: Wed, 1 Jul 2020 11:02:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: vPT rework (and timer mode)
Message-ID: <20200701090210.GN735@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

I've been doing some work with the virtual timers infrastructure in
order to improve some of it's shortcomings. See:

https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00919.html

For an example of such issues, and how the emulated timers are not
architecturally correct.

It's my understanding that the purpose of pt_update_irq and
pt_intr_post is to attempt to implement the "delay for missed ticks"
mode, where Xen will accumulate timer interrupts if they cannot be
injected. As shown by the patch above, this is all broken when the
timer is added to a vCPU (pt->vcpu) different than the actual target
vCPU where the interrupt gets delivered (note this can also be a list
of vCPUs if routed from the IO-APIC using Fixed mode).

I'm at lost at how to fix this so that virtual timers work properly
and we also keep the "delay for missed ticks" mode without doing a
massive rework and somehow keeping track of where injected interrupts
originated, which seems an overly complicated solution.

My proposal hence would be to completely remove the timer_mode, and
just treat virtual timer interrupts as other interrupts, ie: they will
be injected from the callback (pt_timer_fn) and the vCPU(s) would be
kicked. Whether interrupts would get lost (ie: injected when a
previous one is still pending) depends on the contention on the
system. I'm not aware of any current OS that uses timer interrupts as
a way to track time. I think current OSes know the differences between
a timer counter and an event timer, and will use them appropriately.

This would allow to get rid of pt_update_irq and pt_intr_post calls in
the VMX/SVM interrupt injection paths, and likely simplify the virtual
timers code quite a lot. Note the guest would also always track the
real wallclock.

AFAICT such change would also allow to get rid of the per-vCPU vpt
lists.

Wanted to get some feedback on this approach before starting to do the
work, since as said above it will involve dropping the timer modes.

Thanks, Roger.

