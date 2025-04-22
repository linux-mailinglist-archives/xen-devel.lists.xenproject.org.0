Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61019A96FE7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962756.1353901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDH-0008U5-Us; Tue, 22 Apr 2025 15:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962756.1353901; Tue, 22 Apr 2025 15:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDH-0008SY-S9; Tue, 22 Apr 2025 15:07:07 +0000
Received: by outflank-mailman (input) for mailman id 962756;
 Tue, 22 Apr 2025 15:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDF-0008SP-VN
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:06 +0000
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72d052a3-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:03 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.2.141])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZhlvV3Vc8z23r6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:02 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-vrv7z (unknown [10.110.101.237])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7A48B1FD2E;
 Tue, 22 Apr 2025 15:07:00 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-vrv7z with ESMTPSA
 id UoTGDZSwB2hgEQwA4lIjWg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:00 +0000
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
X-Inumbo-ID: 72d052a3-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-98R002eaee5505-9d14-4991-bcb3-3672c91ef34e,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
Date: Tue, 22 Apr 2025 18:06:34 +0300
Message-ID: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12724357798888715420
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeeujefhvdeugeektdekjeeiheejkedvheefieeghedufeeuveehheejheegnecuffhomhgrihhnpehtrhgvnhgthhgsohhothdrohhrghdpshhouhhrtggvfhhorhhgvgdrnhgvthdpkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=uzs5IQT4ILJYVMtN0crPFxKj1iOMog379n6QJoG3VMQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334422; v=1;
 b=Bb2cVwRP//zqfngfp2av6kNtV12d6qR0cORBsUJF5R2cyVZ1aMxE8V510WMfrIoRWRuQpkB5
 NzXn/SR9DJWpbexnpk9XI+agDrQhbr5xNZ+NRexQC50TW+/Ifo65MgMqPKALBPkdTiuWHLNDmQl
 MPE8QmzbNIpfvuqM3KxoH2AtRKxPVGOCaHF5eH7UJz5O25uRqhrrQDOwJRv3Cd+iIMq4skhed+L
 8y+2l7f9gVCOD2allC1Ss6jPJAsahv8vcULyNMjlv7Xpa7DDE/GB/XEe8mSUQ3bT2bo3CAqgtK6
 B29tqF4TPsN9wCWhrqtHW5h8AWsncTvAyqpdtCGvMlioA==

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

-----

[TrenchBoot]: https://trenchboot.org/
[tboot]: https://sourceforge.net/p/tboot/wiki/Home/
[Parallelize AP bring-up]: https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/

-----

Kacper Stojek (2):
  x86/boot: add MLE header and new entry point
  xen/arch/x86: reserve TXT memory

Krystian Hebel (7):
  x86/include/asm/intel_txt.h: constants and accessors for TXT registers
    and heap
  x86/boot/slaunch_early: early TXT checks and boot data retrieval
  x86/intel_txt.c: restore boot MTRRs
  lib/sha1.c: add file
  x86/tpm.c: code for early hashing and extending PCRs (for TPM1.2)
  x86/boot: choose AP stack based on APIC ID
  x86/smpboot.c: TXT AP bringup

Michał Żygowski (2):
  x86/hvm: Check for VMX in SMX when slaunch active
  x86/cpu: report SMX, TXT and SKINIT capabilities

