Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91A3FAB40
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 14:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174634.318435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKJan-0007dY-39; Sun, 29 Aug 2021 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174634.318435; Sun, 29 Aug 2021 12:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKJam-0007bg-Vh; Sun, 29 Aug 2021 12:07:16 +0000
Received: by outflank-mailman (input) for mailman id 174634;
 Sun, 29 Aug 2021 12:07:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKJak-0007bW-OZ; Sun, 29 Aug 2021 12:07:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKJak-000526-II; Sun, 29 Aug 2021 12:07:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKJaj-0007Q3-TE; Sun, 29 Aug 2021 12:07:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKJaj-0007Ea-Sl; Sun, 29 Aug 2021 12:07:13 +0000
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
	bh=tXNS7i71bNTggk27+qvtzTQf2K92Wi2f0CJojovZgzo=; b=iZX3MNZIVrBT9KXjggeDm6KYQi
	gwpe9MJlS7yd0hCgROknKZpAh/e4lIqoIgYmkHPjkqX9qXW8N6n+kUvUOz6STsQuA0u18l5XPx/g8
	lT738LVIQhaYYSRoOXG4oIM+2wFbqJf6MZZ68FehvYqMoLesT8UT0s9mjhKD1CLwNFxQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.11-testing bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1mKJaj-0007Ea-Sl@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 29 Aug 2021 12:07:13 +0000

branch xen-4.11-testing
xenbranch xen-4.11-testing
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164597/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164597.bisection-summary --basis-template=162548 --blessings=real,real-bisect,real-retry xen-4.11-testing test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164503 fail [host=fiano0] / 162548 [host=albana0] 161769 [host=huxelrebe1] 160155 [host=pinot0] 160141 [host=chardonnay1] 159459 ok.
Failure / basis pass flights: 164503 / 159459
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 76d369d33179a5f8e5f6607f3917db9ab8c22968
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#4f4d862c1c7232a18347616d94c343c929657fdb-7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 git://xenbits.xen.org/qemu-xen-traditional.git#c8ea0457495342c417c3dc033bb\
 a25148b279f60-c8ea0457495342c417c3dc033bba25148b279f60 git://xenbits.xen.org/qemu-xen.git#cf8d15e2819784ed2360b7b557f72db8f8db5ff6-cf8d15e2819784ed2360b7b557f72db8f8db5ff6 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#76d369d33179a5f8e5f6607f3917db9ab8c22968-ec4654ce64d87f14567008cfb42568fd434f1bed
Loaded 12607 nodes in revision graph
Searching for test results:
 159459 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 76d369d33179a5f8e5f6607f3917db9ab8c22968
 164486 fail irrelevant
 164504 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347616d94c343c929657fdb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 76d369d33179a5f8e5f6607f3917db9ab8c22968
 164503 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
 164531 fail irrelevant
 164532 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b233eb1849ac01bdd5b24ea84460a2e481a4c5a9 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 81433aa8a19b36f9e3d50697608c93d8a28bf772 b1e46bc369bb490b721c77f15d2583bbf466152d
 164533 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 939ed3a59223f516e5168577ba61ee3baf98eeea c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 e3c30795823672eec9bde75187e184f23ed98d70 ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164537 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 54082c81d96028ba8c76fbe6784085cf1df76b20 ec4654ce64d87f14567008cfb42568fd434f1bed
 164543 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 95616b866187b00355042953efa5c198df07250f c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 e3c30795823672eec9bde75187e184f23ed98d70 ef32c7afa2731b758226d6e10a1e489b1a15fc41
 164550 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2833589ad054ee51fadc5c408de4f028ddf485e3 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164553 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae4aa4a346832715509764fb2c3ecc1b1cc10480 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164559 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d6ba8aa6ef628f5d865865e0aba4a329ee0d0728 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164563 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164569 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164575 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164581 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164586 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164590 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 164597 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
 160141 [host=chardonnay1]
 160155 [host=pinot0]
 161769 [host=huxelrebe1]
 162548 [host=albana0]
Searching for interesting versions
 Result found: flight 159459 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d, results HASH(0x55ada800b228) HASH(0x55ada81671b8) HASH(0x55ada8033f98) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 d491c88a0c8bec7a0c8b51e0c7d1f8dc102cfa40 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d, results HASH(0x55ada8137600) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d6ba8aa6ef628f5d865865e0aba4a329ee0d0728 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b5\
 57f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d, results HASH(0x55ada8147fa0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ae4aa4a346832715509764fb2c3ecc1b1cc10480 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d, results HASH(0x55ada816d4d8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b233eb1849ac01bdd5b24ea84460a2e481a4c5a9 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 81433aa8a19b36f9e3d50697608c93d8a28bf772 b1e46bc369bb490b721c77f15d2583bbf466152d, results HASH(0x55ada7fde090) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4d862c1c7232a18347\
 616d94c343c929657fdb c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 76d369d33179a5f8e5f6607f3917db9ab8c22968, results HASH(0x55ada7fea3e8) HASH(0x55ada7fe11a0) Result found: flight 164503 (fail), for basis failure (at ancestor ~1152)
 Repro found: flight 164504 (pass), for basis pass
 Repro found: flight 164537 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 c8ea0457495342c417c3dc033bba25148b279f60 cf8d15e2819784ed2360b7b557f72db8f8db5ff6 7292e4a0a8f58333ccbd2d0d47242f9865083c9c b1e46bc369bb490b721c77f15d2583bbf466152d
No revisions left to test, checking graph state.
 Result found: flight 164569 (pass), for last pass
 Result found: flight 164575 (fail), for first failure
 Repro found: flight 164581 (pass), for last pass
 Repro found: flight 164586 (fail), for first failure
 Repro found: flight 164590 (pass), for last pass
 Repro found: flight 164597 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164597/


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

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.975586 to fit
pnmtopng: 65 colors found
Revision graph left in /home/logs/results/bisect/xen-4.11-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164597: tolerable ALL FAIL

flight 164597 xen-4.11-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164597/

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


