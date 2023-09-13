Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E3D79DD13
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 02:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600870.936686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgDWz-0004uN-CS; Wed, 13 Sep 2023 00:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600870.936686; Wed, 13 Sep 2023 00:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgDWz-0004rJ-9S; Wed, 13 Sep 2023 00:14:57 +0000
Received: by outflank-mailman (input) for mailman id 600870;
 Wed, 13 Sep 2023 00:14:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgDWx-0004r9-Bq; Wed, 13 Sep 2023 00:14:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgDWx-0005iq-8d; Wed, 13 Sep 2023 00:14:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qgDWw-0007Zt-Tm; Wed, 13 Sep 2023 00:14:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qgDWw-0007Mt-TI; Wed, 13 Sep 2023 00:14:54 +0000
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
	bh=NdU8Z30V25c6jJpyN0PE5cxOd3rD+CgvwA4q30MIls0=; b=hfdk+bSul3e7v6B24xrp2JW4Ra
	jGzycwjAX+afopBsyjpjZAdCZ0pPBGuQqg2QnUZH98K5wHu3eq1eGVT6lGVscEmPEfH93FzSettm9
	+j6LLZZNy1HIw4jijgyZrWHtyBvuF7f9YcDWhdjNHPGGMCFOGPWLP/zB2A0Op1CnKJPI=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-armhf
Message-Id: <E1qgDWw-0007Mt-TI@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Sep 2023 00:14:54 +0000

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182986/


  commit ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed May 3 12:48:02 2023 +0200
  
      Python: Drop support for Python 3.7
      
      Debian 10 is not anymore a supported distro, since Debian 12 was
      released on June 10, 2023.  Our supported build platforms as of today
      all support at least 3.8 (and all of them except for Ubuntu 20.04
      support 3.9):
      
      openSUSE Leap 15.5: 3.6.15 (3.11.2)
      CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16, 3.11.4)
      CentOS Stream 9:    3.9.17 (3.11.4)
      Fedora 37:          3.11.4
      Fedora 38:          3.11.4
      Debian 11:          3.9.2
      Debian 12:          3.11.2
      Alpine 3.14, 3.15:  3.9.16
      Alpine 3.16, 3.17:  3.10.10
      Ubuntu 20.04 LTS:   3.8.10
      Ubuntu 22.04 LTS:   3.10.12
      NetBSD 9.3:         3.9.13*
      FreeBSD 12.4:       3.9.16
      FreeBSD 13.1:       3.9.18
      OpenBSD 7.2:        3.9.17
      
      Note: NetBSD does not appear to have a default meta-package, but offers
      several options, the lowest of which is 3.7.15. However, "python39"
      appears to be a pre-requisite to one of the other packages we request
      in tests/vm/netbsd.
      
      Since it is safe under our supported platform policy, bump our
      minimum supported version of Python to 3.8.  The two most interesting
      features to have by default include:
      
      - the importlib.metadata module, whose lack is responsible for over 100
        lines of code in mkvenv.py
      
      - improvements to asyncio, for example asyncio.CancelledError
        inherits from BaseException rather than Exception
      
      In addition, code can now use the assignment operator ':='
      
      Because mypy now learns about importlib.metadata, a small change to
      mkvenv.py is needed to pass type checking.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/182986.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 182943 fail [host=cubietruck-gleizes] / 182707 [host=cubietruck-picasso] 182638 [host=cubietruck-metzinger] 182606 ok.
Failure / basis pass flights: 182943 / 182606
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
Basis pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#beafabdae49c873adecdb7511dbebe9d4ff5c8f0-cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a https://gitlab.com/qemu-project/qemu.git#17780edd81d27fcfdb7a802efc870a99788bd2fc-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#7a4003be25eae462f3c3d8aad96b57e34dc0c2b8-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#e5522c71beaa83f2f5d2118724ace9f90c22e583-49b2d6a\
 529122f10e17a17f807d8d51154b5ba14
