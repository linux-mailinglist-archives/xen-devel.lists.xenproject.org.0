Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1A4CC6A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 20:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283717.482821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPraz-0008S6-NV; Thu, 03 Mar 2022 19:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283717.482821; Thu, 03 Mar 2022 19:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPraz-0008Q4-J1; Thu, 03 Mar 2022 19:58:41 +0000
Received: by outflank-mailman (input) for mailman id 283717;
 Thu, 03 Mar 2022 19:58:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPray-0008Ps-08; Thu, 03 Mar 2022 19:58:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPrax-0004wY-S2; Thu, 03 Mar 2022 19:58:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPrax-0002ak-AK; Thu, 03 Mar 2022 19:58:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nPrax-0005oz-9u; Thu, 03 Mar 2022 19:58:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=iqu1jRfZ+zSLX5klLS+l4RYKAblJMv3/oTNGacSJZiU=; b=ul0NYwwAUmNp0bwYKc9i0z+8KX
	XyCEwXNx3lWpBSvkcA7r7vPCpq6h8Hak+izxeV746YY2VhDMxW6JAZ9MDCAsv0bD3yWQ89v6iYIbe
	bgRDC5c5KpiORT6Oogg0uIn/7/OPYzIEH802yHqvX5TzVz8m04u+UGCBn8Qb8xHw5Zj8=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete build-i386-xsm
Message-Id: <E1nPrax-0005oz-9u@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Mar 2022 19:58:39 +0000

