Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725853F435F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 04:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170137.310759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHzT3-0000a3-PN; Mon, 23 Aug 2021 02:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170137.310759; Mon, 23 Aug 2021 02:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHzT3-0000YF-I8; Mon, 23 Aug 2021 02:13:41 +0000
Received: by outflank-mailman (input) for mailman id 170137;
 Mon, 23 Aug 2021 02:13:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHzT1-0000Y5-AS; Mon, 23 Aug 2021 02:13:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHzT1-0005b7-5h; Mon, 23 Aug 2021 02:13:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mHzT0-0003St-UQ; Mon, 23 Aug 2021 02:13:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mHzT0-0003tN-Tw; Mon, 23 Aug 2021 02:13:38 +0000
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
	bh=BDN7xn24FtTUR2RfhdITMPAbKQeyU6m+O236ZWY6V18=; b=g8MceoJ0D1iCPyr4POECtGu1lK
	A/6ot06/lW/U2wKqBEwkvBLQgizSZGBrOxWI9MIu2lm5wRf+nOJCM9oNuHGKzPXcBwJ4/uVtcnR+8
	5EW0PdBq3Z6J3CpLEIi/zrpyiIOwXWl7H1FNKxQdH1+ToipseGdbg52byCF/IIuZki2Y=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1mHzT0-0003tN-Tw@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 23 Aug 2021 02:13:38 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164385/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164385.bisection-summary --basis-template=163761 --blessings=real,real-bisect,real-retry xen-4.13-testing test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164301 fail [host=elbling0] / 163761 ok.
Failure / basis pass flights: 164301 / 163761
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#32d580902b959000d79d51dff03a3560653c4fcb-3cdc7b6b35106180c9021c1742cafacfa764fdad
Loaded 10001 nodes in revision graph
Searching for test results:
 163761 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164260 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164322 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164327 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b37cfdd2807181aed2fee1e17bd7ec1190db266a d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164301 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164302 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164331 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 54e90edaed0d7c15230902ac4d74f4304bad2ebd d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164337 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b005f9f1f51c2b0ce680b42b7a743b430d8f2625 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164341 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 747b1ef72543c321c386198641a29de7f8537520 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164345 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164350 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164355 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164357 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164362 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164367 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164372 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164381 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
 164385 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
Searching for interesting versions
 Result found: flight 163761 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb, results HASH(0x55dc0866bbc0) HASH(0x55dc08764be8) HASH(0x55dc0875d190) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb, results HASH(0x55dc0875f820) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7\
 db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb, results HASH(0x55dc0863a808) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 747b1ef72543c321c386198641a29de7f8537520 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb, results HASH(0x55dc0875fb20) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb, results HASH(0x55dc086506d0) HASH(0x55dc0863eb18) Result found: flight 164260 (fail), for basis failure (at ancestor ~1865)
 Repro found: flight 164302 (pass), for basis pass
 Repro found: flight 164322 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 32d580902b959000d79d51dff03a3560653c4fcb
No revisions left to test, checking graph state.
 Result found: flight 164357 (pass), for last pass
 Result found: flight 164362 (fail), for first failure
 Repro found: flight 164367 (pass), for last pass
 Repro found: flight 164372 (fail), for first failure
 Repro found: flight 164381 (pass), for last pass
 Repro found: flight 164385 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164385/


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

pnmtopng: 203 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164385: tolerable ALL FAIL

flight 164385 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164385/

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


