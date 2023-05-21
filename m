Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6D70AEC0
	for <lists+xen-devel@lfdr.de>; Sun, 21 May 2023 18:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537667.837109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0lXa-0007Ki-CH; Sun, 21 May 2023 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537667.837109; Sun, 21 May 2023 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0lXa-0007IH-89; Sun, 21 May 2023 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 537667;
 Sun, 21 May 2023 16:04:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0lXY-0007I7-Ck; Sun, 21 May 2023 16:04:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0lXY-0001Go-5R; Sun, 21 May 2023 16:04:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0lXX-0003FM-Ql; Sun, 21 May 2023 16:04:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q0lXX-0003T1-QH; Sun, 21 May 2023 16:04:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=n/d88YPnyceQXav6O5Ov6kl91BJHD63SE7NuSs5aI2I=; b=albh2XXdQxZdpFSeTkrKrlkHmq
	L3fk1rF+YK+Xyzm4udIUbaeh92zFjpSLVfC+I+Tvk3rCoX07kFRH86j+mXiio6o3hqh3SFxmO+2/M
	lU9T43I/qpEgrxfkB1xxuQaG2VhVuZXR2oXLwZiLuaX2b4uYsyVIGVCMgPlLZUjt0ag4=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-arm64-xsm
Message-Id: <E1q0lXX-0003T1-QH@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 May 2023 16:04:11 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180871/


  commit 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Author: John Snow <jsnow@redhat.com>
  Date:   Wed May 10 23:54:23 2023 -0400
  
      configure: create a python venv unconditionally
      
      This patch changes the configure script so that it always creates and
      uses a python virtual environment unconditionally.
      
      Meson bootstrapping is temporarily altered to force the use of meson
      from git or vendored source (as packaged in our source tarballs). A
      subsequent commit restores the use of distribution-vendored Meson.
      
      Signed-off-by: John Snow <jsnow@redhat.com>
      Message-Id: <20230511035435.734312-16-jsnow@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build --summary-out=tmp/180871.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline build-arm64-xsm xen-build
Searching for failure / basis pass:
 180860 fail [host=rochester0] / 180691 [host=rochester1] 180686 [host=rochester1] 180673 [host=rochester1] 180659 ok.
Failure / basis pass flights: 180860 / 180659
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Basis pass d3225577123767fd09c91201d27e9c91663ae132 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#d3225577123767fd09c91201d27e9c91663ae132-0abfb0be6cf78a8e962383e85cec57851ddae5bc https://gitlab.com/qemu-project/qemu.git#8844bb8d896595ee1d25d21c770e6e6f29803097-aa222a8e4f975284b3f8f131653a4114b3d333b3 git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63c32b1d425-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#4c507d8a6b6e8be90881a335b0a66eb28e0f7737-753d903\
 a6f2d1e68d98487d36449b5739c28d65a
Loaded 30609 nodes in revision graph
Searching for test results:
 180659 pass d3225577123767fd09c91201d27e9c91663ae132 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180673 [host=rochester1]
 180686 [host=rochester1]
 180702 [host=rochester1]
 180691 [host=rochester1]
 180704 fail irrelevant
 180721 fail irrelevant
 180742 [host=rochester1]
 180753 fail irrelevant
 180785 [host=rochester1]
 180807 fail irrelevant
 180815 fail irrelevant
 180825 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180835 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180843 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180851 pass d3225577123767fd09c91201d27e9c91663ae132 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180852 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180854 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 266ccbb27b3ec6661f22395ec2c41d854c94d761 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180855 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 7d478306e84259678b2941e8af7496ef32a9c4c5 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180856 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d8ff94e59770ec7f5effe509c94246b2cbe9ce0 be7e899350caa7b74d8271a34264c3b4aef25ab0 c8e4bbb5b8ee22fd1591ba6a5a3cef4466dda323
 180853 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180857 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc ed8d95182bc994e31e730c59e1c8bfec4822b27d be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180858 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc a988b4c56143d90f98034daf176e416b08dddf36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180859 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc e80bdbf283fb7a3643172b7f85b41d9dd312091c be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180862 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc a9dbde71da553fe0b132ffac6d1a0de16892a90d be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180863 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc f1ad527ff5f789a19c79f5f39a87f7a8f78d81b9 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180864 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc dd48b477e90c3200b970545d1953e12e8c1431db be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180860 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180865 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180867 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180868 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180869 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180870 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180871 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Searching for interesting versions
 Result found: flight 180659 (pass), for basis pass
 Result found: flight 180825 (fail), for basis failure
 Repro found: flight 180851 (pass), for basis pass
 Repro found: flight 180852 (fail), for basis failure
 0 revisions at 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
No revisions left to test, checking graph state.
 Result found: flight 180865 (pass), for last pass
 Result found: flight 180867 (fail), for first failure
 Repro found: flight 180868 (pass), for last pass
 Repro found: flight 180869 (fail), for first failure
 Repro found: flight 180870 (pass), for last pass
 Repro found: flight 180871 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180871/


  commit 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Author: John Snow <jsnow@redhat.com>
  Date:   Wed May 10 23:54:23 2023 -0400
  
      configure: create a python venv unconditionally
      
      This patch changes the configure script so that it always creates and
      uses a python virtual environment unconditionally.
      
      Meson bootstrapping is temporarily altered to force the use of meson
      from git or vendored source (as packaged in our source tarballs). A
      subsequent commit restores the use of distribution-vendored Meson.
      
      Signed-off-by: John Snow <jsnow@redhat.com>
      Message-Id: <20230511035435.734312-16-jsnow@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

pnmtopng: 246 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
180871: tolerable ALL FAIL

flight 180871 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/180871/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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


