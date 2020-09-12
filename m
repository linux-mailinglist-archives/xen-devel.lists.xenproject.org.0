Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910D267B8B
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 19:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH9Db-0003r5-36; Sat, 12 Sep 2020 17:21:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMn5=CV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kH9Da-0003r0-2s
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 17:21:42 +0000
X-Inumbo-ID: e9a8ac10-90ab-4a47-8f38-9a8ea79f19b3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9a8ac10-90ab-4a47-8f38-9a8ea79f19b3;
 Sat, 12 Sep 2020 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=3oqf0+EvcXo5tAfyN395sDnOGg75oYcT32+2dxNwJnM=; b=sDpK44rPYe7lLaFrKdeVazDbZN
 S4C4CNCJ2ln/BNoY5KU/Jt5WFd5xihCx1cwrHdETasUR3e4TC9ROXAG7gVugd5jihLczK0VH4k4MY
 qXpe6REl1c+rHtVhsq3G0LlAs9rb3kWlAPdGYHFwzlBk1wB/t7tZ70aqHleTfaVJInC8=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kH9DW-00024A-Mj; Sat, 12 Sep 2020 17:21:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kH9DW-0000MF-Fa; Sat, 12 Sep 2020 17:21:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kH9DW-0003Uh-F6; Sat, 12 Sep 2020 17:21:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-pygrub
Message-Id: <E1kH9DW-0003Uh-F6@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Sep 2020 17:21:38 +0000
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
job test-amd64-amd64-pygrub
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154198/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-pygrub.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-pygrub.guest-start --summary-out=tmp/154198.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-amd64-amd64-pygrub guest-start
Searching for failure / basis pass:
 154090 fail [host=chardonnay1] / 154016 [host=godello1] 153983 [host=rimava1] 153931 [host=fiano1] 153906 [host=chardonnay0] 153882 [host=pinot0] 153845 [host=godello0] 153813 [host=elbling1] 153788 [host=elbling0] 153770 [host=godello1] 153758 [host=albana1] 153653 [host=huxelrebe0] 153619 [host=fiano0] 153602 [host=godello0] 153591 [host=albana0] 153551 ok.
Failure / basis pass flights: 154090 / 153551
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
 153400 [host=godello0]
 153437 [host=elbling0]
 153468 [host=godello1]
 153494 [host=chardonnay0]
 153526 [host=huxelrebe1]
 153551 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153591 [host=albana0]
 153602 [host=godello0]
 153619 [host=fiano0]
 153653 [host=huxelrebe0]
 153758 [host=albana1]
 153770 [host=godello1]
 153788 [host=elbling0]
 153813 [host=elbling1]
 153845 [host=godello0]
 153882 [host=pinot0]
 153906 [host=chardonnay0]
 153931 [host=fiano1]
 153957 [host=rimava1]
 153983 [host=rimava1]
 154016 [host=godello1]
 154036 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154079 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 154082 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154084 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e
 154086 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 dd33fd2e81a0e83707cc203b974e501fa336590f
 154058 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154088 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154091 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 790f2dfb598acb5f3f3f75b47c5e3ab642c16478
 154095 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6797d1ed45a4089a22f7278bb45cddb6fd861d72
 154098 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154100 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154103 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154105 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154108 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154109 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154090 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154123 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 154133 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154136 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211
 154139 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62
 154145 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 3cccdae45242dab27198b8e150be0c85acd5d3c9
 154149 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412
 154153 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 725588cfd11443689a40db4bf31e71b974ff5555
 154156 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e69a56bcf82fbbb80b159b6ba5c6982932678063
 154160 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a4c4b288069cf0c7285ec3d3efb1df0b46051d46
 154164 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154170 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154178 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154183 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154187 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154192 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154198 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
Searching for interesting versions
 Result found: flight 153551 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2, results HASH(0x55d56e5ead88) HASH(0x55d56e5de520) HASH(0x55d56e5ef6c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 a4c4b288069cf0c7285ec3d3efb1df0b46051d46, results HASH(0x55d56e5e38d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 3cccdae45242dab27198b8e150be0c85acd5d3c9, results HASH(0x55d56e5f3250) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e69a56bcf82fbbb80b159b6ba5c6982932678063, results HASH(0x55d56e679fb8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 dd33fd2e81a0e83707cc203b974e501fa336590f, results HASH(0x55d56e5e9980) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 725588cfd11443689a40db4bf31e71b974ff5555, results HASH(0x55d56e6788b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8, results HASH(0x55d56e5edb3\
 8) HASH(0x55d56e5d2f48) HASH(0x55d56e5d4350) HASH(0x55d56e66f188) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2, results HASH(0x55d56e5f3550) HASH(0x55d56e66ff08) HASH(0x55d56e5d9888) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310\
 b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6797d1ed45a4089a22f7278bb45cddb6fd861d72, results HASH(0x55d56e5eb208) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 790f2dfb598acb5f3f3f75b47c5e3ab642c16478, results HASH(0x55d56e5f1848) For basis failure, parent search stopping at c3038e7\
 18a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e, results HASH(0x55d56e5efe40) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a, results HASH(0x55d56e\
 684f58) HASH(0x55d56e5e35d8) HASH(0x55d56e5f42f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 52dbd6f07cea7a776ba1fcc76f111c311c8a1412, results HASH(0x55d56e66f788) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea\
 6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62, results HASH(0x55d56e5ed690) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1814a626fb5811184eda64fe22f0055df4600211, results HASH(0x55d56e5e6d50) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb95583\
 10b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280, results HASH(0x55d56e5e3bd8) HASH(0x55d56e5dcf98) HASH(0x55d56e673fc8) Result found: flight 154090 (fail), for basis failure (at ancestor ~295)
 Repro found: flight 154123 (pass), for basis pass
 Repro found: flight 154133 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
No revisions left to test, checking graph state.
 Result found: flight 154170 (pass), for last pass
 Result found: flight 154178 (fail), for first failure
 Repro found: flight 154183 (pass), for last pass
 Repro found: flight 154187 (fail), for first failure
 Repro found: flight 154192 (pass), for last pass
 Repro found: flight 154198 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154198/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-pygrub.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
154198: tolerable ALL FAIL

flight 154198 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154198/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-pygrub      11 guest-start             fail baseline untested


jobs:
 test-amd64-amd64-pygrub                                      fail    


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


