Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C225D4CE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 18:52:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiLyI-0002sF-LR; Tue, 02 Jul 2019 16:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1Em=U7=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hiLyH-0002s2-EC
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 16:49:33 +0000
X-Inumbo-ID: 5be06e70-9ce9-11e9-90db-bbacc41c030b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5be06e70-9ce9-11e9-90db-bbacc41c030b;
 Tue, 02 Jul 2019 16:49:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hiLyD-0000Jj-2g; Tue, 02 Jul 2019 16:49:29 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hiLyC-0004X9-6H; Tue, 02 Jul 2019 16:49:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hiLyC-0001zb-5d; Tue, 02 Jul 2019 16:49:28 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hiLyC-0001zb-5d@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 02 Jul 2019 16:49:28 +0000
Subject: [Xen-devel] [freebsd-master bisection] complete
 build-amd64-xen-freebsd
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6781858379831807342=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6781858379831807342==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xen-freebsd
testid xen-build-freebsd

Tree: freebsd git://github.com/freebsd/freebsd.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138709/


  commit b41666f2c17f01c437c870389ab713ee62ae3526
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Jun 25 15:39:44 2019 +0200
  
      config: don't hardcode toolchain binaries
      
      Currently the names of the build toolchain binaries are hardcoded in
      StdGNU.mk, and the values from the environment are ignored.
      
      Switch StdGNU.mk to use '?=' instead of '=', so that values from the
      environment are used if present, else default to the values provided
      by the config file.
      
      This change fixes the gitlab CI loop, that was relying on passing
      custom values in the environment variables for the compiler and the
      linker.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/freebsd-master/build-amd64-xen-freebsd.xen-build-freebsd.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/freebsd-master/build-amd64-xen-freebsd.xen-build-freebsd --summary-out=tmp/138709.bisection-summary --basis-template=138540 --blessings=real,real-bisect freebsd-master build-amd64-xen-freebsd xen-build-freebsd
Searching for failure / basis pass:
 138671 fail [host=italia0] / 138540 [host=fiano0] 138419 [host=baroque0] 138174 [host=baroque0] 138015 [host=italia1] 137901 [host=pinot1] 137723 [host=baroque0] 137673 [host=godello0] 137576 [host=baroque0] 137434 [host=italia1] 136901 [host=italia1] 136606 [host=chardonnay1] 136447 [host=chardonnay1] 136297 [host=chardonnay0] 136173 [host=pinot1] 136000 [host=chardonnay1] 135901 [host=godello0] 135233 [host=godello1] 135111 [host=godello0] 134985 [host=godello1] 134811 [host=godello1] 134690 \
 [host=merlot0] 134604 [host=godello0] 134521 [host=godello1] 134336 [host=chardonnay1] 134258 [host=godello1] 134184 [host=godello1] 134123 [host=godello1] 134066 [host=godello1] 133982 [host=baroque0] 133944 [host=merlot0] 133898 [host=godello1] 133765 [host=godello1] 133707 [host=baroque1] 133653 [host=godello1] 133616 [host=fiano1] 133572 [host=godello1] 133497 [host=godello1] 133455 [host=baroque1] 133365 [host=godello1] 133325 [host=debina0] 133299 [host=baroque1] 133262 [host=godello0] 133\
 225 [host=baroque1] 133137 [host=baroque1] 133038 [host=baroque0] 132959 [host=godello0] 132832 [host=godello1] 132696 [host=godello1] 132616 [host=godello0] 132473 [host=godello0] 132426 [host=elbling1] 132258 [host=godello0] 132054 [host=godello0] 131783 [host=baroque1] 131682 [host=baroque1] 131662 [host=baroque1] 131617 [host=baroque1] 131585 [host=godello0] 131545 [host=godello1] 131488 [host=godello0] 131440 [host=godello1] 131388 [host=godello1] 131310 [host=chardonnay0] 131265 [host=gode\
 llo0] 131205 [host=godello0] 131118 [host=godello1] 130966 [host=godello0] 130874 [host=baroque0] 130849 [host=godello0] 130810 [host=godello1] 130718 [host=elbling0] 130648 [host=godello1] 130494 [host=godello0] 130036 [host=godello1] 129834 [host=godello0] 129693 [host=debina1] 129544 [host=godello0] 129446 [host=godello1] 129318 [host=godello0] 129229 [host=godello0] 128497 [host=baroque0] 128413 [host=godello0] 128339 [host=godello1] 128277 [host=baroque0] 128102 [host=godello1] 128006 [host\
 =godello1] 127876 [host=godello1] 127804 [host=godello1] 127721 [host=godello1] 127599 [host=pinot0] 127532 [host=baroque0] 127475 [host=godello1] 127373 [host=godello0] 127033 [host=godello1] template as basis? using template as basis.
