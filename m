Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A666E4ED3F3
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296659.505030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoKU-0001i6-Mw; Thu, 31 Mar 2022 06:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296659.505030; Thu, 31 Mar 2022 06:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZoKU-0001fy-K1; Thu, 31 Mar 2022 06:30:46 +0000
Received: by outflank-mailman (input) for mailman id 296659;
 Thu, 31 Mar 2022 06:30:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZoKS-0001fo-Jn; Thu, 31 Mar 2022 06:30:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZoKS-0006oW-DU; Thu, 31 Mar 2022 06:30:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nZoKS-0005MB-2K; Thu, 31 Mar 2022 06:30:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nZoKS-0007h1-1e; Thu, 31 Mar 2022 06:30:44 +0000
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
	bh=ykyb+/NjnaP4Du2H8NeTZVz4ik5yib3+9h2DNgbgNQI=; b=dvYLWWTfLyw1CFeXlaeu/4e1e3
	d7cW6I1wOiAuJO3F9Y0r7EHOJvUL+FR+gSDtwsqPno1uypMe6MJ5WDTe4QNMVCJGj191SCt7Nteel
	FqMMp9wQdYmOTwKSNL+JPYxlH6uQEg9EdonyJWivRyDJiHWeAt7zmZ6H/E5AiqjdMoVo=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-livepatch
Message-Id: <E1nZoKS-0007h1-1e@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 31 Mar 2022 06:30:44 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-amd64-livepatch
testid livepatch-run

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  72a75b9c2ce36ed573a2eb201ac63ca22bedb889
  Bug not present: 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169060/


  commit 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
  Author: Bjoern Doebel <doebel@amazon.de>
  Date:   Thu Mar 10 07:35:36 2022 +0000
  
      xen/x86: Livepatch: support patching CET-enhanced functions
      
      Xen enabled CET for supporting architectures. The control flow aspect of
      CET require functions that can be called indirectly (i.e., via function
      pointers) to start with an ENDBR64 instruction. Otherwise a control flow
      exception is raised.
      
      This expectation breaks livepatching flows because we patch functions by
      overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
      ENDBR64. We fix this by checking the start of a patched function for
      being ENDBR64. In the positive case we move the livepatch JMP to start
      behind the ENDBR64 instruction.
      
      To avoid having to guess the ENDBR64 offset again on patch reversal
      (which might race with other mechanisms adding/removing ENDBR
      dynamically), use the livepatch metadata to store the computed offset
      along with the saved bytes of the overwritten function.
      
      Signed-off-by: Bjoern Doebel <doebel@amazon.de>
      Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      (cherry picked from commit 6974c75180f1aad44e5428eabf2396b2b50fb0e4)
      
      Note: For backports to 4.14 thru 4.16, there is no endbr-clobbering, hence no
            is_endbr64_poison() logic.


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-livepatch.livepatch-run --summary-out=tmp/169060.bisection-summary --basis-template=168506 --blessings=real,real-bisect,real-retry xen-4.14-testing test-amd64-amd64-livepatch livepatch-run
Searching for failure / basis pass:
 168986 fail [host=albana1] / 168506 [host=godello0] 168493 [host=fiano1] 168061 [host=godello0] 168013 [host=fiano0] 167964 [host=pinot1] 167908 [host=huxelrebe1] 167629 [host=godello0] 167415 [host=godello0] 167216 [host=godello1] 166348 [host=godello0] 166310 ok.
Failure / basis pass flights: 168986 / 166310
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1e7306b54147e65cb7347b060e94f336d4a82d2 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 64f37cc530f144e53c190c9e8209a51b58fd5c43 9de3671772d5019dab2ba7be7ad1032ad3c9e0f2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#e1e7306b54147e65cb7347b060e94f336d4a82d2-b1b89f9009f2390652e0061bd7b24fc40732bc70 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#d7d6a60e73ee21e82f0bac2036153ccccf996e6c-83aebe33dc76760f911162f9e7a4b98a4929776b git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c43-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#9de3671772d5019dab2ba7be7ad1032ad3c9e0f2-1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
Loaded 12651 nodes in revision graph
Searching for test results:
 167216 [host=godello1]
 166310 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1e7306b54147e65cb7347b060e94f336d4a82d2 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 64f37cc530f144e53c190c9e8209a51b58fd5c43 9de3671772d5019dab2ba7be7ad1032ad3c9e0f2
 166348 [host=godello0]
 167415 [host=godello0]
 167629 [host=godello0]
 167812 []
 167822 []
 167864 []
 167908 [host=huxelrebe1]
 167964 [host=pinot1]
 168013 [host=fiano0]
 168061 [host=godello0]
 168493 [host=fiano1]
 168506 [host=godello0]
 168862 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 10b09aa2541de4c3c49b9343e9bc04e19f0ae4f8
 168986 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
 169026 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1e7306b54147e65cb7347b060e94f336d4a82d2 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 64f37cc530f144e53c190c9e8209a51b58fd5c43 9de3671772d5019dab2ba7be7ad1032ad3c9e0f2
 169027 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
 169030 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b47575801e1903e8b316d01840572ce2681cf2c6 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a
 169032 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 4eff93e7b0d093fd9347f2d533dada49854290fe 689734d05d5ec6b52b9e84807806471141088d84
 169034 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c09dbc92e9142ad46b3f73ac0eb5cc283cb81baf 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd f2eaa786062970eee41df1ffba1475f4ab36c234
 169037 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 496fb0be938a30971af05ffe0e58bb65643a0971
 169039 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 334120359d575b35ceeb261a1c854749e440217d
 169043 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db e56827aa689e57d485fe3b40c71c0061ce1ded3e
 169045 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 37e594c58ff43aa2d65f49bfde106ecaffbbeeac
 169050 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169053 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
 169056 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169057 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
 169059 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169060 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
