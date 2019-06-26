Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B956134
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 06:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfzMh-00026p-RW; Wed, 26 Jun 2019 04:16:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGph=UZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hfzMg-00025s-Uy
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 04:16:58 +0000
X-Inumbo-ID: 3a58fce2-97c9-11e9-a8be-dbca5d2d50ed
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a58fce2-97c9-11e9-a8be-dbca5d2d50ed;
 Wed, 26 Jun 2019 04:16:53 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hfzMa-0005pX-HW; Wed, 26 Jun 2019 04:16:52 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hfzMa-0008B9-AQ; Wed, 26 Jun 2019 04:16:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hfzMa-0000Xx-9q; Wed, 26 Jun 2019 04:16:52 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hfzMa-0000Xx-9q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2019 04:16:52 +0000
Subject: [Xen-devel] [xen-unstable-smoke bisection] complete build-arm64-xsm
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779141998091085056=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1779141998091085056==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138530/


  commit b41666f2c17f01c437c870389ab713ee62ae3526
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Jun 25 15:39:44 2019 +0200
  
      config: don't hardcode toolchain binaries
      
      Currently the names of the build toolchain binaries are hardcoded in
      StdGNU.mk, and the values from the environment are ignored.
      
      Switch StdGNU.mk to use '?=' instead of '=', so that values from the
      environment are used if present, else default to the values provided
      by the config file.
      
      This change fixes the gitlab CI loop, that was relying on passing
      custom values in the environment variables for the compiler and the
      linker.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/138530.bisection-summary --basis-template=138424 --blessings=real,real-bisect xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 138519 fail [host=laxton1] / 138424 [host=laxton0] 138355 [host=laxton0] 138347 [host=rochester1] 138342 ok.
Failure / basis pass flights: 138519 / 138342
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
Basis pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#9cca02d8ffc23e9688a971d858e4ffdff5389b11-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/xen.git#11911563610786615c2b3a01cdcaaf09a6f9e38d-1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
Loaded 1001 nodes in revision graph
Searching for test results:
 138262 [host=rochester1]
 138257 [host=rochester1]
 138242 [host=rochester1]
 138268 [host=rochester0]
 138271 [host=rochester1]
 138277 [host=rochester0]
 138294 [host=rochester0]
 138295 [host=rochester0]
 138302 [host=rochester0]
 138355 [host=laxton0]
 138328 [host=rochester0]
 138317 [host=laxton0]
 138347 [host=rochester1]
 138342 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138424 [host=laxton0]
 138493 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138482 [host=rochester0]
 138489 [host=rochester1]
 138485 [host=rochester0]
 138497 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138501 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138505 [host=rochester1]
 138510 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138517 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138519 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138522 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138523 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138524 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 560cf418c8455cd8d79ad353f6f9193a2e2554e4
 138525 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138526 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138527 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138528 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138529 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138530 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
Searching for interesting versions
 Result found: flight 138342 (pass), for basis pass
 Result found: flight 138493 (fail), for basis failure
 Repro found: flight 138522 (pass), for basis pass
 Repro found: flight 138523 (fail), for basis failure
 0 revisions at 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
No revisions left to test, checking graph state.
 Result found: flight 138525 (pass), for last pass
 Result found: flight 138526 (fail), for first failure
 Repro found: flight 138527 (pass), for last pass
 Repro found: flight 138528 (fail), for first failure
 Repro found: flight 138529 (pass), for last pass
 Repro found: flight 138530 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138530/


  commit b41666f2c17f01c437c870389ab713ee62ae3526
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Jun 25 15:39:44 2019 +0200
  
      config: don't hardcode toolchain binaries
      
      Currently the names of the build toolchain binaries are hardcoded in
      StdGNU.mk, and the values from the environment are ignored.
      
      Switch StdGNU.mk to use '?=' instead of '=', so that values from the
      environment are used if present, else default to the values provided
      by the config file.
      
      This change fixes the gitlab CI loop, that was relying on passing
      custom values in the environment variables for the compiler and the
      linker.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
138530: tolerable ALL FAIL

flight 138530 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138530/

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



--===============1779141998091085056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1779141998091085056==--
