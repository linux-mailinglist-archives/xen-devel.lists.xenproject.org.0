Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709EAB5AB8
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983181.1369528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5H-0003cJ-EG; Tue, 13 May 2025 17:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983181.1369528; Tue, 13 May 2025 17:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt5H-0003aQ-7n; Tue, 13 May 2025 17:06:27 +0000
Received: by outflank-mailman (input) for mailman id 983181;
 Tue, 13 May 2025 17:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5E-0003Mm-It
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:06:25 +0000
Received: from 14.mo582.mail-out.ovh.net (14.mo582.mail-out.ovh.net
 [46.105.56.113]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 981fcbe8-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:06:22 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.148.65])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjYT3Fl9z1fD3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:06:21 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tzcrg (unknown [10.110.101.251])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5101D1FD1D;
 Tue, 13 May 2025 17:06:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-tzcrg with ESMTPSA
 id fnX0Mgp8I2j3JwEAShSnmA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:06:19 +0000
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
X-Inumbo-ID: 981fcbe8-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-96R001ee74798f-ac1a-4ede-9fca-0d0d4df457d9,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
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
Subject: [PATCH v2 00/22] x86: Trenchboot Secure Launch DRTM (Xen)
Date: Tue, 13 May 2025 20:05:37 +0300
Message-ID: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8938800839277393052
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepudehtdekieegfeffveejtddufeelleegfeevkedtgedvgeffieejjeelgeevgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmpdhtrhgvnhgthhgsohhothdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtph
 houhht
DKIM-Signature: a=rsa-sha256; bh=uUInVjt0zHUzX1YlJgsoYmHPLtR542NbxOEr3R3yCWg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747155981; v=1;
 b=B8/HTKTvXXIUoeAnuwFCNdUIbYLMSOSrQX7zxIYj6HMRWp5+MiiUKurncb10038t0oDCA5vj
 0BIUTTFeTtT/5HjIMvrVLeXRcd/BngwXSoT6s2erpQscaT/xTTUKTY06LHCn7vZC8qi4IgLQkI/
 Oh2P3FoHIMyR1K0FN29NMhwdqmRPIa4NfNuxSZE6sPrWvMc4BiwafCeDRmHMZ4NFFCjPIRy8uJp
 PLUV/b35qVcAqzFoqgMo133Dcna7ftqtNiqrgZDmLUykRe8DKVK7tW7eem20K0z1vJifLfHtP+i
 aEzPUPMpKtmjZM7H5Qm/6uebJKQ8XJMUCUl4QuD0GWnfg==

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
    https://github.com/TrenchBoot/xen/pull/new/aem-staging-2025-05-12-v2

With the help from Andrew Cooper v2 passes all CI tests:
    https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1815190030

-----

[TrenchBoot]: https://trenchboot.org/
[tboot]: https://sourceforge.net/p/tboot/wiki/Home/
[Parallelize AP bring-up]: https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
[v1]: https://lore.kernel.org/xen-devel/cover.1745172094.git.sergii.dmytruk@3mdeb.com/

-----

Changes in v2:
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
 xen/arch/x86/include/asm/intel-txt.h          |  457 +++++++
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
 xen/include/xen/sha1.h                        |   12 +
 xen/include/xen/slr-table.h                   |  268 +++++
 xen/lib/Makefile                              |    1 +
 xen/lib/sha1.c                                |  218 ++++
 41 files changed, 3695 insertions(+), 56 deletions(-)
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


base-commit: f6042f38e621525feff86bb101dc751d2d87cff8
-- 
2.49.0


