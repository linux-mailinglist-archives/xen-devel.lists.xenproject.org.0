Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FD93FBFF7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 02:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175348.319508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKrjV-0007BH-5M; Tue, 31 Aug 2021 00:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175348.319508; Tue, 31 Aug 2021 00:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKrjV-00077h-0m; Tue, 31 Aug 2021 00:34:33 +0000
Received: by outflank-mailman (input) for mailman id 175348;
 Tue, 31 Aug 2021 00:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKrjS-00077V-TD; Tue, 31 Aug 2021 00:34:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKrjS-0002NO-OL; Tue, 31 Aug 2021 00:34:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mKrjS-0005uR-I1; Tue, 31 Aug 2021 00:34:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mKrjS-0002VC-HY; Tue, 31 Aug 2021 00:34:30 +0000
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
	bh=x0CHozbnLEwRchM/4dL+K31MWRn+gegi9oVCFPfvrqI=; b=eq++ays5qkcJi0BoZl653Ld1iQ
	CAqrZVwJVlG4gCJTmn3ejqFVEgwaU0nAR0fKFR74v/4L+/jCMfDlu3Uecy2Vuk9MOzP7VRE2k07Wf
	9Udr9GlE0fz1ua7tPxpqk/F3yQdBkGLn1LbzCTdqM7+MkWkT7roMzEjjuVP1Rq+o0/+c=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-amd64-amd64-dom0pvh-xl-intel
