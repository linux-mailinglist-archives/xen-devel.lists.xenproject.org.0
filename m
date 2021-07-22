Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960D23D2FF2
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 00:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159872.294002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6hR4-00017z-QF; Thu, 22 Jul 2021 22:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159872.294002; Thu, 22 Jul 2021 22:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6hR4-000167-MS; Thu, 22 Jul 2021 22:44:58 +0000
Received: by outflank-mailman (input) for mailman id 159872;
 Thu, 22 Jul 2021 22:44:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6hR2-00015x-Tx; Thu, 22 Jul 2021 22:44:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6hR2-00089O-Il; Thu, 22 Jul 2021 22:44:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6hR2-0008Qm-BM; Thu, 22 Jul 2021 22:44:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m6hR2-0008W7-As; Thu, 22 Jul 2021 22:44:56 +0000
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
	bh=fHUGSpYgKuENBdBfB0h13GWeeJ89/lYXZcDa7zwsgGs=; b=GrU7EEw8Tejlo2sB5Fa6be15vj
	OqVSxJTNBcXxfYM73aG/M/qXXyVkjsZGKZyQUwC+T3PEVhlFHJuSqBHJuedg2/VYEHK32A0LqftMt
	IQ0vZVtJOfUqMMVS8q4v1C1ciS7do8Ifqf8xHWHklQFOwdRm3xGK349UVenOjP3ZeLOI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
Message-Id: <E1m6hR2-0008W7-As@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Jul 2021 22:44:56 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Bug not present: c445909e1f3d5722ed26f067bbffed71cbefd711
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163920/


  commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 11:28:34 2021 -0400
  
      vl: switch -M parsing to keyval
      
      Switch from QemuOpts to keyval.  This enables the introduction
      of non-scalar machine properties, and JSON syntax in the future.
      
      For JSON syntax to be supported right now, we would have to
      consider what would happen if string-based dictionaries (produced by
      -M key=val) were to be merged with strongly-typed dictionaries
      (produced by -M {'key': 123}).
      
      The simplest way out is to never enter the situation, and only allow one
      -M option when JSON syntax is in use.  However, we want options such as
      -smp to become syntactic sugar for -M, and this is a problem; as soon
      as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
      together with -smp.  Therefore, allowing JSON syntax right now for -M
      would be a forward-compatibility nightmare and it would be impossible
      anyway to introduce -M incrementally in tools.
      
      Instead, support for JSON syntax is delayed until after the main
      options are converted to QOM compound properties.  These include -boot,
      -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
      syntax is introduced, these options will _also_ be forbidden together
      with -M '{...}'.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install --summary-out=tmp/163920.bisection-summary --basis-template=163321 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict debian-hvm-install
Searching for failure / basis pass:
 163890 fail [host=huxelrebe1] / 163321 [host=elbling0] 163311 [host=chardonnay0] 163303 [host=fiano1] 163299 [host=elbling1] 163292 [host=albana1] 163276 ok.
