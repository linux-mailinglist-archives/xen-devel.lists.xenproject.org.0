Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211F128FE5
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2019 21:56:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ij8Ct-00017y-1U; Sun, 22 Dec 2019 20:52:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WOgP=2M=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1ij8Cs-00017t-2d
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2019 20:52:06 +0000
X-Inumbo-ID: e7c9b798-24fc-11ea-966f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c9b798-24fc-11ea-966f-12813bfff9fa;
 Sun, 22 Dec 2019 20:52:02 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ij8Co-0005Iw-El; Sun, 22 Dec 2019 20:52:02 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ij8Co-0004C4-2C; Sun, 22 Dec 2019 20:52:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1ij8Co-0002VP-1b; Sun, 22 Dec 2019 20:52:02 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1ij8Co-0002VP-1b@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 22 Dec 2019 20:52:02 +0000
Subject: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-amd64-qemuu-nested-intel
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
Content-Type: multipart/mixed; boundary="===============3580138015640237822=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3580138015640237822==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-qemuu-nested-intel
testid debian-hvm-install/l1/l2

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b1710040ca9628a6517bfc06f87dcbb670f8743e
  Bug not present: 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145120/


  commit b1710040ca9628a6517bfc06f87dcbb670f8743e
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Fri Dec 20 16:29:22 2019 +0100
  
      x86/apic: allow enabling x2APIC mode regardless of interrupt remapping
      
      x2APIC mode doesn't mandate interrupt remapping, and hence can be
      enabled independently. This patch enables x2APIC when available,
      regardless of whether there's interrupt remapping support.
      
      This is beneficial specially when running on virtualized environments,
      since it reduces the amount of vmexits. For example when sending an
      IPI in xAPIC mode Xen performs at least 3 different accesses to the
      APIC MMIO region, while when using x2APIC mode a single wrmsr is used.
      
      The following numbers are from a lock profiling of a Xen PV shim
      running a Linux PV kernel with 32 vCPUs and xAPIC mode:
      
      (XEN) Global lock flush_lock: addr=ffff82d0804af1c0, lockval=03190319, not locked
      (XEN)   lock:656153(892606463454), block:602183(9495067321843)
      
      Average lock time:   1360363ns
      Average block time: 15767743ns
      
      While the following are from the same configuration but with the shim
      using x2APIC mode:
      
      (XEN) Global lock flush_lock: addr=ffff82d0804b01c0, lockval=1adb1adb, not locked
      (XEN)   lock:1841883(1375128998543), block:1658716(10193054890781)
      
      Average lock time:   746588ns
      Average block time: 6145147ns
      
      Enabling x2APIC has halved the average lock time, thus reducing
      contention.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2 --summary-out=tmp/145120.bisection-summary --basis-template=145025 --blessings=real,real-bisect xen-unstable test-amd64-amd64-qemuu-nested-intel debian-hvm-install/l1/l2
Searching for failure / basis pass:
 145107 fail [host=debina1] / 145025 [host=chardonnay0] 144990 [host=elbling1] 144972 [host=huxelrebe1] 144959 [host=albana1] 144936 [host=fiano0] 144924 [host=fiano1] 144905 [host=italia0] 144887 [host=huxelrebe0] 144878 [host=chardonnay1] 144850 [host=albana0] 144827 [host=elbling0] 144813 [host=godello1] 144776 ok.
Failure / basis pass flights: 145107 / 144776
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
Basis pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 5852ca48526316918cd82fba1033a6a5379fbc4c
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#b98aebd298246df37b472c52a2ee1023256d02e3-b98aebd298246df37b472c52a2ee1023256d02e3 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#933ebad2470a169504799a1d95b8e41\
 0bd9847ef-933ebad2470a169504799a1d95b8e410bd9847ef git://xenbits.xen.org/xen.git#5852ca48526316918cd82fba1033a6a5379fbc4c-dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
