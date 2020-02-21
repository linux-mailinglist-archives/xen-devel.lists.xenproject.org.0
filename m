Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4D166E9B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 05:44:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j507F-0007CO-H7; Fri, 21 Feb 2020 04:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wNFe=4J=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1j507D-0007CJ-4n
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 04:40:39 +0000
X-Inumbo-ID: 4dd02608-5464-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dd02608-5464-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 04:40:36 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j507A-0000Oq-GW; Fri, 21 Feb 2020 04:40:36 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1j507A-0004IG-8d; Fri, 21 Feb 2020 04:40:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1j507A-0003Wv-7y; Fri, 21 Feb 2020 04:40:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1j507A-0003Wv-7y@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Feb 2020 04:40:36 +0000
Subject: [Xen-devel] [linux-4.19 bisection] complete
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
Content-Type: multipart/mixed; boundary="===============2011020131458167305=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2011020131458167305==
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/147382/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-4.19/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-4.19/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/147382.bisection-summary --basis-template=142932 --blessings=real,real-bisect linux-4.19 test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 147222 fail [host=fiano0] / 147024 [host=italia0] 146943 [host=godello0] 146901 [host=huxelrebe0] 146851 [host=godello1] 143841 ok.
Failure / basis pass flights: 147222 / 143841
(tree with no url: minios)
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 9b15f7fae677336e04b9e026ff91854e43165455 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
Basis pass ef244c3088856cf048c77231653b4c92a7b2213c c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#ef244c3088856cf048c77231653b4c92a7b2213c-9b15f7fae677336e04b9e026ff91854e43165455 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8d3f428109623096cb8845779cdf9dc44949b8e9-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen-traditional\
 .git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#c1ab7d7ed5306641784a9ed8972db5151a49a1a1-76551856b28d227cb0386a1ab0e774329b941f7d git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-707db77a380b96025bae8bc4322da0b64819d3b7
Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 13324 nodes in revision graph
Searching for test results:
 143841 pass ef244c3088856cf048c77231653b4c92a7b2213c c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 146851 [host=godello1]
 146901 [host=huxelrebe0]
 147024 [host=italia0]
 146943 [host=godello0]
 147075 fail irrelevant
 147222 fail 9b15f7fae677336e04b9e026ff91854e43165455 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147224 pass ef244c3088856cf048c77231653b4c92a7b2213c c530a75c1e6a472b0eb9558310b518f0dfcd8860 8d3f428109623096cb8845779cdf9dc44949b8e9 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c1ab7d7ed5306641784a9ed8972db5151a49a1a1 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 147144 fail 9b15f7fae677336e04b9e026ff91854e43165455 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147338 pass 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 443fd9d5bd1fb063149ae6d527174839bdb8dd01
 147280 fail 9b15f7fae677336e04b9e026ff91854e43165455 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 707db77a380b96025bae8bc4322da0b64819d3b7
 147314 fail b499cf4b3a901e87e1f933df04abf69b54de4457 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 4e3322ec14155d3580fcbbe64e342c98182c1848
 147284 pass 7d120bf21c05cbe30a679f0feeca884eeaceb069 c530a75c1e6a472b0eb9558310b518f0dfcd8860 665afccc52e1a02ee329147e02f04b8e9cf1d571 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 147301 pass 88ad6b6d8f9d45b4812ebaeca5454c767fdec76e c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3c601c5f056fba055b7a1438b84b69fc649275c3
 147292 blocked e0dd31b9e5f4d1ff5edc36f12c52d1b997004fc4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bfb141cf19dd6f9b8df8b9d0914a5b3b15e1a798 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 5083e0ff939d149860db40e0da54ea2048749471
 147295 pass 3bef7420e129e3fb65e4e8368d61f909c4393786 c530a75c1e6a472b0eb9558310b518f0dfcd8860 54a07f8fe088d1fe3b7a6fec76d64ab25cdba656 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef c9ba5276e3217ac6a1ec772dbebf568ba3a8a55d 183f354e1430087879de071f0c7122e42703916e
 147307 pass 7734f040753a08fe0d008afe582e28feb5e07928 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 3c601c5f056fba055b7a1438b84b69fc649275c3
 147326 fail 28fc6259cff958191d3ae8c71a1ce13f2e17a09a c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 2575d77a678ec3156f537b012eb5e797917d4025
 147318 pass b271314b3ce1ff4bb780a9831fdb853ea9758317 c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 41d8869003e96d8b7250ad1d0246371d6929aca6
 147331 pass 64f79f17243eca348aa5fc5e2f0a6539d717a67b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 41d8869003e96d8b7250ad1d0246371d6929aca6
 147348 fail 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 67f9d0b95ae2cd441bc003e03ae69a487f7b40bb
 147358 pass 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f7fb9a0aa9fbb81292e1626ce40340d3f6d8d505
 147364 pass 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147368 fail 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 147374 pass 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147376 fail 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
 147379 pass 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
 147382 fail 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d f96e1469ad06b61796c60193daaeb9f8a96d7458
Searching for interesting versions
 Result found: flight 143841 (pass), for basis pass
 Result found: flight 147144 (fail), for basis failure
 Repro found: flight 147224 (pass), for basis pass
 Repro found: flight 147280 (fail), for basis failure
 0 revisions at 32ee7492f104d82b01a44fc4b4ae17d5d2bb237b c530a75c1e6a472b0eb9558310b518f0dfcd8860 70911f1f4aee0366b6122f2b90d367ec0f066beb d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 0729830cc425a8ff27a3137e87b93768ae3c853c
No revisions left to test, checking graph state.
 Result found: flight 147364 (pass), for last pass
 Result found: flight 147368 (fail), for first failure
 Repro found: flight 147374 (pass), for last pass
 Repro found: flight 147376 (fail), for first failure
 Repro found: flight 147379 (pass), for last pass
 Repro found: flight 147382 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f96e1469ad06b61796c60193daaeb9f8a96d7458
  Bug not present: 0729830cc425a8ff27a3137e87b93768ae3c853c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/147382/


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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.115866 to fit
pnmtopng: 14 colors found
Revision graph left in /home/logs/results/bisect/linux-4.19/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
147382: tolerable ALL FAIL

flight 147382 linux-4.19 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/147382/

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



--===============2011020131458167305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2011020131458167305==--
