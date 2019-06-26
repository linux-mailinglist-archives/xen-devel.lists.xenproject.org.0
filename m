Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F1D57331
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 22:56:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgEvC-0001JH-72; Wed, 26 Jun 2019 20:53:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGph=UZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hgEvA-0001J5-Q8
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 20:53:36 +0000
X-Inumbo-ID: 76ba15cc-9854-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76ba15cc-9854-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 20:53:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hgEv8-00011A-GG; Wed, 26 Jun 2019 20:53:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hgEv8-0000Ha-59; Wed, 26 Jun 2019 20:53:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hgEv8-0003aj-4R; Wed, 26 Jun 2019 20:53:34 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hgEv8-0003aj-4R@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2019 20:53:34 +0000
Subject: [Xen-devel] [xen-unstable-smoke bisection] complete build-armhf
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
Content-Type: multipart/mixed; boundary="===============5072269730182535368=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5072269730182535368==
Content-Type: text/plain

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-armhf
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138567/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build --summary-out=tmp/138567.bisection-summary --basis-template=138424 --blessings=real,real-bisect xen-unstable-smoke build-armhf xen-build
Searching for failure / basis pass:
 138566 fail [host=cubietruck-picasso] / 138424 [host=cubietruck-gleizes] 138355 [host=cubietruck-metzinger] 138347 ok.
Failure / basis pass flights: 138566 / 138347
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
Basis pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#9cca02d8ffc23e9688a971d858e4ffdff5389b11-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/xen.git#11911563610786615c2b3a01cdcaaf09a6f9e38d-1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
Loaded 1001 nodes in revision graph
Searching for test results:
 138257 [host=cubietruck-braque]
 138242 [host=cubietruck-gleizes]
 138277 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138295 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138355 [host=cubietruck-metzinger]
 138328 [host=cubietruck-metzinger]
 138317 [host=cubietruck-gleizes]
 138347 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138342 [host=cubietruck-gleizes]
 138424 [host=cubietruck-gleizes]
 138493 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138482 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138489 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138485 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138497 [host=cubietruck-metzinger]
 138501 [host=cubietruck-metzinger]
 138505 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138510 [host=cubietruck-gleizes]
 138517 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138519 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138563 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138547 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138546 [host=cubietruck-gleizes]
 138565 [host=cubietruck-gleizes]
 138549 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138551 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138566 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138567 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138550 [host=cubietruck-metzinger]
 138532 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 11911563610786615c2b3a01cdcaaf09a6f9e38d
 138552 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 b41666f2c17f01c437c870389ab713ee62ae3526
 138534 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138531 [host=cubietruck-metzinger]
 138535 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138553 [host=cubietruck-metzinger]
 138537 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138538 [host=cubietruck-gleizes]
 138555 [host=cubietruck-gleizes]
 138536 [host=cubietruck-metzinger]
 138554 [host=cubietruck-metzinger]
 138541 [host=cubietruck-gleizes]
 138557 [host=cubietruck-metzinger]
 138542 [host=cubietruck-gleizes]
 138544 [host=cubietruck-gleizes]
 138545 [host=cubietruck-gleizes]
 138559 fail 9cca02d8ffc23e9688a971d858e4ffdff5389b11 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138556 [host=cubietruck-gleizes]
 138560 [host=cubietruck-gleizes]
 138561 pass 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138564 [host=cubietruck-gleizes]
Searching for interesting versions
 Result found: flight 138277 (pass), for basis pass
 Result found: flight 138485 (fail), for basis failure
 Repro found: flight 138532 (pass), for basis pass
 Repro found: flight 138534 (fail), for basis failure
 0 revisions at 9cca02d8ffc23e9688a971d858e4ffdff5389b11 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
No revisions left to test, checking graph state.
 Result found: flight 138535 (pass), for last pass
 Result found: flight 138549 (fail), for first failure
 Repro found: flight 138551 (pass), for last pass
 Repro found: flight 138552 (fail), for first failure
 Repro found: flight 138561 (pass), for last pass
 Repro found: flight 138567 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138567/


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

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
138567: tolerable ALL FAIL

flight 138567 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138567/

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



--===============5072269730182535368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5072269730182535368==--
