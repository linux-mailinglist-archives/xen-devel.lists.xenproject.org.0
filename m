Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE80561A0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 07:11:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg0Bn-0006Ps-9k; Wed, 26 Jun 2019 05:09:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGph=UZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hg0Bl-0006Pi-1t
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 05:09:45 +0000
X-Inumbo-ID: 99169a30-97d0-11e9-b5a2-6f8320566836
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99169a30-97d0-11e9-b5a2-6f8320566836;
 Wed, 26 Jun 2019 05:09:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hg0Be-0007EB-4H; Wed, 26 Jun 2019 05:09:38 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hg0Bd-0003dU-Mv; Wed, 26 Jun 2019 05:09:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hg0Bd-0003xS-MK; Wed, 26 Jun 2019 05:09:37 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hg0Bd-0003xS-MK@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2019 05:09:37 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-armhf
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
Content-Type: multipart/mixed; boundary="===============5313642605834186893=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5313642605834186893==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138520/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/138520.bisection-summary --basis-template=137600 --blessings=real,real-bisect qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 138372 fail [host=cubietruck-picasso] / 137600 ok.
Failure / basis pass flights: 138372 / 137600
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 719a684d7df1b5b5627f42447be4f12aab038343 474f3938d79ab36b9231c9ad3b5a9314c2aeacde 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 7d1460c991ac45cccbf9ba3d8aa137029c2bf312
Basis pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#f0718d1d6b47745a4249f4006807a45f2245dba1-719a684d7df1b5b5627f42447be4f12aab038343 git://git.qemu.org/qemu.git#a578cdfbdd8f9beff5ced52b7826ddb1669abbbf-474f3938d79ab36b9231c9ad3b5a9314c2aeacde git://xenbits.xen.org/osstest/seabios.git#0932c20560574696cf87ddd12623e8c423ee821b-6e56ed129c9782ba050a5fbfbf4ac12335b230f7 git://xenbits.xen.org/xen.git#844aa0a13d34e9a341a8374119d2ed67d4dcd6bb-7d1460c991ac45cccbf9\
 ba3d8aa137029c2bf312
