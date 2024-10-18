Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F69A3B77
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 12:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821736.1235674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1kCQ-000879-QL; Fri, 18 Oct 2024 10:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821736.1235674; Fri, 18 Oct 2024 10:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1kCQ-00084w-MO; Fri, 18 Oct 2024 10:27:14 +0000
Received: by outflank-mailman (input) for mailman id 821736;
 Fri, 18 Oct 2024 10:27:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1kCO-00082M-MR; Fri, 18 Oct 2024 10:27:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1kCO-0001iA-HB; Fri, 18 Oct 2024 10:27:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1kCO-0002k4-8Y; Fri, 18 Oct 2024 10:27:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1kCO-0007bb-5V; Fri, 18 Oct 2024 10:27:12 +0000
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
	bh=31Oj4avklJI4Gi56X8Nw6n51i7dcwpRiTjrhBapbkp4=; b=yePsXStdV9y7sl0SMRUYZEEjbg
	mo1yWEqTHZRji9dmZS+9N943ZghkL/AVLzhPEO6TeTTgPM7SkpTby9rfQm3lxV6RASSLnFwaRhh7d
	vQCVdWYzAFk7TCIb+wHl3sVdrbRmKORPXZg1hUA0QfNq95UvUdu1kLMfcMcmKRQF22DA=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete test-amd64-amd64-xl-qemuu-ovmf-amd64
Message-Id: <E1t1kCO-0007bb-5V@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Oct 2024 10:27:12 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-ovmf-amd64
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d64d1e195ceb003c824786bfd817227c7ae81f06
  Bug not present: b3f36e151d8b014cac5c6a833e2270c14d998739
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188238/


  commit d64d1e195ceb003c824786bfd817227c7ae81f06
  Author: Kun Qin <kuqin@microsoft.com>
  Date:   Thu Sep 19 14:11:37 2024 -0700
  
      MdeModulePkg: PeiMain: Introduce implementation of delayed dispatch
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
      
      This change adds the implementation that fits the needs and description
      of PI spec defined Delayed Dispatch PPI in Pei Core.
      
      The PPI would allow minimal delay for registered callbacks. As well as
      allowing other functions to wait for GUIDed delayed dispatch callbacks.
      
      Cc: Jian J Wang <jian.j.wang@intel.com>
      Cc: Dandan Bi <dandan.bi@intel.com>
      Cc: Liming Gao <gaoliming@byosoft.com.cn>
      Cc: Debkumar De <debkumar.de@intel.com>
      Cc: Catharine West <catharine.west@intel.com>
      
      Co-authored-by: Mike Turner <mikeyt@pobox.com>
      Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
      Signed-off-by: Kun Qin <kuqin12@gmail.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install --summary-out=tmp/188238.bisection-summary --basis-template=188152 --blessings=real,real-bisect,real-retry ovmf test-amd64-amd64-xl-qemuu-ovmf-amd64 debian-hvm-install
Searching for failure / basis pass:
 188219 fail [host=godello1] / 188152 [host=huxelrebe1] 188131 [host=godello0] 188125 [host=fiano0] 188114 [host=septiner0] 188107 [host=debina1] 188102 [host=debina0] 188099 [host=fiano1] 188091 [host=albana1] 188083 [host=albana1] 188065 [host=pinot0] 188049 [host=italia1] 188039 [host=albana0] 188037 [host=huxelrebe0] 188031 [host=nobling0] 188023 [host=italia0] 188020 [host=sabro1] 188006 [host=septiner1] 188004 [host=pinot1] 187996 [host=rimava1] 187977 [host=nobling1] 187974 [host=rimava0]\
  187973 [host=godello0] 187972 [host=nobling0] 187969 [host=sabro0] 187963 ok.
Failure / basis pass flights: 188219 / 187963
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e197a8ba5e349e511850fc52457992de88c8795 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
Basis pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 41190d2ceb03b12ffc17a66c04de519c26a6052a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#aa4cd140bba57b7064b4c7a7141bebd336d32087-54d90d17e8cee20b163d395829162cec92b583f4 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 https://github.com/tianocore/edk2.git#91d806917fd2be763f067a58ef05fadcf43efab1-6e197a8ba5e349e511850fc52457992de88c8795 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c743\
 7ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#0df9387c8983e1b1e72d8c574356f572342c03e6-3fdb3cd3a27a22a050c7d27126a24807a7a45745 git://xenbits.xen.org/osstest/seabios.git#2424e4c04aa30d90e85073ea41d18a7845460783-2424e4c04aa30d90e85073ea41d18a7845460783 git://xenbits.xen.org/xen.git#41190d2ceb03b12ffc17a66c04de519c26a6052a-47990ecef286606794d607d4ca8703d71c98d659
adhoc-revtuple-generator: tree discontiguous: qemu-xen
From git://cache:9419/git://xenbits.xen.org/xen
   a285d2ac2e..6e085825cb  staging    -> origin/staging
