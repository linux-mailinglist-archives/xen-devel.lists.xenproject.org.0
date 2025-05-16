Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF3AB98DF
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986620.1372176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-0008UN-IW; Fri, 16 May 2025 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986620.1372176; Fri, 16 May 2025 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-0008PM-AS; Fri, 16 May 2025 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 986620;
 Fri, 16 May 2025 09:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPwm=YA=bounce.vates.tech=bounce-md_30504962.682705f9.v1-6d19bda8ab244784b25a29105d05f65e@srs-se1.protection.inumbo.net>)
 id 1uFrPv-0007hQ-Mh
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:47 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ddb0af-3238-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:31:38 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKP2Pb4zMQxXXp
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6d19bda8ab244784b25a29105d05f65e; Fri, 16 May 2025 09:31:37 +0000
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
X-Inumbo-ID: 90ddb0af-3238-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387897; x=1747657897;
	bh=jXXMZ6aCdgxXcOitCrfcMbnlGzl+JcdnY3VXx2NEZtQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=h+Mn3fe1suntMusfqgLt5OVToh5kcWCcimqvTrDj5Oy9H2JofIAagSTj7Z189/5ZW
	 wQL++o/6qZoK6FvLsQr9uH65kbYGo1HQeBy4g/wojQv232UKCE3hd/Ab5aBsmY8aG0
	 xP1RDkGIUKTuhI2IPTFoHDU/j1zZP7fjWH1Ulzqo28n5FTHAhwLu9UJ/ZIz/0cSrIN
	 S0nUQX0DVqpDYXSU6aTBXMx1ETHP11ogHnW1hXMlWpfwtQ7SHcDKcTwIuruLjZxU01
	 fFJ0Tz/Ol5kNJOb81cdq0iZpS5k4JTtLcax2AmZ+LWvZQUawNiOTQYMZTSXZRk5hdM
	 tLT2dADnzIeIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387897; x=1747648397; i=teddy.astie@vates.tech;
	bh=jXXMZ6aCdgxXcOitCrfcMbnlGzl+JcdnY3VXx2NEZtQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=o/MdznanHXxKUj4xIqbLT9ORX56PcQWjEYRv2UFjsvnC3kaIHIL9Ity1jl9JnWgNG
	 Dmfy/QBfjEiPpbReUALZRKLh4mHK+jZlkcgsncWlK5CRx9duClnYvq55ec+eAzCZbO
	 9lN6oVlGgKCUCI+nklB/CJpGBkT+rLkrYmffvRv0zLIy31qzgUbQqw49pYTeQ0vQWo
	 2447IqTLZJxMSFXQjs+WABM0OkA33SVXxSOAU1XvrnCTp96viaw9dTzAQLzRaqN3X0
	 yXpLhv69qG8nHZl9ivXsIpwW2D0X7WkSOT7eRY6LgErXEoKIfS96xAwGLS3L9Gp6b8
	 zq42E328o53tw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2000/16]=20Confidential=20computing=20and=20AMD=20SEV=20support?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387895675
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Tim Deegan" <tim@xen.org>, "Juergen Gross" <jgross@suse.com>, "Christian Lindig" <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>
Message-Id: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6d19bda8ab244784b25a29105d05f65e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

This series introduce support for confidential computing along with a
AMD SEV implementation. It also bundles some of the functional
requirements (ASID scheme, ABI, ...) which could be separated if needed.

(I bundled everything in this serie to have a complete coherent serie)

This work receives funding by the Hyper Open X consortium (France 2030).

# Concepts

A confidential guest is a bit special as :
 - its memory is by default encrypted or not directly accessible by the
   hypervisor, thus other domains/dom0 as well; it must be explicitely
   shared by the guest itself
 - so its page-tables are also not accessible

# Implementation

Confidential computing is exposed in a uniform way regardless of actual
implementation (SEV, TDX, RME, ...) through the coco_op hypercall (mostly
for use by the Dom0 toolstack). This interface provides a way to query
informations on the coco platform (support status, features (un)safety,
...), and prepare initial guest memory.
Only HVM domains have support for confidential computing.
(in the future, we may want to have attestation support)

In order to create a confidential computing domain, the process is follow : 
 - create a HVM/PVH domain with XEN_DOMCTL_CDF_coco
 - populate initial memory as usual
 - apply coco_prepare_initial_mem on all initial pages
   (under SEV, this will encrypt memory)

