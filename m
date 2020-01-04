Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC51304F0
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 23:30:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inrrf-0001oU-H2; Sat, 04 Jan 2020 22:25:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPSU=2Z=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1inrrd-0001oP-KZ
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 22:25:45 +0000
X-Inumbo-ID: 254dd39e-2f41-11ea-a807-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 254dd39e-2f41-11ea-a807-12813bfff9fa;
 Sat, 04 Jan 2020 22:25:43 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1inrrb-0003UZ-0d; Sat, 04 Jan 2020 22:25:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1inrra-0003wN-LR; Sat, 04 Jan 2020 22:25:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1inrra-00050A-Km; Sat, 04 Jan 2020 22:25:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1inrra-00050A-Km@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Jan 2020 22:25:42 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-i386-libvirt
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
Content-Type: multipart/mixed; boundary="===============0796769846346743101=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0796769846346743101==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-i386-libvirt
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
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145574/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-i386-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build --summary-out=tmp/145574.bisection-summary --basis-template=145511 --blessings=real,real-bisect libvirt build-i386-libvirt libvirt-build
Searching for failure / basis pass:
 145542 fail [host=elbling1] / 145511 [host=italia0] 145212 [host=huxelrebe1] 145173 ok.
Failure / basis pass flights: 145542 / 145173
(tree with no url: minios)
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
Basis pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#546e1c112d6a0f97404c9b43ccb070ae7b6af538-fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 https://git.savannah.gnu.org/git/gnulib.git/#1f6fb368c04919243e2c70f2aa514a5f88e95309-7d069378921bfa0d7c7198ea177aac0a2440016f https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#caa917491a4bfb295d2afad86e4c34fd48e1f7b\
 5-b948a496150f4ae4f656c0f0ab672608723c80e6 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 git://xenbits.xen.org/xen.git#0cd791c499bdc698d14a24050ec56d60b45732e0-0cd791c499bdc698\
 d14a24050ec56d60b45732e0
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

Loaded 15001 nodes in revision graph
Searching for test results:
 145173 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145212 [host=huxelrebe1]
 145511 [host=italia0]
 145560 pass f5e9bdb87feed6834977ee9813405206d26fcad0 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145563 pass 0b4598b183aab401d64b0bf7b3537ab86766e563 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145565 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145542 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145567 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145545 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 1f6fb368c04919243e2c70f2aa514a5f88e95309 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145569 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145549 fail fe1f2bfbe3ca8944df37c6b77f813eaab572a2f7 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145570 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145551 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 253f29d8b391ebe8cea50355eda351bb7962e160 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145554 pass 546e1c112d6a0f97404c9b43ccb070ae7b6af538 00b4820cc972dd38f6251a21d255ee63419a1d45 317d3eeb963a515e15a63fa356d8ebcda7041a51 caa917491a4bfb295d2afad86e4c34fd48e1f7b5 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145555 pass 1ed32989ea27589c34f8f3f4f79dde4bfb0b40bb 87b59dc7b4017eefe7bc8dbb3b035a05b42db765 317d3eeb963a515e15a63fa356d8ebcda7041a51 a5abd9cc2cebe7fac001f7bb7b647c47cf54af1a d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145571 pass f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145558 pass e73a997359bd7572faa535cace18113cd492c63a 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
 145574 fail 810613a60efe3924c536b3663246900bc08910a5 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
Searching for interesting versions
 Result found: flight 145173 (pass), for basis pass
 Result found: flight 145542 (fail), for basis failure
 Repro found: flight 145545 (pass), for basis pass
 Repro found: flight 145549 (fail), for basis failure
 0 revisions at f6a750e678fb0ca3898cba08b6698f079008924c 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 b948a496150f4ae4f656c0f0ab672608723c80e6 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 0cd791c499bdc698d14a24050ec56d60b45732e0
No revisions left to test, checking graph state.
 Result found: flight 145565 (pass), for last pass
 Result found: flight 145567 (fail), for first failure
 Repro found: flight 145569 (pass), for last pass
 Repro found: flight 145570 (fail), for first failure
 Repro found: flight 145571 (pass), for last pass
 Repro found: flight 145574 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  810613a60efe3924c536b3663246900bc08910a5
  Bug not present: f6a750e678fb0ca3898cba08b6698f079008924c
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145574/

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

pnmtopng: 141 colors found
Revision graph left in /home/logs/results/bisect/libvirt/build-i386-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
145574: tolerable ALL FAIL

flight 145574 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/145574/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-i386-libvirt            6 libvirt-build           fail baseline untested


jobs:
 build-i386-libvirt                                           fail    


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



--===============0796769846346743101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0796769846346743101==--
