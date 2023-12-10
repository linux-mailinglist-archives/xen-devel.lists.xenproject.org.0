Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006CD80BCB2
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 20:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651427.1017114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCPDc-0002K5-U4; Sun, 10 Dec 2023 19:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651427.1017114; Sun, 10 Dec 2023 19:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCPDc-0002IM-RG; Sun, 10 Dec 2023 19:12:00 +0000
Received: by outflank-mailman (input) for mailman id 651427;
 Sun, 10 Dec 2023 19:11:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCPDb-0002IC-LU; Sun, 10 Dec 2023 19:11:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCPDb-0002w2-9o; Sun, 10 Dec 2023 19:11:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rCPDa-0003A6-Ql; Sun, 10 Dec 2023 19:11:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rCPDa-0003E8-QL; Sun, 10 Dec 2023 19:11:58 +0000
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
	bh=ePnyff3hB3d3stsEbKUSWe9flR4lZBVn94GZXawuLDs=; b=AXK/psEjJxtNAnCzCQNOofcuee
	qZXo56NiJZyYJkAfOtgUlxEXVRZsyY/y0WxDHMOaNLjqVfgRp0dsFr/aVWQhz3TunqsYl4IYKX+G2
	tnzmCY2IsiGptSn+0FVA0s6mWAxG6ZENKuxMog3RDz0teC3mNofQuzCd4NLgzKxC/MEk=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1rCPDa-0003E8-QL@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Dec 2023 19:11:58 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bc4fe94a69d4dab103c37045d97e589ef75f8647
  Bug not present: e6e8c5831a64420a56f83e87919ed157ab810fab
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184083/


  commit bc4fe94a69d4dab103c37045d97e589ef75f8647
  Author: Juergen Gross <jgross@suse.com>
  Date:   Thu Dec 7 07:25:51 2023 +0100
  
      tools/libs/evtchn: replace assert()s in stubdom with proper locking
      
      In tools/libs/evtchn/minios.c there are assert()s for the current
      thread being the main thread when binding an event channel.
      
      As Mini-OS is supporting multiple threads, there is no real reason
      why the binding shouldn't be allowed to happen in any other thread.
      
      Drop the assert()s and replace them with proper locking of the
      port_list.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/184083.bisection-summary --basis-template=184031 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 184064 fail [host=albana0] / 184031 [host=elbling0] 184020 [host=debina0] 184005 [host=albana1] 183996 [host=huxelrebe1] 183990 [host=debina1] 183983 [host=nobling0] 183978 [host=rimava1] 183974 ok.
Failure / basis pass flights: 184064 / 183974
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 525c7c094b258e8a46b494488eef96f5670eb352
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#525c7c094b258e8a46b494488eef96f5670eb352-bc4fe94a69d4dab103c37045d97e589ef75f8647
Loaded 5001 nodes in revision graph
Searching for test results:
 183971 [host=fiano1]
 183990 [host=debina1]
 183974 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 525c7c094b258e8a46b494488eef96f5670eb352
 183978 [host=rimava1]
 183983 [host=nobling0]
 183996 [host=huxelrebe1]
 184005 [host=albana1]
 184020 [host=debina0]
 184031 [host=elbling0]
 184036 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184044 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184053 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184066 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 525c7c094b258e8a46b494488eef96f5670eb352
 184067 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184070 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 634c6e15ac44cd6b09a79126bf1424fd72ab31df
 184071 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 dbe69e1c8555b40a43cde482615501eb8515ab80
 184072 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 02d0a615b32d03702f79807fa5e88f0cf78dde84
 184064 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184073 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 25147005daf5a4e121b96496d6d208fac05fca35
 184075 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d2b7c442b4a066bb670ee83e24800cabc415241d
 184077 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184079 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184080 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184081 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184082 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184083 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
Searching for interesting versions
 Result found: flight 183974 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab, results HASH(0x55f51ec0f3e0) HASH(0x55f51ebfffd8) HASH(0x55f51e6abe10) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 d2b7c442b4a066bb670ee83e24800cabc415241d, results HASH(0x55f51ec08c20) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 25147005daf5a4e121b96496d6d208fac05fca35, results HASH(0x55f51ec0e960) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 02d0a615b32d03702f79807fa5e88f0cf78dde84, results HASH(0x55f51ec09848) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 dbe69e1c8555b40a43cde482615501eb8515ab80, results HASH(0x55f51ec09548) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 634c6e15ac44cd6b09a79126bf1424fd72ab31df, results HASH(0x55f51ec084a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 525c7c094b258e8a46b494488eef96f5670eb352, results HASH(0x55f51ebfac2\
 0) HASH(0x55f51ec0ac50) Result found: flight 184036 (fail), for basis failure (at ancestor ~2514)
 Repro found: flight 184066 (pass), for basis pass
 Repro found: flight 184067 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
No revisions left to test, checking graph state.
 Result found: flight 184077 (pass), for last pass
 Result found: flight 184079 (fail), for first failure
 Repro found: flight 184080 (pass), for last pass
 Repro found: flight 184081 (fail), for first failure
 Repro found: flight 184082 (pass), for last pass
 Repro found: flight 184083 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bc4fe94a69d4dab103c37045d97e589ef75f8647
  Bug not present: e6e8c5831a64420a56f83e87919ed157ab810fab
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184083/


  commit bc4fe94a69d4dab103c37045d97e589ef75f8647
  Author: Juergen Gross <jgross@suse.com>
  Date:   Thu Dec 7 07:25:51 2023 +0100
  
      tools/libs/evtchn: replace assert()s in stubdom with proper locking
      
      In tools/libs/evtchn/minios.c there are assert()s for the current
      thread being the main thread when binding an event channel.
      
      As Mini-OS is supporting multiple threads, there is no real reason
      why the binding shouldn't be allowed to happen in any other thread.
      
      Drop the assert()s and replace them with proper locking of the
      port_list.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
184083: tolerable ALL FAIL

flight 184083 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/184083/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail    


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


