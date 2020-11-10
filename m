Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1B2ADA98
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 16:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23496.50282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcViR-0006nf-4M; Tue, 10 Nov 2020 15:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23496.50282; Tue, 10 Nov 2020 15:37:51 +0000
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
	id 1kcViR-0006nG-0X; Tue, 10 Nov 2020 15:37:51 +0000
Received: by outflank-mailman (input) for mailman id 23496;
 Tue, 10 Nov 2020 15:37:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kcViP-0006nB-Gr
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 15:37:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0baa1a42-7dd6-47e9-a025-6f74b6476aff;
 Tue, 10 Nov 2020 15:37:45 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcViK-0003Hg-Nd; Tue, 10 Nov 2020 15:37:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kcViK-0008Hm-GB; Tue, 10 Nov 2020 15:37:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kcViK-0007fp-Fj; Tue, 10 Nov 2020 15:37:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pxmX=EQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kcViP-0006nB-Gr
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 15:37:49 +0000
X-Inumbo-ID: 0baa1a42-7dd6-47e9-a025-6f74b6476aff
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0baa1a42-7dd6-47e9-a025-6f74b6476aff;
	Tue, 10 Nov 2020 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=Hf86lN04BWqqhdsd+NxrfgVpMXAq54xsQCzaR07XM1s=; b=gz8rzfIx1SRlV5mkF+zub8c8DM
	xwSOp1hVrYzI4FCtQ61IyXWr/a7QeyOIUdVN0FQ/6VJetABjwrmntcUBinNz3DqFI0sXyiAVKialM
	jaAJ20ZTWmfk379AMSeYzIasiBFX/VRSt9OArWiYoUPXQFXfj7cZhLXA/zXaCLinCIVw=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcViK-0003Hg-Nd; Tue, 10 Nov 2020 15:37:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcViK-0008Hm-GB; Tue, 10 Nov 2020 15:37:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kcViK-0007fp-Fj; Tue, 10 Nov 2020 15:37:44 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-libvirt-xsm
Message-Id: <E1kcViK-0007fp-Fj@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 10 Nov 2020 15:37:44 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-libvirt-xsm
testid guest-start

Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156624/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-libvirt-xsm.guest-start.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-xsm.guest-start --summary-out=tmp/156624.bisection-summary --basis-template=156443 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-libvirt-xsm guest-start
Searching for failure / basis pass:
 156588 fail [host=chardonnay0] / 156443 [host=elbling0] 156401 [host=fiano0] 156389 [host=albana0] 156373 [host=godello0] 156354 [host=godello1] 156339 [host=godello1] 156331 [host=huxelrebe0] 156315 [host=albana1] 156291 [host=pinot0] 156268 [host=elbling1] 156254 [host=godello0] 156248 [host=pinot1] 156228 [host=huxelrebe1] 156196 [host=fiano1] 156167 [host=godello1] 156136 [host=chardonnay1] 156119 [host=albana1] 156112 [host=godello0] 156093 ok.
Failure / basis pass flights: 156588 / 156093
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: libvirt git://xenbits.xen.org/libvirt.git
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Basis pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 3b49791e4cc2f38dd84bf331b75217adaef636e3
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/libvirt.git#2c846fa6bcc11929c9fb857a22430fb9945654ad-2c846fa6bcc11929c9fb857a22430fb9945654ad https://gitlab.com/keycodemap/keycodemapdb.git#27acf0ef828bf719b2053ba398b195829413dbdd-27acf0ef828bf719b2053ba398b195829413dbdd git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0\
 dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc437c386260-7ea428895af2840d85c524f0bd11a38aac308308 git://xenbits.xen.org/xen.git#3b49791e4cc2f38dd84bf331b75217adaef636e3-0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
Loaded 41874 nodes in revision graph
Searching for test results:
 156050 [host=elbling0]
 156085 []
 156093 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 3b49791e4cc2f38dd84bf331b75217adaef636e3
 156112 [host=godello0]
 156119 [host=albana1]
 156136 [host=chardonnay1]
 156167 [host=godello1]
 156196 [host=fiano1]
 156228 [host=huxelrebe1]
 156248 [host=pinot1]
 156254 [host=godello0]
 156268 [host=elbling1]
 156291 [host=pinot0]
 156315 [host=albana1]
 156331 [host=huxelrebe0]
 156339 [host=godello1]
 156354 [host=godello1]
 156373 [host=godello0]
 156389 [host=albana0]
 156401 [host=fiano0]
 156443 [host=elbling0]
 156524 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 2a5f9f6a6932214fda76b9b3c03e024772882d34
 156538 fail irrelevant
 156556 fail irrelevant
 156577 fail irrelevant
 156623 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156604 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 3b49791e4cc2f38dd84bf331b75217adaef636e3
 156588 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156605 fail irrelevant
 156607 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7ea428895af2840d85c524f0bd11a38aac308308 0a5e0ce0fb7e5a3b5dfdc936058d2c0e04e5e258
 156609 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1fd1d4bafdf6f9f8fe5ca9b947f016a7aae92a74
 156610 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd ca56b06043bb4241eeb0a41a60daffb1408a08d5
 156612 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 5816d327e44ab37ae08730f4c54a80835998f31f
 156613 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e006b2e3be72e502b86bd9e1405417abd87bdfed
 156614 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156618 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156619 pass 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
 156621 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
 156624 fail 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e19bcb626f50a652fb1854a8b2f2c9c371687a11
Searching for interesting versions
 Result found: flight 156093 (pass), for basis pass
 For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c, results HASH(0x5637915ab618) HASH(0x5637915b1ac8) HASH(0x5637915af300) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef8\
 28bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd e006b2e3be72e502b86bd9e1405417abd87bdfed, results HASH(0x56378e467658) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98\
 c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd 5816d327e44ab37ae08730f4c54a80835998f31f, results HASH(0x5637915ab6d8) For basis failure, parent search stopping at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd ca56b06043bb4241eeb0a41a60daffb1408a08d5, results HASH(0x56378e45d118) Result fo\
 und: flight 156524 (fail), for basis failure (at ancestor ~33)
 Repro found: flight 156604 (pass), for basis pass
 Repro found: flight 156607 (fail), for basis failure
 0 revisions at 2c846fa6bcc11929c9fb857a22430fb9945654ad 27acf0ef828bf719b2053ba398b195829413dbdd c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 677cbe1324c29294bb1d1b8454b3f214725e40fd c3453a23f7905d24f2404787543e26ec7d02301c
No revisions left to test, checking graph state.
 Result found: flight 156614 (pass), for last pass
 Result found: flight 156618 (fail), for first failure
 Repro found: flight 156619 (pass), for last pass
 Repro found: flight 156621 (fail), for first failure
 Repro found: flight 156623 (pass), for last pass
 Repro found: flight 156624 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Bug not present: c3453a23f7905d24f2404787543e26ec7d02301c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/156624/


  commit e19bcb626f50a652fb1854a8b2f2c9c371687a11
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Nov 6 10:48:07 2020 +0100
  
      xen/rwlock: add check_lock() handling to rwlocks
      
      Checking whether a lock is consistently used regarding interrupts on
      or off is beneficial for rwlocks, too.
      
      So add check_lock() calls to rwlock functions. For this purpose make
      check_lock() globally accessible.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Julien Grall <jgrall@amazon.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-libvirt-xsm.guest-start.{dot,ps,png,html,svg}.
----------------------------------------
156624: tolerable FAIL

flight 156624 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/156624/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 14 guest-start             fail baseline untested


jobs:
 build-amd64-libvirt                                          pass    
 test-amd64-amd64-libvirt-xsm                                 fail    


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


