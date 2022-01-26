Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988249CF44
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261002.451459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCksD-0002Aa-GQ; Wed, 26 Jan 2022 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261002.451459; Wed, 26 Jan 2022 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCksD-00028A-D0; Wed, 26 Jan 2022 16:10:17 +0000
Received: by outflank-mailman (input) for mailman id 261002;
 Wed, 26 Jan 2022 16:10:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCksC-00027K-Ke; Wed, 26 Jan 2022 16:10:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCksC-0006QJ-Go; Wed, 26 Jan 2022 16:10:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nCksB-00014Z-7i; Wed, 26 Jan 2022 16:10:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nCksB-0003Kh-7E; Wed, 26 Jan 2022 16:10:15 +0000
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
	bh=bg7Z+SwWsFS1fhe7sSn+E38MWoAmA8eeA4iCAiexF2Y=; b=JuBCFdKMmsqvwadUi43q3wP1xs
	J+oEiNazT5CyDizlsgUK4v1GDnInNE2TTJG9nE6enr76NapN/4qpWff/S4O19P8mKPTO7RFcIB6vK
	JxNmduU2KkWlsZQG0efqLFs70Zoy250ng1/+Ie3fJCHrsGM2/9kswyQduuqxEOI17Pjw=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.14-testing bisection] complete build-amd64-xsm
Message-Id: <E1nCksB-0003Kh-7E@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jan 2022 16:10:15 +0000

branch xen-4.14-testing
xenbranch xen-4.14-testing
job build-amd64-xsm
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4e25a788d000e57c4d04fdd33c209d7173420580
  Bug not present: c45c2c2e09295ef3008a79d78673af0819ff4e4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167888/


  commit 4e25a788d000e57c4d04fdd33c209d7173420580
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Jan 25 13:52:30 2022 +0100
  
      x86/msr: Split MSR_SPEC_CTRL handling
      
      In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
      MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
      
      Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
      The SVM path is currently unreachable because of the CPUID policy.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      master commit: 6536688439dbca1d08fd6db5be29c39e3917fb2f
      master date: 2022-01-20 16:32:11 +0000


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.14-testing/build-amd64-xsm.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.14-testing/build-amd64-xsm.xen-build --summary-out=tmp/167888.bisection-summary --basis-template=167629 --blessings=real,real-bisect,real-retry xen-4.14-testing build-amd64-xsm xen-build
Searching for failure / basis pass:
 167822 fail [host=himrod1] / 167629 [host=fiano1] 167415 [host=godello0] 167216 ok.
Failure / basis pass flights: 167822 / 167216
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 50935b88b4cd7f9cefe9eb2ffc5150d06c501d05
Basis pass dfafa8e45382939fb5dc78e9d37b97b500a43613 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#dfafa8e45382939fb5dc78e9d37b97b500a43613-7e5c603cba0823fd97456984f4cfc21c4c831b52 git://xenbits.xen.org/qemu-xen-traditional.git#3c659044118e34603161457db9934a34f816d78b-3c659044118e34603161457db9934a34f816d78b git://xenbits.xen.org/qemu-xen.git#d7d6a60e73ee21e82f0bac2036153ccccf996e6c-d7d6a60e73ee21e82f0bac2036153ccccf996e6c git://xenbits.xen.org/osstest/seabios.git#2dd4b9b3f84019668719344b40dba79d681be\
 41c-e4f02c12518c0fe8154950b2e34c56a92721626e git://xenbits.xen.org/xen.git#c4cf5388652e8434652e30c73aa79635b4253675-50935b88b4cd7f9cefe9eb2ffc5150d06c501d05
Loaded 12639 nodes in revision graph
Searching for test results:
 167216 pass dfafa8e45382939fb5dc78e9d37b97b500a43613 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675
 167415 [host=godello0]
 167629 [host=fiano1]
 167812 [host=fiano0]
 167838 [host=fiano0]
 167841 [host=fiano0]
 167842 [host=fiano0]
 167843 [host=fiano0]
 167844 [host=fiano0]
 167845 [host=fiano0]
 167847 [host=fiano0]
 167848 [host=fiano0]
 167854 [host=fiano0]
 167857 [host=fiano0]
 167860 [host=fiano0]
 167822 fail 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 50935b88b4cd7f9cefe9eb2ffc5150d06c501d05
 167863 [host=fiano0]
 167866 pass dfafa8e45382939fb5dc78e9d37b97b500a43613 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675
 167868 fail 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 50935b88b4cd7f9cefe9eb2ffc5150d06c501d05
 167869 pass 04eacd39439d55bb1a5cbd366c19b1c03d5c7846 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675
 167870 pass ee1f8262b83dd88b30091e6e81221ff299796099 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 34c3fce6e7361c2e38f22a3d973d72b994285313 cbadf67bcab4e29c883410db393f4f5ef34df04a
 167872 pass 9dd14fc91c174eae87fd122c7ac70073a363527f 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 d8cf50574bd307f5f8a82ab3ee8e0fdab14cd09f
 167874 pass e73d1bf96a059d81c537108f532624a7b53a428f 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 45299b3cc83d3d19c24d74f7e28dcc83e8fa0c2e
 167875 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 45299b3cc83d3d19c24d74f7e28dcc83e8fa0c2e
 167876 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 6b776749ff7e45c30696235dbb4ecd2b53401cff
 167877 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e c45c2c2e09295ef3008a79d78673af0819ff4e4f
 167878 fail 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 4e25a788d000e57c4d04fdd33c209d7173420580
 167879 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e c45c2c2e09295ef3008a79d78673af0819ff4e4f
 167883 fail 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 4e25a788d000e57c4d04fdd33c209d7173420580
 167887 pass 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e c45c2c2e09295ef3008a79d78673af0819ff4e4f
 167888 fail 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 4e25a788d000e57c4d04fdd33c209d7173420580
