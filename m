Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847CB2E016B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 21:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57557.100777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krRSb-0002SZ-1Z; Mon, 21 Dec 2020 20:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57557.100777; Mon, 21 Dec 2020 20:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krRSa-0002SA-Ui; Mon, 21 Dec 2020 20:07:12 +0000
Received: by outflank-mailman (input) for mailman id 57557;
 Mon, 21 Dec 2020 20:07:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krRSZ-0002S2-OD; Mon, 21 Dec 2020 20:07:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krRSZ-0004q9-EW; Mon, 21 Dec 2020 20:07:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1krRSZ-000649-8B; Mon, 21 Dec 2020 20:07:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1krRSZ-0006jP-7i; Mon, 21 Dec 2020 20:07:11 +0000
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
	bh=gtq83h7kfYKoTknDgkg2tghU1Jn5Ccyd88hOynhTCiE=; b=O1poE14ATEsT11sl3kauuqr8py
	30KuUr//rk7JAMzZdEy7i7QJjlUbOEMnCHrdhx8uc1+PQ+NhuQhlT8KEU8wpLP52zxuL1CkZhmeXu
	Jz3jXZM1Yx0ud5PB/HsZcK7bp17e2RZJRvkCv+sPJI0dir++ppN2cxmV7fYEkwPBfKqM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64
Message-Id: <E1krRSZ-0006jP-7i@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 21 Dec 2020 20:07:11 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64
testid xen-build

Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d162f36848c4a98a782cc05820b0aa7ec1ae297d
  Bug not present: 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157774/


  commit d162f36848c4a98a782cc05820b0aa7ec1ae297d
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Sep 28 15:25:44 2020 +0100
  
      xen/x86: Fix memory leak in vcpu_create() error path
      
      Various paths in vcpu_create() end up calling paging_update_paging_modes(),
      which eventually allocate a monitor pagetable if one doesn't exist.
      
      However, an error in vcpu_create() results in the vcpu being cleaned up
      locally, and not put onto the domain's vcpu list.  Therefore, the monitor
      table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
      assertions later that we've successfully freed the entire hap/shadow memory
      pool.
      
      The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
      due to insufficient existing structure in the existing logic.
      
      Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
      in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
      fixes the memory leak.
      
      The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
      as tolerable as possible, with the minimum number of safety checks possible.
      In particular, drop the mfn_valid() check - if these fields are junk, then Xen
      is going to explode anyway.
      
      Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build --summary-out=tmp/157774.bisection-summary --basis-template=157696 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64 xen-build
Searching for failure / basis pass:
 157761 fail [host=himrod1] / 157696 ok.
Failure / basis pass flights: 157761 / 157696
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
Basis pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 357db96a66e47e609c3b14768f1062e13eedbd93
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#357db96a66e47e609c3b14768f1062e13eedbd93-d162f36848c4a98a782cc05820b0aa7ec1ae297d
Loaded 5001 nodes in revision graph
Searching for test results:
 157691 [host=himrod2]
 157692 [host=himrod2]
 157694 [host=himrod2]
 157695 pass irrelevant
 157697 fail irrelevant
 157698 pass irrelevant
 157699 pass irrelevant
 157700 pass irrelevant
 157701 pass irrelevant
 157702 pass irrelevant
 157703 fail irrelevant
 157704 pass irrelevant
 157706 fail irrelevant
 157696 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 357db96a66e47e609c3b14768f1062e13eedbd93
 157707 pass irrelevant
 157761 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
 157765 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 357db96a66e47e609c3b14768f1062e13eedbd93
 157767 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
 157768 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
 157769 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
 157770 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
 157771 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
 157773 pass 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
 157774 fail 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 d162f36848c4a98a782cc05820b0aa7ec1ae297d
Searching for interesting versions
 Result found: flight 157696 (pass), for basis pass
 For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2, results HASH(0x55feabd515e0) HASH(0x55feabd4ab20) HASH(0x55feabd56098) For basis failure, parent search stopping at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 357db96a66e47e609c3b14768f1062e13eedbd93, results HASH(0x55feabd3f660) HASH(0x55feabd521e0) Result found: flight 157761 (fail), for \
 basis failure (at ancestor ~710)
 Repro found: flight 157765 (pass), for basis pass
 Repro found: flight 157767 (fail), for basis failure
 0 revisions at 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
No revisions left to test, checking graph state.
 Result found: flight 157768 (pass), for last pass
 Result found: flight 157769 (fail), for first failure
 Repro found: flight 157770 (pass), for last pass
 Repro found: flight 157771 (fail), for first failure
 Repro found: flight 157773 (pass), for last pass
 Repro found: flight 157774 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  d162f36848c4a98a782cc05820b0aa7ec1ae297d
  Bug not present: 6131dab5f2c8059a0fc7fd884bc6d4ff78ba44c2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157774/


  commit d162f36848c4a98a782cc05820b0aa7ec1ae297d
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Mon Sep 28 15:25:44 2020 +0100
  
      xen/x86: Fix memory leak in vcpu_create() error path
      
      Various paths in vcpu_create() end up calling paging_update_paging_modes(),
      which eventually allocate a monitor pagetable if one doesn't exist.
      
      However, an error in vcpu_create() results in the vcpu being cleaned up
      locally, and not put onto the domain's vcpu list.  Therefore, the monitor
      table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
      assertions later that we've successfully freed the entire hap/shadow memory
      pool.
      
      The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
      due to insufficient existing structure in the existing logic.
      
      Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
      in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
      fixes the memory leak.
      
      The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
      as tolerable as possible, with the minimum number of safety checks possible.
      In particular, drop the mfn_valid() check - if these fields are junk, then Xen
      is going to explode anyway.
      
      Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
157774: tolerable ALL FAIL

flight 157774 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/157774/

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


