Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35A146141
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 06:04:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuUaQ-0007EN-HB; Thu, 23 Jan 2020 04:59:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mdSW=3M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1iuUaP-0007EI-BN
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 04:59:21 +0000
X-Inumbo-ID: 135271ee-3d9d-11ea-b833-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 135271ee-3d9d-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 04:59:03 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iuUa6-00086I-RF; Thu, 23 Jan 2020 04:59:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1iuUa6-0000Gg-J8; Thu, 23 Jan 2020 04:59:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1iuUa6-0006DP-IT; Thu, 23 Jan 2020 04:59:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1iuUa6-0006DP-IT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Jan 2020 04:59:02 +0000
Subject: [Xen-devel] [libvirt bisection] complete build-armhf-libvirt
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
Content-Type: multipart/mixed; boundary="===============6419298496753586689=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6419298496753586689==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job build-armhf-libvirt
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
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146411/


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build --summary-out=tmp/146411.bisection-summary --basis-template=146182 --blessings=real,real-bisect libvirt build-armhf-libvirt libvirt-build
Searching for failure / basis pass:
 146374 fail [host=cubietruck-braque] / 146182 [host=cubietruck-picasso] 146156 [host=cubietruck-metzinger] 146103 [host=cubietruck-picasso] 146061 [host=cubietruck-picasso] 145969 ok.
Failure / basis pass flights: 146374 / 145969
Tree: libvirt git://libvirt.org/libvirt.git
Tree: libvirt_gnulib https://git.savannah.gnu.org/git/gnulib.git/
Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
Basis pass 4a09c143f6c467230ab60c20fea560e710ddeee0 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 fae249d23413b2bf7d98a97d8f649cf7d102c1ae
Generating revisions with ./adhoc-revtuple-generator  git://libvirt.org/libvirt.git#4a09c143f6c467230ab60c20fea560e710ddeee0-6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 https://git.savannah.gnu.org/git/gnulib.git/#7d069378921bfa0d7c7198ea177aac0a2440016f-611869be9f1083e53305446d90a2909fc89914ef https://gitlab.com/keycodemap/keycodemapdb.git#317d3eeb963a515e15a63fa356d8ebcda7041a51-317d3eeb963a515e15a63fa356d8ebcda7041a51 git://xenbits.xen.org/osstest/ovmf.git#70911f1f4aee0366b6122f2b90d367ec0f066be\
 b-70911f1f4aee0366b6122f2b90d367ec0f066beb git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e410bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/osstest/seabios.git#f21b5a4aeb020f2a5e2c6503f906a9349dd2f069-76551856b28d227cb0386a1ab0e774329b941f7d git://xenbits.xen.org/xen.git#fae249d23413b2bf7d98a97d8f649cf7d102c1ae-03bfe526ecadc86f31eda433b91dc90be0563919
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

