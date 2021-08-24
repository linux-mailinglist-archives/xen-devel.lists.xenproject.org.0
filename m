Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4B3F6563
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 19:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171662.313227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIZx0-00081Y-S7; Tue, 24 Aug 2021 17:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171662.313227; Tue, 24 Aug 2021 17:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIZx0-0007yr-Lb; Tue, 24 Aug 2021 17:11:02 +0000
Received: by outflank-mailman (input) for mailman id 171662;
 Tue, 24 Aug 2021 17:11:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIZwz-0007yb-Bj; Tue, 24 Aug 2021 17:11:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIZwz-0000Hg-3j; Tue, 24 Aug 2021 17:11:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mIZwy-000782-Sj; Tue, 24 Aug 2021 17:11:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mIZwy-0003Uk-SE; Tue, 24 Aug 2021 17:11:00 +0000
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
	bh=kkCL+K95Mq58rfWPcrbgtT0A4iY0/GauMtmbyuAdIBU=; b=1juXNvqXaEmH4u63mCpwSjgCHO
	Oj8qyVUwsmmTeDCTuSFJIoIUICSNCz1GmWpa4F4x0ozx9xashoi73RjVMBYsZ1rThHPsfSDwAuiJj
	Stb38D9Gq6Hd5IW17nRdHHf6ZszqbdB8f5oHhXGbgLQ0Odfqnb/SJySjcZO56SX42l7M=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.12-testing bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1mIZwy-0003Uk-SE@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 24 Aug 2021 17:11:00 +0000

branch xen-4.12-testing
xenbranch xen-4.12-testing
job test-amd64-amd64-xl-qemuu-ovmf-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164446/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164446.bisection-summary --basis-template=162549 --blessings=real,real-bisect,real-retry xen-4.12-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164334 fail [host=huxelrebe0] / 162549 [host=elbling0] 161821 ok.
Failure / basis pass flights: 164334 / 161821
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 54082c81d96028ba8c76fbe6784085cf1df76b20 c6c5f9d8b3e23178341cd7f9b7614a463df74266
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 5984905b2638df87a0262d1ee91f0a6e14a86df6
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#f297b7f20010711e36e981fe45645302cc9d109d-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#92a78636a51611475f711637c44cafbda3ef9859-92a78636a51611475f711637c44cafbda3ef9859 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#5984905b2638df87a0262d1ee91f0a6e14a86df6-c6c5f9d8b3e23178341cd7f9b7614a463df74266
Loaded 12607 nodes in revision graph
Searching for test results:
 164259 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 54082c81d96028ba8c76fbe6784085cf1df76b20 c6c5f9d8b3e23178341cd7f9b7614a463df74266
 164298 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 54082c81d96028ba8c76fbe6784085cf1df76b20 c6c5f9d8b3e23178341cd7f9b7614a463df74266
 164334 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 54082c81d96028ba8c76fbe6784085cf1df76b20 c6c5f9d8b3e23178341cd7f9b7614a463df74266
 164389 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164410 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 54082c81d96028ba8c76fbe6784085cf1df76b20 c6c5f9d8b3e23178341cd7f9b7614a463df74266
 164411 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 20ca52882877ba9025da2ee58c8dab7808eca457 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 e3c30795823672eec9bde75187e184f23ed98d70 ea20eee97e9e0861127a8070cc7b9ae3557b09fb
 164414 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164415 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 adfa3327d4fc25d5eff5fedcdb11ecde52a995cc d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164418 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e25566cd2bf03e9cf66f30c3b7c2b6944022ee5a d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164419 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164422 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164425 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164428 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164430 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164431 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164436 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164440 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164443 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 164446 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
 161776 [host=godello0]
 161807 [host=albana1]
 161821 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 5984905b2638df87a0262d1ee91f0a6e14a86df6
 162549 [host=elbling0]
Searching for interesting versions
 Result found: flight 161821 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364c0890) HASH(0x55e3363aced8) HASH(0x55e3363ba158) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364beee8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637\
 c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364bd480) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8f8d3d90c5c5e317693a87339f9ddf9d7412a0fc d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364bbad8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c9bba52fc7312e8ea9071f9a4b7005954e36e0c1 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364ba070) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e25566cd2bf03e9cf66f\
 30c3b7c2b6944022ee5a d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e3364b6e60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 adfa3327d4fc25d5eff5fedcdb11ecde52a995cc d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 6eff8085980dba0938cea0193b8a0fd3c6b\
 0c4ca 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e33648a9a8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f297b7f20010711e36e981fe45645302cc9d109d d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 5984905b2638df87a0262d1ee91f0a6e14a86df6, results HASH(0x55e336383b68) HASH(0x55e3364b6560) Result found: flight 164259 (fail), for \
 basis failure (at ancestor ~896)
 Repro found: flight 164389 (pass), for basis pass
 Repro found: flight 164410 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 92a78636a51611475f711637c44cafbda3ef9859 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5984905b2638df87a0262d1ee91f0a6e14a86df6
No revisions left to test, checking graph state.
 Result found: flight 164430 (pass), for last pass
 Result found: flight 164431 (fail), for first failure
 Repro found: flight 164436 (pass), for last pass
 Repro found: flight 164440 (fail), for first failure
 Repro found: flight 164443 (pass), for last pass
 Repro found: flight 164446 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164446/


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

pnmtopng: 135 colors found
Revision graph left in /home/logs/results/bisect/xen-4.12-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164446: tolerable ALL FAIL

flight 164446 xen-4.12-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164446/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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


