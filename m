Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2734A614
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:05:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101694.194623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkH2-0004UW-UM; Fri, 26 Mar 2021 11:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101694.194623; Fri, 26 Mar 2021 11:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkH2-0004U4-Q3; Fri, 26 Mar 2021 11:05:04 +0000
Received: by outflank-mailman (input) for mailman id 101694;
 Fri, 26 Mar 2021 11:05:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPkH1-0004Tw-9s; Fri, 26 Mar 2021 11:05:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPkH1-00056a-0e; Fri, 26 Mar 2021 11:05:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPkH0-0001Av-PT; Fri, 26 Mar 2021 11:05:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lPkH0-0001V8-Ox; Fri, 26 Mar 2021 11:05:02 +0000
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
	bh=FlFTZpbGnFmDEZcKyCr03Dknamfq4SVmejMBVFYqcJQ=; b=x29Hs9EFU8SVL/Fc7nIqu/B/A3
	7w1lsAszgmh4WUKI710vimWkMl2URVWR/fdipU2q6l0sX0+aSqWrfMCXS/31KK+5S07lIaBL4tHi4
	XE8w9yaY5A4tU3z91xOwJJP3chvT9KnaO62bbpYfvI0Db14LuNNFwpwUy+rA0B+QsL2c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-freebsd12-amd64
Message-Id: <E1lPkH0-0001V8-Ox@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 26 Mar 2021 11:05:02 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-freebsd12-amd64
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160441/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd12-amd64.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd12-amd64.guest-saverestore --summary-out=tmp/160441.bisection-summary --basis-template=152631 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-qemuu-freebsd12-amd64 guest-saverestore
Searching for failure / basis pass:
 160392 fail [host=elbling0] / 160125 [host=elbling1] 160119 [host=godello0] 160113 [host=albana1] 160104 [host=godello1] 160097 [host=chardonnay0] 160091 [host=huxelrebe1] 160088 [host=pinot1] 160082 [host=fiano0] 160079 [host=chardonnay1] 160070 [host=fiano1] 160066 [host=pinot0] 160002 [host=albana1] 159947 [host=chardonnay1] 159926 [host=chardonnay0] 159911 [host=fiano1] 159898 [host=huxelrebe1] 159888 [host=godello0] 159878 [host=fiano0] 159869 [host=fiano1] 159860 [host=godello1] 159853 [h\
 ost=elbling1] 159848 [host=godello0] 159842 [host=fiano1] 159834 [host=albana0] 159828 ok.
Failure / basis pass flights: 160392 / 159828
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 01874b15d36e3f9a3506c47941a92ccf8d8bed98 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef91b07388e1c0a50c604e5350eeda98428ccea6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cb90ecf9349198558569f6c86c4c27d215406095 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 243036df0d55673de59c214e240b9b914d278b65
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#ef91b07388e1c0a50c604e5350eeda98428ccea6-0ecdcb6142037dd1cdd08660a2349960bcf0270a git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#cb90ecf9349198558569f6c86c4c27d215406095-01874b15d36e3f9a3506c47941a92ccf8d8bed98 git://xenbits.xen.org/osstest/seabios.git#ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e-b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee git://xenbits.xen.org/xen.git#243036df0d55673de59c214e240b9b914d278b65-ecdff2f5a03210119b71806c3f5571d6906dd85e
From git://cache:9419/git://git.qemu.org/qemu
   9e2e9fe3df..63ad23fa24  master     -> origin/master
