Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8F2793C5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 23:54:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLvf9-0003Fe-Cc; Fri, 25 Sep 2020 21:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5R+H=DC=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kLvf7-0003FK-M8
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 21:53:53 +0000
X-Inumbo-ID: 9c98ff67-73a8-443e-94f5-4d9d19eda644
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c98ff67-73a8-443e-94f5-4d9d19eda644;
 Fri, 25 Sep 2020 21:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=tdvKTimPOysTgtO4qdhL7XHEUR0hQSBPR5fRs3E1hSI=; b=074hJTbC0hj2XzqApHVcGbbuMw
 cx1ww/Z0Y9y1E5FRz2P/excGJLp4IO8CaRO7CGOD2EkSBErx5AbcF9QVQalv153+lpQuewlIADfz7
 hWPwfVQ5ZBM0rT5icDKlU2CtagsxptO2hgf7x/3fyEGdgrEW9hP8n/4Hr8RzkhDlrycc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLvez-00067S-Hu; Fri, 25 Sep 2020 21:53:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kLvez-0001yQ-9G; Fri, 25 Sep 2020 21:53:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kLvez-00039A-8m; Fri, 25 Sep 2020 21:53:45 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.12-testing bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1kLvez-00039A-8m@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Sep 2020 21:53:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-4.12-testing
xenbranch xen-4.12-testing
job test-xtf-amd64-amd64-4
testid xtf/test-hvm64-xsa-221

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b8c9776986968bd1e90835df408f8bfc60640040
  Bug not present: 253a1e64d30e09ae089a060e364a01b4d442d550
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154839/


  commit b8c9776986968bd1e90835df408f8bfc60640040
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:09:25 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.12-testing/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.12-testing/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221 --summary-out=tmp/154839.bisection-summary --basis-template=154601 --blessings=real,real-bisect xen-4.12-testing test-xtf-amd64-amd64-4 xtf/test-hvm64-xsa-221
Searching for failure / basis pass:
 154663 fail [host=chardonnay0] / 154601 [host=godello1] 154121 [host=huxelrebe1] 152525 [host=huxelrebe0] 151715 [host=elbling0] 151388 [host=godello1] 151367 [host=godello0] 151341 [host=fiano0] 151316 [host=albana0] 151292 [host=albana1] 151276 [host=huxelrebe0] 151248 [host=huxelrebe1] 151227 ok.
Failure / basis pass flights: 154663 / 151227
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630 2a8859e87761a0efc119778e094f203dc2ea487a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#8927e2777786a43cddfaa328b0f4c41a09c629c9-fb97626fe04747ec89599dce0992def9a36e2f6b git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#8023a62081ffbe3f734019076ec1a2b4213142bb-8023a62081ffbe3f734019076ec1a2b4213142bb git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#06760c2bf322cef4622b56bafee74fe93ae01630-0186e76a62f7409804c2e4785d5a11e7f82a7c52 git://xenbits.xen.org/xtf.git#2a8859e87761a0efc119778e094f203dc2ea487a-17d372b763cb0b2e2e6b5\
 a637c11f3997d2533fa
