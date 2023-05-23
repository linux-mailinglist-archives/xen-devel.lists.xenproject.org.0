Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08870CF4F
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 02:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538164.837950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1G0O-0004vF-Qn; Tue, 23 May 2023 00:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538164.837950; Tue, 23 May 2023 00:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1G0O-0004ta-O5; Tue, 23 May 2023 00:36:00 +0000
Received: by outflank-mailman (input) for mailman id 538164;
 Tue, 23 May 2023 00:35:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q1G0N-0004tQ-O7; Tue, 23 May 2023 00:35:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q1G0N-0001Az-Dh; Tue, 23 May 2023 00:35:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q1G0M-0005iq-VU; Tue, 23 May 2023 00:35:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q1G0M-0005i8-V1; Tue, 23 May 2023 00:35:58 +0000
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
	bh=DcjRthjQhHKaPkeiOa+PxZKMgAE1lyFRE0Kc9DScR0w=; b=h+XdNXcNvl+QAp9/fLub4Fh587
	tPbnISbL8QeI/wRtI0YdU/cJg6bWFkCYUMSGrUWD/0aGF5NRR5Sd+49y5AThkTXSQv3ZYZEX4gAAi
	VE6BIqob8+RjHbPAF2mVatM1yo3fq7s/w7/fVPNPzanAfBcCAy3Ru69MYYwwaRSYqTBQ=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-armhf
Message-Id: <E1q1G0M-0005i8-V1@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 23 May 2023 00:35:58 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180904/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/180904.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 180894 fail [host=cubietruck-metzinger] / 180691 [host=cubietruck-gleizes] 180686 [host=cubietruck-gleizes] 180673 ok.
Failure / basis pass flights: 180894 / 180673
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c5cf7f69c98baed40754ca4a821cb504fd5423cd aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Basis pass 80bc13db83ddbd5bbe757a20abcdd34daf4871f8 18b6727083acceac5d76ea0b8cb6f5cdef6858a7 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#80bc13db83ddbd5bbe757a20abcdd34daf4871f8-c5cf7f69c98baed40754ca4a821cb504fd5423cd https://gitlab.com/qemu-project/qemu.git#18b6727083acceac5d76ea0b8cb6f5cdef6858a7-aa222a8e4f975284b3f8f131653a4114b3d333b3 git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63c32b1d425-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#4c507d8a6b6e8be90881a335b0a66eb28e0f7737-753d903\
 a6f2d1e68d98487d36449b5739c28d65a
Loaded 30630 nodes in revision graph
Searching for test results:
 180673 pass 80bc13db83ddbd5bbe757a20abcdd34daf4871f8 18b6727083acceac5d76ea0b8cb6f5cdef6858a7 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180686 [host=cubietruck-gleizes]
 180702 [host=cubietruck-picasso]
 180691 [host=cubietruck-gleizes]
 180704 [host=cubietruck-picasso]
 180721 [host=cubietruck-gleizes]
 180742 [host=cubietruck-gleizes]
 180753 [host=cubietruck-gleizes]
 180785 [host=cubietruck-gleizes]
 180807 [host=cubietruck-gleizes]
 180815 [host=cubietruck-gleizes]
 180825 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180835 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180843 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180853 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180860 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180866 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180872 pass 80bc13db83ddbd5bbe757a20abcdd34daf4871f8 18b6727083acceac5d76ea0b8cb6f5cdef6858a7 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180874 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180875 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 266ccbb27b3ec6661f22395ec2c41d854c94d761 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180873 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180877 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 7d478306e84259678b2941e8af7496ef32a9c4c5 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180878 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180880 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc ed8d95182bc994e31e730c59e1c8bfec4822b27d be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180882 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc a988b4c56143d90f98034daf176e416b08dddf36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180885 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc e80bdbf283fb7a3643172b7f85b41d9dd312091c be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180881 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180889 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc f1ad527ff5f789a19c79f5f39a87f7a8f78d81b9 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180886 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc a9dbde71da553fe0b132ffac6d1a0de16892a90d be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180891 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc dd48b477e90c3200b970545d1953e12e8c1431db be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180887 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180892 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180896 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180899 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180894 fail c5cf7f69c98baed40754ca4a821cb504fd5423cd aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180901 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180903 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180904 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Searching for interesting versions
 Result found: flight 180673 (pass), for basis pass
 Result found: flight 180825 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 180872 (pass), for basis pass
 Repro found: flight 180894 (fail), for basis failure
 0 revisions at 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
No revisions left to test, checking graph state.
 Result found: flight 180892 (pass), for last pass
 Result found: flight 180896 (fail), for first failure
 Repro found: flight 180899 (pass), for last pass
 Repro found: flight 180901 (fail), for first failure
 Repro found: flight 180903 (pass), for last pass
 Repro found: flight 180904 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180904/


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

pnmtopng: 253 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
180904: tolerable ALL FAIL

flight 180904 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/180904/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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


