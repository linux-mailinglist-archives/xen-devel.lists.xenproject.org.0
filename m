Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF235AF4B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Apr 2021 19:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108247.206641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVHR4-0008Kw-Ia; Sat, 10 Apr 2021 17:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108247.206641; Sat, 10 Apr 2021 17:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVHR4-0008KT-EE; Sat, 10 Apr 2021 17:30:18 +0000
Received: by outflank-mailman (input) for mailman id 108247;
 Sat, 10 Apr 2021 17:30:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVHR2-0008KL-UC; Sat, 10 Apr 2021 17:30:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVHR2-0004pj-Nv; Sat, 10 Apr 2021 17:30:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lVHR2-0000as-Ez; Sat, 10 Apr 2021 17:30:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lVHR2-00016N-EU; Sat, 10 Apr 2021 17:30:16 +0000
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
	bh=3HGDXsWO8M7csUtGD54sFV/5mLxw9jkqvOC1nbz5lDw=; b=wWcSIvi2miRJ+oNyg2Dfw6sT2d
	gzAShi/nRZRM2+UUNUU7Xk808kIy/Yf5BZxnOmiBgf42JOfnYP1jUWUFroZ/Es4JADDpqlX/kLFlz
	IOfZ7ifpN7fJ5FIu33+InN+mlClbr8lfOHEGXS8I1LOj/xBB2rXYifyGjE11xVOAda6w=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1lVHR2-00016N-EU@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Apr 2021 17:30:16 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Bug not present: cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160911/


  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore --summary-out=tmp/160911.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm guest-saverestore
Searching for failure / basis pass:
 160851 fail [host=albana0] / 160125 [host=huxelrebe1] 160119 [host=godello0] 160104 [host=fiano1] 160097 [host=chardonnay1] 160091 [host=albana1] 160082 [host=pinot1] 160079 [host=godello0] 160070 [host=huxelrebe1] 160066 [host=elbling0] 160002 ok.
Failure / basis pass flights: 160851 / 160002
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc4d42302c22f012d78f6495ea23ceaa3e23842e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8724020dd13c88a72fc391a6a2cf63abbd3dcca b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f34661b6c97a37a5efc27d31c037ddeda4547e2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e4bdcc8aef6707027168ea29caed844a7da67b4d
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#4751a48aeb2ab828b0a5cbdc585fd3642967cda1-dc4d42302c22f012d78f6495ea23ceaa3e23842e git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#6f34661b6c97a37a5efc27d31c037ddeda4547e2-d8724020dd13c88a72fc391a6a2cf63abbd3dcca git://xenbits.xen.org/osstest/seabios.git#b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee-b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee git://xenbits.xen.org/xen.git#e4bdcc8aef6707027168ea29caed844a7da67b4d-b0976d5c0441378b6348f5bfedbf431055bd0147
From git://cache:9419/git://git.qemu.org/qemu
   471387aa14..836b36af93  master     -> origin/master
   836b36af93..555249a59e  staging    -> origin/staging
