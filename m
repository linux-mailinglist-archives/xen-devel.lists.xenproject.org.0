Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09AAC8FB8
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000929.1381110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzd6-0008Ml-9B; Fri, 30 May 2025 13:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000929.1381110; Fri, 30 May 2025 13:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzd6-0008K9-3I; Fri, 30 May 2025 13:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1000929;
 Fri, 30 May 2025 13:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzd3-0008Jy-7C
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:34 +0000
Received: from 8.mo561.mail-out.ovh.net (8.mo561.mail-out.ovh.net
 [87.98.172.249]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93fdcce9-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:18:30 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.25.52])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4b83hj3kqyz1kFf
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:29 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2nxzt (unknown [10.110.113.210])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5CC8AC571A;
 Fri, 30 May 2025 13:18:27 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-5b5ff79f4f-2nxzt with ESMTPSA
 id cVVzByOwOWjZ2QAADMzzjw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:27 +0000
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
X-Inumbo-ID: 93fdcce9-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-110S004b2589251-9822-4f6f-8629-ee3c86da3d3c,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 00/22] x86: Trenchboot Secure Launch DRTM (Xen)
Date: Fri, 30 May 2025 16:17:42 +0300
Message-ID: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12692551124840527004
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueejleetieejveeuheetveefvdeileefvdffleelfeekhfehgfegudduiefhgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhtrhgvnhgthhgsohhothdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmth
 hpohhuth
DKIM-Signature: a=rsa-sha256; bh=9Icdj8G3G4IrStgoJVn7lJvTKzaaMme79V+bkIE7hmI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611109; v=1;
 b=S8s8IljRUcy9LDF9K1kKpVdaB9zT2A6Z+g6KVJJFFAzCBBIqhLvKzEcRZyJ4TvtJofS9EcCs
 Ipnb9ZDtcsFG36sPMrpl7gtowmoKli4hLWCn4rYhLbwtcqMJknWxXDhlNnUw1/kbi66NDvFdGQ6
 0wKeMVZy/4gfXz30YxYYIjSgE4SmYkJxDf0i9n3I5c/VykvY6QhskGkt324A2f8nJTclV456BsX
 y1/0Sn7rGE+21X3c/mDBd66zeOlR0vw6RJw3b3OhKEMyGhS7uYt4pxNJr7GmnEsepQoE5Bw1GbA
 zUvUgAcx0JQgnG6G1J9BluJ7/SOKRhiXsdPwXYyuvun6g==

The aim of the [TrenchBoot] project is to provide an implementation of
DRTM that is generic enough to cover various use cases:
 - Intel TXT and AMD SKINIT on x86 CPUs
 - legacy and UEFI boot
 - TPM1.2 and TPM2.0
 - (in the future) DRTM on Arm CPUs

DRTM is a version of a measured launch that starts on request rather
than at the start of a boot cycle.  One of its advantages is in not
including the firmware in the chain of trust.

Xen already supports DRTM via [tboot] which targets Intel TXT only.
tboot employs encapsulates some of the DRTM details within itself while
with TrenchBoot Xen (or Linux) is meant to be a self-contained payload
for a TrenchBoot-enabled bootloader (think GRUB).  The one exception is
that UEFI case requires calling back into bootloader to initiate DRTM,
which is necessary to give Xen a chance of querying all the information
it needs from the firmware before performing DRTM start.

From reading the above tboot might seem like a more abstracted, but the
reality is that the payload needs to have DRTM-specific knowledge either
way.  TrenchBoot in principle allows coming up with independent
implementations of bootloaders and payloads that are compatible with
each other.

The "x86/boot: choose AP stack based on APIC ID" patch is shared with
[Parallelize AP bring-up] series which is required here because Intel
TXT always releases all APs simultaneously.  The rest of the patches are
unique.

This version of the patches corresponds to this branch:
    https://github.com/TrenchBoot/xen/compare/d7d55c27cc...aem-staging-2025-05-30-v3

-----

[TrenchBoot]: https://trenchboot.org/
[tboot]: https://sourceforge.net/p/tboot/wiki/Home/
[Parallelize AP bring-up]: https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
[v1]: https://lore.kernel.org/xen-devel/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
[v2]: https://lore.kernel.org/xen-devel/cover.1747155790.git.sergii.dmytruk@3mdeb.com/

-----

Changes in v3:
 - sorted `F:` entries in MAINTAINERS file
 - made sha1 implementation more similar to sha256
 - dropped unused parameter from xen/arch/x86/cpu/intel.c:intel_log_smx_txt()
 - updated header guards according to new style
 - xen/arch/x86/include/asm/intel-txt.h:
   + briefly explained what TXT is
   + renamed: NR_TXT_CONFIG_SIZE -> TXT_CONFIG_SPACE_SIZE
   + renamed: read_txt_reg() -> txt_read()
   + renamed: write_txt_reg() -> txt_write()
   + marked txt_reset() as noreturn and used unreacheable() instead of while(1)
   + explained a bit more about TXT Heap
 - xen/include/xen/slr-table.h:
   + briefly explained what SLRT is
   + fixed checks in slr_next_entry()
 - SPDX-License-Identifier: GPL-2.0 -> GPL-2.0-only
 - made more code const-correct
 - use arithmetic on pointers to `void` instead of pointers to `uint8_t`

