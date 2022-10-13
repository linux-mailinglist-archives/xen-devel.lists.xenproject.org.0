Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3705FD225
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 03:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421568.666996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimeK-0000bT-TO; Thu, 13 Oct 2022 01:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421568.666996; Thu, 13 Oct 2022 01:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oimeK-0000ZB-QP; Thu, 13 Oct 2022 01:04:36 +0000
Received: by outflank-mailman (input) for mailman id 421568;
 Thu, 13 Oct 2022 01:04:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oimeJ-0000Z1-FR; Thu, 13 Oct 2022 01:04:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oimeJ-0001OJ-9V; Thu, 13 Oct 2022 01:04:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oimeJ-0007We-1M; Thu, 13 Oct 2022 01:04:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oimeJ-0003gc-0p; Thu, 13 Oct 2022 01:04:35 +0000
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
	bh=ZDu9j0xcCaN+eqsCANXUZf327TdCOAbR8gCSqs512vA=; b=BtV9JLc/aE/GmpaEKXfaXx3gxU
	Rv8HBhDyI3shIuPZLd/XRfELcNvEZxnfuoaJ3syajGB6Iq6RNXal37Iir3yHpuKFtduhzTIAY2QU+
	jpXjwyUqDAIaWvzYFetG19aiZv7vL0hMsjAG3P3l9QQB4MD961TiYIChCQjpkp25+PFE=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.15-testing bisection] complete build-amd64-xsm
Message-Id: <E1oimeJ-0003gc-0p@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Oct 2022 01:04:35 +0000

branch xen-4.15-testing
xenbranch xen-4.15-testing
job build-amd64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
  Bug not present: 182f8bb503b9dd3db5dd9118dc763d241787c6fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173655/


  commit 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Oct 11 15:16:53 2022 +0200
  
      xen/gnttab: fix gnttab_acquire_resource()
      
      Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
      warning") was wrong, as vaddrs can legitimately be NULL in case
      XENMEM_resource_grant_table_id_status was specified for a grant table
      v1. This would result in crashes in debug builds due to
      ASSERT_UNREACHABLE() triggering.
      
      Check vaddrs only to be NULL in the rc == 0 case.
      
      Expand the tests in tools/tests/resource to tickle this path, and verify that
      using XENMEM_resource_grant_table_id_status on a v1 grant table fails.
      
      Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com> # xen
      Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
      master commit: 52daa6a8483e4fbd6757c9d1b791e23931791608
      master date: 2022-09-09 16:28:38 +0100


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.15-testing/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.15-testing/build-amd64-xsm.xen-build --summary-out=tmp/173655.bisection-summary --basis-template=172547 --blessings=real,real-bisect,real-retry xen-4.15-testing build-amd64-xsm xen-build
Searching for failure / basis pass:
 173546 fail [host=sabro1] / 172547 [host=himrod1] 172109 [host=himrod2] 171880 [host=himrod0] 171866 [host=himrod1] 171609 [host=himrod1] 171594 [host=himrod0] 171375 [host=himrod1] 171205 [host=himrod2] 170922 [host=himrod2] 170904 [host=godello0] 170870 [host=godello0] 169237 [host=himrod2] 169193 [host=himrod1] 169178 [host=himrod2] 169162 [host=himrod2] 169152 [host=himrod1] 169143 [host=himrod2] 169132 [host=himrod1] 169115 [host=himrod2] 169079 [host=himrod2] 169040 [host=himrod2] 168992 \
 [host=himrod2] 168970 [host=elbling1] 168863 [host=himrod2] 168502 [host=himrod1] 168483 [host=albana0] 168135 [host=himrod1] 168062 [host=himrod2] 168014 [host=himrod1] 167996 [host=himrod1] 167965 [host=fiano0] 167880 [host=fiano1] 167628 [host=godello0] 167416 [host=godello1] 167217 [host=himrod2] 166387 [host=himrod1] 166338 [host=himrod1] 166311 [host=himrod2] 166198 [host=himrod1] 166192 [host=himrod1] 166169 [host=himrod1] 165521 [host=godello1] 165387 [host=himrod1] 164938 [host=himrod1]\
  164889 [host=himrod2] 164636 [host=himrod2] 164564 [host=himrod2] 164511 [host=himrod1] 164495 [host=himrod1] 164455 [host=himrod2] 164390 [host=himrod1] 164304 [host=himrod1] 164262 [host=himrod2] 163759 [host=himrod1] 163727 [host=himrod1] 163710 [host=himrod1] 162882 [host=himrod2] 162561 [host=himrod2] 162546 [host=himrod2] 162366 [host=himrod1] 161772 [host=himrod1] 161322 [host=himrod1] 161049 [host=himrod1] 160774 [host=himrod2] 160455 [host=himrod1] 160422 [host=himrod2] 160394 [host=hi\
 mrod1] template as basis? using template as basis.
