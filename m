Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EDBE4225
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 05:43:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNqSw-0005vs-GD; Fri, 25 Oct 2019 03:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HTgd=YS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iNqSu-0005vn-OR
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 03:40:40 +0000
X-Inumbo-ID: 358dff90-f6d9-11e9-beca-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 358dff90-f6d9-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 03:40:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iNqSr-0008Mr-31; Fri, 25 Oct 2019 03:40:37 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iNqSq-0005Pb-OK; Fri, 25 Oct 2019 03:40:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iNqSq-0000xF-Nh; Fri, 25 Oct 2019 03:40:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iNqSq-0000xF-Nh@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 25 Oct 2019 03:40:36 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-amd64-libvirt
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
Content-Type: multipart/mixed; boundary="===============6255848720716458210=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6255848720716458210==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-amd64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  3097282d8668693eb4b7c3fb1b4fe5b474996b9c
  Bug not present: 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143136/


  commit 3097282d8668693eb4b7c3fb1b4fe5b474996b9c
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Tue Oct 15 12:41:29 2019 +0200
  
      build: move admin code into admin directory
      
      There is no need to have the libvirt-admin.so library definition in the
      src directory.  In addition the library uses directly code from admin
      sub-directory so move the remaining bits there as well.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build --summary-out=tmp/143136.bisection-summary --basis-template=143023 --blessings=real,real-bisect libvirt build-amd64-libvirt libvirt-build
Searching for failure / basis pass:
 143085 fail [host=italia0] / 143051 [host=huxelrebe1] 143023 [host=debina0] 142949 [host=huxelrebe1] 142904 ok.
Failure / basis pass flights: 143085 / 142904
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Basis pass 313a71ee7b424126a4507b12335fd77b51dab433 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e026bb4c39a28ca9be5dc994c14bb21cc283c9e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#313a71ee7b424126a4507b12335fd77b51dab433-b3739aa63f89fdb426226027f0b244cb15c1ea10 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-1f6fb368c04919243e2c70f2aa514a5f88e95309 https://gitlab.com/keycodemap/keycodemapdb.git#6280c94f306df6a20bbc100ba15a5a81af0366e6-6280c94f306df6a20bbc100ba15a5a81af0366e6 git://xenbits.xen.org/osstest/ovmf.git#e026bb4c39a28ca9be5dc994c14bb21cc283c9e\
 8-53b1dd1036df3839d46bb150f7a8b2037390093a git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#43f5df79dad6738d52ea79d072de2b56eb96a91f-120996f147131eca8af90e30c900bc14bc824d9f git://xenbits.xen.org/xen.git#518c935fac4d30b3ec35d4b6add82b17b7d7aca3-518c935fac4d30b3\
 ec35d4b6add82b17b7d7aca3