Failure / basis pass flights: 163890 / 163276
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e77c8b8b8e933414ef07dbed04e02973fccffeb0 54082c81d96028ba8c76fbe6784085cf1df76b20 57e761b60dc92e210caf3429b8956d908ba04ae9
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1-e77c8b8b8e933414ef07dbed04e02973fccffeb0 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#f95b7b37cfc6d4613721df9357090d14712013c0-57e761b60dc92e210caf3429b8956d908ba04ae9
Loaded 20177 nodes in revision graph
Searching for test results:
 163228 [host=fiano0]
 163235 [host=huxelrebe0]
 163276 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
 163292 [host=albana1]
 163299 [host=elbling1]
 163303 [host=fiano1]
 163311 [host=chardonnay0]
 163321 [host=elbling0]
 163327 fail irrelevant
 163369 fail irrelevant
 163420 fail irrelevant
 163444 fail irrelevant
 163464 fail irrelevant
 163486 fail irrelevant
 163516 fail irrelevant
 163545 fail irrelevant
 163563 fail irrelevant
 163577 fail irrelevant
 163600 fail irrelevant
 163621 fail irrelevant
 163642 fail irrelevant
 163663 fail irrelevant
 163677 fail irrelevant
 163694 fail irrelevant
 163719 fail irrelevant
 163741 fail irrelevant
 163765 fail irrelevant
 163784 fail irrelevant
 163798 fail irrelevant
 163811 fail irrelevant
 163834 fail irrelevant
 163849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 143c2e0432859826c9e8d5b2baa307355f1a5332 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163874 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
 163876 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 143c2e0432859826c9e8d5b2baa307355f1a5332 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163878 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9405d87be25db6dff4d7b5ab48a81bbf6d083e47 54082c81d96028ba8c76fbe6784085cf1df76b20 471383ddd1843700fdd7d74242ba0e5f314dc678
 163865 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c04b4d9e6b596ead3cf6046a9243fbfee068ef33 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163879 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3f65df38e8a5e75ccfd5a641d252ad8882c9e68c 54082c81d96028ba8c76fbe6784085cf1df76b20 3a98c1a4cec1a302beaddf944ded240b61173f87
 163881 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c04b4d9e6b596ead3cf6046a9243fbfee068ef33 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163883 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 65388f404492daac86e02980d10ae84c694870b3 54082c81d96028ba8c76fbe6784085cf1df76b20 3a98c1a4cec1a302beaddf944ded240b61173f87
 163880 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e77c8b8b8e933414ef07dbed04e02973fccffeb0 54082c81d96028ba8c76fbe6784085cf1df76b20 57e761b60dc92e210caf3429b8956d908ba04ae9
 163885 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f665574ac5b08284e5292f013235bef2e9d4e73d 54082c81d96028ba8c76fbe6784085cf1df76b20 3a98c1a4cec1a302beaddf944ded240b61173f87
 163886 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4598b0735025042c62e85a52e4c91fc0d50ec157 54082c81d96028ba8c76fbe6784085cf1df76b20 3a98c1a4cec1a302beaddf944ded240b61173f87
 163887 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5e05c40ced78ed9a3c25a82ec1f144bb7baffe3f 54082c81d96028ba8c76fbe6784085cf1df76b20 3a98c1a4cec1a302beaddf944ded240b61173f87
 163891 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
 163892 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e77c8b8b8e933414ef07dbed04e02973fccffeb0 54082c81d96028ba8c76fbe6784085cf1df76b20 57e761b60dc92e210caf3429b8956d908ba04ae9
 163894 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57e28d34c0cb04abf7683ac6a12c87ede447c320 54082c81d96028ba8c76fbe6784085cf1df76b20 93c9edbef51b31056f93a37a778326c90a83158c
 163895 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d1987c8114921eb30859854de664f879b5626da7 54082c81d96028ba8c76fbe6784085cf1df76b20 93c9edbef51b31056f93a37a778326c90a83158c
 163897 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fc32b91a88cc9cd560da5488bdca4d69f2bac620 54082c81d96028ba8c76fbe6784085cf1df76b20 93c9edbef51b31056f93a37a778326c90a83158c
 163898 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 05449abb1d4c5f0c69ceb3d8d03cbc75de39b646 54082c81d96028ba8c76fbe6784085cf1df76b20 93c9edbef51b31056f93a37a778326c90a83158c
 163899 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 05de778b5b8ab0b402996769117b88c7ea5c7c61 54082c81d96028ba8c76fbe6784085cf1df76b20 79ca512a1fa68e0170a85cb71b8a8e8f4a34fb11
 163900 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c632ea1dd90313bc360b9de9d5014c2167f4d038 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163901 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ca6f2ad375d32e81844788dbc2b05a04cc391b5 54082c81d96028ba8c76fbe6784085cf1df76b20 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163902 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 715167a36c2b152f6511cff690180c1254ae039f 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163903 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 c8f88810db2a25d6aacf65c1c60bc4f5d848a483
 163904 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d7c7c2d1d95cc6cdb56706bfa0446ad68e2b952 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163905 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 3ce2765ac21dbd739e8216694b025aaabf4afff3
 163906 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 110243750dc4389fe8715c1db87a6ce6c2b9e645 54082c81d96028ba8c76fbe6784085cf1df76b20 383b41974d5543b62f3181d216070fe3691fb130
 163908 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163909 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e1fbd2c4ed8e61a3e0749f592a6d3423ec67980b 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163890 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e77c8b8b8e933414ef07dbed04e02973fccffeb0 54082c81d96028ba8c76fbe6784085cf1df76b20 57e761b60dc92e210caf3429b8956d908ba04ae9
 163910 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3bb6944585aa6f28b21265c88d86264e8e9f7e53 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163911 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9176e800dbcb2636a2f24411eafc3c800e3455bd 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163913 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163914 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163915 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163918 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163919 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163920 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
Searching for interesting versions
 Result found: flight 163276 (pass), for basis pass
 Result found: flight 163880 (fail), for basis failure (at ancestor ~1)
 Repro found: flight 163891 (pass), for basis pass
 Repro found: flight 163892 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
No revisions left to test, checking graph state.
 Result found: flight 163913 (pass), for last pass
 Result found: flight 163914 (fail), for first failure
 Repro found: flight 163915 (pass), for last pass
 Repro found: flight 163918 (fail), for first failure
 Repro found: flight 163919 (pass), for last pass
 Repro found: flight 163920 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Bug not present: c445909e1f3d5722ed26f067bbffed71cbefd711
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163920/


  commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 11:28:34 2021 -0400
  
      vl: switch -M parsing to keyval
      
      Switch from QemuOpts to keyval.  This enables the introduction
      of non-scalar machine properties, and JSON syntax in the future.
      
      For JSON syntax to be supported right now, we would have to
      consider what would happen if string-based dictionaries (produced by
      -M key=val) were to be merged with strongly-typed dictionaries
      (produced by -M {'key': 123}).
      
      The simplest way out is to never enter the situation, and only allow one
      -M option when JSON syntax is in use.  However, we want options such as
      -smp to become syntactic sugar for -M, and this is a problem; as soon
      as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
      together with -smp.  Therefore, allowing JSON syntax right now for -M
      would be a forward-compatibility nightmare and it would be impossible
      anyway to introduce -M incrementally in tools.
      
      Instead, support for JSON syntax is delayed until after the main
      options are converted to QOM compound properties.  These include -boot,
      -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
      syntax is introduced, these options will _also_ be forbidden together
      with -M '{...}'.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
163920: tolerable ALL FAIL

flight 163920 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163920/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    


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