Loaded 5001 nodes in revision graph
Searching for test results:
 144824 [host=godello1]
 144813 [host=godello1]
 144804 [host=godello1]
 144776 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 5852ca48526316918cd82fba1033a6a5379fbc4c
 144821 [host=godello1]
 144827 [host=elbling0]
 144850 [host=albana0]
 144878 [host=chardonnay1]
 144887 [host=huxelrebe0]
 144924 [host=fiano1]
 144905 [host=italia0]
 144990 [host=elbling1]
 144936 [host=fiano0]
 144959 [host=albana1]
 144972 [host=huxelrebe1]
 145058 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145025 [host=chardonnay0]
 145071 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145083 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145092 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef f9dee1f945ebb6fb5f9df6f5d95b15c25727f48e
 145080 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 5852ca48526316918cd82fba1033a6a5379fbc4c
 145090 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 25164571fc11ed3010c5885a98a68fac3b891d33
 145086 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 581deaa82952ac652ca1d838da34307a15031046
 145088 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145096 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 9356f9de41628f0675dd3458540b3558c52c4a8a
 145105 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef b1710040ca9628a6517bfc06f87dcbb670f8743e
 145101 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
 145109 blocked b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
 145111 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
 145114 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef b1710040ca9628a6517bfc06f87dcbb670f8743e
 145107 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef dffe18cf81a3c4c2260791d2246220a4d4f0cc8f
 145117 pass b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
 145120 fail b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef b1710040ca9628a6517bfc06f87dcbb670f8743e
Searching for interesting versions
 Result found: flight 144776 (pass), for basis pass
 Result found: flight 145058 (fail), for basis failure
 Repro found: flight 145080 (pass), for basis pass
 Repro found: flight 145083 (fail), for basis failure
 0 revisions at b98aebd298246df37b472c52a2ee1023256d02e3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 933ebad2470a169504799a1d95b8e410bd9847ef 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
No revisions left to test, checking graph state.
 Result found: flight 145101 (pass), for last pass
 Result found: flight 145105 (fail), for first failure
 Repro found: flight 145111 (pass), for last pass
 Repro found: flight 145114 (fail), for first failure
 Repro found: flight 145117 (pass), for last pass
 Repro found: flight 145120 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  b1710040ca9628a6517bfc06f87dcbb670f8743e
  Bug not present: 3d05407025ed1f83f492f81ba8175fa26b1e2fb3
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/145120/


  commit b1710040ca9628a6517bfc06f87dcbb670f8743e
  Author: Roger Pau Monné <roger.pau@citrix.com>
  Date:   Fri Dec 20 16:29:22 2019 +0100
  
      x86/apic: allow enabling x2APIC mode regardless of interrupt remapping
      
      x2APIC mode doesn't mandate interrupt remapping, and hence can be
      enabled independently. This patch enables x2APIC when available,
      regardless of whether there's interrupt remapping support.
      
      This is beneficial specially when running on virtualized environments,
      since it reduces the amount of vmexits. For example when sending an
      IPI in xAPIC mode Xen performs at least 3 different accesses to the
      APIC MMIO region, while when using x2APIC mode a single wrmsr is used.
      
      The following numbers are from a lock profiling of a Xen PV shim
      running a Linux PV kernel with 32 vCPUs and xAPIC mode:
      
      (XEN) Global lock flush_lock: addr=ffff82d0804af1c0, lockval=03190319, not locked
      (XEN)   lock:656153(892606463454), block:602183(9495067321843)
      
      Average lock time:   1360363ns
      Average block time: 15767743ns
      
      While the following are from the same configuration but with the shim
      using x2APIC mode:
      
      (XEN) Global lock flush_lock: addr=ffff82d0804b01c0, lockval=1adb1adb, not locked
      (XEN)   lock:1841883(1375128998543), block:1658716(10193054890781)
      
      Average lock time:   746588ns
      Average block time: 6145147ns
      
      Enabling x2APIC has halved the average lock time, thus reducing
      contention.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-qemuu-nested-intel.debian-hvm-install--l1--l2.{dot,ps,png,html,svg}.
----------------------------------------
145120: tolerable ALL FAIL

flight 145120 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/145120/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 18 capture-logs/l1(18) fail baseline untested
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail baseline untested


jobs:
 test-amd64-amd64-qemuu-nested-intel                          fail    


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



--===============3580138015640237822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3580138015640237822==--
