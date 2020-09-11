Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B188F265E41
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:38:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGgRN-00036p-HZ; Fri, 11 Sep 2020 10:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+4E=CU=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kGgRL-00036h-Uo
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:37:59 +0000
X-Inumbo-ID: d24ad5d8-269d-4136-b9c1-cb94e056bf81
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24ad5d8-269d-4136-b9c1-cb94e056bf81;
 Fri, 11 Sep 2020 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=z69Vq9/YXhbAsBmATRTrOusHH6rtoLMgbtqlCU8lRh0=; b=3r3rWlbXEvPz16RHgRsdP695/p
 jLanGNuU+9+IbEaBMLa8SLpRhRNz/f5bpdUiuSzt3NrxagqtOlVBGfrjDoq2LBODcYWwtAwHTfq4m
 6IBCCKlvJZ/oMp6u7f7MG/DRI19TPvMZoi+YYGm44OrSANe5d7wLDWWUSggbd/Kl+6KI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kGgRI-0005qj-96; Fri, 11 Sep 2020 10:37:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kGgRI-0002cS-2D; Fri, 11 Sep 2020 10:37:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kGgRI-00084d-1j; Fri, 11 Sep 2020 10:37:56 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-pygrub
Message-Id: <E1kGgRI-00084d-1j@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 11 Sep 2020 10:37:56 +0000
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

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-pygrub
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f55893171feb64f712d2892a288e3f3dc70f39d8
  Bug not present: 735749c8316d2f8b074e38138989336cfdec65f2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154109/


  commit f55893171feb64f712d2892a288e3f3dc70f39d8
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:28 2020 +0200
  
      tools/libxc: rename all libxenguest sources to xg_*
      
      Some sources of libxenguest are named xg_*.c and some xc_*.c. Rename
      the xc_*.c files to xg_*.c.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-pygrub.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-pygrub.debian-di-install --summary-out=tmp/154109.bisection-summary --basis-template=154016 --blessings=real,real-bisect xen-unstable test-amd64-amd64-pygrub debian-di-install
Searching for failure / basis pass:
 154058 fail [host=chardonnay1] / 154016 [host=godello1] 153983 [host=rimava1] 153957 [host=rimava1] 153931 [host=fiano1] 153906 [host=chardonnay0] 153882 [host=pinot0] 153845 [host=godello0] 153813 [host=elbling1] 153788 [host=elbling0] 153770 [host=godello1] 153758 [host=albana1] 153653 [host=huxelrebe0] 153619 [host=fiano0] 153602 [host=godello0] 153591 [host=albana0] 153551 ok.
Failure / basis pass flights: 154058 / 153551
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#afe018e041ec112d90a8b4e6ed607d22aa06f280-89002866bb6c6f26024f015820c8f52012f95cf2
Loaded 5001 nodes in revision graph
Searching for test results:
 153400 [host=godello0]
 153437 [host=elbling0]
 153468 [host=godello1]
 153494 [host=chardonnay0]
 153526 [host=huxelrebe1]
 153551 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 153591 [host=albana0]
 153602 [host=godello0]
 153619 [host=fiano0]
 153653 [host=huxelrebe0]
 153758 [host=albana1]
 153770 [host=godello1]
 153788 [host=elbling0]
 153813 [host=elbling1]
 153845 [host=godello0]
 153882 [host=pinot0]
 153906 [host=chardonnay0]
 153931 [host=fiano1]
 153957 [host=rimava1]
 153983 [host=rimava1]
 154016 [host=godello1]
 154036 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154079 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280
 154082 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154084 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e
 154086 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 dd33fd2e81a0e83707cc203b974e501fa336590f
 154058 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 89002866bb6c6f26024f015820c8f52012f95cf2
 154088 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154091 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 790f2dfb598acb5f3f3f75b47c5e3ab642c16478
 154095 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 6797d1ed45a4089a22f7278bb45cddb6fd861d72
 154098 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154100 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154103 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154105 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
 154108 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
 154109 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 f55893171feb64f712d2892a288e3f3dc70f39d8
Searching for interesting versions
 Result found: flight 153551 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2, results HASH(0x562730c56d18) HASH(0x562730c66068) HASH(0x562730c5ea38) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1e\
 d79d824e605a70c3626bc437c386260 6797d1ed45a4089a22f7278bb45cddb6fd861d72, results HASH(0x562730c62bf0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 790f2dfb598acb5f3f3f75b47c5e3ab642c16478, results HASH(0x562730cf5ce8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 0c293ad3a2842452bff0fe0515cc9046a60afa5e, results HASH(0x562730c6fbd8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 afe018e041ec112d90a8b4e6ed607d22aa06f280, results HASH(0x562730c5f360) HASH(0x562730c6c3a8) Result found: flight 154036 (fail), \
 for basis failure (at ancestor ~294)
 Repro found: flight 154079 (pass), for basis pass
 Repro found: flight 154082 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 735749c8316d2f8b074e38138989336cfdec65f2
No revisions left to test, checking graph state.
 Result found: flight 154098 (pass), for last pass
 Result found: flight 154100 (fail), for first failure
 Repro found: flight 154103 (pass), for last pass
 Repro found: flight 154105 (fail), for first failure
 Repro found: flight 154108 (pass), for last pass
 Repro found: flight 154109 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  f55893171feb64f712d2892a288e3f3dc70f39d8
  Bug not present: 735749c8316d2f8b074e38138989336cfdec65f2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154109/


  commit f55893171feb64f712d2892a288e3f3dc70f39d8
  Author: Juergen Gross <jgross@suse.com>
  Date:   Fri Aug 28 17:07:28 2020 +0200
  
      tools/libxc: rename all libxenguest sources to xg_*
      
      Some sources of libxenguest are named xg_*.c and some xc_*.c. Rename
      the xc_*.c files to xg_*.c.
      
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Acked-by: Wei Liu <wl@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-pygrub.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
154109: tolerable ALL FAIL

flight 154109 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/154109/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-pygrub      10 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-pygrub                                      fail    


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