Message-Id: <E1mKrjS-0002VC-HY@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 31 Aug 2021 00:34:30 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-dom0pvh-xl-intel
testid xen-boot

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  753cb68e653002e89fdcd1c80e52905fdbfb78cb
  Bug not present: 0bf755e2c856628e11e93c76c3e12974e9964638
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164671/


  commit 753cb68e653002e89fdcd1c80e52905fdbfb78cb
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 14:17:32 2021 +0200
  
      x86/p2m: guard (in particular) identity mapping entries
      
      Such entries, created by set_identity_p2m_entry(), should only be
      destroyed by clear_identity_p2m_entry(). However, similarly, entries
      created by set_mmio_p2m_entry() should only be torn down by
      clear_mmio_p2m_entry(), so the logic gets based upon p2m_mmio_direct as
      the entry type (separation between "ordinary" and 1:1 mappings would
      require a further indicator to tell apart the two).
      
      As to the guest_remove_page() change, commit 48dfb297a20a ("x86/PVH:
      allow guest_remove_page to remove p2m_mmio_direct pages"), which
      introduced the call to clear_mmio_p2m_entry(), claimed this was done for
      hwdom only without this actually having been the case. However, this
      code shouldn't be there in the first place, as MMIO entries shouldn't be
      dropped this way. Avoid triggering the warning again that 48dfb297a20a
      silenced by an adjustment to xenmem_add_to_physmap_one() instead.
      
      Note that guest_physmap_mark_populate_on_demand() gets tightened beyond
      the immediate purpose of this change.
      
      Note also that I didn't inspect code which isn't security supported,
      e.g. sharing, paging, or altp2m.
      
      This is CVE-2021-28694 / part of XSA-378.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Paul Durrant <paul@xen.org>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot --summary-out=tmp/164671.bisection-summary --basis-template=164477 --blessings=real,real-bisect,real-retry xen-unstable test-amd64-amd64-dom0pvh-xl-intel xen-boot
Searching for failure / basis pass:
 164614 fail [host=albana1] / 164477 [host=godello0] 164405 [host=godello1] 164309 [host=godello0] 164264 [host=elbling0] 164248 [host=elbling1] 164237 [host=fiano0] 164230 [host=godello0] 164171 ok.
Failure / basis pass flights: 164614 / 164171
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 8064488062641ae505b2a7369611c38057a7788b
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5a88d524857e5bf78b077d30ea515fcaac061bfc
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#136c34c9bc4179dc64b15b2bb5f0c54\
 ca4ddf823-136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 git://xenbits.xen.org/xen.git#5a88d524857e5bf78b077d30ea515fcaac061bfc-8064488062641ae505b2a7369611c38057a7788b
Loaded 5001 nodes in revision graph
Searching for test results:
 164171 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5a88d524857e5bf78b077d30ea515fcaac061bfc
 164230 [host=godello0]
 164237 [host=fiano0]
 164248 [host=elbling1]
 164264 [host=elbling0]
 164309 [host=godello0]
 164405 [host=godello1]
 164477 [host=godello0]
 164499 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 c08d68cd2aacbc7cb56e73ada241bfe4639bbc68
 164528 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 8064488062641ae505b2a7369611c38057a7788b
 164622 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5a88d524857e5bf78b077d30ea515fcaac061bfc
 164614 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 8064488062641ae505b2a7369611c38057a7788b
 164646 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 8064488062641ae505b2a7369611c38057a7788b
 164647 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 9ee27aa7a2bab460769a6621895898ba3a7fb445
 164650 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d1bb6c97c31ef754fb29b29eb307c090414e8022
 164653 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 753cb68e653002e89fdcd1c80e52905fdbfb78cb
 164655 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 899272539cbe1acda736a850015416fff653a1b6
 164657 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 8ea80530cd0dbb8ffa7ac92606a3ee29663fdc93
 164658 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0bf755e2c856628e11e93c76c3e12974e9964638
 164660 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 753cb68e653002e89fdcd1c80e52905fdbfb78cb
 164662 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0bf755e2c856628e11e93c76c3e12974e9964638
 164664 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 753cb68e653002e89fdcd1c80e52905fdbfb78cb
 164669 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0bf755e2c856628e11e93c76c3e12974e9964638
 164671 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 753cb68e653002e89fdcd1c80e52905fdbfb78cb
Searching for interesting versions
 Result found: flight 164171 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0bf755e2c856628e11e93c76c3e12974e9964638, results HASH(0x56027e8aac68) HASH(0x56027e80c720) HASH(0x56027e826868) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9b\
 c4179dc64b15b2bb5f0c54ca4ddf823 8ea80530cd0dbb8ffa7ac92606a3ee29663fdc93, results HASH(0x56027e815bd8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 899272539cbe1acda736a850015416fff653a1b6, results HASH(0x56027e827a90) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f\
 0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 d1bb6c97c31ef754fb29b29eb307c090414e8022, results HASH(0x56027e8269e8) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 9ee27aa7a2bab460769a6621895898ba3a7fb445, results HASH(0x56027e8135d0) For basis failure, parent search stopping at c3038e718a19\
 fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 5a88d524857e5bf78b077d30ea515fcaac061bfc, results HASH(0x56027e81a510) HASH(0x56027e80ef98) Result found: flight 164499 (fail), for basis failure (at ancestor ~708)
 Repro found: flight 164622 (pass), for basis pass
 Repro found: flight 164646 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 136c34c9bc4179dc64b15b2bb5f0c54ca4ddf823 0bf755e2c856628e11e93c76c3e12974e9964638
No revisions left to test, checking graph state.
 Result found: flight 164658 (pass), for last pass
 Result found: flight 164660 (fail), for first failure
 Repro found: flight 164662 (pass), for last pass
 Repro found: flight 164664 (fail), for first failure
 Repro found: flight 164669 (pass), for last pass
 Repro found: flight 164671 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  753cb68e653002e89fdcd1c80e52905fdbfb78cb
  Bug not present: 0bf755e2c856628e11e93c76c3e12974e9964638
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/164671/


  commit 753cb68e653002e89fdcd1c80e52905fdbfb78cb
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Wed Aug 25 14:17:32 2021 +0200
  
      x86/p2m: guard (in particular) identity mapping entries
      
      Such entries, created by set_identity_p2m_entry(), should only be
      destroyed by clear_identity_p2m_entry(). However, similarly, entries
      created by set_mmio_p2m_entry() should only be torn down by
      clear_mmio_p2m_entry(), so the logic gets based upon p2m_mmio_direct as
      the entry type (separation between "ordinary" and 1:1 mappings would
      require a further indicator to tell apart the two).
      
      As to the guest_remove_page() change, commit 48dfb297a20a ("x86/PVH:
      allow guest_remove_page to remove p2m_mmio_direct pages"), which
      introduced the call to clear_mmio_p2m_entry(), claimed this was done for
      hwdom only without this actually having been the case. However, this
      code shouldn't be there in the first place, as MMIO entries shouldn't be
      dropped this way. Avoid triggering the warning again that 48dfb297a20a
      silenced by an adjustment to xenmem_add_to_physmap_one() instead.
      
      Note that guest_physmap_mark_populate_on_demand() gets tightened beyond
      the immediate purpose of this change.
      
      Note also that I didn't inspect code which isn't security supported,
      e.g. sharing, paging, or altp2m.
      
      This is CVE-2021-28694 / part of XSA-378.
      
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Paul Durrant <paul@xen.org>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-dom0pvh-xl-intel.xen-boot.{dot,ps,png,html,svg}.
----------------------------------------
164671: tolerable ALL FAIL

flight 164671 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/164671/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot           fail baseline untested


jobs:
 test-amd64-amd64-dom0pvh-xl-intel                            fail    


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


