Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F453F4824
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170284.311052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6oC-0007Ka-5J; Mon, 23 Aug 2021 10:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170284.311052; Mon, 23 Aug 2021 10:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI6oC-0007IM-1b; Mon, 23 Aug 2021 10:04:00 +0000
Received: by outflank-mailman (input) for mailman id 170284;
 Mon, 23 Aug 2021 10:03:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI6o9-0007IC-Nc; Mon, 23 Aug 2021 10:03:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI6o9-00089r-FX; Mon, 23 Aug 2021 10:03:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mI6o9-0000Q7-5z; Mon, 23 Aug 2021 10:03:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mI6o9-00026T-5X; Mon, 23 Aug 2021 10:03:57 +0000
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
	bh=0CZldllB3EyCx7q3/UE/tikoPUrt9YnxZiZy4AgB8ng=; b=WC3HYv5lXOHyB4XiP+/sjzpwRu
	pQfk6agS0gjS2I/wmpnFIuEP7nrEnG9oQqlR7RdxUqXwxghFjWjzhrfDP7MP8feN1sjj4JZ4H8nGq
	VJnw4mY7fBgALR+oATMREeY2MHOpYMRm7mZhEVzKVUDopwkiKpETiCyLUeREoWf+zI5A=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1mI6o9-00026T-5X@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Aug 2021 10:03:57 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-i386-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164407/


  commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Author: Laszlo Ersek <lersek@redhat.com>
  Date:   Wed May 26 22:14:24 2021 +0200
  
      OvmfPkg/PlatformPei: remove Xen support
      
      The "OvmfPkg/PlatformPei/PlatformPei.inf" module is used by the following
      platform DSCs:
      
        OvmfPkg/AmdSev/AmdSevX64.dsc
        OvmfPkg/OvmfPkgIa32.dsc
        OvmfPkg/OvmfPkgIa32X64.dsc
        OvmfPkg/OvmfPkgX64.dsc
      
      Remove Xen support from "OvmfPkg/PlatformPei", including any dependencies
      that now become unused. The basic idea is to substitute FALSE for "mXen".
      
      Remove "OvmfPkg/PlatformPei" from the "OvmfPkg: Xen-related modules"
      section of "Maintainers.txt".
      
      This patch is best reviewed with "git show -b -W".
      
      Cc: Andrew Fish <afish@apple.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Leif Lindholm <leif@nuviainc.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
      Signed-off-by: Laszlo Ersek <lersek@redhat.com>
      Message-Id: <20210526201446.12554-22-lersek@redhat.com>
      Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Leif Lindholm <leif@nuviainc.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164407.bisection-summary --basis-template=163750 --blessings=real,real-bisect,real-retry xen-4.14-testing test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164300 fail [host=huxelrebe0] / 163750 [host=elbling1] 163726 [host=albana0] 163709 [host=chardonnay0] 162891 [host=albana0] 162881 [host=elbling1] 162547 [host=fiano0] 162365 [host=albana1] 161771 [host=albana1] 161484 [host=chardonnay1] 161324 [host=elbling0] 161048 [host=elbling1] 160156 [host=elbling0] 160143 [host=chardonnay1] 160127 [host=huxelrebe1] 159840 [host=chardonnay1] 159450 [host=elbling1] 159420 [host=fiano0] 158558 [host=fiano0] 157673 [host=huxelrebe1] 157650 [host=albana0] 15\
 7564 [host=fiano0] 157133 [host=fiano1] 156989 [host=elbling1] 156716 [host=huxelrebe1] 156670 [host=pinot0] 156617 [host=chardonnay0] 156594 [host=chardonnay1] 156525 [host=fiano1] 156460 [host=elbling1] 156394 [host=albana1] 156264 [host=fiano0] 156063 [host=albana1] 156031 [host=pinot0] 155417 [host=fiano0] 155303 [host=huxelrebe1] 155173 [host=rimava1] 155087 ok.
