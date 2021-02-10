Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5796316FBC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 20:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83700.156453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9usq-0007OF-9U; Wed, 10 Feb 2021 19:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83700.156453; Wed, 10 Feb 2021 19:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9usq-0007No-5v; Wed, 10 Feb 2021 19:10:40 +0000
Received: by outflank-mailman (input) for mailman id 83700;
 Wed, 10 Feb 2021 19:10:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9uso-0007Ng-Vb; Wed, 10 Feb 2021 19:10:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9uso-00089g-Le; Wed, 10 Feb 2021 19:10:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l9uso-0005I6-FY; Wed, 10 Feb 2021 19:10:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l9uso-0004Vu-F2; Wed, 10 Feb 2021 19:10:38 +0000
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
	bh=321RvEiwLITY2nnRr85veBKqS7Sgwehi5aqhG9IVfH4=; b=gDwUPr6fS+b5QPXIcF17xgbwOu
	YZSDNXhZzCyxyjnJIjxM95vZFhll3Jvzl0qdujXf0BP5fHypQUmy7rNUO0wc4TiY5siQTtVplVvHg
	ACKl7eYgbpmoY7y/+I4q2X0OKP/JW3yBf3fTS4sCFXqlNCUeSvWcjrTuId4L1bQpFKgM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1l9uso-0004Vu-F2@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Feb 2021 19:10:38 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
  Bug not present: 687121f8a0e7c1ea1c4fa3d056637e5819342f14
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159224/


  commit c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 4 10:38:33 2021 +0100
  
      autoconf: check endian.h include path
      
      Introduce an autoconf macro to check for the include path of certain
      headers that can be different between OSes.
      
      Use such macro to find the correct path for the endian.h header, and
      modify the users of endian.h to use the output of such check.
      
      Suggested-by: Ian Jackson <iwj@xenproject.org>
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/159224.bisection-summary --basis-template=159191 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 159210 fail [host=himrod1] / 159191 [host=himrod2] 159184 ok.
Failure / basis pass flights: 159210 / 159184
(tree with no url: minios)
(tree in basispass but not in latest: ovmf)
(tree in basispass but not in latest: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 90b014a6e6ecad036ec5846426afd19b305dedff
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#687121f8a0e7c1ea1c4fa3d056637e5819342f14-90b014a6e6ecad036ec5846426afd19b305dedff
Loaded 5001 nodes in revision graph
Searching for test results:
 159184 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
 159191 [host=himrod2]
 159206 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 20077d035224c6f3b3eef8b111b8b842635f2c40
 159209 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
 159211 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 20077d035224c6f3b3eef8b111b8b842635f2c40
 159213 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
 159210 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 90b014a6e6ecad036ec5846426afd19b305dedff
 159219 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
 159221 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
 159223 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
 159224 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
Searching for interesting versions
 Result found: flight 159184 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14, results HASH(0x556052ba3a60) HASH(0x556052bb5fe0) HASH(0x556052bbcf48) HASH(0x556052bc0ad8) Result found: flight 159206 (fail), for basis failure (at ancestor ~44)
 Repro found: flight 159209 (pass), for basis pass
 Repro found: flight 159210 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 687121f8a0e7c1ea1c4fa3d056637e5819342f14
No revisions left to test, checking graph state.
 Result found: flight 159184 (pass), for last pass
 Result found: flight 159213 (fail), for first failure
 Repro found: flight 159219 (pass), for last pass
 Repro found: flight 159221 (fail), for first failure
 Repro found: flight 159223 (pass), for last pass
 Repro found: flight 159224 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
  Bug not present: 687121f8a0e7c1ea1c4fa3d056637e5819342f14
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/159224/


  commit c9b0242ad44a739e0f4c72b67fd4bcf4b042f800
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 4 10:38:33 2021 +0100
  
      autoconf: check endian.h include path
      
      Introduce an autoconf macro to check for the include path of certain
      headers that can be different between OSes.
      
      Use such macro to find the correct path for the endian.h header, and
      modify the users of endian.h to use the output of such check.
      
      Suggested-by: Ian Jackson <iwj@xenproject.org>
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
159224: tolerable ALL FAIL

flight 159224 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/159224/

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


