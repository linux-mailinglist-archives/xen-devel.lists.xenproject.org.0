Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E802264E
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2019 10:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSGz6-0003fC-5i; Sun, 19 May 2019 08:15:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XwFn=TT=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hSGz4-0003ez-7t
 for xen-devel@lists.xenproject.org; Sun, 19 May 2019 08:15:54 +0000
X-Inumbo-ID: 4fe93ee2-7a0e-11e9-941b-d7b56d3c3b7d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fe93ee2-7a0e-11e9-941b-d7b56d3c3b7d;
 Sun, 19 May 2019 08:15:50 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hSGyz-0003Sv-Od; Sun, 19 May 2019 08:15:49 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hSGyz-0000b3-FA; Sun, 19 May 2019 08:15:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hSGyz-0000et-EV; Sun, 19 May 2019 08:15:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hSGyz-0000et-EV@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 19 May 2019 08:15:49 +0000
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
Content-Type: multipart/mixed; boundary="===============4268396330381012660=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4268396330381012660==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf
testid xen-build

Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136550/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-armhf.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-armhf.xen-build --summary-out=tmp/136550.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-armhf xen-build
Searching for failure / basis pass:
 136320 fail [host=cubietruck-picasso] / 135416 [host=cubietruck-gleizes] 135251 [host=cubietruck-gleizes] 135077 ok.
