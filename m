Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2679A7DA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 14:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599368.934759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffj8-0004bd-BB; Mon, 11 Sep 2023 12:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599368.934759; Mon, 11 Sep 2023 12:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffj8-0004YX-6P; Mon, 11 Sep 2023 12:09:14 +0000
Received: by outflank-mailman (input) for mailman id 599368;
 Mon, 11 Sep 2023 12:09:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qffj7-0004YN-8J; Mon, 11 Sep 2023 12:09:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qffj7-00064n-4A; Mon, 11 Sep 2023 12:09:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qffj6-0007MJ-QY; Mon, 11 Sep 2023 12:09:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qffj6-0004BX-Q0; Mon, 11 Sep 2023 12:09:12 +0000
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
	bh=3FQXT+W8lIzUhTNZgbFERaB18o8TdtQ7toMNZWtFhac=; b=XEsP760Tdsg02o6UAOho2+/8zQ
	85kSbr1OOp1NyV+3JeMUZ9SrmvQniyy2ah9zYSJgafTgp/mdwFxcOjrmiNZ1pI1kCmLaO9sHbctkW
	pj0N7PvOf/Ru3K5btD8qMSWwwF5VFVwakq8JjQqBWzrlQQOYjC+u0QjOfiz5nv++dC/U=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-i386-xsm
Message-Id: <E1qffj6-0004BX-Q0@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 11 Sep 2023 12:09:12 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182938/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build --summary-out=tmp/182938.bisection-summary --basis-template=182707 --blessings=real,real-bisect,real-retry qemu-mainline build-i386-xsm xen-build
Searching for failure / basis pass:
 182914 fail [host=albana0] / 182707 [host=pinot1] 182638 [host=fiano0] 182606 [host=nobling0] 182588 [host=nobling0] 182584 [host=albana1] 182570 [host=nobling1] 182555 [host=nobling0] 182543 [host=albana1] 182520 [host=nobling1] 182508 [host=fiano1] 182422 [host=albana1] 182355 [host=nobling1] 182338 [host=nobling1] 182310 ok.
Failure / basis pass flights: 182914 / 182310
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
Basis pass 991515a0583f65a64b3a6fa354409c64e670a762 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5f142cb320d45d3d8dee2c82dae003cad39da8 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf a9a3b432a87b27e4debd6f80f14e2cfc9f52218c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#991515a0583f65a64b3a6fa354409c64e670a762-b240eab03530f063ef5438497d70a731b19a201e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#bb5f142cb320d45d3d8dee2c82dae003cad39da8-c5ea91da443b458352c1b629b490ee6631775cb4 git://xenbits.xen.org/osstest/seabios.git#1281e340ad1d90c0cc8e8d902bb34f1\
 871eb48cf-7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 git://xenbits.xen.org/xen.git#a9a3b432a87b27e4debd6f80f14e2cfc9f52218c-49b2d6a529122f10e17a17f807d8d51154b5ba14
