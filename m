Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD31A847
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 17:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPU2a-0007Rb-6K; Sat, 11 May 2019 15:36:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hTTx=TL=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hPU2Y-0007RR-MB
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 15:35:58 +0000
X-Inumbo-ID: 783b0589-7402-11e9-8980-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 783b0589-7402-11e9-8980-bc764e045a96;
 Sat, 11 May 2019 15:35:56 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hPU2W-00026h-0x; Sat, 11 May 2019 15:35:56 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hPU2V-0003Mo-Nb; Sat, 11 May 2019 15:35:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hPU2V-0002Yg-Mx; Sat, 11 May 2019 15:35:55 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hPU2V-0002Yg-Mx@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 May 2019 15:35:55 +0000
Subject: [Xen-devel] [qemu-mainline bisection] complete build-amd64-xsm
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
Content-Type: multipart/mixed; boundary="===============7433077184394379703=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7433077184394379703==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136044/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build --summary-out=tmp/136044.bisection-summary --basis-template=135251 --blessings=real,real-bisect qemu-mainline build-amd64-xsm xen-build
Searching for failure / basis pass:
 135937 fail [host=godello0] / 135416 [host=albana1] 135251 [host=italia1] 135077 [host=albana1] 134989 [host=albana0] 134899 [host=chardonnay0] 134745 [host=albana1] 133997 [host=godello1] 133975 [host=godello1] 133939 [host=godello1] 133909 [host=merlot0] 133872 ok.
