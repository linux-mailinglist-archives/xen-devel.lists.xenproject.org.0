Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B439D2E5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137523.254833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq4x1-0000ey-41; Mon, 07 Jun 2021 02:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137523.254833; Mon, 07 Jun 2021 02:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq4x0-0000cd-UY; Mon, 07 Jun 2021 02:25:14 +0000
Received: by outflank-mailman (input) for mailman id 137523;
 Mon, 07 Jun 2021 02:25:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lq4wz-0000cT-8S; Mon, 07 Jun 2021 02:25:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lq4wy-0004HX-4L; Mon, 07 Jun 2021 02:25:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lq4wx-00030z-T0; Mon, 07 Jun 2021 02:25:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lq4wx-00044v-SU; Mon, 07 Jun 2021 02:25:11 +0000
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
	bh=gLB/Xq99arg8EtmKesx8MDCoUNOTwi1u7v+KHVzvv/4=; b=cpEpCuIDzURLIzDuoE0uAbzlgy
	gIsWswF9pSiRYUe3AhT1HrVfq2Je1vxMHzVZOCk2K/k+MDUMkt3ssXVATz2BIi+0G5ZJkGmYE2TND
	rMTcaVwR1rJiFWatfMXKhm97od1D36zapwaCz8UieZvuAF17/wkAWjICD8ImrhoE7Iro=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1lq4wx-00044v-SU@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Jun 2021 02:25:11 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162473/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/162473.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 162454 fail [host=albana1] / 162379 ok.
Failure / basis pass flights: 162454 / 162379
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ddb3fdbef30de5a2946f9bd51060e8d5b1987aef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f398e533f5e259b4f937f4aa9de970f7201d166 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0-ddb3fdbef30de5a2946f9bd51060e8d5b1987aef git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#1cbd2d914939ee6028e9688d4ba859a528c28405-6f398e533f5e259b4f937f4aa9de970f7201d166 git://xenbits.xen.org/osstest/seabios.git#7292e4a0a8f58333ccbd2d0d47242f9865083c9c-7292e4a0a8f58333ccbd2d0d47242f9865083c9c git://xenbits.xen.org/xen.git#5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1-5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Loaded 15001 nodes in revision graph
Searching for test results:
 162409 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51adb689e1db695cffdeeacafad218768fbc018c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f398e533f5e259b4f937f4aa9de970f7201d166 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162379 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162428 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 924c2b847f0bc4325f6d14e562e2fb2d8acbc4d0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162434 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51adb689e1db695cffdeeacafad218768fbc018c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f398e533f5e259b4f937f4aa9de970f7201d166 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162439 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e120c962f50432199d4125f0b7066a78ccbad6f3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162443 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d6ba8aa6ef628f5d865865e0aba4a329ee0d0728 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162448 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162429 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51adb689e1db695cffdeeacafad218768fbc018c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f398e533f5e259b4f937f4aa9de970f7201d166 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162452 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162456 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162458 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162462 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162465 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162468 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162471 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162454 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ddb3fdbef30de5a2946f9bd51060e8d5b1987aef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f398e533f5e259b4f937f4aa9de970f7201d166 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162473 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Searching for interesting versions
 Result found: flight 162379 (pass), for basis pass
 Result found: flight 162409 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 162428 (pass), for basis pass
 Repro found: flight 162454 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1cbd2d914939ee6028e9688d4ba859a528c28405 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
No revisions left to test, checking graph state.
 Result found: flight 162458 (pass), for last pass
 Result found: flight 162462 (fail), for first failure
 Repro found: flight 162465 (pass), for last pass
 Repro found: flight 162468 (fail), for first failure
 Repro found: flight 162471 (pass), for last pass
 Repro found: flight 162473 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162473/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
162473: tolerable ALL FAIL

flight 162473 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162473/

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


