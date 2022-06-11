Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09E5476E8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 19:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347365.573730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0520-0003hb-5C; Sat, 11 Jun 2022 17:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347365.573730; Sat, 11 Jun 2022 17:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0520-0003fI-1y; Sat, 11 Jun 2022 17:36:16 +0000
Received: by outflank-mailman (input) for mailman id 347365;
 Sat, 11 Jun 2022 17:36:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o051x-0003f8-WF; Sat, 11 Jun 2022 17:36:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o051x-00068c-RY; Sat, 11 Jun 2022 17:36:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o051x-0005nP-H9; Sat, 11 Jun 2022 17:36:13 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o051x-0006bY-Ge; Sat, 11 Jun 2022 17:36:13 +0000
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
	bh=530TqWbQQKRz7dbyHRAwqBZtyOFQZjttmWAJoG60/iI=; b=KXZewSOxB9S4pDshyt06LNuDSG
	Y1mERXir/0rXcuYmW5+Q/23Z7MhbB2fYH+clJhyjnKo+UvejMILP+ei89y3T3wOqEvwuKbjJu8kqf
	uUSn5n7uLmSbeA1LmTFLhLBt+NyEfSTsDg+FXhWvaLl6W4P8fQBrsoKP3BK7yNpWZ4aA=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-coresched-i386-xl
Message-Id: <E1o051x-0006bY-Ge@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Jun 2022 17:36:13 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-coresched-i386-xl
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b152dfbc3ad71a788996440b18174d995c3bffc9
  Bug not present: 8e11ec8fbf6f933f8854f4bc54226653316903f2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171092/


  commit b152dfbc3ad71a788996440b18174d995c3bffc9
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jun 9 15:27:19 2022 +0200
  
      x86/pv: Clean up _get_page_type()
      
      Various fixes for clarity, ahead of making complicated changes.
      
       * Split the overflow check out of the if/else chain for type handling, as
         it's somewhat unrelated.
       * Comment the main if/else chain to explain what is going on.  Adjust one
         ASSERT() and state the bit layout for validate-locked and partial states.
       * Correct the comment about TLB flushing, as it's backwards.  The problem
         case is when writeable mappings are retained to a page becoming read-only,
         as it allows the guest to bypass Xen's safety checks for updates.
       * Reduce the scope of 'y'.  It is an artefact of the cmpxchg loop and not
         valid for use by subsequent logic.  Switch to using ACCESS_ONCE() to treat
         all reads as explicitly volatile.  The only thing preventing the validated
         wait-loop being infinite is the compiler barrier hidden in cpu_relax().
       * Replace one page_get_owner(page) with the already-calculated 'd' already in
         scope.
      
      No functional change.
      
      This is part of XSA-401 / CVE-2022-26362.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: George Dunlap <george.dunlap@eu.citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: George Dunlap <george.dunlap@citrix.com>
      master commit: 9186e96b199e4f7e52e033b238f9fe869afb69c7
      master date: 2022-06-09 14:20:36 +0200


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-coresched-i386-xl.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-coresched-i386-xl.xen-boot --summary-out=tmp/171092.bisection-summary --basis-template=170871 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-coresched-i386-xl xen-boot
Searching for failure / basis pass:
 170913 fail [host=nobling0] / 170871 [host=debina1] 169333 [host=pinot0] 169252 ok.
Failure / basis pass flights: 170913 / 169252
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b1b89f9009f2390652e0061bd7b24fc40732bc70-ff36b2550f94dc5fac838cf298ae5a23cfddf204 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#107951211a8d17658e1aaa0c23a8cf29f8806ad8-107951211a8d17658e1aaa0c23a8cf29f8806ad8 git://xenbits.xen.org/osstest/seabios.git#01774004c7f7fdc9c1e8f1715f70d3b913f8d491-dc88f9b72df52b22c35b127b80c487e0b6fca4af git://xenbits.xen.org/xen.git#b953760d0b564478e232e7e64823d2a1506e92b5-dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
Loaded 7994 nodes in revision graph
Searching for test results:
 169238 [host=nobling1]
 169252 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5
 169333 [host=pinot0]
 170871 [host=debina1]
 170901 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
 170974 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5
 170979 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
 170913 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
 170981 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dab96cf02e3be378310dd1bce119b0fac6fac958 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5
 170986 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 17702186b56209842e002235c29ffec5ed69745a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2
 170989 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 632574ced10fe184d5665b73c62c959109c39961 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2
 170995 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 7c003ab4a398ff4ddd54d15d4158cffb463134cc
 170998 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 982a314bd3000a16c3128afadb36a8ff41029adc
 171001 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
 171039 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f1be0b62a03b90a40a03e21f965e4cbb89809bb1
 171074 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 171078 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 171082 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
 171085 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 171088 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
 171090 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 171092 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
