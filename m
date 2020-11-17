Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4702B6845
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 16:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29083.58319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2cJ-0004ql-VS; Tue, 17 Nov 2020 15:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29083.58319; Tue, 17 Nov 2020 15:09:59 +0000
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
	id 1kf2cJ-0004qM-SY; Tue, 17 Nov 2020 15:09:59 +0000
Received: by outflank-mailman (input) for mailman id 29083;
 Tue, 17 Nov 2020 15:09:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kf2cI-0004qH-LH
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:09:58 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6049ace-4c61-4d3e-aff2-95e05a55cab9;
 Tue, 17 Nov 2020 15:09:56 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AHF9sei029017
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 16:09:55 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 4624C2E9CA8; Tue, 17 Nov 2020 16:09:49 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kf2cI-0004qH-LH
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:09:58 +0000
X-Inumbo-ID: b6049ace-4c61-4d3e-aff2-95e05a55cab9
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6049ace-4c61-4d3e-aff2-95e05a55cab9;
	Tue, 17 Nov 2020 15:09:56 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AHF9sei029017
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 16:09:55 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 4624C2E9CA8; Tue, 17 Nov 2020 16:09:49 +0100 (MET)
Date: Tue, 17 Nov 2020 16:09:49 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201117150949.GA3791@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 17 Nov 2020 16:09:55 +0100 (MET)

Hello,
so, after fixing an issue in the NetBSD kernel, related to PV clock
interrupts, I'm back with physical interrupts issues.
At some point in the initialisation, the dom0 kernel stops receiving
interrupts for its disks controller. The disk controller is:
[   1.0000030] mfii0 at pci6 dev 0 function 0: "PERC H740P Adapter ", firmware 51.13.0-3485, 8192MB cache
(XEN) d0: bind: m_gsi=34 g_gsi=34
[   1.0000030] allocated pic ioapic2 type level pin 2 level 6 to cpu0 slot 2 idt entry 103
[   1.0000030] mfii0: interrupting at ioapic2 pin 2

entering the NetBSD kenrel debugger and looking at interrupt counters,
I see that some interrupts did trigger on ioapic2 pin 2, as well as for
some other hardware controllers.
I did print the controller's status when the command times out, and
the controller says that there is an interrupt pending. So I guess that
the command was executed, but the dom0 kernel didn't get interupted.

At this point I can't say if other hardware controller interripts are
working (because of the lockdown I don't have physical access
to the hardware).

What's strange is that some Xen console activity seems to be enough to
resume interrupt activity. Hitting ^A 3 times is enough to get some progess
on the dom0's disk controller, and hitting 'v' is usually enough to
get the dom0 multiuser. Once there the systems looks stable, I can log
in from network. But I/O may stall again on reboot, maybe because the
dom0 kenrel is back using synchronous console output.

Any idea what to look at from here ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