Failure / basis pass flights: 135937 / 133872
(tree with no url: minios)
(tree with no url: seabios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Basis pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 8b088d3f8ab5642020d28fa0c2a8d938bc5f3592 4deeaf2a3ee50b096426eea41a4c9b96ded0f029
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#ef529e6ab7c31290a33045bb1f1837447cc0eb56-fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://git.qemu.org/qemu.git#8b088d3f8ab5642020d28fa0c2a8d938bc5f3592-df06df4f412a67341de0fbb075e74c4dde3c8972 git://xenbits.xen.org/xen.git#4deeaf2a3ee50b096426eea41a4c9b96ded0f029-cb70a26f78848fe\
 45f593f7ebc9cfaac760a791b
adhoc-revtuple-generator: tree discontiguous: ovmf
Loaded 7447 nodes in revision graph
Searching for test results:
 133844 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 8b088d3f8ab5642020d28fa0c2a8d938bc5f3592 4deeaf2a3ee50b096426eea41a4c9b96ded0f029
 133845 pass irrelevant
 133866 pass irrelevant
 133873 pass irrelevant
 133895 [host=albana0]
 133872 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 8b088d3f8ab5642020d28fa0c2a8d938bc5f3592 4deeaf2a3ee50b096426eea41a4c9b96ded0f029
 133909 [host=merlot0]
 133939 [host=godello1]
 133975 [host=godello1]
 133997 [host=godello1]
 134221 [host=chardonnay1]
 134212 [host=chardonnay1]
 134257 [host=godello1]
 134223 [host=merlot1]
 134230 [host=merlot1]
 134214 [host=chardonnay1]
 134225 [host=merlot1]
 134210 [host=chardonnay1]
 134243 [host=godello1]
 134217 [host=merlot1]
 134226 [host=albana1]
 134220 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 4158e93f4aced247c8db94a0275fc027da7dc97e a892f81ddecf0ad90564a4d91d520234c542b068
 134239 pass irrelevant
 134247 pass irrelevant
 134235 [host=pinot1]
 134227 [host=merlot0]
 134232 [host=godello1]
 134238 [host=godello1]
 134244 [host=albana1]
 134241 pass irrelevant
 134245 [host=merlot0]
 134249 [host=pinot1]
 134253 [host=godello1]
 134256 [host=merlot0]
 134260 [host=godello1]
 134263 [host=godello1]
 134265 [host=chardonnay1]
 134269 [host=merlot0]
 134275 [host=baroque0]
 134276 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 86e2fca2d7f163c50b80254e0afdd4e16378b3bb 17f74242ccf0ce6e51c03a5860947865c0ef0dc2
 134280 [host=albana0]
 134281 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 b69864e5a8c7b762e94d1bfd170b8774b28ab993 a892f81ddecf0ad90564a4d91d520234c542b068
 134284 [host=debina1]
 134285 [host=godello1]
 134424 [host=chardonnay1]
 134427 pass irrelevant
 134481 [host=albana1]
 134498 [host=godello1]
 134500 [host=albana1]
 134501 [host=chardonnay0]
 134503 [host=albana0]
 134505 [host=albana1]
 134745 [host=albana1]
 134799 [host=godello1]
 134806 [host=chardonnay1]
 134812 [host=merlot0]
 134819 [host=merlot0]
 134847 [host=albana0]
 134824 [host=albana0]
 134851 [host=godello1]
 134831 [host=fiano0]
 134899 [host=chardonnay0]
 134853 [host=albana0]
 134836 [host=elbling0]
 134991 [host=albana1]
 134989 [host=albana0]
 134990 [host=albana0]
 135077 [host=albana1]
 135251 [host=italia1]
 135448 [host=godello1]
 135416 [host=albana1]
 135828 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135944 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 574d96933ceff60b2d13fe97602572fc7e95f7c6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135946 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 22d96eac64877c4d96f9928babb6f2fcc68faacf cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135571 [host=godello1]
 135711 [host=godello1]
 135871 [host=godello1]
 135933 [host=godello1]
 135925 [host=godello1]
 135929 [host=godello1]
 135932 [host=godello1]
 135934 [host=godello1]
 135939 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 8b088d3f8ab5642020d28fa0c2a8d938bc5f3592 4deeaf2a3ee50b096426eea41a4c9b96ded0f029
 135940 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 a6ae23831b05a11880b40f7d58e332c45a6b04f7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135941 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 f62d632f4328fab02682335ba1ccfdbd9893d33d cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135942 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 e6e90feedb706b1b92827a5977b37e1e8defb8ef cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135951 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 6000531e19964756673a5f4b694a649ef883605a cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135999 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7d5489e6d15e2922e45a41e4808d03a48457a5ee cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135975 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 d013283a46e1f197594e76ed320f867067ab80b3 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135952 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 f7526eece29cd2e36a63b6703508b24453095eb8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135954 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 db7f1c3fafa8e1d23ecb212454f9d83ac59e411b cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136015 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 c503849bb5400cc4a7a293603067e8f995e46280 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135956 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 9ec34ecc97bcd5df04b0f67a774d79ffcd6b0a11 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135957 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 ede9a8a656c992deecce45f8175985dd81cc6be9 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135980 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 2bcd05cf24a7de34e7e265247c010977e43f40bc cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136025 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 1702071302934af77a072b7ee7c5eadc45b37573 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135959 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 6739df3fafaa3e2ec37af23fd77d2119869f4a4f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135983 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7357b2215978debf2fd17b525ba745d3c69272a3 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135961 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 93e32b3e2012a668e4da1c2566d2935c24060435 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136016 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 adb3321bfdeabeeb32b5ec545043a3f5f9fd8a7e cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135962 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 6fabae61a9393fd2bc703837e464b9c34ec5ef25 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135984 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 bc939abe00cd7c34bfd9412af3fffff40132dd50 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136003 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 ab79237a15e8f8c23310291b672d83374cf17935 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135965 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 9749636b005d118259810afb92482df2fe0ae2ad cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135986 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 436960c95946007aca713330e7a488a6f2e0696f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135967 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 4560116e42a21989a4b6cf9551ce2f90b16c7238 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135968 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 065e6298a75164b4347682b63381dbe752c2b156 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135970 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 248987f92cfda8305d6d44ced23e173e62a8bc0e cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136005 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 84bdc58c06c889d94dba6cd9f023a39757f7dc41 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135972 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 c19f2b711e15dac4c2cdbace2f8fb3a45fbed0d2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135974 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 ab63817119b03b95f7dce6fae036e6d063ad63fb cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136017 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 7849f0c2ecf35f04c8dfcea30f675182cafdd455 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135989 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 75d34eb98ca0bb2f49d607fcaefd9c482e56b15d cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135937 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136008 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 12f067cc14b90aef60b2b7d03e1df74cc50a0459 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 135995 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 be1092afa07794e5247eb504095fb5f2ae421ec6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136038 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136009 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 c99ef792dc9ec6d8a5061428faf396ea9ceb8f57 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136018 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 50ccc488b0d4c3b8e2790c18bcd7329fc609a1c6 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136030 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 5bcf8ed9401e62c73158ba110864ee1375558bf7 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136010 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 2ef80e14d526f50c4b751d1f15b5ca450d7f997f cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136037 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136011 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 199f8d94be106f20dfce23fa4e157fc8d55fd494 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136020 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 9b198f935a7a78ca4962f9ad62bf5f5a9910e6b6 59e9783ddf18e650622e0573cad4f08db65592e4
 136014 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 905870b53c031e4350cd1fbfc8d5010d25c8f6f8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136022 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 dec9776049e32d6c830127b286530c5f53267eff cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136023 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 a9b305ba291fb74f7ff732b3d7b8f4c812431ddf cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136033 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 c637044120705004b792ecf29e6b4be41e20c4c8 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136024 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 e0fb2c3d89aa77057ac4aa073e01f4ca484449b0 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136027 fail fbb0ec7ea4c0d1e9e397fe898fb7d69de0779084 d0d8ad39ecb51cd7497cd524484fe09f50876798 df06df4f412a67341de0fbb075e74c4dde3c8972 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136042 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136044 fail ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 79d77bcd366190a81d092177e4f84d34b7a56fc2 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136040 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
 136043 pass ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
Searching for interesting versions
 Result found: flight 133844 (pass), for basis pass
 Result found: flight 135937 (fail), for basis failure
 Repro found: flight 135939 (pass), for basis pass
 Repro found: flight 136027 (fail), for basis failure
 0 revisions at ef529e6ab7c31290a33045bb1f1837447cc0eb56 d0d8ad39ecb51cd7497cd524484fe09f50876798 aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833 cb70a26f78848fe45f593f7ebc9cfaac760a791b
No revisions left to test, checking graph state.
 Result found: flight 136037 (pass), for last pass
 Result found: flight 136038 (fail), for first failure
 Repro found: flight 136040 (pass), for last pass
 Repro found: flight 136042 (fail), for first failure
 Repro found: flight 136043 (pass), for last pass
 Repro found: flight 136044 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  79d77bcd366190a81d092177e4f84d34b7a56fc2
  Bug not present: aa64cfaeb4ad0e67ccb54fa20511d7a36db9d833
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136044/


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

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
136044: tolerable ALL FAIL

flight 136044 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136044/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-xsm               6 xen-build               fail baseline untested


jobs:
 build-amd64-xsm                                              fail    


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



--===============7433077184394379703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7433077184394379703==--
