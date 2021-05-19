Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26939389153
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 16:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130192.244010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljNLE-0001x7-KE; Wed, 19 May 2021 14:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130192.244010; Wed, 19 May 2021 14:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljNLE-0001uQ-H7; Wed, 19 May 2021 14:38:32 +0000
Received: by outflank-mailman (input) for mailman id 130192;
 Wed, 19 May 2021 14:38:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljNLC-0001uG-Qi; Wed, 19 May 2021 14:38:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljNLC-0003b2-LA; Wed, 19 May 2021 14:38:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ljNLC-0004Lx-D9; Wed, 19 May 2021 14:38:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ljNLC-0003cn-Cf; Wed, 19 May 2021 14:38:30 +0000
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
	bh=T2bMwUmZadyeNjJtbEqjxXGYk8WZgCUaDPjzy8e8lDs=; b=SJWnsPmvToIfVogrTpha3n/AZl
	QxECfpa/AaDWGufQYWgMVChBjd9B/099ObAWSjjQVNpZbv18oujIcSeaJcukOSSL0NuDAoE/1dRM7
	rE+Ebp6WwT0XkDapz4G45b71Wd32PuSXT/yCRn5eB8HiyWaSrUpzGfkkf+7abXzz969Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-armhf
Message-Id: <E1ljNLC-0003cn-Cf@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 May 2021 14:38:30 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-armhf
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Bug not present: caa9c4471d1d74b2d236467aaf7e63a806ac11a4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162094/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build --summary-out=tmp/162094.bisection-summary --basis-template=162023 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-armhf xen-build
Searching for failure / basis pass:
 162089 fail [host=cubietruck-picasso] / 162023 [host=cubietruck-gleizes] 161985 [host=cubietruck-braque] 161982 [host=cubietruck-braque] 161980 [host=cubietruck-braque] 161937 ok.
Failure / basis pass flights: 162089 / 161937
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 cb199cc7de987cfda4659fccf51059f210f6ad34
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#cb199cc7de987cfda4659fccf51059f210f6ad34-01d84420fb4a9be2ec474a7c1910bb22c28b53c8
Loaded 5001 nodes in revision graph
Searching for test results:
 161937 pass 7ea428895af2840d85c524f0bd11a38aac308308 cb199cc7de987cfda4659fccf51059f210f6ad34
 161980 [host=cubietruck-braque]
 161982 [host=cubietruck-braque]
 161985 [host=cubietruck-braque]
 162023 [host=cubietruck-gleizes]
 162036 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162055 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162061 pass 7ea428895af2840d85c524f0bd11a38aac308308 cb199cc7de987cfda4659fccf51059f210f6ad34
 162062 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162064 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162065 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162066 pass 7ea428895af2840d85c524f0bd11a38aac308308 27eb6833134d0f3ddfb02d09055776e837e9a747
 162068 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
 162067 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162069 pass 7ea428895af2840d85c524f0bd11a38aac308308 8b9890e1c0f5b35c199f40eb4e6cd0ce6c34829b
 162072 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162073 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162074 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
 162075 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162077 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162079 [host=cubietruck-braque]
 162080 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
 162081 [host=cubietruck-braque]
 162083 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162085 [host=cubietruck-braque]
 162087 [host=cubietruck-braque]
 162088 pass 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
 162089 fail 7ea428895af2840d85c524f0bd11a38aac308308 01d84420fb4a9be2ec474a7c1910bb22c28b53c8
 162092 [host=cubietruck-braque]
 162094 fail 7ea428895af2840d85c524f0bd11a38aac308308 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
Searching for interesting versions
 Result found: flight 161937 (pass), for basis pass
 For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4, results HASH(0x5619d90a5008) HASH(0x5619d90bc8d8) HASH(0x5619d90a26d8) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 8b9890e1c0f5b35c199f40eb4e6cd0ce6c34829b, results HASH(0x5619d90b11e0) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 27eb6833134d0f3ddfb02d09055776e837e9a747, results HASH(0x\
 5619d90a6590) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 cb199cc7de987cfda4659fccf51059f210f6ad34, results HASH(0x5619d909a628) HASH(0x5619d90a4888) Result found: flight 162036 (fail), for basis failure (at ancestor ~449)
 Repro found: flight 162061 (pass), for basis pass
 Repro found: flight 162062 (fail), for basis failure
 0 revisions at 7ea428895af2840d85c524f0bd11a38aac308308 caa9c4471d1d74b2d236467aaf7e63a806ac11a4
No revisions left to test, checking graph state.
 Result found: flight 162073 (pass), for last pass
 Result found: flight 162074 (fail), for first failure
 Repro found: flight 162077 (pass), for last pass
 Repro found: flight 162080 (fail), for first failure
 Repro found: flight 162088 (pass), for last pass
 Repro found: flight 162094 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Bug not present: caa9c4471d1d74b2d236467aaf7e63a806ac11a4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162094/


  commit 8fc4916daf2aac34088ebd5ec3d6fd707ac4221d
  Author: Julien Grall <jgrall@amazon.com>
  Date:   Tue May 18 14:34:22 2021 +0100
  
      tools/libs: guest: Use const whenever we point to literal strings
      
      literal strings are not meant to be modified. So we should use const
      *char rather than char * when we want to store a pointer to them.
      
      Signed-off-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
162094: tolerable ALL FAIL

flight 162094 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162094/

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


