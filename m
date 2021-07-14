Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43F3C88DA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 18:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156122.288083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hyt-0002ca-0t; Wed, 14 Jul 2021 16:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156122.288083; Wed, 14 Jul 2021 16:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hys-0002Ze-R5; Wed, 14 Jul 2021 16:43:30 +0000
Received: by outflank-mailman (input) for mailman id 156122;
 Wed, 14 Jul 2021 16:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3hyr-0002ZU-Jz; Wed, 14 Jul 2021 16:43:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3hyr-00018b-EE; Wed, 14 Jul 2021 16:43:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m3hyr-00063p-5s; Wed, 14 Jul 2021 16:43:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m3hyr-0002PL-5W; Wed, 14 Jul 2021 16:43:29 +0000
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
	bh=eEZpW6TnaMLkyvrk5TphJdiOJ7HwU0qJC5R7O/Q6aSI=; b=TbDd6WbjkoBgBy2a0BAHJiHaFW
	PH218viFlcjBRoD3c0BNvfZ0x1rHZ0YNh55UKd1TSfBWN/94I8OwYmCN0LBSqSJyTYWEkzmL7mmEj
	Hti3yDvUBZqFAsh9tFKbThvV30YoNzQO4/ZF8GRPEFbugwc9IX5B6aPSw/mSnFjd64u4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-freebsd10-amd64
Message-Id: <E1m3hyr-0002PL-5W@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Jul 2021 16:43:29 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-freebsd10-amd64
testid guest-start

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163687/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start --summary-out=tmp/163687.bisection-summary --basis-template=163321 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-freebsd10-amd64 guest-start
Searching for failure / basis pass:
 163663 fail [host=fiano1] / 163321 [host=huxelrebe0] 163311 [host=pinot0] 163303 [host=huxelrebe1] 163299 [host=chardonnay0] 163292 [host=fiano0] 163276 [host=albana1] 163235 [host=huxelrebe1] 163228 [host=elbling1] 163220 [host=albana1] 163213 [host=elbling0] 163204 [host=huxelrebe0] 163194 [host=chardonnay0] 163187 [host=huxelrebe0] 163179 [host=pinot1] 163171 ok.
Failure / basis pass flights: 163663 / 163171
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a54fc454cf0dbf173d5dc95205febe381cfb7cc 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 687f9f7834e30330fd952f1fe096518509ff8ff7 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#687f9f7834e30330fd952f1fe096518509ff8ff7-2a54fc454cf0dbf173d5dc95205febe381cfb7cc git://xenbits.xen.org/osstest/seabios.git#e3c30795823672eec9bde75187e184f23ed98d70-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#bb11edcec1a953ce590da797b0d005cd60f21e83-0f435e2b58543f5baae96e17a10ae20d3dbc28fa
Loaded 20352 nodes in revision graph
Searching for test results:
 163171 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 687f9f7834e30330fd952f1fe096518509ff8ff7 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163179 [host=pinot1]
 163187 [host=huxelrebe0]
 163194 [host=chardonnay0]
 163204 [host=huxelrebe0]
 163213 [host=elbling0]
 163220 [host=albana1]
 163228 [host=elbling1]
 163235 [host=huxelrebe1]
 163276 [host=albana1]
 163292 [host=fiano0]
 163299 [host=chardonnay0]
 163303 [host=huxelrebe1]
 163311 [host=pinot0]
 163321 [host=huxelrebe0]
 163327 fail irrelevant
 163369 fail irrelevant
 163420 fail irrelevant
 163444 fail irrelevant
 163464 fail irrelevant
 163486 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 05de778b5b8ab0b402996769117b88c7ea5c7c61 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163516 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 05de778b5b8ab0b402996769117b88c7ea5c7c61 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163545 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 42e1d798a6a01817bdcf722ac27eea01531e21cd 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163563 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 42e1d798a6a01817bdcf722ac27eea01531e21cd 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163577 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9516034d05a8c71ef157a59f525e4c4f7ed79827 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163600 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 86108e23d798bcd3fce35ad271b198f8a8611746 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163637 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 687f9f7834e30330fd952f1fe096518509ff8ff7 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163621 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57e28d34c0cb04abf7683ac6a12c87ede447c320 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163639 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 86108e23d798bcd3fce35ad271b198f8a8611746 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163643 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57e28d34c0cb04abf7683ac6a12c87ede447c320 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163644 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c632ea1dd90313bc360b9de9d5014c2167f4d038 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163648 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 715167a36c2b152f6511cff690180c1254ae039f 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163649 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163650 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 73c8bf4ccff8951d228b8a0d49968c56e32da4de 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163642 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eca73713358f7abb18f15c026ff4267b51746992 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163652 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dd62bf14b756821fa293e3465955a41e9d460deb 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
 163657 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ca6f2ad375d32e81844788dbc2b05a04cc391b5 54082c81d96028ba8c76fbe6784085cf1df76b20 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163660 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 c8f88810db2a25d6aacf65c1c60bc4f5d848a483
 163661 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d7c7c2d1d95cc6cdb56706bfa0446ad68e2b952 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163662 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8bf27550effb124221100c3c6f5d513dd29ec37d 54082c81d96028ba8c76fbe6784085cf1df76b20 383b41974d5543b62f3181d216070fe3691fb130
 163664 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 687f9f7834e30330fd952f1fe096518509ff8ff7 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163665 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eca73713358f7abb18f15c026ff4267b51746992 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163666 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 3ce2765ac21dbd739e8216694b025aaabf4afff3
 163670 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163672 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e1fbd2c4ed8e61a3e0749f592a6d3423ec67980b 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163674 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3bb6944585aa6f28b21265c88d86264e8e9f7e53 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a54fc454cf0dbf173d5dc95205febe381cfb7cc 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163675 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9176e800dbcb2636a2f24411eafc3c800e3455bd 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163678 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a54fc454cf0dbf173d5dc95205febe381cfb7cc 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163680 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163681 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163682 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163683 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163686 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163655 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5d53baf3f5b3e711fd809d9e0b39b29be994ba9c 54082c81d96028ba8c76fbe6784085cf1df76b20 67a50e393a59367ba2ad475e141a6739e17260f9
 163687 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
Searching for interesting versions
 Result found: flight 163171 (pass), for basis pass
 Result found: flight 163663 (fail), for basis failure
 Repro found: flight 163664 (pass), for basis pass
 Repro found: flight 163678 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
No revisions left to test, checking graph state.
 Result found: flight 163680 (pass), for last pass
 Result found: flight 163681 (fail), for first failure
 Repro found: flight 163682 (pass), for last pass
 Repro found: flight 163683 (fail), for first failure
 Repro found: flight 163686 (pass), for last pass
 Repro found: flight 163687 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Bug not present: c445909e1f3d5722ed26f067bbffed71cbefd711
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163687/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-freebsd10-amd64.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
163687: tolerable ALL FAIL

flight 163687 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163687/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-freebsd10-amd64 13 guest-start          fail baseline untested


jobs:
 test-amd64-i386-freebsd10-amd64                              fail    


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