Loaded 30545 nodes in revision graph
Searching for test results:
 159828 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef91b07388e1c0a50c604e5350eeda98428ccea6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cb90ecf9349198558569f6c86c4c27d215406095 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 243036df0d55673de59c214e240b9b914d278b65
 159834 [host=albana0]
 159842 [host=fiano1]
 159848 [host=godello0]
 159853 [host=elbling1]
 159860 [host=godello1]
 159869 [host=fiano1]
 159878 [host=fiano0]
 159888 [host=godello0]
 159898 [host=huxelrebe1]
 159911 [host=fiano1]
 159926 [host=chardonnay0]
 159947 [host=chardonnay1]
 160002 [host=albana1]
 160048 []
 160050 []
 160057 []
 160062 []
 160064 []
 160066 [host=pinot0]
 160070 [host=fiano1]
 160079 [host=chardonnay1]
 160082 [host=fiano0]
 160088 [host=pinot1]
 160091 [host=huxelrebe1]
 160097 [host=chardonnay0]
 160104 [host=godello1]
 160113 [host=albana1]
 160119 [host=godello0]
 160125 [host=elbling1]
 160134 fail irrelevant
 160147 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2e1293cbaac75e84f541f9acfa8e26749f4c3562 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160167 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ca318882714080fb81fe9eb89a7b7934efc5bfae 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160328 fail irrelevant
 160378 blocked c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef91b07388e1c0a50c604e5350eeda98428ccea6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cb90ecf9349198558569f6c86c4c27d215406095 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 243036df0d55673de59c214e240b9b914d278b65
 160380 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef91b07388e1c0a50c604e5350eeda98428ccea6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cb90ecf9349198558569f6c86c4c27d215406095 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 243036df0d55673de59c214e240b9b914d278b65
 160382 fail irrelevant
 160384 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f2a9a6c2a86570ccbf8c5c30cbb8bf723168c459 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160386 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 eb07bfb09ef5483ad58ed0eba713f32fb0c909f9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8a40754bca14df63c6d2ffe473b68a270dc50679 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160388 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7286d62d4e259be8cecf3dc2deea80ecc14489a5 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160389 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 69259911f948ad2755bd1f2c999dd60ac322c890 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160390 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e71c36557ed41017e634ae392fa80f03ced7fa1 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee dae3c3e8b257cd27d6b35a467a34bf79a6650340
 160361 fail irrelevant
 160391 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2255564fd21059960966b47212def9069cb56077 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160393 fail irrelevant
 160396 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2e51b27fed31eb7b2a2cb4245806c8c7859207f7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0693602a23276b076a679b1e7ed9125a444336b6 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160401 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8b858f9998a9d59a9a7188f2c5c6ffb99eff6115 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160402 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 30ca7eddc486646fa19c9619fcf233ceaa65e28c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160403 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2615a5e433aeb812c300d3a48e1a88e1303e2339 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 160405 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 51204c2f188ec1e2a38f14718d38a3772f850a4b b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 160407 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 773b0bc2838ede154c6de9d78401b91fafa91062 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5e8892db93f3fb6a7221f2d47f3c952a7e489737 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160408 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8e6bc6cdc82d45f203bc9fc4342c0452214c74fe b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 14b95b3b8546db201e7efd0636ae0e215fae98f3
 160409 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 757acb9a8295e8be4a37b2cfc1cd947e357fd29c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 14b95b3b8546db201e7efd0636ae0e215fae98f3
 160411 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9abda42bf2f5aa6ef403d3140fd3d7d88e8064e9 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 893103e286ac1c500d2ad113f55c41edb35e047c
 160412 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6f34661b6c97a37a5efc27d31c037ddeda4547e2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 0570d7f276dd20a3adee80ca44a5fe7daf7566cd
 160413 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a557b00469bca61a058fc1db4855503cac1c3219 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 4e01c48886d9fbfee3bf7e481c4529a176331c78
 160415 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1941858448e76f83eb00614c4f34ac29e9a8e792 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 0570d7f276dd20a3adee80ca44a5fe7daf7566cd
 160416 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 edd46cd407ea4a0adaa8d6ca86f550c2a4d5c507 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 65a9d3807e9a0ffd9f9719416a07be41b6f39e94 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee e4bdcc8aef6707027168ea29caed844a7da67b4d
 160392 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 01874b15d36e3f9a3506c47941a92ccf8d8bed98 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
 160417 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 94fa95c8746c553324e8b69ea4a74af670075324 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e4341623a3b87e7eca87d42b7b88da967cd21c49 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 60c0444fae2148452f9ed0b7c49af1fa41f8f522
 160420 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 ef91b07388e1c0a50c604e5350eeda98428ccea6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cb90ecf9349198558569f6c86c4c27d215406095 ef88eeaf052c8a7d28c5f85e790c5e45bcffa45e 243036df0d55673de59c214e240b9b914d278b65
 160421 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0ecdcb6142037dd1cdd08660a2349960bcf0270a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 01874b15d36e3f9a3506c47941a92ccf8d8bed98 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee ecdff2f5a03210119b71806c3f5571d6906dd85e
 160424 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4751a48aeb2ab828b0a5cbdc585fd3642967cda1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d1929069e355afb809a50a7f6b6affdea399cc8c b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 368096b9c4a273be58dd897e996e3e010bcfc21b
 160426 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b6d5996706ddb6082e3ea8de79849bfecf2aaa15 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee b4011741e6b39a8fd0ed5aded96c16c45ead5888
 160427 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160428 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 030ba3097a6e7d08b99f8a9d19a322f61409c1f6 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ee2e67da8f882fcdef2c49fcc58e9962aa695f5a b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160429 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f9c53a69edeb94ae8c65276b885c1a7efe4f613a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 571d413b5da6bc6f1c2aaca8484717642255ddb0 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160431 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 283d845c9164f57f5dba020a4783bb290493802f b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160433 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8becb36063fb14df1e3ae4916215667e2cb65fa2 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160435 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160437 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160438 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160439 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160440 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
 160441 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8af54b9172ff3b9bbdbb3191ed84994d275a0d81 b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
Searching for interesting versions
 Result found: flight 159828 (pass), for basis pass
 Result found: flight 160392 (fail), for basis failure
 Repro found: flight 160420 (pass), for basis pass
 Repro found: flight 160421 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9fd7e88c23f6fb056d25fbc3f8e2e7c1a53859d1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cbde7be900d2a2279cbc4becb91d1ddd6a014def b0d61ecef66eb05bd7a4eb7ada88ec5dab06dfee 21657ad4f01a634beac570c64c0691e51b9cf366
No revisions left to test, checking graph state.
 Result found: flight 160435 (pass), for last pass
 Result found: flight 160437 (fail), for first failure
 Repro found: flight 160438 (pass), for last pass
 Repro found: flight 160439 (fail), for first failure
 Repro found: flight 160440 (pass), for last pass
 Repro found: flight 160441 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  8af54b9172ff3b9bbdbb3191ed84994d275a0d81
  Bug not present: cbde7be900d2a2279cbc4becb91d1ddd6a014def
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160441/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd12-amd64.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
160441: tolerable ALL FAIL

flight 160441 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/160441/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-freebsd12-amd64 16 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-qemuu-freebsd12-amd64                       fail    


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


