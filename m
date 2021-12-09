Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A216B46F11E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 18:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243207.420642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvMvd-0007Sr-FJ; Thu, 09 Dec 2021 17:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243207.420642; Thu, 09 Dec 2021 17:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvMvd-0007QT-C3; Thu, 09 Dec 2021 17:09:57 +0000
Received: by outflank-mailman (input) for mailman id 243207;
 Thu, 09 Dec 2021 17:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvMvb-0007QI-VX; Thu, 09 Dec 2021 17:09:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvMvb-0006G0-Pp; Thu, 09 Dec 2021 17:09:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvMvb-0008VM-Je; Thu, 09 Dec 2021 17:09:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvMvb-00052k-J8; Thu, 09 Dec 2021 17:09:55 +0000
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
	bh=7QZDeeRcRMQ/y3I7t3KH/GUH0kKvN5H0WalhVolmWAY=; b=Xbjm0ZLu9nwpE4u5bXAXYTUsJG
	XKYHwZfWC7p8EZI/BCPkoAD0MtjoWPWWDS4g+H4+lJB/WbAJwpMIPhi/vdexqRcoma/0jX5Y8WOoM
	FgRCk0xGHTAfCAfii8Tm7og8tmOMC4NyQHqXot15uHH8zaKSGeuN2+3Ky655NyDiTJZo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-i386-xsm
Message-Id: <E1mvMvb-00052k-J8@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Dec 2021 17:09:55 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Bug not present: d39f8d88ecb31df46e2f95bcc5c20100d1f14681
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167273/


  commit 202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Author: Brijesh Singh <brijesh.singh@amd.com>
  Date:   Thu Dec 9 11:27:46 2021 +0800
  
      OvmfPkg/SecMain: validate the memory used for decompressing Fv
      
      BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3275
      
      The VMM launch sequence should have pre-validated all the data pages used
      in the Reset vector. The range does not cover the data pages used during
      the SEC phase (mainly PEI and DXE firmware volume decompression memory).
      
      When SEV-SNP is active, the memory must be pre-validated before the access.
      Add support to pre-validate the memory range from SnpSecPreValidatedStart
      to SnpSecPreValidatedEnd. This should be sufficent to enter into the PEI
      phase.
      
      Cc: Michael Roth <michael.roth@amd.com>
      Cc: James Bottomley <jejb@linux.ibm.com>
      Cc: Min Xu <min.m.xu@intel.com>
      Cc: Jiewen Yao <jiewen.yao@intel.com>
      Cc: Tom Lendacky <thomas.lendacky@amd.com>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Erdem Aktas <erdemaktas@google.com>
      Cc: Gerd Hoffmann <kraxel@redhat.com>
      Acked-by: Jiewen Yao <Jiewen.yao@intel.com>
      Acked-by: Gerd Hoffmann <kraxel@redhat.com>
      Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386-xsm.xen-build --summary-out=tmp/167273.bisection-summary --basis-template=167239 --blessings=real,real-bisect,real-retry ovmf build-i386-xsm xen-build
Searching for failure / basis pass:
 167271 fail [host=huxelrebe0] / 167239 ok.
Failure / basis pass flights: 167271 / 167239
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
Basis pass c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d-06544455d0d460ed18c8582121247bf53292d7e4 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b6e539830bf45e2d7a6bd86ddfdf003088b173b0-b6e539830bf45e2d7a6bd86ddfdf003088b173b0 git://xenbits.xen.org/osstest/seabios.git#2dd4b9b3f84019668719344b40dba79d681be4\
 1c-2dd4b9b3f84019668719344b40dba79d681be41c git://xenbits.xen.org/xen.git#608531a0cc34a5bc096ccf585e16f182b5ed83e1-c62d634cce8b1507d00a61bfc8168ac42367fe87
Loaded 10001 nodes in revision graph
Searching for test results:
 167239 pass c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1
 167240 fail irrelevant
 167242 [host=huxelrebe1]
 167247 [host=huxelrebe1]
 167253 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167258 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167257 [host=huxelrebe1]
 167259 pass c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1
 167260 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167261 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167262 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167263 pass d706f8fec256585de76280d2a1e1aa9550cefe12 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167264 fail f4e3ce5f532860bbcf3a78d38f699dfbff0e1e75 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167265 fail 8eb79b5f4fed31667f27b7ac97b568724fe12496 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167266 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167268 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167267 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167269 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167270 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167271 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167273 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167272 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
Searching for interesting versions
 Result found: flight 167239 (pass), for basis pass
 For basis failure, parent search stopping at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55b0fce3e0c8) HASH(0x55b0fce42d00) HASH(0x55b0fce25450) For basis failure, parent search stopping at d706f8fec256585de76280d2a1e1aa9550cefe12 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f\
 84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55b0fce36a08) For basis failure, parent search stopping at c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1, results HASH(0x55b0fce26678) HASH(0x55b0fce2e9c0) Result found: flight 167253 (fail), for basis failure (at ancestor ~5226)
 Repro found: flight 167259 (pass), for basis pass
 Repro found: flight 167260 (fail), for basis failure
 0 revisions at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
No revisions left to test, checking graph state.
 Result found: flight 167266 (pass), for last pass
 Result found: flight 167268 (fail), for first failure
 Repro found: flight 167269 (pass), for last pass
 Repro found: flight 167270 (fail), for first failure
 Repro found: flight 167272 (pass), for last pass
 Repro found: flight 167273 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Bug not present: d39f8d88ecb31df46e2f95bcc5c20100d1f14681
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167273/


  commit 202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Author: Brijesh Singh <brijesh.singh@amd.com>
  Date:   Thu Dec 9 11:27:46 2021 +0800
  
      OvmfPkg/SecMain: validate the memory used for decompressing Fv
      
      BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3275
      
      The VMM launch sequence should have pre-validated all the data pages used
      in the Reset vector. The range does not cover the data pages used during
      the SEC phase (mainly PEI and DXE firmware volume decompression memory).
      
      When SEV-SNP is active, the memory must be pre-validated before the access.
      Add support to pre-validate the memory range from SnpSecPreValidatedStart
      to SnpSecPreValidatedEnd. This should be sufficent to enter into the PEI
      phase.
      
      Cc: Michael Roth <michael.roth@amd.com>
      Cc: James Bottomley <jejb@linux.ibm.com>
      Cc: Min Xu <min.m.xu@intel.com>
      Cc: Jiewen Yao <jiewen.yao@intel.com>
      Cc: Tom Lendacky <thomas.lendacky@amd.com>
      Cc: Jordan Justen <jordan.l.justen@intel.com>
      Cc: Ard Biesheuvel <ardb+tianocore@kernel.org>
      Cc: Erdem Aktas <erdemaktas@google.com>
      Cc: Gerd Hoffmann <kraxel@redhat.com>
      Acked-by: Jiewen Yao <Jiewen.yao@intel.com>
      Acked-by: Gerd Hoffmann <kraxel@redhat.com>
      Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

Revision graph left in /home/logs/results/bisect/ovmf/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
167273: tolerable ALL FAIL

flight 167273 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/167273/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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


