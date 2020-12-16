Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C707C2DB8EB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 03:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54968.95563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpMXm-00062R-Jy; Wed, 16 Dec 2020 02:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54968.95563; Wed, 16 Dec 2020 02:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpMXm-000621-FD; Wed, 16 Dec 2020 02:27:58 +0000
Received: by outflank-mailman (input) for mailman id 54968;
 Wed, 16 Dec 2020 02:27:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpMXl-00061t-2D; Wed, 16 Dec 2020 02:27:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpMXk-0003g2-Q3; Wed, 16 Dec 2020 02:27:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kpMXk-0006tp-KD; Wed, 16 Dec 2020 02:27:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kpMXk-0006zb-Jk; Wed, 16 Dec 2020 02:27:56 +0000
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
	bh=8m3MaZQSLJ0PvCgUhLAf3bAVvEuKlrjTsuC7AE++B8c=; b=hM8vkdog0897MuTpmeXffte5KL
	dM5Q1tcpSbvJKWwVwslWqL0A3DAU/78AMTYTBfkN0KYAtsWKvaUbw3Mmn9sJdAUXru3wU+vPHDBVi
	A1OLsQezWZoZEMyAsRcwWzGjPujmnW2Go+qn/x+NiLMe5Ee+m/2lk1+yGGrT83UuR6AQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Message-Id: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Dec 2020 02:27:56 +0000

branch xen-unstable-smoke
xenbranch xen-unstable-smoke
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  929f23114061a0089e6d63d109cf6a1d03d35c71
  Bug not present: 8bc342b043a6838c03cd86039a34e3f8eea1242f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157589/


  commit 929f23114061a0089e6d63d109cf6a1d03d35c71
  Author: Paul Durrant <pdurrant@amazon.com>
  Date:   Tue Dec 8 19:30:26 2020 +0000
  
      libxl: introduce 'libxl_pci_bdf' in the idl...
      
      ... and use in 'libxl_device_pci'
      
      This patch is preparatory work for restricting the type passed to functions
      that only require BDF information, rather than passing a 'libxl_device_pci'
      structure which is only partially filled. In this patch only the minimal
      mechanical changes necessary to deal with the structural changes are made.
      Subsequent patches will adjust the code to make better use of the new type.
      
      Signed-off-by: Paul Durrant <pdurrant@amazon.com>
      Acked-by: Wei Liu <wl@xen.org>
      Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build --summary-out=tmp/157589.bisection-summary --basis-template=157560 --blessings=real,real-bisect,real-retry xen-unstable-smoke build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 157575 fail [host=himrod2] / 157560 ok.
Failure / basis pass flights: 157575 / 157560
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bf0fab14256057bbd145563151814300476bb28
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 904148ecb4a59d4c8375d8e8d38117b8605e10ac
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#7ea428895af2840d85c524f0bd11a38aac308\
 308-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#904148ecb4a59d4c8375d8e8d38117b8605e10ac-8bf0fab14256057bbd145563151814300476bb28
Loaded 5001 nodes in revision graph
Searching for test results:
 157560 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 904148ecb4a59d4c8375d8e8d38117b8605e10ac
 157570 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bf0fab14256057bbd145563151814300476bb28
 157574 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 904148ecb4a59d4c8375d8e8d38117b8605e10ac
 157577 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bf0fab14256057bbd145563151814300476bb28
 157575 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bf0fab14256057bbd145563151814300476bb28
 157579 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 4951b9ea807d4a4e5a54798d366b2ea3d6ca5060
 157580 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bc342b043a6838c03cd86039a34e3f8eea1242f
 157581 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 66c2fbc6e82b1aa7b9f0fb37eecf93983c348058
 157583 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 96ed6ff29741df820217b6b744eb0fa2d76b50f3
 157585 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 929f23114061a0089e6d63d109cf6a1d03d35c71
 157586 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bc342b043a6838c03cd86039a34e3f8eea1242f
 157587 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 929f23114061a0089e6d63d109cf6a1d03d35c71
 157588 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bc342b043a6838c03cd86039a34e3f8eea1242f
 157589 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 929f23114061a0089e6d63d109cf6a1d03d35c71
Searching for interesting versions
 Result found: flight 157560 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bc342b043a6838c03cd86039a34e3f8eea1242f, results HASH(0x564e75a40ce8) HASH(0x564e75a40fe8) HASH(0x564e75a3ee60) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895\
 af2840d85c524f0bd11a38aac308308 4951b9ea807d4a4e5a54798d366b2ea3d6ca5060, results HASH(0x564e75a3ece0) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 904148ecb4a59d4c8375d8e8d38117b8605e10ac, results HASH(0x564e75a34368) HASH(0x564e75a2d5a8) Result found: flight 157570 (fail), for basis failure (at ancestor ~674)
 Repro found: flight 157574 (pass), for basis pass
 Repro found: flight 157575 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 8bc342b043a6838c03cd86039a34e3f8eea1242f
No revisions left to test, checking graph state.
 Result found: flight 157580 (pass), for last pass
 Result found: flight 157585 (fail), for first failure
 Repro found: flight 157586 (pass), for last pass
 Repro found: flight 157587 (fail), for first failure
 Repro found: flight 157588 (pass), for last pass
 Repro found: flight 157589 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  929f23114061a0089e6d63d109cf6a1d03d35c71
  Bug not present: 8bc342b043a6838c03cd86039a34e3f8eea1242f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157589/


  commit 929f23114061a0089e6d63d109cf6a1d03d35c71
  Author: Paul Durrant <pdurrant@amazon.com>
  Date:   Tue Dec 8 19:30:26 2020 +0000
  
      libxl: introduce 'libxl_pci_bdf' in the idl...
      
      ... and use in 'libxl_device_pci'
      
      This patch is preparatory work for restricting the type passed to functions
      that only require BDF information, rather than passing a 'libxl_device_pci'
      structure which is only partially filled. In this patch only the minimal
      mechanical changes necessary to deal with the structural changes are made.
      Subsequent patches will adjust the code to make better use of the new type.
      
      Signed-off-by: Paul Durrant <pdurrant@amazon.com>
      Acked-by: Wei Liu <wl@xen.org>
      Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Revision graph left in /home/logs/results/bisect/xen-unstable-smoke/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
157589: tolerable ALL FAIL

flight 157589 xen-unstable-smoke real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/157589/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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