Sergii Dmytruk (10):
  include/xen/slr_table.h: Secure Launch Resource Table definitions
  x86/boot/slaunch_early: implement early initialization
  x86/mtrr: expose functions for pausing caching
  lib/sha256.c: add file
  x86/tpm.c: support extending PCRs of TPM2.0
  x86/tpm.c: implement event log for TPM2.0
  arch/x86: process DRTM policy
  x86/boot: find MBI and SLRT on AMD
  arch/x86: support slaunch with AMD SKINIT
  x86/slaunch: support EFI boot

 .gitignore                                  |    1 +
 docs/hypervisor-guide/x86/how-xen-boots.rst |    7 +
 xen/arch/x86/Makefile                       |   12 +-
 xen/arch/x86/boot/Makefile                  |   10 +-
 xen/arch/x86/boot/head.S                    |  250 +++++
 xen/arch/x86/boot/slaunch_early.c           |  105 ++
 xen/arch/x86/boot/trampoline.S              |   40 +-
 xen/arch/x86/boot/x86_64.S                  |   42 +-
 xen/arch/x86/cpu/amd.c                      |   14 +
 xen/arch/x86/cpu/cpu.h                      |    1 +
 xen/arch/x86/cpu/hygon.c                    |    1 +
 xen/arch/x86/cpu/intel.c                    |   44 +
 xen/arch/x86/cpu/mtrr/generic.c             |   51 +-
 xen/arch/x86/e820.c                         |    5 +
 xen/arch/x86/efi/efi-boot.h                 |   90 +-
 xen/arch/x86/efi/fixmlehdr.c                |  122 +++
 xen/arch/x86/hvm/vmx/vmcs.c                 |    3 +-
 xen/arch/x86/include/asm/apicdef.h          |    4 +
 xen/arch/x86/include/asm/intel_txt.h        |  452 ++++++++
 xen/arch/x86/include/asm/mm.h               |    3 +
 xen/arch/x86/include/asm/msr-index.h        |    3 +
 xen/arch/x86/include/asm/mtrr.h             |    8 +
 xen/arch/x86/include/asm/processor.h        |    1 +
 xen/arch/x86/include/asm/slaunch.h          |   91 ++
 xen/arch/x86/include/asm/tpm.h              |   19 +
 xen/arch/x86/intel_txt.c                    |  177 ++++
 xen/arch/x86/setup.c                        |   32 +-
 xen/arch/x86/slaunch.c                      |  464 ++++++++
 xen/arch/x86/smpboot.c                      |   57 +
 xen/arch/x86/tboot.c                        |   20 +-
 xen/arch/x86/tpm.c                          | 1057 +++++++++++++++++++
 xen/common/efi/boot.c                       |    4 +
 xen/common/efi/runtime.c                    |    1 +
 xen/include/xen/efi.h                       |    1 +
 xen/include/xen/sha1.h                      |   12 +
 xen/include/xen/sha256.h                    |   12 +
 xen/include/xen/slr_table.h                 |  274 +++++
 xen/lib/Makefile                            |    2 +
 xen/lib/sha1.c                              |  240 +++++
 xen/lib/sha256.c                            |  238 +++++
 40 files changed, 3914 insertions(+), 56 deletions(-)
 create mode 100644 xen/arch/x86/boot/slaunch_early.c
 create mode 100644 xen/arch/x86/efi/fixmlehdr.c
 create mode 100644 xen/arch/x86/include/asm/intel_txt.h
 create mode 100644 xen/arch/x86/include/asm/slaunch.h
 create mode 100644 xen/arch/x86/include/asm/tpm.h
 create mode 100644 xen/arch/x86/intel_txt.c
 create mode 100644 xen/arch/x86/slaunch.c
 create mode 100644 xen/arch/x86/tpm.c
 create mode 100644 xen/include/xen/sha1.h
 create mode 100644 xen/include/xen/sha256.h
 create mode 100644 xen/include/xen/slr_table.h
 create mode 100644 xen/lib/sha1.c
 create mode 100644 xen/lib/sha256.c


base-commit: df68a4cb7ed9418f0c5af56a717714b5280737e4
prerequisite-patch-id: 1c3014908bc6e1a5cab8de609270efdb1c412335
prerequisite-patch-id: 850544a1f9639283f2269ea75b630400dd1976aa
prerequisite-patch-id: 69e042a46f8ac0e3f85853e77082caf250719a8d
prerequisite-patch-id: d6c6d27bbe8ff2f5d96852a6eed72a4c99b61356
-- 
2.49.0


