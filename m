Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89C8B4BDB
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 14:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713664.1114577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s142u-0003NX-Uq; Sun, 28 Apr 2024 12:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713664.1114577; Sun, 28 Apr 2024 12:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s142u-0003Lz-Ru; Sun, 28 Apr 2024 12:54:20 +0000
Received: by outflank-mailman (input) for mailman id 713664;
 Sun, 28 Apr 2024 12:54:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s142t-0003Lp-Li; Sun, 28 Apr 2024 12:54:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s142t-0007bB-J5; Sun, 28 Apr 2024 12:54:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s142t-0008RK-Ch; Sun, 28 Apr 2024 12:54:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s142t-0001JT-C8; Sun, 28 Apr 2024 12:54:19 +0000
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
	bh=hkTcLAiSns4iIfTQe3oSEc8wxFdU2fILvSOYVDjJT20=; b=ZJGlJIBzcYaPNPBWneAbrV03f4
	2T4EDJAGC3B2k4gE9CpyW8EerIaelVglwYcjhTW2J5vjP6N/vM72Ox3AlSiPg2EG1tlzJl90iTcjc
	Z6rzMyuB+ZklSFWuCd3IhCKwam8K5cmXkwD6fXfqAZb6Ai1QTNzlNiY9XKdq41b1Xdmk=;
To: xen-devel@lists.xenproject.org
Subject: [linux-6.1 bisection] complete build-armhf-pvops
Message-Id: <E1s142t-0001JT-C8@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Apr 2024 12:54:19 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf-pvops
testid kernel-build

Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  0f4048e1a0c6e9d3d31ce5b684600fd137cebfca
  Bug not present: e2b8480b709d48ca1723eed7258f26a0df9a1965
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185856/


  commit 0f4048e1a0c6e9d3d31ce5b684600fd137cebfca
  Author: Linus Walleij <linus.walleij@linaro.org>
  Date:   Tue Sep 26 15:25:32 2023 +0200
  
      ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      
      [ Upstream commit 319e6ac143b9e9048e527ab9dd2aabb8fdf3d60f ]
      
      The Pandora uses GPIO descriptors pretty much exclusively, but not
      for ASoC, so let's fix it. Register the pins in a descriptor table
      in the machine since the ASoC device is not using device tree.
      
      Use static locals for the GPIO descriptors because I'm not able
      to experient with better state storage on any real hardware. Others
      using the Pandora can come afterwards and improve this.
      
      Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
      Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
      Link: https://lore.kernel.org/r/20230926-descriptors-asoc-ti-v1-4-60cf4f8adbc5@linaro.org
      Signed-off-by: Mark Brown <broonie@kernel.org>
      Signed-off-by: Sasha Levin <sashal@kernel.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/linux-6.1/build-armhf-pvops.kernel-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/linux-6.1/build-armhf-pvops.kernel-build --summary-out=tmp/185856.bisection-summary --basis-template=185746 --blessings=real,real-bisect,real-retry linux-6.1 build-armhf-pvops kernel-build
Searching for failure / basis pass:
 185835 fail [host=debina1] / 185746 [host=himrod2] 185434 [host=godello1] 185299 [host=himrod2] 185231 [host=himrod2] 185227 [host=himrod0] 185167 [host=elbling0] 185053 [host=himrod2] 184922 [host=himrod0] 184841 [host=himrod2] 184831 [host=himrod2] 184734 [host=albana0] 184687 [host=himrod2] 184595 [host=himrod2] 184570 [host=himrod0] 184563 [host=himrod0] 184549 [host=godello0] template as basis? using template as basis.
