Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E29427FD2F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1170.3870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvgO-0004sQ-C3; Thu, 01 Oct 2020 10:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170.3870; Thu, 01 Oct 2020 10:19:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvgO-0004s1-8q; Thu, 01 Oct 2020 10:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1170;
 Thu, 01 Oct 2020 10:19:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kNvgM-0004rT-NX
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:19:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f932c87-4fd8-46e6-9b83-e69c8a7eccd3;
 Thu, 01 Oct 2020 10:19:15 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNvgA-0002dm-TJ; Thu, 01 Oct 2020 10:19:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kNvgA-0003BU-MO; Thu, 01 Oct 2020 10:19:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kNvgA-0007iS-Lv; Thu, 01 Oct 2020 10:19:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GG2I=DI=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kNvgM-0004rT-NX
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:19:26 +0000
X-Inumbo-ID: 6f932c87-4fd8-46e6-9b83-e69c8a7eccd3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6f932c87-4fd8-46e6-9b83-e69c8a7eccd3;
	Thu, 01 Oct 2020 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=h33NxTNIqDNfNAgAQVod/cMTwZznxccnlROSgC5Pl+o=; b=thy0XorDmc43qvMWAkzJY65FFV
	/zJaDhjLuM81N/dYuwsIXfCOz9U7DtpfPMrxIKZ0nWTAMwev0fh4ZwIlMZoKLQDY0kf0J1OM9LHzS
	1y2SmktjF/NS2jGsa/XKKHHS44ZS6jw83TwKYvFqyIr7mUczha27lKIhTOXGYg4nUchg=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNvgA-0002dm-TJ; Thu, 01 Oct 2020 10:19:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNvgA-0003BU-MO; Thu, 01 Oct 2020 10:19:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kNvgA-0007iS-Lv; Thu, 01 Oct 2020 10:19:14 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.14-testing bisection] complete test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
Message-Id: <E1kNvgA-0007iS-Lv@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Oct 2020 10:19:14 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job test-amd64-amd64-xl-qemut-debianhvm-i386-xsm
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2ee270e126458471b178ca1e5d7d8d0afc48be39
  Bug not present: 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155217/


  commit 2ee270e126458471b178ca1e5d7d8d0afc48be39
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:14:56 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.debian-hvm-install --summary-out=tmp/155217.bisection-summary --basis-template=154350 --blessings=real,real-bisect xen-4.14-testing test-amd64-amd64-xl-qemut-debianhvm-i386-xsm debian-hvm-install
Searching for failure / basis pass:
 155087 fail [host=huxelrebe1] / 154350 [host=godello0] 154116 [host=albana1] 152545 [host=albana0] 152537 [host=elbling1] 152531 [host=chardonnay0] 152153 ok.
Failure / basis pass flights: 155087 / 152153
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9132a31b9c8381197eee75eb66c809182b264110 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 456957aaa1391e0dfa969e2dd97b87c51a79444e
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#9132a31b9c8381197eee75eb66c809182b264110-dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db99\
 34a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/osstest/seabios.git#6ada2285d9918859699c92e09540e023e0a16054-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#456957aaa1391e0dfa969e2dd97b87c51a79444e-f37a1cf023b277d0d49323bf322ce3ff0c92262d
From git://cache:9419/git://xenbits.xen.org/xen
   707eb41ae2..de16a8fa0d  staging    -> origin/staging
Loaded 12581 nodes in revision graph
Searching for test results:
 152153 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9132a31b9c8381197eee75eb66c809182b264110 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 456957aaa1391e0dfa969e2dd97b87c51a79444e
 152531 [host=chardonnay0]
 152537 [host=elbling1]
 152545 [host=albana0]
 154116 [host=albana1]
 154148 [host=godello0]
 154350 [host=godello0]
 154617 [host=huxelrebe0]
 154641 [host=huxelrebe0]
 155016 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155091 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9132a31b9c8381197eee75eb66c809182b264110 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a16054 456957aaa1391e0dfa969e2dd97b87c51a79444e
 155147 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155150 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0020157a9825e5f5784ff014044f11c0558c92fe 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155153 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 63d92674d240ab4ecab94f98e1e198842bb7de00 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf
 155159 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c065855284bd0ca65784d313e094054e23685bb 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39
 155164 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39
 155087 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 dd5c7e3c5282b084daa5bbf0ec229cec699b2c17 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 f37a1cf023b277d0d49323bf322ce3ff0c92262d
 155168 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070
 155177 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 03019c20b516be53ba0cd393f5291974a9a6c9a8
 155185 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155190 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155199 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155204 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155207 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 2ee270e126458471b178ca1e5d7d8d0afc48be39
 155212 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
 155217 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 2ee270e126458471b178ca1e5d7d8d0afc48be39
Searching for interesting versions
 Result found: flight 152153 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 9b9fc8e391b6d5afa83f90271fdbd0e13871e841, results HASH(0x55bfb24b7df8) HASH(0x55bfb24a60c0) HASH(0x55bfb247aab0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 b8c2efbe7b3e8fa5f0b0a3679afccd1204949070, results HASH(0x55bfb24aacf8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c\
 3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39, results HASH(0x55bfb2492fa8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 5c065855284bd0ca65784d313e094054e23685bb 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 28855ebcdbfa437e60bc16c761405476fe16bc39, results HASH(0x55bfb247cdb8) For basis\
  failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 63d92674d240ab4ecab94f98e1e198842bb7de00 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x55bfb2496cb8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0020157a9825e5f5784f\
 f014044f11c0558c92fe 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 c3a0fc22af90ef28e68b116c6a49d9cec57f71cf, results HASH(0x55bfb24770a0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 9132a31b9c8381197eee75eb66c809182b264110 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 6ada2285d9918859699c92e09540e023e0a\
 16054 456957aaa1391e0dfa969e2dd97b87c51a79444e, results HASH(0x55bfb2483d20) HASH(0x55bfb2474470) Result found: flight 155016 (fail), for basis failure (at ancestor ~394)
 Repro found: flight 155091 (pass), for basis pass
 Repro found: flight 155147 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b 3c659044118e34603161457db9934a34f816d78b ea6d3cd1ed79d824e605a70c3626bc437c386260 155821a1990b6de78dde5f98fa5ab90e802021e0 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
No revisions left to test, checking graph state.
 Result found: flight 155190 (pass), for last pass
 Result found: flight 155199 (fail), for first failure
 Repro found: flight 155204 (pass), for last pass
 Repro found: flight 155207 (fail), for first failure
 Repro found: flight 155212 (pass), for last pass
 Repro found: flight 155217 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  2ee270e126458471b178ca1e5d7d8d0afc48be39
  Bug not present: 9b9fc8e391b6d5afa83f90271fdbd0e13871e841
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/155217/


  commit 2ee270e126458471b178ca1e5d7d8d0afc48be39
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:14:56 2020 +0200
  
      evtchn: convert per-channel lock to be IRQ-safe
      
      ... in order for send_guest_{global,vcpu}_virq() to be able to make use
      of it.
      
      This is part of XSA-343.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Acked-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 145 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
155217: tolerable ALL FAIL

flight 155217 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/155217/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    


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


