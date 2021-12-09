Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5F46F6D6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 23:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243413.421085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvRub-0000Xc-3K; Thu, 09 Dec 2021 22:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243413.421085; Thu, 09 Dec 2021 22:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvRua-0000US-Vt; Thu, 09 Dec 2021 22:29:12 +0000
Received: by outflank-mailman (input) for mailman id 243413;
 Thu, 09 Dec 2021 22:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvRua-0000UG-9T; Thu, 09 Dec 2021 22:29:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvRua-0003pI-4M; Thu, 09 Dec 2021 22:29:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvRuZ-0001lL-U2; Thu, 09 Dec 2021 22:29:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvRuZ-0003Qq-TZ; Thu, 09 Dec 2021 22:29:11 +0000
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
	bh=7li+nQPT/SVE8VtyQOVZFhJP/EplTTYLNQx7nFSeoIA=; b=qPVmqstDOfqpFRup5fa4/AYSuL
	1AlpwaqZ25pbxprEyyxnB3JjK6sqB1lxQk0B0PH0gvHNqGx3gHU07cIqQBUDEPSs3SpbYI3Fd3wPF
	+onHX/qh4p7esDfUjkAFTURV3Gx4WCvk0TPfQDKPVVOjsjHeNb/yN962NiOJ9Wv9pAWk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [ovmf bisection] complete build-i386
Message-Id: <E1mvRuZ-0003Qq-TZ@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Dec 2021 22:29:11 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167298/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-i386.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386.xen-build --summary-out=tmp/167298.bisection-summary --basis-template=167239 --blessings=real,real-bisect,real-retry ovmf build-i386 xen-build
Searching for failure / basis pass:
 167297 fail [host=huxelrebe1] / 167239 [host=huxelrebe0] 167237 [host=albana0] 167231 [host=albana0] 167225 [host=albana0] 167122 [host=huxelrebe0] 167104 [host=huxelrebe0] 167081 [host=albana0] 166961 [host=albana0] 166951 [host=pinot0] 166949 [host=pinot0] 166826 [host=albana0] 166360 [host=fiano0] 166133 [host=albana1] 166130 [host=huxelrebe0] 166126 ok.
Failure / basis pass flights: 167297 / 166126
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
Basis pass 466ebdd2e0919c1538d03cd59833704bd5e1c028 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 e2d0a42381b686451bed3e0e3ab8551f6c2d4090
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#466ebdd2e0919c1538d03cd59833704bd5e1c028-06544455d0d460ed18c8582121247bf53292d7e4 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b6e539830bf45e2d7a6bd86ddfdf003088b173b0-b6e539830bf45e2d7a6bd86ddfdf003088b173b0 git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c\
 43-2dd4b9b3f84019668719344b40dba79d681be41c git://xenbits.xen.org/xen.git#e2d0a42381b686451bed3e0e3ab8551f6c2d4090-c62d634cce8b1507d00a61bfc8168ac42367fe87
Loaded 12609 nodes in revision graph
Searching for test results:
 167225 [host=albana0]
 167231 [host=albana0]
 167237 [host=albana0]
 167239 [host=huxelrebe0]
 167240 [host=huxelrebe0]
 167242 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167247 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167253 [host=huxelrebe0]
 167258 [host=huxelrebe0]
 167260 [host=huxelrebe0]
 167262 [host=huxelrebe0]
 167081 [host=albana0]
 167103 [host=albana0]
 167104 [host=huxelrebe0]
 167267 [host=huxelrebe0]
 167271 [host=huxelrebe0]
 167274 [host=huxelrebe0]
 167276 [host=huxelrebe0]
 167275 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167277 [host=huxelrebe0]
 167278 pass 466ebdd2e0919c1538d03cd59833704bd5e1c028 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 e2d0a42381b686451bed3e0e3ab8551f6c2d4090
 167280 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167279 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167281 pass dfafa8e45382939fb5dc78e9d37b97b500a43613 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c f0abfb5eca6821fb58c09331d0fa3ec97f86e0bb
 167282 pass 7c7184e201a90a1d2376e615e55e3f4074731468 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1
 167283 [host=huxelrebe0]
 167284 pass e2289d19d871d8016f5d1d07a0084583f7092333 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167285 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167286 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167289 fail f5a6e1bab5d4d9d7bd0d543777290269e6c1a065 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167291 fail 26210f9436d82174fa03d1c43b58a63c2fa2c176 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167288 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167292 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167293 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167294 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167295 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167296 pass d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167297 fail 06544455d0d460ed18c8582121247bf53292d7e4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167298 fail 202fb22be6e9100c2ce6329f1b09f885dfdb514a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
 167122 [host=huxelrebe0]
 166126 pass 466ebdd2e0919c1538d03cd59833704bd5e1c028 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 e2d0a42381b686451bed3e0e3ab8551f6c2d4090
 166130 [host=huxelrebe0]
 166133 [host=albana1]
 166826 [host=albana0]
 166360 [host=fiano0]
 166949 [host=pinot0]
 166951 [host=pinot0]
 166961 [host=albana0]
Searching for interesting versions
 Result found: flight 166126 (pass), for basis pass
 For basis failure, parent search stopping at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55a18c22f118) HASH(0x55a18c227de8) HASH(0x55a18c229190) For basis failure, parent search stopping at e2289d19d871d8016f5d1d07a0084583f7092333 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f\
 84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87, results HASH(0x55a18c22b288) For basis failure, parent search stopping at 7c7184e201a90a1d2376e615e55e3f4074731468 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c 608531a0cc34a5bc096ccf585e16f182b5ed83e1, results HASH(0x55a18c2280e8) For basis failure, parent search stopping at dfafa8e45382939fb5dc78e9d37b97b500a43613 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c f0abfb5eca6821fb58c09331d0fa3ec97f86e0bb, results HASH(0x55a18c224258) For basis failure, parent search stopping at 466ebdd2e0919c1538d03cd59833704bd5e1c028 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 e2d0a42381b686451bed3e0e3ab8551f6c2d4090, results HASH(0x55a18c219608) HASH(0x55a18c231bc8) Result found: flight 167242 (fail), \
 for basis failure (at ancestor ~5227)
 Repro found: flight 167278 (pass), for basis pass
 Repro found: flight 167279 (fail), for basis failure
 0 revisions at d39f8d88ecb31df46e2f95bcc5c20100d1f14681 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c c62d634cce8b1507d00a61bfc8168ac42367fe87
No revisions left to test, checking graph state.
 Result found: flight 167286 (pass), for last pass
 Result found: flight 167292 (fail), for first failure
 Repro found: flight 167294 (pass), for last pass
 Repro found: flight 167295 (fail), for first failure
 Repro found: flight 167296 (pass), for last pass
 Repro found: flight 167298 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  202fb22be6e9100c2ce6329f1b09f885dfdb514a
  Bug not present: d39f8d88ecb31df46e2f95bcc5c20100d1f14681
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167298/


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

pnmtopng: 187 colors found
Revision graph left in /home/logs/results/bisect/ovmf/build-i386.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
167298: tolerable ALL FAIL

flight 167298 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/167298/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386                    6 xen-build               fail baseline untested


jobs:
 build-i386                                                   fail    


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