Failure / basis pass flights: 173546 / 172547
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
Basis pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#444260d45ec2a84e8f8c192b3539a3cd5591d009-f80580f56b267c96f16f985dbf707b2f96947da4 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#6503bd6a1b5364ffd346a8a475e1eb91b9f756e5-6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 git://xenbits.xen.org/osstest/seabios.git#46de2eec93bffa0706e6229c0da2919763c8e\
 b04-46de2eec93bffa0706e6229c0da2919763c8eb04 git://xenbits.xen.org/xen.git#9acedc3c58c31930737edbe212f2ccf437a0b757-9690bb261d5fa09cb281e1fa124d93db7b84fda5
Loaded 10001 nodes in revision graph
Searching for test results:
 172547 [host=himrod1]
 173494 [host=sabro0]
 173498 [host=sabro0]
 173522 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173594 pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173597 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173605 pass 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173606 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173546 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9690bb261d5fa09cb281e1fa124d93db7b84fda5
 173608 pass e8a537d28d37c092bd03093064264071f2938ca8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173611 pass 7aa06237b856fd6f8187cc1715a3fe08ab4e98ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173616 pass a670f12a741a9511d9cedc7257d3693567f8fc43 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757
 173617 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 686c920fa9389fe2b6b619643024ed98b4b7d51f
 173618 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7923ea47e578bca30a6e45951a9da09e827ff028
 173629 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 19cf28b515f21da02df80e68f901ad7650daaa37
 173631 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
 173639 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 182f8bb503b9dd3db5dd9118dc763d241787c6fc
 173641 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
 173642 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 182f8bb503b9dd3db5dd9118dc763d241787c6fc
 173646 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
 173653 pass f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 182f8bb503b9dd3db5dd9118dc763d241787c6fc
 173655 fail f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
Searching for interesting versions
 Result found: flight 173594 (pass), for basis pass
 For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 182f8bb503b9dd3db5dd9118dc763d241787c6fc, results HASH(0x555b10523030) HASH(0x555b1053d530) HASH(0x555b10542768) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec9\
 3bffa0706e6229c0da2919763c8eb04 19cf28b515f21da02df80e68f901ad7650daaa37, results HASH(0x555b10526260) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 7923ea47e578bca30a6e45951a9da09e827ff028, results HASH(0x555b0fb31c00) For basis failure, parent search stopping at f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee\
 84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 686c920fa9389fe2b6b619643024ed98b4b7d51f, results HASH(0x555b105140a8) For basis failure, parent search stopping at a670f12a741a9511d9cedc7257d3693567f8fc43 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x555b0fb29de8) For basis failure, parent search stopping at 7aa06237b856\
 fd6f8187cc1715a3fe08ab4e98ed 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x555b0fb31cc0) For basis failure, parent search stopping at e8a537d28d37c092bd03093064264071f2938ca8 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x555b10527c6\
 8) For basis failure, parent search stopping at 444260d45ec2a84e8f8c192b3539a3cd5591d009 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 9acedc3c58c31930737edbe212f2ccf437a0b757, results HASH(0x555b1052eea8) HASH(0x555b10534be8) Result found: flight 173597 (fail), for basis failure (at ancestor ~746)
 Repro found: flight 173605 (pass), for basis pass
 Repro found: flight 173606 (fail), for basis failure
 0 revisions at f80580f56b267c96f16f985dbf707b2f96947da4 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6503bd6a1b5364ffd346a8a475e1eb91b9f756e5 46de2eec93bffa0706e6229c0da2919763c8eb04 182f8bb503b9dd3db5dd9118dc763d241787c6fc
No revisions left to test, checking graph state.
 Result found: flight 173639 (pass), for last pass
 Result found: flight 173641 (fail), for first failure
 Repro found: flight 173642 (pass), for last pass
 Repro found: flight 173646 (fail), for first failure
 Repro found: flight 173653 (pass), for last pass
 Repro found: flight 173655 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
  Bug not present: 182f8bb503b9dd3db5dd9118dc763d241787c6fc
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/173655/


  commit 3ac64b3751837a117ee3dfb3e2cc27057a83d0f7
  Author: Juergen Gross <jgross@suse.com>
  Date:   Tue Oct 11 15:16:53 2022 +0200
  
      xen/gnttab: fix gnttab_acquire_resource()
      
      Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
      warning") was wrong, as vaddrs can legitimately be NULL in case
      XENMEM_resource_grant_table_id_status was specified for a grant table
      v1. This would result in crashes in debug builds due to
      ASSERT_UNREACHABLE() triggering.
      
      Check vaddrs only to be NULL in the rc == 0 case.
      
      Expand the tests in tools/tests/resource to tickle this path, and verify that
      using XENMEM_resource_grant_table_id_status on a v1 grant table fails.
      
      Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" warning")
      Signed-off-by: Juergen Gross <jgross@suse.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com> # xen
      Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
      master commit: 52daa6a8483e4fbd6757c9d1b791e23931791608
      master date: 2022-09-09 16:28:38 +0100

pnmtopng: 165 colors found
Revision graph left in /home/logs/results/bisect/xen-4.15-testing/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
173655: tolerable ALL FAIL

flight 173655 xen-4.15-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/173655/

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


