Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661124F820
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 22:17:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hemPV-0005wq-9a; Sat, 22 Jun 2019 20:14:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/HPt=UV=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hemPU-0005wg-BH
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2019 20:14:52 +0000
X-Inumbo-ID: 6355ee94-952a-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6355ee94-952a-11e9-8980-bc764e045a96;
 Sat, 22 Jun 2019 20:14:50 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hemPQ-00044y-KN; Sat, 22 Jun 2019 20:14:48 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hemPP-0001KO-VG; Sat, 22 Jun 2019 20:14:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hemPP-0002mS-U9; Sat, 22 Jun 2019 20:14:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hemPP-0002mS-U9@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 22 Jun 2019 20:14:47 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-amd64
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
Content-Type: multipart/mixed; boundary="===============8162424392754497582=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8162424392754497582==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138337/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64.xen-build --summary-out=tmp/138337.bisection-summary --basis-template=137600 --blessings=real,real-bisect qemu-mainline build-amd64 xen-build
Searching for failure / basis pass:
 138157 fail [host=godello1] / 137600 ok.
Failure / basis pass flights: 138157 / 137600
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 d0d8ad39ecb51cd7497cd524484fe09f50876798 33d609990621dea6c7d056c86f707b8811320ac1 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
Basis pass f0718d1d6b47745a4249f4006807a45f2245dba1 d0d8ad39ecb51cd7497cd524484fe09f50876798 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#f0718d1d6b47745a4249f4006807a45f2245dba1-8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#a578cdfbdd8f9beff5ced52b7826ddb1669abbbf-33d609990621dea6c7d056c86f707b8811320ac1 git://xenbits.xen.org/osstest/seabios.git#0932c20560574696cf87ddd12623e8c423ee821b-6e5\
 6ed129c9782ba050a5fbfbf4ac12335b230f7 git://xenbits.xen.org/xen.git#844aa0a13d34e9a341a8374119d2ed67d4dcd6bb-36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
Loaded 15517 nodes in revision graph
Searching for test results:
 137600 pass f0718d1d6b47745a4249f4006807a45f2245dba1 d0d8ad39ecb51cd7497cd524484fe09f50876798 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 137734 fail irrelevant
 137697 fail irrelevant
 137930 [host=godello0]
 137871 fail b0663641c977f97bef785c86978603c3a31a3d1c d0d8ad39ecb51cd7497cd524484fe09f50876798 f3d0bec9f80e4ed7796fffa834ba0a53f2094f7f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 138031 [host=godello0]
 138168 [host=godello0]
 138157 fail 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 d0d8ad39ecb51cd7497cd524484fe09f50876798 33d609990621dea6c7d056c86f707b8811320ac1 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 138158 [host=godello0]
 138163 [host=godello0]
 138124 [host=godello0]
 138152 [host=godello0]
 138171 [host=godello0]
 138177 [host=godello0]
 138186 [host=godello0]
 138183 [host=godello0]
 138184 [host=godello0]
 138261 pass f0718d1d6b47745a4249f4006807a45f2245dba1 d0d8ad39ecb51cd7497cd524484fe09f50876798 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 138189 [host=godello0]
 138192 [host=godello0]
 138196 [host=godello0]
 138210 [host=godello0]
 138215 [host=godello0]
 138218 [host=godello0]
 138220 [host=godello0]
 138253 [host=godello0]
 138237 [host=godello0]
 138239 [host=godello0]
 138270 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 d0d8ad39ecb51cd7497cd524484fe09f50876798 650a379d505bf558bcb41124bc6c951a76cbc113 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 138267 fail 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 d0d8ad39ecb51cd7497cd524484fe09f50876798 33d609990621dea6c7d056c86f707b8811320ac1 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 138275 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 d0d8ad39ecb51cd7497cd524484fe09f50876798 8e23e34d989d5ce542fa26425f091fc61e1f23f4 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 8966a3e9ab485f3a9d2adf66b71265163f8fb8eb
 138279 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 d0d8ad39ecb51cd7497cd524484fe09f50876798 ccc47d5d01a99d2eaa7fc4f10f78dde844c7d573 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 a189ef027dbb7a3c0dfe566137f05c06d6685fb9
 138281 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 6d7a134da4afebe8551a69329478415cfb4cbe91 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138291 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 07513e15e6e7e5163bf4f59c747825cce748531c
 138296 pass 1631bb26ae991e530d3c96fe3161ea15144b358e d0d8ad39ecb51cd7497cd524484fe09f50876798 219dca61ebf41625831d4f96a720852baf44b762 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 ec25b3c0261c5d2cd59b645004178313ac3fe974
 138329 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138303 pass 1631bb26ae991e530d3c96fe3161ea15144b358e d0d8ad39ecb51cd7497cd524484fe09f50876798 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 cde324fbad4bb8f920f0f5da6eaa56e228c65f4a
 138332 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138311 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 59c58f96b270f5edd4ad10954c3a96556cb3a728 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 bbac4facb676248703cf5708001dcd40c0780add
 138336 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138315 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 0b8fa32f551e863bb548a11394239239270dd3dc 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138337 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138318 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 30aec7d331c0dd43c3e83b028c3169993d897552 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138320 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138322 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 f91005e195e7e1485e60cb121731589960f1a3c9 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138324 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
Searching for interesting versions
 Result found: flight 137600 (pass), for basis pass
 Result found: flight 138157 (fail), for basis failure
 Repro found: flight 138261 (pass), for basis pass
 Repro found: flight 138267 (fail), for basis failure
 0 revisions at 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d0d8ad39ecb51cd7497cd524484fe09f50876798 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
No revisions left to test, checking graph state.
 Result found: flight 138320 (pass), for last pass
 Result found: flight 138324 (fail), for first failure
 Repro found: flight 138329 (pass), for last pass
 Repro found: flight 138332 (fail), for first failure
 Repro found: flight 138336 (pass), for last pass
 Repro found: flight 138337 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138337/


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

pnmtopng: 221 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
138337: tolerable ALL FAIL

flight 138337 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138337/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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



--===============8162424392754497582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8162424392754497582==--
