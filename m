Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DD8A3611
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 20:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704933.1101501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvM6B-0005Se-P6; Fri, 12 Apr 2024 18:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704933.1101501; Fri, 12 Apr 2024 18:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvM6B-0005PU-Kn; Fri, 12 Apr 2024 18:58:07 +0000
Received: by outflank-mailman (input) for mailman id 704933;
 Fri, 12 Apr 2024 18:58:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvM69-0005PK-UM; Fri, 12 Apr 2024 18:58:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvM69-0003HT-Sk; Fri, 12 Apr 2024 18:58:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvM69-0008FQ-N8; Fri, 12 Apr 2024 18:58:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvM69-0001Dp-KY; Fri, 12 Apr 2024 18:58:05 +0000
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
	bh=aQQzoSimxp1lbQpYu04P1qmBBeNxnXu54CEX44eFcPc=; b=d0pmtTelbKzYhhhSS1B9RFsGHa
	fkYeY2lL9imOl31ASAThCHAKU8zYqn45q25M0rbj1fWZAAjkbB7LklR8o95WWZFadgDFy2Li0bhxP
	9OZT2k5oTkLRAdFxkSPtW1Bmakz789b8FCZc0wGoYUQS3xZQZ9r/k/2LgI2tKryDdD2I=;
To: xen-devel@lists.xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-xl-qemuu-win7-amd64
Message-Id: <E1rvM69-0001Dp-KY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 Apr 2024 18:58:05 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-win7-amd64
testid windows-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  489d93cd0fdd9609ca0414d7efae51c381106dbc
  Bug not present: 4b3da946ad7e3452761478ae683da842e7ff20d6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185369/


  commit 489d93cd0fdd9609ca0414d7efae51c381106dbc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qemuu-win7-amd64.windows-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemuu-win7-amd64.windows-install --summary-out=tmp/185377.bisection-summary --basis-template=185281 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-xl-qemuu-win7-amd64 windows-install
Searching for failure / basis pass:
 185310 fail [host=pinot0] / 185281 ok.
Failure / basis pass flights: 185310 / 185281
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
Basis pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 672b26b66ebb5ff3d28c573a6545a08020b27495
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#347385861c50adc8d4801d4b899eded38a2f04cd-347385861c50adc8d4801d4b899eded38a2f04cd git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f57\
 2342c03e6-0df9387c8983e1b1e72d8c574356f572342c03e6 git://xenbits.xen.org/xen.git#672b26b66ebb5ff3d28c573a6545a08020b27495-0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
Loaded 5001 nodes in revision graph
Searching for test results:
 185277 pass irrelevant
 185281 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 672b26b66ebb5ff3d28c573a6545a08020b27495
 185294 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f48299cad5c3c69fdc2c101517a6dab9c9827ea5
 185311 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 672b26b66ebb5ff3d28c573a6545a08020b27495
 185313 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 f48299cad5c3c69fdc2c101517a6dab9c9827ea5
 185320 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 97c5b8b657e41a6645de9d40713b881234417b49
 185325 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 c62673c4334b3372ebd4292a7ac8185357e7ea27
 185332 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4be1fef1e6572c2be0bd378902ffb62a6e73faeb
 185336 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4b3da946ad7e3452761478ae683da842e7ff20d6
 185342 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 489d93cd0fdd9609ca0414d7efae51c381106dbc
 185348 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4b3da946ad7e3452761478ae683da842e7ff20d6
 185352 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 489d93cd0fdd9609ca0414d7efae51c381106dbc
 185362 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4b3da946ad7e3452761478ae683da842e7ff20d6
 185310 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
 185369 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 489d93cd0fdd9609ca0414d7efae51c381106dbc
 185377 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
Searching for interesting versions
 Result found: flight 185281 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4b3da946ad7e3452761478ae683da842e7ff20d6, results HASH(0x560daeb52988) HASH(0x560daebe6ad8) HASH(0x560daebe9948) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8\
 983e1b1e72d8c574356f572342c03e6 4be1fef1e6572c2be0bd378902ffb62a6e73faeb, results HASH(0x560daeb68e50) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 672b26b66ebb5ff3d28c573a6545a08020b27495, results HASH(0x560daeb59bc8) HASH(0x560daeb5e680) Result found: flight 185294 (fail), for basis failure (at ancestor ~3073)
 Repro found: flight 185311 (pass), for basis pass
 Repro found: flight 185377 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 4b3da946ad7e3452761478ae683da842e7ff20d6
No revisions left to test, checking graph state.
 Result found: flight 185336 (pass), for last pass
 Result found: flight 185342 (fail), for first failure
 Repro found: flight 185348 (pass), for last pass
 Repro found: flight 185352 (fail), for first failure
 Repro found: flight 185362 (pass), for last pass
 Repro found: flight 185369 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  489d93cd0fdd9609ca0414d7efae51c381106dbc
  Bug not present: 4b3da946ad7e3452761478ae683da842e7ff20d6
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185369/


  commit 489d93cd0fdd9609ca0414d7efae51c381106dbc
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Mar 26 22:47:25 2024 +0000
  
      x86/spec-ctrl: Fix BTC/SRSO mitigations
      
      We were looking for SCF_entry_ibpb in the wrong variable in the top-of-stack
      block, and xen_spec_ctrl won't have had bit 5 set because Xen doesn't
      understand SPEC_CTRL_RRSBA_DIS_U yet.
      
      This is XSA-455 / CVE-2024-31142.
      
      Fixes: 53a570b28569 ("x86/spec-ctrl: Support IBPB-on-entry")
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qemuu-win7-amd64.windows-install.{dot,ps,png,html,svg}.
----------------------------------------
185377: tolerable FAIL

flight 185377 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185377/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail baseline untested


jobs:
 build-amd64                                                  pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    


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


