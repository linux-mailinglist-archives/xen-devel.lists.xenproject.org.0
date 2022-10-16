Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA75FFE16
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 10:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423784.670764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojywK-0001os-T9; Sun, 16 Oct 2022 08:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423784.670764; Sun, 16 Oct 2022 08:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojywK-0001lf-Pz; Sun, 16 Oct 2022 08:24:08 +0000
Received: by outflank-mailman (input) for mailman id 423784;
 Sun, 16 Oct 2022 08:24:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojywJ-0001lV-9l; Sun, 16 Oct 2022 08:24:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojywJ-0001or-5v; Sun, 16 Oct 2022 08:24:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ojywI-00026h-Qw; Sun, 16 Oct 2022 08:24:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ojywI-00040C-QT; Sun, 16 Oct 2022 08:24:06 +0000
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
	bh=WDqbX4adQB93dTw57jbYK1+avNCRHZHqOSyNRoK4F8Y=; b=xeqKV4BMivv8E2OdRLAK1hqQEq
	U1GOA05SCu2kk2pLk5zzlTVwk+po6SN8BXFeE3MQpNPWljnQXgj5aSbRDXuU0R6/V0/kupfmGqZ5h
	y4HIMCEdXNwpT3WBfyhuWky7RbsUCHZSZ7hs+uV9eY81fltxzBerxdn10DLzkJulHAdo=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1ojywI-00040C-QT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Oct 2022 08:24:06 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e4f5949c446635a854f06317b81db11cccfdabee
  Bug not present: fcdb9cdb953d6c1f893286c3619e74f72e1327fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173913/


  commit e4f5949c446635a854f06317b81db11cccfdabee
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Thu Oct 13 14:05:00 2022 +0100
  
      tools: Add -Werror by default to all tools/
      
      And provide an option to ./configure to disable it.
      
      A follow-up patch will remove -Werror from every other Makefile in
      tools/.
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/173913.bisection-summary --basis-template=173457 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 173897 fail [host=huxelrebe0] / 173760 [host=pinot1] 173754 [host=albana0] 173749 [host=sabro0] 173743 [host=italia1] 173734 [host=sabro1] 173728 [host=sabro1] 173721 [host=sabro0] 173710 [host=sabro1] 173701 [host=pinot1] 173688 [host=albana0] 173670 [host=sabro1] 173649 [host=sabro1] 173619 ok.
Failure / basis pass flights: 173897 / 173619
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 448d28309f1a966bdc850aff1a637e0b79a03e43
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#448d28309f1a966bdc850aff1a637e0b79a03e43-5310a3aa5026fb27d6834306d920d6207a1e0898
Loaded 5001 nodes in revision graph
Searching for test results:
 173760 [host=pinot1]
 173776 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173786 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173800 [host=sabro1]
 173810 [host=italia1]
 173822 [host=italia1]
 173835 [host=italia1]
 173853 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173867 [host=italia1]
 173868 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 448d28309f1a966bdc850aff1a637e0b79a03e43
 173874 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173869 [host=italia1]
 173880 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fcdb9cdb953d6c1f893286c3619e74f72e1327fc
 173885 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173886 [host=italia1]
 173889 [host=italia1]
 173892 [host=italia1]
 173895 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 4834dd5521a36cec118ed84b7c09a509edaafa6b
 173900 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 40d96f0c7d5399f9b824926279d41ead974fbe39
 173901 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e4f5949c446635a854f06317b81db11cccfdabee
 173897 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 5310a3aa5026fb27d6834306d920d6207a1e0898
 173903 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fcdb9cdb953d6c1f893286c3619e74f72e1327fc
 173907 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e4f5949c446635a854f06317b81db11cccfdabee
 173910 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fcdb9cdb953d6c1f893286c3619e74f72e1327fc
 173913 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 e4f5949c446635a854f06317b81db11cccfdabee
 173619 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 448d28309f1a966bdc850aff1a637e0b79a03e43
 173649 [host=sabro1]
 173670 [host=sabro1]
 173688 [host=albana0]
 173701 [host=pinot1]
 173754 [host=albana0]
 173710 [host=sabro1]
 173721 [host=sabro0]
 173728 [host=sabro1]
 173734 [host=sabro1]
 173743 [host=italia1]
 173749 [host=sabro0]
Searching for interesting versions
 Result found: flight 173619 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fcdb9cdb953d6c1f893286c3619e74f72e1327fc, results HASH(0x55d31a4755d8) HASH(0x55d31a48ff58) HASH(0x55d31a47c698) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 448d28309f1a966bdc850aff1a637e0b79a03e43, results HASH(0x55d31a47f928) HASH(0x55d31a472e28) Result found: flight 173776 (fail), for \
 basis failure (at ancestor ~623)
 Repro found: flight 173868 (pass), for basis pass
 Repro found: flight 173874 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b746458e1ce1bec85e58b458386f8b7a0bedfaa6 fcdb9cdb953d6c1f893286c3619e74f72e1327fc
No revisions left to test, checking graph state.
 Result found: flight 173880 (pass), for last pass
 Result found: flight 173901 (fail), for first failure
 Repro found: flight 173903 (pass), for last pass
 Repro found: flight 173907 (fail), for first failure
 Repro found: flight 173910 (pass), for last pass
 Repro found: flight 173913 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e4f5949c446635a854f06317b81db11cccfdabee
  Bug not present: fcdb9cdb953d6c1f893286c3619e74f72e1327fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173913/


  commit e4f5949c446635a854f06317b81db11cccfdabee
  Author: Anthony PERARD <anthony.perard@citrix.com>
  Date:   Thu Oct 13 14:05:00 2022 +0100
  
      tools: Add -Werror by default to all tools/
      
      And provide an option to ./configure to disable it.
      
      A follow-up patch will remove -Werror from every other Makefile in
      tools/.
      
      Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173913: tolerable ALL FAIL

flight 173913 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173913/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


