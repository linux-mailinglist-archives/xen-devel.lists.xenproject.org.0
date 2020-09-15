Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE1269ABE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 02:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHzEK-0001XE-Mv; Tue, 15 Sep 2020 00:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e2Gj=CY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHzEJ-0001Wo-Ui
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 00:53:55 +0000
X-Inumbo-ID: 4a964e42-5856-49f4-b93b-3840221951c4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a964e42-5856-49f4-b93b-3840221951c4;
 Tue, 15 Sep 2020 00:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=N078MogyW758yPgR+LRxsCHBlq1/J1g2aoXpJOoyANU=; b=oG52L4vcwvc5vp+3UY1RWzYd/o
 aX9nCtpN97WC5r6Glkdr2xd9DZfXKI7f35ncQudiVy3VhgcGU3dXqp/XIw6TnUSIBIecxW3g9YvZe
 0voQq82LdtSBsQamLFw4kAXeOOyVr+oyqQHm6fEkLMoWBEWNKZLv5vrF0AzLqIRK7SKo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHzEC-0005ce-BO; Tue, 15 Sep 2020 00:53:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHzEC-0005Ue-30; Tue, 15 Sep 2020 00:53:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHzEC-0002ZS-2V; Tue, 15 Sep 2020 00:53:48 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-raw
Message-Id: <E1kHzEC-0002ZS-2V@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 15 Sep 2020 00:53:48 +0000
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
job test-amd64-i386-xl-raw
testid guest-start

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154348/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-raw.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-raw.guest-start --summary-out=tmp/154348.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-amd64-i386-xl-raw guest-start
Searching for failure / basis pass:
 154090 fail [host=chardonnay1] / 154016 [host=pinot0] 153983 [host=elbling1] 153957 [host=huxelrebe0] 153931 [host=albana0] 153906 [host=fiano1] 153882 [host=fiano0] 153845 [host=fiano0] 153813 [host=fiano0] 153788 [host=fiano0] 153770 [host=fiano0] 153758 [host=fiano0] 153653 [host=chardonnay0] 153619 [host=rimava1] 153602 ok.
Failure / basis pass flights: 154090 / 153602
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#afe018e041ec112d90a8b4e6ed607d22aa06f280-cc13835377debe4e300c5f5f11f8f78920778c4e
Loaded 5001 nodes in revision graph
Searching for test results:
 153400 [host=elbling1]
 153437 [host=elbling0]
 153468 [host=albana0]
 153494 [host=pinot1]
 153526 [host=pinot0]
 153551 [host=fiano1]
 153591 [host=huxelrebe1]
 153602 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153619 [host=rimava1]
 153653 [host=chardonnay0]
 153758 [host=fiano0]
 153770 [host=fiano0]
 153788 [host=fiano0]
 153813 [host=fiano0]
 153845 [host=fiano0]
 153882 [host=fiano0]
 153906 [host=fiano1]
 153931 [host=albana0]
 153957 [host=huxelrebe0]
 153983 [host=elbling1]
 154016 [host=pinot0]
 154036 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154058 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154090 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154314 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 154318 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154323 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e
 154327 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211
 154331 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62
 154334 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412
 154337 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154339 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154343 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154345 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154346 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154347 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154348 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
Searching for interesting versions
 Result found: flight 153602 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2, results HASH(0x558613beb978) HASH(0x558613bd36b8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc\
 437c386260 0b77395ef2f20058305240f2395883b1d961982a, results HASH(0x558613bd96f8) HASH(0x558613c71230) HASH(0x55861368a7a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412, results HASH(0x558613beec08) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e\
 6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62, results HASH(0x558613be38c8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211, results HASH(0x558613c75470) For basis failure, parent search sto\
 pping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280, results HASH(0x558613be58d0) HASH(0x558613be0f98) Result found: flight 154090 (fail), for basis failure (at ancestor ~295)
 Repro found: flight 154314 (pass), for basis pass
 Repro found: flight 154318 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
No revisions left to test, checking graph state.
 Result found: flight 154339 (pass), for last pass
 Result found: flight 154343 (fail), for first failure
 Repro found: flight 154345 (pass), for last pass
 Repro found: flight 154346 (fail), for first failure
 Repro found: flight 154347 (pass), for last pass
 Repro found: flight 154348 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154348/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-raw.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
154348: tolerable ALL FAIL

flight 154348 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154348/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-raw       11 guest-start             fail baseline untested


jobs:
 test-amd64-i386-xl-raw                                       fail    


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


