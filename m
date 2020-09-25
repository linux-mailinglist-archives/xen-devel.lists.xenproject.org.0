Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F412792B3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 22:53:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLuiD-0006IP-Rt; Fri, 25 Sep 2020 20:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5R+H=DC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLuiB-0006IK-Vr
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 20:53:00 +0000
X-Inumbo-ID: d0f8834e-975e-476a-a222-29c40212cdc6
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0f8834e-975e-476a-a222-29c40212cdc6;
 Fri, 25 Sep 2020 20:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=rUt9LzkCKISU0PvxTpjhZUH29MiTP3otGrfklNQDcks=; b=ZxeZX5GJ9umXyjBXYbIOZFL1Ta
 qkunqYHOXK71mBWS9DOILLMJYpEwGiXyxwzXdguGMFbT7dqknNjov2iUohy3DtS50S9osxHxPkGSn
 jaKdfzlXFNKxpKOpfuOdQGp/lhI2UlM8uywBFYgg5r5TPFLHz287vedDqsZR11Qw7swU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLui8-0004pg-V5; Fri, 25 Sep 2020 20:52:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLui8-0007Np-OR; Fri, 25 Sep 2020 20:52:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLui8-0005vU-Nv; Fri, 25 Sep 2020 20:52:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1kLui8-0005vU-Nv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Sep 2020 20:52:56 +0000
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

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-4
testid xtf/test-hvm64-xsa-221

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
  Bug not present: 112992b05b2d2ca63f3c78eefe1cf8d192d7303a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154832/


  commit 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:50:09 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221 --summary-out=tmp/154832.bisection-summary --basis-template=154611 --blessings=real,real-bisect xen-unstable test-xtf-amd64-amd64-4 xtf/test-hvm64-xsa-221
Searching for failure / basis pass:
 154634 fail [host=albana1] / 154611 [host=huxelrebe1] 154592 [host=godello1] 154576 [host=fiano1] 154556 [host=huxelrebe0] 154521 [host=chardonnay1] 154504 [host=elbling0] 154494 [host=albana0] 154481 [host=chardonnay0] 154465 [host=godello0] 154090 [host=godello0] 154058 [host=pinot1] 154036 [host=godello1] 154016 [host=rimava1] 153983 [host=fiano0] 153957 ok.
Failure / basis pass flights: 154634 / 153957
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2785b2a9e04abc148e1c5259f4faee708ea356f4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#b11910082d90bb1597f6679524eb726a33306672-2785b2a9e04abc148e1c5259f4faee708ea356f4 git://xenbits.xen.org/xtf.git#17d372b763cb0b2e2e6b5a637c11f3997d2533fa-17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Loaded 5001 nodes in revision graph
Searching for test results:
 153906 [host=huxelrebe1]
 153931 [host=rimava1]
 153957 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153983 [host=fiano0]
 154016 [host=rimava1]
 154036 [host=godello1]
 154058 [host=pinot1]
 154090 [host=godello0]
 154465 [host=godello0]
 154481 [host=chardonnay0]
 154494 [host=albana0]
 154504 [host=elbling0]
 154521 [host=chardonnay1]
 154556 [host=huxelrebe0]
 154576 [host=fiano1]
 154592 [host=godello1]
 154611 [host=huxelrebe1]
 154634 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2785b2a9e04abc148e1c5259f4faee708ea356f4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154687 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154784 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2785b2a9e04abc148e1c5259f4faee708ea356f4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154788 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b4e41b1750d550bf2b1ccf97ee46f4f682bdbb62 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154792 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154798 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8e76aef72820435e766c7f339ed36da33da90c40 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154801 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154805 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c0ddc8634845aba50774add6e4b73fdaffc82656 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154813 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154817 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154820 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154827 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154832 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Searching for interesting versions
 Result found: flight 153957 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55a10ec6af50) HASH(0x55a10ec6de38) HASH(0x55a10e6f5bc8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 8e76aef72820435e766c7f339ed36da33da90c40 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55a10ec682e0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 c7e3021a71fdb4f2d5dbad90ba83ce35bc21cda6 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55a10ec6\
 5db8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b4e41b1750d550bf2b1ccf97ee46f4f682bdbb62 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55a10ec49e80) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3\
 cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55a10ebe2028) HASH(0x55a10ebd9170) Result found: flight 154634 (fail), for basis failure (at ancestor ~343)
 Repro found: flight 154687 (pass), for basis pass
 Repro found: flight 154784 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 112992b05b2d2ca63f3c78eefe1cf8d192d7303a 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
No revisions left to test, checking graph state.
 Result found: flight 154801 (pass), for last pass
 Result found: flight 154813 (fail), for first failure
 Repro found: flight 154817 (pass), for last pass
 Repro found: flight 154820 (fail), for first failure
 Repro found: flight 154827 (pass), for last pass
 Repro found: flight 154832 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
  Bug not present: 112992b05b2d2ca63f3c78eefe1cf8d192d7303a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154832/


  commit 62bcdc4edbf6d8c6e8a25544d48de22ccf75310d
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 15:50:09 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221.{dot,ps,png,html,svg}.
----------------------------------------
154832: tolerable all pass

flight 154832 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154832/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-4       68 xtf/test-hvm64-xsa-221  fail baseline untested
 test-xtf-amd64-amd64-4       106 xtf/test-pv64-xsa-221  fail baseline untested


jobs:
 test-xtf-amd64-amd64-4                                       pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


