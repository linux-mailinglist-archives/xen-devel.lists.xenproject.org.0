Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33951B69E
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 05:36:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321359.542334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmSH7-0006f8-3X; Thu, 05 May 2022 03:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321359.542334; Thu, 05 May 2022 03:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmSH7-0006bd-0J; Thu, 05 May 2022 03:35:33 +0000
Received: by outflank-mailman (input) for mailman id 321359;
 Thu, 05 May 2022 03:35:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nmSH5-0006bT-Q1; Thu, 05 May 2022 03:35:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nmSH5-0002og-L3; Thu, 05 May 2022 03:35:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nmSH5-00016G-A4; Thu, 05 May 2022 03:35:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nmSH5-0001SO-9K; Thu, 05 May 2022 03:35:31 +0000
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
	bh=RDqcSRvbNkfZPBgX19moga97nGdLvPCvubXrdDAA+OY=; b=fIQ0sUOHhiMKyZZ+7qn3x7Y127
	64eGI3/uEg3P9c6s0QBZZHHEdAMmy/wgbx1Vaw5FgXgXx5ujB+7noH7ElR+vHBZge16VVhHPxcHOZ
	OCYwtJsp3yh+COaKTyf91R0/QiQG5cJfGTNYIHkS19dvsOpy3JdyBvlkTbVLdlbbcNm8=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete build-i386-xsm
Message-Id: <E1nmSH5-0001SO-9K@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 05 May 2022 03:35:31 +0000

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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170136/


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
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-i386-xsm.xen-build --summary-out=tmp/170136.bisection-summary --basis-template=168254 --blessings=real,real-bisect,real-retry ovmf build-i386-xsm xen-build
Searching for failure / basis pass:
 170131 fail [host=pinot0] / 168254 [host=albana0] 168249 [host=huxelrebe0] 168232 [host=huxelrebe0] 168185 [host=huxelrebe0] 168131 [host=albana0] 168127 [host=huxelrebe0] 168119 [host=albana0] 168115 [host=huxelrebe1] 168074 [host=huxelrebe0] 168048 [host=albana0] 168046 [host=huxelrebe0] 168043 [host=huxelrebe0] 168042 [host=chardonnay1] 168038 [host=huxelrebe0] 168017 [host=albana0] 167989 [host=huxelrebe1] 167980 [host=albana1] 167976 [host=huxelrebe0] 167956 [host=huxelrebe1] 167950 [host=\
 albana0] 167946 [host=fiano0] 167940 [host=albana0] 167933 [host=albana0] 167929 [host=huxelrebe1] 167919 [host=elbling1] 167907 [host=albana1] 167803 [host=huxelrebe0] 167775 [host=albana0] 167760 [host=fiano0] 167754 [host=albana0] 167729 [host=albana1] 167727 [host=huxelrebe0] 167689 [host=fiano0] 167685 [host=chardonnay1] 167651 [host=albana0] 167636 [host=fiano0] 167627 [host=albana0] 167601 [host=albana1] 167598 [host=huxelrebe0] 167559 [host=huxelrebe0] 167555 [host=huxelrebe0] 167552 [ho\
 st=albana0] 167535 [host=chardonnay1] 167527 [host=chardonnay1] 167522 [host=huxelrebe0] 167513 [host=albana1] 167487 [host=huxelrebe1] 167465 [host=albana1] 167463 [host=huxelrebe0] 167450 [host=fiano1] 167445 [host=chardonnay0] 167436 ok.
Failure / basis pass flights: 170131 / 167436
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
Basis pass f14fff513540757bef62923ee4aeca4bf3ea8081 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c d828caa9aeee80c59a35f662f875f6573e9b532f
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#f14fff513540757bef62923ee4aeca4bf3ea8081-101f4c789221716585b972f2c2a22a85c078ef1d git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#b6e539830bf45e2d7a6bd86ddfdf003088b173b0-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/osstest/seabios.git#2dd4b9b3f84019668719344b40dba79d681be4\
 1c-dc88f9b72df52b22c35b127b80c487e0b6fca4af git://xenbits.xen.org/xen.git#d828caa9aeee80c59a35f662f875f6573e9b532f-702c9a800eb3ecd4b8595998d37a769d470c5bb0
