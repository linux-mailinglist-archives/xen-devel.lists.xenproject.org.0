Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12D8CCB8F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 06:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728051.1132803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA0Vd-0005F8-BP; Thu, 23 May 2024 04:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728051.1132803; Thu, 23 May 2024 04:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA0Vd-0005CL-7h; Thu, 23 May 2024 04:56:57 +0000
Received: by outflank-mailman (input) for mailman id 728051;
 Thu, 23 May 2024 04:56:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0Vc-0005CB-6z; Thu, 23 May 2024 04:56:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0Vc-0005NR-3r; Thu, 23 May 2024 04:56:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0Vb-0005FX-TG; Thu, 23 May 2024 04:56:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sA0Vb-0001cg-Sv; Thu, 23 May 2024 04:56:55 +0000
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
	bh=7XVcxiA8qnJCNB9qTVj1Hkrt3slRRf93Bgs40K0eLrA=; b=whZohE/pknNLCWDOMWSFgaPLTS
	+rgW5oA+t4I6tgQ/NrCdOGHi4wjKVK3d67jQdfG8qB76teIKfiS2/iALtJjsYdQltjbz0AFulgZow
	OCJUezg0FDXKiq011syCBAox9H6Kz6qvopSmVZDe53eWhnrzTKSxenMem3TXCFjqCj9s=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.17-testing bisection] complete build-i386-xsm
Message-Id: <E1sA0Vb-0001cg-Sv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 May 2024 04:56:55 +0000

branch xen-4.17-testing
xenbranch xen-4.17-testing
job build-i386-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  750d763623fd1ff4a69d2e350310333dcbc19d4f
  Bug not present: c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/186102/


  commit 750d763623fd1ff4a69d2e350310333dcbc19d4f
  Author: Wenxing Hou <wenxing.hou@intel.com>
  Date:   Thu Apr 18 17:28:15 2024 +0800
  
      SecurityPkg: add DeviceSecurity support
      
      This patch implement the SpdmSecurityLib,
      which is the core of DeviceSecurity.
      And the SpdmSecurityLib include Device Authentication and Measurement.
      The other library is to support SpdmSecurityLib.
      
      Cc: Jiewen Yao <jiewen.yao@intel.com>
      Signed-off-by: Wenxing Hou <wenxing.hou@intel.com>
      Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.17-testing/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.17-testing/build-i386-xsm.xen-build --summary-out=tmp/186102.bisection-summary --basis-template=185864 --blessings=real,real-bisect,real-retry xen-4.17-testing build-i386-xsm xen-build
Searching for failure / basis pass:
 186069 fail [host=pinot0] / 186063 [host=albana0] 185864 [host=pinot1] 185711 [host=nobling0] 185446 [host=huxelrebe0] 185400 [host=italia0] 185318 [host=huxelrebe0] 185300 [host=italia0] 185284 [host=huxelrebe0] 185217 ok.
Failure / basis pass flights: 186069 / 185217
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7142e648416ff5d3eac6c6d607874805f5de0ca8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
Basis pass 8f698f0a646124ede518d3e255ef725de1239639 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#8f698f0a646124ede518d3e255ef725de1239639-7142e648416ff5d3eac6c6d607874805f5de0ca8 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ffb451126550b22b43b62fb8731a0d78e3376c03-ffb451126550b22b43b62fb8731a0d78e3376c03 git://xenbits.xen.org/osstest/seabios.git#1588fd1437960d94cadc30c42243671e8c0f1\
 281-e5f2e4c69643bc3cd385306a9e5d29e11578148c git://xenbits.xen.org/xen.git#9bc40dbcf9eafccc1923b2555286bf6a2af03b7a-3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