Under xl, it is exposed through the `coco` parameter ("coco = 1").

Xen hypercalls usually use virtual addresses as parameter, which causes issues
when issuing them from a confidential guest (where its memory is usually not
available to the hypervisor e.g encryted). This problem is solved by introducing
a new experimental hypercall ABI ("Physical Address ABI") which don't use virtual
addresses anymore, of course it needs explicit guest support.

## SEV Implementation

Currently, only plain SEV (no ES) is implemented. I would prefer to use SEV-ES
as plain SEV has several flaws like having non-trivial emulation paths and the
hypervisor can break the guest encryption by manipulating its registers (unlike
SEV-ES where the hypervisor has a very controlled view on guest registers).

# Series organization

The first part introduce some non-coco/SEV specific bits.

The second part introduce a physical address ABI, that is required to
make proper hypercalls under a confidential computing guest. That's
something that we should discuss more, but for now, it allows some
minimal guest hypercall support in confidential computing guest.

A patch introduce a ASID management rework (based on Vaishali's work)
required to make SEV work, as in this case the ASID is tied to the guest
encryption key. Which also includes a rework on TLB flushing logic.

Then a general confidential computing infrastructure (not SEV-specific)
along with the AMD SEV implementation.

And some extra patches to workaround some limitations (DF_FLUSH support
and temporary debug tools).

You can find Linux branches with early SEV support (more or less working)
https://github.com/xcp-ng/linux/tree/xen-sev-6.6/
https://github.com/xcp-ng/linux/tree/xen-sev-6.14/

Teddy Astie (16):
  x86/msr: Introduce SYSCFG_MEM_ENCRYPT MSR.
  x86/svm: Move svm_domain structure to svm.h
  x86/hvm: Add support for physical address ABI
  x86/public: Expose physaddr_abi through Xen HVM CPUID leaf
  docs/x86: Document HVM Physical Addresss ABI
  vmx: Introduce vcpu single context VPID invalidation
  x86/hvm: Introduce Xen-wide ASID allocator
  x86/crypto: Introduce AMD PSP driver for SEV
  common: Introduce confidential computing infrastructure
  xl/coco: Introduce confidential computing support
  x86/svm: Introduce NPCTRL VMCB bits
  x86/cpufeature: Introduce SME and SEV-related CPU features
  x86/coco: Introduce AMD-SEV support
  sev/emulate: Handle some non-emulable HVM paths
  HACK: coco: Leak ASID for coco guests
  HACK: Add sev_console hypercall

 docs/guest-guide/x86/hypercall-abi.rst      |   4 +
 tools/include/libxl.h                       |   5 +
 tools/include/xenctrl.h                     |   4 +
 tools/include/xenguest.h                    |   1 +
 tools/libs/ctrl/xc_domain.c                 |  36 +
 tools/libs/guest/Makefile.common            |   2 +
 tools/libs/guest/xg_dom_boot.c              |  33 +
 tools/libs/guest/xg_dom_coco.c              |  35 +
 tools/libs/guest/xg_dom_coco.h              |  39 +
 tools/libs/guest/xg_dom_x86.c               |   1 +
 tools/libs/light/libxl_cpuid.c              |   1 +
 tools/libs/light/libxl_create.c             |   4 +
 tools/libs/light/libxl_dom.c                |   1 +
 tools/libs/light/libxl_types.idl            |   1 +
 tools/libs/util/libxlu_disk_l.c             |  13 +-
 tools/libs/util/libxlu_disk_l.h             |   7 +-
 tools/misc/xen-cpuid.c                      |   1 +
 tools/ocaml/libs/xc/xenctrl.ml              |   1 +
 tools/ocaml/libs/xc/xenctrl.mli             |   1 +
 tools/xl/xl_parse.c                         |   2 +
 xen/arch/x86/Makefile                       |   1 +
 xen/arch/x86/coco/Makefile                  |   1 +
 xen/arch/x86/coco/sev.c                     | 262 ++++++
 xen/arch/x86/cpu/amd.c                      |  10 +
 xen/arch/x86/cpu/common.c                   |   2 +
 xen/arch/x86/cpuid.c                        |   7 +
 xen/arch/x86/domain.c                       |   4 +
 xen/arch/x86/flushtlb.c                     |   7 +-
 xen/arch/x86/hvm/Kconfig                    |  10 +
 xen/arch/x86/hvm/asid.c                     | 170 ++--
 xen/arch/x86/hvm/emulate.c                  | 139 +++-
 xen/arch/x86/hvm/hvm.c                      |  55 +-
 xen/arch/x86/hvm/hypercall.c                |  17 +-
 xen/arch/x86/hvm/nestedhvm.c                |   7 +-
 xen/arch/x86/hvm/svm/asid.c                 |  77 +-
 xen/arch/x86/hvm/svm/nestedsvm.c            |   2 +-
 xen/arch/x86/hvm/svm/svm.c                  |  43 +-
 xen/arch/x86/hvm/svm/svm.h                  |   4 -
 xen/arch/x86/hvm/svm/vmcb.c                 |  17 +-
 xen/arch/x86/hvm/vmx/vmcs.c                 |   6 +-
 xen/arch/x86/hvm/vmx/vmx.c                  |  68 +-
 xen/arch/x86/hvm/vmx/vvmx.c                 |   5 +-
 xen/arch/x86/include/asm/coco.h             |   8 +
 xen/arch/x86/include/asm/cpufeature.h       |   4 +
 xen/arch/x86/include/asm/hvm/asid.h         |  26 +-
 xen/arch/x86/include/asm/hvm/domain.h       |   2 +
 xen/arch/x86/include/asm/hvm/hvm.h          |  15 +-
 xen/arch/x86/include/asm/hvm/svm/sev.h      |  14 +
 xen/arch/x86/include/asm/hvm/svm/svm.h      |  32 +
 xen/arch/x86/include/asm/hvm/svm/vmcb.h     |  22 +-
 xen/arch/x86/include/asm/hvm/vcpu.h         |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h      |  19 +-
 xen/arch/x86/include/asm/msr-index.h        |   1 +
 xen/arch/x86/include/asm/psp-sev.h          | 655 +++++++++++++++
 xen/arch/x86/mm/hap/hap.c                   |   7 +-
 xen/arch/x86/mm/p2m.c                       |   7 +-
 xen/arch/x86/mm/paging.c                    |   2 +-
 xen/arch/x86/mm/shadow/hvm.c                |   1 +
 xen/arch/x86/mm/shadow/multi.c              |   1 +
 xen/common/Kconfig                          |   5 +
 xen/common/Makefile                         |   1 +
 xen/common/coco.c                           | 140 ++++
 xen/common/domain.c                         |  41 +-
 xen/drivers/Kconfig                         |   2 +
 xen/drivers/Makefile                        |   1 +
 xen/drivers/crypto/Kconfig                  |  10 +
 xen/drivers/crypto/Makefile                 |   1 +
 xen/drivers/crypto/asp.c                    | 830 ++++++++++++++++++++
 xen/include/hypercall-defs.c                |   4 +
 xen/include/public/arch-x86/cpufeatureset.h |   5 +
 xen/include/public/arch-x86/cpuid.h         |   2 +
 xen/include/public/domctl.h                 |   5 +-
 xen/include/public/hvm/coco.h               |  65 ++
 xen/include/public/xen.h                    |   2 +
 xen/include/xen/coco.h                      |  88 +++
 xen/include/xen/lib/x86/cpu-policy.h        |   9 +-
 xen/include/xen/sched.h                     |  14 +
 77 files changed, 2859 insertions(+), 298 deletions(-)
 create mode 100644 tools/libs/guest/xg_dom_coco.c
 create mode 100644 tools/libs/guest/xg_dom_coco.h
 create mode 100644 xen/arch/x86/coco/Makefile
 create mode 100644 xen/arch/x86/coco/sev.c
 create mode 100644 xen/arch/x86/include/asm/coco.h
 create mode 100644 xen/arch/x86/include/asm/hvm/svm/sev.h
 create mode 100644 xen/arch/x86/include/asm/psp-sev.h
 create mode 100644 xen/common/coco.c
 create mode 100644 xen/drivers/crypto/Kconfig
 create mode 100644 xen/drivers/crypto/Makefile
 create mode 100644 xen/drivers/crypto/asp.c
 create mode 100644 xen/include/public/hvm/coco.h
 create mode 100644 xen/include/xen/coco.h

-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


