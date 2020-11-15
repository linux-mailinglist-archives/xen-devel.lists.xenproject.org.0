Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DADD2B376C
	for <lists+xen-devel@lfdr.de>; Sun, 15 Nov 2020 18:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27520.56176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keM9u-0005bm-Sc; Sun, 15 Nov 2020 17:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27520.56176; Sun, 15 Nov 2020 17:49:50 +0000
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
	id 1keM9u-0005bN-PP; Sun, 15 Nov 2020 17:49:50 +0000
Received: by outflank-mailman (input) for mailman id 27520;
 Sun, 15 Nov 2020 17:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b2Sd=EV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1keM9s-0005bI-VE
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 17:49:48 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40e847f8-358c-4319-9dea-551fcca8111c;
 Sun, 15 Nov 2020 17:49:45 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AFHnh89013401
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2020 18:49:44 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 70A002E9CA8; Sun, 15 Nov 2020 18:49:38 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b2Sd=EV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1keM9s-0005bI-VE
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 17:49:48 +0000
X-Inumbo-ID: 40e847f8-358c-4319-9dea-551fcca8111c
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40e847f8-358c-4319-9dea-551fcca8111c;
	Sun, 15 Nov 2020 17:49:45 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AFHnh89013401
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2020 18:49:44 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 70A002E9CA8; Sun, 15 Nov 2020 18:49:38 +0100 (MET)
Date: Sun, 15 Nov 2020 18:49:38 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: netbsd PVH dom0: xen clock event stops
Message-ID: <20201115174938.GA3562@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Sun, 15 Nov 2020 18:49:44 +0100 (MET)

Hello,
I spent some more time debugging NetBSD as a PVH dom0 on Xen,
With Roger's patch to avoid a Xen panic, the NetBSD kernel stalls
configuring devices. At first I though it was an issue with hardware
interrupts, but it more likely is an issue with Xen timer events.
Specifically: virtual CPU 0 stops receiving timer events, while other
CPUs keep receiving them. I tried to force a timer rearm but this didn't help.
The event is not masked nor pending on Xen or NetBSD, as confirmed by 'q'.
Others events (the Xen console, the debug event) are properly received
by CPU0. I don't know how to debug this more at this point.

In case it helps, I put by Xen and netbsd kernels at
http://www-soc.lip6.fr/~bouyer/netbsd-dom0-pvh/
I boot it from the NetBSD boot loader with:
menu=Boot Xen PVH:load /netbsd-test console=com0 root=dk0 -vx; multiboot /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug

I guess with grub this would be
kernel /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug
module /netbsd-test console=com0 root=dk0 -vx

(yes, com2 for xen and com0 for netbsd, that's not a bug :)
You can enter the NetBSD debugger with
+++++
you can then enter commands, lile
sh ev /i
to see the interrupt counters

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

