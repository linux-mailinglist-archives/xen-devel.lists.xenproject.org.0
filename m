Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F6940EBD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767446.1178095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjs3-00005n-R8; Tue, 30 Jul 2024 10:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767446.1178095; Tue, 30 Jul 2024 10:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYjs3-0008Uh-OG; Tue, 30 Jul 2024 10:14:19 +0000
Received: by outflank-mailman (input) for mailman id 767446;
 Tue, 30 Jul 2024 10:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2k0=O6=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sYjs2-0008Ub-4u
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:14:18 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77ef2168-4e5c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:14:15 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 21D6330E01;
 Tue, 30 Jul 2024 06:14:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 168D030E00;
 Tue, 30 Jul 2024 06:14:12 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id C478330DFF;
 Tue, 30 Jul 2024 06:14:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 77ef2168-4e5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Q5CKzpcB3ylJYdwmh/nNZvLT1TNBn8T1qLP88pH2KXc=; b=EfeY
	OSU/PVIjFqaWHeL/G/AhAQwcXSZSPgp5e6aMomnAun4a3S+sEoo73L8a9up7W6JX
	EtK9u+szZ3N0pILY/qQiVNjhQ8coONZ2GgvUvl/05W4oiGOSKIR6bTlWgCRP1ABt
	KPH9P8qFg7zqDbnqbHlt3boOezAACdPYsnBsVfI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v5 00/13] x86: make CPU virtualisation support configurable
Date: Tue, 30 Jul 2024 13:14:08 +0300
Message-Id: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 76C3212C-4E5C-11EF-9D73-34EEED2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This is another series to provide a means to render the CPU virtualisatio=
n
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT=
-x
drivers are built.
The series adds three new Kconfig controls, ALT2PM, AMD_SVM and INTEL_VMX=
,
that can be used to switch to a finer-grained configuration for a given
platform, and reduce dead code.

The code separation is done using the new config guards.

Major changes in this series, comparing to v4, are renaming of config opt=
ions
from SVM to AMD_SVM and from VMX to INTEL_VMX -- the way they were in ini=
tial
RFC series. Also patch for ioreq has been remade once again trying to mak=
e it
clearer and simplify a bit.
More specific changes are provided in per-patch changelog.=20

v4 series here:
https://lore.kernel.org/xen-devel/cover.1720501197.git.Sergiy_Kibrik@epam=
.com/

 -Sergiy


Sergiy Kibrik (6):
  x86/monitor: guard altp2m usage
  x86: introduce CONFIG_ALTP2M Kconfig option
  x86: introduce using_{svm,vmx}() helpers
  x86/vmx: guard access to cpu_has_vmx_* in common code
  x86/vpmu: guard calls to vmx/svm functions
  x86/vmx: replace CONFIG_HVM with CONFIG_INTEL_VMX in vmx.h

Xenia Ragiadakou (7):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/p2m: guard EPT functions with using_vmx() check
  x86/traps: guard vmx specific functions with usinc_vmx() check
  x86/PV: guard svm specific functions with usinc_svm() check
  x86/oprofile: guard svm specific symbols with CONFIG_AMD_SVM
  ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX
    configurations
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/Kconfig                             |  3 +++
 xen/arch/arm/ioreq.c                    |  6 -----
 xen/arch/x86/Kconfig                    | 32 ++++++++++++++++++++++++
 xen/arch/x86/cpu/vpmu_amd.c             | 11 +++++----
 xen/arch/x86/cpu/vpmu_intel.c           | 32 +++++++++++++-----------
 xen/arch/x86/domain.c                   |  8 +++---
 xen/arch/x86/hvm/Makefile               |  4 +--
 xen/arch/x86/hvm/hvm.c                  |  4 +--
 xen/arch/x86/hvm/ioreq.c                |  2 ++
 xen/arch/x86/hvm/monitor.c              |  4 ++-
 xen/arch/x86/hvm/nestedhvm.c            |  4 +--
 xen/arch/x86/include/asm/altp2m.h       |  5 +++-
 xen/arch/x86/include/asm/hvm/hvm.h      | 12 ++++++++-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 33 ++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 +-
 xen/arch/x86/include/asm/p2m.h          | 23 +++++++++++++----
 xen/arch/x86/mm/Makefile                |  5 ++--
 xen/arch/x86/mm/hap/Makefile            |  2 +-
 xen/arch/x86/mm/p2m-basic.c             |  4 +--
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 xen/arch/x86/traps.c                    |  8 ++----
 xen/include/xen/ioreq.h                 | 10 ++++++++
 22 files changed, 147 insertions(+), 69 deletions(-)

--=20
2.25.1


