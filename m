Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6374B6CADBF
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 20:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515411.798246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqY-0007sU-GM; Mon, 27 Mar 2023 18:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515411.798246; Mon, 27 Mar 2023 18:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgrqY-0007pa-Cz; Mon, 27 Mar 2023 18:45:34 +0000
Received: by outflank-mailman (input) for mailman id 515411;
 Mon, 27 Mar 2023 18:45:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pgrqW-0007kG-II
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 18:45:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqT-0004OL-FF; Mon, 27 Mar 2023 18:45:29 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pgrqT-00044j-3A; Mon, 27 Mar 2023 18:45:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=qxlp15yYz1ts/aw9JCCm2hV20iAHQIAH1LJ/j5n3V58=; b=zsoU8E
	Bkg/amOf5YSQPa3ZQcIjr9KHzzdpcF7lw00fDxY7wSTLddLbfvQ8g1dCIhY8NZnbaPwf1h9NjdRu4
	qTxX1VkcoMhiT9DRvZYqWLfqQKiwddEhVjXBHvkoJwKg/qw7Kp+XWDv8V++8SWUwdPguKffRQrwSs
	9bOTElnYVNg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 0/7] xen/x86: Use SPDX (take 1)
Date: Mon, 27 Mar 2023 19:45:13 +0100
Message-Id: <20230327184520.81828-1-julien@xen.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a first attempt to replace all the full license text with
SPX tag in xen/arch/x86/. This is covering most of the x86 files.

I have used the script below to remove the full license and add
an SPDX tag. The script is based on the work from Anthony [1].

#! /usr/bin/python3
## We are opening/writing to files using the binary mode to avoid
## python interpreting the content (reading ./drivers/video/font_8x14.c
## will throw some encoding error otherwise).

import sys

if len(sys.argv) < 4:
    print("./replace_license <licence-file> <spdx> <file> [debug]")
    exit(1)

licence_file = sys.argv[1]
spdx = str.encode(sys.argv[2])
file = sys.argv[3]
# HACK: enable debug if there is a 4th argument
debug = len(sys.argv) == 5

with open(licence_file, 'rb') as f:
    licence = f.read()

licence_spdx = b"/* SPDX-License-Identifier: " + spdx + b" */\n"

print(f"reading {file}")
with open(file, 'rb') as f:
    whole_file = f.read()

try:
    licence_loc = whole_file.index(licence)
except ValueError:
    print("licence not found. Ignoring")
    exit(0)

# Replace one the below pattern with nothing
## Pattern 1
# *
# * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# *
# * <licence>
# *
# * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
whole_file = whole_file.replace(
b' *\n'  +
b' * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n' +
b' *\n'  +
licence +
b' *\n' +
b' * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n', b'')

## Pattern 2
# * <licence>
# *
whole_file = whole_file.replace(licence + b' *\n', b'')

## Pattern 3
# *
# * <licence>
whole_file = whole_file.replace(b' *\n' + licence, b'')

## Pattern 4
# /*
#  * <licence>
#  */
whole_file = whole_file.replace(b'/*\n' + licence + b' */\n', b'')

## Pattern 5
# *
# * <licence>
whole_file = whole_file.replace(b' * \n' + licence, b'')

## Pattern 6
# /*
#  * <licence>
# */
whole_file = whole_file.replace(b'/*\n' + licence + b'*/\n', b'')

# Check if the license was removed
try:
    _ = whole_file.index(licence)
    print("The license was not removed. Bailing out")
    exit(0)
except ValueError:
    print("The license was removed. Updating the file")

if debug:
    print(whole_file)
else:
    with open('%s' % file, 'wb') as f:
        f.write(licence_spdx)
        f.write(whole_file)

[1] https://lore.kernel.org/xen-devel/20221103115204.49610-7-anthony.perard@citrix.com/