Loaded 15324 nodes in revision graph
Searching for test results:
 137600 pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 137734 [host=cubietruck-gleizes]
 137697 [host=cubietruck-gleizes]
 137930 [host=cubietruck-gleizes]
 137871 [host=cubietruck-gleizes]
 138031 [host=cubietruck-gleizes]
 138157 [host=cubietruck-gleizes]
 138258 [host=cubietruck-gleizes]
 138404 [host=cubietruck-gleizes]
 138372 fail 719a684d7df1b5b5627f42447be4f12aab038343 474f3938d79ab36b9231c9ad3b5a9314c2aeacde 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 7d1460c991ac45cccbf9ba3d8aa137029c2bf312
 138371 [host=cubietruck-gleizes]
 138377 [host=cubietruck-gleizes]
 138338 [host=cubietruck-gleizes]
 138391 [host=cubietruck-gleizes]
 138380 [host=cubietruck-gleizes]
 138373 [host=cubietruck-gleizes]
 138381 [host=cubietruck-gleizes]
 138387 [host=cubietruck-gleizes]
 138385 [host=cubietruck-gleizes]
 138389 [host=cubietruck-gleizes]
 138395 [host=cubietruck-gleizes]
 138481 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 d3e3413bd6a8c0287dbad8942e208d562fd8e29e 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 07513e15e6e7e5163bf4f59c747825cce748531c
 138431 [host=cubietruck-gleizes]
 138470 fail 2378ea55151eef8284b4cf35e95b058b0e591ea0 541617cad3445fdc6735e9e5752e1f698e337737 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 508908fd449d7b5801ec6b06e5bb263b554444fc
 138514 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138416 [host=cubietruck-gleizes]
 138439 [host=cubietruck-gleizes]
 138420 [host=cubietruck-gleizes]
 138486 pass 1631bb26ae991e530d3c96fe3161ea15144b358e a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 cde324fbad4bb8f920f0f5da6eaa56e228c65f4a
 138456 pass f0718d1d6b47745a4249f4006807a45f2245dba1 a578cdfbdd8f9beff5ced52b7826ddb1669abbbf 0932c20560574696cf87ddd12623e8c423ee821b 844aa0a13d34e9a341a8374119d2ed67d4dcd6bb
 138423 [host=cubietruck-gleizes]
 138443 [host=cubietruck-gleizes]
 138471 fail b0663641c977f97bef785c86978603c3a31a3d1c 21c1ce592a144188dfe59b9e156a97da412a59a2 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 70d2f27b592bfcf76750b9fed5906e53423eebd7
 138425 [host=cubietruck-gleizes]
 138429 [host=cubietruck-gleizes]
 138472 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 650a379d505bf558bcb41124bc6c951a76cbc113 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 36a1c7c213e13eb64d2c2d8aa9c5c805fe19020a
 138460 fail 719a684d7df1b5b5627f42447be4f12aab038343 474f3938d79ab36b9231c9ad3b5a9314c2aeacde 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 7d1460c991ac45cccbf9ba3d8aa137029c2bf312
 138445 [host=cubietruck-gleizes]
 138463 fail b86fbe1f980102eee3e55eed92ac91937aee638e 8e8cbed09ad9d577955691b4c061b61b602406d1 6e56ed129c9782ba050a5fbfbf4ac12335b230f7 7d1460c991ac45cccbf9ba3d8aa137029c2bf312
 138450 [host=cubietruck-gleizes]
 138451 [host=cubietruck-gleizes]
 138452 [host=cubietruck-gleizes]
 138464 fail 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 c21f30ebc779cd4210b488dd702b3f8653aee82b 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 6ff560f7f1f214fb89baaf97812c4c943e44a642
 138467 fail 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 7e3c0deab1b76f37ac0b3199324db976a6cd1b2c 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 2ac48fd52d846a8c3949373aa0d776c6cb5452db
 138473 fail 0a35997643972d3b76a67547cbffeaa8a3d708c3 8e23e34d989d5ce542fa26425f091fc61e1f23f4 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 8966a3e9ab485f3a9d2adf66b71265163f8fb8eb
 138469 fail 8a08dc5486f1a96c91b0ce86fc88a674ca0d8272 1120827fa182f0e76226df7ffe7a86598d1df54f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 508908fd449d7b5801ec6b06e5bb263b554444fc
 138483 pass 1631bb26ae991e530d3c96fe3161ea15144b358e 219dca61ebf41625831d4f96a720852baf44b762 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 ec25b3c0261c5d2cd59b645004178313ac3fe974
 138479 fail fc7d997c35372126823c3b0acf7b67c45cbeea36 ccc47d5d01a99d2eaa7fc4f10f78dde844c7d573 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 a189ef027dbb7a3c0dfe566137f05c06d6685fb9
 138480 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 6d7a134da4afebe8551a69329478415cfb4cbe91 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138506 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 f91005e195e7e1485e60cb121731589960f1a3c9 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138496 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 0b8fa32f551e863bb548a11394239239270dd3dc 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138500 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 30aec7d331c0dd43c3e83b028c3169993d897552 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138490 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 59c58f96b270f5edd4ad10954c3a96556cb3a728 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 bbac4facb676248703cf5708001dcd40c0780add
 138502 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138509 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138513 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138512 pass 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
 138520 fail 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 37677d7db39a3c250ad661d00fb7c3b59d047b1f 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
Searching for interesting versions
 Result found: flight 137600 (pass), for basis pass
 Result found: flight 138372 (fail), for basis failure
 Repro found: flight 138456 (pass), for basis pass
 Repro found: flight 138460 (fail), for basis failure
 0 revisions at 4eb0acb1e2bef27d29ed8cc6200a9963b5cb0565 c0a9956b32e2806a9d50ce8c651ace140f5f79f1 85137fb5f2dfa5f83e9e340ca881c634ae14d4e9 480800c76969b38f13b6909eb679b23571417538
No revisions left to test, checking graph state.
 Result found: flight 138502 (pass), for last pass
 Result found: flight 138509 (fail), for first failure
 Repro found: flight 138512 (pass), for last pass
 Repro found: flight 138513 (fail), for first failure
 Repro found: flight 138514 (pass), for last pass
 Repro found: flight 138520 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  37677d7db39a3c250ad661d00fb7c3b59d047b1f
  Bug not present: c0a9956b32e2806a9d50ce8c651ace140f5f79f1
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/138520/


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

pnmtopng: 220 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
138520: tolerable ALL FAIL

flight 138520 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/138520/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf                   6 xen-build               fail baseline untested


jobs:
 build-armhf                                                  fail    


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



--===============5313642605834186893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5313642605834186893==--
