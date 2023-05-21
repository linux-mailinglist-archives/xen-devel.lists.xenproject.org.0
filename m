Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F5770AC9C
	for <lists+xen-devel@lfdr.de>; Sun, 21 May 2023 08:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537584.836949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0cPw-00046m-Qc; Sun, 21 May 2023 06:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537584.836949; Sun, 21 May 2023 06:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0cPw-00044X-Mz; Sun, 21 May 2023 06:19:44 +0000
Received: by outflank-mailman (input) for mailman id 537584;
 Sun, 21 May 2023 06:19:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0cPv-00044N-9M; Sun, 21 May 2023 06:19:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0cPv-0003qc-5O; Sun, 21 May 2023 06:19:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0cPu-000856-QY; Sun, 21 May 2023 06:19:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q0cPu-0001gI-Q5; Sun, 21 May 2023 06:19:42 +0000
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
	bh=39sYjoNR77HRLN5hasswd0L5k0xdSILz1Vxhh33EByA=; b=2i0LaSuLRGovOMjLUB6ilN91Cb
	vwrrTgJESXNGfs5J5jvH4jhwBmoNQZT8+e5rdmpX3/YStJ47HTCuxIZT2ZQpJfszTxQNqXD4OaABG
	Ppigxzptqj5AtyoFScx7SwV408cN0RdjLPmk7vI3S744YNkJLVCziFbAlydLWyV4UDYA=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-arm64
Message-Id: <E1q0cPu-0001gI-Q5@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 21 May 2023 06:19:42 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180850/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64.xen-build --summary-out=tmp/180850.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline build-arm64 xen-build
Searching for failure / basis pass:
 180835 fail [host=rochester0] / 180691 ok.
Failure / basis pass flights: 180835 / 180691
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Basis pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e-0abfb0be6cf78a8e962383e85cec57851ddae5bc https://gitlab.com/qemu-project/qemu.git#6972ef1440a9d685482d78672620a7482f2bd09a-aa222a8e4f975284b3f8f131653a4114b3d333b3 git://xenbits.xen.org/osstest/seabios.git#be7e899350caa7b74d8271a34264c3b4aef25ab0-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#8f9c8274a4e3e860bd777269cb2c91971e9fa69e-753d903\
 a6f2d1e68d98487d36449b5739c28d65a
Loaded 25008 nodes in revision graph
Searching for test results:
 180702 [host=rochester1]
 180691 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180704 fail irrelevant
 180721 fail irrelevant
 180742 [host=rochester1]
 180753 fail irrelevant
 180785 [host=rochester1]
 180807 fail irrelevant
 180821 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180822 fail irrelevant
 180823 fail irrelevant
 180815 fail irrelevant
 180824 pass irrelevant
 180826 fail irrelevant
 180827 pass irrelevant
 180828 fail irrelevant
 180829 pass irrelevant
 180830 fail irrelevant
 180831 pass irrelevant
 180825 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180832 fail irrelevant
 180833 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180836 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180837 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc fe3ab4eb2de46076cbafcbc86b22e71ad24894c6 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180838 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 928348949d1d04f67715fa7125e7e1fa3ff40f7c be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180841 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3b087f79a48807f348ea61469175e66b28ba44de be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180835 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180842 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 66e2c6cbacea9302a1fc5528906243d36c103fc7 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180844 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc dd48b477e90c3200b970545d1953e12e8c1431db be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180845 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180846 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180847 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180848 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180849 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
 180850 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
Searching for interesting versions
 Result found: flight 180691 (pass), for basis pass
 Result found: flight 180825 (fail), for basis failure
 Repro found: flight 180833 (pass), for basis pass
 Repro found: flight 180835 (fail), for basis failure
 0 revisions at 0abfb0be6cf78a8e962383e85cec57851ddae5bc 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 753d903a6f2d1e68d98487d36449b5739c28d65a
No revisions left to test, checking graph state.
 Result found: flight 180845 (pass), for last pass
 Result found: flight 180846 (fail), for first failure
 Repro found: flight 180847 (pass), for last pass
 Repro found: flight 180848 (fail), for first failure
 Repro found: flight 180849 (pass), for last pass
 Repro found: flight 180850 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180850/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
180850: tolerable ALL FAIL

flight 180850 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/180850/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64                   6 xen-build               fail baseline untested


jobs:
 build-arm64                                                  fail    


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


