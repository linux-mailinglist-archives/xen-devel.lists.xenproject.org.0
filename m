Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F23D0F0C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 15:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159344.293101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BpF-0001Zb-B7; Wed, 21 Jul 2021 12:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159344.293101; Wed, 21 Jul 2021 12:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BpF-0001Wn-7b; Wed, 21 Jul 2021 12:59:49 +0000
Received: by outflank-mailman (input) for mailman id 159344;
 Wed, 21 Jul 2021 12:59:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6BpD-0001Wd-71; Wed, 21 Jul 2021 12:59:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6BpC-0002QH-UD; Wed, 21 Jul 2021 12:59:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m6BpC-0002PA-Nk; Wed, 21 Jul 2021 12:59:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m6BpC-000549-NH; Wed, 21 Jul 2021 12:59:46 +0000
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
	bh=9Ll21gUlX4uUynNf4CnsJbM4xsIH/j34t3m5labVfxw=; b=VWXneqDugArjlno5dmHK707qo8
	zyIXXzkwaQkZqmSgEzHu8PFnVjnjXpfdN3Zm3yX5k7pNfA96JPsfDzMdvag5eaXHgr0WwpBlGoYoC
	yhTjhA4ejs3eiweiUxFz/RlpXfnh7ZtmlA7L/io6IiaoISYMBZxRu/rBvlSi+va5CjJA=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-xl-qemuu-debianhvm-amd64
Message-Id: <E1m6BpC-000549-NH@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 21 Jul 2021 12:59:46 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-xl-qemuu-debianhvm-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163873/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-amd64.debian-hvm-install --summary-out=tmp/163873.bisection-summary --basis-template=163321 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-xl-qemuu-debianhvm-amd64 debian-hvm-install
Searching for failure / basis pass:
 163849 fail [host=huxelrebe1] / 163321 [host=albana0] 163311 [host=fiano1] 163303 ok.
Failure / basis pass flights: 163849 / 163303
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 143c2e0432859826c9e8d5b2baa307355f1a5332 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 711c0418c8c1ce3a24346f058b001c4c5a2f0f81 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#711c0418c8c1ce3a24346f058b001c4c5a2f0f81-143c2e0432859826c9e8d5b2baa307355f1a5332 git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#74d044d51b19bb697eac5c3deafa140f6afafec8-96e5ad4c476e70688295b3cfb537847a3351d6fd
Loaded 20171 nodes in revision graph
Searching for test results:
 163299 [host=elbling0]
 163303 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 711c0418c8c1ce3a24346f058b001c4c5a2f0f81 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163311 [host=fiano1]
 163321 [host=albana0]
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
 163843 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 711c0418c8c1ce3a24346f058b001c4c5a2f0f81 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163834 fail irrelevant
 163845 fail irrelevant
 163846 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c632ea1dd90313bc360b9de9d5014c2167f4d038 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163847 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ca6f2ad375d32e81844788dbc2b05a04cc391b5 54082c81d96028ba8c76fbe6784085cf1df76b20 9e59d9f8ee3808acde9833192211da25f66d8cc2
 163848 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 715167a36c2b152f6511cff690180c1254ae039f 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163850 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163852 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 69d8de7a2d7c3512f6f7762abd8c1c1b9b4044e4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163854 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 ad76d87d65e1fd2ec3b08699d6dcfb0d2a9441c1
 163855 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163857 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 54082c81d96028ba8c76fbe6784085cf1df76b20 5b2a5523d697b6d1a97a18d33dc6bf92a33def32
 163858 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163860 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ca6f2ad375d32e81844788dbc2b05a04cc391b5 54082c81d96028ba8c76fbe6784085cf1df76b20 33e48312cf28f6fb78c03b14514fa7718de97ef5
 163861 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 904806c69bd4e013491550d05f5c2cbdba9a9b38 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163849 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 143c2e0432859826c9e8d5b2baa307355f1a5332 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163863 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163866 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 711c0418c8c1ce3a24346f058b001c4c5a2f0f81 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163867 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 143c2e0432859826c9e8d5b2baa307355f1a5332 54082c81d96028ba8c76fbe6784085cf1df76b20 96e5ad4c476e70688295b3cfb537847a3351d6fd
 163869 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163871 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163872 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163873 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
Searching for interesting versions
 Result found: flight 163303 (pass), for basis pass
 Result found: flight 163849 (fail), for basis failure
 Repro found: flight 163866 (pass), for basis pass
 Repro found: flight 163867 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
No revisions left to test, checking graph state.
 Result found: flight 163855 (pass), for last pass
 Result found: flight 163863 (fail), for first failure
 Repro found: flight 163869 (pass), for last pass
 Repro found: flight 163871 (fail), for first failure
 Repro found: flight 163872 (pass), for last pass
 Repro found: flight 163873 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Bug not present: c445909e1f3d5722ed26f067bbffed71cbefd711
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163873/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-xl-qemuu-debianhvm-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
163873: tolerable ALL FAIL

flight 163873 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163873/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail    


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


