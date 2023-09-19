Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62717A6C57
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 22:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605007.942608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qihRM-0004HU-CB; Tue, 19 Sep 2023 20:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605007.942608; Tue, 19 Sep 2023 20:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qihRM-0004EJ-94; Tue, 19 Sep 2023 20:35:24 +0000
Received: by outflank-mailman (input) for mailman id 605007;
 Tue, 19 Sep 2023 20:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qihRK-0004E6-Lq; Tue, 19 Sep 2023 20:35:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qihRK-0006cI-Ft; Tue, 19 Sep 2023 20:35:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qihRK-0001Oe-8E; Tue, 19 Sep 2023 20:35:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qihRK-0002vH-7q; Tue, 19 Sep 2023 20:35:22 +0000
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
	bh=f8I6H2OjG+/81gPZiCt9tKCdNQEQzNSqvBH4vvsbSTk=; b=CMvOofrpN+za0I9C+janhZejBT
	QRStUYPYn2wmXtx12R0bNfP1FB6NX2fWk3/GMIqgjSj0zFWzD9LYz6vP7/xZNIP4xMZWQZ9GJEvOX
	RL8FZdWLdBAwc74J2V4QSsQUG/9YJwqh7z/Zh3KY/hVsnrk0B497i//yY/c6zuf9qco4=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete test-amd64-amd64-libvirt
Message-Id: <E1qihRK-0002vH-7q@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Sep 2023 20:35:22 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job test-amd64-amd64-libvirt
testid xen-boot

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21bdc25b05a0f8ab6bc73520a9ca01327360732c
  Bug not present: 7aa28849a1155d856e214e9a80a7e65fffdc3e58
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183055/


  commit 21bdc25b05a0f8ab6bc73520a9ca01327360732c
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Wed Sep 13 12:20:12 2023 +0100
  
      x86/entry: Track the IST-ness of an entry for the exit paths
      
      Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
      entry/exit asm, so it only needs setting in the IST path.
      
      As this is subtle and fragile, add check_ist_exit() to be used in debugging
      builds to cross-check that the ist_exit boolean matches the entry vector.
      
      Write check_ist_exit() it in C, because it's debug only and the logic more
      complicated than I care to maintain in asm.
      
      For now, we only need to use this signal in the exit-to-Xen path, but some
      exit-to-guest paths happen in IST context too.  Check the correctness in all
      exit paths to avoid the logic bit-rotting.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.xen-boot --summary-out=tmp/183069.bisection-summary --basis-template=183030 --blessings=real,real-bisect,real-retry xen-unstable-smoke test-amd64-amd64-libvirt xen-boot
Searching for failure / basis pass:
 183065 fail [host=godello0] / 183030 ok.
