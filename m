Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3424546FCE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 01:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346782.572721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzne2-0004QH-Oc; Fri, 10 Jun 2022 23:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346782.572721; Fri, 10 Jun 2022 23:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzne2-0004Ot-Lr; Fri, 10 Jun 2022 23:02:22 +0000
Received: by outflank-mailman (input) for mailman id 346782;
 Fri, 10 Jun 2022 23:02:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzne0-0004OH-OV; Fri, 10 Jun 2022 23:02:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzne0-0002xJ-M0; Fri, 10 Jun 2022 23:02:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nzne0-0005oC-FC; Fri, 10 Jun 2022 23:02:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nzne0-0002M0-Ej; Fri, 10 Jun 2022 23:02:20 +0000
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
	bh=LB9hrXRXMMWriNeo2FEZuQNEQaG4lYX6XEtSeMbn7Vk=; b=jDdwWmscfcBJsjgpAvTYrUWtmH
	3g6lJfhnBCYCy6sjGoTGk9vmPNn4gCyHuTIEYznDE+2+1SFO6fosAjVO/ZSxn0IlXkDbWOrEMiCxA
	4//0ejCIx73bz5OL+qlW1Fcn/god9RYhGQ1rY5CW1IPd6YJ+Uufs2RCtOtB1KRH1giuE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-i386-xl-shadow
Message-Id: <E1nzne0-0002M0-Ej@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Jun 2022 23:02:20 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-i386-xl-shadow
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170971/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-i386-xl-shadow.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-i386-xl-shadow.xen-boot --summary-out=tmp/170971.bisection-summary --basis-template=170871 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-i386-xl-shadow xen-boot
Searching for failure / basis pass:
 170901 fail [host=nobling1] / 170871 [host=albana1] 169333 [host=debina1] 169252 [host=chardonnay0] 169238 [host=albana0] 169194 [host=nobling0] 169179 [host=debina0] 169119 [host=huxelrebe0] 169086 ok.
Failure / basis pass flights: 170901 / 169086
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db e34c16cc6ee029fa75c35bd21f75103d5502ea30
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b1b89f9009f2390652e0061bd7b24fc40732bc70-ff36b2550f94dc5fac838cf298ae5a23cfddf204 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#107951211a8d17658e1aaa0c23a8cf29f8806ad8-107951211a8d17658e1aaa0c23a8cf29f8806ad8 git://xenbits.xen.org/osstest/seabios.git#d239552ce7220e448ae81f41515138f7b9e3c4db-dc88f9b72df52b22c35b127b80c487e0b6fca4af git://xenbits.xen.org/xen.git#e34c16cc6ee029fa75c35bd21f75103d5502ea30-dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
Loaded 7994 nodes in revision graph
Searching for test results:
 169086 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db e34c16cc6ee029fa75c35bd21f75103d5502ea30
 169119 [host=huxelrebe0]
 169179 [host=debina0]
 169194 [host=nobling0]
 169238 [host=albana0]
 169252 [host=chardonnay0]
 169333 [host=debina1]
 170871 [host=albana1]
 170901 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
 170914 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e3c4db e34c16cc6ee029fa75c35bd21f75103d5502ea30
 170917 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af dc020d8d1ba420e2dd0e7a40f5045db897f3c4f4
 170920 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a298a84478053872ed9da660a75f182ce81b8ddc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2c026fe1f159494b3ec05f19ddfb3d39ff901296
 170926 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a332ffb6efb57c338087551325cc4fffb0c81210 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2
 170928 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b57911c84c10e9e374c1b3d30164648f72afdd57 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2
 170936 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 6c6bbfdff9374ef41f84c4ebed7b8a7a40767ef6
 170943 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 88b653f73928117461dc250acd1e830a47a14c2b
 170946 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 170950 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 9cfd796ae05421ded8e4f70b2c55352491cfa841
 170955 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
 170960 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 170961 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
 170969 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
 170971 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af b152dfbc3ad71a788996440b18174d995c3bffc9
Searching for interesting versions
 Result found: flight 169086 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2, results HASH(0x55b1c4c497f0) HASH(0x55b1c4d117a8) HASH(0x55b1c4d196c8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 88b653f73928117461dc250acd1e830a47a14c2b, results HASH(0x55b1c4cf1e40) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a81a650da1dc40ec2b2825d1878cdf2778b4be14 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c\
 23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 6c6bbfdff9374ef41f84c4ebed7b8a7a40767ef6, results HASH(0x55b1c4c49df0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b57911c84c10e9e374c1b3d30164648f72afdd57 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2, results HASH(0x55b1c4c42bb0) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a332ffb6efb57c338087551325cc4fffb0c81210 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af f26544492298cb82d66f9bf36e29d2f75b3133f2, results HASH(0x55b1c4c23898) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a298a84478053872ed9d\
 a660a75f182ce81b8ddc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2c026fe1f159494b3ec05f19ddfb3d39ff901296, results HASH(0x55b1c4c4b7f8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 d239552ce7220e448ae81f41515138f7b9e\
 3c4db e34c16cc6ee029fa75c35bd21f75103d5502ea30, results HASH(0x55b1c4c37158) HASH(0x55b1c4c483e8) Result found: flight 170901 (fail), for basis failure (at ancestor ~646)
 Repro found: flight 170914 (pass), for basis pass
 Repro found: flight 170917 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ff36b2550f94dc5fac838cf298ae5a23cfddf204 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 107951211a8d17658e1aaa0c23a8cf29f8806ad8 dc88f9b72df52b22c35b127b80c487e0b6fca4af 8e11ec8fbf6f933f8854f4bc54226653316903f2
No revisions left to test, checking graph state.
 Result found: flight 170946 (pass), for last pass
 Result found: flight 170955 (fail), for first failure
 Repro found: flight 170960 (pass), for last pass
 Repro found: flight 170961 (fail), for first failure
 Repro found: flight 170969 (pass), for last pass
 Repro found: flight 170971 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b152dfbc3ad71a788996440b18174d995c3bffc9
  Bug not present: 8e11ec8fbf6f933f8854f4bc54226653316903f2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170971/


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

pnmtopng: 103 colors found
Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-i386-xl-shadow.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
170971: tolerable ALL FAIL

flight 170971 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/170971/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-shadow     8 xen-boot                fail baseline untested


jobs:
 test-amd64-i386-xl-shadow                                    fail    


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


