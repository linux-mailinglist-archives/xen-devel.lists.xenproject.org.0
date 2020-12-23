Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC002E1F82
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58501.102978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76e-0000ix-D6; Wed, 23 Dec 2020 16:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58501.102978; Wed, 23 Dec 2020 16:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks76e-0000iG-8b; Wed, 23 Dec 2020 16:35:20 +0000
Received: by outflank-mailman (input) for mailman id 58501;
 Wed, 23 Dec 2020 16:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ifz=F3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ks76c-0000XE-52
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:35:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 409ce93c-3858-4660-bff6-b2cbe68ad34b;
 Wed, 23 Dec 2020 16:35:09 +0000 (UTC)
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
X-Inumbo-ID: 409ce93c-3858-4660-bff6-b2cbe68ad34b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608741309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=woFvqUrlRFwkse6aw4Hd13+wrpq/34Y+A2vX8m04mkI=;
  b=OkJ4PAd4lJXsP1sOAd56FkZXQTWuNwgZbv91tG6BBsT2i1Qcgv8J0IKF
   xhDFJhuhOwmCCMyHbajLZp7FnGQglyKKSosb5B1VxhdS/Pe+OCqFc2RQy
   NayE4yiLDJuus42r4LWv27/OKEsHDx4wlGRYAe9+nOa3F/gAsXXV6JTU+
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cBblqHoX7pzEwiIzuhxQ7YbYc0nU7dAt/nkNXSknMLvwDl8yrY/cZPEAYtPQ5xueh5EKRZlFBY
 qS2W4jJ3mNvNOlx9GuDKL8RBIyRviWpVQAco+sbYwy+WZ7kQz5CJMjjB4YPTjqHpLcURJV0ggg
 s+Za10a5BvG/ppyblp5lzA217PFnMQA36OplfyDL5hPafqfImrEexBy5IMOHWPtcyKXAh7aOYH
 RZVdy63Fth/RZ9mh69AYkJbEC+x5n/CYcjI/+iJJ7DFNN1967BuWk9aSfO1jNoG+Que4EC2d4R
 B6o=
X-SBRS: 5.2
X-MesageID: 33881654
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,441,1599537600"; 
   d="scan'208";a="33881654"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
Date: Wed, 23 Dec 2020 16:34:38 +0000
Message-ID: <20201223163442.8840-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was not the christmas hacking project that I was planning to do, but it
has had some exciting results.

After some discussion on an earlier thread, Tamas has successfully got fuzzing
of Xen working via kfx, and this series is a prototype for providing better
testing infrastructure.

And to prove a point, this series has already found a memory leak in ARM's
dom0less smoke test.

From https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/929518792

  (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
  (XEN) Freed 328kB init memory.
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
  (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
  (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
  (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
  (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) d1 has 2 outstanding heap allocations
  (XEN) ****************************************
  (XEN)
  (XEN) Reboot in five seconds...

For some reason, neither of the evtchn default memory allocations are freed,
but it's not clear why d1 shut down to being with.  Stefano - any ideas?

Andrew Cooper (4):
  xen/dmalloc: Introduce dmalloc() APIs
  xen/evtchn: Switch to dmalloc
  xen/domctl: Introduce fault_ttl
  tools/misc: Test for fault injection

 tools/misc/.gitignore       |  1 +
 tools/misc/Makefile         |  5 ++++
 tools/misc/xen-fault-ttl.c  | 56 +++++++++++++++++++++++++++++++++++++++++++++
 xen/common/Makefile         |  1 +
 xen/common/dmalloc.c        | 25 ++++++++++++++++++++
 xen/common/domain.c         | 14 ++++++++++--
 xen/common/event_channel.c  | 14 ++++++------
 xen/include/public/domctl.h |  1 +
 xen/include/xen/dmalloc.h   | 29 +++++++++++++++++++++++
 xen/include/xen/sched.h     |  3 +++
 10 files changed, 140 insertions(+), 9 deletions(-)
 create mode 100644 tools/misc/xen-fault-ttl.c
 create mode 100644 xen/common/dmalloc.c
 create mode 100644 xen/include/xen/dmalloc.h

-- 
2.11.0


