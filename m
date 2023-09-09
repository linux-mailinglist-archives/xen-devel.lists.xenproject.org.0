Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D3799632
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 06:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598382.933133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qepNH-00065Q-3R; Sat, 09 Sep 2023 04:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598382.933133; Sat, 09 Sep 2023 04:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qepNG-00063Z-U9; Sat, 09 Sep 2023 04:15:10 +0000
Received: by outflank-mailman (input) for mailman id 598382;
 Sat, 09 Sep 2023 04:15:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qepNF-00063P-L7; Sat, 09 Sep 2023 04:15:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qepNF-0002eM-I3; Sat, 09 Sep 2023 04:15:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qepNF-0000EF-91; Sat, 09 Sep 2023 04:15:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qepNF-00038U-8V; Sat, 09 Sep 2023 04:15:09 +0000
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
	bh=/zOE/bZO/INaAdPZUQZZhsp5EvCIJ4HJNRcSCvCXLqw=; b=DePRVOEySTx3heCXCGBtyM1oZS
	qJP5RLqTwzfbYZYQlTYHG38YWbJa1HDQHm6Z/aZmDbFvUpZwEYp+2owPjBZhLeypGEVvahW7PzV9R
	QStqvRmE8gbma+kXxjzxUzRxBjDhnrMJOqMwpeqc/vpWlWQnEizk8I942QRw7+IwJtA4=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-arm64-xsm
Message-Id: <E1qepNF-00038U-8V@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Sep 2023 04:15:09 +0000

branch xen-unstable
xenbranch xen-unstable
job build-arm64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182800/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build --summary-out=tmp/182800.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-arm64-xsm xen-build
Searching for failure / basis pass:
 182796 fail [host=rochester0] / 182707 [host=rochester1] 182638 [host=rochester1] 182606 [host=rochester1] 182588 ok.
Failure / basis pass flights: 182796 / 182588
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d4ae5df71190148c902942c3462245e97ed2fcc8 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
Basis pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#beafabdae49c873adecdb7511dbebe9d4ff5c8f0-d4ae5df71190148c902942c3462245e97ed2fcc8 https://gitlab.com/qemu-project/qemu.git#17780edd81d27fcfdb7a802efc870a99788bd2fc-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#7a4003be25eae462f3c3d8aad96b57e34dc0c2b8-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#e5522c71beaa83f2f5d2118724ace9f90c22e583-b2dd946\
 ece74e2b6e0601f28caef72f4f9950102
Loaded 20167 nodes in revision graph
Searching for test results:
 182588 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182606 [host=rochester1]
 182638 [host=rochester1]
 182707 [host=rochester1]
 182723 fail irrelevant
 182731 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182733 fail irrelevant
 182730 fail 634192665ea22eb610ad54f10bad8143ef77076d 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182736 pass irrelevant
 182741 fail 634192665ea22eb610ad54f10bad8143ef77076d 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182742 pass b81557a00c61cc80ab118828f16ed9ce79455880 269e60635a72f8dec4cb210b5b99e9e7f8920f34 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182744 pass 4d196352f35ac516b477e568265b4e537b0283d8 bde438c3ecdb9813038b226c429dd982925d8205 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 d8c3ff585b9fd10200b05aca77139de2789d0517
 182750 pass b81557a00c61cc80ab118828f16ed9ce79455880 c97d45d55798b27410253df8fc724d2a02189aa8 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182756 pass 24da5c2f283eeb44b625af9bf86cae7db2f99ff4 9f89423537653de07ca40c18b5ff5b70b104cc93 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182762 pass 4d196352f35ac516b477e568265b4e537b0283d8 bb5c77c4f8a5ea9cb3f6bcf5ca33bab4d85d1d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 c0291d6b5c84de104b931111d1f81da323feb67f
 182765 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182739 fail 2ce5ae43c2166984d20341993c4b9dbb337aad79 03a3a62fbd0aa5227e978eef3c67d3978aec9e5f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182767 pass bbf182229587958b17336c114e0a1525c4f90f3d a24f15d26f8cf0c0533c3422bebc70305626fc14 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182769 pass bbf182229587958b17336c114e0a1525c4f90f3d bafe78ad3bc4cef3a4d22e477c8940a7c955f1ea 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182775 pass bbf182229587958b17336c114e0a1525c4f90f3d 73258b386489c410e4d449159a6c8420e3b7733f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182776 pass bbf182229587958b17336c114e0a1525c4f90f3d 875be287cdba7b5a499711823314355fccc60913 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182781 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182788 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182790 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182770 fail 493a375eef584be2beaaa3d418a8e7ff333c5468 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182793 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182795 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 17780edd81d27fcfdb7a802efc870a99788bd2fc 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182797 fail 493a375eef584be2beaaa3d418a8e7ff333c5468 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182799 pass bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182796 fail d4ae5df71190148c902942c3462245e97ed2fcc8 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
 182800 fail bbf182229587958b17336c114e0a1525c4f90f3d ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
Searching for interesting versions
 Result found: flight 182588 (pass), for basis pass
 Result found: flight 182770 (fail), for basis failure (at ancestor ~5)
 Repro found: flight 182795 (pass), for basis pass
 Repro found: flight 182796 (fail), for basis failure
 0 revisions at bbf182229587958b17336c114e0a1525c4f90f3d a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 b2dd946ece74e2b6e0601f28caef72f4f9950102
No revisions left to test, checking graph state.
 Result found: flight 182781 (pass), for last pass
 Result found: flight 182788 (fail), for first failure
 Repro found: flight 182790 (pass), for last pass
 Repro found: flight 182793 (fail), for first failure
 Repro found: flight 182799 (pass), for last pass
 Repro found: flight 182800 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182800/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182800: tolerable ALL FAIL

flight 182800 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182800/

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