Loaded 20183 nodes in revision graph
Searching for test results:
 182588 [host=cubietruck-metzinger]
 182606 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182638 [host=cubietruck-metzinger]
 182707 [host=cubietruck-picasso]
 182723 [host=cubietruck-braque]
 182730 [host=cubietruck-braque]
 182739 [host=cubietruck-braque]
 182770 [host=cubietruck-metzinger]
 182796 [host=cubietruck-metzinger]
 182801 [host=cubietruck-metzinger]
 182814 [host=cubietruck-picasso]
 182835 [host=cubietruck-picasso]
 182845 [host=cubietruck-picasso]
 182854 [host=cubietruck-metzinger]
 182865 [host=cubietruck-metzinger]
 182879 [host=cubietruck-metzinger]
 182884 [host=cubietruck-metzinger]
 182900 [host=cubietruck-metzinger]
 182907 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182914 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182939 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182929 fail cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182942 fail b240eab03530f063ef5438497d70a731b19a201e c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182946 fail cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182947 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 2f352bc2270fdc896beb2957b5171b03ba3e2d66 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182943 fail cc26a2cb3162845bf51d41ea8cd1c438ffa6c50a c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182950 fail 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 631c872614aca91eaf947c1748f0f27f99635d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182951 pass b81557a00c61cc80ab118828f16ed9ce79455880 269e60635a72f8dec4cb210b5b99e9e7f8920f34 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182953 pass 4d196352f35ac516b477e568265b4e537b0283d8 bde438c3ecdb9813038b226c429dd982925d8205 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 d8c3ff585b9fd10200b05aca77139de2789d0517
 182957 pass b81557a00c61cc80ab118828f16ed9ce79455880 c97d45d55798b27410253df8fc724d2a02189aa8 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182960 pass b81557a00c61cc80ab118828f16ed9ce79455880 13d9f6dca08a38e9258b6328f3ad61bdb8e19619 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182962 pass bbf182229587958b17336c114e0a1525c4f90f3d 3df17650730fcc84a551baf34133e22e96101c84 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182967 fail bbf182229587958b17336c114e0a1525c4f90f3d fc30abf84662fd68c9308aa07c18b71eed0dffc0 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182970 pass bbf182229587958b17336c114e0a1525c4f90f3d 875be287cdba7b5a499711823314355fccc60913 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182976 fail bbf182229587958b17336c114e0a1525c4f90f3d 28a43cb4dcb3a58408c2936f7be5cb1e1a3ca016 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182977 fail bbf182229587958b17336c114e0a1525c4f90f3d 0a88ac9662950cecac74b5de3056071a964e4fc4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182978 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182979 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182981 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182982 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182984 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182985 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182986 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
Searching for interesting versions
 Result found: flight 182606 (pass), for basis pass
 Result found: flight 182907 (fail), for basis failure (at ancestor ~14)
 Repro found: flight 182939 (pass), for basis pass
 Repro found: flight 182943 (fail), for basis failure
 0 revisions at bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
No revisions left to test, checking graph state.
 Result found: flight 182979 (pass), for last pass
 Result found: flight 182981 (fail), for first failure
 Repro found: flight 182982 (pass), for last pass
 Repro found: flight 182984 (fail), for first failure
 Repro found: flight 182985 (pass), for last pass
 Repro found: flight 182986 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182986/


  commit ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed May 3 12:48:02 2023 +0200
  
      Python: Drop support for Python 3.7
      
      Debian 10 is not anymore a supported distro, since Debian 12 was
      released on June 10, 2023.  Our supported build platforms as of today
      all support at least 3.8 (and all of them except for Ubuntu 20.04
      support 3.9):
      
      openSUSE Leap 15.5: 3.6.15 (3.11.2)
      CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16, 3.11.4)
      CentOS Stream 9:    3.9.17 (3.11.4)
      Fedora 37:          3.11.4
      Fedora 38:          3.11.4
      Debian 11:          3.9.2
      Debian 12:          3.11.2
      Alpine 3.14, 3.15:  3.9.16
      Alpine 3.16, 3.17:  3.10.10
      Ubuntu 20.04 LTS:   3.8.10
      Ubuntu 22.04 LTS:   3.10.12
      NetBSD 9.3:         3.9.13*
      FreeBSD 12.4:       3.9.16
      FreeBSD 13.1:       3.9.18
      OpenBSD 7.2:        3.9.17
      
      Note: NetBSD does not appear to have a default meta-package, but offers
      several options, the lowest of which is 3.7.15. However, "python39"
      appears to be a pre-requisite to one of the other packages we request
      in tests/vm/netbsd.
      
      Since it is safe under our supported platform policy, bump our
      minimum supported version of Python to 3.8.  The two most interesting
      features to have by default include:
      
      - the importlib.metadata module, whose lack is responsible for over 100
        lines of code in mkvenv.py
      
      - improvements to asyncio, for example asyncio.CancelledError
        inherits from BaseException rather than Exception
      
      In addition, code can now use the assignment operator ':='
      
      Because mypy now learns about importlib.metadata, a small change to
      mkvenv.py is needed to pass type checking.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182986: tolerable ALL FAIL

flight 182986 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182986/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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


