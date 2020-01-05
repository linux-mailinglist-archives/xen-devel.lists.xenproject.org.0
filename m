Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC61308DE
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 16:47:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io82D-0006BJ-KV; Sun, 05 Jan 2020 15:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WYJy=22=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1io82C-0006BE-3M
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 15:41:44 +0000
X-Inumbo-ID: d22db0e4-2fd1-11ea-a1e1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d22db0e4-2fd1-11ea-a1e1-bc764e2007e4;
 Sun, 05 Jan 2020 15:41:21 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1io81o-00014d-BC; Sun, 05 Jan 2020 15:41:20 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1io81n-0000mQ-Qt; Sun, 05 Jan 2020 15:41:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1io81n-0001KM-Pu; Sun, 05 Jan 2020 15:41:19 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1io81n-0001KM-Pu@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 05 Jan 2020 15:41:19 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-arm64-libvirt
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
Content-Type: multipart/mixed; boundary="===============4063545447403918390=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4063545447403918390==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-arm64-libvirt
testid libvirt-build

Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145619/


  commit 810613a60efe3924c536b3663246900bc08910a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Dec 23 15:37:26 2019 +0000
  
      src: replace strptime()/timegm()/mktime() with GDateTime APIs set
      
      All places where we use strptime/timegm()/mktime() are handling
      conversion of dates in a format compatible with ISO 8601, so we
      can use the GDateTime APIs to simplify code.
      
      Reviewed-by: Fabiano Fidêncio <fidencio@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build --summary-out=tmp/145619.bisection-summary --basis-template=145511 --blessings=real,real-bisect libvirt build-arm64-libvirt libvirt-build
Searching for failure / basis pass:
 145589 fail [host=laxton0] / 145511 [host=laxton1] 145212 [host=rochester0] 145173 ok.
Failure / basis pass flights: 145589 / 145173
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7b3c5b70a32303b46d0d051e695f18d72cce5ed0
Basis pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#546e1c112d6a0f97404c9b43ccb070ae7b6af538-fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-7d069378921bfa0d7c7198ea177aac0a2440016f https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#caa917491a4bfb295d2afad86e4c34fd48e1f7b\
 5-b948a496150f4ae4f656c0f0ab672608723c80e6 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 git://xenbits.xen.org/xen.git#0cd791c499bdc698d14a24050ec56d60b45732e0-7b3c5b70a32303b46d0d051e695f18d72cce5ed0
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

Loaded 35070 nodes in revision graph
Searching for test results:
 145173 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145181 [host=rochester0]
 145212 [host=rochester0]
 145511 [host=laxton1]
 145597 fail irrelevant
 145582 pass irrelevant
 145542 fail irrelevant
 145613 fail 86d223a762990c9d529065a2d3b30b6a00ea63dd 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145584 pass irrelevant
 145598 pass irrelevant
 145589 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7b3c5b70a32303b46d0d051e695f18d72cce5ed0
 145606 pass 1ed32989ea27589c34f8f3f4f79dde4bfb0b40bb 72e357240fac86530a9b9fdfad56c0a1619c7b5b 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 3a13ac3ad4d3ef399fe2c85fb09fcb7ab1cdd140
 145600 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145588 pass irrelevant
 145590 pass irrelevant
 145575 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145579 fail irrelevant
 145591 pass irrelevant
 145580 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 253f29d8b391ebe8cea50355eda351bb7962e160 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145608 pass 4eed65abec1de82200ac25e88d9a214c6321938b 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145593 pass irrelevant
 145615 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145595 fail irrelevant
 145609 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145596 pass irrelevant
 145601 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7b3c5b70a32303b46d0d051e695f18d72cce5ed0
 145616 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145604 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 74528fe27f84f75ed94b2713b9176a06ebe2cb42 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145611 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 5babcc9a334830ff530b7e65a4da3789c083e102
 145612 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 bf08a8a08a2ee8cef5fb7b3b274b0e09123a41bd
 145617 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145618 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
 145619 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
Searching for interesting versions
 Result found: flight 145173 (pass), for basis pass
 Result found: flight 145589 (fail), for basis failure
 Repro found: flight 145600 (pass), for basis pass
 Repro found: flight 145601 (fail), for basis failure
 0 revisions at f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 7ad3d07b37e8f3b15772de8bc1367c68ea681eee
No revisions left to test, checking graph state.
 Result found: flight 145609 (pass), for last pass
 Result found: flight 145615 (fail), for first failure
 Repro found: flight 145616 (pass), for last pass
 Repro found: flight 145617 (fail), for first failure
 Repro found: flight 145618 (pass), for last pass
 Repro found: flight 145619 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145619/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 810613a60efe3924c536b3663246900bc08910a5
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Mon Dec 23 15:37:26 2019 +0000
  
      src: replace strptime()/timegm()/mktime() with GDateTime APIs set
      
      All places where we use strptime/timegm()/mktime() are handling
      conversion of dates in a format compatible with ISO 8601, so we
      can use the GDateTime APIs to simplify code.
      
      Reviewed-by: Fabiano Fidêncio <fidencio@redhat.com>
      Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

pnmtopng: 152 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-arm64-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
145619: tolerable ALL FAIL

flight 145619 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/145619/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-arm64-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-arm64-libvirt                                          fail    


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



--===============4063545447403918390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4063545447403918390==--