Changes in [v2]:
 - using dashes instead of underscores in the names of new files
 - dropping of an extra sha256 implementation
 - rewriting sha1 implementation to be in line with already present
   sha256 implementation (simplifying it and getting rid of macros)
 - correct placement of new lines in Makefile
 - add header guards to all new files
 - use correct names for header guards in new files
 - update license of xen/include/xen/slr-table.h
 - changed fixmlehdr to search for header within 8 instead of 4 KiB file
   prefix
 - don't print DRTM-related capabilities when resuming from S3
 - forbade S3 in case of Secure Launch
 - fixed an issue with resuming from S3 caused by inappropriate use of
   __initdata
 - added a new section to MAINTAINERS
 - improved commit messages
 - fixed MISRA C violations:
   * shadowing of e820 global
   * missing U literal suffixes
   * use of ull literal suffix
   * excluded fixmlehdr from analysis (similar to other build tools)
   * use of 0 instead of NULL in one place
   * provided declarations for some definitions
   * marked asm-invoked functions with `asmlinkage`

-----

Kacper Stojek (2):
  x86/boot: add MLE header and Secure Launch entry point
  xen/arch/x86: reserve TXT memory during Slaunch

Krystian Hebel (7):
  x86/include/asm/intel-txt.h: constants and accessors for TXT registers
    and heap
  x86/boot/slaunch-early: early TXT checks and boot data retrieval
  x86/slaunch: restore boot MTRRs after Intel TXT DRTM
  xen/lib: add implementation of SHA-1
  x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)
  x86/boot: choose AP stack based on APIC ID
  x86/smpboot.c: TXT AP bringup

Michał Żygowski (2):
  x86/hvm: check for VMX in SMX if Slaunch is active
  x86/cpu: report SMX, TXT and SKINIT capabilities

Sergii Dmytruk (11):
  include/xen/slr-table.h: Secure Launch Resource Table definitions
  x86/boot/slaunch-early: implement early initialization
  x86/mtrr: expose functions for pausing caching
  x86/tpm.c: support extending PCRs of TPM2.0
  x86/tpm.c: implement event log for TPM2.0
  x86/slaunch: process DRTM policy
  x86/acpi: disallow S3 on Secure Launch boot
  x86/boot/slaunch-early: find MBI and SLRT on AMD
  x86/slaunch: support AMD SKINIT
  x86/slaunch: support EFI boot
  MAINTAINERS: add a section for TrenchBoot Slaunch

 .gitignore                                    |    1 +
 MAINTAINERS                                   |   15 +
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   |    1 +
 docs/hypervisor-guide/x86/how-xen-boots.rst   |    7 +
 xen/arch/x86/Makefile                         |   12 +-
 xen/arch/x86/acpi/power.c                     |    8 +
 xen/arch/x86/boot/Makefile                    |   10 +-
 xen/arch/x86/boot/head.S                      |  250 ++++
 xen/arch/x86/boot/slaunch-early.c             |  105 ++
 xen/arch/x86/boot/trampoline.S                |   40 +-
 xen/arch/x86/boot/x86_64.S                    |   42 +-
 xen/arch/x86/cpu/amd.c                        |   16 +
 xen/arch/x86/cpu/cpu.h                        |    1 +
 xen/arch/x86/cpu/hygon.c                      |    1 +
 xen/arch/x86/cpu/intel.c                      |   46 +
 xen/arch/x86/cpu/mtrr/generic.c               |   51 +-
 xen/arch/x86/e820.c                           |    5 +
 xen/arch/x86/efi/efi-boot.h                   |   88 +-
 xen/arch/x86/efi/fixmlehdr.c                  |  127 ++
 xen/arch/x86/hvm/vmx/vmcs.c                   |    3 +-
 xen/arch/x86/include/asm/apicdef.h            |    4 +
 xen/arch/x86/include/asm/intel-txt.h          |  478 ++++++++
 xen/arch/x86/include/asm/mm.h                 |    3 +
 xen/arch/x86/include/asm/msr-index.h          |    3 +
 xen/arch/x86/include/asm/mtrr.h               |    8 +
 xen/arch/x86/include/asm/processor.h          |    1 +
 xen/arch/x86/include/asm/slaunch.h            |   98 ++
 xen/arch/x86/include/asm/tpm.h                |   19 +
 xen/arch/x86/intel-txt.c                      |  188 +++
 xen/arch/x86/setup.c                          |   32 +-
 xen/arch/x86/slaunch.c                        |  465 ++++++++
 xen/arch/x86/smpboot.c                        |   63 +
 xen/arch/x86/tboot.c                          |   20 +-
 xen/arch/x86/tpm.c                            | 1056 +++++++++++++++++
 xen/common/efi/boot.c                         |    4 +
 xen/common/efi/runtime.c                      |    1 +
 xen/include/xen/efi.h                         |    1 +
 xen/include/xen/sha1.h                        |   14 +
 xen/include/xen/slr-table.h                   |  276 +++++
 xen/lib/Makefile                              |    1 +
 xen/lib/sha1.c                                |  190 +++
 41 files changed, 3698 insertions(+), 56 deletions(-)
 create mode 100644 xen/arch/x86/boot/slaunch-early.c
 create mode 100644 xen/arch/x86/efi/fixmlehdr.c
 create mode 100644 xen/arch/x86/include/asm/intel-txt.h
 create mode 100644 xen/arch/x86/include/asm/slaunch.h
 create mode 100644 xen/arch/x86/include/asm/tpm.h
 create mode 100644 xen/arch/x86/intel-txt.c
 create mode 100644 xen/arch/x86/slaunch.c
 create mode 100644 xen/arch/x86/tpm.c
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/include/xen/slr-table.h
 create mode 100644 xen/lib/sha1.c


base-commit: d7d55c27cc3253fb3634a0e468ef5df30487552b
-- 
2.49.0


