Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058E92AF86
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 07:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755719.1164161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3dz-0005vw-QA; Tue, 09 Jul 2024 05:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755719.1164161; Tue, 09 Jul 2024 05:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3dz-0005uS-NI; Tue, 09 Jul 2024 05:44:03 +0000
Received: by outflank-mailman (input) for mailman id 755719;
 Tue, 09 Jul 2024 05:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3dy-0005ed-30
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 05:44:02 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5c7911-3db6-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 07:44:01 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id DB2E530602;
 Tue,  9 Jul 2024 01:43:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C470530601;
 Tue,  9 Jul 2024 01:43:58 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 07FDB30600;
 Tue,  9 Jul 2024 01:43:58 -0400 (EDT)
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
X-Inumbo-ID: 3d5c7911-3db6-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=dL0se5z3PCq5M4JgJaI5D4sL6cE0ozPVy/JvPgbvIV0=; b=SXZ4
	v4b+g1g9EytmmwCncVMH5TlL0ZMnLLPgmlv3wpWt2PaWpc7IuGThGGyqriMNB8fM
	wljjNxKkDILyBOEOG4zPgoHLkIMm6MlNZVx1QORPHV4CnEdM4b0lCMPphKQm3COj
	RMG9Yd7mwO6VjiatVs+Q3L/+KFKU4fM5FwTq82E=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v4 00/14] x86: make CPU virtualisation support configurable
Date: Tue,  9 Jul 2024 08:43:55 +0300
Message-Id: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3C85C32C-3DB6-11EF-826A-5B6DE52EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This is another series to provide a means to render the CPU virtualisatio=
n
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT=
-x
drivers are built.
The series adds three new Kconfig controls, ALT2PM, SVM and VMX, that can=
 be
used to switch to a finer-grained configuration for a given platform, and
reduce dead code.

The code separation is done using the new config guards.

Major changes in this series, comparing to v3, are turning of macros usin=
g_vmx &
using_svm into static inline functions, and also defining & using
arch_vcpu_ioreq_completion() only in VMX-enabled build.
More specific changes are provided in per-patch changelog.=20

v3 series here:
https://lore.kernel.org/xen-devel/cover.1717410850.git.Sergiy_Kibrik@epam=
.com/

The question about config option naming still remains. I haven't changed =
names
in this series yet, but a verdict from maintainers is very welcomed.=20
My thought is probably to leave names as they're now, CONFIG_{SVM,VMX} th=
at is.
Because now only CONFIG_INTEL_VMX/CONFIG_AMD_SVM occupy much more space,
but also add some unneeded redundancy to names -- I mean Intel is the onl=
y
vendor to provide VT-d as for now, and that does not seem to change anyti=
me
soon, does it? (and the same for AMD/AMD-V)

 -Sergiy

Sergiy Kibrik (7):
  x86/altp2m: add static inline stub for altp2m_vcpu_idx()
  x86/p2m: guard altp2m routines
  x86: introduce CONFIG_ALTP2M Kconfig option
  x86: introduce using_{svm,vmx}() helpers
  x86/vmx: guard access to cpu_has_vmx_* in common code
  x86/vpmu: guard calls to vmx/svm functions
  x86/vmx: replace CONFIG_HVM with CONFIG_VMX in vmx.h

Xenia Ragiadakou (7):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/p2m: guard EPT functions with using_vmx() check
  x86/traps: guard vmx specific functions with usinc_vmx() check
  x86/PV: guard svm specific functions with usinc_svm() check
  x86/oprofile: guard svm specific symbols with CONFIG_SVM
  x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/arch/arm/ioreq.c                    |  6 -----
 xen/arch/x86/Kconfig                    | 31 +++++++++++++++++++++++++
 xen/arch/x86/cpu/vpmu_amd.c             |  9 +++----
 xen/arch/x86/cpu/vpmu_intel.c           | 16 +++++++------
 xen/arch/x86/domain.c                   |  8 +++----
 xen/arch/x86/hvm/Makefile               |  4 ++--
 xen/arch/x86/hvm/hvm.c                  |  6 ++---
 xen/arch/x86/hvm/ioreq.c                |  2 ++
 xen/arch/x86/hvm/nestedhvm.c            |  4 ++--
 xen/arch/x86/hvm/viridian/viridian.c    |  4 ++--
 xen/arch/x86/include/asm/altp2m.h       | 11 +++++++--
 xen/arch/x86/include/asm/hvm/hvm.h      | 17 +++++++++++++-
 xen/arch/x86/include/asm/hvm/ioreq.h    |  5 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 17 +++++++++-----
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 +-
 xen/arch/x86/include/asm/p2m.h          | 23 ++++++++++++++----
 xen/arch/x86/mm/Makefile                |  5 ++--
 xen/arch/x86/mm/hap/Makefile            |  2 +-
 xen/arch/x86/mm/p2m-basic.c             | 13 ++++++-----
 xen/arch/x86/mm/p2m-ept.c               |  2 +-
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 xen/arch/x86/traps.c                    | 13 ++++-------
 xen/common/ioreq.c                      |  5 +++-
 xen/include/xen/ioreq.h                 |  1 -
 24 files changed, 141 insertions(+), 67 deletions(-)

--=20
2.25.1