Searching for interesting versions
 Result found: flight 167216 (pass), for basis pass
 For basis failure, parent search stopping at 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e c45c2c2e09295ef3008a79d78673af0819ff4e4f, results HASH(0x55ad5bbc3eb0) HASH(0x55ad5bbc98c8) HASH(0x55ad5bb9b440) For basis failure, parent search stopping at 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c125\
 18c0fe8154950b2e34c56a92721626e 6b776749ff7e45c30696235dbb4ecd2b53401cff, results HASH(0x55ad5bbc0c80) For basis failure, parent search stopping at 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e 45299b3cc83d3d19c24d74f7e28dcc83e8fa0c2e, results HASH(0x55ad5bbbcc70) For basis failure, parent search stopping at e73d1bf96a059d81c537108f532624a7b53a428f 3c659044118e34603161457db9934a3\
 4f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 45299b3cc83d3d19c24d74f7e28dcc83e8fa0c2e, results HASH(0x55ad5bbb9a40) For basis failure, parent search stopping at 9dd14fc91c174eae87fd122c7ac70073a363527f 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9 d8cf50574bd307f5f8a82ab3ee8e0fdab14cd09f, results HASH(0x55ad5bbb3c38) For basis failure, parent search stopping at ee1f8262b83d\
 d88b30091e6e81221ff299796099 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 34c3fce6e7361c2e38f22a3d973d72b994285313 cbadf67bcab4e29c883410db393f4f5ef34df04a, results HASH(0x55ad5bbb0a08) For basis failure, parent search stopping at 04eacd39439d55bb1a5cbd366c19b1c03d5c7846 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675, results HASH(0x55ad5bbac9f\
 8) For basis failure, parent search stopping at dfafa8e45382939fb5dc78e9d37b97b500a43613 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c 2dd4b9b3f84019668719344b40dba79d681be41c c4cf5388652e8434652e30c73aa79635b4253675, results HASH(0x55ad5bb96508) HASH(0x55ad5bba63b8) Result found: flight 167822 (fail), for basis failure (at ancestor ~662)
 Repro found: flight 167866 (pass), for basis pass
 Repro found: flight 167868 (fail), for basis failure
 0 revisions at 7e5c603cba0823fd97456984f4cfc21c4c831b52 3c659044118e34603161457db9934a34f816d78b d7d6a60e73ee21e82f0bac2036153ccccf996e6c e4f02c12518c0fe8154950b2e34c56a92721626e c45c2c2e09295ef3008a79d78673af0819ff4e4f
No revisions left to test, checking graph state.
 Result found: flight 167877 (pass), for last pass
 Result found: flight 167878 (fail), for first failure
 Repro found: flight 167879 (pass), for last pass
 Repro found: flight 167883 (fail), for first failure
 Repro found: flight 167887 (pass), for last pass
 Repro found: flight 167888 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  4e25a788d000e57c4d04fdd33c209d7173420580
  Bug not present: c45c2c2e09295ef3008a79d78673af0819ff4e4f
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/167888/


  commit 4e25a788d000e57c4d04fdd33c209d7173420580
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Jan 25 13:52:30 2022 +0100
  
      x86/msr: Split MSR_SPEC_CTRL handling
      
      In order to fix a VT-x bug, and support MSR_SPEC_CTRL on AMD, move
      MSR_SPEC_CTRL handling into the new {pv,hvm}_{get,set}_reg() infrastructure.
      
      Duplicate the msrs->spec_ctrl.raw accesses in the PV and VT-x paths for now.
      The SVM path is currently unreachable because of the CPUID policy.
      
      No functional change.
      
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>
      master commit: 6536688439dbca1d08fd6db5be29c39e3917fb2f
      master date: 2022-01-20 16:32:11 +0000

pnmtopng: 139 colors found
Revision graph left in /home/logs/results/bisect/xen-4.14-testing/build-amd64-xsm.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
167888: tolerable ALL FAIL

flight 167888 xen-4.14-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/167888/

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


