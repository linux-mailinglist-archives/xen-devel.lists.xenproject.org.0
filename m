Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A034A6C2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 18:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdGt3-0005gU-P0; Tue, 18 Jun 2019 16:23:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EKPJ=UR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hdGt2-0005gJ-79
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 16:23:08 +0000
X-Inumbo-ID: 5ad7012f-91e5-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ad7012f-91e5-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 16:23:07 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdGt0-0002sM-Kt; Tue, 18 Jun 2019 16:23:06 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hdGt0-0001ev-Dg; Tue, 18 Jun 2019 16:23:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hdGt0-0005qo-D0; Tue, 18 Jun 2019 16:23:06 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hdGt0-0005qo-D0@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2019 16:23:06 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-arm64
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
Content-Type: multipart/mixed; boundary="===============7456254857670340788=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7456254857670340788==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137980/


  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64.xen-build --summary-out=tmp/137980.bisection-summary --basis-template=137600 --blessings=real,real-bisect qemu-mainline build-arm64 xen-build
Searching for failure / basis pass:
 137871 fail [host=rochester0] / 137600 [host=rochester1] 137492 [host=laxton1] 137399 [host=laxton0] 137314 [host=laxton1] 137222 [host=laxton1] 137105 ok.
Failure / basis pass flights: 137871 / 137105
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b0663641c977f97bef785c86978603c3a31a3d1c f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
Basis pass 21d9dc21f81828538af02ca9c2d86a36551b0771 60905286cb5150de854e08279bca7dfc4b549e91 0932c20560574696cf87ddd12623e8c423ee821b 81646cea826fa322831fffb43f81e7e0866dc124
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#21d9dc21f81828538af02ca9c2d86a36551b0771-b0663641c977f97bef785c86978603c3a31a3d1c git://git.qemu.org/qemu.git#60905286cb5150de854e08279bca7dfc4b549e91-f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f git://xenbits.xen.org/osstest/seabios.git#0932c20560574696cf87ddd12623e8c423ee821b-85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 git://xenbits.xen.org/xen.git#81646cea826fa322831fffb43f81e7e0866dc124-36a1c7c213e13eb64d2c\
 2d8aa9c5c805fe19020a
