Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E43A2885
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 11:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139768.258385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHA1-0002Qp-NA; Thu, 10 Jun 2021 09:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139768.258385; Thu, 10 Jun 2021 09:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHA1-0002Oe-IR; Thu, 10 Jun 2021 09:39:37 +0000
Received: by outflank-mailman (input) for mailman id 139768;
 Thu, 10 Jun 2021 09:39:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrHA0-0002NH-3h; Thu, 10 Jun 2021 09:39:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrH9z-0003Gp-T8; Thu, 10 Jun 2021 09:39:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lrH9z-0007TS-Lq; Thu, 10 Jun 2021 09:39:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lrH9z-0008Gv-LK; Thu, 10 Jun 2021 09:39:35 +0000
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
	bh=z8MZHlfJyHLvJrRLMLrLR/SyLlhU/yhdm2hOk0AjiCc=; b=lGQReG2rWfkJU/YIF9f8qT7GH+
	hQR4XjvARymu/DY6YJYTp9kHS0AZEsDrI46IgyDjZ5iG6/nC5OEgaGvVCHdfkrr5dykVb8v+Gypiz
	QnGcFUKm3qxYejPYXexeiVE3rtUYP2peY1fpxpEgle2GWPNY37N6Hl5nwbrDlo4ienU4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1lrH9z-0008Gv-LK@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 10 Jun 2021 09:39:35 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162596/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/162596.bisection-summary --basis-template=162359 --blessings=real,real-bisect,real-retry ovmf test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 162552 fail [host=godello1] / 162359 [host=elbling1] 162341 [host=fiano0] 162338 [host=elbling0] 162334 [host=albana1] 162326 [host=chardonnay1] 162288 [host=fiano1] 162271 [host=godello0] 162259 [host=huxelrebe0] 162256 [host=albana0] 162217 [host=huxelrebe1] 162131 [host=chardonnay0] 162113 [host=pinot1] 162111 ok.
Failure / basis pass flights: 162552 / 162111
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 04ae17218deec25c6f488609c5e2ca9c419d2c4b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#04ae17218deec25c6f488609c5e2ca9c419d2c4b-558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-7292e4a0a8f58333ccbd2d0d47242f9865083c9c git://xenbits.xen.org/xen.git#aa77acc28098d04945af998f3fc0dbd3759b5b41-5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Loaded 12601 nodes in revision graph
Searching for test results:
 162111 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 04ae17218deec25c6f488609c5e2ca9c419d2c4b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
 162113 [host=pinot1]
 162131 [host=chardonnay0]
 162217 [host=huxelrebe1]
 162256 [host=albana0]
 162259 [host=huxelrebe0]
 162271 [host=godello0]
 162288 [host=fiano1]
 162326 [host=chardonnay1]
 162334 [host=albana1]
 162338 [host=elbling0]
 162341 [host=fiano0]
 162359 [host=elbling1]
 162368 []
 162371 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 51adb689e1db695cffdeeacafad218768fbc018c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162436 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ddb3fdbef30de5a2946f9bd51060e8d5b1987aef 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162542 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162577 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 04ae17218deec25c6f488609c5e2ca9c419d2c4b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41
 162578 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162579 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 81433aa8a19b36f9e3d50697608c93d8a28bf772 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162580 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162581 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c2f24ba3218ae91a8d5a1a31c31dad3417850d0c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162552 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 558d83ab1a5179e146a56dd5f3cb16e1ca44ff46 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162582 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2833589ad054ee51fadc5c408de4f028ddf485e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162585 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162586 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162589 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162593 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162594 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
 162596 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
Searching for interesting versions
 Result found: flight 162111 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1, results HASH(0x561ecdb33290) HASH(0x561ecce93d58) HASH(0x561eccdf4b08) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 4174c5c7874ec21c2e693565d3685cf9f5c2e2e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1, results HASH(0x561ecdb1aa98) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 75e9154f818a58ffc3a28db9f8c97279e723f02d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0\
 bd11a38aac308308 81433aa8a19b36f9e3d50697608c93d8a28bf772 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1, results HASH(0x561ecdb31408) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 04ae17218deec25c6f488609c5e2ca9c419d2c4b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee aa77acc28098d04945af998f3fc0dbd3759b5b41, results HASH(0x561ecdb2b0c8) HASH(0x56\
 1ecdb18790) Result found: flight 162371 (fail), for basis failure (at ancestor ~5477)
 Repro found: flight 162577 (pass), for basis pass
 Repro found: flight 162578 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3357ac73807d83eb212632ee7c2e032a20a49c56 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 7292e4a0a8f58333ccbd2d0d47242f9865083c9c 5268b2dcf7e5342c8a51ceb4bed3e7740c69f5c1
No revisions left to test, checking graph state.
 Result found: flight 162585 (pass), for last pass
 Result found: flight 162586 (fail), for first failure
 Repro found: flight 162589 (pass), for last pass
 Repro found: flight 162593 (fail), for first failure
 Repro found: flight 162594 (pass), for last pass
 Repro found: flight 162596 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d06eb2d1d9dd8da1ed84bd08c5783a0264fe2b64
  Bug not present: 3357ac73807d83eb212632ee7c2e032a20a49c56
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/162596/


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

Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
162596: tolerable ALL FAIL

flight 162596 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/162596/

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


