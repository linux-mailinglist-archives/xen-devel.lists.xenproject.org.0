Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84E1405F
	for <lists+xen-devel@lfdr.de>; Sun,  5 May 2019 16:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNIMw-0003Ck-CT; Sun, 05 May 2019 14:43:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+Pe=TF=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hNIMv-0003CY-Ad
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 14:43:57 +0000
X-Inumbo-ID: 35887891-6f44-11e9-843c-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35887891-6f44-11e9-843c-bc764e045a96;
 Sun, 05 May 2019 14:43:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hNIMs-0003DN-WD; Sun, 05 May 2019 14:43:55 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hNIMs-0003Fa-Ip; Sun, 05 May 2019 14:43:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hNIMs-0008SP-IC; Sun, 05 May 2019 14:43:54 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hNIMs-0008SP-IC@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 May 2019 14:43:54 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-i386-xsm
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
Content-Type: multipart/mixed; boundary="===============7097491545567584410=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7097491545567584410==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/135763/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build --summary-out=tmp/135763.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-i386-xsm xen-build
Searching for failure / basis pass:
 135571 fail [host=elbling1] / 135416 ok.
Failure / basis pass flights: 135571 / 135416
(tree with no url: minios)
(tree with no url: seabios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 8482ff2eb3bb95020eb2f370a9b3ea26511e41df cb70a26f78848fe45f593f7ebc9cfaac760a791b
Basis pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#20029ca22baaeb9418c1fd9df88d12d32d585cb6-20029ca22baaeb9418c1fd9df88d12d32d585cb6 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#e0fb2c3d89aa77057ac4aa073e01f4ca484449b0-8482ff2eb3bb95020eb2f370a9b3ea26511e41df git://xenbits.xen.org/xen.git#cb70a26f78848fe45f593f7ebc9cfaac760a791b-cb70a26f78848fe\
 45f593f7ebc9cfaac760a791b
Loaded 1009 nodes in revision graph
Searching for test results:
 135448 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 f75d15231e56cb0f2bafe19faf1229c459a60731 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135416 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135586 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135571 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 8482ff2eb3bb95020eb2f370a9b3ea26511e41df cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135707 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 f75d15231e56cb0f2bafe19faf1229c459a60731 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135713 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 22d96eac64877c4d96f9928babb6f2fcc68faacf cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135710 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 8482ff2eb3bb95020eb2f370a9b3ea26511e41df cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135720 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 6000531e19964756673a5f4b694a649ef883605a cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135724 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 1702071302934af77a072b7ee7c5eadc45b37573 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135748 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135727 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 5bcf8ed9401e62c73158ba110864ee1375558bf7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135729 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 c637044120705004b792ecf29e6b4be41e20c4c8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135733 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135735 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135754 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135741 pass 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135763 fail 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Searching for interesting versions
 Result found: flight 135416 (pass), for basis pass
 Result found: flight 135571 (fail), for basis failure
 Repro found: flight 135586 (pass), for basis pass
 Repro found: flight 135710 (fail), for basis failure
 0 revisions at 20029ca22baaeb9418c1fd9df88d12d32d585cb6 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
No revisions left to test, checking graph state.
 Result found: flight 135733 (pass), for last pass
 Result found: flight 135735 (fail), for first failure
 Repro found: flight 135741 (pass), for last pass
 Repro found: flight 135748 (fail), for first failure
 Repro found: flight 135754 (pass), for last pass
 Repro found: flight 135763 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/135763/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
135763: tolerable ALL FAIL

flight 135763 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/135763/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-xsm                6 xen-build               fail baseline untested


jobs:
 build-i386-xsm                                               fail    


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



--===============7097491545567584410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7097491545567584410==--
