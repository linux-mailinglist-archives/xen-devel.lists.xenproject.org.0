Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A927986D
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 12:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kM7XN-00083w-6D; Sat, 26 Sep 2020 10:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vXn=DD=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kM7XL-000836-MW
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 10:34:39 +0000
X-Inumbo-ID: 2ce38f3a-d869-4918-a503-72f632c002ff
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ce38f3a-d869-4918-a503-72f632c002ff;
 Sat, 26 Sep 2020 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=j9ZTcoIaMwsDzCG7Z4NjaCx9k4JaGG27+c7aj7t/eWw=; b=YskXVjZNLB/WkURpUJn2r55TuE
 W9NX6xaybcFDiq8yOoTcyvIRHoVTSqvVOgkdAhLueINGYqZ5rv06bTrgCj4mAgfCTjcSA1YJnEz77
 fwJxTk1ArP7RGZqng66yV3Yo4GCPN8dgzUsFWVXcno/Gcj4zscLP5s+wDYZVbnqRnBR4=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kM7XI-0003g1-8r; Sat, 26 Sep 2020 10:34:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kM7XH-0006QN-SB; Sat, 26 Sep 2020 10:34:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kM7XH-0003Rn-Rk; Sat, 26 Sep 2020 10:34:35 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-xtf-amd64-amd64-1
Message-Id: <E1kM7XH-0003Rn-Rk@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 26 Sep 2020 10:34:35 +0000
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

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-xtf-amd64-amd64-1
testid xtf/test-pv64-xsa-221

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
  Bug introduced:  b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
  Bug not present: f5469067ee0260673ca1e554ff8888512a55ccfc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154774/


  commit b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:13:34 2020 +0200
  
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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-xtf-amd64-amd64-1.xtf--test-pv64-xsa-221.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-xtf-amd64-amd64-1.xtf--test-pv64-xsa-221 --summary-out=tmp/154889.bisection-summary --basis-template=154350 --blessings=real,real-bisect --flight=154889 xen-4.14-testing test-xtf-amd64-amd64-1 xtf/test-pv64-xsa-221
Searching for failure / basis pass:
 154641 fail [host=chardonnay1] / 154350 [host=huxelrebe1] 154148 [host=albana0] 154116 [host=godello0] 152545 [host=elbling1] 152537 [host=chardonnay0] 152531 [host=godello0] 152153 [host=godello0] 152124 [host=fiano1] 152081 [host=albana0] 152061 [host=albana1] 152043 [host=huxelrebe1] 151922 [host=elbling1] 151899 ok.
Failure / basis pass flights: 154641 / 151899
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 ce3c4493e4e6c94495ddd8538e801a35980bff0d f645a19115e666ce6401ca63b7d7388571463b55
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#9c6f3545aee0808b78a0ad4480b6eb9d24989dc1-fb97626fe04747ec89599dce0992def9a36e2f6b git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#88ab0c15525ced2eefe39220742efe4769089ad8-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#ce3c4493e4e6c94495ddd8538e801a35980bff0d-f37a1cf023b277d0d49323bf322ce3ff0c92262d git://xenbits.xen.org/xtf.git#f645a19115e666ce6401ca63b7d7388571463b55-17d372b763cb0b2e2e6b5\
 a637c11f3997d2533fa
Loaded 10498 nodes in revision graph
Searching for test results:
 151892 [host=godello1]
 151899 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 ce3c4493e4e6c94495ddd8538e801a35980bff0d f645a19115e666ce6401ca63b7d7388571463b55
 151922 [host=elbling1]
 152061 [host=albana1]
 152043 [host=huxelrebe1]
 152081 [host=albana0]
 152124 [host=fiano1]
 152153 [host=godello0]
 152531 [host=godello0]
 152537 [host=chardonnay0]
 152545 [host=elbling1]
 154116 [host=godello0]
 154148 [host=albana0]
 154350 [host=huxelrebe1]
 154617 [host=chardonnay0]
 154642 [host=chardonnay0]
 154683 [host=chardonnay0]
 154685 [host=chardonnay0]
 154689 [host=chardonnay0]
 154692 [host=chardonnay0]
 154695 [host=chardonnay0]
 154641 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154697 [host=chardonnay0]
 154701 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 ce3c4493e4e6c94495ddd8538e801a35980bff0d f645a19115e666ce6401ca63b7d7388571463b55
 154709 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154715 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb4e93925333625cdcd97f6f174f79e7ed48afa7 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154716 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82c65f14d4f7b995d2fb57facc71a8c046880af7 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154723 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 483b43c4573329a28f1c9e18f90694e5be35ddb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154727 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 440121b54280ef1d7196bec1bc45eb5d5625c1cc 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154731 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 0bc4177e6b0d7a98464913af95d3bfe4b59b7a2c 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154737 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 2ee270e126458471b178ca1e5d7d8d0afc48be39 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154745 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f5469067ee0260673ca1e554ff8888512a55ccfc 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154748 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154757 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f5469067ee0260673ca1e554ff8888512a55ccfc 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154765 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154769 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f5469067ee0260673ca1e554ff8888512a55ccfc 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154774 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Searching for interesting versions
 Result found: flight 151899 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f5469067ee0260673ca1e554ff8888512a55ccfc 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f49015280) HASH(0x555f48ffcd88) HASH(0x555f48fdc870) For basis failure, parent search stopping at c3038e718\
 a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 0bc4177e6b0d7a98464913af95d3bfe4b59b7a2c 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f4900bd10) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 440121b54280ef1d7196bec1\
 bc45eb5d5625c1cc 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f49007d00) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 1b461403ee723dab01d5828714cca0b9396a6b3c 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c38626\
 0 155821a1990b6de78dde5f98fa5ab90e802021e0 483b43c4573329a28f1c9e18f90694e5be35ddb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f49004ad0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 82c65f14d4f7b995d2fb57facc71a8c046880af7 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf 17d372b763cb0\
 b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f48fffcb8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 bb4e93925333625cdcd97f6f174f79e7ed48afa7 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x555f48ffca88) For basis failure, parent search stoppi\
 ng at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9c6f3545aee0808b78a0ad4480b6eb9d24989dc1 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 88ab0c15525ced2eefe39220742efe4769089ad8 ce3c4493e4e6c94495ddd8538e801a35980bff0d f645a19115e666ce6401ca63b7d7388571463b55, results HASH(0x555f48fe34b0) HASH(0x555f48fc4378) Result found: flight 154641 (fail), for basis failure (at ancestor ~5143)
 Repro found: flight 154701 (pass), for basis pass
 Repro found: flight 154709 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f5469067ee0260673ca1e554ff8888512a55ccfc 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
No revisions left to test, checking graph state.
 Result found: flight 154745 (pass), for last pass
 Result found: flight 154748 (fail), for first failure
 Repro found: flight 154757 (pass), for last pass
 Repro found: flight 154765 (fail), for first failure
 Repro found: flight 154769 (pass), for last pass
 Repro found: flight 154774 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
  Bug not present: f5469067ee0260673ca1e554ff8888512a55ccfc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154774/


  commit b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:13:34 2020 +0200
  
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

pnmtopng: 111 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-xtf-amd64-amd64-1.xtf--test-pv64-xsa-221.{dot,ps,png,html,svg}.
No revision to test.