Searching for interesting versions
 Result found: flight 169252 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2, results HASH(0x55af84629cb0) HASH(0x55af846fe8a8) HASH(0x55af846302f0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2, results HASH(0x55af84629088) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c\
 23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f1be0b62a03b90a40a03e21f965e4cbb89809bb1, results HASH(0x55af846f7988) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 982a314bd3000a16c3128afadb36a8ff41029adc, results HASH(0x55af8464ee00) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 7c003ab4a398ff4ddd54d15d4158cffb463134cc, results HASH(0x55af8464c7f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 632574ced10fe184d566\
 5b73c62c959109c39961 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2, results HASH(0x55af846299b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 17702186b56209842e002235c29ffec5ed69745a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6f\
 ca4af f26544492298cb82d66f9bf36e29d2f75b3133f2, results HASH(0x55af82ffe038) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dab96cf02e3be378310dd1bce119b0fac6fac958 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5, results HASH(0x55af84644f90) For basis failure, parent search stopping at c3038e718a19fc59\
 6f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 b953760d0b564478e232e7e64823d2a1506e92b5, results HASH(0x55af84634c00) HASH(0x55af8462a5b0) Result found: flight 170901 (fail), for basis failure (at ancestor ~644)
 Repro found: flight 170974 (pass), for basis pass
 Repro found: flight 170979 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
No revisions left to test, checking graph state.
 Result found: flight 171078 (pass), for last pass
 Result found: flight 171082 (fail), for first failure
 Repro found: flight 171085 (pass), for last pass
 Repro found: flight 171088 (fail), for first failure
 Repro found: flight 171090 (pass), for last pass
 Repro found: flight 171092 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b152dfbc3ad71a788996440b18174d995c3bffc9
  Bug not present: 8e11ec8fbf6f933f8854f4bc54226653316903f2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171092/


  commit b152dfbc3ad71a788996440b18174d995c3bffc9
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Thu Jun 9 15:27:19 2022 +0200
  
      x86/pv: Clean up _get_page_type()
      
      Various fixes for clarity, ahead of making complicated changes.
      
       * Split the overflow check out of the if/else chain for type handling, as
         it's somewhat unrelated.
       * Comment the main if/else chain to explain what is going on.  Adjust one
         ASSERT() and state the bit layout for validate-locked and partial states.
       * Correct the comment about TLB flushing, as it's backwards.  The problem
         case is when writeable mappings are retained to a page becoming read-only,
         as it allows the guest to bypass Xen's safety checks for updates.
       * Reduce the scope of 'y'.  It is an artefact of the cmpxchg loop and not
         valid for use by subsequent logic.  Switch to using ACCESS_ONCE() to treat
         all reads as explicitly volatile.  The only thing preventing the validated
         wait-loop being infinite is the compiler barrier hidden in cpu_relax().
       * Replace one page_get_owner(page) with the already-calculated 'd' already in
         scope.
      
      No functional change.
      
      This is part of XSA-401 / CVE-2022-26362.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Signed-off-by: George Dunlap <george.dunlap@eu.citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: George Dunlap <george.dunlap@citrix.com>
      master commit: 9186e96b199e4f7e52e033b238f9fe869afb69c7
      master date: 2022-06-09 14:20:36 +0200

pnmtopng: 115 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-coresched-i386-xl.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
171092: tolerable ALL FAIL

flight 171092 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/171092/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-coresched-i386-xl  8 xen-boot                fail baseline untested


jobs:
 test-amd64-coresched-i386-xl                                 fail    


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


