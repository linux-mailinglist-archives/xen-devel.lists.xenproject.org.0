Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8416BA3
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 21:46:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO5zR-0001d3-Sv; Tue, 07 May 2019 19:43:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DeKk=TH=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hO5zR-0001cr-51
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 19:43:01 +0000
X-Inumbo-ID: 51ab4f16-7100-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51ab4f16-7100-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 19:42:59 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hO5zO-0000dl-VM; Tue, 07 May 2019 19:42:58 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hO5zO-0005Jl-AW; Tue, 07 May 2019 19:42:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hO5zO-0006Oa-9t; Tue, 07 May 2019 19:42:58 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hO5zO-0006Oa-9t@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 May 2019 19:42:58 +0000
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
Content-Type: multipart/mixed; boundary="===============1964568570087973432=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1964568570087973432==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/135870/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64.xen-build --summary-out=tmp/135870.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-amd64 xen-build
Searching for failure / basis pass:
 135711 fail [host=godello0] / 135416 ok.
Failure / basis pass flights: 135711 / 135416
(tree with no url: minios)
(tree with no url: seabios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d027412258875cee485977fad39b1801beb50074 d0d8ad39ecb51cd7497cd524484fe09f50876798 a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Basis pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#20029ca22baaeb9418c1fd9df88d12d32d585cb6-d027412258875cee485977fad39b1801beb50074 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#e0fb2c3d89aa77057ac4aa073e01f4ca484449b0-a6ae23831b05a11880b40f7d58e332c45a6b04f7 git://xenbits.xen.org/xen.git#cb70a26f78848fe45f593f7ebc9cfaac760a791b-cb70a26f78848fe\
 45f593f7ebc9cfaac760a791b
Loaded 4858 nodes in revision graph
Searching for test results:
 135448 fail irrelevant
 135416 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135827 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135825 [host=godello1]
 135831 fail d027412258875cee485977fad39b1801beb50074 d0d8ad39ecb51cd7497cd524484fe09f50876798 a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135833 fail d027412258875cee485977fad39b1801beb50074 d0d8ad39ecb51cd7497cd524484fe09f50876798 f62d632f4328fab02682335ba1ccfdbd9893d33d cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135571 [host=godello1]
 135711 fail d027412258875cee485977fad39b1801beb50074 d0d8ad39ecb51cd7497cd524484fe09f50876798 a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135767 [host=godello1]
 135823 [host=godello1]
 135863 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135835 fail d027412258875cee485977fad39b1801beb50074 d0d8ad39ecb51cd7497cd524484fe09f50876798 574d96933ceff60b2d13fe97602572fc7e95f7c6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135839 fail 137cbff041fc93a980a1fac5d7bfbaad2084340d d0d8ad39ecb51cd7497cd524484fe09f50876798 22d96eac64877c4d96f9928babb6f2fcc68faacf cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135842 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 437cc27ddfded3bbab6afd5ac1761e0e195edba7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135865 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135844 pass 8a472b1915fbc579ae3fba32f801286b0273b414 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135846 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 7fbb535f7aeb22896fedfcf18a1eeff48165f1d7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135867 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135870 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135848 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 ef9aae2522c22c05df17dd898099dd5c3f20d688 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135853 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 c637044120705004b792ecf29e6b4be41e20c4c8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135855 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 5bcf8ed9401e62c73158ba110864ee1375558bf7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135856 pass e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135862 fail e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Searching for interesting versions
 Result found: flight 135416 (pass), for basis pass
 Result found: flight 135711 (fail), for basis failure
 Repro found: flight 135827 (pass), for basis pass
 Repro found: flight 135831 (fail), for basis failure
 0 revisions at e2d3a25f1a3135221a9c8061e1b8f90245d727eb d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
No revisions left to test, checking graph state.
 Result found: flight 135856 (pass), for last pass
 Result found: flight 135862 (fail), for first failure
 Repro found: flight 135863 (pass), for last pass
 Repro found: flight 135865 (fail), for first failure
 Repro found: flight 135867 (pass), for last pass
 Repro found: flight 135870 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/135870/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
135870: tolerable ALL FAIL

flight 135870 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/135870/

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



--===============1964568570087973432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1964568570087973432==--
