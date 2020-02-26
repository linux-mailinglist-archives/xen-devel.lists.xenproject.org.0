Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE116FC5C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:36:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tzg-0003yd-6o; Wed, 26 Feb 2020 10:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TlQQ=4O=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j6tze-0003yU-B0
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:32:42 +0000
X-Inumbo-ID: 4d43241a-5883-11ea-93ed-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d43241a-5883-11ea-93ed-12813bfff9fa;
 Wed, 26 Feb 2020 10:32:35 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j6tzW-0005Is-L5; Wed, 26 Feb 2020 10:32:34 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j6tzV-0000V1-LO; Wed, 26 Feb 2020 10:32:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j6tzV-0007sa-Kr; Wed, 26 Feb 2020 10:32:33 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1j6tzV-0007sa-Kr@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Feb 2020 10:32:33 +0000
Subject: [Xen-devel] [linux-4.14 bisection] complete
 test-amd64-amd64-qemuu-nested-intel
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
Content-Type: multipart/mixed; boundary="===============3013074907412398665=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3013074907412398665==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install/l1/l2

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f96e1469ad06b61796c60193daaeb9f8a96d7458
  Bug not present: 0729830cc425a8ff27a3137e87b93768ae3c853c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/147628/


  commit f96e1469ad06b61796c60193daaeb9f8a96d7458
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 5 13:49:09 2020 +0100
  
      x86/vvmx: fix virtual interrupt injection when Ack on exit control is used
      
      When doing a virtual vmexit (ie: a vmexit handled by the L1 VMM)
      interrupts shouldn't be injected using the virtual interrupt delivery
      mechanism unless the Ack on exit vmexit control bit isn't set in the
      nested vmcs.
      
      Gate the call to nvmx_update_apicv helper on whether the nested vmcs
      has the Ack on exit bit set in the vmexit control field.
      
      Note that this fixes the usage of x2APIC by the L1 VMM, at least when
      the L1 VMM is Xen.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-4.14/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-4.14/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/147628.bisection-summary --basis-template=142849 --blessings=real,real-bisect linux-4.14 test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 147487 fail [host=chardonnay0] / 147038 [host=godello1] 146981 [host=huxelrebe0] 146905 [host=godello0] 143911 [host=godello1] 143834 [host=italia0] 143610 [host=elbling0] 143513 ok.
Failure / basis pass flights: 147487 / 143513
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
Basis pass ddef1e8e3f6eb26034833b7255e3fa584d54a230 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b15646484eaffcf7cc464fdea0214498f26addc2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#ddef1e8e3f6eb26034833b7255e3fa584d54a230-98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#b15646484eaffcf7cc464fdea0214498f26addc2-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen-traditional\
 .git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#120996f147131eca8af90e30c900bc14bc824d9f-76551856b28d227cb0386a1ab0e774329b941f7d git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-c47984aabead53918e5ba6d43cdb3f1467452739
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 13452 nodes in revision graph
Searching for test results:
 143409 [host=elbling1]
 143513 pass ddef1e8e3f6eb26034833b7255e3fa584d54a230 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b15646484eaffcf7cc464fdea0214498f26addc2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143610 [host=elbling0]
 143834 [host=italia0]
 143911 [host=godello1]
 146857 []
 146905 [host=godello0]
 146981 [host=huxelrebe0]
 147094 fail irrelevant
 147038 [host=godello1]
 147245 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147166 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147334 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147418 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 147555 blocked 721e7e7f3de9d00896ba902278ee4025a0ab58bb c530a75c1e6a472b0eb9558310b518f0dfcd8860 bfb141cf19dd6f9b8df8b9d0914a5b3b15e1a798 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 5083e0ff939d149860db40e0da54ea2048749471
 147549 pass bfb9e5c03076a446b1f4f6a523ddc8d723c907a6 c530a75c1e6a472b0eb9558310b518f0dfcd8860 665afccc52e1a02ee329147e02f04b8e9cf1d571 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 147524 pass ddef1e8e3f6eb26034833b7255e3fa584d54a230 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b15646484eaffcf7cc464fdea0214498f26addc2 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 147545 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 147558 pass 4bec32f211ff4a6269a35089559fab2559ce7602 c530a75c1e6a472b0eb9558310b518f0dfcd8860 54a07f8fe088d1fe3b7a6fec76d64ab25cdba656 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 183f354e1430087879de071f0c7122e42703916e
 147487 fail 98db2bf27b9ed2d5ed0b6c9c8a4bfcb127a19796 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d c47984aabead53918e5ba6d43cdb3f1467452739
 147564 pass ca76e5b3504fc0a72168c4982053604b4d7814ad c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 021cc01ecac111be3301ad33ff5cda4543ca8b92
 147571 pass 4127249099b796b1fd5c74562ce94b94cda38553 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3c601c5f056fba055b7a1438b84b69fc649275c3
 147601 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 960dd83213d8798e939f1805c8a29d0086fedb5d
 147576 fail e0f8b8a65a473a8baa439cf865a694bbeb83fe90 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 1f68bfb3816e8c82a6449d4505bdc4e7143cd9d7
 147625 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147580 fail 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d a1a357fcf5e7e2f49dfc45a138c15f504ae1b481
 147607 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147587 pass c2764d4449e8634c0d020dcf68aabae2f5ffd85d c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d a29f19f7476a13cd6d7757b3aa5eb26ffd9e3c54
 147592 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 837da5e3a31938891e4bada2497ec6b7b73908cc
 147613 fail 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d a8effbffe586f020e2db400e2c25ae52e36cc1bd
 147595 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 4b84622d887def7c45e130a615e702e0200745c9
 147617 fail 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 147628 fail 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 147619 pass 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147622 fail 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
Searching for interesting versions
 Result found: flight 143513 (pass), for basis pass
 Result found: flight 147418 (fail), for basis failure
 Repro found: flight 147524 (pass), for basis pass
 Repro found: flight 147545 (fail), for basis failure
 0 revisions at 9fa690a2a016e1b55356835f047b952e67d3d73a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
No revisions left to test, checking graph state.
 Result found: flight 147607 (pass), for last pass
 Result found: flight 147617 (fail), for first failure
 Repro found: flight 147619 (pass), for last pass
 Repro found: flight 147622 (fail), for first failure
 Repro found: flight 147625 (pass), for last pass
 Repro found: flight 147628 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f96e1469ad06b61796c60193daaeb9f8a96d7458
  Bug not present: 0729830cc425a8ff27a3137e87b93768ae3c853c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/147628/


  commit f96e1469ad06b61796c60193daaeb9f8a96d7458
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Wed Feb 5 13:49:09 2020 +0100
  
      x86/vvmx: fix virtual interrupt injection when Ack on exit control is used
      
      When doing a virtual vmexit (ie: a vmexit handled by the L1 VMM)
      interrupts shouldn't be injected using the virtual interrupt delivery
      mechanism unless the Ack on exit vmexit control bit isn't set in the
      nested vmcs.
      
      Gate the call to nvmx_update_apicv helper on whether the nested vmcs
      has the Ack on exit bit set in the vmexit control field.
      
      Note that this fixes the usage of x2APIC by the L1 VMM, at least when
      the L1 VMM is Xen.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Kevin Tian <kevin.tian@intel.com>

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.160198 to fit
pnmtopng: 32 colors found
Revision graph left in /home/logs/results/bisect/linux-4.14/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
147628: tolerable ALL FAIL

flight 147628 linux-4.14 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/147628/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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



--===============3013074907412398665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3013074907412398665==--