From git://cache:9419/git://libvirt.org/libvirt
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.0-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.1-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.10-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.11-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.12-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.2-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.3-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.4-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.5-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.6-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.7-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.8-testing
 - [deleted]               (none)     -> origin/osstest/frozen/xen-4.9-testing
 - [deleted]               (none)     -> origin/xen-tested-master
 * [new branch]            master        -> origin/master
 * [new branch]            v0.10.2-maint -> origin/v0.10.2-maint
 * [new branch]            v0.8.3-maint  -> origin/v0.8.3-maint
 * [new branch]            v0.9.11-maint -> origin/v0.9.11-maint
 * [new branch]            v0.9.12-maint -> origin/v0.9.12-maint
 * [new branch]            v0.9.6-maint  -> origin/v0.9.6-maint
 * [new branch]            v1.0.0-maint  -> origin/v1.0.0-maint
 * [new branch]            v1.0.1-maint  -> origin/v1.0.1-maint
 * [new branch]            v1.0.2-maint  -> origin/v1.0.2-maint
 * [new branch]            v1.0.3-maint  -> origin/v1.0.3-maint
 * [new branch]            v1.0.4-maint  -> origin/v1.0.4-maint
 * [new branch]            v1.0.5-maint  -> origin/v1.0.5-maint
 * [new branch]            v1.0.6-maint  -> origin/v1.0.6-maint
 * [new branch]            v1.1.0-maint  -> origin/v1.1.0-maint
 * [new branch]            v1.1.1-maint  -> origin/v1.1.1-maint
 * [new branch]            v1.1.2-maint  -> origin/v1.1.2-maint
 * [new branch]            v1.1.3-maint  -> origin/v1.1.3-maint
 * [new branch]            v1.1.4-maint  -> origin/v1.1.4-maint
 * [new branch]            v1.2.0-maint  -> origin/v1.2.0-maint
 * [new branch]            v1.2.1-maint  -> origin/v1.2.1-maint
 * [new branch]            v1.2.10-maint -> origin/v1.2.10-maint
 * [new branch]            v1.2.11-maint -> origin/v1.2.11-maint
 * [new branch]            v1.2.12-maint -> origin/v1.2.12-maint
 * [new branch]            v1.2.13-maint -> origin/v1.2.13-maint
 * [new branch]            v1.2.14-maint -> origin/v1.2.14-maint
 * [new branch]            v1.2.15-maint -> origin/v1.2.15-maint
 * [new branch]            v1.2.16-maint -> origin/v1.2.16-maint
 * [new branch]            v1.2.17-maint -> origin/v1.2.17-maint
 * [new branch]            v1.2.18-maint -> origin/v1.2.18-maint
 * [new branch]            v1.2.19-maint -> origin/v1.2.19-maint
 * [new branch]            v1.2.2-maint  -> origin/v1.2.2-maint
 * [new branch]            v1.2.20-maint -> origin/v1.2.20-maint
 * [new branch]            v1.2.21-maint -> origin/v1.2.21-maint
 * [new branch]            v1.2.3-maint  -> origin/v1.2.3-maint
 * [new branch]            v1.2.4-maint  -> origin/v1.2.4-maint
 * [new branch]            v1.2.5-maint  -> origin/v1.2.5-maint
 * [new branch]            v1.2.6-maint  -> origin/v1.2.6-maint
 * [new branch]            v1.2.7-maint  -> origin/v1.2.7-maint
 * [new branch]            v1.2.8-maint  -> origin/v1.2.8-maint
 * [new branch]            v1.2.9-maint  -> origin/v1.2.9-maint
 * [new branch]            v1.3.0-maint  -> origin/v1.3.0-maint
 * [new branch]            v1.3.1-maint  -> origin/v1.3.1-maint
 * [new branch]            v1.3.2-maint  -> origin/v1.3.2-maint
 * [new branch]            v1.3.3-maint  -> origin/v1.3.3-maint
 * [new branch]            v1.3.4-maint  -> origin/v1.3.4-maint
 * [new branch]            v1.3.5-maint  -> origin/v1.3.5-maint
 * [new branch]            v2.0-maint    -> origin/v2.0-maint
 * [new branch]            v2.1-maint    -> origin/v2.1-maint
 * [new branch]            v2.2-maint    -> origin/v2.2-maint
 * [new branch]            v3.0-maint    -> origin/v3.0-maint
 * [new branch]            v3.2-maint    -> origin/v3.2-maint
 * [new branch]            v3.7-maint    -> origin/v3.7-maint
 * [new branch]            v4.1-maint    -> origin/v4.1-maint
 * [new branch]            v4.10-maint   -> origin/v4.10-maint
 * [new branch]            v4.2-maint    -> origin/v4.2-maint
 * [new branch]            v4.3-maint    -> origin/v4.3-maint
 * [new branch]            v4.4-maint    -> origin/v4.4-maint
 * [new branch]            v4.5-maint    -> origin/v4.5-maint
 * [new branch]            v4.6-maint    -> origin/v4.6-maint
 * [new branch]            v4.7-maint    -> origin/v4.7-maint
 * [new branch]            v4.8-maint    -> origin/v4.8-maint
 * [new branch]            v4.9-maint    -> origin/v4.9-maint
 * [new branch]            v5.0-maint    -> origin/v5.0-maint
 * [new branch]            v5.1-maint    -> origin/v5.1-maint
 * [new branch]            v5.1.0-maint  -> origin/v5.1.0-maint
 * [new branch]            v5.2-maint    -> origin/v5.2-maint
 * [new branch]            v5.3-maint    -> origin/v5.3-maint
Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.