Loaded 12696 nodes in revision graph
Searching for test results:
 185217 pass 8f698f0a646124ede518d3e255ef725de1239639 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 185284 [host=huxelrebe0]
 185300 [host=italia0]
 185318 [host=huxelrebe0]
 185400 [host=italia0]
 185446 [host=huxelrebe0]
 185494 [host=huxelrebe0]
 185514 [host=huxelrebe0]
 185536 [host=fiano0]
 185711 [host=nobling0]
 185864 [host=pinot1]
 186063 [host=albana0]
 186069 fail 7142e648416ff5d3eac6c6d607874805f5de0ca8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
 186088 pass 8f698f0a646124ede518d3e255ef725de1239639 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a
 186089 fail 7142e648416ff5d3eac6c6d607874805f5de0ca8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 3c7c9225ffa5605bf0603f9dd1666f3f786e2c44
 186090 pass 2b330b57dbe8014c5fa9f10d4cf4ae5923e3b143 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c
 186091 fail 5f783827bbaa1552edf4386bb71d8d8f471340f5 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186092 pass 680030a6ec1b16126acfb3616c5c8047b70df69f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c
 186093 pass c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186094 fail 5e31c5666d95de55b9a910944c83ecddb19334ab 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186095 fail 54a4fd9b35cac79e7c54b750d3dddd0fbb43dca1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186096 fail cf3b34c0b8fe6408859734f24c6dd39361df4173 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186097 fail 750d763623fd1ff4a69d2e350310333dcbc19d4f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186098 pass c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186100 fail 750d763623fd1ff4a69d2e350310333dcbc19d4f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186101 pass c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
 186102 fail 750d763623fd1ff4a69d2e350310333dcbc19d4f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
Searching for interesting versions
 Result found: flight 185217 (pass), for basis pass
 For basis failure, parent search stopping at c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda, results HASH(0x5585a82e12a0) HASH(0x5585a82a2968) HASH(0x5585a82945e0) For basis failure, parent search stopping at 680030a6ec1b16126acfb3616c5c8047b70df69f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69\
 643bc3cd385306a9e5d29e11578148c 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c, results HASH(0x5585a82dcc68) For basis failure, parent search stopping at 2b330b57dbe8014c5fa9f10d4cf4ae5923e3b143 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c 5d9a931fe2c1310dbfd946bbc1e22a177add4f5c, results HASH(0x5585a82c89e0) For basis failure, parent search stopping at 8f698f0a646124ede518d3e255ef725de1239639 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 1588fd1437960d94cadc30c42243671e8c0f1281 9bc40dbcf9eafccc1923b2555286bf6a2af03b7a, results HASH(0x5585a82b3118) HASH(0x5585a829af20) Result found: flight 186069 (fail), for basis failure (at ancestor ~1329)
 Repro found: flight 186088 (pass), for basis pass
 Repro found: flight 186089 (fail), for basis failure
 0 revisions at c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ffb451126550b22b43b62fb8731a0d78e3376c03 e5f2e4c69643bc3cd385306a9e5d29e11578148c effcf70f020ff12d34c80e2abde0ecb00ce92bda
No revisions left to test, checking graph state.
 Result found: flight 186093 (pass), for last pass
 Result found: flight 186097 (fail), for first failure
 Repro found: flight 186098 (pass), for last pass
 Repro found: flight 186100 (fail), for first failure
 Repro found: flight 186101 (pass), for last pass
 Repro found: flight 186102 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  750d763623fd1ff4a69d2e350310333dcbc19d4f
  Bug not present: c3f615a1bd7d64f42e7962f5a4d53f1f1a4423e6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/186102/


  commit 750d763623fd1ff4a69d2e350310333dcbc19d4f
  Author: Wenxing Hou <wenxing.hou@intel.com>
  Date:   Thu Apr 18 17:28:15 2024 +0800
  
      SecurityPkg: add DeviceSecurity support
      
      This patch implement the SpdmSecurityLib,
      which is the core of DeviceSecurity.
      And the SpdmSecurityLib include Device Authentication and Measurement.
      The other library is to support SpdmSecurityLib.
      
      Cc: Jiewen Yao <jiewen.yao@intel.com>
      Signed-off-by: Wenxing Hou <wenxing.hou@intel.com>
      Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>

pnmtopng: 174 colors found
Revision graph left in /home/logs/results/bisect/xen-4.17-testing/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
186102: tolerable ALL FAIL

flight 186102 xen-4.17-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/186102/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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


