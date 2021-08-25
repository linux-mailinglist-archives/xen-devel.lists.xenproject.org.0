Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC63F7ED9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 01:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172597.314950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ1v7-00062A-Ne; Wed, 25 Aug 2021 23:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172597.314950; Wed, 25 Aug 2021 23:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ1v7-0005yp-K8; Wed, 25 Aug 2021 23:02:57 +0000
Received: by outflank-mailman (input) for mailman id 172597;
 Wed, 25 Aug 2021 23:02:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ1v5-0005yf-M5; Wed, 25 Aug 2021 23:02:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ1v4-0008AU-Vl; Wed, 25 Aug 2021 23:02:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ1v4-0007aJ-I3; Wed, 25 Aug 2021 23:02:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mJ1v4-0008HY-Ez; Wed, 25 Aug 2021 23:02:54 +0000
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
	bh=ANZ5aVoexPdKFC7JS/CXkUeQJ2jVk1WBfNHICGRRRbU=; b=XaTP12oIH/DYST+Zvm9BY98DM0
	ZEAjClk5GQS/u+Ro9sPBP1II1eHGHIFOCHPYZ6Rz6zfVVBsCzwSakUY6oydFpwxfjCz3+7pn6Z47N
	+cw9plaUmtfCw3hkHIhkuR3s9buT4I3jRZOT42y8hQvX7GqVputqQFTU/uvddNMMUQmo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-amd64-i386-xl-qemuu-ovmf-amd64
Message-Id: <E1mJ1v4-0008HY-Ez@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 Aug 2021 23:02:54 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164492/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/164492.bisection-summary --basis-template=163761 --blessings=real,real-bisect,real-retry xen-4.13-testing test-amd64-i386-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 164371 fail [host=elbling1] / 163761 [host=fiano1] 163730 [host=elbling0] 163711 [host=huxelrebe0] 162550 [host=albana0] 162367 [host=fiano1] 161770 [host=fiano1] 161323 [host=fiano0] 160326 [host=elbling0] 160154 [host=chardonnay1] 160142 [host=chardonnay0] 160129 [host=fiano1] 159839 [host=chardonnay1] 159448 [host=chardonnay0] 159419 [host=fiano0] 158557 [host=chardonnay0] 157733 [host=huxelrebe0] 157716 [host=albana0] 157664 [host=albana1] 157629 [host=chardonnay0] 157597 ok.
Failure / basis pass flights: 164371 / 157597
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#f95e80d832e923046c92cd6f0b8208cec147138e-ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#748d619be3282fba35f99446098ac2d0579f6063-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#10c7c213bef26274684798deb3e351a6756046d2-3cdc7b6b35106180c9021c1742cafacfa764fdad
Loaded 12607 nodes in revision graph
Searching for test results:
 163711 [host=huxelrebe0]
 163730 [host=elbling0]
 163761 [host=fiano1]
 157563 [host=elbling0]
 157597 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
 157629 [host=chardonnay0]
 157664 [host=albana1]
 157716 [host=albana0]
 157733 [host=huxelrebe0]
 158557 [host=chardonnay0]
 164260 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164301 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164394 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2
 164371 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164427 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef56f55d19e1b0b4ba6f9b28d73165c7f0a4627c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 3cdc7b6b35106180c9021c1742cafacfa764fdad
 164434 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 96afc546881c173caeac329702d1dee541d35617 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 57a60c1f2779ce6d6ab5c2f677c4d0c66b09b08b
 164438 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 33d4f3e39ee6ea0743bd6a3a8a3261c9a4d16a29 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164447 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5b90b8abb4049e2d98040f548ad23b6ab22d5d19 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 33049e3ad9c3a0f7432969f4b5d7b1a287b5b8f9
 164450 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c394fa4c9eef5621e419e51e28ba0de5ba7ec2a3 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 284132938900ce8c3b11babf7255f5c6dbb21716
 164459 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa7f19f480551b1f19f8798e5b18dbe1d8d32d0c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 159419 [host=fiano0]
 164465 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164467 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b005f9f1f51c2b0ce680b42b7a743b430d8f2625 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 159448 [host=chardonnay0]
 164471 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164475 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164479 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164483 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164485 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164488 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164490 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 164492 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
 159839 [host=chardonnay1]
 160129 [host=fiano1]
 160142 [host=chardonnay0]
 160154 [host=chardonnay1]
 160326 [host=elbling0]
 161323 [host=fiano0]
 161770 [host=fiano1]
 162367 [host=fiano1]
 162550 [host=albana0]
Searching for interesting versions
 Result found: flight 157597 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416, results HASH(0x5651692e0b58) HASH(0x5651692c0250) HASH(0x5651692c0550) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 e7641171b6c1f858f3d979c0e8f04d6c12870baa d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416, results HASH(0x5651692c8b98) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7\
 db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416, results HASH(0x5651693fd6b0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 aa7f19f480551b1f19f8798e5b18dbe1d8d32d0c d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416, results HASH(0x565169305ca8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c394fa4c9eef5621e419e51e28ba0de5ba7ec2a3 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 6eff8085980dba0938cea0193b8a0fd3c6b0c4ca 284132938900ce8c3b11babf7255f5c6dbb21716, results HASH(0x5651692fdc60) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5b90b8abb4049e2d9804\
 0f548ad23b6ab22d5d19 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 33049e3ad9c3a0f7432969f4b5d7b1a287b5b8f9, results HASH(0x5651692f6a20) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 96afc546881c173caeac329702d1dee541d35617 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 b0d61ecef66eb05bd7a4eb7ada88ec5dab0\
 6dfee 57a60c1f2779ce6d6ab5c2f677c4d0c66b09b08b, results HASH(0x5651692d3810) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95e80d832e923046c92cd6f0b8208cec147138e d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 748d619be3282fba35f99446098ac2d0579f6063 10c7c213bef26274684798deb3e351a6756046d2, results HASH(0x5651692b7f08) HASH(0x56516929a4d8) Result found: flight 164260 (fail), for \
 basis failure (at ancestor ~2490)
 Repro found: flight 164394 (pass), for basis pass
 Repro found: flight 164427 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 7292e4a0a8f58333ccbd2d0d47242f9865083c9c ef8b2357d83442b5d2e7607379a935d4f8b35416
No revisions left to test, checking graph state.
 Result found: flight 164479 (pass), for last pass
 Result found: flight 164483 (fail), for first failure
 Repro found: flight 164485 (pass), for last pass
 Repro found: flight 164488 (fail), for first failure
 Repro found: flight 164490 (pass), for last pass
 Repro found: flight 164492 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164492/


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

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.571381 to fit
pnmtopng: 65 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-amd64-i386-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
164492: tolerable ALL FAIL

flight 164492 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164492/

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


