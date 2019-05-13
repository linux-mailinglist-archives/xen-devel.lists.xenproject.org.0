Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD71B143
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 09:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ5Sq-0005A6-Mp; Mon, 13 May 2019 07:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=armk=TN=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hQ5So-00059p-Ov
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 07:33:34 +0000
X-Inumbo-ID: 667d53a8-7551-11e9-9796-cfa1be792a07
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 667d53a8-7551-11e9-9796-cfa1be792a07;
 Mon, 13 May 2019 07:33:28 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hQ5Sh-0006xx-Qz; Mon, 13 May 2019 07:33:27 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hQ5Sh-0001uj-KK; Mon, 13 May 2019 07:33:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hQ5Sh-0004IY-Jc; Mon, 13 May 2019 07:33:27 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hQ5Sh-0004IY-Jc@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 13 May 2019 07:33:27 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-arm64-xsm
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
Content-Type: multipart/mixed; boundary="===============5236827738137804069=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5236827738137804069==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-xsm
testid xen-build

Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136168/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build --summary-out=tmp/136168.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-arm64-xsm xen-build
Searching for failure / basis pass:
 136029 fail [host=laxton1] / 135416 [host=laxton0] 135251 [host=rochester0] 135077 [host=rochester0] 134989 [host=rochester0] 134899 [host=rochester0] 134745 [host=rochester0] 133997 ok.
Failure / basis pass flights: 136029 / 133997
(tree in latest but not in basispass: ovmf)
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest efb4f3b62c69383a7308d7b739a3193e7c0ccae8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Basis pass d97a39d903fe33c45be83ac6943a2f82a3649a11 59e9783ddf18e650622e0573cad4f08db65592e4
Generating revisions with ./adhoc-revtuple-generator  git://git.qemu.org/qemu.git#d97a39d903fe33c45be83ac6943a2f82a3649a11-efb4f3b62c69383a7308d7b739a3193e7c0ccae8 git://xenbits.xen.org/xen.git#59e9783ddf18e650622e0573cad4f08db65592e4-cb70a26f78848fe45f593f7ebc9cfaac760a791b
Loaded 7990 nodes in revision graph
Searching for test results:
 133997 pass d97a39d903fe33c45be83ac6943a2f82a3649a11 59e9783ddf18e650622e0573cad4f08db65592e4
 134745 [host=rochester0]
 134899 [host=rochester0]
 134989 [host=rochester0]
 135077 [host=rochester0]
 135251 [host=rochester0]
 135448 fail f75d15231e56cb0f2bafe19faf1229c459a60731 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135416 [host=laxton0]
 135828 fail a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135571 fail 8482ff2eb3bb95020eb2f370a9b3ea26511e41df cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135711 fail a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135937 [host=laxton0]
 136029 fail efb4f3b62c69383a7308d7b739a3193e7c0ccae8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136112 [host=laxton0]
 136096 [host=laxton0]
 136146 pass be1092afa07794e5247eb504095fb5f2ae421ec6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136139 pass ab63817119b03b95f7dce6fae036e6d063ad63fb cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136113 [host=laxton0]
 136099 [host=laxton0]
 136104 [host=laxton0]
 136129 pass 6739df3fafaa3e2ec37af23fd77d2119869f4a4f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136105 [host=laxton0]
 136151 pass c99ef792dc9ec6d8a5061428faf396ea9ceb8f57 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136115 [host=laxton0]
 136130 pass 93e32b3e2012a668e4da1c2566d2935c24060435 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136140 pass d013283a46e1f197594e76ed320f867067ab80b3 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136118 [host=laxton0]
 136147 pass 7d5489e6d15e2922e45a41e4808d03a48457a5ee cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136119 pass d97a39d903fe33c45be83ac6943a2f82a3649a11 59e9783ddf18e650622e0573cad4f08db65592e4
 136131 pass 6fabae61a9393fd2bc703837e464b9c34ec5ef25 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136107 [host=laxton0]
 136122 fail efb4f3b62c69383a7308d7b739a3193e7c0ccae8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136109 [host=laxton0]
 136110 [host=laxton0]
 136141 pass 2bcd05cf24a7de34e7e265247c010977e43f40bc cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136123 fail 82b2865e0d0ea4c1001e9e7ed7920bcc0458f6de cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136111 [host=laxton0]
 136133 pass 9749636b005d118259810afb92482df2fe0ae2ad cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136124 pass f7526eece29cd2e36a63b6703508b24453095eb8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136134 pass 4560116e42a21989a4b6cf9551ce2f90b16c7238 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136125 pass db7f1c3fafa8e1d23ecb212454f9d83ac59e411b cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136155 pass c503849bb5400cc4a7a293603067e8f995e46280 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136126 pass 9ec34ecc97bcd5df04b0f67a774d79ffcd6b0a11 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136142 pass 7357b2215978debf2fd17b525ba745d3c69272a3 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136127 pass ede9a8a656c992deecce45f8175985dd81cc6be9 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136135 pass 065e6298a75164b4347682b63381dbe752c2b156 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136148 pass ab79237a15e8f8c23310291b672d83374cf17935 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136136 pass 248987f92cfda8305d6d44ced23e173e62a8bc0e cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136143 pass bc939abe00cd7c34bfd9412af3fffff40132dd50 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136137 pass c19f2b711e15dac4c2cdbace2f8fb3a45fbed0d2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136153 pass 2ef80e14d526f50c4b751d1f15b5ca450d7f997f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136149 pass 84bdc58c06c889d94dba6cd9f023a39757f7dc41 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136144 pass 436960c95946007aca713330e7a488a6f2e0696f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136145 pass 75d34eb98ca0bb2f49d607fcaefd9c482e56b15d cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136161 pass ed960ba90549aca1735df128c6b454fe0a5dec2a cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136159 fail 6808c4d2d2826920087533f517472c09edc7b0d2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136154 pass c6e3f520c802c5cb2de80576aba7f9f1fe985d8b cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136150 pass 12f067cc14b90aef60b2b7d03e1df74cc50a0459 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136157 pass 061b51e9195670e9d190cdec46fabcb3c77763fb cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136164 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136160 fail 84d2e3e2ae76fdb0c8f3063fa8c46c8ce14ab201 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136158 pass 1768987b73fa7e23e58b7844abe5882490ff8e42 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136163 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136162 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136167 pass aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136168 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136166 fail 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Searching for interesting versions
 Result found: flight 133997 (pass), for basis pass
 Result found: flight 136029 (fail), for basis failure
 Repro found: flight 136119 (pass), for basis pass
 Repro found: flight 136122 (fail), for basis failure
 0 revisions at aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
No revisions left to test, checking graph state.
 Result found: flight 136162 (pass), for last pass
 Result found: flight 136163 (fail), for first failure
 Repro found: flight 136164 (pass), for last pass
 Repro found: flight 136166 (fail), for first failure
 Repro found: flight 136167 (pass), for last pass
 Repro found: flight 136168 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136168/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-arm64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
136168: tolerable ALL FAIL

flight 136168 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136168/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-xsm               6 xen-build               fail baseline untested


jobs:
 build-arm64-xsm                                              fail    


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



--===============5236827738137804069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5236827738137804069==--