Loaded 3001 nodes in revision graph
Searching for test results:
 142949 [host=huxelrebe1]
 142904 pass 313a71ee7b424126a4507b12335fd77b51dab433 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e026bb4c39a28ca9be5dc994c14bb21cc283c9e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143023 [host=debina0]
 143051 [host=huxelrebe1]
 143065 [host=fiano0]
 143136 fail 3097282d8668693eb4b7c3fb1b4fe5b474996b9c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143083 [host=italia1]
 143100 pass 313a71ee7b424126a4507b12335fd77b51dab433 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 e026bb4c39a28ca9be5dc994c14bb21cc283c9e8 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 43f5df79dad6738d52ea79d072de2b56eb96a91f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143116 pass 8e09cf1d5a6b8bcf21bfb7d409a2ecf94be54ff1 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143125 fail 82a643a671780bae45525a7a5574a303c42ef460 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143085 fail b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143120 pass 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143131 fail 3097282d8668693eb4b7c3fb1b4fe5b474996b9c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143106 fail b3739aa63f89fdb426226027f0b244cb15c1ea10 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143113 pass 0dfc7c60594d689b4cf81dfa4234fa41d48c7708 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 91f98c908627f4cde8f7139c80e8004b79d1d0ba d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143115 pass 136d907ff627258af9d42085aa7c2915e4db074d 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 46bb81200742fabfe5c5624c22e72f036af02869 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143129 fail 3097282d8668693eb4b7c3fb1b4fe5b474996b9c 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143121 fail 2b2c3361b6c3da307e105eec67d66bfe6fe405be 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143130 pass 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
 143134 pass 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
Searching for interesting versions
 Result found: flight 142904 (pass), for basis pass
 Result found: flight 143085 (fail), for basis failure
 Repro found: flight 143100 (pass), for basis pass
 Repro found: flight 143106 (fail), for basis failure
 0 revisions at 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2 1f6fb368c04919243e2c70f2aa514a5f88e95309 6280c94f306df6a20bbc100ba15a5a81af0366e6 53b1dd1036df3839d46bb150f7a8b2037390093a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 120996f147131eca8af90e30c900bc14bc824d9f 518c935fac4d30b3ec35d4b6add82b17b7d7aca3
No revisions left to test, checking graph state.
 Result found: flight 143120 (pass), for last pass
 Result found: flight 143129 (fail), for first failure
 Repro found: flight 143130 (pass), for last pass
 Repro found: flight 143131 (fail), for first failure
 Repro found: flight 143134 (pass), for last pass
 Repro found: flight 143136 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  3097282d8668693eb4b7c3fb1b4fe5b474996b9c
  Bug not present: 32ea231b21d8d7b88d2f2a7d57916098baf8cfa2
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/143136/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 3097282d8668693eb4b7c3fb1b4fe5b474996b9c
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Tue Oct 15 12:41:29 2019 +0200
  
      build: move admin code into admin directory
      
      There is no need to have the libvirt-admin.so library definition in the
      src directory.  In addition the library uses directly code from admin
      sub-directory so move the remaining bits there as well.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Ján Tomko <jtomko@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-amd64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
143136: tolerable ALL FAIL

flight 143136 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/143136/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-amd64-libvirt                                          fail    


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



--===============6255848720716458210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6255848720716458210==--