Failure / basis pass flights: 183065 / 183030
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ea36ac0de27c2a7c847a2a52c3e0f97a45864d81
Basis pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2ea38251eb67639be7aa9d7b64084b1be0230273
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#47230842aa6bca1da75cc92c50144f223d1ad1d3-47230842aa6bca1da75cc92c50144f223d1ad1d3 https://gitlab.com/keycodemap/keycodemapdb.git#22b8996dba9041874845c7446ce89ec4ae2b713d-22b8996dba9041874845c7446ce89ec4ae2b713d git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#2ea38251eb67639be7aa9d7b64084b1be0230273-ea36ac0de27c2a7c847a2a52c3e0f97a45864d81
Loaded 5001 nodes in revision graph
Searching for test results:
 183030 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2ea38251eb67639be7aa9d7b64084b1be0230273
 183031 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b5926c6ecf05c28ee99c6248c42d691ccbf0c315
 183033 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2ea38251eb67639be7aa9d7b64084b1be0230273
 183036 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b5926c6ecf05c28ee99c6248c42d691ccbf0c315
 183034 [host=debina1]
 183038 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 45f00557350dc7d0756551069803fc49c29184ca
 183040 [host=debina1]
 183042 [host=debina1]
 183043 [host=debina1]
 183039 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b5926c6ecf05c28ee99c6248c42d691ccbf0c315
 183044 [host=debina1]
 183047 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 21bdc25b05a0f8ab6bc73520a9ca01327360732c
 183045 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 b5926c6ecf05c28ee99c6248c42d691ccbf0c315
 183049 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7aa28849a1155d856e214e9a80a7e65fffdc3e58
 183051 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 21bdc25b05a0f8ab6bc73520a9ca01327360732c
 183052 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7aa28849a1155d856e214e9a80a7e65fffdc3e58
 183053 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 21bdc25b05a0f8ab6bc73520a9ca01327360732c
 183054 pass 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7aa28849a1155d856e214e9a80a7e65fffdc3e58
 183050 [host=albana1]
 183055 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 21bdc25b05a0f8ab6bc73520a9ca01327360732c
 183057 [host=albana1]
 183058 [host=debina0]
 183059 [host=albana1]
 183061 [host=debina0]
 183062 [host=debina0]
 183060 [host=pinot1]
 183064 [host=debina0]
 183066 [host=pinot1]
 183067 [host=pinot1]
 183068 [host=pinot1]
 183065 fail 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 ea36ac0de27c2a7c847a2a52c3e0f97a45864d81
 183069 [host=pinot1]
Searching for interesting versions
 Result found: flight 183030 (pass), for basis pass
 For basis failure, parent search stopping at 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7aa28849a1155d856e214e9a80a7e65fffdc3e58, results HASH(0x55ab122b27c8) HASH(0x55ab1230bfc0) HASH(0x55ab12338bf0) For basis failure, parent search stopping at 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996db\
 a9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 45f00557350dc7d0756551069803fc49c29184ca, results HASH(0x55ab122a9858) For basis failure, parent search stopping at 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2ea38251eb67639be7aa9d7b64084b1be0230273, results HASH(0x55ab122a59c8) HASH(0x55ab122ae010) Result found: flight 183031 (fail), for basis failure (at ancestor ~2128)
 Repro found: flight 183033 (pass), for basis pass
 Repro found: flight 183065 (fail), for basis failure
 0 revisions at 47230842aa6bca1da75cc92c50144f223d1ad1d3 22b8996dba9041874845c7446ce89ec4ae2b713d c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7aa28849a1155d856e214e9a80a7e65fffdc3e58
No revisions left to test, checking graph state.
 Result found: flight 183049 (pass), for last pass
 Result found: flight 183051 (fail), for first failure
 Repro found: flight 183052 (pass), for last pass
 Repro found: flight 183053 (fail), for first failure
 Repro found: flight 183054 (pass), for last pass
 Repro found: flight 183055 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  21bdc25b05a0f8ab6bc73520a9ca01327360732c
  Bug not present: 7aa28849a1155d856e214e9a80a7e65fffdc3e58
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/183055/


  commit 21bdc25b05a0f8ab6bc73520a9ca01327360732c
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Wed Sep 13 12:20:12 2023 +0100
  
      x86/entry: Track the IST-ness of an entry for the exit paths
      
      Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
      entry/exit asm, so it only needs setting in the IST path.
      
      As this is subtle and fragile, add check_ist_exit() to be used in debugging
      builds to cross-check that the ist_exit boolean matches the entry vector.
      
      Write check_ist_exit() it in C, because it's debug only and the logic more
      complicated than I care to maintain in asm.
      
      For now, we only need to use this signal in the exit-to-Xen path, but some
      exit-to-guest paths happen in IST context too.  Check the correctness in all
      exit paths to avoid the logic bit-rotting.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/test-amd64-amd64-libvirt.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
183069: truncated

flight 183069 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/183069/

Perfect :-)
All tests in this flight passed as required

jobs:
 build-amd64                                                  pass    
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt                                     truncated


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