Loaded 76222 nodes in revision graph
Searching for test results:
 167465 [host=albana1]
 167487 [host=huxelrebe1]
 167436 pass f14fff513540757bef62923ee4aeca4bf3ea8081 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c d828caa9aeee80c59a35f662f875f6573e9b532f
 167445 [host=chardonnay0]
 167450 [host=fiano1]
 167463 [host=huxelrebe0]
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
 168262 [host=elbling0]
 168267 [host=elbling0]
 168271 [host=elbling1]
 168285 [host=elbling1]
 168290 [host=elbling1]
 168295 [host=elbling1]
 168299 [host=elbling1]
 168303 [host=elbling0]
 168308 [host=elbling1]
 168312 [host=elbling1]
 168314 [host=elbling0]
 168316 [host=elbling0]
 168320 [host=elbling0]
 168329 [host=elbling1]
 168333 [host=elbling1]
 168340 [host=elbling0]
 168362 [host=elbling0]
 168344 [host=elbling0]
 168352 [host=elbling0]
 168351 [host=elbling0]
 168357 [host=elbling0]
 168356 [host=elbling0]
 168358 [host=elbling0]
 168359 [host=elbling0]
 168360 [host=elbling0]
 168363 [host=elbling0]
 168364 [host=elbling0]
 168365 [host=elbling0]
 168367 [host=elbling0]
 168366 [host=elbling0]
 168368 [host=elbling0]
 168371 [host=elbling0]
 168373 [host=elbling0]
 168372 [host=elbling0]
 168375 [host=elbling0]
 168378 [host=elbling0]
 168379 [host=elbling0]
 168377 [host=elbling0]
 168380 [host=elbling0]
 168382 [host=elbling0]
 168381 [host=elbling0]
 168385 [host=elbling0]
 168387 [host=elbling0]
 168389 [host=elbling0]
 168392 [host=elbling0]
 168395 [host=elbling1]
 168397 [host=elbling0]
 168401 [host=elbling0]
 168402 [host=elbling1]
 168404 [host=elbling1]
 168405 [host=elbling1]
 168407 [host=elbling1]
 168408 [host=elbling1]
 168411 [host=elbling1]
 168415 [host=elbling1]
 168416 [host=elbling1]
 168418 [host=elbling0]
 168419 [host=elbling0]
 168421 [host=elbling0]
 168422 [host=elbling1]
 168424 [host=elbling1]
 168425 [host=elbling0]
 168426 [host=elbling0]
 168427 [host=elbling0]
 168430 [host=elbling1]
 168431 [host=elbling1]
 168433 [host=elbling0]
 168436 [host=elbling1]
 168438 [host=elbling1]
 168439 [host=elbling1]
 168440 [host=elbling0]
 168441 [host=elbling0]
 168443 [host=elbling1]
 168444 [host=elbling1]
 168445 [host=elbling0]
 168446 [host=elbling0]
 168447 [host=elbling0]
 168449 [host=elbling1]
 168451 [host=elbling1]
 168453 [host=elbling0]
 168455 [host=elbling1]
 168456 [host=elbling1]
 168457 [host=elbling1]
 168458 [host=elbling1]
 168459 [host=elbling1]
 168461 [host=elbling1]
 168462 [host=elbling1]
 168464 [host=elbling1]
 168468 [host=elbling1]
 168469 [host=elbling1]
 168472 [host=elbling0]
 168475 [host=elbling0]
 168477 [host=elbling1]
 168478 [host=elbling1]
 168479 [host=elbling0]
 168489 [host=elbling0]
 168490 [host=pinot1]
 168496 [host=elbling0]
 168504 [host=elbling1]
 168508 [host=pinot1]
 168512 [host=pinot1]
 168519 fail irrelevant
 168521 [host=elbling0]
 168524 [host=elbling0]
 168525 [host=elbling0]
 168526 [host=pinot1]
 168530 [host=pinot1]
 168532 fail irrelevant
 168533 [host=pinot1]
 168534 [host=elbling1]
 168535 [host=elbling1]
 168536 [host=elbling1]
 168538 [host=elbling1]
 168539 [host=elbling1]
 168541 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168542 [host=pinot1]
 168543 [host=pinot1]
 168544 [host=pinot1]
 168546 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168548 [host=pinot1]
 168550 [host=elbling0]
 168551 [host=elbling0]
 168552 [host=elbling0]
 168553 [host=elbling0]
 168554 [host=elbling0]
 168555 [host=pinot1]
 168556 [host=pinot1]
 168557 [host=pinot1]
 168558 [host=pinot1]
 168559 [host=pinot1]
 168560 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168561 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168562 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168564 [host=pinot1]
 168565 [host=pinot1]
 168566 fail 2b175eeb6a3f630aef5a59a2c610a5be1a0cdd65 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168567 [host=elbling1]
 168568 [host=elbling1]
 168569 [host=elbling1]
 168570 [host=elbling1]
 168572 [host=elbling1]
 168574 [host=pinot1]
 168576 [host=pinot1]
 168578 fail 10b4c8f3b75f765a5d210aa6f2fbab100955062e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168579 [host=elbling1]
 168581 [host=elbling1]
 168583 [host=elbling1]
 168584 [host=pinot1]
 168587 [host=pinot1]
 168588 fail a13dfc769bd7097d8d9ffe3e029a2c1d062d712b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168602 fail a13dfc769bd7097d8d9ffe3e029a2c1d062d712b 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6ff9a7e62b8c43fe3e9d360fbd49d5854787bc39
 168606 [host=pinot1]
 168609 [host=elbling1]
 168610 [host=pinot1]
 168614 [host=pinot1]
 168616 [host=elbling1]
 168617 fail irrelevant
 168618 [host=elbling1]
 168622 [host=elbling1]
 168623 [host=pinot1]
 168625 [host=elbling1]
 168627 [host=elbling1]
 168634 [host=elbling0]
 168629 [host=pinot1]
 168635 [host=elbling1]
 168637 [host=pinot1]
 168639 [host=elbling0]
 168640 [host=pinot1]
 168645 [host=pinot1]
 168648 fail 5b56c52b5c1cc817a1ddac7f03aa6a02aeab4c04 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db c7a80bc50ac768b4eecaad85b77ae45790c93c73
 168651 fail 5b56c52b5c1cc817a1ddac7f03aa6a02aeab4c04 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db c7a80bc50ac768b4eecaad85b77ae45790c93c73
 168653 [host=elbling1]
 168661 [host=elbling1]
 168663 [host=elbling1]
 168664 [host=elbling0]
 168668 [host=elbling0]
 168670 [host=elbling0]
 168672 [host=elbling0]
 168673 [host=elbling0]
 168675 [host=elbling0]
 168678 [host=elbling0]
 168679 [host=pinot1]
 168680 [host=pinot1]
 168682 [host=pinot1]
 168683 [host=elbling0]
 168685 [host=elbling0]
 168686 [host=elbling0]
 168687 [host=elbling0]
 168688 [host=elbling0]
 168689 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168690 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168692 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168693 [host=elbling1]
 168694 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168695 [host=pinot1]
 168697 [host=pinot1]
 168698 [host=elbling0]
 168702 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168703 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168707 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168708 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168710 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 6974c75180f1aad44e5428eabf2396b2b50fb0e4
 168728 [host=elbling0]
 168713 [host=elbling0]
 168717 [host=elbling1]
 168721 [host=elbling0]
 168723 [host=elbling0]
 168725 [host=elbling0]
 168727 [host=elbling1]
 168729 [host=elbling0]
 168730 [host=elbling0]
 168731 [host=elbling0]
 168732 [host=elbling0]
 168734 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db fdfb07eb28e42b456e5e1ce999a47cc3ea439f7f
 168735 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db fdfb07eb28e42b456e5e1ce999a47cc3ea439f7f
 168736 fail c1e662101addbfd983026f06d119da2d470865a1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db fdfb07eb28e42b456e5e1ce999a47cc3ea439f7f
 168738 [host=elbling0]
 168739 [host=pinot1]
 168741 [host=elbling0]
 168745 [host=elbling0]
 168746 [host=elbling0]
 168747 [host=elbling0]
 168748 [host=elbling0]
 168749 fail 267a92fef3b705e6a3ecbeaa4d4b58f7bfac9734 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db fdfb07eb28e42b456e5e1ce999a47cc3ea439f7f
 168751 [host=elbling0]
 168752 [host=elbling0]
 168753 [host=elbling0]
 168754 [host=elbling0]
 168757 [host=pinot1]
 168758 [host=elbling0]
 168759 [host=elbling1]
 168762 [host=elbling0]
 168766 [host=elbling0]
 168770 [host=pinot1]
 168774 [host=elbling1]
 168777 [host=elbling1]
 168779 [host=elbling1]
 168780 [host=elbling1]
 168783 [host=elbling1]
 168785 [host=elbling1]
 168788 fail ec0b54849b23efa25caf0055b0eef8bf9b4dec98 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 8aa0e9d2d1a4815516607eabe9b2e850f284a2f8
 168789 [host=pinot1]
 168790 [host=elbling0]
 168793 [host=elbling1]
 168799 [host=elbling1]
 168801 [host=elbling1]
 168804 [host=elbling1]
 168805 [host=elbling1]
 168806 [host=elbling1]
 168808 [host=elbling1]
 168812 [host=elbling0]
 168813 [host=elbling0]
 168814 [host=elbling1]
 168817 [host=elbling1]
 168819 [host=elbling1]
 168820 [host=pinot1]
 168822 [host=pinot1]
 168823 [host=pinot1]
 168824 [host=elbling1]
 168826 [host=elbling1]
 168827 fail ec0b54849b23efa25caf0055b0eef8bf9b4dec98 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 69e46280937526db9cf78259cd8a0a9ec62dc847
 168829 [host=pinot1]
 168831 [host=elbling1]
 168832 [host=pinot1]
 168834 [host=elbling0]
 168837 fail 69218d5d2854acaa7a11c777244de4a297d2fbb9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 1c80f13a6efdc832878d7a431e2c216039d063bc
 168844 [host=pinot1]
 168854 [host=pinot1]
 168858 [host=pinot1]
 168859 [host=pinot1]
 168865 [host=pinot1]
 168981 [host=elbling1]
 169004 [host=elbling1]
 169046 [host=elbling0]
 169069 [host=elbling0]
 169102 [host=elbling1]
 169117 [host=elbling1]
 169128 [host=elbling1]
 169135 [host=elbling1]
 169141 [host=elbling1]
 169144 [host=elbling1]
 169148 [host=elbling1]
 169150 [host=pinot1]
 169153 [host=elbling0]
 169156 [host=elbling1]
 169161 [host=elbling0]
 169165 [host=pinot1]
 169169 [host=pinot1]
 169173 [host=elbling0]
 169177 [host=elbling0]
 169187 fail a298a84478053872ed9da660a75f182ce81b8ddc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
 169196 [host=pinot1]
 169202 [host=elbling1]
 169209 [host=pinot1]
 169218 [host=elbling0]
 169223 fail a298a84478053872ed9da660a75f182ce81b8ddc 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 14dd241aad8af447680ac73e8579990e2c09c1e7
 169226 fail irrelevant
 169227 fail irrelevant
 169229 fail irrelevant
 169232 [host=elbling1]
 169234 [host=pinot1]
 169235 [host=elbling0]
 169242 fail irrelevant
 169247 fail irrelevant
 169248 [host=elbling0]
 169258 [host=pinot1]
 169263 [host=pinot1]
 169265 [host=elbling0]
 169266 fail irrelevant
 169271 fail irrelevant
 169272 [host=elbling1]
 169274 [host=pinot1]
 169275 fail 4f4afcd28802ff8a3e78ad72e47b6acb6e24819c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169277 fail 4f4afcd28802ff8a3e78ad72e47b6acb6e24819c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169278 fail 4f4afcd28802ff8a3e78ad72e47b6acb6e24819c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169279 [host=elbling1]
 169280 [host=elbling1]
 169281 [host=elbling1]
 169282 fail 4f4afcd28802ff8a3e78ad72e47b6acb6e24819c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169283 fail bfefdc2c49ca9487b7aa0df196b2aca6c0c170a2 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169293 [host=elbling1]
 169285 [host=pinot1]
 169287 [host=pinot1]
 169288 fail dab96cf02e3be378310dd1bce119b0fac6fac958 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 8847ec08fd0eecbe3da944fdd49ca3d755e8a9bf
 169289 [host=pinot1]
 169290 [host=pinot1]
 169291 [host=pinot1]
 169295 [host=pinot1]
 169297 [host=pinot1]
 169299 [host=pinot1]
 169300 [host=pinot1]
 169302 [host=pinot1]
 169305 [host=pinot1]
 169306 [host=elbling1]
 169307 [host=elbling1]
 169308 [host=elbling1]
 169310 [host=elbling1]
 169311 [host=elbling0]
 169312 [host=pinot1]
 169313 [host=pinot1]
 169314 [host=pinot1]
 169315 [host=pinot1]
 169316 [host=pinot1]
 169317 [host=pinot1]
 169319 [host=pinot1]
 169321 fail 12a50c9ce117b6106c92bb965799e709547d8494 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 f44201124e8713f6eff80f349351b5740001c6fc
 169323 [host=pinot1]
 169324 [host=pinot1]
 169325 [host=pinot1]
 169326 [host=pinot1]
 169327 [host=pinot1]
 169329 [host=pinot1]
 169331 fail irrelevant
 169334 [host=pinot1]
 169335 [host=elbling1]
 169338 [host=elbling1]
 169339 fail f5508a91e306dd183ab971be438b9667c9890a1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169341 fail f5508a91e306dd183ab971be438b9667c9890a1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169342 fail f5508a91e306dd183ab971be438b9667c9890a1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169343 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169344 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169345 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169349 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169350 [host=pinot1]
 169352 [host=pinot1]
 169357 [host=pinot1]
 169358 [host=pinot1]
 169359 [host=pinot1]
 169360 [host=pinot1]
 169362 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169363 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169364 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169365 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169366 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169370 [host=pinot1]
 169371 [host=pinot1]
 169372 [host=pinot1]
 169374 [host=pinot1]
 169375 fail c411566fad3d6d61a97edfa6e97a91688b175201 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 5b752808ff37b7c819a26fd76329ef329c42774f
 169376 [host=pinot1]
 169377 [host=pinot1]
 169378 [host=pinot1]
 169379 [host=pinot1]
 169380 [host=pinot1]
 169381 [host=pinot1]
 169382 [host=elbling1]
 169384 [host=elbling1]
 169385 [host=pinot1]
 169387 [host=elbling0]
 169388 [host=elbling0]
 169389 [host=elbling0]
 169390 [host=elbling0]
 169391 [host=elbling0]
 169392 [host=elbling1]
 169393 [host=elbling1]
 169394 [host=elbling1]
 169395 [host=elbling1]
 169396 [host=elbling1]
 169397 [host=elbling1]
 169398 [host=elbling1]
 169399 fail f3da13461cbed699e54b1d7ef3fba5144cc3b3b4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e509b5f932608e74deac96048b28a5e9b210c647
 169400 fail f3da13461cbed699e54b1d7ef3fba5144cc3b3b4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e509b5f932608e74deac96048b28a5e9b210c647
 169401 fail f3da13461cbed699e54b1d7ef3fba5144cc3b3b4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e509b5f932608e74deac96048b28a5e9b210c647
 169402 fail f3da13461cbed699e54b1d7ef3fba5144cc3b3b4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e509b5f932608e74deac96048b28a5e9b210c647
 169404 fail f3da13461cbed699e54b1d7ef3fba5144cc3b3b4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 e509b5f932608e74deac96048b28a5e9b210c647
 169405 [host=elbling0]
 169406 [host=pinot1]
 169407 [host=elbling0]
 169408 [host=elbling0]
 169410 [host=elbling0]
 169411 [host=elbling1]
 169413 [host=elbling1]
 169414 [host=elbling1]
 169416 [host=pinot1]
 169417 [host=pinot1]
 169418 [host=pinot1]
 169419 [host=pinot1]
 169420 [host=pinot1]
 169421 [host=pinot1]
 169422 [host=pinot1]
 169424 [host=elbling0]
 169425 [host=elbling1]
 169427 [host=elbling1]
 169428 [host=elbling1]
 169429 [host=pinot1]
 169430 [host=elbling0]
 169431 [host=elbling0]
 169432 [host=elbling0]
 169435 [host=elbling1]
 169436 [host=elbling0]
 169437 [host=pinot1]
 169438 [host=pinot1]
 169439 [host=pinot1]
 169440 [host=pinot1]
 169441 [host=pinot1]
 169443 [host=elbling1]
 169445 [host=elbling1]
 169446 [host=elbling0]
 169448 [host=pinot1]
 169449 [host=pinot1]
 169450 [host=pinot1]
 169451 [host=pinot1]
 169452 [host=pinot1]
 169453 fail irrelevant
 169454 fail irrelevant
 169455 fail irrelevant
 169456 fail irrelevant
 169457 fail irrelevant
 169458 [host=pinot1]
 169459 [host=pinot1]
 169460 [host=pinot1]
 169461 [host=pinot1]
 169462 [host=pinot1]
 169463 [host=pinot1]
 169464 [host=pinot1]
 169465 [host=pinot1]
 169467 [host=pinot1]
 169468 [host=elbling1]
 169469 [host=elbling1]
 169470 [host=elbling1]
 169471 [host=elbling1]
 169473 [host=pinot1]
 169476 fail irrelevant
 169478 [host=elbling0]
 169479 [host=elbling1]
 169480 [host=elbling1]
 169481 [host=elbling1]
 169512 [host=elbling0]
 169482 fail irrelevant
 169484 fail irrelevant
 169485 fail irrelevant
 169486 fail irrelevant
 169487 [host=pinot1]
 169489 [host=pinot1]
 169490 [host=pinot1]
 169491 [host=pinot1]
 169492 [host=pinot1]
 169494 [host=pinot1]
 169496 [host=pinot1]
 169497 [host=elbling0]
 169498 [host=elbling0]
 169500 [host=elbling0]
 169501 [host=elbling0]
 169503 fail irrelevant
 169504 fail irrelevant
 169505 fail irrelevant
 169506 fail irrelevant
 169508 fail irrelevant
 169509 [host=elbling0]
 169510 [host=elbling0]
 169511 [host=elbling0]
 169513 [host=elbling0]
 169514 [host=pinot1]
 169515 [host=pinot1]
 169516 [host=pinot1]
 169517 [host=pinot1]
 169518 [host=pinot1]
 169519 fail irrelevant
 169520 fail irrelevant
 169521 fail irrelevant
 169522 fail irrelevant
 169523 fail irrelevant
 169524 [host=pinot1]
 169525 [host=pinot1]
 169526 [host=pinot1]
 169527 fail irrelevant
 169529 fail irrelevant
 169530 [host=elbling0]
 169532 [host=elbling0]
 169533 [host=elbling0]
 169534 [host=elbling0]
 169535 [host=elbling0]
 169536 [host=elbling0]
 169538 [host=pinot1]
 169539 [host=pinot1]
 169540 [host=pinot1]
 169542 [host=pinot1]
 169543 fail irrelevant
 169544 [host=pinot1]
 169548 [host=pinot1]
 169549 [host=elbling0]
 169551 [host=elbling0]
 169553 [host=pinot1]
 169554 [host=pinot1]
 169556 [host=pinot1]
 169558 [host=pinot1]
 169559 [host=pinot1]
 169561 [host=pinot1]
 169564 [host=pinot1]
 169567 [host=elbling1]
 169568 [host=elbling1]
 169569 [host=pinot1]
 169571 [host=elbling0]
 169574 [host=elbling0]
 169585 [host=pinot1]
 169575 [host=elbling1]
 169578 [host=elbling1]
 169579 [host=pinot1]
 169580 [host=pinot1]
 169582 [host=pinot1]
 169583 [host=pinot1]
 169586 fail irrelevant
 169587 [host=elbling1]
 169588 [host=elbling1]
 169589 [host=elbling1]
 169590 [host=elbling1]
 169592 [host=elbling1]
 169593 fail b06a007b6471b6eba6d1c38ff1bcfff183b57488 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 fdef107edd4459375f9c0e6e377f30e82d498747
 169594 [host=pinot1]
 169596 [host=pinot1]
 169597 fail b06a007b6471b6eba6d1c38ff1bcfff183b57488 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 fdef107edd4459375f9c0e6e377f30e82d498747
 169598 [host=elbling1]
 169599 [host=elbling1]
 169600 [host=elbling1]
 169602 [host=elbling1]
 169604 [host=elbling1]
 169606 [host=pinot1]
 169607 [host=elbling1]
 169610 [host=elbling1]
 169612 [host=pinot1]
 169615 [host=pinot1]
 169618 [host=elbling1]
 169620 [host=elbling1]
 169621 [host=elbling1]
 169623 [host=elbling1]
 169625 [host=elbling1]
 169626 [host=elbling0]
 169628 [host=elbling0]
 169631 [host=pinot1]
 169632 [host=pinot1]
 169633 [host=pinot1]
 169634 [host=pinot1]
 169636 [host=pinot1]
 169637 [host=elbling0]
 169639 [host=elbling0]
 169641 fail irrelevant
 169642 [host=elbling0]
 169643 [host=elbling0]
 169644 [host=elbling0]
 169646 [host=elbling0]
 169647 [host=elbling0]
 169648 [host=pinot1]
 169649 [host=pinot1]
 169650 [host=pinot1]
 169651 [host=pinot1]
 169653 [host=elbling0]
 169655 [host=elbling0]
 169656 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169657 [host=elbling1]
 169658 [host=elbling1]
 169659 [host=elbling1]
 169660 [host=elbling1]
 169678 [host=elbling0]
 169661 [host=pinot1]
 169663 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169665 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169667 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169668 [host=elbling1]
 169670 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169672 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169673 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169674 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169675 fail 96e1d337e0109d970282de71181a5cc317876829 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169676 [host=elbling0]
 169677 [host=elbling0]
 169679 [host=elbling0]
 169680 [host=elbling0]
 169681 [host=pinot1]
 169682 [host=pinot1]
 169683 [host=pinot1]
 169684 [host=pinot1]
 169685 [host=pinot1]
 169687 [host=pinot1]
 169688 [host=elbling0]
 169689 [host=elbling0]
 169690 [host=elbling0]
 169691 [host=elbling0]
 169692 [host=elbling0]
 169693 [host=elbling0]
 169695 [host=elbling0]
 169697 [host=pinot1]
 169698 [host=pinot1]
 169700 [host=elbling0]
 169701 [host=elbling0]
 169702 [host=elbling0]
 169703 [host=elbling0]
 169704 [host=elbling0]
 169705 [host=elbling0]
 169706 [host=elbling0]
 169707 [host=elbling0]
 169708 [host=elbling0]
 169709 [host=elbling0]
 169710 [host=elbling0]
 169711 [host=elbling0]
 169712 [host=elbling0]
 169713 [host=elbling0]
 169715 [host=elbling0]
 169716 [host=elbling0]
 169718 [host=elbling1]
 169719 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169721 [host=pinot1]
 169722 [host=pinot1]
 169724 [host=pinot1]
 169726 [host=pinot1]
 169728 [host=elbling1]
 169730 [host=elbling1]
 169731 [host=elbling1]
 169732 [host=elbling1]
 169733 [host=elbling1]
 169734 [host=elbling1]
 169735 [host=elbling1]
 169738 [host=elbling1]
 169740 [host=elbling1]
 169742 [host=elbling1]
 169744 [host=elbling1]
 169746 [host=elbling1]
 169750 [host=elbling1]
 169754 [host=elbling1]
 169757 [host=elbling1]
 169758 [host=elbling1]
 169759 [host=pinot1]
 169761 [host=pinot1]
 169763 [host=pinot1]
 169764 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169766 [host=elbling1]
 169769 [host=elbling1]
 169770 [host=elbling1]
 169772 [host=pinot1]
 169776 [host=elbling1]
 169778 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169780 [host=elbling0]
 169783 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169784 [host=elbling1]
 169786 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169791 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169793 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 2419a159fb943c24a6f2439604b9fdb1478fcd08
 169796 [host=pinot1]
 169797 [host=pinot1]
 169799 [host=pinot1]
 169802 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169803 [host=pinot1]
 169804 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169806 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169808 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169810 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169811 fail 916f90baa547b3ebef8fa87c530e2f0c8e35e1e3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 01774004c7f7fdc9c1e8f1715f70d3b913f8d491 3f5d61466345ed2213de2d7e391b6cd6d4b86015
 169812 [host=pinot1]
 169814 [host=pinot1]
 169815 [host=pinot1]
 169816 [host=pinot1]
 169821 [host=elbling0]
 169828 fail irrelevant
 169832 [host=pinot1]
 169835 [host=elbling1]
 169837 [host=elbling1]
 169839 [host=pinot1]
 169841 fail irrelevant
 169842 fail irrelevant
 169845 fail irrelevant
 169848 fail irrelevant
 169854 fail irrelevant
 169858 [host=elbling1]
 169865 [host=pinot1]
 169866 [host=pinot1]
 169868 [host=pinot1]
 169872 [host=pinot1]
 169873 [host=pinot1]
 169874 [host=pinot1]
 169878 [host=pinot1]
 169879 fail irrelevant
 169880 fail irrelevant
 169882 fail irrelevant
 169883 fail irrelevant
 169885 fail irrelevant
 169889 fail irrelevant
 169892 fail irrelevant
 169894 [host=pinot1]
 169901 [host=pinot1]
 169904 fail irrelevant
 169908 [host=elbling1]
 169905 [host=elbling1]
 169910 [host=elbling1]
 169913 fail irrelevant
 169914 [host=elbling1]
 169915 [host=elbling0]
 169916 [host=pinot1]
 169917 [host=pinot1]
 169919 [host=pinot1]
 169920 [host=elbling1]
 169921 [host=elbling1]
 169922 [host=elbling1]
 169923 [host=elbling1]
 169924 [host=elbling1]
 169925 fail irrelevant
 169926 fail irrelevant
 169927 fail irrelevant
 169928 fail irrelevant
 169930 fail irrelevant
 169931 [host=elbling1]
 169933 [host=pinot1]
 169934 [host=pinot1]
 169935 [host=pinot1]
 169936 [host=pinot1]
 169937 [host=pinot1]
 169941 fail irrelevant
 169943 fail irrelevant
 169944 fail irrelevant
 169945 fail irrelevant
 169946 fail irrelevant
 169952 fail irrelevant
 169955 fail irrelevant
 169960 fail irrelevant
 169963 fail irrelevant
 169966 fail irrelevant
 169969 fail irrelevant
 169970 [host=pinot1]
 169971 [host=pinot1]
 169972 [host=pinot1]
 169973 [host=pinot1]
 169974 [host=pinot1]
 169975 fail irrelevant
 169978 fail irrelevant
 169979 fail irrelevant
 169981 [host=pinot1]
 169983 [host=elbling1]
 169987 [host=elbling1]
 169988 [host=elbling1]
 169989 fail irrelevant
 169991 fail irrelevant
 169994 [host=elbling1]
 169995 [host=pinot1]
 169998 [host=pinot1]
 169999 [host=pinot1]
 170000 fail irrelevant
 170003 fail irrelevant
 170004 [host=elbling0]
 170005 [host=pinot1]
 170006 [host=pinot1]
 170010 fail irrelevant
 170013 [host=pinot1]
 170017 fail irrelevant
 170019 fail irrelevant
 170022 [host=elbling1]
 170027 [host=elbling1]
 170029 [host=elbling1]
 170030 [host=elbling1]
 170038 [host=elbling1]
 170041 [host=elbling1]
 170043 [host=elbling1]
 170045 [host=elbling1]
 170048 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170049 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170050 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170052 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170054 [host=pinot1]
 170055 [host=elbling1]
 170056 [host=elbling1]
 170058 [host=elbling1]
 170059 [host=elbling1]
 170060 [host=elbling1]
 170061 [host=elbling1]
 170063 [host=elbling1]
 170062 [host=elbling1]
 170065 [host=elbling1]
 170066 [host=elbling1]
 170067 [host=elbling1]
 170068 [host=elbling1]
 170069 [host=elbling1]
 170070 [host=elbling1]
 170074 [host=elbling1]
 170075 [host=elbling1]
 170073 [host=elbling1]
 170077 [host=pinot1]
 170076 [host=elbling1]
 170079 [host=pinot1]
 170080 [host=pinot1]
 170082 [host=pinot1]
 170083 [host=pinot1]
 170084 [host=pinot1]
 170085 [host=pinot1]
 170086 [host=pinot1]
 170087 [host=pinot1]
 170088 [host=pinot1]
 170089 [host=pinot1]
 170090 [host=pinot1]
 170091 [host=pinot1]
 170092 [host=pinot1]
 170094 [host=pinot1]
 170093 [host=pinot1]
 170097 [host=pinot1]
 170096 [host=pinot1]
 170098 [host=pinot1]
 170100 [host=pinot1]
 170099 [host=pinot1]
 170101 [host=pinot1]
 170103 [host=pinot1]
 170102 [host=pinot1]
 170104 [host=pinot1]
 170105 [host=pinot1]
 170107 [host=pinot1]
 170106 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170108 pass f14fff513540757bef62923ee4aeca4bf3ea8081 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b6e539830bf45e2d7a6bd86ddfdf003088b173b0 2dd4b9b3f84019668719344b40dba79d681be41c d828caa9aeee80c59a35f662f875f6573e9b532f
 170109 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170111 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170112 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 4eff93e7b0d093fd9347f2d533dada49854290fe 975a8fb45ca186b3476e5656c6ad5dad1122dbfd
 170113 pass b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 22939d3c83da3f94c612b1f49f6f91f11ee3490d
 170114 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170115 pass b24306f15daa2ff8510b06702114724b33895d3c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 109980738e1449f5f281e5d6bfb5681eb9defea6
 170118 fail b909b4ad097080f865cbb7caae4cca101c0fe96c 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 d239552ce7220e448ae81f41515138f7b9e3c4db 1f410b0c7455748021be4ede59e7a0c0a2ffb1c4
 170119 fail 2aa107c0aa2e1375651867c8df1b81ff64b67fce 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170117 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170134 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170121 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170120 pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 7d9589239ec068c944190408b9838774d5ec1f8f
 170124 pass 63c50d3ff2854a76432b752af4f2a76f33ff1974 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170125 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170126 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170127 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170128 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170129 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170132 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 170131 fail 101f4c789221716585b972f2c2a22a85c078ef1d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 dc88f9b72df52b22c35b127b80c487e0b6fca4af 702c9a800eb3ecd4b8595998d37a769d470c5bb0
 170136 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
Searching for interesting versions
 Result found: flight 167436 (pass), for basis pass
 Result found: flight 169321 (fail), for basis failure (at ancestor ~137)
 Repro found: flight 170108 (pass), for basis pass
 Repro found: flight 170109 (fail), for basis failure
 0 revisions at 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
No revisions left to test, checking graph state.
 Result found: flight 170126 (pass), for last pass
 Result found: flight 170128 (fail), for first failure
 Repro found: flight 170129 (pass), for last pass
 Repro found: flight 170132 (fail), for first failure
 Repro found: flight 170134 (pass), for last pass
 Repro found: flight 170136 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d3febfd9ade35dc552df6b3607c2b15d26b82867
  Bug not present: 84338c0d498555f860a480693ee8647a1795fba3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/170136/


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

neato: graph is too large for cairo-renderer bitmaps. Scaling by 0.580286 to fit
pnmtopng: 106 colors found
Revision graph left in /home/logs/results/bisect/ovmf/build-i386-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
170136: tolerable ALL FAIL

flight 170136 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/170136/

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