branch xen-unstable
xenbranch xen-unstable
job build-i386-xsm
testid xen-build

Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d3febfd9ade35dc552df6b3607c2b15d26b82867
  Bug not present: 84338c0d498555f860a480693ee8647a1795fba3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168382/


  commit d3febfd9ade35dc552df6b3607c2b15d26b82867
  Author: Jason <yun.lou@intel.com>
  Date:   Mon Jan 10 21:46:27 2022 +0800
  
      MdePkg: Replace Opcode with the corresponding instructions.
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
      
      Replace Opcode with the corresponding instructions.
      The code changes have been verified with CompareBuild.py tool, which
      can be used to compare the results of two different EDK II builds to
      determine if they generate the same binaries.
      (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
      
      Signed-off-by: Jason Lou <yun.lou@intel.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
      Cc: Zhiguang Liu <zhiguang.liu@intel.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-i386-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386-xsm.xen-build --summary-out=tmp/168382.bisection-summary --basis-template=168254 --blessings=real,real-bisect,real-retry ovmf build-i386-xsm xen-build
Searching for failure / basis pass:
 168377 fail [host=elbling0] / 168254 [host=albana0] 168249 [host=huxelrebe0] 168232 [host=huxelrebe0] 168185 [host=huxelrebe0] 168131 [host=albana0] 168127 [host=huxelrebe0] 168119 [host=albana0] 168115 [host=huxelrebe1] 168074 [host=huxelrebe0] 168048 [host=albana0] 168046 [host=huxelrebe0] 168043 [host=huxelrebe0] 168042 [host=chardonnay1] 168038 [host=huxelrebe0] 168017 [host=albana0] 167989 [host=huxelrebe1] 167980 [host=albana1] 167976 [host=huxelrebe0] 167956 [host=huxelrebe1] 167950 [hos\
 t=albana0] 167946 [host=fiano0] 167940 [host=albana0] 167933 [host=albana0] 167929 [host=huxelrebe1] 167919 [host=elbling1] 167907 [host=albana1] 167803 [host=huxelrebe0] 167775 [host=albana0] 167760 [host=fiano0] 167754 [host=albana0] 167729 [host=albana1] 167727 [host=huxelrebe0] 167689 [host=fiano0] 167685 [host=chardonnay1] 167651 [host=albana0] 167636 [host=fiano0] 167627 [host=albana0] 167601 [host=albana1] 167598 [host=huxelrebe0] 167559 [host=huxelrebe0] 167555 [host=huxelrebe0] 167552 [\
 host=albana0] 167535 [host=chardonnay1] 167527 [host=chardonnay1] 167522 [host=huxelrebe0] 167513 [host=albana1] 167487 [host=huxelrebe1] 167465 [host=albana1] 167463 [host=huxelrebe0] 167450 [host=fiano1] 167445 [host=chardonnay0] 167436 [host=pinot0] 167419 [host=huxelrebe1] 167414 [host=albana1] 167409 [host=albana0] 167394 [host=albana1] 167393 [host=albana1] 167392 [host=albana1] 167391 [host=albana1] 167379 [host=huxelrebe0] 167377 [host=huxelrebe1] 167239 [host=huxelrebe0] 167237 [host=al\
 bana0] 167231 [host=albana0] 167225 [host=albana0] 167122 [host=huxelrebe1] 167104 [host=albana0] 167081 [host=albana0] 166961 [host=albana0] 166951 [host=pinot0] 166949 [host=pinot0] 166826 [host=albana0] 166360 ok.
Failure / basis pass flights: 168377 / 166360
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
Basis pass 4c7ce0d285bc7fd593718fd5dec02e136cbfad8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 be12fcca8b784e456df3adedbffe657d753c5ff9
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#4c7ce0d285bc7fd593718fd5dec02e136cbfad8e-589d51df260465e2561979b8a988e77b0f32a6e8 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b6e539830bf45e2d7a6bd86ddfdf003088b173b0-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/osstest/seabios.git#64f37cc530f144e53c190c9e8209a51b58fd5c\
 43-d239552ce7220e448ae81f41515138f7b9e3c4db git://xenbits.xen.org/xen.git#be12fcca8b784e456df3adedbffe657d753c5ff9-faecea18d252f97c6ad41f0f457566ff2c125b8d
From git://cache:9419/git://xenbits.xen.org/xen
   4b7fd8153d..3e56754b08  smoke      -> origin/smoke
   3e56754b08..b692523faf  staging    -> origin/staging
Loaded 77186 nodes in revision graph
Searching for test results:
 167344 [host=huxelrebe0]
 167345 [host=huxelrebe0]
 167346 [host=huxelrebe0]
 167347 [host=huxelrebe0]
 167349 [host=huxelrebe1]
 167350 [host=huxelrebe0]
 167352 [host=huxelrebe1]
 167353 [host=huxelrebe0]
 167354 [host=huxelrebe0]
 167355 [host=huxelrebe1]
 167356 [host=huxelrebe1]
 167358 [host=huxelrebe1]
 167360 [host=huxelrebe0]
 167363 [host=huxelrebe0]
 167364 [host=huxelrebe0]
 167365 [host=huxelrebe0]
 167366 [host=huxelrebe0]
 167367 [host=huxelrebe0]
 167368 [host=huxelrebe0]
 167369 [host=huxelrebe0]
 167370 [host=huxelrebe1]
 167371 [host=huxelrebe1]
 167373 [host=huxelrebe1]
 167374 [host=huxelrebe1]
 167375 [host=huxelrebe1]
 167376 [host=huxelrebe1]
 167377 [host=huxelrebe1]
 167379 [host=huxelrebe0]
 167225 [host=albana0]
 167231 [host=albana0]
 167237 [host=albana0]
 167239 [host=huxelrebe0]
 167240 [host=huxelrebe0]
 167242 [host=huxelrebe1]
 167247 [host=huxelrebe1]
 167253 [host=huxelrebe0]
 167258 [host=huxelrebe0]
 167257 [host=huxelrebe1]
 167259 [host=huxelrebe0]
 167260 [host=huxelrebe0]
 167261 [host=huxelrebe0]
 167262 [host=huxelrebe0]
 167263 [host=huxelrebe0]
 167264 [host=huxelrebe0]
 167265 [host=huxelrebe0]
 167266 [host=huxelrebe0]
 167391 [host=albana1]
 167392 [host=albana1]
 167393 [host=albana1]
 167394 [host=albana1]
 167409 [host=albana0]
 167414 [host=albana1]
 167419 [host=huxelrebe1]
 167081 [host=albana0]
 167104 [host=albana0]
 167268 [host=huxelrebe0]
 167267 [host=huxelrebe0]
 167269 [host=huxelrebe0]
 167270 [host=huxelrebe0]
 167271 [host=huxelrebe0]
 167273 [host=huxelrebe0]
 167275 [host=huxelrebe1]
 167279 [host=huxelrebe0]
 167283 [host=huxelrebe0]
 167285 [host=huxelrebe0]
 167288 [host=huxelrebe0]
 167293 [host=huxelrebe1]
 167297 [host=huxelrebe1]
 167300 [host=huxelrebe1]
 167303 [host=huxelrebe1]
 167306 [host=huxelrebe1]
 167309 [host=huxelrebe0]
 167122 [host=huxelrebe1]
 166826 [host=albana0]
 167272 [host=huxelrebe0]
 167465 [host=albana1]
 167487 [host=huxelrebe1]
 167314 [host=huxelrebe0]
 167319 [host=huxelrebe1]
 167324 [host=huxelrebe1]
 167330 [host=huxelrebe1]
 167334 [host=huxelrebe1]
 167335 [host=huxelrebe1]
 167338 [host=huxelrebe1]
 167339 [host=huxelrebe1]
 167340 [host=huxelrebe0]
 167341 [host=huxelrebe0]
 167342 [host=huxelrebe0]
 166360 pass 4c7ce0d285bc7fd593718fd5dec02e136cbfad8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 be12fcca8b784e456df3adedbffe657d753c5ff9
 167436 [host=pinot0]
 167445 [host=chardonnay0]
 167450 [host=fiano1]
 167463 [host=huxelrebe0]
 166949 [host=pinot0]
 166951 [host=pinot0]
 166961 [host=albana0]
 167513 [host=albana1]
 167522 [host=huxelrebe0]
 167527 [host=chardonnay1]
 167535 [host=chardonnay1]
 167552 [host=albana0]
 167555 [host=huxelrebe0]
 167559 [host=huxelrebe0]
 167598 [host=huxelrebe0]
 167601 [host=albana1]
 167627 [host=albana0]
 167636 [host=fiano0]
 167651 [host=albana0]
 167685 [host=chardonnay1]
 167689 [host=fiano0]
 167727 [host=huxelrebe0]
 167729 [host=albana1]
 167754 [host=albana0]
 167760 [host=fiano0]
 167775 [host=albana0]
 167803 [host=huxelrebe0]
 167907 [host=albana1]
 167919 [host=elbling1]
 167929 [host=huxelrebe1]
 167933 [host=albana0]
 167940 [host=albana0]
 167946 [host=fiano0]
 167950 [host=albana0]
 167956 [host=huxelrebe1]
 167976 [host=huxelrebe0]
 167980 [host=albana1]
 167989 [host=huxelrebe1]
 168017 [host=albana0]
 168046 [host=huxelrebe0]
 168038 [host=huxelrebe0]
 168042 [host=chardonnay1]
 168043 [host=huxelrebe0]
 168048 [host=albana0]
 168074 [host=huxelrebe0]
 168115 [host=huxelrebe1]
 168119 [host=albana0]
 168127 [host=huxelrebe0]
 168131 [host=albana0]
 168185 [host=huxelrebe0]
 168232 [host=huxelrebe0]
 168249 [host=huxelrebe0]
 168254 [host=albana0]
 168258 [host=elbling1]
 168262 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168267 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168271 [host=elbling1]
 168285 [host=elbling1]
 168290 [host=elbling1]
 168295 [host=elbling1]
 168299 [host=elbling1]
 168303 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168308 [host=elbling1]
 168312 [host=elbling1]
 168314 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd e0a514d2f4b2fcb51835aa9a9b02653b491a61fc
 168316 fail irrelevant
 168320 fail irrelevant
 168329 [host=elbling1]
 168333 [host=elbling1]
 168340 fail irrelevant
 168362 pass b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 991a06d71a73cae097a55e60f38c2ae38ef36e10
 168344 fail irrelevant
 168352 fail dc39554d58af4a50b50eca1f57c49415a12b0c98 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168351 pass 4c7ce0d285bc7fd593718fd5dec02e136cbfad8e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 64f37cc530f144e53c190c9e8209a51b58fd5c43 be12fcca8b784e456df3adedbffe657d753c5ff9
 168357 pass 5801910013757bd626f67ed77eea6c16a176eebf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 d05c67efd94f301b48bc486246161b05acaa8df2
 168356 fail b422b0fcf92dd4103dfc16d8d5f77fbec2d8c5b9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168358 pass ee1f8262b83dd88b30091e6e81221ff299796099 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 98dd53b99442ae15d78125b4453b1adc926e9ff3 8e3edefb880caeeaaf80123d5599139e8c2c9ecf
 168359 fail 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168360 pass b360b0b589697da267f5d3a553e65635b91ebae2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 10d33220f2363a21a52a394159118ab4ddaed50e
 168363 pass b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd e826cf735171ad032901abdc4a1c46ecca401562
 168364 fail 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168365 pass b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 109980738e1449f5f281e5d6bfb5681eb9defea6
 168367 pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd f7b7e2b9add53780e44e8f8c165c2281258ae367
 168366 fail 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168368 pass b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168371 fail 7bc8b1d9f412507d579f21ea9af56fced81e7827 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168373 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168372 fail 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168375 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168378 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168379 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168377 fail 589d51df260465e2561979b8a988e77b0f32a6e8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db faecea18d252f97c6ad41f0f457566ff2c125b8d
 168380 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168382 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
Searching for interesting versions
 Result found: flight 166360 (pass), for basis pass
 For basis failure, parent search stopping at 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07, results HASH(0x55577f747520) HASH(0x55577f707270) HASH(0x55577f731358) For basis failure, parent search stopping at b1b89f9009f2390652e0061bd7b24fc40732bc70 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7\
 cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07, results HASH(0x55577f71d138) For basis failure, parent search stopping at 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd f7b7e2b9add53780e44e8f8c165c2281258ae367, results HASH(0x55577b0f44f8) For basis failure, parent search stopping at b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 109980738e1449f5f281e5d6bfb5681eb9defea6, results HASH(0x55577f73c8d0) For basis failure, parent search stopping at b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd e826cf735171ad032901abdc4a1c46ecca401562, results HASH(0x55577f71d438) For basis failure, parent search stopping at b24306f15daa\
 2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 991a06d71a73cae097a55e60f38c2ae38ef36e10, results HASH(0x55577b0f5038) For basis failure, parent search stopping at b360b0b589697da267f5d3a553e65635b91ebae2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 10d33220f2363a21a52a394159118ab4ddaed50e, results HASH(0x55577f74b14\
 0) Result found: flight 168262 (fail), for basis failure (at ancestor ~347)
 Repro found: flight 168351 (pass), for basis pass
 Repro found: flight 168359 (fail), for basis failure
 0 revisions at 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
No revisions left to test, checking graph state.
 Result found: flight 168373 (pass), for last pass
 Result found: flight 168375 (fail), for first failure
 Repro found: flight 168378 (pass), for last pass
 Repro found: flight 168379 (fail), for first failure
 Repro found: flight 168380 (pass), for last pass
 Repro found: flight 168382 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d3febfd9ade35dc552df6b3607c2b15d26b82867
  Bug not present: 84338c0d498555f860a480693ee8647a1795fba3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168382/


  commit d3febfd9ade35dc552df6b3607c2b15d26b82867
  Author: Jason <yun.lou@intel.com>
  Date:   Mon Jan 10 21:46:27 2022 +0800
  
      MdePkg: Replace Opcode with the corresponding instructions.
      
      REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3790
      
      Replace Opcode with the corresponding instructions.
      The code changes have been verified with CompareBuild.py tool, which
      can be used to compare the results of two different EDK II builds to
      determine if they generate the same binaries.
      (tool link: https://github.com/mdkinney/edk2/tree/sandbox/CompareBuild)
      
      Signed-off-by: Jason Lou <yun.lou@intel.com>
      Cc: Michael D Kinney <michael.d.kinney@intel.com>
      Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
      Cc: Zhiguang Liu <zhiguang.liu@intel.com>

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.673331 to fit
pnmtopng: 93 colors found
Revision graph left in /home/logs/results/bisect/ovmf/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
168382: tolerable ALL FAIL

flight 168382 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/168382/

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