Loaded 35166 nodes in revision graph
Searching for test results:
 159947 [host=pinot0]
 160002 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f34661b6c97a37a5efc27d31c037ddeda4547e2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e4bdcc8aef6707027168ea29caed844a7da67b4d
 160048 []
 160050 []
 160057 []
 160062 []
 160064 []
 160066 [host=elbling0]
 160070 [host=huxelrebe1]
 160079 [host=godello0]
 160082 [host=pinot1]
 160088 []
 160091 [host=albana1]
 160097 [host=chardonnay1]
 160104 [host=fiano1]
 160113 [host=godello0]
 160119 [host=godello0]
 160125 [host=huxelrebe1]
 160134 fail irrelevant
 160147 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160167 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca318882714080fb81fe9eb89a7b7934efc5bfae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160328 fail irrelevant
 160361 fail irrelevant
 160392 fail irrelevant
 160418 fail irrelevant
 160448 fail irrelevant
 160477 fail irrelevant
 160501 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160522 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7b9a3c9f94bcac23c534bc9f42a9e914b433b299 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160541 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ec2e6e016d24bd429792d08cf607e4c5350dcdaa b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e680cc48b7184d3489873d6776f84ba1fc238ced
 160563 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b33cf5bfcb4c941370739dfbbe1532ff508fd29d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7993b0f83fe5c3f8555e79781d5d098f99751a94 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee cead8c0d17462f3a1150b5657d3f4eaa88faf1cb
 160619 fail irrelevant
 160632 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 62bad17dcae18f55cb3bdc19909543dfdf928a2b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 90629587e16e2efdb61da77f25c25fba3c4a5fd7
 160650 fail irrelevant
 160736 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95cdd316c3d56e8f76b5044be54b9645e1dc60f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 11577d85b1a6939380bd16ed9a861653194de044 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160748 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f95cdd316c3d56e8f76b5044be54b9645e1dc60f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 11577d85b1a6939380bd16ed9a861653194de044 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160779 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4ac02962017c77bf38b462f970c884c2dc7931cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0d3dd401b70168a353450e031727affee828527 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160801 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4ac02962017c77bf38b462f970c884c2dc7931cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0d3dd401b70168a353450e031727affee828527 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160827 fail irrelevant
 160862 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f34661b6c97a37a5efc27d31c037ddeda4547e2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e4bdcc8aef6707027168ea29caed844a7da67b4d
 160866 fail irrelevant
 160868 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2a9a6c2a86570ccbf8c5c30cbb8bf723168c459 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160869 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160872 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7286d62d4e259be8cecf3dc2deea80ecc14489a5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160874 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 69259911f948ad2755bd1f2c999dd60ac322c890 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160875 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e71c36557ed41017e634ae392fa80f03ced7fa1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160876 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 81cbfd5088690c53541ffd0d74851c8ab055a829 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160879 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 160881 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 757acb9a8295e8be4a37b2cfc1cd947e357fd29c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 14b95b3b8546db201e7efd0636ae0e215fae98f3
 160851 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc4d42302c22f012d78f6495ea23ceaa3e23842e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8724020dd13c88a72fc391a6a2cf63abbd3dcca b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160882 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f3bdfc41866edf7c256e689deb9d091a950c8fca 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5b7f5586d182b0cafb1f8d558992a14763e2953e b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160886 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dc4d42302c22f012d78f6495ea23ceaa3e23842e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d8724020dd13c88a72fc391a6a2cf63abbd3dcca b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b0976d5c0441378b6348f5bfedbf431055bd0147
 160887 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ee2e67da8f882fcdef2c49fcc58e9962aa695f5a b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160889 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 571d413b5da6bc6f1c2aaca8484717642255ddb0 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160891 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8becb36063fb14df1e3ae4916215667e2cb65fa2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160893 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 24e13a4dc1eb1630eceffc7ab334145d902e763d b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160895 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160897 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160900 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160902 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160905 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160908 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160910 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160911 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
Searching for interesting versions
 Result found: flight 160002 (pass), for basis pass
 Result found: flight 160851 (fail), for basis failure
 Repro found: flight 160862 (pass), for basis pass
 Repro found: flight 160886 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
No revisions left to test, checking graph state.
 Result found: flight 160897 (pass), for last pass
 Result found: flight 160900 (fail), for first failure
 Repro found: flight 160902 (pass), for last pass
 Repro found: flight 160908 (fail), for first failure
 Repro found: flight 160910 (pass), for last pass
 Repro found: flight 160911 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Bug not present: cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160911/


  commit 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Feb 22 12:54:55 2021 +0000
  
      machine: remove 'query-cpus' QMP command
      
      The newer 'query-cpus-fast' command avoids side effects on the guest
      execution. Note that some of the field names are different in the
      'query-cpus-fast' command.
      
      Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
160911: tolerable ALL FAIL

flight 160911 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/160911/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    


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


