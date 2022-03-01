Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9814C8554
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 08:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280891.479002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOx4x-0003PP-O2; Tue, 01 Mar 2022 07:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280891.479002; Tue, 01 Mar 2022 07:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOx4x-0003Nb-Je; Tue, 01 Mar 2022 07:37:51 +0000
Received: by outflank-mailman (input) for mailman id 280891;
 Tue, 01 Mar 2022 07:37:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOx4w-0003NR-Jb; Tue, 01 Mar 2022 07:37:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOx4w-0008F5-GN; Tue, 01 Mar 2022 07:37:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nOx4w-0008Tq-AG; Tue, 01 Mar 2022 07:37:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nOx4w-0005D5-9n; Tue, 01 Mar 2022 07:37:50 +0000
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
	bh=cJFYca+8qQgwK28LMsYF5pBUqgNZoRvd9AkLD9JKL5Y=; b=ZS1pBwg1uL+VO/iXCP2NgRl8Zr
	DAePsWkfAGJOcCZ3CaK1UjgcwNrxuKRwxm0ygw2aggGf9x83ErbNdfWOljTJ1hggo6uHtehn+SO1I
	Q4FfjzDraqmt3FIBQR4+wAmTjWjvuswD0wrIgNknE7zV7iRrat/MSC1Y+CKlXVGS2V18=;
To: xen-devel@lists.xenproject.org
Subject: [ovmf bisection] complete build-amd64-xsm
Message-Id: <E1nOx4w-0005D5-9n@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 01 Mar 2022 07:37:50 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64-xsm
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
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168274/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/ovmf/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build --summary-out=tmp/168274.bisection-summary --basis-template=168254 --blessings=real,real-bisect,real-retry ovmf build-amd64-xsm xen-build
Searching for failure / basis pass:
 168267 fail [host=himrod1] / 168254 [host=himrod2] 168249 [host=himrod2] 168232 ok.
Failure / basis pass flights: 168267 / 168232
(tree with no url: minios)
Tree: ovmf https://github.com/tianocore/edk2.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
Basis pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 9ba4c529985a1773852069889a5b53f2ed26c408
Generating revisions with ./adhoc-revtuple-generator  https://github.com/tianocore/edk2.git#54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8-497ac7b6d7f9750f48f137db244931a5728b1968 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42-a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 git://xenbits.xen.org/osstest/seabios.git#829b0f1a7cda1bccdf44a379fb3a96e519a7e8\
 cd-829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd git://xenbits.xen.org/xen.git#9ba4c529985a1773852069889a5b53f2ed26c408-4388144c44c4dd9e9b7df97938ef08ffa85eec07
Loaded 10001 nodes in revision graph
Searching for test results:
 168232 pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 9ba4c529985a1773852069889a5b53f2ed26c408
 168249 [host=himrod2]
 168254 [host=himrod2]
 168258 fail 6a890db161cd6d378bec3499a1e774db3f5a27a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168259 pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 9ba4c529985a1773852069889a5b53f2ed26c408
 168260 fail 6a890db161cd6d378bec3499a1e774db3f5a27a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168263 pass 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 1449f6873d7dd477ba110b415ca08a3c2553451e
 168265 pass de463163d9f6d3c5dc6b55ff35d1e5676e0e1b9f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168262 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168266 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168268 fail 7bc8b1d9f412507d579f21ea9af56fced81e7827 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168267 fail 497ac7b6d7f9750f48f137db244931a5728b1968 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168269 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168270 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168272 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168273 pass 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
 168274 fail d3febfd9ade35dc552df6b3607c2b15d26b82867 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
Searching for interesting versions
 Result found: flight 168232 (pass), for basis pass
 For basis failure, parent search stopping at 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07, results HASH(0x55de963d98b0) HASH(0x55de963e9dc0) HASH(0x55de963ecb70) For basis failure, parent search stopping at de463163d9f6d3c5dc6b55ff35d1e5676e0e1b9f 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7\
 cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07, results HASH(0x55de963dd8c0) For basis failure, parent search stopping at 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 1449f6873d7dd477ba110b415ca08a3c2553451e, results HASH(0x55de963ca7a8) For basis failure, parent search stopping at 54cddc3ad4b3a317985ce5f491f9b1f31ab10dd8 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 9ba4c529985a1773852069889a5b53f2ed26c408, results HASH(0x55de963d2670) HASH(0x55de963d78a8) Result found: flight 168258 (fail), for basis failure (at ancestor ~5258)
 Repro found: flight 168259 (pass), for basis pass
 Repro found: flight 168262 (fail), for basis failure
 0 revisions at 84338c0d498555f860a480693ee8647a1795fba3 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 a68d6d311c2d1fd9d2fa9a0768ea2353e8a79b42 829b0f1a7cda1bccdf44a379fb3a96e519a7e8cd 4388144c44c4dd9e9b7df97938ef08ffa85eec07
No revisions left to test, checking graph state.
 Result found: flight 168266 (pass), for last pass
 Result found: flight 168269 (fail), for first failure
 Repro found: flight 168270 (pass), for last pass
 Repro found: flight 168272 (fail), for first failure
 Repro found: flight 168273 (pass), for last pass
 Repro found: flight 168274 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  ovmf https://github.com/tianocore/edk2.git
  Bug introduced:  d3febfd9ade35dc552df6b3607c2b15d26b82867
  Bug not present: 84338c0d498555f860a480693ee8647a1795fba3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/168274/


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

Revision graph left in /home/logs/results/bisect/ovmf/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
168274: tolerable ALL FAIL

flight 168274 ovmf real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/168274/

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


