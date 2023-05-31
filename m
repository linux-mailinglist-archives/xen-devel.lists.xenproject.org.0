Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF4718902
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 20:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541923.845202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4QBa-0006Ee-78; Wed, 31 May 2023 18:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541923.845202; Wed, 31 May 2023 18:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4QBa-0006Cr-42; Wed, 31 May 2023 18:04:38 +0000
Received: by outflank-mailman (input) for mailman id 541923;
 Wed, 31 May 2023 18:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QBY-0006CP-1N; Wed, 31 May 2023 18:04:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QBX-0003Qt-Un; Wed, 31 May 2023 18:04:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QBX-0004zU-Hs; Wed, 31 May 2023 18:04:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4QBX-0006iz-HQ; Wed, 31 May 2023 18:04:35 +0000
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
	bh=+irzMzEaAhRfhLFP4CUGcqipvAx+5mISxhQMl07Y588=; b=OeZ099wxpsSJYhW+esUdKHlYwg
	WbY3aiPL+B2htdNLGZ8UjJbvfFoc07lSpJTSUZz9gjZV7POVZYpqLj9TRcfkag6YVJAp5XK2aAcMV
	qO6znk3KfxY7zWpDV836HL3W2f9BGXHfcaWyzjp9YbKcEacbR4zz2MeEo4UvxyCZyU94=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1q4QBX-0006iz-HQ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 31 May 2023 18:04:35 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  465217b0f872602b4084a1b0fa2ef75377cb3589
  Bug not present: 445fdc641e304ff41a544f8f5926a13b604c08ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181050/


  commit 465217b0f872602b4084a1b0fa2ef75377cb3589
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed May 31 12:01:11 2023 +0200
  
      vPCI: account for hidden devices
      
      Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
      console) are associated with DomXEN, not Dom0. This means that while
      looking for overlapping BARs such devices cannot be found on Dom0's list
      of devices; DomXEN's list also needs to be scanned.
      
      Suppress vPCI init altogether for r/o devices (which constitute a subset
      of hidden ones).
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Tested-by: Stefano Stabellini <sstabellini@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/181050.bisection-summary --basis-template=181018 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 181035 fail [host=himrod2] / 181018 [host=himrod0] 181016 [host=himrod0] 180963 ok.
Failure / basis pass flights: 181035 / 180963
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#8c51cd970509b97d8378d175646ec32889828158-8c51cd970509b97d8378d175646ec32889828158 git://xenbits.xen.org/xen.git#f54dd5b53ee516fa1d4c106e0744ce0083acfcdc-465217b0f872602b4084a1b0fa2ef75377cb3589
Loaded 5002 nodes in revision graph
Searching for test results:
 180963 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181016 [host=himrod0]
 181018 [host=himrod0]
 181037 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 8347d6bb29bfd0c3b5acdc078574a8643c5a5637
 181031 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
 181032 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc
 181034 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
 181038 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 e66003e7be1996c9dd8daca54ba34ad5bb58d668
 181039 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 0d74fc2b2f85586ceb5672aedc79c666e529381d
 181040 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 0f80a46ffa6bfd5d111fc2e64ee5983513627e4d
 181035 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
 181043 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 445fdc641e304ff41a544f8f5926a13b604c08ad
 181045 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
 181046 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 445fdc641e304ff41a544f8f5926a13b604c08ad
 181047 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
 181048 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 445fdc641e304ff41a544f8f5926a13b604c08ad
 181050 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 465217b0f872602b4084a1b0fa2ef75377cb3589
Searching for interesting versions
 Result found: flight 180963 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 445fdc641e304ff41a544f8f5926a13b604c08ad, results HASH(0x55dc07d44900) HASH(0x55dc07d3b210) HASH(0x55dc07d328c8) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 0f80a46ffa6bfd5d111fc2e64ee5983513627e4d, results HASH(0x55dc07d40448) For basis failure, parent search stopping at 3d273dd05e51e5a1\
 ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 0d74fc2b2f85586ceb5672aedc79c666e529381d, results HASH(0x55dc07d3e440) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 e66003e7be1996c9dd8daca54ba34ad5bb58d668, results HASH(0x55dc07d3c438) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 8347d6bb29bfd0c3b5acdc078574a8643c5a56\
 37, results HASH(0x55dc07d35df8) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 f54dd5b53ee516fa1d4c106e0744ce0083acfcdc, results HASH(0x55dc07d32bc8) HASH(0x55dc07d3b390) Result found: flight 181031 (fail), for basis failure (at ancestor ~1498)
 Repro found: flight 181032 (pass), for basis pass
 Repro found: flight 181034 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8c51cd970509b97d8378d175646ec32889828158 445fdc641e304ff41a544f8f5926a13b604c08ad
No revisions left to test, checking graph state.
 Result found: flight 181043 (pass), for last pass
 Result found: flight 181045 (fail), for first failure
 Repro found: flight 181046 (pass), for last pass
 Repro found: flight 181047 (fail), for first failure
 Repro found: flight 181048 (pass), for last pass
 Repro found: flight 181050 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  465217b0f872602b4084a1b0fa2ef75377cb3589
  Bug not present: 445fdc641e304ff41a544f8f5926a13b604c08ad
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/181050/


  commit 465217b0f872602b4084a1b0fa2ef75377cb3589
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed May 31 12:01:11 2023 +0200
  
      vPCI: account for hidden devices
      
      Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
      console) are associated with DomXEN, not Dom0. This means that while
      looking for overlapping BARs such devices cannot be found on Dom0's list
      of devices; DomXEN's list also needs to be scanned.
      
      Suppress vPCI init altogether for r/o devices (which constitute a subset
      of hidden ones).
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
181050: tolerable ALL FAIL

flight 181050 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/181050/

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


