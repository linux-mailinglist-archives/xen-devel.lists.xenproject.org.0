Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3D8A3F7B
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 00:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705261.1101908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvlgz-0007P3-It; Sat, 13 Apr 2024 22:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705261.1101908; Sat, 13 Apr 2024 22:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvlgz-0007MJ-GH; Sat, 13 Apr 2024 22:17:49 +0000
Received: by outflank-mailman (input) for mailman id 705261;
 Sat, 13 Apr 2024 22:17:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvlgx-0007M7-Od; Sat, 13 Apr 2024 22:17:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvlgx-0008Cl-Bq; Sat, 13 Apr 2024 22:17:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rvlgx-0005jQ-5H; Sat, 13 Apr 2024 22:17:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rvlgx-00067T-4v; Sat, 13 Apr 2024 22:17:47 +0000
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
	bh=UJarv0wWF0+DXjOKkL7a9CazrP476mMPyK/cHv13uBY=; b=qVuGntVgB2EY0q8+i1aZcRRbB8
	N+AxVhJChFNi9oYoguznu3oF1ro25F/hKXukqwnFfi1ew0cSqlIJKEx54f7iyJFp/sGDn1bZMIBF3
	CXVFr5g63tV7XvGXbS9OFRTLuhmAcV/kp/197X6/MaZ8CtyAjTMEyZ0b2u683oubfmN8=;
To: xen-devel@lists.xenproject.org
Subject: [xen-4.16-testing bisection] complete test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
Message-Id: <E1rvlgx-00067T-4v@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 13 Apr 2024 22:17:47 +0000

branch xen-4.16-testing
xenbranch xen-4.16-testing
job test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm
testid guest-saverestore

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  295bf24af77c0556fe023ce727734fd27226b37c
  Bug not present: ec8f105f9c7744408ddea6b320d55703f9e0f522
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185455/


  commit 295bf24af77c0556fe023ce727734fd27226b37c
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 15 17:46:53 2024 +0100
  
      x86/vmx: Add support for virtualize SPEC_CTRL
      
      The feature is defined in the tertiary exec control, and is available starting
      from Sapphire Rapids and Alder Lake CPUs.
      
      When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
      set in mask are not allowed to be toggled by the guest (either set or clear)
      and the value in the shadow field is the value the guest expects to be in the
      SPEC_CTRL register.
      
      By using it the hypervisor can force the value of SPEC_CTRL bits behind the
      guest back without having to trap all accesses to SPEC_CTRL, note that no bits
      are forced into the guest as part of this patch.  It also allows getting rid of
      SPEC_CTRL in the guest MSR load list, since the value in the shadow field will
      be loaded by the hardware on vmentry.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      (cherry picked from commit 97c5b8b657e41a6645de9d40713b881234417b49)


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore --summary-out=tmp/185455.bisection-summary --basis-template=185283 --blessings=real,real-bisect,real-retry xen-4.16-testing test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm guest-saverestore
Searching for failure / basis pass:
 185322 fail [host=septiner1] / 185283 [host=rimava0] 185007 [host=godello0] 184804 [host=sabro0] 184530 [host=nobling1] 184108 [host=rimava0] 183752 [host=debina0] 183357 [host=debina0] 183350 [host=fiano1] 183341 [host=debina1] 183082 [host=elbling0] 182634 [host=italia1] 182236 [host=himrod0] 182166 [host=godello1] 182107 [host=pinot0] 182094 [host=debina1] 181998 [host=huxelrebe1] 181882 [host=italia0] 181851 [host=nobling1] 181831 [host=albana1] 180918 [host=nobling0] 180478 [host=debina1] \
 180464 [host=albana1] 180445 [host=elbling0] 180407 [host=huxelrebe0] 180397 [host=pinot0] 180219 [host=albana1] 180086 [host=himrod0] 179858 [host=pinot0] 179842 [host=nocera1] 179065 [host=nocera0] 178448 [host=italia1] 178378 [host=italia0] 178195 [host=pinot1] 178138 [host=elbling1] 177405 [host=nobling1] 176835 [host=himrod0] 176755 [host=sabro0] 176458 [host=huxelrebe1] 175454 [host=huxelrebe0] 175155 [host=sabro0] 175099 [host=italia1] 175089 [host=pinot1] 175067 [host=huxelrebe0] 174981 \
 [host=albana0] 174767 [host=fiano1] 174695 [host=debina1] 174678 [host=debina0] 174568 [host=albana0] 174553 [host=albana1] 174452 [host=fiano0] 174383 [host=elbling0] 174314 [host=godello1] 174267 [host=nocera0] 174212 [host=chardonnay0] 174140 [host=pinot1] 174070 [host=italia1] 173986 [host=nobling0] 173882 [host=godello0] 173759 [host=sabro0] 173702 [host=huxelrebe1] 173603 [host=albana1] 173511 [host=himrod0] 173493 [host=fiano0] 172623 [host=albana0] 172548 [host=godello0] 172130 [host=alb\
 ana0] 172110 [host=debina1] 171881 [host=debina0] 171867 [host=himrod0] 171637 [host=nocera0] 171628 [host=chardonnay1] 171608 [host=nocera1] 171595 [host=debina0] 171207 [host=godello1] 170984 [host=nobling1] 170913 [host=huxelrebe1] 170901 [host=nobling0] 170871 [host=italia1] 169252 [host=albana0] 169238 [host=himrod0] 169194 [host=elbling0] 169179 [host=fiano1] 169119 [host=fiano0] 169086 [host=godello1] 169048 [host=chardonnay1] 168993 [host=godello0] 168513 [host=godello1] 168503 [host=god\
 ello0] 168484 [host=huxelrebe1] 168136 [host=huxelrebe1] 168063 [host=albana0] 168015 [host=himrod0] 167997 [host=godello1] 167894 [host=elbling1] 167620 [host=himrod0] 167401 [host=huxelrebe1] 167218 [host=albana0] 166959 [host=godello1] 166394 [host=pinot0] 166322 [host=chardonnay0] template as basis? using template as basis.