Loaded 10501 nodes in revision graph
Searching for test results:
 151161 [host=elbling0]
 151227 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630 2a8859e87761a0efc119778e094f203dc2ea487a
 151184 [host=godello1]
 151248 [host=huxelrebe1]
 151276 [host=huxelrebe0]
 151292 [host=albana1]
 151341 [host=fiano0]
 151316 [host=albana0]
 151367 [host=godello0]
 151388 [host=godello1]
 151715 [host=elbling0]
 152525 [host=huxelrebe0]
 154121 [host=huxelrebe1]
 154601 [host=godello1]
 154622 [host=godello0]
 154664 [host=godello0]
 154735 [host=godello0]
 154742 [host=godello0]
 154747 [host=godello0]
 154663 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154756 [host=godello0]
 154764 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630 2a8859e87761a0efc119778e094f203dc2ea487a
 154767 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0186e76a62f7409804c2e4785d5a11e7f82a7c52 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154773 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 de6859ec0cdbc6f524d2ac4691cb528ff83ed222 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb22ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb ba5923110c2f562170b82f955d9ace70f6a4a8e2
 154778 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f0b28415cb464832155d5b3ff6eb63612f58645 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154781 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 859e09523d66844d81f5f4a3d53f3cd96523c221 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154785 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a09df5d2e1a7126e45198200628e388564f74668 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0446e3db13671032b05d19f6117d902f5c5c76fa 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154789 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 8b8fff26f58de808deec4f51ed34069e6bf1618b 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154797 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c9776986968bd1e90835df408f8bfc60640040 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154800 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1dfd2e2f654fd93848767369a1705727d523b453 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154806 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 3e039e12ecfdefbf3ecbc5a63052620a1fe51ad5 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154811 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154819 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c9776986968bd1e90835df408f8bfc60640040 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154823 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154829 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c9776986968bd1e90835df408f8bfc60640040 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154835 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154839 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c9776986968bd1e90835df408f8bfc60640040 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Searching for interesting versions
 Result found: flight 151227 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849a8a9068) HASH(0x55849b45f800) HASH(0x55849b426af0) For basis failure, parent search stopping at c3038e718\
 a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 3e039e12ecfdefbf3ecbc5a63052620a1fe51ad5 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849a7a8e90) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce\
 0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1dfd2e2f654fd93848767369a1705727d523b453 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849b46be58) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142b\
 b 155821a1990b6de78dde5f98fa5ab90e802021e0 8b8fff26f58de808deec4f51ed34069e6bf1618b 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849b46d860) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a09df5d2e1a7126e45198200628e388564f74668 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 0446e3db13671032b05d19f6117d902f5c5c76fa 17d372b763cb0\
 b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849b469850) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 859e09523d66844d81f5f4a3d53f3cd96523c221 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849b456890) For basis failure, parent search stoppi\
 ng at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7f0b28415cb464832155d5b3ff6eb63612f58645 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 1336ca17742471fc4a59879ae2f637a59530a933 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55849b45abc8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 de6859ec0\
 cdbc6f524d2ac4691cb528ff83ed222 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb d9c812dda519a1a73e8370e1b81ddf46eb22ed16 19e0bbb4eba8d781b972448ec01ede6ca7fa22cb ba5923110c2f562170b82f955d9ace70f6a4a8e2, results HASH(0x55849b45e5d8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8927e2777786a43cddfaa328b0f4c41a09c629c9 d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f73401907\
 6ec1a2b4213142bb 2e3de6253422112ae43e608661ba94ea6b345694 06760c2bf322cef4622b56bafee74fe93ae01630 2a8859e87761a0efc119778e094f203dc2ea487a, results HASH(0x55849b445600) HASH(0x55849b430e40) Result found: flight 154663 (fail), for basis failure (at ancestor ~868)
 Repro found: flight 154764 (pass), for basis pass
 Repro found: flight 154767 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 8023a62081ffbe3f734019076ec1a2b4213142bb 155821a1990b6de78dde5f98fa5ab90e802021e0 253a1e64d30e09ae089a060e364a01b4d442d550 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
No revisions left to test, checking graph state.
 Result found: flight 154811 (pass), for last pass
 Result found: flight 154819 (fail), for first failure
 Repro found: flight 154823 (pass), for last pass
 Repro found: flight 154829 (fail), for first failure
 Repro found: flight 154835 (pass), for last pass
 Repro found: flight 154839 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b8c9776986968bd1e90835df408f8bfc60640040
  Bug not present: 253a1e64d30e09ae089a060e364a01b4d442d550
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154839/


  commit b8c9776986968bd1e90835df408f8bfc60640040
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 17:09:25 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 123 colors found
Revision graph left in /home/logs/results/bisect/xen-4.12-testing/test-xtf-amd64-amd64-4.xtf--test-hvm64-xsa-221.{dot,ps,png,html,svg}.
----------------------------------------
154839: tolerable all pass

flight 154839 xen-4.12-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154839/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-xtf-amd64-amd64-4       68 xtf/test-hvm64-xsa-221  fail baseline untested
 test-xtf-amd64-amd64-4       106 xtf/test-pv64-xsa-221  fail baseline untested


jobs:
 test-xtf-amd64-amd64-4                                       pass    


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


