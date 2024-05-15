Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DD8C6333
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 10:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722014.1125789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ASU-0005fL-LX; Wed, 15 May 2024 08:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722014.1125789; Wed, 15 May 2024 08:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ASU-0005dh-Ik; Wed, 15 May 2024 08:57:58 +0000
Received: by outflank-mailman (input) for mailman id 722014;
 Wed, 15 May 2024 08:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AST-0005db-GE
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 08:57:57 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f5f391-1299-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 10:57:54 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 7A0CB1BA5F;
 Wed, 15 May 2024 04:57:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id 710C81BA5E;
 Wed, 15 May 2024 04:57:52 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id D29581BA5D;
 Wed, 15 May 2024 04:57:48 -0400 (EDT)
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
X-Inumbo-ID: 36f5f391-1299-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=u9TIevOX68nz9tHM5jazPM24+VdTJI7U4Q4KeYnwHgE=; b=QJsq
	68m/oPobnWqYvsVuZlcxWgBCEm5FFb03ZbpkqS0hHGeST5ySNHcudypgJkBfAIgv
	tNhZWuhELqlVf5nZ14FyIJpuOfjssADdLUQPyCRB5frTrjZ3KRk63EIenrqm1GOL
	iF8WVdZg0Xae4mr/eMQO71j/a+qnVwNKOEjJ+Ec=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [XEN PATCH v2 00/15] x86: make cpu virtualization support configurable
Date: Wed, 15 May 2024 11:57:45 +0300
Message-Id: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 3450D298-1299-11EF-AAB3-F515D2CDFF5E-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

This is yet another attempt to provide a means to render the cpu virtuali=
zation
technology support in Xen configurable.
Currently, irrespectively of the target platform, both AMD-V and Intel VT=
-x
drivers are built.
The series adds three new Kconfig controls, ALT2PM, SVM and VMX, that can=
 be
used to switch to a finer-grained configuration for a given platform, and
reduce dead code.

The code separation is done using the new config guards.

In this series, comparing to v1, new option CONFIG_ALT2PM introduced, tha=
t
can enable/disable altp2m support independently on VMX.
More specific changes are provided in per-patch changelog.=20

v1 series here:
https://lore.kernel.org/xen-devel/20240416061845.3467822-1-Sergiy_Kibrik@=
epam.com/

 -Sergiy

Sergiy Kibrik (11):
  x86/monitor: guard altp2m usage
  x86/p2m: guard altp2m routines
  x86/p2m: move altp2m-related code to separate file
  x86: introduce CONFIG_ALTP2M Kconfig option
  x86/p2m: guard altp2m code with CONFIG_ALTP2M option
  x86: guard cpu_has_{svm/vmx} macros with CONFIG_{SVM/VMX}
  x86/vpmu: guard vmx/svm calls with cpu_has_{vmx,svm}
  x86/traps: clean up superfluous #idef-s
  x86/domain: clean up superfluous #idef-s
  x86/vmx: guard access to cpu_has_vmx_* in common code
  iommu/vt-d: guard vmx_pi_hooks_* calls with cpu_has_vmx

Xenia Ragiadakou (4):
  x86: introduce AMD-V and Intel VT-x Kconfig options
  x86/oprofile: guard svm specific symbols with CONFIG_SVM
  x86/ioreq: guard VIO_realmode_completion with CONFIG_VMX
  x86/hvm: make AMD-V and Intel VT-x support configurable

 xen/arch/x86/Kconfig                    |  25 +
 xen/arch/x86/cpu/vpmu_amd.c             |   8 +-
 xen/arch/x86/cpu/vpmu_intel.c           |  20 +-
 xen/arch/x86/domain.c                   |   4 +-
 xen/arch/x86/hvm/Makefile               |   4 +-
 xen/arch/x86/hvm/emulate.c              |   2 +
 xen/arch/x86/hvm/hvm.c                  |   2 +-
 xen/arch/x86/hvm/ioreq.c                |   2 +
 xen/arch/x86/hvm/monitor.c              |   4 +-
 xen/arch/x86/hvm/viridian/viridian.c    |   4 +-
 xen/arch/x86/include/asm/altp2m.h       |   5 +-
 xen/arch/x86/include/asm/cpufeature.h   |   6 +-
 xen/arch/x86/include/asm/hvm/hvm.h      |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |   4 +-
 xen/arch/x86/include/asm/p2m.h          |  17 +-
 xen/arch/x86/mm/Makefile                |   5 +-
 xen/arch/x86/mm/altp2m.c                | 630 +++++++++++++++++++++++
 xen/arch/x86/mm/hap/Makefile            |   2 +-
 xen/arch/x86/mm/p2m-basic.c             |  19 +-
 xen/arch/x86/mm/p2m-ept.c               |   2 +-
 xen/arch/x86/mm/p2m.c                   | 632 +-----------------------
 xen/arch/x86/mm/p2m.h                   |   3 +
 xen/arch/x86/oprofile/op_model_athlon.c |   2 +-
 xen/arch/x86/traps.c                    |   9 +-
 xen/drivers/passthrough/vtd/iommu.c     |   6 +-
 xen/include/xen/sched.h                 |   2 +-
 26 files changed, 738 insertions(+), 683 deletions(-)

--=20
2.25.1