Loaded 30516 nodes in revision graph
Searching for test results:
 182298 [host=huxelrebe0]
 182310 pass 991515a0583f65a64b3a6fa354409c64e670a762 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5f142cb320d45d3d8dee2c82dae003cad39da8 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf a9a3b432a87b27e4debd6f80f14e2cfc9f52218c
 182338 [host=nobling1]
 182355 [host=nobling1]
 182422 [host=albana1]
 182508 [host=fiano1]
 182520 [host=nobling1]
 182543 [host=albana1]
 182555 [host=nobling0]
 182570 [host=nobling1]
 182584 [host=albana1]
 182588 [host=nobling0]
 182606 [host=nobling0]
 182638 [host=fiano0]
 182707 [host=pinot1]
 182723 [host=albana1]
 182730 [host=albana1]
 182739 fail irrelevant
 182770 [host=albana1]
 182796 fail irrelevant
 182801 [host=albana1]
 182814 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182835 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182845 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182854 [host=albana1]
 182865 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182879 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182897 pass 991515a0583f65a64b3a6fa354409c64e670a762 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5f142cb320d45d3d8dee2c82dae003cad39da8 1281e340ad1d90c0cc8e8d902bb34f1871eb48cf a9a3b432a87b27e4debd6f80f14e2cfc9f52218c
 182884 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182898 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182899 fail b74f1f7ab5e956f58ae1771dc4e2a4b92bc51430 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2f352bc2270fdc896beb2957b5171b03ba3e2d66 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182902 fail 5443c2dc310d2c8eb15fb8eefd5057342e78cd0d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 631c872614aca91eaf947c1748f0f27f99635d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 cba6d44a13d5e25334d164e27cb1b1d7674aa05e
 182903 pass b81557a00c61cc80ab118828f16ed9ce79455880 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 269e60635a72f8dec4cb210b5b99e9e7f8920f34 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182900 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182904 pass 4d196352f35ac516b477e568265b4e537b0283d8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bde438c3ecdb9813038b226c429dd982925d8205 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 d8c3ff585b9fd10200b05aca77139de2789d0517
 182905 pass dfb941d32a2f38c9177729e39c6a6515abbbad48 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a9c17e9a21af9c4bf9c08dedf0f0df4a6566cf52 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 9a216e92de9f9011097e4f1fb55ff67ba0a21704
 182906 pass b81557a00c61cc80ab118828f16ed9ce79455880 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9f89423537653de07ca40c18b5ff5b70b104cc93 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182908 fail b81557a00c61cc80ab118828f16ed9ce79455880 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 34e8182053c065e5e99017f798fb79259e26f583 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 1f79fce10a75f88d2c2a6ace469a4046bc1b9cb5
 182909 pass c5753c3e38f3fde23eec9641cb3c433f443ff99e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 db1a88a5acc0df7d8a941aa772ef63c8941d1893 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 6621932264e3e86df3913db4249ecd3eb100b13f
 182910 pass c5753c3e38f3fde23eec9641cb3c433f443ff99e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e73b8bb8a3e9a162f70e9ffbf922d4fafc96bbfb 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 6621932264e3e86df3913db4249ecd3eb100b13f
 182907 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182913 pass 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ef9d20c63b64989ce4941dc48531c50728ddcc21 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182915 pass 0c4d0b6c8a05a6a62c0dca042f8e15e579e6f4af 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 87ec6f55af38e29be5b2b65a8acf84da73e06d06 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 e5522c71beaa83f2f5d2118724ace9f90c22e583
 182917 pass 14bf2cb411cae5306fd9efa8222264e8cf9ecc19 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f5fe7c17ac4e309e47e78f0f9761aebc8d2f2c81 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 067f18c3a72d8f0acccab831083b8518f0832d81
 182918 pass 92006e5804a4adff05556a97a951fd7766a1d79f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 eaf760ac0d92c60b81c47acd9c051228442f33c6 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 067f18c3a72d8f0acccab831083b8518f0832d81
 182919 pass 4c8144dd665619731b6c3c19f4f1ae664b69fa4b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c4e5f9a29faadc50fed673d720199db5638fbdab 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 6621932264e3e86df3913db4249ecd3eb100b13f
 182920 pass 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 92e1d39f989771f9fc190234111863c7376487c5 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 11d9f3ddf501d3a68b06fe8258795c44e1dc32d1
 182921 pass 00b51e0d78a547dd78119ec44fcc74a01b6f79c8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cd1e4db73646006039f25879af3bff55b2295ff3 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 11d9f3ddf501d3a68b06fe8258795c44e1dc32d1
 182922 pass 819cfc6b42a68790a23509e4fcc58ceb70e1965e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 50e7a40af372ee5931c99ef7390f5d3d6fbf6ec4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 ec272d8d4c5de1a143f3cec50e3f22d0f783f39b
 182924 pass beafabdae49c873adecdb7511dbebe9d4ff5c8f0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5c77c4f8a5ea9cb3f6bcf5ca33bab4d85d1d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 f805cf3e9b87584e16b03b5059b1163fd22bf5a0
 182925 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bb5c77c4f8a5ea9cb3f6bcf5ca33bab4d85d1d92 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182926 fail bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182914 fail b240eab03530f063ef5438497d70a731b19a201e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c5ea91da443b458352c1b629b490ee6631775cb4 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 49b2d6a529122f10e17a17f807d8d51154b5ba14
 182927 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3c7ee49b81d2fc2930c09f9e0206227516d406e1 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182928 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2a5919ab642a3273698233ef46c83741eec327bf 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182931 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1f2146f7ca0f04afc62c4a170ec78bd030f3e72f 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182932 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 875be287cdba7b5a499711823314355fccc60913 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182933 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182934 fail bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182935 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182936 fail bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182937 pass bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
 182938 fail bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ca056f4499c259c0de68ed7cefad7ee7b62bfa43 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
Searching for interesting versions
 Result found: flight 182310 (pass), for basis pass
 Result found: flight 182814 (fail), for basis failure (at ancestor ~11)
 Repro found: flight 182897 (pass), for basis pass
 Repro found: flight 182898 (fail), for basis failure
 0 revisions at bbf182229587958b17336c114e0a1525c4f90f3d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a5e9fbf1dfd5b3f901f987755c89f1dc636c3747 7a4003be25eae462f3c3d8aad96b57e34dc0c2b8 03f64b54a1d14893e7851a60ba4855fb75abf30a
No revisions left to test, checking graph state.
 Result found: flight 182933 (pass), for last pass
 Result found: flight 182934 (fail), for first failure
 Repro found: flight 182935 (pass), for last pass
 Repro found: flight 182936 (fail), for first failure
 Repro found: flight 182937 (pass), for last pass
 Repro found: flight 182938 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  ca056f4499c259c0de68ed7cefad7ee7b62bfa43
  Bug not present: a5e9fbf1dfd5b3f901f987755c89f1dc636c3747
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/182938/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
182938: tolerable ALL FAIL

flight 182938 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/182938/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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