Failure / basis pass flights: 185835 / 185746
Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Latest f2295faba5e8249ae4082791bfc1664c88fff83a c530a75c1e6a472b0eb9558310b518f0dfcd8860
Basis pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860
Generating revisions with ./adhoc-revtuple-generator  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git#6741e066ec7633450d3186946035c1f80c4226b8-f2295faba5e8249ae4082791bfc1664c88fff83a git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860
Loaded 5001 nodes in revision graph
Searching for test results:
 185746 [host=himrod2]
 185837 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185832 fail f2295faba5e8249ae4082791bfc1664c88fff83a c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185838 fail f2295faba5e8249ae4082791bfc1664c88fff83a c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185856 fail 0f4048e1a0c6e9d3d31ce5b684600fd137cebfca c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185840 pass 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185842 fail f2295faba5e8249ae4082791bfc1664c88fff83a c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185843 fail b928cde9c07cf031a9a5bffbfb94048f340d34ee c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185844 pass 8d56bad42ac4c43c6c72ddd6a654a2628bf839c5 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185846 pass beb3ff19a55d78d3c70f9284458c9d155818ae27 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185847 pass 4b7ed2400e0d895a9920c80d63646728bb389baa c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185835 fail f2295faba5e8249ae4082791bfc1664c88fff83a c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185848 pass 87709f7ecdb884ab75e3de6f951dffe500ee95b2 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185850 pass 4d74cb9cdfd51e6d854f8da54113e716335cb2ca c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185851 pass e2b8480b709d48ca1723eed7258f26a0df9a1965 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185852 fail 0f4048e1a0c6e9d3d31ce5b684600fd137cebfca c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185853 pass e2b8480b709d48ca1723eed7258f26a0df9a1965 c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185854 fail 0f4048e1a0c6e9d3d31ce5b684600fd137cebfca c530a75c1e6a472b0eb9558310b518f0dfcd8860
 185855 pass e2b8480b709d48ca1723eed7258f26a0df9a1965 c530a75c1e6a472b0eb9558310b518f0dfcd8860
Searching for interesting versions
 Result found: flight 185837 (pass), for basis pass
 For basis failure, parent search stopping at e2b8480b709d48ca1723eed7258f26a0df9a1965 c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1ccc1ae8) HASH(0x55fc1ccbb8b0) HASH(0x55fc1cc1eb68) For basis failure, parent search stopping at 4d74cb9cdfd51e6d854f8da54113e716335cb2ca c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1ccc0be8) For basis failure, parent search stopping at 87709f7ecdb884ab75e3de6f951dffe500ee95b2 c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x\
 55fc1cc31c80) For basis failure, parent search stopping at 4b7ed2400e0d895a9920c80d63646728bb389baa c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1ccb43b0) For basis failure, parent search stopping at beb3ff19a55d78d3c70f9284458c9d155818ae27 c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1ccbbeb0) For basis failure, parent search stopping at 8d56bad42ac4c43c6c72ddd6a654a2628bf839c5 c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1cc15bf8) For basis failu\
 re, parent search stopping at 6741e066ec7633450d3186946035c1f80c4226b8 c530a75c1e6a472b0eb9558310b518f0dfcd8860, results HASH(0x55fc1cc18828) HASH(0x55fc1ccb4fb0) Result found: flight 185838 (fail), for basis failure (at ancestor ~5000)
 Repro found: flight 185840 (pass), for basis pass
 Repro found: flight 185842 (fail), for basis failure
 0 revisions at e2b8480b709d48ca1723eed7258f26a0df9a1965 c530a75c1e6a472b0eb9558310b518f0dfcd8860
No revisions left to test, checking graph state.
 Result found: flight 185851 (pass), for last pass
 Result found: flight 185852 (fail), for first failure
 Repro found: flight 185853 (pass), for last pass
 Repro found: flight 185854 (fail), for first failure
 Repro found: flight 185855 (pass), for last pass
 Repro found: flight 185856 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  Bug introduced:  0f4048e1a0c6e9d3d31ce5b684600fd137cebfca
  Bug not present: e2b8480b709d48ca1723eed7258f26a0df9a1965
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185856/


  commit 0f4048e1a0c6e9d3d31ce5b684600fd137cebfca
  Author: Linus Walleij <linus.walleij@linaro.org>
  Date:   Tue Sep 26 15:25:32 2023 +0200
  
      ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      
      [ Upstream commit 319e6ac143b9e9048e527ab9dd2aabb8fdf3d60f ]
      
      The Pandora uses GPIO descriptors pretty much exclusively, but not
      for ASoC, so let's fix it. Register the pins in a descriptor table
      in the machine since the ASoC device is not using device tree.
      
      Use static locals for the GPIO descriptors because I'm not able
      to experient with better state storage on any real hardware. Others
      using the Pandora can come afterwards and improve this.
      
      Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
      Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
      Link: https://lore.kernel.org/r/20230926-descriptors-asoc-ti-v1-4-60cf4f8adbc5@linaro.org
      Signed-off-by: Mark Brown <broonie@kernel.org>
      Signed-off-by: Sasha Levin <sashal@kernel.org>

pnmtopng: 229 colors found
Revision graph left in /home/logs/results/bisect/linux-6.1/build-armhf-pvops.kernel-build.{dot,ps,png,html,svg}.
----------------------------------------
185856: tolerable ALL FAIL

flight 185856 linux-6.1 real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185856/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-pvops             6 kernel-build            fail baseline untested


jobs:
 build-armhf-pvops                                            fail    


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