Use of uninitialized value $parents in array dereference at ./adhoc-revtuple-generator line 465.
Use of uninitialized value in concatenation (.) or string at ./adhoc-revtuple-generator line 465.
Loaded 17537 nodes in revision graph
Searching for test results:
 145969 pass 4a09c143f6c467230ab60c20fea560e710ddeee0 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 fae249d23413b2bf7d98a97d8f649cf7d102c1ae
 146061 [host=cubietruck-picasso]
 146069 pass irrelevant
 146084 pass irrelevant
 146103 [host=cubietruck-picasso]
 146182 [host=cubietruck-picasso]
 146156 [host=cubietruck-metzinger]
 146240 [host=cubietruck-picasso]
 146211 [host=cubietruck-metzinger]
 146299 fail irrelevant
 146347 pass irrelevant
 146366 [host=cubietruck-picasso]
 146344 [host=cubietruck-picasso]
 146348 pass irrelevant
 146380 pass 4a09c143f6c467230ab60c20fea560e710ddeee0 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 fae249d23413b2bf7d98a97d8f649cf7d102c1ae
 146406 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146368 [host=cubietruck-picasso]
 146334 pass 4a09c143f6c467230ab60c20fea560e710ddeee0 7d069378921bfa0d7c7198ea177aac0a2440016f 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 fae249d23413b2bf7d98a97d8f649cf7d102c1ae
 146392 pass 6b4140dafb6b3db9ead2e260757f1c3583936f19 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146339 fail irrelevant
 146341 pass c2642c488931cc1f19f7d3a8b59fcfc8f9e40ee2 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef f21b5a4aeb020f2a5e2c6503f906a9349dd2f069 03bfe526ecadc86f31eda433b91dc90be0563919
 146352 [host=cubietruck-picasso]
 146371 [host=cubietruck-picasso]
 146359 [host=cubietruck-picasso]
 146342 pass irrelevant
 146411 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146383 fail 6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146360 [host=cubietruck-picasso]
 146364 [host=cubietruck-picasso]
 146399 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146373 [host=cubietruck-picasso]
 146377 [host=cubietruck-picasso]
 146386 pass bdb8a800b4920cf9184fd2fd117b17c67ba74dfb 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146374 fail 6c1dddaf97b4ef70e27961c9f79b15c79a863ac5 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146378 [host=cubietruck-picasso]
 146389 pass 9bb3571f10880eb92e0d7b0bcc47ee862d969b90 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146402 fail 4d5f50d86b760864240c695adc341379fb47a796 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146394 fail d0236e2a554f2321512276b897e8a8a44f68e969 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146404 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
 146407 pass a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
Searching for interesting versions
 Result found: flight 145969 (pass), for basis pass
 Result found: flight 146374 (fail), for basis failure
 Repro found: flight 146380 (pass), for basis pass
 Repro found: flight 146383 (fail), for basis failure
 0 revisions at a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7 611869be9f1083e53305446d90a2909fc89914ef 317d3eeb963a515e15a63fa356d8ebcda7041a51 70911f1f4aee0366b6122f2b90d367ec0f066beb 933ebad2470a169504799a1d95b8e410bd9847ef 76551856b28d227cb0386a1ab0e774329b941f7d 03bfe526ecadc86f31eda433b91dc90be0563919
No revisions left to test, checking graph state.
 Result found: flight 146399 (pass), for last pass
 Result found: flight 146402 (fail), for first failure
 Repro found: flight 146404 (pass), for last pass
 Repro found: flight 146406 (fail), for first failure
 Repro found: flight 146407 (pass), for last pass
 Repro found: flight 146411 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  libvirt git://libvirt.org/libvirt.git
  Bug introduced:  4d5f50d86b760864240c695adc341379fb47a796
  Bug not present: a1a18c6ab55869d3b00cf8c32e0e2262a10c8ce7
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/146411/

Auto packing the repository in background for optimum performance.
See "git help gc" for manual housekeeping.
error: The last gc run reported the following. Please correct the root cause
and remove gc.log.
Automatic cleanup will not be performed until the file is removed.

warning: There are too many unreachable loose objects; run 'git prune' to remove them.


  commit 4d5f50d86b760864240c695adc341379fb47a796
  Author: Pavel Hrdina <phrdina@redhat.com>
  Date:   Wed Jan 8 22:54:31 2020 +0100
  
      bootstrap.conf: stop creating AUTHORS file
      
      The existence of AUTHORS file is required for GNU projects but since
      commit <8bfb36db40f38e92823b657b5a342652064b5adc> we do not require
      these files to exist.
      
      Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Revision graph left in /home/logs/results/bisect/libvirt/build-armhf-libvirt.libvirt-build.{dot,ps,png,html,svg}.
----------------------------------------
146411: tolerable ALL FAIL

flight 146411 libvirt real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/146411/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-armhf-libvirt           6 libvirt-build           fail baseline untested


jobs:
 build-armhf-libvirt                                          fail    


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



--===============6419298496753586689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6419298496753586689==--