Failure / basis pass flights: 138671 / 138540
Tree: freebsd git://github.com/freebsd/freebsd.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 99c8ab4764918fbb17a1296a1564d7ddc0d24141 ffe048a0807b56c2def74f8280d55e2aa8865c20 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 cc07ec6107d23ee9a4237686711eede387741c08
Basis pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 be5903ad1e244cbb0930161fb361ed0b699c4cb8 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 f3d8eef9091747e70c505094f63514b43329a922
Generating revisions with ./adhoc-revtuple-generator  git://github.com/freebsd/freebsd.git#14e63f898b16382f4577cfea211a7fb5ad7983e9-99c8ab4764918fbb17a1296a1564d7ddc0d24141 git://xenbits.xen.org/osstest/ovmf.git#be5903ad1e244cbb0930161fb361ed0b699c4cb8-ffe048a0807b56c2def74f8280d55e2aa8865c20 git://xenbits.xen.org/qemu-xen.git#9cca02d8ffc23e9688a971d858e4ffdff5389b11-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/osstest/seabios.git#6e56ed129c9782ba050a5fbfbf4ac12335b230f7-30f1e4\
 1f04fb4c715d27f987f003cfc31c9ff4f3 git://xenbits.xen.org/xen.git#f3d8eef9091747e70c505094f63514b43329a922-cc07ec6107d23ee9a4237686711eede387741c08
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Loaded 9938 nodes in revision graph
Searching for test results:
 138540 [host=fiano0]
 138606 [host=italia1]
 138626 [host=italia1]
 138672 [host=italia1]
 138658 [host=italia1]
 138681 [host=italia1]
 138643 [host=italia1]
 138682 [host=italia1]
 138691 fail 2b448ee3cedffaa48579e464eac7cbee6b48d1cc c54c85621826ace8684879fef9eb8ba7f49cfb54 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 874fc28b72fbb49f4f304b9acd3d49afd8326042
 138644 [host=italia1]
 138663 [host=italia1]
 138683 [host=italia1]
 138667 [host=italia1]
 138671 fail 99c8ab4764918fbb17a1296a1564d7ddc0d24141 ffe048a0807b56c2def74f8280d55e2aa8865c20 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 cc07ec6107d23ee9a4237686711eede387741c08
 138684 [host=italia1]
 138647 [host=italia1]
 138655 [host=italia1]
 138669 [host=italia1]
 138694 fail 7f9d2a2c8ae34aef137bd70ac54f68a242406ad4 8b6f0b5cd3d97f6f385804344f6795e5fbdb753e 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 1bef4b1efd40b4c8c9e7afcd0155042a47896cb0
 138709 fail 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e b41666f2c17f01c437c870389ab713ee62ae3526
 138685 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 be5903ad1e244cbb0930161fb361ed0b699c4cb8 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 f3d8eef9091747e70c505094f63514b43329a922
 138696 fail 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 62b8949e9ddefa3191688ccc56e69aa6331b0da1
 138702 fail 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e b41666f2c17f01c437c870389ab713ee62ae3526
 138687 fail 99c8ab4764918fbb17a1296a1564d7ddc0d24141 ffe048a0807b56c2def74f8280d55e2aa8865c20 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 cc07ec6107d23ee9a4237686711eede387741c08
 138697 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 370f16c5489609062d8ee0940f29f6c3393f1b68 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138688 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 be5903ad1e244cbb0930161fb361ed0b699c4cb8 9cca02d8ffc23e9688a971d858e4ffdff5389b11 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 f3d8eef9091747e70c505094f63514b43329a922
 138706 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138690 fail 99c8ab4764918fbb17a1296a1564d7ddc0d24141 ffe048a0807b56c2def74f8280d55e2aa8865c20 9cca02d8ffc23e9688a971d858e4ffdff5389b11 30f1e41f04fb4c715d27f987f003cfc31c9ff4f3 cc07ec6107d23ee9a4237686711eede387741c08
 138707 fail 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e b41666f2c17f01c437c870389ab713ee62ae3526
 138698 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 b8ac0b7f284790c15af0e7bec08df43f8257f368 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138700 fail 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e b41666f2c17f01c437c870389ab713ee62ae3526
 138701 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
 138708 pass 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
Searching for interesting versions
 Result found: flight 138685 (pass), for basis pass
 Result found: flight 138687 (fail), for basis failure
 Repro found: flight 138688 (pass), for basis pass
 Repro found: flight 138690 (fail), for basis failure
 0 revisions at 14e63f898b16382f4577cfea211a7fb5ad7983e9 51f7a3e6c5192d3f9a0fa63b0b5617c151180ad7 9cca02d8ffc23e9688a971d858e4ffdff5389b11 020bc4fc5ce93107c8e1bc731b9802cee56a123e 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
No revisions left to test, checking graph state.
 Result found: flight 138701 (pass), for last pass
 Result found: flight 138702 (fail), for first failure
 Repro found: flight 138706 (pass), for last pass
 Repro found: flight 138707 (fail), for first failure
 Repro found: flight 138708 (pass), for last pass
 Repro found: flight 138709 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b41666f2c17f01c437c870389ab713ee62ae3526
  Bug not present: 85fd4f7a09d8aaa783932b8c15b80ddaff0a174d
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138709/


  commit b41666f2c17f01c437c870389ab713ee62ae3526
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Tue Jun 25 15:39:44 2019 +0200
  
      config: don't hardcode toolchain binaries
      
      Currently the names of the build toolchain binaries are hardcoded in
      StdGNU.mk, and the values from the environment are ignored.
      
      Switch StdGNU.mk to use '?=' instead of '=', so that values from the
      environment are used if present, else default to the values provided
      by the config file.
      
      This change fixes the gitlab CI loop, that was relying on passing
      custom values in the environment variables for the compiler and the
      linker.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

pnmtopng: 249 colors found
Revision graph left in /home/logs/results/bisect/freebsd-master/build-amd64-xen-freebsd.xen-build-freebsd.{dot,ps,png,html,svg}.
----------------------------------------
138709: tolerable ALL FAIL

flight 138709 freebsd-master real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138709/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xen-freebsd       7 xen-build-freebsd       fail baseline untested


jobs:
 build-amd64-xen-freebsd                                      fail    


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



--===============6781858379831807342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6781858379831807342==--