Failure / basis pass flights: 164300 / 155087
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#dd5c7e3c5282b084daa5bbf0ec229cec699b2c17-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-d7d6a60e73ee21e82f0bac2036153ccccf996e6c git://xenbits.xen.org/osstest/seabios.git#155821a1990b6de78dde5f98fa5ab90e802021e0-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#f37a1cf023b277d0d49323bf322ce3ff0c92262d-61f28060d5b899c502e2b3bf45a39b1dd2a1224c
Loaded 74248 nodes in revision graph
Searching for test results:
 162881 [host=elbling1]
 162891 [host=albana0]
 154641 [host=albana1]
 155016 [host=pinot0]
 155087 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155173 [host=rimava1]
 155303 [host=huxelrebe1]
 155417 [host=fiano0]
 156031 [host=pinot0]
 156063 [host=albana1]
 156264 [host=fiano0]
 156394 [host=albana1]
 156404 []
 156460 [host=elbling1]
 156525 [host=fiano1]
 163709 [host=chardonnay0]
 163726 [host=albana0]
 156594 [host=chardonnay1]
 156617 [host=chardonnay0]
 163750 [host=elbling1]
 156670 [host=pinot0]
 156716 [host=huxelrebe1]
 156989 [host=elbling1]
 157133 [host=fiano1]
 157564 [host=fiano0]
 157650 [host=albana0]
 157673 [host=huxelrebe1]
 158558 [host=fiano0]
 164261 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164299 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 164321 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164300 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 54082c81d96028ba8c76fbe6784085cf1df76b20 61f28060d5b899c502e2b3bf45a39b1dd2a1224c
 164328 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e64bd0704f08b0dd88fb88429f9db307ff26f4d5 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 4170218cb96546426664e5c1d00c5a848a26ae9e
 164333 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 34e16ff883f0e047fb9c0ac5c179f1b084ffbf98 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 10f0b2d49376865d49680f06c52b451fabce3bb5
 164338 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 19a541d70e0748af69d3b09d55a1415762c8d749 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e3c30795823672eec9bde75187e184f23ed98d70 b6a8c4f72def4d1135ff42660a86276ce2565c8c
 164342 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d4a8aaee7303c4095828aac79ce36704b24675d3 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164349 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e25566cd2bf03e9cf66f30c3b7c2b6944022ee5a 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164356 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164360 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164368 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164377 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164384 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164391 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164396 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164399 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164401 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164404 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 164407 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
 159420 [host=fiano0]
 159450 [host=elbling1]
 159840 [host=chardonnay1]
 160127 [host=huxelrebe1]
 160143 [host=chardonnay1]
 160156 [host=elbling0]
 161048 [host=elbling1]
 161324 [host=elbling0]
 161484 [host=chardonnay1]
 161771 [host=albana1]
 162365 [host=albana1]
 162547 [host=fiano0]
Searching for interesting versions
 Result found: flight 155087 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x5590906bae60) HASH(0x5590907315a8) HASH(0x5590906e8920) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x5590906d2430) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac20\
 36153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x5590907150a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x55909071e2e8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x559090721cf8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e25566cd2bf03e9cf66f\
 30c3b7c2b6944022ee5a 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98, results HASH(0x55909070d838) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 34e16ff883f0e047fb9c0ac5c179f1b084ffbf98 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6eff8085980dba0938cea0193b8a0fd3c6b\
 0c4ca 10f0b2d49376865d49680f06c52b451fabce3bb5, results HASH(0x5590906abed8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e64bd0704f08b0dd88fb88429f9db307ff26f4d5 3c659044118e34603161457db9934a34f816d78b e6a4cbe48cfca6adbe4e7acdf7e405c8315facaa ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 4170218cb96546426664e5c1d00c5a848a26ae9e, results HASH(0x55908bda62d0) Result found: flight 164261 (fail), for basis failure (at anc\
 estor ~1239)
 Repro found: flight 164299 (pass), for basis pass
 Repro found: flight 164300 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b046e05736deecbd8254540c5e45444115fb1c98
No revisions left to test, checking graph state.
 Result found: flight 164391 (pass), for last pass
 Result found: flight 164396 (fail), for first failure
 Repro found: flight 164399 (pass), for last pass
 Repro found: flight 164401 (fail), for first failure
 Repro found: flight 164404 (pass), for last pass
 Repro found: flight 164407 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164407/


  commit d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Author: Laszlo Ersek <lersek@redhat.com>
  Date:   Wed May 26 22:14:24 2021 +0200
  
      OvmfPkg/PlatformPei: remove Xen support
      
      The "OvmfPkg/PlatformPei/PlatformPei.inf" module is used by the following
      platform DSCs:
      
        OvmfPkg/AmdSev/AmdSevX64.dsc
        OvmfPkg/OvmfPkgIa32.dsc
        OvmfPkg/OvmfPkgIa32X64.dsc
        OvmfPkg/OvmfPkgX64.dsc
      
      Remove Xen support from "OvmfPkg/PlatformPei", including any dependencies
      that now become unused. The basic idea is to substitute FALSE for "mXen".
      
      Remove "OvmfPkg/PlatformPei" from the "OvmfPkg: Xen-related modules"
      section of "Maintainers.txt".
      
      This patch is best reviewed with "git show -b -W".
      
      Cc: Andrew Fish <afish@apple.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Leif Lindholm <leif@nuviainc.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2122
      Signed-off-by: Laszlo Ersek <lersek@redhat.com>
      Message-Id: <20210526201446.12554-22-lersek@redhat.com>
      Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Leif Lindholm <leif@nuviainc.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.432802 to fit
pnmtopng: 57 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164407: tolerable ALL FAIL

flight 164407 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164407/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