Failure / basis pass flights: 136320 / 135077
(tree in latest but not in basispass: ovmf)
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest e329ad2ab72c43b56df88b34954c2c7d839bb373 e83077a3d11072708a5c38fa09fa9d011914e2a1
Basis pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Generating revisions with ./adhoc-revtuple-generator  git://git.qemu.org/qemu.git#eeba63fc7fface36f438bcbc0d3b02e7dcb59983-e329ad2ab72c43b56df88b34954c2c7d839bb373 git://xenbits.xen.org/xen.git#cb70a26f78848fe45f593f7ebc9cfaac760a791b-e83077a3d11072708a5c38fa09fa9d011914e2a1
Loaded 9607 nodes in revision graph
Searching for test results:
 134899 [host=cubietruck-gleizes]
 134989 [host=cubietruck-gleizes]
 135077 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135251 [host=cubietruck-gleizes]
 135449 [host=cubietruck-gleizes]
 135448 [host=cubietruck-gleizes]
 135416 [host=cubietruck-gleizes]
 135828 [host=cubietruck-gleizes]
 135554 [host=cubietruck-gleizes]
 135571 fail irrelevant
 135711 fail irrelevant
 135937 [host=cubietruck-gleizes]
 136029 fail irrelevant
 136211 [host=cubietruck-metzinger]
 136121 fail irrelevant
 136373 [host=cubietruck-metzinger]
 136353 [host=cubietruck-metzinger]
 136319 [host=cubietruck-metzinger]
 136320 fail e329ad2ab72c43b56df88b34954c2c7d839bb373 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136365 [host=cubietruck-metzinger]
 136342 [host=cubietruck-metzinger]
 136308 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136312 fail irrelevant
 136357 [host=cubietruck-metzinger]
 136345 [host=cubietruck-metzinger]
 136313 fail irrelevant
 136325 [host=cubietruck-metzinger]
 136314 fail irrelevant
 136347 [host=cubietruck-metzinger]
 136316 fail irrelevant
 136333 [host=cubietruck-metzinger]
 136318 pass irrelevant
 136334 [host=cubietruck-metzinger]
 136335 [host=cubietruck-metzinger]
 136338 [host=cubietruck-metzinger]
 136339 [host=cubietruck-metzinger]
 136341 [host=cubietruck-metzinger]
 136348 [host=cubietruck-metzinger]
 136383 [host=cubietruck-metzinger]
 136367 [host=cubietruck-metzinger]
 136359 [host=cubietruck-metzinger]
 136363 [host=cubietruck-metzinger]
 136370 [host=cubietruck-metzinger]
 136379 [host=cubietruck-metzinger]
 136382 [host=cubietruck-metzinger]
 136389 [host=cubietruck-metzinger]
 136393 [host=cubietruck-metzinger]
 136396 [host=cubietruck-metzinger]
 136399 [host=cubietruck-metzinger]
 136402 [host=cubietruck-metzinger]
 136443 [host=cubietruck-metzinger]
 136467 [host=cubietruck-metzinger]
 136427 [host=cubietruck-metzinger]
 136456 [host=cubietruck-metzinger]
 136410 [host=cubietruck-metzinger]
 136413 [host=cubietruck-metzinger]
 136436 [host=cubietruck-metzinger]
 136416 [host=cubietruck-metzinger]
 136421 [host=cubietruck-metzinger]
 136439 [host=cubietruck-metzinger]
 136471 [host=cubietruck-metzinger]
 136424 [host=cubietruck-metzinger]
 136479 fail e329ad2ab72c43b56df88b34954c2c7d839bb373 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136486 fail 30302acee710881cb248ec3391adcd54dcf52396 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136472 [host=cubietruck-metzinger]
 136481 fail 04d6556c5c91d6b00c70df7b85e1715a7c7870df e83077a3d11072708a5c38fa09fa9d011914e2a1
 136474 [host=cubietruck-metzinger]
 136458 [host=cubietruck-metzinger]
 136491 fail 574d96933ceff60b2d13fe97602572fc7e95f7c6 dc497635d93f6672f82727ad97a55205177be2aa
 136475 [host=cubietruck-metzinger]
 136482 fail e3b4257d032dede8ffcfe868ffd74bb584842f62 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136487 fail d6de7fed802f2bf42efdc0d081c67dc2ecf01e3f e83077a3d11072708a5c38fa09fa9d011914e2a1
 136476 [host=cubietruck-metzinger]
 136478 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136495 fail 6000531e19964756673a5f4b694a649ef883605a dc497635d93f6672f82727ad97a55205177be2aa
 136488 fail 52ec9dcc1ed5609674e7b52198c18207bb193548 dc497635d93f6672f82727ad97a55205177be2aa
 136483 fail 812b835fb4d23dd108b2f9802158472d50b73579 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136496 pass 06e64339555096a2bc2d08c7e012b36a9977062c dc497635d93f6672f82727ad97a55205177be2aa
 136489 fail f62d632f4328fab02682335ba1ccfdbd9893d33d dc497635d93f6672f82727ad97a55205177be2aa
 136492 fail 22d96eac64877c4d96f9928babb6f2fcc68faacf dc497635d93f6672f82727ad97a55205177be2aa
 136498 pass aaef873b130f4f9c78f8e97b69c235c81b8b8b88 dc497635d93f6672f82727ad97a55205177be2aa
 136502 pass ef5dae6805cce7b59d129d801bdc5db71bcbd60d dc497635d93f6672f82727ad97a55205177be2aa
 136509 pass ede9a8a656c992deecce45f8175985dd81cc6be9 dc497635d93f6672f82727ad97a55205177be2aa
 136512 pass 6739df3fafaa3e2ec37af23fd77d2119869f4a4f dc497635d93f6672f82727ad97a55205177be2aa
 136541 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 dc497635d93f6672f82727ad97a55205177be2aa
 136515 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 9b8b3f300f1f8aa93d7d4590d92bc746ce6412cb
 136545 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 dc497635d93f6672f82727ad97a55205177be2aa
 136521 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 b32c0446b103aa801ee18780b2fdd78dfc0b9052
 136523 pass eeba63fc7fface36f438bcbc0d3b02e7dcb59983 85aea83d46d24eb420235b172cd3f427a8153c18
 136546 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 dc497635d93f6672f82727ad97a55205177be2aa
 136528 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 dc497635d93f6672f82727ad97a55205177be2aa
 136550 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 dc497635d93f6672f82727ad97a55205177be2aa
 136533 fail 3432c79a4e7345818d2defcf9e61a1bcb2907f9f dc497635d93f6672f82727ad97a55205177be2aa
 136535 fail ef9aae2522c22c05df17dd898099dd5c3f20d688 dc497635d93f6672f82727ad97a55205177be2aa
 136536 fail 5bcf8ed9401e62c73158ba110864ee1375558bf7 dc497635d93f6672f82727ad97a55205177be2aa
 136539 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 dc497635d93f6672f82727ad97a55205177be2aa
Searching for interesting versions
 Result found: flight 135077 (pass), for basis pass
 Result found: flight 136320 (fail), for basis failure
 Repro found: flight 136478 (pass), for basis pass
 Repro found: flight 136479 (fail), for basis failure
 0 revisions at aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 dc497635d93f6672f82727ad97a55205177be2aa
No revisions left to test, checking graph state.
 Result found: flight 136528 (pass), for last pass
 Result found: flight 136539 (fail), for first failure
 Repro found: flight 136541 (pass), for last pass
 Repro found: flight 136545 (fail), for first failure
 Repro found: flight 136546 (pass), for last pass
 Repro found: flight 136550 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136550/


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

pnmtopng: 207 colors found
Revision graph left in /home/logs/results/bisect/qemu-mainline/build-armhf.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
136550: tolerable ALL FAIL

flight 136550 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136550/

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



--===============4268396330381012660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4268396330381012660==--
