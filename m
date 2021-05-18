Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C373880DC
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 21:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129684.243290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj5q6-00075E-T3; Tue, 18 May 2021 19:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129684.243290; Tue, 18 May 2021 19:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj5q6-00072o-PQ; Tue, 18 May 2021 19:57:14 +0000
Received: by outflank-mailman (input) for mailman id 129684;
 Tue, 18 May 2021 19:57:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5q5-00072e-6H; Tue, 18 May 2021 19:57:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5q4-0002MC-Sy; Tue, 18 May 2021 19:57:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5q4-0006rV-Jl; Tue, 18 May 2021 19:57:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lj5q4-0000pt-JG; Tue, 18 May 2021 19:57:12 +0000
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
	bh=HwTLZmbhQJ5HKgjMWVdRNXPurvq75c0bwSsXu+10LUQ=; b=08fO0mYPYmnfl+L26P9KugKbQB
	K87hQUEARx3rnDepzgsUF8RkKZWlFGQlYj4iGdXKybGQvx3QBty4PV9wn7Z+QFbX6dQ9cBgKAAcCO
	diuveGplGjCf13Pztd9/11Lr+lQf6rnclasRYYfE08sfyKmVjJIHfvsbkH5VYSwsYVik=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1lj5q4-0000pt-JG@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 May 2021 19:57:12 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Bug not present: caa9c4471d1d74b2d236467aaf7e63a806ac11a4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162060/


  commit 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Author: Julien Grall <jgrall@amazon.com>
  Date:   Tue May 18 14:34:22 2021 +0100
  
      tools/libs: guest: Use const whenever we point to literal strings
      
      literal strings are not meant to be modified. So we should use const
      *char rather than char * when we want to store a pointer to them.
      
      Signed-off-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/162060.bisection-summary --basis-template=162023 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 162055 fail [host=laxton0] / 162023 ok.
Failure / basis pass flights: 162055 / 162023
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#caa9c4471d1d74b2d236467aaf7e63a806ac11a4-01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Loaded 5001 nodes in revision graph
Searching for test results:
 162023 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162036 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162047 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162050 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162052 fail 7ea428895af2840d85c524f0bd11a38aac308308 89aae4ad8f495b647de33f2df5046b3ce68225f8
 162054 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
 162056 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162057 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
 162055 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162059 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162060 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
Searching for interesting versions
 Result found: flight 162023 (pass), for basis pass
 For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4, results HASH(0x5592b2a64f98) HASH(0x5592b2a705d8) HASH(0x5592b2a78da0) HASH(0x5592b2a80608) Result found: flight 162036 (fail), for basis failure (at ancestor ~449)
 Repro found: flight 162047 (pass), for basis pass
 Repro found: flight 162050 (fail), for basis failure
 0 revisions at 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
No revisions left to test, checking graph state.
 Result found: flight 162023 (pass), for last pass
 Result found: flight 162054 (fail), for first failure
 Repro found: flight 162056 (pass), for last pass
 Repro found: flight 162057 (fail), for first failure
 Repro found: flight 162059 (pass), for last pass
 Repro found: flight 162060 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Bug not present: caa9c4471d1d74b2d236467aaf7e63a806ac11a4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162060/


  commit 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Author: Julien Grall <jgrall@amazon.com>
  Date:   Tue May 18 14:34:22 2021 +0100
  
      tools/libs: guest: Use const whenever we point to literal strings
      
      literal strings are not meant to be modified. So we should use const
      *char rather than char * when we want to store a pointer to them.
      
      Signed-off-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
162060: tolerable ALL FAIL

flight 162060 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162060/

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