Loaded 18488 nodes in revision graph
Searching for test results:
 137105 pass 21d9dc21f81828538af02ca9c2d86a36551b0771 60905286cb5150de854e08279bca7dfc4b549e91 0932c20560574696cf87ddd12623e8c423ee821b 81646cea826fa322831fffb43f81e7e0866dc124
 137222 [host=laxton1]
 137314 [host=laxton1]
 137399 [host=laxton0]
 137492 [host=laxton1]
 137600 [host=rochester1]
 137734 [host=rochester1]
 137697 [host=rochester1]
 137931 pass 21d9dc21f81828538af02ca9c2d86a36551b0771 60905286cb5150de854e08279bca7dfc4b549e91 0932c20560574696cf87ddd12623e8c423ee821b 81646cea826fa322831fffb43f81e7e0866dc124
 137961 pass fe0c2770a72af3a34f79c84676b7bf0c97090bda 347a6f44e90bf0ffff1e23b8fb919c780abb80b8 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 7177f589ba84433e1ca8bb97a5d074545133c49c
 137935 fail b0663641c977f97bef785c86978603c3a31a3d1c f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 137936 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 650a379d505bf558bcb41124bc6c951a76cbc113 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 137871 fail b0663641c977f97bef785c86978603c3a31a3d1c f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 137938 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 8e23e34d989d5ce542fa26425f091fc61e1f23f4 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 8966a3e9ab485f3a9d2adf66b71265163f8fb8eb
 137927 [host=rochester1]
 137939 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 ccc47d5d01a99d2eaa7fc4f10f78dde844c7d573 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 a189ef027dbb7a3c0dfe566137f05c06d6685fb9
 137941 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 07513e15e6e7e5163bf4f59c747825cce748531c
 137940 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 6d7a134da4afebe8551a69329478415cfb4cbe91 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137946 pass 470626624fa31a1f50b82815dd330deb43e32e52 89a44a103315267122119b4311218d00d2561ebe 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 7f03e7e05f4f80a41d28706c7567154dce257ce3
 137947 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 4aca9786542e427d4337503566efdf09f2cb87cd 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 bbac4facb676248703cf5708001dcd40c0780add
 137948 pass 48b0bf6476a215a8e399af3c5905c17f94f2c63d 43b3952dea0f763ceeaa2f119c473b5cc6d29c90 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 c38a6cfc3b65e4d50f7c5efb4bc83eec120ff0d7
 137949 pass 6cbed0e36fe734f3fc11d30d652122d7714627c4 754f1dbcf1d4d543167e3212366055761c30bcf4 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 c0666fab19ea1523fbcae57d8362d94e06b21f98
 137953 pass fe0c2770a72af3a34f79c84676b7bf0c97090bda 6d88baf18653ff8826db3dd840a6b372d3477280 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 bd5be40ce2307ea5e8f52e3103d1b48ca9dfdce9
 137960 pass 20d2e5a125e34fc8501026613a71549b2a1a3e54 03158519384f15890d587937bd1b3ea699898e55 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 7177f589ba84433e1ca8bb97a5d074545133c49c
 137954 pass fe0c2770a72af3a34f79c84676b7bf0c97090bda 33556237f652d8a712d0b6d29ecb442e6b65fe42 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 bd5be40ce2307ea5e8f52e3103d1b48ca9dfdce9
 137964 pass de2204a9e8c93b535909c7902c8e92d8c5d03c48 f1114d321246f9177072923e1c2a20e7aab82700 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 7177f589ba84433e1ca8bb97a5d074545133c49c
 137962 pass 7cea4d71a8a87a93924a07ab32348332f5881ef9 11ba81c3cde0bc070cced6e8ef2835fab4fe90c8 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 ff7e72a1cac7dfe33ea3c5a528debcead18e0b22
 137963 pass f03859ea6c8fddeaa3a5cc3d9a3461728ce538aa c87759ce876a7a0b17c2bf4f0b964bd51f0ee871 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 137965 pass 470626624fa31a1f50b82815dd330deb43e32e52 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 3455cd598c5f57c3f6c10a9b1bb471ea6857a115
 137966 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 84995ea21935403cc9d57b6cb7dddcac5fa02c1c 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 608639ffa0a0d6f219e14ba7397ab2cc018b93c9
 137967 pass 1631bb26ae991e530d3c96fe3161ea15144b358e a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 decfc03f54b821877f64f28beba15124940470b5
 137969 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 a8d2532645cf5ce4f75981f81dfe363efc35d05c 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137972 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 f91005e195e7e1485e60cb121731589960f1a3c9 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137973 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137974 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137975 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137976 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137977 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 137980 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
Searching for interesting versions
 Result found: flight 137105 (pass), for basis pass
 Result found: flight 137871 (fail), for basis failure
 Repro found: flight 137931 (pass), for basis pass
 Repro found: flight 137935 (fail), for basis failure
 0 revisions at 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
No revisions left to test, checking graph state.
 Result found: flight 137973 (pass), for last pass
 Result found: flight 137974 (fail), for first failure
 Repro found: flight 137975 (pass), for last pass
 Repro found: flight 137976 (fail), for first failure
 Repro found: flight 137977 (pass), for last pass
 Repro found: flight 137980 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/137980/


  commit 37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Author: Markus Armbruster <armbru@redhat.com>
  Date:   Tue Jun 4 20:16:17 2019 +0200
  
      Clean up a few header guard symbols
      
      Commit 58ea30f5145 "Clean up header guards that don't match their file
      name" messed up contrib/elf2dmp/qemu_elf.h and
      tests/migration/migration-test.h.
      
      It missed target/cris/opcode-cris.h and
      tests/uefi-test-tools/UefiTestToolsPkg/Include/Guid/BiosTablesTest.h
      due to the scripts/clean-header-guards.pl bug fixed in the previous
      commit.
      
      Commit a8b991b52dc "Clean up ill-advised or unusual header guards"
      missed include/hw/xen/io/ring.h for the same reason.
      
      Commit 3979fca4b69 "disas: Rename include/disas/bfd.h back to
      include/disas/dis-asm.h" neglected to update the guard symbol for the
      rename.
      
      Commit a331c6d7741 "semihosting: implement a semihosting console"
      created include/hw/semihosting/console.h with an ill-advised guard
      symbol.
      
      Clean them up.
      
      Signed-off-by: Markus Armbruster <armbru@redhat.com>
      Message-Id: <20190604181618.19980-4-armbru@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

pnmtopng: 214 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
137980: tolerable ALL FAIL

flight 137980 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/137980/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64                   6 xen-build               fail baseline untested


jobs:
 build-arm64                                                  fail    


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



--===============7456254857670340788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7456254857670340788==--
