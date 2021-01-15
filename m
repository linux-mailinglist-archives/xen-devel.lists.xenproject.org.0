Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357902F86EA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68624.122865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Vzi-00049z-2S; Fri, 15 Jan 2021 20:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68624.122865; Fri, 15 Jan 2021 20:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Vzh-00049J-SS; Fri, 15 Jan 2021 20:46:53 +0000
Received: by outflank-mailman (input) for mailman id 68624;
 Fri, 15 Jan 2021 20:46:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Vzg-00049B-JT; Fri, 15 Jan 2021 20:46:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Vzg-0004Cs-9y; Fri, 15 Jan 2021 20:46:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Vzg-0006gV-3G; Fri, 15 Jan 2021 20:46:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l0Vzg-0003LQ-2n; Fri, 15 Jan 2021 20:46:52 +0000
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
	bh=Kc/dmkIWxlrYwSQ4KujqFyN1rdRJQULyDTrvGyowFxg=; b=WOL3qyZcIl0hlo6stIcqitPu8/
	FFS5wZX3xYaNrzKZ5WYLplAePBbS/zNmd6YJx7HlYXukMbDLAAU4Q4RfeunwIHhth7AkJ2/5kgIJe
	/k5GdF8tMlX0FX7Dc7UxdUFSnTa+CNB3p/u1Q5CyEjb0AX3XdXjImkFFJvwq+DCxbOi8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-arm64-xsm
Message-Id: <E1l0Vzg-0003LQ-2n@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Jan 2021 20:46:52 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-arm64-xsm
testid xen-build

Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ced9795c6cb4165b6d231a732e5351933dbd8b38
  Bug not present: aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158450/


  commit ced9795c6cb4165b6d231a732e5351933dbd8b38
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 15 16:03:56 2021 +0100
  
      mm: split out mfn_t / gfn_t / pfn_t definitions and helpers
      
      xen/mm.h has heavy dependencies, while in a number of cases only these
      type definitions are needed. This separation then also allows pulling in
      these definitions when including xen/mm.h would cause cyclic
      dependencies.
      
      Replace xen/mm.h inclusion where possible in include/xen/. (In
      xen/iommu.h also take the opportunity and correct the few remaining
      sorting issues.)
      
      While the change could be dropped, remove an unnecessary asm/io.h
      inclusion from xen/arch/x86/acpi/power.c. This was the initial attempt
      to address build issues with it, until it became clear that the header
      itself needs adjustment.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build --summary-out=tmp/158450.bisection-summary --basis-template=158434 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-arm64-xsm xen-build
Searching for failure / basis pass:
 158440 fail [host=laxton0] / 158434 ok.
Failure / basis pass flights: 158440 / 158434
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7ea428895af2840d85c524f0bd11a38aac308308 cc83ee4c6c3790dd98a91cc0d34162dab067bca7
Basis pass 7ea428895af2840d85c524f0bd11a38aac308308 8868a0e3f67436a5fbee750624e24a6533357f52
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#8868a0e3f67436a5fbee750624e24a6533357f52-cc83ee4c6c3790dd98a91cc0d34162dab067bca7
Loaded 5001 nodes in revision graph
Searching for test results:
 158434 pass 7ea428895af2840d85c524f0bd11a38aac308308 8868a0e3f67436a5fbee750624e24a6533357f52
 158438 fail 7ea428895af2840d85c524f0bd11a38aac308308 cc83ee4c6c3790dd98a91cc0d34162dab067bca7
 158439 pass 7ea428895af2840d85c524f0bd11a38aac308308 8868a0e3f67436a5fbee750624e24a6533357f52
 158441 fail 7ea428895af2840d85c524f0bd11a38aac308308 cc83ee4c6c3790dd98a91cc0d34162dab067bca7
 158442 fail 7ea428895af2840d85c524f0bd11a38aac308308 ced9795c6cb4165b6d231a732e5351933dbd8b38
 158443 pass 7ea428895af2840d85c524f0bd11a38aac308308 aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
 158444 fail 7ea428895af2840d85c524f0bd11a38aac308308 ced9795c6cb4165b6d231a732e5351933dbd8b38
 158445 pass 7ea428895af2840d85c524f0bd11a38aac308308 aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
 158440 fail 7ea428895af2840d85c524f0bd11a38aac308308 cc83ee4c6c3790dd98a91cc0d34162dab067bca7
 158447 fail 7ea428895af2840d85c524f0bd11a38aac308308 ced9795c6cb4165b6d231a732e5351933dbd8b38
 158449 pass 7ea428895af2840d85c524f0bd11a38aac308308 aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
 158450 fail 7ea428895af2840d85c524f0bd11a38aac308308 ced9795c6cb4165b6d231a732e5351933dbd8b38
Searching for interesting versions
 Result found: flight 158434 (pass), for basis pass
 For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063, results HASH(0x5617ab0f3c70) HASH(0x5617ab1052f0) HASH(0x5617ab108a00) For basis failure, parent search stopping at 7ea428895af2840d85c524f0bd11a38aac308308 8868a0e3f67436a5fbee750624e24a6533357f52, results HASH(0x5617ab0ee8b8) HASH(0x5617ab0fab20) Result found: flight 158438 (fail), for basis failure (at ancestor ~809)
 Repro found: flight 158439 (pass), for basis pass
 Repro found: flight 158440 (fail), for basis failure
 0 revisions at 7ea428895af2840d85c524f0bd11a38aac308308 aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
No revisions left to test, checking graph state.
 Result found: flight 158443 (pass), for last pass
 Result found: flight 158444 (fail), for first failure
 Repro found: flight 158445 (pass), for last pass
 Repro found: flight 158447 (fail), for first failure
 Repro found: flight 158449 (pass), for last pass
 Repro found: flight 158450 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ced9795c6cb4165b6d231a732e5351933dbd8b38
  Bug not present: aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158450/


  commit ced9795c6cb4165b6d231a732e5351933dbd8b38
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Fri Jan 15 16:03:56 2021 +0100
  
      mm: split out mfn_t / gfn_t / pfn_t definitions and helpers
      
      xen/mm.h has heavy dependencies, while in a number of cases only these
      type definitions are needed. This separation then also allows pulling in
      these definitions when including xen/mm.h would cause cyclic
      dependencies.
      
      Replace xen/mm.h inclusion where possible in include/xen/. (In
      xen/iommu.h also take the opportunity and correct the few remaining
      sorting issues.)
      
      While the change could be dropped, remove an unnecessary asm/io.h
      inclusion from xen/arch/x86/acpi/power.c. This was the initial attempt
      to address build issues with it, until it became clear that the header
      itself needs adjustment.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
158450: tolerable ALL FAIL

flight 158450 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/158450/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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


