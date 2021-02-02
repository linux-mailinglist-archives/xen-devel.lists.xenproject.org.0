Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16230B651
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 05:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80335.146901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6n81-0007Vk-KO; Tue, 02 Feb 2021 04:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80335.146901; Tue, 02 Feb 2021 04:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6n81-0007VG-Ga; Tue, 02 Feb 2021 04:17:25 +0000
Received: by outflank-mailman (input) for mailman id 80335;
 Tue, 02 Feb 2021 04:17:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6n80-0007V8-0l; Tue, 02 Feb 2021 04:17:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6n7z-0002hN-Qx; Tue, 02 Feb 2021 04:17:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l6n7z-00005g-F5; Tue, 02 Feb 2021 04:17:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l6n7z-0001nB-Eb; Tue, 02 Feb 2021 04:17:23 +0000
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
	bh=a+1TD2R8zqpo6AN8wxmd1LoA7+m96HIqtQRLKlMSJf0=; b=5y8IDNkZFpAu+cYNI1oEsG03CH
	nPm5Qw3vJ0Onluqie0ah0IUK3QlREVAW524L02l6K7cg5Ol4V9J8Mh1DyebiLVDzBQn9Jho7C5Kn/
	0tu94ifWdTCQBwdahiIj0KT6E5mUWNXkt0Z4U6zRNGD0dxpb4fjlD781GKc0eidy2fvY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1l6n7z-0001nB-Eb@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Feb 2021 04:17:23 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ffbb8aa282de262403275f2395d8540818cf576e
  Bug not present: 419cd07895891c6642f29085aee07be72413f08c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158933/


  commit ffbb8aa282de262403275f2395d8540818cf576e
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Mon Feb 1 16:53:17 2021 +0100
  
      xenstore: fix build on {Net/Free}BSD
      
      The endian.h header is in sys/ on NetBSD and FreeBSD.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/158933.bisection-summary --basis-template=158804 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 158930 fail [host=laxton0] / 158804 [host=rochester1] 158798 ok.
Failure / basis pass flights: 158930 / 158798
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 e402441d4c02908cea9c14392fd7c2831c0456d0
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#e402441d4c02908cea9c14392fd7c2831c0456d0-ffbb8aa282de262403275f2395d8540818cf576e
Loaded 5001 nodes in revision graph
Searching for test results:
 158798 pass 7ea428895af2840d85c524f0bd11a38aac308308 e402441d4c02908cea9c14392fd7c2831c0456d0
 158804 [host=rochester1]
 158897 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158900 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158911 pass 7ea428895af2840d85c524f0bd11a38aac308308 e402441d4c02908cea9c14392fd7c2831c0456d0
 158913 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158914 pass 7ea428895af2840d85c524f0bd11a38aac308308 6fe64b150ce519d1952edc5da452e1d143cef4cc
 158909 [host=laxton1]
 158916 pass 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd
 158917 [host=laxton1]
 158918 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158919 [host=laxton1]
 158921 pass 7ea428895af2840d85c524f0bd11a38aac308308 bbed98e7cedcd5072671c21605330075740382d3
 158924 pass 7ea428895af2840d85c524f0bd11a38aac308308 419cd07895891c6642f29085aee07be72413f08c
 158923 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158925 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158926 pass 7ea428895af2840d85c524f0bd11a38aac308308 419cd07895891c6642f29085aee07be72413f08c
 158927 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158930 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
 158931 pass 7ea428895af2840d85c524f0bd11a38aac308308 419cd07895891c6642f29085aee07be72413f08c
 158933 fail 7ea428895af2840d85c524f0bd11a38aac308308 ffbb8aa282de262403275f2395d8540818cf576e
Searching for interesting versions
 Result found: flight 158798 (pass), for basis pass
 For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 419cd07895891c6642f29085aee07be72413f08c, results HASH(0x55b718daeee0) HASH(0x55b718dce0e0) HASH(0x55b718dd0a10) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 bbed98e7cedcd5072671c21605330075740382d3, results HASH(0x55b718dc5018) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 9dc687f155a57216b83b17f9cde55dd43e06b0cd, results HASH(0x\
 55b718dbf2d8) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 6fe64b150ce519d1952edc5da452e1d143cef4cc, results HASH(0x55b718db3698) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 e402441d4c02908cea9c14392fd7c2831c0456d0, results HASH(0x55b718db0be8) HASH(0x55b718dbacc8) Result found: flight 158897 (fail), for basis failure (at ancestor ~988)
 Repro found: flight 158911 (pass), for basis pass
 Repro found: flight 158913 (fail), for basis failure
 0 revisions at 7ea428895af2840d85c524f0bd11a38aac308308 419cd07895891c6642f29085aee07be72413f08c
No revisions left to test, checking graph state.
 Result found: flight 158924 (pass), for last pass
 Result found: flight 158925 (fail), for first failure
 Repro found: flight 158926 (pass), for last pass
 Repro found: flight 158927 (fail), for first failure
 Repro found: flight 158931 (pass), for last pass
 Repro found: flight 158933 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ffbb8aa282de262403275f2395d8540818cf576e
  Bug not present: 419cd07895891c6642f29085aee07be72413f08c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158933/


  commit ffbb8aa282de262403275f2395d8540818cf576e
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Mon Feb 1 16:53:17 2021 +0100
  
      xenstore: fix build on {Net/Free}BSD
      
      The endian.h header is in sys/ on NetBSD and FreeBSD.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Ian Jackson <iwj@xenproject.org>
      Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
158933: tolerable ALL FAIL

flight 158933 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158933/

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


