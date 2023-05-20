Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1C70A8C7
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 17:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537483.836725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0OJ0-0004UM-2A; Sat, 20 May 2023 15:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537483.836725; Sat, 20 May 2023 15:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0OIz-0004Rd-V0; Sat, 20 May 2023 15:15:37 +0000
Received: by outflank-mailman (input) for mailman id 537483;
 Sat, 20 May 2023 15:15:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0OIy-0004RT-88; Sat, 20 May 2023 15:15:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0OIx-0008Ly-WF; Sat, 20 May 2023 15:15:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q0OIx-0004I3-HR; Sat, 20 May 2023 15:15:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q0OIx-00026F-Gz; Sat, 20 May 2023 15:15:35 +0000
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
	bh=M4HI8Z972nR9TO5XSWyxm3NbK9CHLcPJDAAlEmNBPuk=; b=oaTJ9OZJRMv7OTwDiCP9+hikM1
	AJzCAThVzyJlRkZLEPSQGOfFJ+RcFD25Wo7pcFUjksbgeHuTZbPKsf26y8P2cuzI4/tuQP1RwsJJ1
	DWykf25l/z8p0Y++AtedrieHLFmu/j1zXhoVWoO9yyLXargZMlIWeJPCk4DXCPXZ8Lkk=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-i386
Message-Id: <E1q0OIx-00026F-Gz@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 20 May 2023 15:15:35 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180820/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386.xen-build --summary-out=tmp/180820.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline build-i386 xen-build
Searching for failure / basis pass:
 180807 fail [host=albana0] / 180691 [host=huxelrebe1] 180686 [host=huxelrebe1] 180673 [host=elbling0] 180659 ok.
Failure / basis pass flights: 180807 / 180659
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
Basis pass d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#d3225577123767fd09c91201d27e9c91663ae132-0abfb0be6cf78a8e962383e85cec57851ddae5bc git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#8844bb8d896595ee1d25d21c770e6e6f29803097-aa222a8e4f975284b3f8f131653a4114b3d333b3 git://xenbits.xen.org/osstest/seabios.git#ea1b7a0733906b8425d948ae94fba63\
 c32b1d425-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#4c507d8a6b6e8be90881a335b0a66eb28e0f7737-42abf5b9c53eb1b1a902002fcda68708234152c3
Loaded 30609 nodes in revision graph
Searching for test results:
 180659 pass d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180673 [host=elbling0]
 180686 [host=huxelrebe1]
 180702 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 297e8182194e634baa0cbbfd96d2e09e2a0bcd40 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180691 [host=huxelrebe1]
 180704 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 297e8182194e634baa0cbbfd96d2e09e2a0bcd40 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180721 [host=albana1]
 180742 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180753 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d009607d08d22f91ca399b72828c6693855e7325 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180797 pass d3225577123767fd09c91201d27e9c91663ae132 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8844bb8d896595ee1d25d21c770e6e6f29803097 ea1b7a0733906b8425d948ae94fba63c32b1d425 4c507d8a6b6e8be90881a335b0a66eb28e0f7737
 180798 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d009607d08d22f91ca399b72828c6693855e7325 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180799 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 91608e2a44f36e79cb83f863b8a7bb57d2c98061 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180800 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 66e2c6cbacea9302a1fc5528906243d36c103fc7 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180801 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4baf3978c02b387c39dc6a75d323126ab386aece be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180802 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bfa72590df14e4c94c03d2464f3abe18bf2e5dac be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180803 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3887702e5f8995638c98f9d9326b4913fb107be7 be7e899350caa7b74d8271a34264c3b4aef25ab0 c8e4bbb5b8ee22fd1591ba6a5a3cef4466dda323
 180805 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab4c44d657aeca7e1da6d6dcb1741c8e7d357b8b be7e899350caa7b74d8271a34264c3b4aef25ab0 fc1b51268025233a81e5fd9c5eabe170bc830720
 180785 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180806 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0e7e3bf1a552c178924867fa7c2f30ccc8a179e0 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180808 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180809 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0b15c42b81ff1e66ccbab3c2f2cef1535cbb9d24 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180816 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180811 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 68ea6d17fe531e383394573251359ab4f99f7091 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180812 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dd48b477e90c3200b970545d1953e12e8c1431db be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180807 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa222a8e4f975284b3f8f131653a4114b3d333b3 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180813 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180814 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180818 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180819 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180820 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
Searching for interesting versions
 Result found: flight 180659 (pass), for basis pass
 Result found: flight 180785 (fail), for basis failure
 Repro found: flight 180797 (pass), for basis pass
 Repro found: flight 180807 (fail), for basis failure
 0 revisions at 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
No revisions left to test, checking graph state.
 Result found: flight 180813 (pass), for last pass
 Result found: flight 180814 (fail), for first failure
 Repro found: flight 180816 (pass), for last pass
 Repro found: flight 180818 (fail), for first failure
 Repro found: flight 180819 (pass), for last pass
 Repro found: flight 180820 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180820/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
180820: tolerable ALL FAIL

flight 180820 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/180820/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386                    6 xen-build               fail baseline untested


jobs:
 build-i386                                                   fail    


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


