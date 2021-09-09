Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B1404810
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182892.330728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGje-0005mV-Bv; Thu, 09 Sep 2021 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182892.330728; Thu, 09 Sep 2021 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGje-0005kI-8o; Thu, 09 Sep 2021 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 182892;
 Thu, 09 Sep 2021 09:52:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOGjd-0005k8-Hl; Thu, 09 Sep 2021 09:52:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOGjd-0002c7-9Z; Thu, 09 Sep 2021 09:52:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOGjd-0005dh-1M; Thu, 09 Sep 2021 09:52:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mOGjd-0004AY-0t; Thu, 09 Sep 2021 09:52:45 +0000
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
	bh=C4zkEz3RFyY9bxBQvuSkHMgx8nzPx/dihSlfDUtQMKU=; b=u+aex7BWkAcVkcF3S8p/RIB3Mq
	OXg0isxCFfoS982KKL7aOMToMivNqkWHF+Z8pEYiSTOBn21Uf1LMoTQL77uQz38q9o8a2yaQk8uUV
	EUKw6QSRVVpgmptM4XIakub/g+FlE+333uk0OA0I/zdCplhp+CKPmSJL8nLfKcM868BI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete build-amd64
Message-Id: <E1mOGjd-0004AY-0t@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Sep 2021 09:52:45 +0000

branch xen-4.13-testing
xenbranch xen-4.13-testing
job build-amd64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164910/


  commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
  Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Date:   Tue Aug 31 09:29:48 2021 +0800
  
      OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
      
      Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
      the kernel, initrd, and kernel command line from QEMU's fw_cfg.
      
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
      Signed-off-by: Gary Lin <gary.lin@hpe.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
      Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Jim Fehlig <jfehlig@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/build-amd64.xen-build --summary-out=tmp/164910.bisection-summary --basis-template=163761 --blessings=real,real-bisect,real-retry xen-4.13-testing build-amd64 xen-build
Searching for failure / basis pass:
 164887 fail [host=himrod1] / 164644 ok.
Failure / basis pass flights: 164887 / 164644
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 9c4b19c110e1410e50a9f1dbd15d337b05e9cc9d
Basis pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#a82bad9730178a1e3a67c9bfc83412b87a8ad734-a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#7269466a5b0c0e89b36dc9a7db0554ae404aa230-7269466a5b0c0e89b36dc9a7db0554ae404aa230 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76\
 b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b-9c4b19c110e1410e50a9f1dbd15d337b05e9cc9d
Loaded 10001 nodes in revision graph
Searching for test results:
 164555 pass irrelevant
 164560 [host=himrod2]
 164565 [host=himrod2]
 164568 pass irrelevant
 164572 pass irrelevant
 164579 [host=himrod2]
 164583 [host=himrod2]
 164587 [host=himrod2]
 164589 [host=himrod2]
 164594 [host=himrod2]
 164577 [host=himrod2]
 164638 [host=himrod2]
 164640 [host=himrod2]
 164642 [host=himrod2]
 164643 [host=himrod2]
 164645 pass irrelevant
 164648 pass irrelevant
 164651 [host=himrod2]
 164652 [host=himrod2]
 164656 [host=himrod2]
 164644 pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164887 fail a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 9c4b19c110e1410e50a9f1dbd15d337b05e9cc9d
 164899 pass a82bad9730178a1e3a67c9bfc83412b87a8ad734 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164900 fail a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 9c4b19c110e1410e50a9f1dbd15d337b05e9cc9d
 164901 fail f0fe55bca4651734abf1752a1d7c69fb5bee00b9 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164902 pass dc995ce9069b683d55fdb8d51235cb5920db8041 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164903 pass cb0d24637dfdd869618b9635dfb8e3b0746393a6 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164904 pass 52e2dabc0f8d3af09c213072ce8ba734302f585d d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164905 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164906 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164907 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164908 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164909 pass 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
 164910 fail 9f3eda177a4b2d4a33ff1b0307cad42906396562 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
Searching for interesting versions
 Result found: flight 164644 (pass), for basis pass
 For basis failure, parent search stopping at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b, results HASH(0x5583659b4730) HASH(0x55836599d160) HASH(0x558364fd97c8) For basis failure, parent search stopping at 52e2dabc0f8d3af09c213072ce8ba734302f585d d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d\
 96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b, results HASH(0x5583659b62b8) For basis failure, parent search stopping at cb0d24637dfdd869618b9635dfb8e3b0746393a6 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b, results HASH(0x5583659b1380) For basis failure, parent search stopping at dc995ce9069b683d55fdb8d51235cb5920db8041 d0d8ad39ecb51cd7497cd524484fe09\
 f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b, results HASH(0x5583659b8ee8) For basis failure, parent search stopping at a82bad9730178a1e3a67c9bfc83412b87a8ad734 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b, results HASH(0x5583659a54a8) HASH(0x5583659b00f8) Result found: flight 164887 (fail), \
 for basis failure (at ancestor ~5005)
 Repro found: flight 164899 (pass), for basis pass
 Repro found: flight 164900 (fail), for basis failure
 0 revisions at 5b5f10d7465004e3e40ec1f50a3b490b4db595e7 d0d8ad39ecb51cd7497cd524484fe09f50876798 7269466a5b0c0e89b36dc9a7db0554ae404aa230 54082c81d96028ba8c76fbe6784085cf1df76b20 dd29f4f4961d5c99660874c7ff090bd3c2ef6e5b
No revisions left to test, checking graph state.
 Result found: flight 164905 (pass), for last pass
 Result found: flight 164906 (fail), for first failure
 Repro found: flight 164907 (pass), for last pass
 Repro found: flight 164908 (fail), for first failure
 Repro found: flight 164909 (pass), for last pass
 Repro found: flight 164910 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf git://xenbits.xen.org/osstest/ovmf.git
  Bug introduced:  9f3eda177a4b2d4a33ff1b0307cad42906396562
  Bug not present: 5b5f10d7465004e3e40ec1f50a3b490b4db595e7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164910/


  commit 9f3eda177a4b2d4a33ff1b0307cad42906396562
  Author: Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Date:   Tue Aug 31 09:29:48 2021 +0800
  
      OvmfPkg/OvmfXen: add QemuKernelLoaderFsDxe
      
      Without QemuKernelLoaderFsDxe, QemuLoadKernelImage() couldn't download
      the kernel, initrd, and kernel command line from QEMU's fw_cfg.
      
      Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3574
      Signed-off-by: Gary Lin <gary.lin@hpe.com>
      Acked-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
      Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
      Tested-by: Jim Fehlig <jfehlig@suse.com>

Revision graph left in /home/logs/results/bisect/xen-4.13-testing/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
164910: tolerable ALL FAIL

flight 164910 xen-4.13-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164910/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


