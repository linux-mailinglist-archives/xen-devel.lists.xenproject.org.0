Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DC64DDF5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463546.721756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qN9-0007eh-Og; Thu, 15 Dec 2022 15:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463546.721756; Thu, 15 Dec 2022 15:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5qN9-0007cC-LQ; Thu, 15 Dec 2022 15:42:11 +0000
Received: by outflank-mailman (input) for mailman id 463546;
 Thu, 15 Dec 2022 15:42:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qN8-0007c2-Pd; Thu, 15 Dec 2022 15:42:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qN8-0006Cu-O4; Thu, 15 Dec 2022 15:42:10 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qN8-0001v6-DZ; Thu, 15 Dec 2022 15:42:10 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5qN8-0003NH-D8; Thu, 15 Dec 2022 15:42:10 +0000
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
	bh=uTK9rOY7hbsy625t3ZQ4kswDWk78Nof8xclVANmvDnI=; b=26KHcXc0KcfqSBJaR9vcMV/AUz
	6JFwNeRcESVO87tTLU/zYjX1PYia0NVHM7RET84Jp9sifFdogXhFMobdHQ5uaNSBTFirIVutot59Z
	NMNmK2K0j14fQlPaDeptLEchPyPKTnWLVFm2bkptFeijGkfVJa5gWoS+5SLXJ7jEjD/0=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-armhf
Message-Id: <E1p5qN8-0003NH-D8@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 15 Dec 2022 15:42:10 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-armhf
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  43ba5202e2eebd350161a8db674bf928c3e6f859
  Bug not present: db75092aea988b4be78c8273626f2ee40b4012b8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175271/


  commit 43ba5202e2eebd350161a8db674bf928c3e6f859
  Author: Viresh Kumar <viresh.kumar@linaro.org>
  Date:   Wed Dec 14 12:03:09 2022 +0100
  
      libxl: add support for generic virtio device
      
      This patch adds basic support for configuring and assisting generic
      Virtio backends, which could run in any domain.
      
      An example of domain configuration for mmio based Virtio I2C device is:
      virtio = ["type=virtio,device22,transport=mmio"]
      
      To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
      region) and pass them to the backend and update guest device-tree to
      create a DT node for the Virtio devices.
      
      Add special support for I2C and GPIO devices, which require the
      "compatible" DT property to be set, among other device specific
      properties. Support for generic virtio devices is also added, which just
      need a MMIO node but not any special DT properties, for such devices the
      user needs to pass "virtio,device" in the "type" string.
      
      The parsing of generic virtio device configurations will be done in a
      separate commit.
      
      Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build --summary-out=tmp/175277.bisection-summary --basis-template=175173 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-armhf xen-build
Searching for failure / basis pass:
 175279 fail [host=cubietruck-picasso] / 175173 ok.
Failure / basis pass flights: 175279 / 175173
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b746458e1ce1bec85e58b458386f8b7a0bedfaa6 88168c418c3bde7d51797e7cf875d528a8aa0eb1
Basis pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#b746458e1ce1bec85e58b458386f8b7a0bedfaa6-b746458e1ce1bec85e58b458386f8b7a0bedfaa6 git://xenbits.xen.org/xen.git#630dc3798e1d0d1b95f7be8b176563eb40e866e5-88168c418c3bde7d51797e7cf875d528a8aa0eb1
Loaded 5001 nodes in revision graph
Searching for test results:
 175173 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175199 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175203 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5
 175205 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175206 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175209 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db75092aea988b4be78c8273626f2ee40b4012b8
 175210 [host=cubietruck-gleizes]
 175215 [host=cubietruck-gleizes]
 175219 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175218 [host=cubietruck-gleizes]
 175227 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 953efa0b7b188458b18e4a727f3b1dfa77eacb61
 175226 [host=cubietruck-gleizes]
 175230 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 43ba5202e2eebd350161a8db674bf928c3e6f859
 175232 [host=cubietruck-gleizes]
 175236 [host=cubietruck-gleizes]
 175240 [host=cubietruck-gleizes]
 175241 [host=cubietruck-gleizes]
 175242 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175247 [host=cubietruck-gleizes]
 175248 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db75092aea988b4be78c8273626f2ee40b4012b8
 175253 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 43ba5202e2eebd350161a8db674bf928c3e6f859
 175251 [host=cubietruck-gleizes]
 175256 pass b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db75092aea988b4be78c8273626f2ee40b4012b8
 175258 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 549b042943a57b748ce80070d1174e4ff5b8ef0b
 175261 [host=cubietruck-gleizes]
 175265 [host=cubietruck-gleizes]
 175271 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 43ba5202e2eebd350161a8db674bf928c3e6f859
 175276 [host=cubietruck-gleizes]
 175272 [host=cubietruck-gleizes]
 175279 fail b746458e1ce1bec85e58b458386f8b7a0bedfaa6 88168c418c3bde7d51797e7cf875d528a8aa0eb1
 175277 [host=cubietruck-gleizes]
Searching for interesting versions
 Result found: flight 175173 (pass), for basis pass
 For basis failure, parent search stopping at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db75092aea988b4be78c8273626f2ee40b4012b8, results HASH(0x559b83d9b250) HASH(0x559b83da5a20) HASH(0x559b83db2b20) For basis failure, parent search stopping at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 630dc3798e1d0d1b95f7be8b176563eb40e866e5, results HASH(0x559b83d94c10) HASH(0x559b83d9e300) Result found: flight 175199 (fail), for basis failure (at ancestor ~868)
 Repro found: flight 175203 (pass), for basis pass
 Repro found: flight 175279 (fail), for basis failure
 0 revisions at b746458e1ce1bec85e58b458386f8b7a0bedfaa6 db75092aea988b4be78c8273626f2ee40b4012b8
No revisions left to test, checking graph state.
 Result found: flight 175209 (pass), for last pass
 Result found: flight 175230 (fail), for first failure
 Repro found: flight 175248 (pass), for last pass
 Repro found: flight 175253 (fail), for first failure
 Repro found: flight 175256 (pass), for last pass
 Repro found: flight 175271 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  43ba5202e2eebd350161a8db674bf928c3e6f859
  Bug not present: db75092aea988b4be78c8273626f2ee40b4012b8
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175271/


  commit 43ba5202e2eebd350161a8db674bf928c3e6f859
  Author: Viresh Kumar <viresh.kumar@linaro.org>
  Date:   Wed Dec 14 12:03:09 2022 +0100
  
      libxl: add support for generic virtio device
      
      This patch adds basic support for configuring and assisting generic
      Virtio backends, which could run in any domain.
      
      An example of domain configuration for mmio based Virtio I2C device is:
      virtio = ["type=virtio,device22,transport=mmio"]
      
      To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
      region) and pass them to the backend and update guest device-tree to
      create a DT node for the Virtio devices.
      
      Add special support for I2C and GPIO devices, which require the
      "compatible" DT property to be set, among other device specific
      properties. Support for generic virtio devices is also added, which just
      need a MMIO node but not any special DT properties, for such devices the
      user needs to pass "virtio,device" in the "type" string.
      
      The parsing of generic virtio device configurations will be done in a
      separate commit.
      
      Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
      Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
      Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
175277: truncated

flight 175277 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175277/

Perfect :-)
All tests in this flight passed as required

jobs:
 build-armhf                                                  truncated


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