Loaded 15002 nodes in revision graph
Searching for test results:
 188232 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3f36e151d8b014cac5c6a833e2270c14d998739 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188238 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d64d1e195ceb003c824786bfd817227c7ae81f06 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 187963 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 41190d2ceb03b12ffc17a66c04de519c26a6052a
 187969 [host=sabro0]
 187972 [host=nobling0]
 187973 [host=godello0]
 187974 [host=rimava0]
 187977 [host=nobling1]
 187996 [host=rimava1]
 188004 [host=pinot1]
 188006 [host=septiner1]
 188020 [host=sabro1]
 188023 [host=italia0]
 188031 [host=nobling0]
 188037 [host=huxelrebe0]
 188039 [host=albana0]
 188049 [host=italia1]
 188065 [host=pinot0]
 188083 [host=albana1]
 188091 [host=albana1]
 188099 [host=fiano1]
 188102 [host=debina0]
 188107 [host=debina1]
 188114 [host=septiner0]
 188125 [host=fiano0]
 188131 [host=godello0]
 188152 [host=huxelrebe1]
 188227 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d64d1e195ceb003c824786bfd817227c7ae81f06 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188219 fail 54d90d17e8cee20b163d395829162cec92b583f4 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6e197a8ba5e349e511850fc52457992de88c8795 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188156 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 79598f34fa024ad2491b46b95c3189c5a7f159d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188162 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a7845460783 41190d2ceb03b12ffc17a66c04de519c26a6052a
 188161 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 79598f34fa024ad2491b46b95c3189c5a7f159d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188167 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 79598f34fa024ad2491b46b95c3189c5a7f159d2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188184 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7bac0a940e905941487c3a2f2f5fb6ee43ff040a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 e305256e69b1c943db3ca20173da6ded3db2d252
 188188 fail irrelevant
 188189 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188196 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 3f6ee3db2e878398cfcde725399b4d1b04e92269
 188200 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a232e0cd2fe2bb882a5dd0cafe322a2899a44d51 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188205 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b7342074a649599078553e33acd6d7a79e950683 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188197 fail irrelevant
 188211 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3f36e151d8b014cac5c6a833e2270c14d998739 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188217 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d64d1e195ceb003c824786bfd817227c7ae81f06 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188222 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3f36e151d8b014cac5c6a833e2270c14d998739 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
Searching for interesting versions
 Result found: flight 187963 (pass), for basis pass
 For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3f36e151d8b014cac5c6a833e2270c14d998739 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659, results HASH(0x55b44bd18258) HASH(0x55b44ad7a178) HASH(0x55b44ad82a48) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 b7342074a649599078553e33acd6d7a79e950683 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659, results HASH(0x55b44bd71e70) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a232e0cd2fe2bb882a5dd0cafe322a2899a44d51 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d271\
 26a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659, results HASH(0x55b44bd72470) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 3f6ee3db2e878398cfcde725399b4d1b04e92269, results HASH(0x55b44bd42ac0) For basis\
  failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa, results HASH(0x55b44bd0b2d8) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7bac0a940e905941487c\
 3a2f2f5fb6ee43ff040a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 e305256e69b1c943db3ca20173da6ded3db2d252, results HASH(0x55b44ad7a868) For basis failure, parent search stopping at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 0df9387c8983e1b1e72d8c574356f572342c03e6 2424e4c04aa30d90e85073ea41d18a78454\
 60783 41190d2ceb03b12ffc17a66c04de519c26a6052a, results HASH(0x55b44bd3bca0) HASH(0x55b44bd02c90) Result found: flight 188156 (fail), for basis failure (at ancestor ~9749)
 Repro found: flight 188162 (pass), for basis pass
 Repro found: flight 188219 (fail), for basis failure
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 b3f36e151d8b014cac5c6a833e2270c14d998739 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3fdb3cd3a27a22a050c7d27126a24807a7a45745 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
No revisions left to test, checking graph state.
 Result found: flight 188211 (pass), for last pass
 Result found: flight 188217 (fail), for first failure
 Repro found: flight 188222 (pass), for last pass
 Repro found: flight 188227 (fail), for first failure
 Repro found: flight 188232 (pass), for last pass
 Repro found: flight 188238 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d64d1e195ceb003c824786bfd817227c7ae81f06
  Bug not present: b3f36e151d8b014cac5c6a833e2270c14d998739
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188238/


  commit d64d1e195ceb003c824786bfd817227c7ae81f06
  Author: Kun Qin <kuqin@microsoft.com>
  Date:   Thu Sep 19 14:11:37 2024 -0700
  
      MdeModulePkg: PeiMain: Introduce implementation of delayed dispatch
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=4496
      
      This change adds the implementation that fits the needs and description
      of PI spec defined Delayed Dispatch PPI in Pei Core.
      
      The PPI would allow minimal delay for registered callbacks. As well as
      allowing other functions to wait for GUIDed delayed dispatch callbacks.
      
      Cc: Jian J Wang <jian.j.wang@intel.com>
      Cc: Dandan Bi <dandan.bi@intel.com>
      Cc: Liming Gao <gaoliming@byosoft.com.cn>
      Cc: Debkumar De <debkumar.de@intel.com>
      Cc: Catharine West <catharine.west@intel.com>
      
      Co-authored-by: Mike Turner <mikeyt@pobox.com>
      Co-authored-by: Sachin Ganesh <sachinganesh@ami.com>
      Signed-off-by: Kun Qin <kuqin12@gmail.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.615458 to fit
pnmtopng: 38 colors found
Revision graph left in /home/logs/results/bisect/ovmf/test-amd64-amd64-xl-qemuu-ovmf-amd64.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
188238: tolerable ALL FAIL

flight 188238 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/188238/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    


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


