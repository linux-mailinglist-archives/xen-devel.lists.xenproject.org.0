Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAED25072F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 20:12:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAGwg-0003ZD-DU; Mon, 24 Aug 2020 18:11:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JQT=CC=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kAGwe-0003Z7-Ek
 for xen-devel@lists.xen.org; Mon, 24 Aug 2020 18:11:48 +0000
X-Inumbo-ID: 430e3cff-960a-4301-a84e-df4b6a331655
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 430e3cff-960a-4301-a84e-df4b6a331655;
 Mon, 24 Aug 2020 18:11:45 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 07OIBiW3016659
 for <xen-devel@lists.xen.org>; Mon, 24 Aug 2020 20:11:44 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id E000B2803; Mon, 24 Aug 2020 20:11:43 +0200 (CEST)
Date: Mon, 24 Aug 2020 20:11:43 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xen.org
Subject: qemu-xen and bridge (xen 4.11)
Message-ID: <20200824181143.GA571@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [151.127.5.145]);
 Mon, 24 Aug 2020 20:11:44 +0200 (MEST)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,
with the recent XSA about qemu, I'm trying to switch the NetBSD port from
qemu-xen-traditional to qemu-xen (in Xen 4.11 for now, I'll look at
4.13 later).
One showstopper is that with qemu-xen, the bridge name is not passed
any more to the qemu-ifup script. I tried adding a br= option to
the qemu invocation, but qemu-system-i386 doesn't seem to use it
(at last the script is still called with only one argument).
I'm not about to pass to qemu the value of nics[i].script instead of
libxl_tapif_script(), so that at last per-domain script can be
specified.

How is this issue dealt with on other OSes ? I can't believe I'm
the only one with multiple bridges in the dom0 ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

