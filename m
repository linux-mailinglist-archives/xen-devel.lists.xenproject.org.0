Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D546FAC0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 07:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243551.421399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvZdp-00086y-OA; Fri, 10 Dec 2021 06:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243551.421399; Fri, 10 Dec 2021 06:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvZdp-000843-KX; Fri, 10 Dec 2021 06:44:25 +0000
Received: by outflank-mailman (input) for mailman id 243551;
 Fri, 10 Dec 2021 06:44:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvZdo-00083t-Ak; Fri, 10 Dec 2021 06:44:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvZdo-00073H-5R; Fri, 10 Dec 2021 06:44:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvZdn-0004ss-VM; Fri, 10 Dec 2021 06:44:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvZdn-0007VC-Ur; Fri, 10 Dec 2021 06:44:23 +0000
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
	bh=KL+X/i8cNmtvLqtIXm3ZyQql1KQGGQlImS5ELeko1Nk=; b=CoWA4G6CLXKKftRjDnLtLUFNZj
	sTXYWvCfhgNmybgByXmOrs+ClekWLLi6mFIsFzw5SreRbLiFX7TDdqkftZiG/JZq5Ql/FIU7ZaWmM
	TnCXvL1A+/E2Fwr+qyobya2lSoRObyx2x4tbBq1tmzRDa6aaUS90MR/fYsMvItcFR0EU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-amd64-xsm
Message-Id: <E1mvZdn-0007VC-Ur@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Dec 2021 06:44:23 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167333/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build --summary-out=tmp/167333.bisection-summary --basis-template=167239 --blessings=real,real-bisect,real-retry ovmf build-amd64-xsm xen-build
Searching for failure / basis pass:
 167324 fail [host=himrod1] / 167239 ok.
Failure / basis pass flights: 167324 / 167239
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
 167242 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167247 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167253 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167258 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167260 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167262 [host=himrod2]
 167267 [host=himrod2]
 167271 [host=himrod2]
 167275 [host=himrod2]
 167279 [host=himrod2]
 167283 [host=himrod2]
 167285 [host=himrod2]
 167288 [host=himrod2]
 167293 [host=himrod2]
 167297 [host=himrod2]
 167299 [host=himrod2]
 167300 [host=himrod2]
 167301 [host=himrod2]
 167302 [host=himrod2]
 167303 [host=himrod2]
 167304 [host=himrod2]
 167305 [host=himrod2]
 167306 [host=himrod2]
 167307 [host=himrod2]
 167308 [host=himrod2]
 167310 [host=himrod2]
 167309 [host=himrod2]
 167311 [host=himrod2]
 167313 [host=himrod2]
 167315 [host=himrod2]
 167316 [host=himrod2]
 167314 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167318 [host=himrod2]
 167320 pass c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1
 167321 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167319 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167322 pass d706f8fec256585de76280d2a1e1aa9550cefe12 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167323 fail f4e3ce5f532860bbcf3a78d38f699dfbff0e1e75 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167326 fail 8eb79b5f4fed31667f27b7ac97b568724fe12496 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167327 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167324 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167328 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167329 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167331 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167332 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167333 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
Searching for interesting versions
 Result found: flight 167239 (pass), for basis pass
 For basis failure, parent search stopping at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55c2b1201050) HASH(0x55c2b120a440) HASH(0x55c2b120abc0) For basis failure, parent search stopping at d706f8fec256585de76280d2a1e1aa9550cefe12 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f\
 84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55c2b120e2d0) For basis failure, parent search stopping at c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1, results HASH(0x55c2b11fa890) HASH(0x55c2b120de50) Result found: flight 167242 (fail), for basis failure (at ancestor ~5226)
 Repro found: flight 167320 (pass), for basis pass
 Repro found: flight 167321 (fail), for basis failure
 0 revisions at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
No revisions left to test, checking graph state.
 Result found: flight 167327 (pass), for last pass
 Result found: flight 167328 (fail), for first failure
 Repro found: flight 167329 (pass), for last pass
 Repro found: flight 167331 (fail), for first failure
 Repro found: flight 167332 (pass), for last pass
 Repro found: flight 167333 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Bug not present: d39f8d88ecb31df46e2f95bcc5c20100d1f14681
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167333/


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

Revision graph left in /home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
167333: tolerable ALL FAIL

flight 167333 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/167333/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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