Julien Grall (7):
  LICENSES: Clarify that the SPDX tag GPL-2.0 is deprecated
  xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.c
  xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.c
    (part 3)
  xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.h
  xen/x86: Replace GPL v2.0 license boilerplate with an SPDX tag in *.h
    (part 3)
  xen/x86: Replace GPL v2.0+ license boilerplate with an SPDX tag in *.c
  xen/x86: Replace GPL v2.0+ license boilerplate with an SPDX tag in *.h

 LICENSES/GPL-2.0                              |  4 ++--
 xen/arch/x86/alternative.c                    | 14 +-------------
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c        | 14 +-------------
 xen/arch/x86/cpu/mcheck/mce_amd.c             | 14 +-------------
 xen/arch/x86/cpu/mcheck/vmce.c                | 14 +-------------
 xen/arch/x86/cpu/mcheck/x86_mca.h             | 14 +-------------
 xen/arch/x86/cpu/mwait-idle.c                 | 13 +------------
 xen/arch/x86/cpu/vpmu.c                       | 13 +------------
 xen/arch/x86/cpu/vpmu_amd.c                   | 13 +------------
 xen/arch/x86/cpu/vpmu_intel.c                 | 13 +------------
 xen/arch/x86/genapic/x2apic.c                 | 13 +------------
 xen/arch/x86/guest/hyperv/hyperv.c            | 14 +-------------
 xen/arch/x86/guest/hyperv/private.h           | 14 +-------------
 xen/arch/x86/guest/hyperv/tlb.c               | 14 +-------------
 xen/arch/x86/guest/hyperv/util.c              | 14 +-------------
 xen/arch/x86/guest/hypervisor.c               | 14 +-------------
 xen/arch/x86/guest/xen/pvh-boot.c             | 14 +-------------
 xen/arch/x86/guest/xen/xen.c                  | 14 +-------------
 xen/arch/x86/hvm/asid.c                       | 13 +------------
 xen/arch/x86/hvm/dm.c                         | 13 +------------
 xen/arch/x86/hvm/dom0_build.c                 | 13 +------------
 xen/arch/x86/hvm/domain.c                     | 13 +------------
 xen/arch/x86/hvm/grant_table.c                | 14 +-------------
 xen/arch/x86/hvm/hpet.c                       | 13 +------------
 xen/arch/x86/hvm/hvm.c                        | 13 +------------
 xen/arch/x86/hvm/hypercall.c                  | 14 +-------------
 xen/arch/x86/hvm/intercept.c                  | 13 +------------
 xen/arch/x86/hvm/io.c                         | 13 +------------
 xen/arch/x86/hvm/ioreq.c                      | 13 +------------
 xen/arch/x86/hvm/irq.c                        | 13 +------------
 xen/arch/x86/hvm/mtrr.c                       | 13 +------------
 xen/arch/x86/hvm/nestedhvm.c                  | 13 +------------
 xen/arch/x86/hvm/pmtimer.c                    | 13 +------------
 xen/arch/x86/hvm/quirks.c                     | 13 +------------
 xen/arch/x86/hvm/save.c                       | 13 +------------
 xen/arch/x86/hvm/svm/asid.c                   | 13 +------------
 xen/arch/x86/hvm/svm/emulate.c                | 13 +------------
 xen/arch/x86/hvm/svm/intr.c                   | 13 +------------
 xen/arch/x86/hvm/svm/nestedsvm.c              | 13 +------------
 xen/arch/x86/hvm/svm/svm.c                    | 13 +------------
 xen/arch/x86/hvm/svm/svmdebug.c               | 13 +------------
 xen/arch/x86/hvm/svm/vmcb.c                   | 13 +------------
 xen/arch/x86/hvm/vlapic.c                     | 13 +------------
 xen/arch/x86/hvm/vmx/intr.c                   | 13 +------------
 xen/arch/x86/hvm/vmx/vmcs.c                   | 13 +------------
 xen/arch/x86/hvm/vmx/vmx.c                    | 13 +------------
 xen/arch/x86/hvm/vmx/vvmx.c                   | 13 +------------
 xen/arch/x86/hvm/vpt.c                        | 13 +------------
 xen/arch/x86/hypercall.c                      | 14 +-------------
 xen/arch/x86/include/asm/altp2m.h             | 13 +------------
 xen/arch/x86/include/asm/endbr.h              | 14 +-------------
 xen/arch/x86/include/asm/guest.h              | 13 +------------
 xen/arch/x86/include/asm/guest/hyperv-hcall.h | 13 +------------
 xen/arch/x86/include/asm/guest/hyperv.h       | 13 +------------
 xen/arch/x86/include/asm/guest/hypervisor.h   | 13 +------------
 xen/arch/x86/include/asm/guest/pvh-boot.h     | 13 +------------
 xen/arch/x86/include/asm/guest/xen-hcall.h    | 13 +------------
 xen/arch/x86/include/asm/guest/xen.h          | 13 +------------
 xen/arch/x86/include/asm/guest_pt.h           | 14 +-------------
 xen/arch/x86/include/asm/hap.h                | 14 +-------------
 xen/arch/x86/include/asm/hvm/asid.h           | 13 +------------
 xen/arch/x86/include/asm/hvm/domain.h         | 13 +------------
 xen/arch/x86/include/asm/hvm/grant_table.h    | 13 +------------
 xen/arch/x86/include/asm/hvm/hvm.h            | 13 +------------
 xen/arch/x86/include/asm/hvm/io.h             | 13 +------------
 xen/arch/x86/include/asm/hvm/ioreq.h          | 13 +------------
 xen/arch/x86/include/asm/hvm/irq.h            | 13 +------------
 xen/arch/x86/include/asm/hvm/monitor.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/nestedhvm.h      | 13 +------------
 xen/arch/x86/include/asm/hvm/save.h           | 13 +------------
 xen/arch/x86/include/asm/hvm/support.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h  | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/svm.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h   | 13 +------------
 xen/arch/x86/include/asm/hvm/svm/vmcb.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/vcpu.h           | 13 +------------
 xen/arch/x86/include/asm/hvm/vlapic.h         | 13 +------------
 xen/arch/x86/include/asm/hvm/vm_event.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h        | 13 +------------
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h       | 13 +------------
 xen/arch/x86/include/asm/hvm/vpt.h            | 13 +------------
 xen/arch/x86/include/asm/iommu.h              | 14 +-------------
 xen/arch/x86/include/asm/ioreq.h              | 13 +------------
 xen/arch/x86/include/asm/mem_access.h         | 14 +-------------
 xen/arch/x86/include/asm/mem_paging.h         | 14 +-------------
 xen/arch/x86/include/asm/mem_sharing.h        | 14 +-------------
 xen/arch/x86/include/asm/p2m.h                | 14 +-------------
 xen/arch/x86/include/asm/paging.h             | 14 +-------------
 xen/arch/x86/include/asm/pv/domain.h          | 13 +------------
 xen/arch/x86/include/asm/pv/grant_table.h     | 13 +------------
 xen/arch/x86/include/asm/pv/mm.h              | 13 +------------
 xen/arch/x86/include/asm/pv/shim.h            | 13 +------------
 xen/arch/x86/include/asm/pv/traps.h           | 13 +------------
 xen/arch/x86/include/asm/shstk.h              | 14 +-------------
 xen/arch/x86/include/asm/spec_ctrl.h          | 14 +-------------
 xen/arch/x86/include/asm/spec_ctrl_asm.h      | 14 +-------------
 xen/arch/x86/include/asm/traps.h              | 14 +-------------
 xen/arch/x86/include/asm/vm_event.h           | 13 +------------
 xen/arch/x86/include/asm/vpmu.h               | 13 +------------
 xen/arch/x86/include/asm/xenoprof.h           | 14 +-------------
 xen/arch/x86/mm.c                             | 14 +-------------
 xen/arch/x86/mm/altp2m.c                      | 13 +------------
 xen/arch/x86/mm/guest_walk.c                  | 14 +-------------
 xen/arch/x86/mm/hap/guest_walk.c              | 13 +------------
 xen/arch/x86/mm/hap/hap.c                     | 14 +-------------
 xen/arch/x86/mm/hap/nested_ept.c              | 13 +------------
 xen/arch/x86/mm/hap/nested_hap.c              | 14 +-------------
 xen/arch/x86/mm/hap/private.h                 | 13 +------------
 xen/arch/x86/mm/mem_access.c                  | 14 +-------------
 xen/arch/x86/mm/mem_paging.c                  | 14 +-------------
 xen/arch/x86/mm/mem_sharing.c                 | 14 +-------------
 xen/arch/x86/mm/mm-locks.h                    | 14 +-------------
 xen/arch/x86/mm/nested.c                      | 14 +-------------
 xen/arch/x86/mm/p2m-basic.c                   | 14 +-------------
 xen/arch/x86/mm/p2m-ept.c                     | 13 +------------
 xen/arch/x86/mm/p2m-pod.c                     | 14 +-------------
 xen/arch/x86/mm/p2m-pt.c                      | 14 +-------------
 xen/arch/x86/mm/p2m.c                         | 14 +-------------
 xen/arch/x86/mm/p2m.h                         | 14 +-------------
 xen/arch/x86/mm/paging.c                      | 14 +-------------
 xen/arch/x86/mm/physmap.c                     | 14 +-------------
 xen/arch/x86/mm/shadow/common.c               | 14 +-------------
 xen/arch/x86/mm/shadow/hvm.c                  | 14 +-------------
 xen/arch/x86/mm/shadow/multi.c                | 14 +-------------
 xen/arch/x86/mm/shadow/multi.h                | 14 +-------------
 xen/arch/x86/mm/shadow/private.h              | 14 +-------------
 xen/arch/x86/mm/shadow/pv.c                   | 14 +-------------
 xen/arch/x86/mm/shadow/set.c                  | 14 +-------------
 xen/arch/x86/mm/shadow/types.h                | 14 +-------------
 xen/arch/x86/msr.c                            | 14 +-------------
 xen/arch/x86/pv/callback.c                    | 13 +------------
 xen/arch/x86/pv/descriptor-tables.c           | 13 +------------
 xen/arch/x86/pv/emul-gate-op.c                | 14 +-------------
 xen/arch/x86/pv/emul-inv-op.c                 | 14 +-------------
 xen/arch/x86/pv/emul-priv-op.c                | 14 +-------------
 xen/arch/x86/pv/emulate.c                     | 14 +-------------
 xen/arch/x86/pv/grant_table.c                 | 13 +------------
 xen/arch/x86/pv/hypercall.c                   | 14 +-------------
 xen/arch/x86/pv/misc-hypercalls.c             | 14 +-------------
 xen/arch/x86/pv/mm.c                          | 13 +------------
 xen/arch/x86/pv/ro-page-fault.c               | 14 +-------------
 xen/arch/x86/pv/shim.c                        | 14 +-------------
 xen/arch/x86/pv/traps.c                       | 14 +-------------
 xen/arch/x86/smpboot.c                        | 14 +-------------
 xen/arch/x86/spec_ctrl.c                      | 14 +-------------
 xen/arch/x86/traps.c                          | 14 +-------------
 xen/arch/x86/x86_64/mmconfig.h                | 13 +------------
 xen/arch/x86/x86_emulate/x86_emulate.c        | 14 +-------------
 xen/arch/x86/x86_emulate/x86_emulate.h        | 14 +-------------
 150 files changed, 151 insertions(+), 1858 deletions(-)

-- 
2.39.2


