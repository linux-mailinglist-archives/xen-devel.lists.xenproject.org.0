Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF6709F82
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 21:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537240.836193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q05MJ-0005Ht-5F; Fri, 19 May 2023 19:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537240.836193; Fri, 19 May 2023 19:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q05MJ-0005Gl-1Y; Fri, 19 May 2023 19:01:47 +0000
Received: by outflank-mailman (input) for mailman id 537240;
 Fri, 19 May 2023 19:01:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q05MI-0005Gb-72; Fri, 19 May 2023 19:01:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q05MH-0003Uj-N9; Fri, 19 May 2023 19:01:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q05MH-0005oL-GS; Fri, 19 May 2023 19:01:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q05MH-0000sf-Fu; Fri, 19 May 2023 19:01:45 +0000
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
	bh=+hUwEAA7cOXbwHgcWPQitjvEVoY7UObWS804vOfluHU=; b=gwNtBrhtcCjj4rABc6LIGYaUV/
	MqGrWOeW9ziU5l/qlLaYzG+Nm5Su5asGwn6IhCFlQwyKiu6I/pHT13595HmoC4f7qpcLt7jY1ojl7
	gLs6H1RvKmTxxmDgv1wwSS6XpiHkhwWnz79eGAHT0b5XSZBxXCgKatLJbUCeprulDrc4=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-amd64-xsm
Message-Id: <E1q05MH-0000sf-Fu@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 19 May 2023 19:01:45 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180758/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build --summary-out=tmp/180758.bisection-summary --basis-template=180691 --blessings=real,real-bisect,real-retry qemu-mainline build-amd64-xsm xen-build
Searching for failure / basis pass:
 180742 fail [host=himrod2] / 180691 ok.
Failure / basis pass flights: 180742 / 180691
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
Basis pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e-0abfb0be6cf78a8e962383e85cec57851ddae5bc git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#6972ef1440a9d685482d78672620a7482f2bd09a-146f515110e86aefe3bc2e8eb581ab724614060f git://xenbits.xen.org/osstest/seabios.git#be7e899350caa7b74d8271a34264c3b\
 4aef25ab0-be7e899350caa7b74d8271a34264c3b4aef25ab0 git://xenbits.xen.org/xen.git#8f9c8274a4e3e860bd777269cb2c91971e9fa69e-42abf5b9c53eb1b1a902002fcda68708234152c3
Loaded 34991 nodes in revision graph
Searching for test results:
 180702 [host=himrod0]
 180691 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180705 [host=himrod0]
 180707 [host=himrod0]
 180708 [host=himrod0]
 180709 [host=himrod0]
 180710 [host=himrod0]
 180711 [host=himrod0]
 180712 [host=himrod0]
 180713 [host=himrod0]
 180715 [host=himrod0]
 180716 [host=himrod0]
 180717 [host=himrod0]
 180718 [host=himrod0]
 180704 [host=himrod0]
 180720 [host=himrod0]
 180722 [host=himrod0]
 180723 [host=himrod0]
 180724 [host=himrod0]
 180727 [host=himrod0]
 180728 [host=himrod0]
 180730 [host=himrod0]
 180731 [host=himrod0]
 180733 [host=himrod0]
 180736 [host=himrod0]
 180737 [host=himrod0]
 180721 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180739 [host=himrod0]
 180741 pass cafb4f3f36e2101cab2ed6db3ea246a5a3e4708e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6972ef1440a9d685482d78672620a7482f2bd09a be7e899350caa7b74d8271a34264c3b4aef25ab0 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
 180743 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180744 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 721fa5e563e8174d6c33e1e413cebb5442625932 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180745 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dee01b827ffc26577217697074052b8b7f4770dc be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180747 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f6652ebc2717b28c5788e6364c6dab09bb0ac44 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180748 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dd48b477e90c3200b970545d1953e12e8c1431db be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180749 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e80bdbf283fb7a3643172b7f85b41d9dd312091c be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180742 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 146f515110e86aefe3bc2e8eb581ab724614060f be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180750 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180752 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180754 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180755 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180757 pass 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
 180758 fail 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81e2b198a8cb4ee5fdf108bd438f44b193ee3a36 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
Searching for interesting versions
 Result found: flight 180691 (pass), for basis pass
 Result found: flight 180721 (fail), for basis failure
 Repro found: flight 180741 (pass), for basis pass
 Repro found: flight 180742 (fail), for basis failure
 0 revisions at 0abfb0be6cf78a8e962383e85cec57851ddae5bc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2274817f6c499fd31081d7973b7cbfdca17c44a8 be7e899350caa7b74d8271a34264c3b4aef25ab0 42abf5b9c53eb1b1a902002fcda68708234152c3
No revisions left to test, checking graph state.
 Result found: flight 180750 (pass), for last pass
 Result found: flight 180752 (fail), for first failure
 Repro found: flight 180754 (pass), for last pass
 Repro found: flight 180755 (fail), for first failure
 Repro found: flight 180757 (pass), for last pass
 Repro found: flight 180758 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  81e2b198a8cb4ee5fdf108bd438f44b193ee3a36
  Bug not present: 2274817f6c499fd31081d7973b7cbfdca17c44a8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/180758/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
180758: tolerable ALL FAIL

flight 180758 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/180758/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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


