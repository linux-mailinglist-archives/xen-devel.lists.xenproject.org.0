Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D92D318F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 18:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47626.84287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhFI-0007fq-AN; Tue, 08 Dec 2020 17:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47626.84287; Tue, 08 Dec 2020 17:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmhFI-0007fS-7F; Tue, 08 Dec 2020 17:57:52 +0000
Received: by outflank-mailman (input) for mailman id 47626;
 Tue, 08 Dec 2020 17:57:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykJI=FM=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kmhFG-0007fN-Hj
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 17:57:50 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 761140db-e521-4e17-998b-9f5bd6e31cd3;
 Tue, 08 Dec 2020 17:57:47 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B8HvhSC021158
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 8 Dec 2020 18:57:45 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 80ED52E93A2; Tue,  8 Dec 2020 18:57:38 +0100 (MET)
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
X-Inumbo-ID: 761140db-e521-4e17-998b-9f5bd6e31cd3
Date: Tue, 8 Dec 2020 18:57:38 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201208175738.GA3390@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 08 Dec 2020 18:57:45 +0100 (MET)

Hello,
for the first time I tried to boot a xen kernel from devel with
a NetBSD PV dom0. The kernel boots, but when the first userland prcess
is launched, it seems to enter a loop involving search_pre_exception_table()
(I see an endless stream from the dprintk() at arch/x86/extable.c:202)

With xen 4.13 I see it, but exactly once:
(XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8

with devel:
(XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
(XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
(XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
(XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
(XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
[...]

the dom0 kernel is the same.

At first glance it looks like a fault in the guest is not handled at it should,
and the userland process keeps faulting on the same address.

Any idea what to look at ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

