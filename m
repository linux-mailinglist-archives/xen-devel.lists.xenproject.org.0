Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D52683B1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 06:33:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHg9Y-0002Xt-KD; Mon, 14 Sep 2020 04:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qj2e=CX=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kHg9X-0002Xo-Jz
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 04:31:43 +0000
X-Inumbo-ID: 0d66891f-8911-438d-ae42-8e4c64f96eee
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d66891f-8911-438d-ae42-8e4c64f96eee;
 Mon, 14 Sep 2020 04:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=VZOWiI85ARkgq15giSKUVgwhlFWhzHvtSrOF5sOuy2g=; b=vMr+BSM++hds9nlxaLaMeyXRQ5
 JOLTzH5tmCiPcm1BO320gQvuvvbnTKXST83Y5C+BV2zguDPLme65wz/iI1/h7uOb4z1Ee6ZVlbn6D
 rpOIDKjiUOQhdWj74HkpA0AGie1/1OYvyCFBhjl5s+6f9aDIoTKw3wMRcf1w8J/LrKbE=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHg99-0001mp-NE; Mon, 14 Sep 2020 04:31:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kHg99-0007GD-Ep; Mon, 14 Sep 2020 04:31:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kHg99-0006gz-EM; Mon, 14 Sep 2020 04:31:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-libvirt-vhd
Message-Id: <E1kHg99-0006gz-EM@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 14 Sep 2020 04:31:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-vhd
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154310/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-libvirt-vhd.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-vhd.guest-start --summary-out=tmp/154310.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-amd64-amd64-libvirt-vhd guest-start
Searching for failure / basis pass:
 154090 fail [host=chardonnay0] / 154016 [host=huxelrebe1] 153983 [host=fiano1] 153957 [host=fiano1] 153931 [host=godello0] 153906 [host=albana0] 153882 [host=huxelrebe0] 153845 [host=godello1] 153813 [host=fiano0] 153788 [host=rimava1] 153770 [host=pinot1] 153758 [host=albana1] 153653 [host=godello1] 153619 [host=elbling1] 153602 [host=godello0] 153591 [host=chardonnay1] 153551 [host=pinot0] 153526 [host=huxelrebe0] 153494 [host=huxelrebe1] 153468 [host=elbling0] 153437 [host=fiano1] 153400 [ho\
 st=godello1] 153363 ok.
Failure / basis pass flights: 154090 / 153363
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#d400dc5729e4e132d61c2e7df57d81aaed762044-cc13835377debe4e300c5f5f11f8f78920778c4e
Loaded 5001 nodes in revision graph
Searching for test results:
 152985 []
 153004 [host=pinot0]
 153028 [host=pinot1]
 153065 [host=fiano0]
 153109 [host=elbling1]
 153280 [host=albana1]
 153321 [host=godello0]
 153363 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 153400 [host=godello1]
 153437 [host=fiano1]
 153468 [host=elbling0]
 153494 [host=huxelrebe1]
 153526 [host=huxelrebe0]
 153551 [host=pinot0]
 153591 [host=chardonnay1]
 153602 [host=godello0]
 153619 [host=elbling1]
 153653 [host=godello1]
 153758 [host=albana1]
 153770 [host=pinot1]
 153788 [host=rimava1]
 153813 [host=fiano0]
 153845 [host=godello1]
 153882 [host=huxelrebe0]
 153906 [host=albana0]
 153931 [host=godello0]
 153957 [host=fiano1]
 153983 [host=fiano1]
 154016 [host=huxelrebe1]
 154036 blocked 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154058 blocked 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154090 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154271 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044
 154274 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 cc13835377debe4e300c5f5f11f8f78920778c4e
 154278 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 bb2ea7f392348b2697c5b9140deea56b1b56776e
 154280 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94
 154284 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ad0fd291c5e79191c2e3c70e43dded569f11a450
 154288 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c
 154292 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154296 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154300 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154305 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
 154308 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
 154310 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
Searching for interesting versions
 Result found: flight 153363 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2, results HASH(0x558855fc18b0) HASH(0x5588572b8900) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195\
 829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a, results HASH(0x55885730bcd8) HASH(0x55885733e760) HASH(0x5588572a0ac0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d2\
 73dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1e2d3be2e516e6f415ca6029f651b76a8563a27c, results HASH(0x55885727c8f0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ad0fd291c5e79191c2e3c70e43dded569f11a450, results HASH(0x55\
 8856cf6508) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 82c3d15c903aa434473dfdb570096ae5db809b94, results HASH(0x55885733aed0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd\
  c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044, results HASH(0x5588572ae2b0) HASH(0x5588572bbb30) Result found: flight 154090 (fail), for basis failure (at ancestor ~295)
 Repro found: flight 154271 (pass), for basis pass
 Repro found: flight 154274 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0b77395ef2f20058305240f2395883b1d961982a
No revisions left to test, checking graph state.
 Result found: flight 154292 (pass), for last pass
 Result found: flight 154296 (fail), for first failure
 Repro found: flight 154300 (pass), for last pass
 Repro found: flight 154305 (fail), for first failure
 Repro found: flight 154308 (pass), for last pass
 Repro found: flight 154310 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Bug not present: 0b77395ef2f20058305240f2395883b1d961982a
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154310/


  commit 7c273ffdd0e91d9eeb975b7d531a4ed235931bb1
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:19 2020 +0200
  
      tools/python: drop libxenguest from setup.py
      
      There is not a single wrapper for a libxenguest function defined.
      So drop libxenguest from tools/python/setup.py.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-vhd.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
154310: tolerable FAIL

flight 154310 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154310/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-vhd 11 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-vhd                                 fail    


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


