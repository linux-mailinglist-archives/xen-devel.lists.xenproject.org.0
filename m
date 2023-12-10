Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5BC80B834
	for <lists+xen-devel@lfdr.de>; Sun, 10 Dec 2023 01:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651165.1016860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rC7Os-0006Oj-M6; Sun, 10 Dec 2023 00:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651165.1016860; Sun, 10 Dec 2023 00:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rC7Os-0006Mi-Il; Sun, 10 Dec 2023 00:10:26 +0000
Received: by outflank-mailman (input) for mailman id 651165;
 Sun, 10 Dec 2023 00:10:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rC7Oq-0006MY-Hl; Sun, 10 Dec 2023 00:10:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rC7Oq-00060I-7a; Sun, 10 Dec 2023 00:10:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rC7Op-0003Lp-Ta; Sun, 10 Dec 2023 00:10:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rC7Op-0007Xx-Sy; Sun, 10 Dec 2023 00:10:23 +0000
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
	bh=uMMNVAEPmnrhF96IbPh0015g7avckmVbvyi9DscEzOM=; b=r7eK6OvE1jEgTiSAY1BndYvDUt
	IK5UDVjiWMCeOmCweH9GNLtj4tnrwnkKGkRpfqIoTvxECG7YVWZCQClO05eb3jgVIY0Vi9AB1NTHM
	n7puurtINDExASiTB15/AquKB9QffAd0JtKtFA9EXGbNnbixckIn/MECA3uior0el8tc=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
Message-Id: <E1rC7Op-0007Xx-Sy@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Dec 2023 00:10:23 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184065/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install --summary-out=tmp/184065.bisection-summary --basis-template=184031 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm debian-hvm-install
Searching for failure / basis pass:
 184053 fail [host=sabro0] / 184031 [host=albana1] 184020 [host=elbling0] 184005 [host=italia0] 183996 [host=sabro1] 183990 [host=elbling1] 183983 [host=godello0] 183978 [host=nobling1] 183974 [host=fiano0] 183971 [host=italia1] 183965 [host=rimava1] 183959 [host=nobling0] 183952 [host=godello1] 183938 [host=debina0] 183922 [host=himrod0] 183877 [host=fiano1] 183860 [host=albana0] 183855 [host=nobling0] 183852 [host=debina1] 183847 [host=italia0] 183839 [host=albana1] 183831 ok.
Failure / basis pass flights: 184053 / 183831
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c22fe7213c9b1f99cbc64c33e391afa223f9cd08
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#c22fe7213c9b1f99cbc64c33e391afa223f9cd08-bc4fe94a69d4dab103c37045d97e589ef75f8647
Loaded 5001 nodes in revision graph
Searching for test results:
 183831 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c22fe7213c9b1f99cbc64c33e391afa223f9cd08
 183839 [host=albana1]
 183847 [host=italia0]
 183852 [host=debina1]
 183855 [host=nobling0]
 183860 [host=albana0]
 183877 [host=fiano1]
 183922 [host=himrod0]
 183938 [host=debina0]
 183952 [host=godello1]
 183959 [host=nobling0]
 183965 [host=rimava1]
 183971 [host=italia1]
 183990 [host=elbling1]
 183974 [host=fiano0]
 183978 [host=nobling1]
 183983 [host=godello0]
 183996 [host=sabro1]
 184005 [host=italia0]
 184020 [host=elbling0]
 184031 [host=albana1]
 184036 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184043 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c22fe7213c9b1f99cbc64c33e391afa223f9cd08
 184046 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184048 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7e1f5b68acc70a16f0848fb6b87a5eab9833663a
 184049 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d830b0a7bc7e82289b6280a28aaa4fefd54e6e19
 184050 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 24b267269599d3c6043ea1af529e64a241fd00f0
 184044 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184052 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 cddc66b1ea80bed653fce43d5cd98221dabbccf6
 184054 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 23792cc0f22cff4e106d838b83aa9ae1cb6ffaf4
 184055 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d2b7c442b4a066bb670ee83e24800cabc415241d
 184057 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184060 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184061 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184062 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184053 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
 184063 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
 184065 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 bc4fe94a69d4dab103c37045d97e589ef75f8647
Searching for interesting versions
 Result found: flight 183831 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab, results HASH(0x5633fb1277b8) HASH(0x5633fb12f4a0) HASH(0x5633fabd9d60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 d2b7c442b4a066bb670ee83e24800cabc415241d, results HASH(0x5633fb11f470) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 23792cc0f22cff4e106d838b83aa9ae1cb6ffaf4, results HASH(0x5633fb11d768) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 cddc66b1ea80bed653fce43d5cd98221dabbccf6, results HASH(0x5633fb123aa8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 24b267269599d3c6043ea1af529e64a241fd00f0, results HASH(0x5633fb12daf8) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 d830b0a7bc7e82289b6280a28aaa4fefd54e6e19, results HASH(0x5633fb1234a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 7e1f5b68acc70a16f0848fb6b87a5eab9833663a, results HASH(0x5633fb1237a\
 8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c22fe7213c9b1f99cbc64c33e391afa223f9cd08, results HASH(0x5633fb126eb8) HASH(0x5633fb1357e0) Result found: flight 184036 (fail), for basis failure (at ancestor ~2514)
 Repro found: flight 184043 (pass), for basis pass
 Repro found: flight 184044 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 e6e8c5831a64420a56f83e87919ed157ab810fab
No revisions left to test, checking graph state.
 Result found: flight 184057 (pass), for last pass
 Result found: flight 184060 (fail), for first failure
 Repro found: flight 184061 (pass), for last pass
 Repro found: flight 184062 (fail), for first failure
 Repro found: flight 184063 (pass), for last pass
 Repro found: flight 184065 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  bc4fe94a69d4dab103c37045d97e589ef75f8647
  Bug not present: e6e8c5831a64420a56f83e87919ed157ab810fab
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/184065/


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

pnmtopng: 247 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
184065: tolerable ALL FAIL

flight 184065 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/184065/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        fail    


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