Searching for interesting versions
 Result found: flight 166310 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8, results HASH(0x555db9aa7460) HASH(0x555db9a743a0) HASH(0x555db9a6ba58) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 37e594c58ff43aa2d65f49bfde106ecaffbbeeac, results HASH(0x555db9aa3450) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9\
 e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db e56827aa689e57d485fe3b40c71c0061ce1ded3e, results HASH(0x555db9aa0220) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 334120359d575b35ceeb261a1c854749e440217d, results HASH(0x555db9a90f98) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 496fb0be938a30971af05ffe0e58bb65643a0971, results HASH(0x555db9a81020) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c09dbc92e9142ad46b3f\
 73ac0eb5cc283cb81baf 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd f2eaa786062970eee41df1ffba1475f4ab36c234, results HASH(0x555db9a941c8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8cc5590eab974ab34e2bfa1c9d6a7ef94c70ffae 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 4eff93e7b0d093fd9347f2d533dada49854\
 290fe 689734d05d5ec6b52b9e84807806471141088d84, results HASH(0x555db9a769d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b47575801e1903e8b316d01840572ce2681cf2c6 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a, results HASH(0x555db9a78fd8) For basis failure, parent search stopping at c3038e718a19fc59\
 6f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e1e7306b54147e65cb7347b060e94f336d4a82d2 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 64f37cc530f144e53c190c9e8209a51b58fd5c43 9de3671772d5019dab2ba7be7ad1032ad3c9e0f2, results HASH(0x555db9a70990) HASH(0x555db9a70690) Result found: flight 168862 (fail), for basis failure (at ancestor ~800)
 Repro found: flight 169026 (pass), for basis pass
 Repro found: flight 169027 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
No revisions left to test, checking graph state.
 Result found: flight 169050 (pass), for last pass
 Result found: flight 169053 (fail), for first failure
 Repro found: flight 169056 (pass), for last pass
 Repro found: flight 169057 (fail), for first failure
 Repro found: flight 169059 (pass), for last pass
 Repro found: flight 169060 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  72a75b9c2ce36ed573a2eb201ac63ca22bedb889
  Bug not present: 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169060/


  commit 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
  Author: Bjoern Doebel <doebel@amazon.de>
  Date:   Thu Mar 10 07:35:36 2022 +0000
  
      xen/x86: Livepatch: support patching CET-enhanced functions
      
      Xen enabled CET for supporting architectures. The control flow aspect of
      CET require functions that can be called indirectly (i.e., via function
      pointers) to start with an ENDBR64 instruction. Otherwise a control flow
      exception is raised.
      
      This expectation breaks livepatching flows because we patch functions by
      overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
      ENDBR64. We fix this by checking the start of a patched function for
      being ENDBR64. In the positive case we move the livepatch JMP to start
      behind the ENDBR64 instruction.
      
      To avoid having to guess the ENDBR64 offset again on patch reversal
      (which might race with other mechanisms adding/removing ENDBR
      dynamically), use the livepatch metadata to store the computed offset
      along with the saved bytes of the overwritten function.
      
      Signed-off-by: Bjoern Doebel <doebel@amazon.de>
      Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
      Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
      Tested-by: Jiamei Xie <jiamei.xie@arm.com>
      (cherry picked from commit 6974c75180f1aad44e5428eabf2396b2b50fb0e4)
      
      Note: For backports to 4.14 thru 4.16, there is no endbr-clobbering, hence no
            is_endbr64_poison() logic.

pnmtopng: 123 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
169060: tolerable ALL FAIL

flight 169060 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169060/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-livepatch   13 livepatch-run           fail baseline untested


jobs:
 test-amd64-amd64-livepatch                                   fail    


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


