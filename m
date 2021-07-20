Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F33CFADF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 15:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158772.292098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5pyy-0001Yw-2R; Tue, 20 Jul 2021 13:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158772.292098; Tue, 20 Jul 2021 13:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5pyx-0001WP-RI; Tue, 20 Jul 2021 13:40:23 +0000
Received: by outflank-mailman (input) for mailman id 158772;
 Tue, 20 Jul 2021 13:40:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5pyw-0001WF-HL; Tue, 20 Jul 2021 13:40:22 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5pyw-00027c-0f; Tue, 20 Jul 2021 13:40:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m5pyv-0002BT-Om; Tue, 20 Jul 2021 13:40:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m5pyv-0000i7-OI; Tue, 20 Jul 2021 13:40:21 +0000
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
	bh=tOGytqWG4EgkGvixNpiH8omag4Lsigu0psM6XfcYJno=; b=LWbPkhcnLjMc0pn33l041qsr6e
	2uBjj5AAi4aIx4ktZPzcMq4vQqdbDdoHqfdCzCOEWzeZvbztNqwKbM29jstvwpKxpRKwCkfm4sTMr
	GTehkt1GkaIZ65QdTl4osxXHx0b5NtT7h1bB1V6LUfhp8/q4zzmF7oRHXEEAEgEOa6X8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qemuu-debianhvm-amd64
Message-Id: <E1m5pyv-0000i7-OI@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 20 Jul 2021 13:40:21 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-debianhvm-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163842/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install --summary-out=tmp/163842.bisection-summary --basis-template=163321 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qemuu-debianhvm-amd64 debian-hvm-install
Searching for failure / basis pass:
 163811 fail [host=godello1] / 163321 [host=fiano0] 163311 [host=albana1] 163303 [host=godello0] 163299 [host=fiano1] 163292 [host=pinot1] 163276 [host=huxelrebe0] 163235 [host=elbling1] 163228 [host=huxelrebe1] 163220 [host=chardonnay0] 163213 [host=pinot0] 163204 [host=godello0] 163194 [host=elbling0] 163187 [host=fiano1] 163179 [host=godello0] 163171 [host=albana1] 163163 [host=fiano0] 163156 [host=huxelrebe1] 163142 ok.
Failure / basis pass flights: 163811 / 163142
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7457b407edd6e8555e4b46488aab2f13959fccf8 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#e3955ae93f5151ad2e982440b7c8d3776a9afee2-7457b407edd6e8555e4b46488aab2f13959fccf8 git://xenbits.xen.org/osstest/seabios.git#e3c30795823672eec9bde75187e184f23ed98d70-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#bb11edcec1a953ce590da797b0d005cd60f21e83-0f435e2b58543f5baae96e17a10ae20d3dbc28fa
Loaded 52131 nodes in revision graph
Searching for test results:
 163110 [host=albana0]
 163128 [host=huxelrebe0]
 163142 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163156 [host=huxelrebe1]
 163163 [host=fiano0]
 163171 [host=albana1]
 163179 [host=godello0]
 163187 [host=fiano1]
 163194 [host=elbling0]
 163204 [host=godello0]
 163213 [host=pinot0]
 163220 [host=chardonnay0]
 163228 [host=huxelrebe1]
 163235 [host=elbling1]
 163276 [host=huxelrebe0]
 163292 [host=pinot1]
 163299 [host=fiano1]
 163303 [host=godello0]
 163311 [host=albana1]
 163321 [host=fiano0]
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
 163621 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 57e28d34c0cb04abf7683ac6a12c87ede447c320 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163642 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eca73713358f7abb18f15c026ff4267b51746992 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a54fc454cf0dbf173d5dc95205febe381cfb7cc 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163677 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a54fc454cf0dbf173d5dc95205febe381cfb7cc 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163694 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1f966c7c11bbe77f3de5f50911de7c3a74594bfe 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163719 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a9649a719a44894b81f38dc1c5c1888ee684acef 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163741 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9ad4c7c9b63f89c308fd988d509bed1389953c8b 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163765 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a97fca4ceb9d9b10aa8b582e817a5ee6c42ffbaf 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163784 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163798 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163807 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163808 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163810 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c632ea1dd90313bc360b9de9d5014c2167f4d038 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163812 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 715167a36c2b152f6511cff690180c1254ae039f 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163814 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163815 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 73c8bf4ccff8951d228b8a0d49968c56e32da4de 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163816 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dd62bf14b756821fa293e3465955a41e9d460deb 54082c81d96028ba8c76fbe6784085cf1df76b20 f95b7b37cfc6d4613721df9357090d14712013c0
 163817 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1ca82a8db03ea3c352d581753b22e8dac4ea8047 54082c81d96028ba8c76fbe6784085cf1df76b20 67a50e393a59367ba2ad475e141a6739e17260f9
 163820 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ca6f2ad375d32e81844788dbc2b05a04cc391b5 54082c81d96028ba8c76fbe6784085cf1df76b20 f17a73b3c0264c62dd6b5dae01ed621c051c3038
 163821 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 918b8842a852e0e7446286f546724b1c63c56c66
 163822 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d7c7c2d1d95cc6cdb56706bfa0446ad68e2b952 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163823 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 232a4d2c25c3a83e148116a15f992f728c3579e6 54082c81d96028ba8c76fbe6784085cf1df76b20 383b41974d5543b62f3181d216070fe3691fb130
 163825 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 3ce2765ac21dbd739e8216694b025aaabf4afff3
 163826 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163827 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e1fbd2c4ed8e61a3e0749f592a6d3423ec67980b 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163828 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3bb6944585aa6f28b21265c88d86264e8e9f7e53 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163830 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9176e800dbcb2636a2f24411eafc3c800e3455bd 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163831 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163811 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7457b407edd6e8555e4b46488aab2f13959fccf8 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163833 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163836 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e3955ae93f5151ad2e982440b7c8d3776a9afee2 e3c30795823672eec9bde75187e184f23ed98d70 bb11edcec1a953ce590da797b0d005cd60f21e83
 163837 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7457b407edd6e8555e4b46488aab2f13959fccf8 54082c81d96028ba8c76fbe6784085cf1df76b20 0f435e2b58543f5baae96e17a10ae20d3dbc28fa
 163838 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163839 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163840 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
 163842 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
Searching for interesting versions
 Result found: flight 163142 (pass), for basis pass
 Result found: flight 163811 (fail), for basis failure
 Repro found: flight 163836 (pass), for basis pass
 Repro found: flight 163837 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c445909e1f3d5722ed26f067bbffed71cbefd711 54082c81d96028ba8c76fbe6784085cf1df76b20 44e8904ebfbc57ba0950c40b9d3a28507b553e4e
No revisions left to test, checking graph state.
 Result found: flight 163831 (pass), for last pass
 Result found: flight 163833 (fail), for first failure
 Repro found: flight 163838 (pass), for last pass
 Repro found: flight 163839 (fail), for first failure
 Repro found: flight 163840 (pass), for last pass
 Repro found: flight 163842 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Bug not present: c445909e1f3d5722ed26f067bbffed71cbefd711
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163842/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
163842: tolerable ALL FAIL

flight 163842 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163842/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    


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


