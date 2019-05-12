Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FB1AD85
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2019 19:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPsLt-0003iL-0V; Sun, 12 May 2019 17:33:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jfTj=TM=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hPsLr-0003iC-Bn
 for xen-devel@lists.xenproject.org; Sun, 12 May 2019 17:33:31 +0000
X-Inumbo-ID: 0e37efc2-74dc-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0e37efc2-74dc-11e9-8980-bc764e045a96;
 Sun, 12 May 2019 17:33:29 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hPsLo-00087S-9k; Sun, 12 May 2019 17:33:28 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hPsLo-0000zJ-0j; Sun, 12 May 2019 17:33:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hPsLn-0000VK-RA; Sun, 12 May 2019 17:33:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hPsLn-0000VK-RA@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 12 May 2019 17:33:27 +0000
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
Content-Type: multipart/mixed; boundary="===============0868877600073877632=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0868877600073877632==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136094/


  commit 79d77bcd366190a81d092177e4f84d34b7a56fc2
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Apr 29 17:35:57 2019 +0100
  
      configure: Remove --source-path option
      
      Normally configure identifies the source path by looking
      at the location where the configure script itself exists.
      We also provide a --source-path option which lets the user
      manually override this.
      
      There isn't really an obvious use case for the --source-path
      option, and in commit 927128222b0a91f56c13a in 2017 we
      accidentally added some logic that looks at $source_path
      before the command line option that overrides it has been
      processed.
      
      The fact that nobody complained suggests that there isn't
      any use of this option and we aren't testing it either;
      remove it. This allows us to move the "make $source_path
      absolute" logic up so that there is no window in the script
      where $source_path is set but not yet absolute.
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Message-id: 20190318134019.23729-1-peter.maydell@linaro.org


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64.xen-build --summary-out=tmp/136094.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-arm64 xen-build
Searching for failure / basis pass:
 135937 fail [host=laxton0] / 135416 ok.
Failure / basis pass flights: 135937 / 135416
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Basis pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#20029ca22baaeb9418c1fd9df88d12d32d585cb6-fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 git://git.qemu.org/qemu.git#e0fb2c3d89aa77057ac4aa073e01f4ca484449b0-df06df4f412a67341de0fbb075e74c4dde3c8972 git://xenbits.xen.org/xen.git#cb70a26f78848fe45f593f7ebc9cfaac760a791b-cb70a26f78848fe45f593f7ebc9cfaac760a791b
Loaded 6693 nodes in revision graph
Searching for test results:
 135448 [host=laxton1]
 135416 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135828 [host=laxton1]
 136064 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 f62d632f4328fab02682335ba1ccfdbd9893d33d cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136065 fail d027412258875cee485977fad39b1801beb50074 e6e90feedb706b1b92827a5977b37e1e8defb8ef cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135571 [host=laxton1]
 135711 [host=laxton1]
 135937 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136045 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136052 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136053 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 1efede74f6e75c1c5b81366249e3b234161add1e cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136054 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 52ec9dcc1ed5609674e7b52198c18207bb193548 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136071 fail d027412258875cee485977fad39b1801beb50074 574d96933ceff60b2d13fe97602572fc7e95f7c6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136072 fail 137cbff041fc93a980a1fac5d7bfbaad2084340d 22d96eac64877c4d96f9928babb6f2fcc68faacf cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136074 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 437cc27ddfded3bbab6afd5ac1761e0e195edba7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136077 pass 8a472b1915fbc579ae3fba32f801286b0273b414 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136079 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 7fbb535f7aeb22896fedfcf18a1eeff48165f1d7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136080 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb ef9aae2522c22c05df17dd898099dd5c3f20d688 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136081 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb c637044120705004b792ecf29e6b4be41e20c4c8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136082 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 5bcf8ed9401e62c73158ba110864ee1375558bf7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136083 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136085 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136088 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136090 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136092 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136094 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Searching for interesting versions
 Result found: flight 135416 (pass), for basis pass
 Result found: flight 135937 (fail), for basis failure
 Repro found: flight 136045 (pass), for basis pass
 Repro found: flight 136052 (fail), for basis failure
 0 revisions at e2d3a25f1a3135221a9c8061e1b8f90245d727eb aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
No revisions left to test, checking graph state.
 Result found: flight 136083 (pass), for last pass
 Result found: flight 136085 (fail), for first failure
 Repro found: flight 136088 (pass), for last pass
 Repro found: flight 136090 (fail), for first failure
 Repro found: flight 136092 (pass), for last pass
 Repro found: flight 136094 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136094/


  commit 79d77bcd366190a81d092177e4f84d34b7a56fc2
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Apr 29 17:35:57 2019 +0100
  
      configure: Remove --source-path option
      
      Normally configure identifies the source path by looking
      at the location where the configure script itself exists.
      We also provide a --source-path option which lets the user
      manually override this.
      
      There isn't really an obvious use case for the --source-path
      option, and in commit 927128222b0a91f56c13a in 2017 we
      accidentally added some logic that looks at $source_path
      before the command line option that overrides it has been
      processed.
      
      The fact that nobody complained suggests that there isn't
      any use of this option and we aren't testing it either;
      remove it. This allows us to move the "make $source_path
      absolute" logic up so that there is no window in the script
      where $source_path is set but not yet absolute.
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Message-id: 20190318134019.23729-1-peter.maydell@linaro.org

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
136094: tolerable ALL FAIL

flight 136094 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136094/

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



--===============0868877600073877632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0868877600073877632==--
