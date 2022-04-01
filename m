Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463F4EEA0E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 10:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297285.506353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naD7i-0006wE-KA; Fri, 01 Apr 2022 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297285.506353; Fri, 01 Apr 2022 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naD7i-0006tL-H0; Fri, 01 Apr 2022 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 297285;
 Fri, 01 Apr 2022 08:59:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naD7h-0006tB-1V; Fri, 01 Apr 2022 08:59:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naD7g-00010p-UW; Fri, 01 Apr 2022 08:59:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naD7g-0004v8-Jv; Fri, 01 Apr 2022 08:59:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1naD7g-0004xT-JQ; Fri, 01 Apr 2022 08:59:12 +0000
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
	bh=zpmeEVrEpbmO0R9MASkqaiOA2bQVOECkYrUj7/+9mi0=; b=RGNs7Dz5BHal1zJEUognYqcHDw
	AyAKRXcrwzvETVm/8wKgduEb4elgvwLk8iigTS8B8Rwhal54XTRFWaekt4zMjSKEpjHyAHLHNfHMA
	a0jtI4qM1g1twtwTO7kcIQj2QnuK9Wkh52YvuYgSnn/0JuSUYftQMUIdUKva5PSURHoE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-i386-livepatch
Message-Id: <E1naD7g-0004xT-JQ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 01 Apr 2022 08:59:12 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-i386-livepatch
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169105/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-i386-livepatch.livepatch-run.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-i386-livepatch.livepatch-run --summary-out=tmp/169105.bisection-summary --basis-template=168506 --blessings=real,real-bisect,real-retry xen-4.14-testing test-amd64-i386-livepatch livepatch-run
Searching for failure / basis pass:
 169028 fail [host=elbling1] / 168506 [host=fiano0] 168493 [host=huxelrebe0] 168061 [host=albana0] 168013 [host=chardonnay0] 167964 [host=albana1] 167908 [host=elbling0] 167629 [host=fiano0] 167415 ok.
Failure / basis pass flights: 169028 / 167415
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c039fa7ff09729de07bc7ebcdd4878340bfaf252 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c039fa7ff09729de07bc7ebcdd4878340bfaf252-b1b89f9009f2390652e0061bd7b24fc40732bc70 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#d7d6a60e73ee21e82f0bac2036153ccccf996e6c-83aebe33dc76760f911162f9e7a4b98a4929776b git://xenbits.xen.org/osstest/seabios.git#2dd4b9b3f84019668719344b40dba79d681be41c-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#cbadf67bcab4e29c883410db393f4f5ef34df04a-1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
Loaded 12651 nodes in revision graph
Searching for test results:
 167415 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c039fa7ff09729de07bc7ebcdd4878340bfaf252 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a
 167629 [host=fiano0]
 167812 []
 167822 []
 167864 []
 167908 [host=elbling0]
 167964 [host=albana1]
 168013 [host=chardonnay0]
 168061 [host=albana0]
 168493 [host=huxelrebe0]
 168506 [host=fiano0]
 168862 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 10b09aa2541de4c3c49b9343e9bc04e19f0ae4f8
 168986 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
 169061 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c039fa7ff09729de07bc7ebcdd4878340bfaf252 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a
 169065 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
 169066 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 4eff93e7b0d093fd9347f2d533dada49854290fe c45c2c2e09295ef3008a79d78673af0819ff4e4f
 169068 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608ff56e87905bdeacdbd47 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 15bb12ed367babfe212c8a90d384b11849d98573
 169028 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 1e595d9c2b8608bcef48d6a69cc2f6135780bcc0
 169070 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 63c50d3ff2854a76432b752af4f2a76f33ff1974 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 496fb0be938a30971af05ffe0e58bb65643a0971
 169073 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 5e7db069bde7ce50fe15e42dbd2468d294ae78db
 169076 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db cc080e630fa105d6924142be5ddb430756779528
 169082 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 37e594c58ff43aa2d65f49bfde106ecaffbbeeac
 169087 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169092 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
 169096 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169101 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
 169104 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
 169105 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 72a75b9c2ce36ed573a2eb201ac63ca22bedb889
Searching for interesting versions
 Result found: flight 167415 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8, results HASH(0x5601c5ac2bc0) HASH(0x5601c5a927f8) HASH(0x5601c5ac7bc0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 37e594c58ff43aa2d65f49bfde106ecaffbbeeac, results HASH(0x5601c5ad0088) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9\
 e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db cc080e630fa105d6924142be5ddb430756779528, results HASH(0x5601c5ace080) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 5e7db069bde7ce50fe15e42dbd2468d294ae78db, results HASH(0x5601c4bfb1f8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 63c50d3ff2854a76432b752af4f2a76f33ff1974 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 496fb0be938a30971af05ffe0e58bb65643a0971, results HASH(0x5601c5ac9448) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33189f05278345eab608\
 ff56e87905bdeacdbd47 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 15bb12ed367babfe212c8a90d384b11849d98573, results HASH(0x5601c5aac9d0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 4eff93e7b0d093fd9347f2d533dada49854\
 290fe c45c2c2e09295ef3008a79d78673af0819ff4e4f, results HASH(0x5601c5ac31c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c039fa7ff09729de07bc7ebcdd4878340bfaf252 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c cbadf67bcab4e29c883410db393f4f5ef34df04a, results HASH(0x5601c5aaa0c8) HASH(0x5601c5a89288) Result found: flight 168862 (fail), for \
 basis failure (at ancestor ~616)
 Repro found: flight 169061 (pass), for basis pass
 Repro found: flight 169065 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b1b89f9009f2390652e0061bd7b24fc40732bc70 3c659044118e34603161457db9934a34f816d78b 83aebe33dc76760f911162f9e7a4b98a4929776b d239552ce7220e448ae81f41515138f7b9e3c4db 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
No revisions left to test, checking graph state.
 Result found: flight 169087 (pass), for last pass
 Result found: flight 169092 (fail), for first failure
 Repro found: flight 169096 (pass), for last pass
 Repro found: flight 169101 (fail), for first failure
 Repro found: flight 169104 (pass), for last pass
 Repro found: flight 169105 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  72a75b9c2ce36ed573a2eb201ac63ca22bedb889
  Bug not present: 6db64187700d6d1ce23f49e667c24f1c7ebe11f8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/169105/


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

pnmtopng: 209 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-i386-livepatch.livepatch-run.{dot,ps,png,html,svg}.
----------------------------------------
169105: tolerable ALL FAIL

flight 169105 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/169105/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-livepatch    13 livepatch-run           fail baseline untested


jobs:
 test-amd64-i386-livepatch                                    fail    


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