Failure / basis pass flights: 185322 / 185283
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
Basis pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1588fd1437960d94cadc30c42243671e8c0f1281 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#347385861c50adc8d4801d4b899eded38a2f04cd-347385861c50adc8d4801d4b899eded38a2f04cd git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#932db9df0caa26daca4edf133fb2aed7b4a9193e-98f150a954b35cc74bd87ae355cf35d8c9e1580d git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3-c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 git://xenbits.xen.org/osstest/seabios.git#1588fd1437960d94cadc30c42243671e8c0f1281-c5a361c09a19e3b1a83557b01f11f04b27181a11 git://xenbits.xen.org/xen.git#9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2-150f6cdbfe079816a0df8b9d57320ca42fc39d12
Loaded 12694 nodes in revision graph
Searching for test results:
 185283 [host=rimava0]
 185297 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 963671d3801a6992d1aa06f05d86e32efa6b205e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 4b33780de790bd438dd7cbb6143b410d94f0f049
 185322 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
 185405 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1588fd1437960d94cadc30c42243671e8c0f1281 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185408 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
 185414 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1588fd1437960d94cadc30c42243671e8c0f1281 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2
 185415 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 98f150a954b35cc74bd87ae355cf35d8c9e1580d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 150f6cdbfe079816a0df8b9d57320ca42fc39d12
 185419 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7db6066d2c4e9facc5095f0681b16bf15ca3a597
 185421 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 21113031fc0db5ff3de8bfb7a441f06e169a931b
 185425 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7efe5a0eee0e4f593c064b7f1b106acc74d8c7f9
 185430 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185436 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185440 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185444 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185448 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
 185452 pass 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
 185455 fail 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 295bf24af77c0556fe023ce727734fd27226b37c
Searching for interesting versions
 Result found: flight 185405 (pass), for basis pass
 For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522, results HASH(0x561a2d270dc8) HASH(0x561a2d24ccf8) HASH(0x561a2d2534b8) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1\
 e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7efe5a0eee0e4f593c064b7f1b106acc74d8c7f9, results HASH(0x561a2d272c50) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641c\
 c35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 7db6066d2c4e9facc5095f0681b16bf15ca3a597, results HASH(0x561a2d264148) For basis failure, parent search stopping at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 1588fd1437960d94cadc30c42243671e8c0f1281 9c7c50969fa6c7b1e2d24c2c9dfe528079d72df2, results HASH(0x561a2d252bb8) HASH(0x56\
 1a2d256ec8) Result found: flight 185408 (fail), for basis failure (at ancestor ~5704)
 Repro found: flight 185414 (pass), for basis pass
 Repro found: flight 185415 (fail), for basis failure
 0 revisions at 347385861c50adc8d4801d4b899eded38a2f04cd c530a75c1e6a472b0eb9558310b518f0dfcd8860 932db9df0caa26daca4edf133fb2aed7b4a9193e 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c02cb236b5e4a76cf74e641cc35a0e3ebd3e52f3 c5a361c09a19e3b1a83557b01f11f04b27181a11 ec8f105f9c7744408ddea6b320d55703f9e0f522
No revisions left to test, checking graph state.
 Result found: flight 185436 (pass), for last pass
 Result found: flight 185440 (fail), for first failure
 Repro found: flight 185444 (pass), for last pass
 Repro found: flight 185448 (fail), for first failure
 Repro found: flight 185452 (pass), for last pass
 Repro found: flight 185455 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  295bf24af77c0556fe023ce727734fd27226b37c
  Bug not present: ec8f105f9c7744408ddea6b320d55703f9e0f522
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/185455/


  commit 295bf24af77c0556fe023ce727734fd27226b37c
  Author: Roger Pau Monne <roger.pau@citrix.com>
  Date:   Thu Feb 15 17:46:53 2024 +0100
  
      x86/vmx: Add support for virtualize SPEC_CTRL
      
      The feature is defined in the tertiary exec control, and is available starting
      from Sapphire Rapids and Alder Lake CPUs.
      
      When enabled, two extra VMCS fields are used: SPEC_CTRL mask and shadow.  Bits
      set in mask are not allowed to be toggled by the guest (either set or clear)
      and the value in the shadow field is the value the guest expects to be in the
      SPEC_CTRL register.
      
      By using it the hypervisor can force the value of SPEC_CTRL bits behind the
      guest back without having to trap all accesses to SPEC_CTRL, note that no bits
      are forced into the guest as part of this patch.  It also allows getting rid of
      SPEC_CTRL in the guest MSR load list, since the value in the shadow field will
      be loaded by the hardware on vmentry.
      
      Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      (cherry picked from commit 97c5b8b657e41a6645de9d40713b881234417b49)

Revision graph left in /home/logs/results/bisect/xen-4.16-testing/test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm.guest-saverestore.{dot,ps,png,html,svg}.
----------------------------------------
185455: tolerable ALL FAIL

flight 185455 xen-4.16-testing real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/185455/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 15 guest-saverestore fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 fail    


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


